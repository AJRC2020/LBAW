SET search_path TO "lbaw-2195";

-----------------------------------------
-- Drop old schema
-----------------------------------------

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS project CASCADE;
DROP TABLE IF EXISTS member CASCADE;
DROP TABLE IF EXISTS invite CASCADE;
DROP TABLE IF EXISTS forum_comments CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS task CASCADE;
DROP TABLE IF EXISTS completed CASCADE;
DROP TABLE IF EXISTS nonCompleted CASCADE;
DROP TABLE IF EXISTS doing CASCADE;
DROP TABLE IF EXISTS task_comments CASCADE;
DROP TABLE IF EXISTS notifications CASCADE;

DROP TYPE IF EXISTS topic;

DROP FUNCTION IF EXISTS part_of_project;
DROP FUNCTION IF EXISTS check_completed_tasks;
DROP FUNCTION IF EXISTS check_if_creator;

-----------------------------------------
-- Types
-----------------------------------------

CREATE TYPE topic AS ENUM ('Invited', 'Created task', 'Removed task', 'Removed project');

-----------------------------------------
-- Tables
-----------------------------------------

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    photo TEXT DEFAULT 'defaultPhotos/User.png',
    password TEXT NOT NULL
);

CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    code TEXT UNIQUE,
    course TEXT,
    year INTEGER,
    name TEXT UNIQUE
);

CREATE TABLE project (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    endDate DATE,
    details TEXT NOT NULL,
    photo TEXT DEFAULT 'defaultPhotos/Project.png',
    archived BOOLEAN,
    grade INTEGER,
    idSubject INTEGER REFERENCES subjects (id)
);

CREATE TABLE member (
    idUser INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    idProject INTEGER REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    favourite BOOLEAN,
    creator BOOLEAN,
    coordinator BOOLEAN,
	CONSTRAINT member_pk PRIMARY KEY (idUser, idProject)
);

CREATE TABLE invite (
    id SERIAL PRIMARY KEY,
    idInviter INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    idInvitee INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    idProject INTEGER REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    invDate DATE,
	CONSTRAINT invite_pk PRIMARY KEY (idInviter, idInvitee, idProject)
);

CREATE TABLE forum_comments (
    id SERIAL PRIMARY KEY,
    idUser INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    idProject INTEGER REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE,
    content TEXT,
    date DATE
);

CREATE TABLE task (
    id SERIAL PRIMARY KEY,
    idProject INTEGER REFERENCES project(id),
    name TEXT NOT NULL,
    dateStarted DATE NOT NULL,
    details TEXT NOT NULL
);

CREATE TABLE completed (
    id INTEGER PRIMARY KEY REFERENCES task(id) ON DELETE CASCADE ON UPDATE CASCADE,
    dateEnded DATE
);

CREATE TABLE nonCompleted (
    id INTEGER PRIMARY KEY REFERENCES task(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE doing (
    idUser INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    idTask INTEGER REFERENCES task(id) ON DELETE CASCADE ON UPDATE CASCADE,
    creator BOOLEAN,
	CONSTRAINT doing_pk PRIMARY KEY (idUser, idTask)
);

CREATE TABLE task_comments (
    id SERIAL PRIMARY KEY,
    idUser INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    idTask INTEGER REFERENCES task(id) ON DELETE CASCADE ON UPDATE CASCADE,
    date DATE,
    content TEXT
);

CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    content TEXT NOT NULL,
    idUser INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);


-----------------------------------------
-- INDEXES
-----------------------------------------

CREATE INDEX user_tasks ON doing USING hash (idUser);

CREATE INDEX user_invites ON invite USING hash (idInvitee);

CREATE INDEX project_comments ON forum_comments USING hash (idProject);

CREATE INDEX user_projects ON member USING hash (idUser);

CREATE INDEX comments_task ON task_comments USING hash (idTask);

CREATE INDEX user_notifications ON notifications USING hash (idUser);

-----------------------------------------
-- FTS INDEXES
-----------------------------------------

-- Add column to project to store computed ts_vectors.
ALTER TABLE project
ADD COLUMN tsvectors TSVECTOR;

-- Create a function to automatically update ts_vectors.
CREATE FUNCTION project_search_update() RETURNS TRIGGER AS $$
BEGIN
 IF TG_OP = 'INSERT' THEN
        NEW.tsvectors = (
         setweight(to_tsvector('english', NEW.name), 'A') ||
         setweight(to_tsvector('english', (
             SELECT name FROM subject WHERE id=NEW.idSubject
         )), 'B') ||
         setweight(to_tsvector('english', NEW.grade), 'c')
        );
 END IF;
 IF TG_OP = 'UPDATE' THEN
         IF (NEW.name <> OLD.name OR NEW.grade <> OLD.grade) THEN
           NEW.tsvectors = (
             setweight(to_tsvector('english', NEW.title), 'A') ||
             setweight(to_tsvector('english', (
             SELECT name FROM subject WHERE id=NEW.idSubject
         )), 'B') ||
             setweight(to_tsvector('english', NEW.grade), 'C')
           );
         END IF;
 END IF;
 RETURN NEW;
END $$
LANGUAGE plpgsql;

-- Create a trigger before insert or update on project.
CREATE TRIGGER project_search_update
 BEFORE INSERT OR UPDATE ON project
 FOR EACH ROW
 EXECUTE PROCEDURE project_search_update();


-- Finally, create a GIN index for ts_vectors.
CREATE INDEX search_idx ON project USING GIN (tsvectors);


-----------------------------------------
-- TRIGGERS 3
-----------------------------------------

--An administrator account can't create or be part of a project. (BR02)

CREATE FUNCTION part_of_project() RETURNS TRIGGER AS
$BODY$
BEGIN
        IF EXISTS (SELECT * FROM member WHERE NEW.idUser = idUser) THEN
           RAISE EXCEPTION 'An administrator account can not create or be part of a project.';
        END IF;
        RETURN NEW;
END
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER create_project
        BEFORE INSERT OR UPDATE ON member
        FOR EACH ROW
        EXECUTE PROCEDURE part_of_project();

-- A Task can't be NonCompleted and Completed at the same time. (BR07)

CREATE FUNCTION check_completed_tasks() RETURNS TRIGGER AS
$BODY$
BEGIN
        IF EXISTS (SELECT * FROM nonCompleted WHERE NEW.id = id) THEN
           RAISE EXCEPTION 'A Task can not be NonCompleted and Completed at the same time.';
        END IF;
        RETURN NEW;
END
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER check_tasks_validity
        BEFORE INSERT OR UPDATE ON completed
        FOR EACH ROW
        EXECUTE PROCEDURE check_completed_tasks();

-- Only a coordinator can change a projects's details and endDate. (BR06)

CREATE FUNCTION check_if_creator() RETURNS TRIGGER AS
$BODY$
BEGIN
        IF EXISTS (SELECT * FROM member WHERE NEW.id = id AND creator = FALSE) THEN
           RAISE EXCEPTION 'Only a coordinator can change a projects details and endDate.';
        END IF;
        RETURN NEW;
END
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER check_creator_project
        BEFORE INSERT OR UPDATE ON project
        FOR EACH ROW
        EXECUTE PROCEDURE check_if_creator();

-----------------------------------------
-- TRANSACTIONS
-----------------------------------------


-----------------------------------------
-- end
-----------------------------------------

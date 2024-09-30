create schema if not exists lbaw2195;

-----------------------------------------
-- Drop old schema
-----------------------------------------

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS projects CASCADE;
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
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    photo TEXT DEFAULT 'defaultPhotos/User.png',
    password TEXT NOT NULL
);

CREATE TABLE subjects (
    id INTEGER PRIMARY KEY,
    code TEXT UNIQUE,
    course TEXT,
    year INTEGER,
    name TEXT UNIQUE
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    end_date DATE,
    details TEXT NOT NULL,
    photo TEXT DEFAULT 'defaultPhotos/Project.png',
    archived BOOLEAN,
    grade INTEGER,
    subject_id INTEGER REFERENCES subjects (id)
);

CREATE TABLE member (
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    project_id INTEGER REFERENCES projects(id) ON DELETE CASCADE ON UPDATE CASCADE,
    favourite BOOLEAN,
    creator BOOLEAN,
    coordinator BOOLEAN,
	CONSTRAINT member_pk PRIMARY KEY (user_id, project_id)
);

CREATE TABLE invite (
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


--users (30)
INSERT INTO users (id,name,email,photo,password) VALUES (1,'Diogo','diogo@gmail.com','userPhotos/user1.png' ,'eqlkdkuab');
INSERT INTO users (id,name,email,photo,password) VALUES (2,'Alberto','alberto@gmail.com','userPhotos/user2.png' ,'fwsdfvvr');
INSERT INTO users (id,name,email,photo,password) VALUES (3,'Diana','diana@gmail.com','userPhotos/user3.png' ,'v452v542vre');
INSERT INTO users (id,name,email,photo,password) VALUES (4,'Tomas','tomas@gmail.com','userPhotos/user4.png' ,'vefv34f3');
INSERT INTO users (id,name,email,photo,password) VALUES (5,'Andre','andre@gmail.com','userPhotos/user5.png' ,'cvedvv--r.ava');
INSERT INTO users (id,name,email,photo,password) VALUES (6,'Helder','helder@gmail.com','userPhotos/user6.png' ,'rv4frfvs');
INSERT INTO users (id,name,email,photo,password) VALUES (7,'Joao','joao@gmail.com','userPhotos/user7.png' ,'qr4f4ffcxa');
INSERT INTO users (id,name,email,photo,password) VALUES (8,'Augusto','augusto@gmail.com','userPhotos/user8.png' ,'3rgh65jergt');
INSERT INTO users (id,name,email,photo,password) VALUES (9,'Francisco','francisco@gmail.com','userPhotos/user9.png' ,'jylkht90u');
INSERT INTO users (id,name,email,photo,password) VALUES (10,'Ines','ines@gmail.com','userPhotos/user10.png' ,'fwkj48dhojo');
INSERT INTO users (id,name,email,photo,password) VALUES (11,'Olga','olga@gmail.com','userPhotos/user11.png' ,',yik,tt78k');
INSERT INTO users (id,name,email,photo,password) VALUES (12,'Francis','francis@gmail.com','userPhotos/user12.png' ,'43f41g5vl.');
INSERT INTO users (id,name,email,photo,password) VALUES (13,'Sandra','sandra@gmail.com','userPhotos/user13.png' ,'324fqerwasvdva');
INSERT INTO users (id,name,email,photo,password) VALUES (14,'Julio','julio@gmail.com','userPhotos/user14.png' ,'fwkj48dhojo');
INSERT INTO users (id,name,email,photo,password) VALUES (15,'Pedro','pedroribeiro@gmail.com','userPhotos/user15.png' ,'5gtergh63365');
INSERT INTO users (id,name,email,photo,password) VALUES (16,'Ana','anasa@gmail.com','userPhotos/user16.png' ,'fewf35423g');
INSERT INTO users (id,name,email,photo,password) VALUES (17,'Antonio','antonio@gmail.com','userPhotos/user17.png' ,'erwferw');
INSERT INTO users (id,name,email,photo,password) VALUES (18,'Pedro','pedro@gmail.com','userPhotos/user18.png' ,'5gtergh63365');
INSERT INTO users (id,name,email,photo,password) VALUES (19,'Ana','ana@gmail.com','userPhotos/user19.png' ,'fewf35423g');
INSERT INTO users (id,name,email,photo,password) VALUES (20,'Antonio Jesuita','antoniojesuita@gmail.com','userPhotos/user20.png' ,'erwferw');
INSERT INTO users (id,name,email,photo,password) VALUES (21,'Antonio Andre','antonioandre@gmail.com','userPhotos/user21.png' ,'erwferw');
INSERT INTO users (id,name,email,photo,password) VALUES (22,'Antonio Gomes','antoniogomes@gmail.com','userPhotos/user22.png' ,'erwferw');
INSERT INTO users (id,name,email,photo,password) VALUES (23,'Antonio Ricardo','antonioricardo@gmail.com','userPhotos/user23.png' ,'erwferw');
INSERT INTO users (id,name,email,photo,password) VALUES (24,'Antonio Geraldes','antoniogeraldes@gmail.com','userPhotos/user24.png' ,'erwferw');
INSERT INTO users (id,name,email,photo,password) VALUES (25,'Antonio Francisco','antoniofrancisco@gmail.com','userPhotos/user25.png' ,'erwferw');
INSERT INTO users (id,name,email,photo,password) VALUES (26,'Andre Geraldes','andregeraldes@gmail.com','userPhotos/user26.png' ,'rgwrwvdfsb');
INSERT INTO users (id,name,email,photo,password) VALUES (27,'Andre Gomes','andregomes@gmail.com','userPhotos/user27.png' ,'rbtbdsfbt4');
INSERT INTO users (id,name,email,photo,password) VALUES (28,'Ricardo Antunes','ricardoantunes@gmail.com','userPhotos/user28.png' ,'erw65765erw');
INSERT INTO users (id,name,email,photo,password) VALUES (29,'Gil Ferreira','gilferreira@gmail.com','userPhotos/user29.png' ,'c54gf5434');
INSERT INTO users (id,name,email,photo,password) VALUES (30,'Gil','gil@gmail.com','userPhotos/user30.png' ,'erwf5t5sderw');

--subjects (5)
INSERT INTO subjects (id,code,course,year,name) VALUES (1,'L.EIC013','Engenharia Informatica','2021', 'Laboratorio de Bases de Dados');
INSERT INTO subjects (id,code,course,year,name) VALUES (2,'L.EIC011','Engenharia Informatica','2021', 'Redes de Computadores');
INSERT INTO subjects (id,code,course,year,name) VALUES (3,'L.EIC012','Engenharia Informatica','2021', 'Laboratorio de Testes');
INSERT INTO subjects (id,code,course,year,name) VALUES (4,'L.EIC020','Engenharia Informatica','2021', 'Fisica');
INSERT INTO subjects (id,code,course,year,name) VALUES (5,'L.EIC077','Engenharia Informatica','2021', 'Fundamentos de Segurança Informatica');


--projects (5)
INSERT INTO projects (name,end_date,details,photo,archived,grade,subject_id) VALUES ('LBAW','2022-10-5','The project for subject LBAW consists in designing a web application.', 'projectPhotos/project1.png' ,FALSE, 17, 1);
INSERT INTO projects (name,end_date,details,photo,archived,grade,subject_id) VALUES ('RCOM','2022-10-6','The project for subject RCOM consists in designing a data protocol.', 'projectPhotos/project2.png' ,FALSE, 10, 2);
INSERT INTO projects (name,end_date,details,photo,archived,grade,subject_id) VALUES ('LDTS','2022-10-9','The project for subject LDTS consists in designing a web application.', 'projectPhotos/project3.png' ,FALSE, 17, 3);
INSERT INTO projects (name,end_date,details,photo,archived,grade,subject_id) VALUES ('F','2022-10-10','Physics project is making reports about experiences that happen in classses.', 'projectPhotos/project4.png' ,FALSE, 10, 4);
INSERT INTO projects (name,end_date,details,photo,archived,grade,subject_id) VALUES ('FSI','2022-10-15','Project consists in making reports called logbooks for classes', 'projectPhotos/project5.png' ,FALSE, 17, 5);

--members (33)
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (1,1,TRUE,TRUE,TRUE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (1,2,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (1,3,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (2,1,TRUE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (2,5,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (3,1,TRUE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (4,1,TRUE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (5,1,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (5,4,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (6,1,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (7,1,TRUE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (8,2,TRUE,TRUE,TRUE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (9,2,TRUE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (10,2,TRUE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (11,2,TRUE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (12,2,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (13,2,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (14,2,TRUE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (15,3,TRUE,TRUE,TRUE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (16,3,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (17,3,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (18,4,TRUE,TRUE,TRUE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (19,4,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (20,4,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (20,1,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (20,2,TRUE,FALSE,TRUE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (21,5,TRUE,TRUE,TRUE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (22,5,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (23,5,FALSE,FALSE,TRUE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (24,5,FALSE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (25,5,FALSE,FALSE,TRUE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (25,1,TRUE,FALSE,FALSE);
INSERT INTO member (user_id,project_id,favourite,creator,coordinator) VALUES (25,2,FALSE,FALSE,FALSE);
-----------------------------------------
-- end
-----------------------------------------

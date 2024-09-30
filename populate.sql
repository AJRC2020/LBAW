-----------------------------------------
-- Populate the database
-----------------------------------------

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
INSERT INTO project (id,name,endDate,details,photo,archived,grade,idSubject) VALUES (1,'LBAW','2022-10-5','The project for subject LBAW consists in designing a web application.', 'projectPhotos/project1.png' ,FALSE, 17, 1);
INSERT INTO project (id,name,endDate,details,photo,archived,grade,idSubject) VALUES (2,'RCOM','2022-10-6','The project for subject RCOM consists in designing a data protocol.', 'projectPhotos/project2.png' ,FALSE, 10, 2);
INSERT INTO project (id,name,endDate,details,photo,archived,grade,idSubject) VALUES (3,'LDTS','2022-10-9','The project for subject LDTS consists in designing a web application.', 'projectPhotos/project3.png' ,FALSE, 17, 3);
INSERT INTO project (id,name,endDate,details,photo,archived,grade,idSubject) VALUES (4,'F','2022-10-10','Physics project is making reports about experiences that happen in classses.', 'projectPhotos/project4.png' ,FALSE, 10, 4);
INSERT INTO project (id,name,endDate,details,photo,archived,grade,idSubject) VALUES (5,'FSI','2022-10-15','Project consists in making reports called logbooks for classes', 'projectPhotos/project5.png' ,FALSE, 17, 5);

--members (33)
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (1,1,TRUE,TRUE,TRUE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (1,2,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (1,3,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (2,1,TRUE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (2,5,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (3,1,TRUE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (4,1,TRUE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (5,1,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (5,4,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (6,1,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (7,1,TRUE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (8,2,TRUE,TRUE,TRUE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (9,2,TRUE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (10,2,TRUE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (11,2,TRUE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (12,2,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (13,2,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (14,2,TRUE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (15,3,TRUE,TRUE,TRUE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (16,3,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (17,3,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (18,4,TRUE,TRUE,TRUE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (19,4,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (20,4,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (20,1,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (20,2,TRUE,FALSE,TRUE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (21,5,TRUE,TRUE,TRUE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (22,5,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (23,5,FALSE,FALSE,TRUE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (24,5,FALSE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (25,5,FALSE,FALSE,TRUE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (25,1,TRUE,FALSE,FALSE);
INSERT INTO member (idUser,idProject,favourite,creator,coordinator) VALUES (25,2,FALSE,FALSE,FALSE);

--invites (25)
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (1,2,1,'2021-9-2');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (1,3,1,'2021-9-2');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (1,4,1,'2021-9-2');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (1,5,1,'2021-9-2');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (1,6,1,'2021-9-2');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (1,7,1,'2021-9-2');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (8,9,1,'2021-9-5');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (8,10,1,'2021-9-5');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (8,11,1,'2021-9-5');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (8,12,1,'2021-9-5');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (8,13,1,'2021-9-5');
INSERT INTO invites (idInviter,idInvitee,idProject,invDate) VALUES (8,14,1,'2021-9-5');

--forum comments (54)
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (1,1,1,'Temos que trabalhar melhor','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (2,2,1,'É o que estamos a fazer','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (3,3,1,'Mias rapido acho','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (4,4,1,'Temos mesmo','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (5,1,1,'É o que acho tambem','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (6,2,1,'Vamos organizar o trabalho','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (7,3,1,'O que acham que deve mudar','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (8,1,1,'Tudo','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (9,2,1,'Pronto entao como fazemos','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (10,4,1,'Vamos melhorar a organização','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (11,1,1,'Pois é o melhor','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (12,2,1,'Bora entao','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (13,3,1,'Quando podem reunir?','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (14,1,1,'Amanha','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (15,4,1,'Amanha exato','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (16,1,1,'Bora entao','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (17,2,1,'Combinado','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (18,3,1,'Vamos','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (19,15,3,'Temos que trabalhar melhor','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (20,16,3,'É o que estamos a fazer','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (21,17,3,'Mias rapido acho','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (22,15,3,'Temos mesmo','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (23,16,3,'É o que acho tambem','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (24,15,3,'Vamos organizar o trabalho','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (25,16,3,'O que acham que deve mudar','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (26,17,3,'Tudo','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (27,15,3,'Pronto entao como fazemos','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (28,16,3,'Vamos melhorar a organização','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (29,17,3,'Pois é o melhor','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (30,15,3,'Bora entao','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (31,16,3,'Quando podem reunir?','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (32,17,3,'Amanha','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (33,15,3,'Amanha exato','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (34,16,3,'Bora entao','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (35,17,3,'Combinado','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (36,15,3,'Vamos','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (37,10,2,'Temos que trabalhar melhor','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (38,11,2,'É o que estamos a fazer','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (39,12,2,'Mias rapido acho','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (40,13,2,'Temos mesmo','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (41,10,2,'É o que acho tambem','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (42,11,2,'Vamos organizar o trabalho','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (43,12,2,'O que acham que deve mudar','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (44,11,2,'Tudo','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (45,12,2,'Pronto entao como fazemos','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (46,11,2,'Vamos melhorar a organização','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (47,10,2,'Pois é o melhor','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (48,13,2,'Bora entao','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (49,11,2,'Quando podem reunir?','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (50,10,2,'Amanha','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (51,11,2,'Amanha exato','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (52,12,2,'Bora entao','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (53,13,2,'Combinado','2021-9-5');
INSERT INTO forum_comments (id,idUser,idProject,content,date) VALUES (54,12,2,'Vamos','2021-9-5');

--tasks (13)
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (1,1,'Terminar artefacto 1','2021-11-9','Terminar todas as tarefas do artefacto 1');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (2,1,'Terminar artefacto 2','2021-11-9','Terminar todas as tarefas do artefacto 2');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (3,1,'Terminar artefacto 3','2021-11-9','Terminar todas as tarefas do artefacto 3');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (4,1,'Terminar artefacto 4','2021-11-9','Terminar todas as tarefas do artefacto 4');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (5,1,'Terminar artefacto 5','2021-11-9','Terminar todas as tarefas do artefacto 5');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (6,2,'Fazer folha 1','2021-11-9','Fazer todos os exercicios');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (7,2,'Fazer folha 2','2021-11-9','Fazer todos os exercicios');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (8,2,'Fazer folha 3','2021-11-9','Fazer todos os exercicios');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (9,2,'Fazer folha 4','2021-11-9','Fazer todos os exercicios');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (10,2,'Fazer folha 5','2021-11-9','Fazer todos os exercicios');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (11,3,'Terminar codigo HTML','2021-11-9','Desenvolver codigo com componentes');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (12,3,'Teminar codigo javascrit','2021-11-9','Implementar todas as funções dadas na API');
INSERT INTO task (id,idProject,name,dateStarted,details) VALUES (13,4,'Organizar projeto','2021-11-9','Organizar projeto por tarefas');

--completed (10)
INSERT INTO completed (id,dateEnded) VALUES (1,'2021-12-1');
INSERT INTO completed (id,dateEnded) VALUES (2,'2021-12-4');
INSERT INTO completed (id,dateEnded) VALUES (3,'2021-12-6');
INSERT INTO completed (id,dateEnded) VALUES (4,'2021-12-8');
INSERT INTO completed (id,dateEnded) VALUES (5,'2021-12-1');
INSERT INTO completed (id,dateEnded) VALUES (6,'2021-12-4');
INSERT INTO completed (id,dateEnded) VALUES (7,'2021-12-6');
INSERT INTO completed (id,dateEnded) VALUES (8,'2021-12-8');
INSERT INTO completed (id,dateEnded) VALUES (9,'2021-12-20');
INSERT INTO completed (id,dateEnded) VALUES (10,'2021-12-28');

--non completed (3)
INSERT INTO nonCompleted (id) VALUES (11);
INSERT INTO nonCompleted (id) VALUES (12);
INSERT INTO nonCompleted (id) VALUES (13);

--doing (3)
INSERT INTO doing (idUser,idTask,creator) VALUES (17, 12, FALSE);
INSERT INTO doing (idUser,idTask,creator) VALUES (16, 11, TRUE);
INSERT INTO doing (idUser,idTask,creator) VALUES (18, 13, FALSE);

--task comments (35)
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (1,1, 1, '2021-11-21', 'Vou terminar esta semana');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (2,1, 1, '2021-11-21', 'Atrasou');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (3,1, 1, '2021-11-21', 'Quase a terminar');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (4,1, 1, '2021-11-21', 'Acabo ainda hoje');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (5,1, 1, '2021-11-21', 'Terminado');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (6,2, 2, '2021-11-21', 'Terminar amanha');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (7,2, 2, '2021-11-21', 'Atrasou');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (8,2, 2, '2021-11-21', 'Quase a terminar');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (9,2, 2, '2021-11-21', 'Acabo ainda hoje');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (10,2, 2, '2021-11-21', 'Terminado finalmente');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (11,3, 3, '2021-11-21', 'Vou terminar esta semana ou na proxima');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (12,3, 3, '2021-11-21', 'Atrasou');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (13,3, 3, '2021-11-21', 'Quase a terminar');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (14,3, 3, '2021-11-21', 'Acabo ainda hoje ou amanha de manha');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (15,3, 3, '2021-11-21', 'Terminado');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (16,4, 4, '2021-11-21', 'Vou terminar esta semana, acho que sim');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (17,4, 4, '2021-11-21', 'Atrasou mais uma vez');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (18,4, 4, '2021-11-21', 'Quase a terminar');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (19,4, 4, '2021-11-21', 'Acabo ainda hoje acho');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (20,4, 4, '2021-11-21', 'Terminado');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (21,7, 5, '2021-11-21', 'Vou terminar esta semana');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (22,7, 5, '2021-11-21', 'Atrasou mais uma vez');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (23,7, 5, '2021-11-21', 'Quase a terminar');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (24,7, 5, '2021-11-21', 'Acabo ainda hoje talvez');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (25,7, 5, '2021-11-21', 'Terminado');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (26,5, 6, '2021-11-21', 'Vou terminar esta semana');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (27,5, 6, '2021-11-21', 'Atrasou');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (28,5, 6, '2021-11-21', 'Quase a terminar');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (29,5, 6, '2021-11-21', 'Acabo ainda hoje');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (30,5, 6, '2021-11-21', 'Terminado');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (31,8, 10, '2021-11-21', 'Vou terminar esta semana');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (32,8, 10, '2021-11-21', 'Atrasou');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (33,8, 10, '2021-11-21', 'Quase a terminar, mesmo quase');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (34,8, 10, '2021-11-21', 'Acabo ainda hoje penso eu');
INSERT INTO task_comments (id,idUser,idTask,date,content) VALUES (35,8, 10, '2021-11-21', 'Terminado duma vez');

--notifications (7)
INSERT INTO notifications (id,date,content,idUser) VALUES (1,'2021-10-21', 'Invited', 2);
INSERT INTO notifications (id,date,content,idUser) VALUES (2,'2021-10-22', 'Invited', 3);
INSERT INTO notifications (id,date,content,idUser) VALUES (3,'2021-10-25', 'Invited', 4);
INSERT INTO notifications (id,date,content,idUser) VALUES (4,'2021-11-2', 'Created task', 10);
INSERT INTO notifications (id,date,content,idUser) VALUES (5,'2021-11-7', 'Created task', 14);
INSERT INTO notifications (id,date,content,idUser) VALUES (6,'2021-11-10', 'Created task', 12);
INSERT INTO notifications (id,date,content,idUser) VALUES (7,'2021-11-15', 'Created task', 20);

CREATE DATABASE movieweb;
USE movieweb;
 
create table Movies (
id int NOT NULL PRIMARY KEY AUTO_INCREMENT ,
title varchar(60),
description varchar(100),
featured_image varchar(40),
length varchar(20),
release_date varchar(40)
);

CREATE TABLE Category (
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
type varchar(20),
value varchar(20)
);

CREATE TABLE Relationship(
id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
category_id int,
movie_id int,
FOREIGN KEY(category_id) REFERENCES CATEGORY(id),
FOREIGN KEY(movie_id) REFERENCES MOVIES(id)
);

INSERT INTO Movies(title,description,length,release_date) values('Jurassic World','A movie about dinosaurs','90 minutes','Jun 14 2015');
INSERT INTO Movies(title,description,length,release_date) values('Kick','Salman Khan movie','120 minutes ','Apr 23 2014');
INSERT INTO Movies(title,description,length,release_date) values('Daangal','Aamir Khan movie','90 minutes','Jan 02 2018');
INSERT INTO Movies(title,description,length,release_date) values('Pink','Thriller','80 minutes','Dec 14 2012');
INSERT INTO Movies(title,description,length,release_date) values('Rockstar','Ranbir Kapoor movie','128 minutes','Aug 16 2010');
INSERT INTO Movies(title,description,length,release_date) values('Raazi','Alia Bhat movie','130 minutes','May 11 2018');
INSERT INTO Movies(title,description,length,release_date) values('Uri','Surgical strike','140 minutes','Jan 20 2019');
INSERT INTO Movies(title,description,length,release_date) values('Ramleela','Starring Deepika','160 minutes','Jun 30 2015');
INSERT INTO Movies(title,description,length,release_date) values('Zero','Shah rukh Khan Movie','110 minutes','Aug 17 2018');
INSERT INTO Movies(title,description,length,release_date) values('Raid','True story','140 minutes','Mar 27 2018');
INSERT INTO Movies(title,description,length,release_date) values('Force','Crime drama','150 minutes','Sep 14 2017');
INSERT INTO Movies(title,description,length,release_date) values('Bodyguard','A Salman Khan movie','90 minutes','Jun 14 2008');
 
INSERT INTO Category(type,value) VALUES('Language','English');
INSERT INTO Category(type,value) VALUES('Genre','Action');
INSERT INTO Category(type,value) VALUES('Language','Hindi');
INSERT INTO Category(type,value) VALUES('Genre','Comedy');

INSERT INTO Relationship (category_id,movie_id) VALUES(1,1);
INSERT INTO Relationship (category_id,movie_id) VALUES(2,1);
INSERT INTO Relationship (category_id,movie_id) VALUES(3,2);
INSERT INTO Relationship (category_id,movie_id) VALUES(4,2);

INSERT INTO Relationship (category_id,movie_id) VALUES(1,3);
INSERT INTO Relationship (category_id,movie_id) VALUES(2,3);
INSERT INTO Relationship (category_id,movie_id) VALUES(3,4);
INSERT INTO Relationship (category_id,movie_id) VALUES(4,4);

INSERT INTO Relationship (category_id,movie_id) VALUES(1,5);
INSERT INTO Relationship (category_id,movie_id) VALUES(2,5);
INSERT INTO Relationship (category_id,movie_id) VALUES(3,6);
INSERT INTO Relationship (category_id,movie_id) VALUES(4,6);

INSERT INTO Relationship (category_id,movie_id) VALUES(1,7);
INSERT INTO Relationship (category_id,movie_id) VALUES(2,7);
INSERT INTO Relationship (category_id,movie_id) VALUES(3,8);
INSERT INTO Relationship (category_id,movie_id) VALUES(4,8);

INSERT INTO Relationship (category_id,movie_id) VALUES(1,9);
INSERT INTO Relationship (category_id,movie_id) VALUES(2,9);
INSERT INTO Relationship (category_id,movie_id) VALUES(3,10);
INSERT INTO Relationship (category_id,movie_id) VALUES(4,10);

INSERT INTO Relationship (category_id,movie_id) VALUES(1,11);
INSERT INTO Relationship (category_id,movie_id) VALUES(2,11);
INSERT INTO Relationship (category_id,movie_id) VALUES(3,12);
INSERT INTO Relationship (category_id,movie_id) VALUES(4,12); 
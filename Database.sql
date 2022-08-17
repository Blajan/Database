-- CREATION OF THE DATABASE AND ITS USE
CREATE DATABASE portofolio;
USE portofolio;
-- CREATION OF THE DATABASE AND ITS USE


-- CREATION OF THE TABLE channelYT
CREATE TABLE channelYT(
id INT PRIMARY KEY AUTO_INCREMENT,
namee VARCHAR (30),
subscribe INT
);
-- CREATION OF THE TABLE channelYT
INSERT INTO channelYT(namee, subscribe) VALUES('Databasecourse', 8000); 
INSERT INTO channelYT(namee, subscribe) VALUES('DatabaseIn3H', 7000); 
INSERT INTO channelYT(namee, subscribe) VALUES('LearnDatabase', 12000); 
INSERT INTO channelYT(namee, subscribe) VALUES('StartInDatabase', 4000); 
SELECT * FROM channelYT;

-- CREATION OF THE TABLE userYT
CREATE TABLE userYT(
id INT PRIMARY KEY AUTO_INCREMENT,
namee VARCHAR (20),
age INT,
channel_followed INT,
FOREIGN KEY (channel_followed) REFERENCES channelYT(id)
);
-- CREATION OF THE TABLE userYT
INSERT INTO userYT(namee, age, channel_followed) VALUES('Mike', 24, 3); 

-- CREATING THE TRIGGER
DELIMITER $$
CREATE TRIGGER triggerInsert
AFTER INSERT ON userYT
FOR EACH ROW
BEGIN
	UPDATE channelYT SET subscribe = subscribe +1 WHERE new.channel_followed = id;
END$$
DELIMITER ;
-- CREATING THE TRIGGER

-- CREATING THE TRIGGER
DELIMITER $$
CREATE TRIGGER triggerDelete
AFTER DELETE ON userYT
FOR EACH ROW
BEGIN
	UPDATE channelYT SET subscribe = subscribe -1 WHERE (old.channel_followed = id);
END$$
DELIMITER ;
-- CREATING THE TRIGGER


-- LIKE
CREATE TABLE person(
id INT PRIMARY KEY AUTO_INCREMENT,
name_person VARCHAR(20),
birth_date VARCHAR(10),
salary INT
);
INSERT INTO person(name_person, birth_date, salary) VALUES ('Mike', '12-04-1997', 1700);
INSERT INTO person(name_person, birth_date, salary) VALUES ('Steve', '23-09-2001', 1900);
INSERT INTO person(name_person, birth_date, salary) VALUES ('Jeff', '30-06-1998', 2200);
INSERT INTO person(name_person, birth_date, salary) VALUES ('Tiny', '11-12-1994', 1500);
INSERT INTO person(name_person, birth_date, salary) VALUES ('Joe', '12-08-1998', 1900);
INSERT INTO person(name_person, birth_date, salary) VALUES ('Martin', '19-07-1989', 1700);
INSERT INTO person(name_person, birth_date, salary) VALUES ('Dave', '28-08-2000', 2300);
INSERT INTO person(name_person, birth_date, salary) VALUES ('David', '10-10-1998', 2000);
INSERT INTO person(name_person, birth_date, salary) VALUES ('Mark', '11-04-1990', 2400);
INSERT INTO person(name_person, birth_date, salary) VALUES ('Justin', '16-01-1987', 1600);

SELECT name_person AS "Born in '98" FROM person WHERE birth_date LIKE '%1998'
-- LIKE

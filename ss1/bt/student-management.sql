CREATE DATABASE if not exists student_management;
use student_management;

CREATE TABLE Class (
id int primary key auto_increment,
`name` varchar(50)
);

INSERT INTO Class(`name`)
VALUE ("kkk"),
		("jjj");

SELECT *
FROM Class;


CREATE TABLE Teacher (
id int primary key auto_increment,
`name` varchar(50),
age int,
country varchar(50)
);

INSERT INTO Teacher (`name`,age,country)
VALUE ("kkk",10,"Vietnam"),
		("ooo",20,"vietnam");

SELECT *
FROM Teacher;
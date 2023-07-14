CREATE DATABASE if not exists test;
use test;

CREATE TABLE teacher1  (
id int primary key auto_increment,
`name` varchar(50),
date_of_birth date,
address varchar(255)
);

INSERT INTO teacher1(`name`,date_of_birth,address)
VALUES ("khue","2003-03-03","đà nẵng");
INSERT INTO teacher1(`name`,date_of_birth,address)
VALUES ("ngan","2003-11-11","đà nẵng");
INSERT INTO teacher1(`name`,date_of_birth,address)
VALUES ("phuc","2003-01-01","đà nẵng"),
		("thuy","2003-01-01-","đà nẵng");
INSERT INTO teacher1(address)
VALUES ("da nang");

SELECT *
FROM teacher1;

UPDATE teacher1
SET address = "hello"
WHERE (`id` = 5);

DELETE FROM teacher1
WHERE (`id` =5);

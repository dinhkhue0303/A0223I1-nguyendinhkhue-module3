create database demo3;

use demo3;

create table student(
	id int primary key auto_increment,
    name varchar(50),
    gender bit,
    point double
);

insert into student(`name`,gender,`point`)
value("khue",1,5),
		("phuc",1,6),
        ("ngan",0,7);

delimiter //
create procedure delete_by_id(delete_id int)
begin 
delete from student
where id = delete_id;
end //
delimiter ;

call delete_by_id(1);


SELECT * FROM mysql.user;
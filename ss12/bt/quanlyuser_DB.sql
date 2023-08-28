create database quanlyuser;

use quanlyuser;

create table users (
	id int(3) not null auto_increment,
    name varchar(50) not null,
    email varchar(150) not null,
    country varchar(50),
    primary key (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('kkk','kkk@sd.ds','VN');

delimiter //
create procedure delete_by_id (delete_id int)
begin
	delete from users where id = delete_id;
end //
delimiter ;

call delete_by_id(1);

delimiter //
create procedure find_country(find_country varchar(50))
begin
	select * from users 
    where country like find_country;
end //
delimiter ;


call find_country('viet nam');
create database demo;
use demo;

create table products(
	id int auto_increment primary key,
    productCode int,
    productName varchar(50),
    productPrice double,
    productAmount int,
    productDescription varchar(50),
    productStatus varchar(50)
);

insert into products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
value (012,"keo",2,2,"dep","ok"),
		(013,"banh",2,10,"dep","ok"),
		(014,"tao",2,8,"dep","ok"),
		(015,"tra",2,5,"dep","ok"),
		(016,"caphe",7,2,"dep","ok");


create unique index index_productCode on products(productCode);

create index index_productName_productPrice on products(productName, productPrice);

drop index index_productName_productPrice on products;

explain select *
from products
where productCode = "012";

explain select *
from products
where productPrice = 7 and productName = "caphe";


create view view_product as
select productCode, productName,productPrice, productStatus
from products;

select *
from view_product;

update view_product
set productName = "hello"
where productCode = 12;

drop view view_product;

delimiter //
create procedure find_all ()
begin
	select *
    from products;
end //
delimiter ;

call find_all();

delimiter //
create procedure add_new_product()
begin
	insert into products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
    value (0,"keo",2,2,"dep","ok");
end //
delimiter ;

call add_new_product();

delimiter //
create procedure update_product(up_id int)
begin
	update products
    set productName = "kkk"
    where id = up_id;
end //
delimiter ;

call update_product(1);

delimiter //
create procedure delete_product(de_id int)
begin
	delete from products
    where id = de_id;
end //
delimiter ;

call delete_product(6);
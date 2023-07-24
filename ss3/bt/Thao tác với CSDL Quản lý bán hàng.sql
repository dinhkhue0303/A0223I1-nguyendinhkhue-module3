use quanlibanhang;
insert into customer(cName,cAge)
value ("Minh Quan",10),
		("Ngoc Oanh",20),
        ("Hong Ha",50);

insert into orderr(cID,oDate,oTTPrice)
value (1,"2006-03-21",null),
		(2,"2006-03-23",null),
        (1,"2006-03-16",null);
        
insert into product(pName,pPrice)
value ("may giat",3),
		("tu lanh",5),
        ("dieu hoa",7),
        ("quat",1),
        ("bep dien",2);
        
insert into orderdetail(oID,pID,odQuality)
value (1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
		(3,1,8),
		(2,5,4),
		(2,3,3);
-- 1
select *
from orderr;
-- 2
select c.cName,p.pName
from customer c
join orderr o
on o.cID = c.cID
join orderdetail od
on od.oID = o.oID
join product p
on od.pID = p.pID;
-- 3
select c.cName 
from customer c
left join orderr o on c.cID = o.cID
where o.oID is null;
-- 4
select o.cID, o.oDate, sum(od.odQuality * p.pPrice) as "giá tiền"
from orderr o
join orderdetail od
on o.oID = od.oID
join product p
on p.pID = od.pID
group by o.oID;


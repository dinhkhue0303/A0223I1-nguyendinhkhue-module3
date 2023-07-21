create database quanlibanhang;
use quanlibanhang;

create table customer(
cID int primary key auto_increment,
cName varchar(50),
cAge Date
);

create table orderr(
oID int primary key auto_increment,
cID int,
oDate datetime,
oTTPrice double,
foreign key(cID) references customer(cID)
);

create table product(
pID int primary key auto_increment,
pName varchar(50),
pPrice double
);

create table orderDetail(
oID int,
pID int,
odQuality varchar(50),
primary key(oID, pID),
foreign key(oID) references orderr(oID),
foreign key(pID) references product(pID)
);
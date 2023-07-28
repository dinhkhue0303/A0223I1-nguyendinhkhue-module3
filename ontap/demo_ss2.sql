CREATE DATABASE demo_ss2;
USE demo_ss2;

create table class(
  id int primary key auto_increment, 
  name varchar(20)
);

create table jame(
  `account` varchar(50) primary key, 
  `password` varchar(50)
);
create table student(
  id int primary key auto_increment, 
  name varchar(50), 
  birthday date, 
  gender boolean, 
  email varchar(50), 
  `point` float, 
  class_id int, 
  `account` varchar(50) unique, 
  foreign key (class_id) references class(id),
  foreign key (`account`) references jame(`account`)
);
create table instructor(
  id int primary key auto_increment, 
  name varchar(50), 
  birthday date, 
  salary double
);
create table instructor_class(
  class_id int, 
  instructor_id int, 
  start_time date, 
  end_time date, 
  primary key (class_id, instructor_id), 
  foreign key(class_id) references class(id), 
  foreign key(instructor_id) references instructor(id)
);

insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
 
-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select *
from student s
join class c
on s.class_id=c.id;

-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào 
-- và cả các bạn đã đăng ký nhưng chưa có lớp học.
select *
from student s
left join class c
on s.class_id=c.id;

-- 4. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
select *
from student s 
where s.name like '%hai' or s.name like '%huynh';


-- 4.1 Lấy thông tin của các học viên tên bắt đầu = 'h'.
select *
from student s
where substring_index(`name`," ",-1) like "h%";

-- 5. Lấy ra học viên có điểm lớn hơn 5.
select *
from student s
where s.`point` > 5;

-- 6. Lấy ra học viên có họ là “nguyen”
select *
from student s
where s.`name` like "nguyen%";

-- 7. Thông kế số lượng học sinh theo từng loại điểm.
select s.`point`, count(s.`name`) as soluong
from student s
group by s.`point`;

-- 8. Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
select s.`point`, count(s.`name`) as soluong
from student s
where s.`point` >5
group by s.`point`;

-- 9. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select point, count(*) as "số lượng học viên"
from student
where point > 5
group by point
having count(*) >= 2;

-- 10. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet.
select *
from student s
join class c
on s.class_id = c.id
where c.`name` = "c1121g1"
order by substring_index(s.`name`," ",-1) desc;

select *
from student s
join class c 
on s.class_id = c.id
join instructor_class ic 
on c.id = ic.class_id
join instructor i 
on ic.instructor_id = i.id
where c.name = "c1121g1";


-- 1
select c.`name`, count(*) as soluong
from student s
join class c
on s.class_id = c.id
group by c.`name`;

-- 2
select c.`name`, max(s.`point`) as max
from student s
join class c
on s.class_id = c.id
group by c.`name`;

-- 3
select c.`name`, avg(s.`point`) as trungbinh
from student s
join class c
on s.class_id = c.id
group by c.`name`;

-- 4
select name, birthday
from student
UNION ALL
select name,birthday
from instructor;

-- 5
select s.`name`, s.`point`
from student s
order by s.`point` desc
limit 3;

-- 6
select *
from student
where point = (
	select max(point)
    from student
);


-- ========== Index ==========
explain select * 
from student
where name = 'nguyen van a';


-- đánh index cho name
create index index_student_name
on student(name);


drop index index_student_name on student;

-- ========== View ==========
-- Tạo view chỉ chứa thông tin id và name của student
create view view_student(id, name) as
select id, name 
from student;

select * 
from view_student
order by id;

update view_student
set name = 'nguyen ngoc cu'
where id = 1;
​
-- ========== Stored Procedure ==========
-- Java: viết hàm void có tên là findByName, có tham số truyền vào là name
-- void findByName(String name) {
--   // Body
-- }
-- ========== IN ==========
delimiter //
create procedure find_by_name(in findname varchar(50)) -- mặc định tham số là in
begin
	select *
    from student s
    where s.name = findname;
end //
delimiter ;
call find_by_name('nguyen ngoc cu');
call find_by_name('le hai chung');
call find_by_name('le hai ');
​
-- ========== OUT ==========
delimiter //
create procedure find_by_name_out(in findname varchar(50), out count int) -- mặc định tham số là in
begin
    select count(*) into count 
    from student s 
    where s.name = findname;
end //
delimiter ;

call find_by_name_out('Nguyễn Văn A', @count);
select @count;
​
​
-- ========== INOUT ==========
delimiter //
create procedure find_by_name_inout(inout name varchar(50))
begin
	set name = (
    select count(*) 
    from student s
    where s.name = name
    );
end //
delimiter ;

set @abc = 'Nguyễn Văn A';
select @abc;
call find_by_name_inout(@abc);
select @abc;
​
​
-- 4 viêt 1 function xếp loại học lưc theo point
delimiter //
create function f_xep_loai(diem int)
returns varchar(50)
deterministic
begin
	declare loai varchar(50);
	if diem>=8 then
	set loai ='giỏi';
	elseif diem>=7 then
	set loai='khá';
	else
	set loai='trung bình';
	end if;
	return loai;
end //
delimiter ;
-- sử dụng function
select s.name, f_xep_loai(s.point) as xeploai
from student s;




-- 5 tạo trigger tự động tạo tài khoản jame trước khi thêm mới một học viên
 select * from student;
 select * from jame;
delimiter //
create trigger auto_create_jame
before insert on student
for each row
begin
	insert into jame(`account`,`password`) value( new.email, "123");
end //
delimiter ;


insert into student(`name`,birthday, email, gender,`point`, class_id,`account`) 
values ('i','1992-12-12','i@gmail.com',1,8,1,'i@gmail.com');

drop trigger auto_create_jame ;
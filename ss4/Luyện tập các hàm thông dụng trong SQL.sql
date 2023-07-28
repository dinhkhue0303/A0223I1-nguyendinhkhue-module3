use quanlysinhvien;

-- 1
select *
from subject
where credit in (
	select max(credit)
    from subject
);
-- 2
select *
from subject s
join mark m
on m.SubID = s.SubID
where m.Mark = (select max(Mark) from mark);
-- 3
select st.StudentId,st.StudentName,st.Address,st.Phone,st.Status,st.ClassId, avg(m.mark) as "diem trung binh"
from mark m
join student st
on st.StudentId = m.StudentId
group by m.StudentId
order by avg(m.Mark) desc;

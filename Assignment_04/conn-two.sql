Select * from marks;
update marks set marks=80 where STUDENT_ID = 100555 and COURSE_ID = 4455;
select * from marks;
rollback;
select * from marks;

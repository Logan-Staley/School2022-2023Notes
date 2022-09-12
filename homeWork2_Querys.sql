Problem 1:

Select stuid,fname,lanem,major,minor,advisor From Student Where Major = 'CSCI' OR Minor = 'CSCI';



Problem 2:
%Show information (id, Fname,lname and major) along with all students enrolled in 10003
Select s.stuid, s.fname, s.lname, d.deptname as Major, Enroll.grade AS 'Class 10003 grade'
From Student AS s inner join Department as d on (s.major = d.deptCode) inner join Enroll ON(s.stuid = Enroll.stuid)
where Enroll.classid = '10003';


Problem 3:
% Show the names of all students, majors, advisors names and advisor departments
%Only listing minors in ITEC
select s.stuid, CONCAT(s.fname, ' ' , s.lname) as student, d.deptname as Major, 
CONCAT(f.fname, " ", f.lname) as advisor, d.deptname as 'Advisor Department'
From Student AS s inner join Department as d on (s.major = d.deptCode) inner join Faculty as f ON (f.facid = s.advisor)
where s.minor = "ITEC"

%Problem4:
% show information studentsid, fname lname, major code(majoring in CSE) along with classid course title and grade)


SELECT s.stuid,s.fname,s.lname,s.major,e.classid, co.title as course, e.grade as grade
From (Course as co inner join Class as cl on (co.courseid = cl.courseid))
INNER JOIN (Student as s inner join Enroll as e on (s.stuid = e.stuid)) on (cl.classid = e.classid)
WHERE s.major = "CSCI" or s.major = "ITEC" or s.major = "CINF"
ORDER BY s.major DESC;


%Problem 5:
% Complete the same problem as problem 4 but add the instructors department

SELECT s.stuid,s.fname,s.lname,s.major,e.classid, f.deptcode as "Instructor Deptcode", co.title as course, e.grade as grade
From (Course as co inner join Class as cl on (co.courseid = cl.courseid))
INNER JOIN (Student as s inner join Enroll as e on (s.stuid = e.stuid)) on (cl.classid = e.classid) 
Inner Join Faculty as f on (f.facId = cl.facId) 
WHERE s.major = "CSCI" or s.major = "ITEC" or s.major = "CINF"
ORDER BY s.major DESC;
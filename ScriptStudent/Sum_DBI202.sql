select * from Assessments
select * from Courses
--select * from marks
--select * from Students
select * from enroll
select * from semesters
select * from Departments
-----Q2
select * from Assessments A
where A.[percent] = 0.02
----Q3
select s.id as Stu_ID, s.name as Stu_Name, D.Name as Stu_Dep from Students S
join Departments D on S	.department = D.Code
where D.Code = 'AI'
order by S.name ASC
----Q4
SELECT s.id as Stu_ID, s.name as Stu_Name
FROM Students s
JOIN enroll ON s.id = enroll.studentId
JOIN Courses ON enroll.courseId = Courses.id
WHERE Courses.credits > 3

----Q5
SELECT Students.name
FROM Students
JOIN enroll ON Students.id = enroll.studentId
JOIN Courses ON enroll.courseId = Courses.id
JOIN semesters ON enroll.semesterId = semesters.id
WHERE semesters.code = 'Sp2019' AND Courses.id IN (
    SELECT courseId FROM Assessments WHERE type = 'Final Exam'
)
----Q6
SELECT Departments.Code, Departments.Name, COUNT(*) AS EnrollmentCount
FROM Departments
JOIN Students ON Departments.Code = Students.department
GROUP BY Departments.Code, Departments.Name
----Q7
SELECT Students.name
FROM Students
where Students.id in (
select studentId from(
SELECT top 5 enroll.studentId, AVG(marks.mark) AS AverageMark
    FROM enroll
    JOIN marks ON enroll.enrollId = marks.enrollId
    GROUP BY enroll.studentId
	order by AverageMark DESC) as tb1)

UNION ALL

SELECT Students.name
FROM Students
where Students.id in (
select studentId from(
SELECT top 5 enroll.studentId, AVG(marks.mark) AS AverageMark
    FROM enroll
    JOIN marks ON enroll.enrollId = marks.enrollId
    GROUP BY enroll.studentId
	order by AverageMark ASC) as tb1)
----------------Q8
CREATE TRIGGER trg_AfterInsertDepartments
ON Departments
AFTER INSERT
AS
BEGIN
    SELECT i.Code as Dep_ID, i.Name as Dep_Name
    FROM INSERTED I
END;

insert into Departments values('MN','Morning')
-------------Q9
CREATE PROCEDURE CalculateAverageStudentMark
    @studentId INT
AS
BEGIN
    SELECT AVG(m.mark) AS AverageMark
    FROM dbo.marks m
    JOIN dbo.enroll e ON e.enrollId = m.enrollId
    WHERE e.studentId = @studentId;
END;

DECLARE @studentId INT = 1;

EXEC CalculateAverageStudentMark @studentId;
----Q10:
Delete from Departments
where Departments.Code = 
(select Departments.Code from Departments
full join Students on Departments.Code = Students.department
where Students.department is null)


	
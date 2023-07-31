create database WS1
use WS1

create table Class(
	classCode varchar(10) primary key, 
	headTeacher varchar(30),
	room varchar(30), 
	timeSlot varchar(30), 
	closeDate datetime
)

create table Student(
	rollNo varchar(10) primary key, 
	classCode varchar(10) foreign key references Class(classCode),
	fullName varchar(30), 
	male bit, birthDate datetime, 
	address varchar(30), 
	province char(2), 
	email varchar(30)
)

create table Subject(
	subjectCode varchar(10) primary key, 
	subjectName varchar(40),
	wTest bit, pTest bit, 
	WTest_per smallint, 
	pTest_per int
)

create table Mark(
	subjectCode varchar(10)foreign key references Subject(subjectCode),
	rollNo varchar(10) foreign key references Student(rollNo),
	primary key(rollNo, subjectCode), 
	wMark float(8), pMark float(8),
	mark float(8)
)

-- insert Class
insert into Class values ('E123', 'QuangMinh', 'class2, lab1', '7h30-12h30', getDate())
insert into Class values ('E125', 'NguyenMinh', 'class2, lab1', '7h30-12h30', getDate())
select * from Class

-- insert Subject
insert into Subject values ('C', 'Programming with C', '1', '1', '40', '60')
insert into Subject values ('SQL1', 'SQL1', '1', '0', '100', '0')
insert into Subject values ('SQL2', 'SQL2', '1', '1', '40', '60')
select * from Subject

-- insert Student
insert into Student(rollNo, classCode, fullName, male, birthDate, address, province) 
values ('A01', 'E123', 'Nguyen A', '1', '11/23/1982', '65 Hoang Hoa Tham', 'HN')
insert into Student(rollNo, classCode, fullName, male, birthDate, province, email)
values ('A02', 'E123', 'Nguyen B', '1', '10/21/1982', 'HN', 'trongfpt.edu.vn')
insert into Student(rollNo, classCode, fullName, male, birthDate, address, province, email)
values ('A03', 'E123', 'Nguyen C', '1', '10/19/1983', '6 Tran Phu', 'HN', 'dung@fpt.edu.vn')
insert into Student(rollNo, classCode, fullName, male, birthDate, address, province)
values ('A04', 'E123', 'Nguyen D', '1', '11/10/1984', '3 Kim Ma', 'HN')
insert into Student(rollNo, classCode, fullName, male, birthDate, province)
values ('A05', 'E123', 'Nguyen E', '1', '9/11/1983', 'HP')
insert into Student(rollNo, classCode, fullName, male, birthDate, address, province)
values ('A06', 'E123', 'Nguyen Y', '0', '10/26/1986', '65 Hoang Hoa Tham', 'HN')
select * from Student

--insert Mark
insert into Mark values ('C','A01', '20', '10', '14')
insert into Mark values ('SQL1','A01',  '20', '0', '8')
insert into Mark values ('SQL2','A01', '18', '12', '18.2')
insert into Mark values ('C','A02', '20', '10', '14')
insert into Mark values ('SQL1','A02',  '23', '15', '14')
insert into Mark values ('SQL2','A02',  '23', '10', '18')
select * from Mark
go

--BAI 1
-- 1. Đặt foreign key constraint cho cột ClassCode  trong bảng Student.
ALTER TABLE Student
ADD CONSTRAINT FK_Student_ClassCode
FOREIGN KEY (classCode)
REFERENCES Class(classCode);
go

-- 2. Hiển thị không lặp lại tên của sinh viên 
--có một phần địa chỉ email  là  “fpt.vn” hoặc "fpt.com.vn"
SELECT DISTINCT fullName
FROM Student
WHERE email LIKE '%fpt.vn' OR email LIKE '%fpt.com.vn';
select * from Student
go

-- 3. Hiển thị những lớp có ngày kết thúc là 23/7/2006 mà không có sinh viên nào.
SELECT * FROM Class
WHERE closeDate = '2006-07-23'
  AND classCode NOT IN (SELECT classCode FROM Student);
go

-- 4. Loại bỏ các bản ghi  
-- từ các bảng CLASS, STUDENT và MARK của các lớp có ngày kết thúc trước 1/1/2005. 
DELETE FROM Class
WHERE closeDate < '2005-01-01';

DELETE FROM Student
WHERE classCode IN (SELECT classCode FROM Class WHERE closeDate < '2005-01-01');

DELETE FROM Mark
WHERE rollNo IN (SELECT rollNo FROM Student 
WHERE classCode IN (SELECT classCode FROM Class WHERE closeDate < '2005-01-01'));
go

-- 5. Hiển thị ClassCode,  RollNo, FullName và tổng số  sinh viên với mỗi lớp. 
-- Hiển thị tổng số  sinh viên cho tất cả các lớp.
SELECT C.classCode, S.rollNo, S.fullName, COUNT(*) AS totalStudents
FROM Class C
JOIN Student S ON C.classCode = S.classCode
GROUP BY C.classCode, S.rollNo, S.fullName
WITH ROLLUP;
go

-- 6. Tạo  view  viewClass1 chứa danh sách lớp đối với các lớp có hơn  17  sinh viên.
CREATE VIEW viewClass1 AS
SELECT C.classCode, C.headTeacher, C.room, C.timeSlot, C.closeDate
FROM Class C
WHERE C.classCode IN (
    SELECT classCode
    FROM Student
    GROUP BY classCode
    HAVING COUNT(*) > 17
);
go

--7. Hiển thị  SubjectCode (mã môn học) , SubjectName (tên môn học) 
--và số sinh viên đã thi môn đó với số sinh viên tham gia đông nhất.
SELECT M.subjectCode, S.subjectName, COUNT(*) AS numParticipants
FROM Mark M
JOIN Subject S ON M.subjectCode = S.subjectCode
GROUP BY M.subjectCode, S.subjectName
HAVING COUNT(*) = (
    SELECT MAX(participants)
    FROM (
        SELECT subjectCode, COUNT(*) AS participants
        FROM Mark
        GROUP BY subjectCode
    ) AS counts
);
go

--BAI 2
--1.Viết câu lệnh SQL cho kết quả là số sinh viên đã có điểm thi môn  “CF”.
SELECT COUNT(DISTINCT rollNo) AS SoSinhVien
FROM Mark
WHERE subjectCode = 'CF';
go

--2.Viết câu lệnh SQL cho kết quả là danh sách 
--các môn học cùng với số sinh viên đã có điểm thi tương ứng của từng môn học, 
--theo thứ tự tăng dần của tên môn học. 
SELECT Subject.subjectName, COUNT(DISTINCT Mark.rollNo) AS SoSinhVien
FROM Subject
LEFT JOIN Mark ON Subject.subjectCode = Mark.subjectCode
GROUP BY Subject.subjectName
ORDER BY Subject.subjectName ASC;
go

--3.Viết câu lệnh SQL cho kết quả là danh sách các sinh viên quê ở  "HT" (Hà Tây), 
--cùng với tên các môn học đã thi nhưng không qua (< 10 điểm).
SELECT Student.fullName, Subject.subjectName
FROM Student
INNER JOIN Mark ON Student.rollNo = Mark.rollNo
INNER JOIN Subject ON Mark.subjectCode = Subject.subjectCode
WHERE Student.province = 'HT' AND Mark.mark < 10;
go

--4.Viết câu lệnh SQL cho kết quả là danh sách các lớp học, 
--cùng với tổng số sinh viên trong lớp.
SELECT Class.classCode, COUNT(Student.rollNo) AS TongSoSinhVien
FROM Class
LEFT JOIN Student ON Class.classCode = Student.classCode
GROUP BY Class.classCode;
go

--5. Viết câu lệnh SQL cho kết quả là danh sách các sinh viên, 
--cùng với tên đầy đủ các môn học mà sinh viên đó đã tham gia thi.


--6. Viết câu lệnh SQL cho kết quả là danh sách các sinh viên, 
--cùng với số lần đã tham gia thi thực hành 
--(mỗi record trong bảng MARK có điểm PMark là một lần thi).
SELECT Student.fullName, COUNT(Mark.pMark) AS SoLanThiTH
FROM Student
LEFT JOIN Mark ON Student.rollNo = Mark.rollNo
GROUP BY Student.fullName;
go

--7.Viết câu lệnh SQL cho kết quả là danh sách các tỉnh, 
--cùng với điểm trung bình tất cả các môn thi của sinh viên quê ở tỉnh đó.
--Sắp xếp theo thứ tự giảm dần của điểm trung bình.
SELECT Student.province, AVG(Mark.mark) AS DiemTrungBinh
FROM Student
INNER JOIN Mark ON Student.rollNo = Mark.rollNo
GROUP BY Student.province
ORDER BY DiemTrungBinh DESC;
go

--8. Viết  lệnh SQL cho kết quả là danh sách các 
--sinh viên có điểm trung bình tất cả các môn học >15. 
SELECT Student.rollNo, Student.fullName
FROM Student INNER JOIN (
    SELECT rollNo, AVG(mark) AS avgMark
    FROM Mark
    GROUP BY rollNo
    HAVING AVG(mark) > 15
) AS AvgMarks ON Student.rollNo = AvgMarks.rollNo;
go


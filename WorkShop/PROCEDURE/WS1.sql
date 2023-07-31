use WS1

-- câu 3:
CREATE PROC procStudentList
@pClassCode varchar(10) = '',
@pMark float = 0
AS
SELECT s.classCode, s.rollNo, s.fullName, m.subjectCode, m.mark
FROM Student s
INNER JOIN Mark m ON s.rollNo = m.rollNo
WHERE (s.classCode = @pClassCode OR @pClassCode = '') AND m.mark >= @pMark

EXEC procStudentList

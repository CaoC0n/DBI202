Students(
	StudentID int primary key,
	Name nvarchar(50),
	Address	nvarchar(200),
	Gender char(1)
)

Teachers(
	TeacherID int primary key,
	Name nvarchar(50),
	Address nvarchar(200),
	Gender char(1)
)

Classes(
	ClassID int primary key,
	GroupID char(6),
	courseID char(6),
	NoCredits int,
	Semester char(10),
	year int,
	TeacherID int foreign key(TeacherID) references Teachers(TeacherID) 
)

Attend(
	Date date,
	Slot int,
	Attend bit,
	StudentID int FOREIGN KEY(StudentID) references Students(StudentID),
	ClassID int FOREIGN KEY(ClassID) references Classes(ClassID),
	primary key(Date, Slot, StudentID, ClassID)
)

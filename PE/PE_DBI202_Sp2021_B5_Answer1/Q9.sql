Create Trigger Tr1 ON Employees
After Insert
As
Begin 
	Select i.EmployeeID, i.FirstName, i.LastName, i.DepartmentID, D.DepartmentName 
	FROM inserted i
	left join Department on i.DepartmentID = D.DepartmentID
End


Insert Into Employees(EmployeeID, FirstName, LastName, Email, JobID, DepartmentID) Values
(1005,'Alain','Boucher','alain.boucher@gmail.com','SH_CLERK',50),
(1006,'Muriel','Visani','muriel.visani@gmail.com','SA_REP', null)


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Phone]
      ,[HireDate]
      ,[JobID]
      ,[Salary]
      ,[Commission_pct]
      ,[ManagerID]
      ,[DepartmentID]
  FROM [PE_DBI202_Sp2021_B5].[dbo].[Employees] Where Salary > 9000;
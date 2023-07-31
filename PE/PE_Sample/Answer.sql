USE PE_Demo_S2019

--Q1
create table Students(
	StudentID int primary key,
	Name nvarchar(50),
	Address	nvarchar(200),
	Gender char(1)
)

create table Teachers(
	TeacherID int primary key,
	Name nvarchar(50),
	Address nvarchar(200),
	Gender char(1)
)

create table Classes(
	ClassID int primary key,
	GroupID char(6),
	courseID char(6),
	NoCredits int,
	Semester char(10),
	year int,
	TeacherID int foreign key(TeacherID) references Teachers(TeacherID) 
)

create table Attend(
	Date date,
	Slot int,
	Attend bit,
	StudentID int FOREIGN KEY(StudentID) references Students(StudentID),
	ClassID int FOREIGN KEY(ClassID) references Classes(ClassID),
	primary key(Date, Slot, StudentID, ClassID)
)

--Q2
select * from Customer
where Segment = 'Consumer' and City = 'Arlington'

--Q3
select a.ID, a.CustomerName, a.Segment, a.Country, a.City,
	   a.State, a.PostalCode, a.Region
from Customer a, Orders b
where a.ID = b.CustomerID and a.CustomerName like 'B%' 
and b.OrderDate between '2017-12-1' and '2017-12-31' 
order by a.Segment desc, a.CustomerName desc 

--Q4
select p.SubCategoryID, s.SubCategoryName, COUNT(p.SubCategoryID) as NumberOfProducts
from SubCategory s, Product p
where s.ID = p.SubCategoryID 
group by p.SubCategoryID, s.SubCategoryName
having COUNT(p.SubCategoryID) > 100
order by NumberOfProducts desc

--Q5
select o.ProductID, p.ProductName, o.Quantity
from OrderDetails o
join OrderDetails o1
on o.ProductID = o1.ProductID
join Product p on o.ProductID = p.ID
where p.ID = o.ProductID
group by o.ProductID, p.ProductName, o.Quantity
having o.Quantity = (select MAX(o2.Quantity) from OrderDetails o2)

--Q6
select o.CustomerID, c.CustomerName, count(*) as NumberOfOrders 
from Orders o, Customer c
where c.ID = o.CustomerID
group by o.CustomerID, c.CustomerName
having count(o.CustomerID) = (
	select top(1) count(*) as s 
	from Orders o, Customer c
	where c.ID = o.CustomerID
	group by o.CustomerID
	order by s DESC
)

--Q7
select * from 
(select top(5) * from Product p
order by p.UnitPrice desc) as s
union 
select * from (
select top(5) * from Product p
order by p.UnitPrice) as s1
order by UnitPrice desc

--Q8
create proc CountProduct 
@OrderID nvarchar(255), @NbProducts int output
as
begin
	set @NbProducts = (select COUNT(o.OrderID) from OrderDetails o
	where o.OrderID = @OrderID	
	group by o.OrderID)
end

--Q9
create trigger InsertProduct 
on Product after insert 
as
begin
	select i.ProductName, s.SubCategoryName 
	from inserted i, SubCategory s
	where i.SubCategoryID = s.ID
end

insert into Product(ProductName, UnitPrice, SubCategoryID)
values('Craft paper', 0.5, 3)

--Q10
insert into Category(CategoryName) values ('Sports')
select * from Category
insert into SubCategory(CategoryID, SubCategoryName)
values ((select c.ID from Category c where c.CategoryName = 'Sports'), 'Tennis'), 
((select c.ID from Category c where c.CategoryName = 'Sports'), 'Football')  


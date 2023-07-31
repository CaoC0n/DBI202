use Northwind

/*
	select 
	From
	[Where conditions]
*/

-- Select * from tableName: select all fields
select * from Products

-- Select fieldList From tableName: select some fields
select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder,
		totalOrder = UnitsInStock + UnitsOnOrder
from Products

select ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder,
		UnitsInStock + UnitsOnOrder totalOrder
from Products

-- alias

select ProductID as 'Ma SP', ProductName as 'Ten San Pham',
		UnitPrice, UnitsInStock, UnitsOnOrder,
		UnitsInStock + UnitsOnOrder totalOrder
from Products

-- duplicate
select *, ProductID as 'Ma SP', ProductName as 'Ten San Pham',
		UnitPrice, UnitsInStock, UnitsOnOrder,
		UnitsInStock + UnitsOnOrder totalOrder
from Products

-- select not from
select 1+1
select getdate()
-- select top: top n co nghia la n ban ghi dau tien cua ket qua, khong co nghia
-- la n ban ghi co gia tri top
select top 10 * from Products
---
select top 10 * from Products order by UnitPrice desc
---
select top 10 percent * from Products order by UnitPrice desc
-- select duplicate value or foreign key
select CategoryID from Products
-- 
select distinct CategoryID from Products
-- 
select * from Employees
-- 
select distinct TitleOfCourtesy from Employees
-- where
-- cai nay thi dao duoc vi tri UnitPrice <= 30 and UnitPrice >= 10
select * from Products
where UnitPrice >= 10 and UnitPrice <= 30
-- cai nay khong dao duoc vi tri between 30 and 10
select * from Products
where UnitPrice between 10 and 30
-- 
select * from Products
where ProductName like '%Cha%'
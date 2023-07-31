use Northwind
/*
select.......
from a join b
where.......
order by
group by
having

select---where---group by---having
*/

select * from Products
order by UnitsInStock desc, ProductName -- first, sort by UnitsInStock
-- if UnitsInStock equals, sort by ProductName
-- function
-- number of records
select COUNT(*) from Products
--
select COUNT(*) from Products 
where UnitsInStock = 0
--
select COUNT(ProductID) from Products 
where UnitsInStock = 0
-- 
select COUNT(ProductName) from Products 
where UnitsInStock = 0
---
select sum(UnitsInStock) from Products 
where UnitsInStock >= 10
-- 
select AVG(UnitPrice) from Products 
-- 
select MIN(UnitPrice) from Products
--
select MAX(UnitPrice) from Products
--
select a.ProductID, a.ProductName, a.UnitPrice, a.UnitsInStock, a.UnitsOnOrder,
	   b.SupplierID, b.CompanyName, 
	   c.CategoryID, c.CategoryName
from Products as a join Suppliers as b on a.SupplierID = b.SupplierID
				   join Categories as c on a.CategoryID = c.CategoryID
-- so luong san pham cua moi supplier la bao nhieu
select b.SupplierID, COUNT(a.UnitsInStock)
from Products as a join Suppliers as b on a.SupplierID = b.SupplierID
				   join Categories as c on a.CategoryID = c.CategoryID
group by b.SupplierID
-- name
select b.SupplierID, b.CompanyName, COUNT(a.UnitsInStock)
from Products as a join Suppliers as b on a.SupplierID = b.SupplierID
				   join Categories as c on a.CategoryID = c.CategoryID
group by b.SupplierID
-- khi dung group by, cac truong o group by moi duoc xuat hien o select
-- group by theo thu tu uu tien
select c.CategoryID, b.SupplierID, b.CompanyName, c.CategoryName,
COUNT(a.UnitsInStock) as NumberOfProductBySupplier
from Products as a join Suppliers as b on a.SupplierID = b.SupplierID
				   join Categories as c on a.CategoryID = c.CategoryID
group by b.SupplierID, b.CompanyName, c.CategoryID, c.CategoryName
order by c.CategoryID
--
select TitleOfCourtesy, count(*) from Employees
group by TitleOfCourtesy
--
 
use Northwind
select * from Products

/*
	update table set fiedldName = expression,.. where condition
*/

update Products set Discontinued = 0 
where UnitsOnOrder = 0

---
update Products set UnitPrice = UnitPrice * 1.05, 
					UnitsInStock = UnitsInStock + 10
where UnitsOnOrder > 30
select * from Products
go

/*
	compare operator: > < >= <= = <>
*/

update Products set UnitPrice = UnitPrice * 1.05,
					UnitsInStock = UnitsInStock + 10
where Discontinued <> 0
select * from Products
go

/*
	String operator: like
	%: thay the ho string(bat ky)
	ProductName like %abc% : ton tai abc trong ProductName
	ProductName like %abc: ProductName ket thuc la abc
	ProductName like abc%: ProductName bat dau la abc
	_ thay the cho 1 va chi 1 ki tu
	ProductName like 'abc_': ten bat dau la abc va sau do co duy nhat 1 ky tu
	[]: ton tai trong khoang hoac danh sach
	ProductName like '[agy]%': bat dau bang a hoac g hoac y
	ProductName like '[a-d]%': bat dau bang ky tu trong khoang tu a den d
	ProductName like '[a-dx]%': bat dau bang ky tu trong khoang tu a den d hoac x
	^ phu dinh cho khoang.
	ProductName like '[^a-d]%': khong bat dau bang ky tu trong khoang tu a den d
*/

select * from Products where ProductName like '%Cha%'
select * from Products where ProductName like 'Cha_'
select * from Products where ProductName like '[CAX]%'
go

/*
	logic operator: NOT AND OR
*/

select * from Products where ProductName NOT like 'Cha_'
select * from Products where ProductName like 'C%' AND UnitPrice >= 19
select * from Products where ProductName like 'C%' OR UnitPrice >= 19
go

-- constraints update 
update Products set UnitPrice = UnitPrice * 0.9, ProductID = 3000 
where ProductID = 1
go

select * from Territories
select * from EmployeeTerritories
-- update primary key
update Territories set TerritoryID = '11111' where TerritoryID = '06897'
-- foreign key constrains:
-- gia tri khoa ngoai cho duoc phep nhap gia tri khoa chinh da ton tai
-- neu gia tri khoa chinh da ton tai tren khoa ngoai thi khong duoc thay doi hoac xoa khoa chinh

select * from Territories 
where TerritoryID not in (select distinct TerritoryID from EmployeeTerritories)
go

update Territories set TerritoryID = '11111' where TerritoryID = '29202'

-- delete from table where condition
delete Territories where TerritoryID = '11111' 
--
delete Territories where TerritoryID = '01581'
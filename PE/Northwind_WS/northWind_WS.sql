--1 
select LOWER(CONCAT(LastName, ' ', FirstName)) AS [Full name], TitleOfCourtesy
from Employees

--2
select UPPER(CONCAT(LastName, ' ', FirstName)) AS [Full name]
from Employees

--3
select EmployeeID, LastName, FirstName, Title, City, Country
from Employees
where Country = 'USA'

--4
select CustomerID, CompanyName, ContactName, ContactTitle, Country
from Customers
where Country = 'UK'

--5
select CustomerID, CompanyName, address, City, Country
from Customers
where Country = 'Mexico'

--6 
select CustomerID, CompanyName, address, City, Country
from Customers
where Country = 'Sweden'

--7
select ProductID, ProductName, UnitPrice, UnitsInStock
from Products
where UnitsInStock between 5 and 10

--8
select ProductID, ProductName, UnitPrice, ReorderLevel, UnitsOnOrder
from Products
where UnitsOnOrder between 60 and 100

--9
select Employees.EmployeeID, Employees.LastName, Employees.FirstName, 
		YEAR(Orders.OrderDate) as year, COUNT(Orders.OrderID) as [total orders]
from Employees
join Orders ON Employees.EmployeeID = Orders.EmployeeID
where YEAR(Orders.OrderDate) = 1996
group by Employees.EmployeeID, Employees.LastName, Employees.FirstName, YEAR(Orders.OrderDate)

--10
select Employees.EmployeeID, Employees.LastName, Employees.FirstName, 
		Employees.City, Employees.Country, COUNT(Orders.OrderID) as [total orders]
from Employees
join Orders on Employees.EmployeeID = Orders.EmployeeID
where YEAR(Orders.OrderDate) = 1998
group by Employees.EmployeeID, Employees.LastName, Employees.FirstName, 
			Employees.City, Employees.Country

--11
select e.EmployeeID, e.LastName, e.FirstName, e.HireDate, 
		COUNT(o.OrderID) as [total orders]
from Employees e, Orders o
where (e.EmployeeID = o.EmployeeID) 
and o.OrderDate between '1998/1/1' and '1998/7/31' 
group by  e.EmployeeID, e.LastName, e.FirstName, e.HireDate

--12
select e.EmployeeID, e.LastName, e.FirstName, e.HireDate, 
		e.HomePhone, COUNT(o.OrderID) as [total orders]
from Employees e, Orders o
where (e.EmployeeID = o.EmployeeID) 
and o.OrderDate between '1997/1/1' and '1997/6/30' 
group by  e.EmployeeID, e.LastName, e.FirstName, e.HireDate, e.HomePhone

--13
select OrderID, DAY(OrderDate) OrderDay, 
		MONTH(OrderDate) OrderMonth, YEAR(OrderDate) OrderYear, Freight,
		case
    when Freight >= 100 then '10%'
    else '5%'
  end as Tax,
  case
    when Freight >= 100 then Freight * 1.1 
    else Freight * 1.05
  end as [Freight with tax]
from Orders
where OrderDate between '1996/8/1' and '1996/8/5'
--14
select CONCAT(LastName, ' ', FirstName) AS [Full name], TitleOfCourtesy,
  case
     when TitleOfCourtesy = 'Mr.' then 'Male'
     when TitleOfCourtesy = 'Ms.' or TitleOfCourtesy = 'Mrs.' then 'Female'
 end as sex
from Employees
where TitleOfCourtesy <> 'Dr.'
order by TitleOfCourtesy

--15
select CONCAT(LastName, ' ', FirstName) AS [Full name], TitleOfCourtesy,
	case
		when TitleOfCourtesy = 'Mr.' or TitleOfCourtesy = 'Dr.' then 'M'
		when TitleOfCourtesy = 'Ms.' or TitleOfCourtesy = 'Mrs.' then 'F'
	end as sex
from Employees
order by TitleOfCourtesy

--16
select [Full name], TitleOfCourtesy, sex
from (select CONCAT(LastName, ' ', FirstName) AS [Full name], TitleOfCourtesy,
        case
            when TitleOfCourtesy = 'Mr.' then 'Male'
            when TitleOfCourtesy = 'Ms.' OR TitleOfCourtesy = 'Mrs.' then 'Female'
            else 'Unknown'
        end as sex
    from Employees) as subquery
order by case
    when sex = 'Male' then 1
    when sex = 'Female' then 2
    else 3
end, TitleOfCourtesy;

--17
select [Full name], TitleOfCourtesy, sex
from (select CONCAT(LastName, ' ', FirstName) AS [Full name], TitleOfCourtesy,
        case
            when TitleOfCourtesy = 'Mr.' then '1'
            when TitleOfCourtesy = 'Ms.' OR TitleOfCourtesy = 'Mrs.' then '0'
            else '2'
        end as sex
    from Employees) as subquery
order by case
    when sex = '1' then 1
    when sex = '0' then 2
    else 3
end, TitleOfCourtesy;

--18
select [Full name], TitleOfCourtesy, sex
from (select CONCAT(LastName, ' ', FirstName) AS [Full name], TitleOfCourtesy,
        case
            when TitleOfCourtesy = 'Mr.' then 'M'
            when TitleOfCourtesy = 'Ms.' OR TitleOfCourtesy = 'Mrs.' then 'F'
            else 'N/A'
        end as sex
    from Employees) as subquery
order by case
    when sex = 'M' then 1
    when sex = 'F' then 2
    else 3
end, TitleOfCourtesy;

--21
select c.CategoryID, c.CategoryName, p.ProductID,
		p.ProductName, DAY(o.OrderDate) Day, 
		MONTH(o.OrderDate) Month, YEAR(o.OrderDate) Year,
		(od.Quantity * od.UnitPrice) as Revenue
from Categories c, Products p, [Order Details] od, Orders o
where (od.OrderID = o.OrderID) and (od.ProductID = p.ProductID) 
and (p.CategoryID = c.CategoryID) and o.OrderDate between '1996/7/1' and '1996/7/5'

--22
select e.EmployeeID, e.LastName, e.FirstName, o.OrderID, 
		o.OrderDate, o.RequiredDate, o.ShippedDate
from Employees e, Orders o
where (e.EmployeeID = o.EmployeeID) and o.ShippedDate - o.RequiredDate > 7
order by e.EmployeeID

--23 
SELECT CompanyName, Phone
FROM Customers
WHERE CompanyName LIKE 'W%'
UNION ALL
SELECT CONCAT(LastName, ' ', FirstName) AS [Full name], HomePhone
FROM Employees

--24
select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle
from Customers c, Orders o
where  (c.CustomerID = o.CustomerID) and o.OrderID = 10643 

--25
select p.ProductID, p.ProductName, SUM(od.Quantity) as [Total Ordered]
from Products p
join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName
having SUM(od.Quantity) >= 1200

--26 
select p.ProductID, p.ProductName, s.SupplierID, c.CategoryID,
		SUM(od.Quantity) as [Total Ordered]
from Products p, Suppliers s, [Order Details] od, Categories c
where (p.ProductID = od.ProductID) and (s.SupplierID = p.SupplierID)
		and (p.CategoryID = c.CategoryID)
group by  p.ProductID, p.ProductName, s.SupplierID, c.CategoryID
having SUM(od.Quantity) >= 1400
order by p.ProductID desc

--27
select c.CategoryID, c.CategoryName, COUNT(p.ProductID) as [total products]
from Categories c, Products p
where (c.CategoryID = p.CategoryID)
group by c.CategoryID, c.CategoryName
having COUNT(p.ProductID) = (
	select MAX(product_count)
    from (select COUNT(ProductID) as product_count
		from Products
        group by CategoryID) subquery);

--28
--29
select (select COUNT(*) from Customers) + (select COUNT(*) from Employees) as [Total records];

--30
select e.EmployeeID, e.LastName, e.FirstName, COUNT(o.OrderID) AS TotalOrders
from Employees e
join Orders o on e.EmployeeID = o.EmployeeID
group by e.EmployeeID, e.FirstName, e.LastName
having COUNT(o.OrderID) = (
    select MIN(order_count)
    from (
        select COUNT(OrderID) AS order_count
        from Orders
        group by EmployeeID
    ) as subquery);

--31
select e.EmployeeID, e.LastName, e.FirstName, COUNT(o.OrderID) AS TotalOrders
from Employees e
join Orders o on e.EmployeeID = o.EmployeeID
group by e.EmployeeID, e.FirstName, e.LastName
having COUNT(o.OrderID) = 
(
    select MAX(order_count) from 
	(
        select COUNT(OrderID) AS order_count
        from Orders
        group by EmployeeID
    ) as subquery
);

--32
select p.ProductID, p.ProductName, s.SupplierID, c.CategoryID,
		p.UnitsInStock
from Products p, Suppliers s, Categories c
where (p.SupplierID = s.SupplierID) and (p.CategoryID = c.CategoryID)
and p.UnitsInStock = (select MAX(UnitsInStock) from Products);

--33
select p.ProductID, p.ProductName, s.SupplierID, c.CategoryID, p.UnitsInStock
from Products p, Suppliers s, Categories c
where (p.SupplierID = s.SupplierID) and (p.CategoryID = c.CategoryID) 
and p.UnitsInStock = (select MIN(UnitsInStock) from Products)

--34
select p.ProductID, p.ProductName, s.SupplierID, c.CategoryID, p.UnitsOnOrder
from Products p, Categories c, Suppliers s
where (p.SupplierID = s.SupplierID) and (p.CategoryID = c.CategoryID)
and p.UnitsOnOrder = (select MAX(UnitsOnOrder) from Products)

--35
select p.ProductID, p.ProductName, p.SupplierID, p.CategoryID, p.ReorderLevel reorderlevel 
from Products p
where ReorderLevel = 
(
	select top 1 p.ReorderLevel reorderlevel 
	from Products p
	order by reorderlevel desc
)
order by p.ProductID asc

-- 36
select top 1 e.EmployeeID, e.LastName, e.FirstName,
		COUNT(o2.OrderID) [Delayed Orders] 
from Employees e
join Orders o2 on e.EmployeeID = o2.EmployeeID
where o2.ShippedDate > o2.RequiredDate
group by e.EmployeeID, e.LastName, e.FirstName
order by [Delayed Orders] desc

-- 37
select top 1 e.EmployeeID, e.LastName, e.FirstName,
		COUNT(o2.OrderID) [Delayed Orders] 
from Employees e
join Orders o2 on e.EmployeeID = o2.EmployeeID
where o2.ShippedDate > o2.RequiredDate
group by e.EmployeeID, e.LastName, e.FirstName
order by [Delayed Orders] asc

--38
select * from
(
	select top 3 p.ProductID, p.ProductName, sum(o.Quantity) [Total Ordered] 
	from Products p
	join [Order Details] o on p.ProductID = o.ProductID
	join Orders o2 on o.OrderID = o2.OrderID
	group by p.ProductID, p.ProductName
	order by [Total Ordered] desc
) as c
order by c.[Total Ordered] asc

-- 39
select * 
from
(
	select top 5 p.ProductID, p.ProductName, 
			sum(o.Quantity) [Total Ordered] 
	from Products p
	join [Order Details] o on p.ProductID = o.ProductID
	join Orders o2 on o.OrderID = o2.OrderID
	group by p.ProductID, p.ProductName
	order by [Total Ordered] desc
) as c
order by c.[Total Ordered] asc
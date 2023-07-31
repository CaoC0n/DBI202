select o.ID, o.OrderDate, o.ShipDate, o.ShipDate, 
		o.ShipMode, c.ID
from Orders o, Customer c
where (o.CustomerID = c.ID) and o.OrderDate = (select top(1) o.OrderDate
from Orders o, Customer c
where (o.CustomerID = c.ID)
order by o.OrderDate desc)
order by o.OrderDate
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
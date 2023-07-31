select a.ID, a.CustomerName,  a.City, a.State
from Customer a, Orders b
where a.ID = b.CustomerID
and b.OrderDate between '2017-12-05' and '2017-12-10' 
and DATEDIFF(DAY, b.OrderDate, b.ShipDate) between 0 and 2
order by a.State asc, a.City desc

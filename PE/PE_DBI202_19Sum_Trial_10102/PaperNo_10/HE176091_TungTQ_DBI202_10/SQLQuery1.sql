select o.ProductID, p.ProductName, COUNT(*) NumberOfOrders
from Product p, OrderDetails o
where p.ID = o.ProductID 
group by o.ProductID, p.ProductName
having COUNT(*) = (
  select MIN(OrderCount)
  from (
    select COUNT(*) AS OrderCount
    from Product p, OrderDetails o
    where p.ID = o.ProductID
    group by o.ProductID, p.ProductName
  ) as Subquery
)


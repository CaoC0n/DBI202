select * from (select top(5) p.SubCategoryID, COUNT(p.ID) as NumberOfProducts
from Product p
group by p.SubCategoryID
order by NumberOfProducts desc) as p
union 
select * from (select top(5) p.SubCategoryID, COUNT(p.ID) as NumberOfProducts
from Product p
group by p.SubCategoryID
order by NumberOfProducts) as p
order by NumberOfProducts desc
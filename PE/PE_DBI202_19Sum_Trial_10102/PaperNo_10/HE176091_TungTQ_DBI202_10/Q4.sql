select p.SubCategoryID, s.SubCategoryName, 
		COUNT(p.SubCategoryID) as NumberOfProducts
from SubCategory s, Product p
where s.ID = p.SubCategoryID 
group by p.SubCategoryID, s.SubCategoryName
having COUNT(p.SubCategoryID) > 100
order by NumberOfProducts desc
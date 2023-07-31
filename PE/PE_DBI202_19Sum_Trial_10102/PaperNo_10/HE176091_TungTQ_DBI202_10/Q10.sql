insert into Category(CategoryName) values ('Sports')
select * from Category
insert into SubCategory(CategoryID, SubCategoryName)
values ((select c.ID from Category c where c.CategoryName = 'Sports'), 'Tennis'), 
((select c.ID from Category c where c.CategoryName = 'Sports'), 'Football')  
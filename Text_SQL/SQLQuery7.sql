create trigger Delete_Category
on Categories
instead of delete
as
begin
	-- delete foreign key 
	delete from [Order Details] where ProductID in 
			(select ProductID from Products where CategoryID = (select CategoryID from deleted))
	delete from Products where CategoryID = (select CategoryID from deleted)
	-- primary key
	delete from Categories where CategoryID in (select CategoryID from deleted)
end

select * from Products

delete from Categories where CategoryID = 1
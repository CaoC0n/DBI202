create trigger Check_ProductID
on Products
for update
as 
if update(ProductID)
begin
	print 'You cannot modify the ID of an Product'
	rollback transaction
end

--select * from Products

--update Products set ProductID = 10001 where ProductID = 1
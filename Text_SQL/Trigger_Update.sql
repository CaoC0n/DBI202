-- new price <= old price
create trigger CheckPriceInOrderDetail -- name of trigger
on [Order details] -- name table
for update -- name action
as
-- get UnitPrice in new record
if (select UnitPrice from inserted) > (select UnitPrice from deleted) 
begin 
	print 'New price cannot greater than old price'
	rollback transaction -- cancel action
end


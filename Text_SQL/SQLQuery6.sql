create trigger Update_Customer
on Customers
instead of update
as
begin
	update Orders set CustomerID = (select CustomerID from inserted)
	where CustomerID = (select CustomerID from deleted)
	update Customers set CustomerID = (select CustomerID from inserted)
end
select * from Customers
update Customers set CustomerID = 'abc' where CustomerID = 'ALFKI'
create trigger CheckUnitInStock -- name of trigger
on Products -- name table
for insert -- name action
as
if (select UnitsInStock from inserted) > 80000 -- get UnitInStock in new record
begin 
	print 'UnitInStock cannot greater than 80000'
	rollback transaction -- cancel action
end


create proc TotalAmount
@OrderID nvarchar(255),
@TotalAmount float output
as
begin
	set @TotalAmount = 
	(
		select Sum(o.SalePrice*o.Quantity*(1-o.Discount)) from OrderDetails o
		where o.OrderID = @OrderID
	)
end


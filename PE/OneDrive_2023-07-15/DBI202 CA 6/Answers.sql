--2
select * from tblInvoices
where employeeid = 'S002'

--3
select p.proid, p.proname, s.supname
from tblProducts p, tblSuppliers s
where (p.supcode = s.supcode) and (s.supname = N'Hoàn Vũ')

--4
select p.proname, SUM(de.quantity) [Total quantity]
from tblProducts p, tblInv_Detail de
where (p.proid = de.proid) and p.proname = N'Router Wifi Chuẩn Wifi 6 AX5400 TP-Link Archer AX73'
group by p.proname

--5
select i.employeeid, COUNT(i.employeeid) [Total Number]
from tblInvoices i
group by i.employeeid

--6
select invid, SUM(price * quantity) as [Total amount]
from tblInv_Detail 
group by invid
having SUM(price * quantity) = (
    select MAX(total_amount)
    from (
        select invid, SUM(price * quantity) as total_amount
        from tblInv_Detail
        group by invid
    ) as subquery
)

--7
select i.invid, i.invdate, d.proid, d.quantity, d.price
from tblInvoices i, tblInv_Detail d
where (i.invid = d.invid) and (i.employeeid = 'S003')

--8
drop proc procProductNumber
create proc procProductNumber
@supcode varchar(10),
@totalNumber int output
as 
begin 
	select @totalNumber = COUNT(proid)
	from tblProducts p, tblSuppliers s
	where (p.supcode = s.supcode) and @supcode = s.supcode
end

declare @Productnumber int
exec procProductNumber 'MT', @Productnumber output
select @Productnumber

--9


--10
delete from tblInvoices
where customer = 'Le Minh Phuong'

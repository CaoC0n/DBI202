use S_P_SP

select * from S 
where Sname like '%San%'
go

select * from S 
where Sname like '%ikes'
go
--30
/* c1
select Sname 
from S full join SP on S.SID = SP.SID
where PID = 'p2'
*/
--c2
select Sname as TenNhaCungCap
from S, SP 
where (S.SID = SP.SID) and (PID = 'p2')

-- 32
select Sname, City
from S
where Status > 100
-- 33
select T1.SID
from SP as T1, SP as T2
where 
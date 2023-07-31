--2 
select * from Loans
where (BranchID = 1) and MONTH(DateOut) = 9
and YEAR(DateOut) = 2016

--3
select l.LoanID, l.DateOut, b.BookID, b.Title, b.AuthorName,
		b.PublisherID
from Loans l, Books b
where (l.BookID = b.BookID) and l.DateOut between '2016-09-05' and '2016-09-12'

--4
select b.BookID, b.Title, b.AuthorName, p.Name PublisherName,
		br.BranchID, br.BranchID, c.No_Of_Copies
from Books b, Branch br, Copies c, Publisher p
where (b.BookID = c.BookID) and (c.BranchID = br.BranchID) 
and (b.PublisherID = p.ID) 
and (br.BranchName = 'Central' or br.BranchName = 'Sharpstown')
order by br.BranchID desc, b.Title

--5
select b.BookID, b.Title, b.AuthorName, p.Name PublisherName,
		sum(No_Of_Copies) as TotalNumberOfCopies
from Books b, Publisher p, Copies c
where (b.PublisherID = p.ID) and (b.BookID = c.BookID)
group by b.BookID, b.Title, b.AuthorName, p.Name
having sum(No_Of_Copies) >= 9

--6
select br.BranchID, br.BranchName, br.Address,
		COUNT(l.LoanID) as NumberOfLoans
from Branch br, Loans l
where (br.BranchID = l.BranchID) and (MONTH(l.DateOut) = 9)
and (YEAR(l.DateOut) = 2016)
group by br.BranchID, br.BranchName, br.Address
having COUNT(l.LoanID) = 
(
	select MAX(MaxOfLoan)
	from (
		select COUNT(l.LoanID) as MaxOfLoan
		from Branch br, Loans l
		where (br.BranchID = l.BranchID) and (MONTH(l.DateOut) = 9)
		and (YEAR(l.DateOut) = 2016)
		group by br.BranchID, br.BranchName, br.Address
	) as s
)
union
select br.BranchID, br.BranchName, br.Address,
		COUNT(l.LoanID) as NumberOfLoans
from Branch br, Loans l
where (br.BranchID = l.BranchID) and (MONTH(l.DateOut) = 9)
and (YEAR(l.DateOut) = 2016)
group by br.BranchID, br.BranchName, br.Address
having COUNT(l.LoanID) = 
(
	select MIN(MinOfLoan)
	from (
		select COUNT(l.LoanID) as MinOfLoan
		from Branch br, Loans l
		where (br.BranchID = l.BranchID) and (MONTH(l.DateOut) = 9)
		and (YEAR(l.DateOut) = 2016)
		group by br.BranchID, br.BranchName, br.Address
	) as s1
)

--7
with t as (
select p.ID as PublisherID, p.[Name] as PublisherName, ba.BranchID, ba.BranchName
from Publisher p, Branch ba
where p.[Name] = 'Singer'
or p.[Name] = 'Newton'
or p.[Name] = 'GST')
, t2 as (
select b.PublisherID, ba.BranchID, sum(c.No_Of_Copies) as TotalNumberOfBookCopies
from Books b, Copies c, Branch ba
where b.BookID = c.BookID and c.BranchID = ba.BranchID
group by b.PublisherID, ba.BranchID)

select t.PublisherID, t.PublisherName, t.BranchID, t.BranchName, t2.TotalNumberOfBookCopies 
from t left join t2 on t.PublisherID = t2.PublisherID and t.BranchID = t2.BranchID

--8
drop proc Proc2
create proc Proc2
@publisherID int,
@TotalNumberOfCopies int output
as
begin
	select @TotalNumberOfCopies = SUM(c.No_Of_Copies)
	from Books b, Copies c 
	where (b.BookID = c.BookID) and (b.PublisherID = @publisherID)
end

declare @x int
exec Proc2 4, @x output
select @x as TotalNumberOfCopies

--9
drop trigger Tr2
create trigger Tr2 on Copies
instead of delete
as
begin
	update Copies
	set No_Of_Copies = NULL
	where BookID in (select BookID from deleted)
end


--10
insert into Loans(LoanID, BookID, BranchID, CardNo, DateOut, DueDate)
values (60, 13, 2, 1, '2023-03-02', '2023-03-12')


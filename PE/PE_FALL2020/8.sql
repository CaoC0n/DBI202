create proc proc_university_year
@year int,
@pct_international_student int,
@nbUniversity int output
as
begin
	set @nbUniversity = (select COUNT(*)
	from university u, university_year uy
	where (u.id = uy.university_id) and uy.year = @year 
	and uy.pct_international_students > @pct_international_student)
end


declare @out int
exec proc_university_year 2011, 30, @out output
select @out as NumberOfUniversities

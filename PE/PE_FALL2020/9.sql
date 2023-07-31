drop trigger tr_insert_university_ranking 
create trigger tr_insert_university_ranking
on university_ranking_year after insert
as
begin
	select * from inserted
	order by score ASC
end

insert into university_ranking_year(university_id, ranking_criteria_id, year, score)
values (1,1,2020,99), (12,2,2020,67)
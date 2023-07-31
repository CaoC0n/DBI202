insert into ranking_system(id, system_name) values(4, 'QS World University Rankings')
insert into ranking_criteria 
values(22, (select id from ranking_system where id = 4), 'Academic Reputation'),
(23, (select id from ranking_system where id = 4), 'Citations per faculty')

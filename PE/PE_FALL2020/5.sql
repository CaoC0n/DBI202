select r.ranking_system_id, rs.system_name,
		COUNT(*) as NumberOfCriteria
from ranking_criteria r, ranking_system rs
where (r.ranking_system_id = rs.id)
group by r.ranking_system_id, rs.system_name
order by NumberOfCriteria desc


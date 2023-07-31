select uy.university_id, u.university_name, uy.year,
		uy.num_students, uy.pct_international_students, u.country_id
from university u, university_year uy
where (u.id = uy.university_id) and uy.year = 2016 and 
uy.pct_international_students > 30
order by u.university_name

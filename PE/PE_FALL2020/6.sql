select u1.university_id, u.university_name, u1.year, u1.student_staff_ratio 
from university u, university_year u1
where u.id = u1.university_id and u1.year = 2015
and u1.student_staff_ratio = (select min(u1.student_staff_ratio) 
from university_year u1 where u1.year = 2015)
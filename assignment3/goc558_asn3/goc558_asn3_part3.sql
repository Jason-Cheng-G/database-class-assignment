------------assignment 3 part 3 ------------------------
------goc558 Gong Cheng 11196838------------------------

SELECT e.e_employeeNumber, concat(e.e_lastName,' ',e.e_firstName) AS name, e.e_birthdate, e.e_gender, 

(CASE WHEN e.e_rehireDt IS NOT NULL THEN (current_date - e.e_rehireDt) + e.e_terminationDt - e.e_hireDt
     WHEN e.e_terminationDt IS NULL THEN  current_date - e.e_hireDt
     ELSE NULL
     END) AS length_of_service,
j.j_name,
(CASE WHEN e.e_rehireDt IS NOT NULL THEN  current_date - e.e_rehireDt
     WHEN e.e_terminationDt IS NULL THEN  current_date - e.e_hireDt
     ELSE NULL
     END) AS current_job_length,

d.d_name,
j.j_pay_type,

(CASE WHEN ej.ej_salary_amount IS NULL THEN ej.ej_hourly_amount
     ELSE ej.ej_salary_amount
     END) pay_amount,

e.e_l_performance_review_Text
FROM Employees e, Employee_Job ej, Jobs j, Departments d, Locations l
WHERE  ej.ej_e_id = e.e_id
AND    ej.ej_j_id = j.j_id
AND    j.j_d_id = d.d_id
AND    d.d_location_id = l.l_id
AND    ( e.e_rehireDt IS NOT NULL 
		OR  e.e_terminationDt IS NULL);




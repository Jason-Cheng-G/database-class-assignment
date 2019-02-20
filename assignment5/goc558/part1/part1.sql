-- Gong Cheng goc558

--*****NOTICE******
-- Query 3 and Index 4 in the assignment document is reversed here based on comment of the Prof in moodle.
--So here the query 3 is the query 4 in assignment document and query 4 is the query 3 in assignment doc
DROP INDEX employee_histories_first_name_last_name ;
DROP INDEX employee_jobs_employee_id_job_id ;
DROP INDEX employees_birthdate ;

-- Query 1 before index 1
EXPLAIN ANALYZE 
SELECT *
FROM employee_histories eh 
WHERE eh.first_name LIKE 'Cla%'; 


-- Query 2 before index 1
EXPLAIN ANALYZE 
SELECT *
FROM employee_histories eh
WHERE eh.first_name NOT LIKE 'Cla%';


-- Create INDEX 1
CREATE INDEX employee_histories_first_name_last_name ON employee_histories(first_name,last_name);

-- Query 1  index 1
EXPLAIN ANALYZE 
SELECT *
FROM employee_histories eh 
WHERE eh.first_name LIKE 'Cla%'; 


-- Query 2 before index 1
EXPLAIN ANALYZE 
SELECT *
FROM employee_histories eh
WHERE eh.first_name NOT LIKE 'Cla%';

--------------------------------------------------------------------------------------

  -- Query 3 before Index 2
EXPLAIN ANALYZE 
SELECT 
  e.first_name, 
  e.last_name, 
  ej.pay_amount,
  ej.effective_date, 
  ej.expiry_date, 
  j.name job_name, 
  d.name department_name, 
  l.name location_name,
  es.name employment_status_types
FROM employees e
JOIN employee_jobs ej ON e.id = ej.employee_id
JOIN jobs j ON ej.job_id = j.id
JOIN departments d on j.department_id = d.id
JOIN locations l on d.location_id = l.id
JOIN employment_status_types es ON es.id = e.employment_status_id
WHERE l.code = 'SKTN-MT'
  AND es.name IN ('Active','Paid Leave')
  AND ej.effective_date = (SELECT MAX(ej2.effective_date)
                           FROM employee_jobs ej2
                           WHERE ej2.employee_id = e.id);
                           
  -------create Index 2
CREATE INDEX employee_jobs_employee_id_job_id ON employee_jobs(employee_id,job_id );


  -- Query 3 after Index 2
EXPLAIN ANALYZE 
SELECT 
  e.first_name, 
  e.last_name, 
  ej.pay_amount,
  ej.effective_date, 
  ej.expiry_date, 
  j.name job_name, 
  d.name department_name, 
  l.name location_name,
  es.name employment_status_types
FROM employees e
JOIN employee_jobs ej ON e.id = ej.employee_id
JOIN jobs j ON ej.job_id = j.id
JOIN departments d on j.department_id = d.id
JOIN locations l on d.location_id = l.id
JOIN employment_status_types es ON es.id = e.employment_status_id
WHERE l.code = 'SKTN-MT'
  AND es.name IN ('Active','Paid Leave')
  AND ej.effective_date = (SELECT MAX(ej2.effective_date)
                           FROM employee_jobs ej2
                           WHERE ej2.employee_id = e.id);


  --------------------------------------------------------------------------------------------------------

-- Query 4  before index 3
EXPLAIN ANALYZE                
SELECT 
  e.first_name, 
  e.last_name, 
  e.gender, 
  e.birth_date, 
  es.name employment_status_type
FROM employees e
JOIN employment_status_types es ON es.id = e.employment_status_id
WHERE COALESCE(termination_date,CURRENT_DATE+1) >= CURRENT_DATE 
  AND e.birth_date > CURRENT_DATE - INTERVAL '30 years'
  AND es.name IN ('Active','Paid Leave');
  
         
  -------create Index 3
CREATE INDEX employees_birthdate ON employees(birth_date);


-- Query 4  after index 3
EXPLAIN ANALYZE                
SELECT 
  e.first_name, 
  e.last_name, 
  e.gender, 
  e.birth_date, 
  es.name employment_status_type
FROM employees e
JOIN employment_status_types es ON es.id = e.employment_status_id
WHERE COALESCE(termination_date,CURRENT_DATE+1) >= CURRENT_DATE 
  AND e.birth_date > CURRENT_DATE - INTERVAL '30 years'
  AND es.name IN ('Active','Paid Leave');
  
  --------------------------------------------------------------------------------------
  

  
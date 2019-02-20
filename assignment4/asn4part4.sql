----Gong Cheng
----NSID goc558
----Student ID 11196838

-- Create View employeeFile AS
SELECT e.employee_number,e.title, e.first_name,e.middle_name, e.last_name, e.gender, e.birth_date, 
			        m.name, e.ssn, e.home_email, e.hire_date, e.rehire_date, e.termination_date, tt.name,  tr.name, j.name, 
			        j.code, ej.effective_date,ej.expiry_date, 
			        d.code, l.code, pf.name, pt.name,  
			        (CASE WHEN pt.name = 'Hourly' THEN ej.pay_amount
			             ELSE NULL
			        END) AS hourlyAmount,

			         (CASE WHEN pt.name = 'Salary' THEN ej.pay_amount
			              ELSE NULL
			         END) AS salaryAmount,

 					j.code, es.name, ej.standard_hours, et.name,

 					(SELECT ea.street 
 					 FROM address_types adt, emp_addresses ea
 					 WHERE adt.name = 'Home' AND adt.id = ea.type_id  AND ea.employee_id = e.id) 
 					AS homeStreet,

 					(SELECT ea.city
 					 FROM address_types adt, emp_addresses ea
 					 WHERE adt.name = 'Home' AND adt.id = ea.type_id  AND ea.employee_id = e.id) 
 					AS homeCity,

 					(SELECT p.name
 					 FROM address_types adt, emp_addresses ea , provinces p
 					 WHERE adt.name = 'Home' AND adt.id = ea.type_id  AND ea.employee_id = e.id AND p.id = ea.province_id) 
 					AS homeState,

 					(SELECT c.name
 					 FROM address_types adt, emp_addresses ea , countries c
 					 WHERE adt.name = 'Home' AND adt.id = ea.type_id  AND ea.employee_id = e.id AND c.id = ea.country_id) 
 					AS homeCountry,

 					(SELECT ea.postal_code
 					 FROM address_types adt, emp_addresses ea 
 					 WHERE adt.name = 'Home' AND adt.id = ea.type_id  AND ea.employee_id = e.id ) 
 					AS homeZipCode,



 				   (SELECT ea.street
 				   	FROM address_types adt , emp_addresses ea
 				    WHERE adt.name = 'Business' AND adt.id = ea.type_id AND ea.employee_id = e.id) 
 					AS busStreet,

 				   (SELECT ea.city
 				   	FROM address_types adt , emp_addresses ea
 				    WHERE adt.name = 'Business' AND adt.id = ea.type_id AND ea.employee_id = e.id) 
 					AS busCity,

 					(SELECT p.name
 					 FROM address_types adt, emp_addresses ea , provinces p
 					 WHERE adt.name = 'Business' AND adt.id = ea.type_id  AND ea.employee_id = e.id AND p.id = ea.province_id) 
 					AS busState,

 					(SELECT c.name
 					 FROM address_types adt, emp_addresses ea , countries c
 					 WHERE adt.name = 'Business' AND adt.id = ea.type_id  AND ea.employee_id = e.id AND c.id = ea.country_id) 
 					AS busCountry,

 					 (SELECT ea.postal_code
 					 FROM address_types adt, emp_addresses ea 
 					 WHERE adt.name = 'Business' AND adt.id = ea.type_id  AND ea.employee_id = e.id ) 
 					AS busZipCode

 					--last performance rating 
 					-- last performance text
 					--last performance rating date
 					

 					--
			        --  e.hire_date, e.rehire_date, e.termination_date,e.term_reason_id,tr.code,tr.name, e.term_type_id,
			        -- tt.code,tt.name, 

			        -- j.code,j.name, NEW.effective_date, NEW.expiry_date, NEW.pay_amount, NEW.standard_hours, NEW.employee_type_id, et.code, et.name,

			        -- e.employment_status_id, est.code, est.name,

			        -- d.code, d.name,l.code,l.name,

			        -- j.pay_frequency_id,pf.code,pf.name,

			        -- j.pay_type_id, pt.code, pt.name
FROM employees e, marital_statuses m, termination_types tt, termination_reasons tr, employee_jobs ej, jobs j, departments d, locations l,
    pay_frequencies pf, pay_types pt, employee_statuses es, employee_types et
WHERE m.id = e.marital_status_id AND tt.id = e.term_type_id AND tr.id = e.term_reason_id AND ej.employee_id = e.id AND ej.job_id = j.id 
		AND j.department_id = d.id AND d.location_id = l.id AND  pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id AND 
		es.id = ej.employee_status_id AND et.id = ej.employee_type_id ; 


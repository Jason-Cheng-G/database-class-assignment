-- Solution for 2017 Term 1 CMPT355 Assignment 4
-- Author: Ellen Redlick
-- Modified: Lujie Duan




-- Load all employees
CREATE OR REPLACE FUNCTION load_employees()
RETURNS void AS $$
DECLARE
  v_emp RECORD;
  v_empjobs RECORD; 
  v_ssn_rec RECORD;
  job_rec RECORD;
  sup_job RECORD;
  
  v_emp_id INT;
  v_employment_status_id INT;
  v_employment_status_code VARCHAR(10);
  v_employment_status_name VARCHAR(30);
  v_term_reason_id INT;
  v_term_reason_code VARCHAR(10);
  v_term_reason_name VARCHAR(30);
  v_term_type_id INT;
  v_term_type_code VARCHAR(10);
  v_term_type_name VARCHAR(30);
  v_emp_job_id INT;
  v_perf_review_id INT;
  v_employee_type_id INT;
  v_employee_type_code VARCHAR(10);
  v_employee_type_name VARCHAR(30);
  v_employee_status_id INT;
  v_employee_status_code VARCHAR(10);
  v_employee_status_name VARCHAR(30);
  v_job_id INT;
  v_job_code VARCHAR(10);
  v_job_name VARCHAR(30);
  v_home_addr_id INT;
  v_home_prov_id INT;
  v_home_country_id INT;
  v_home_addr_type_id INT;
  v_bus_addr_id INT;
  v_bus_prov_id INT;
  v_bus_country_id INT;
  v_bus_addr_type_id INT;
  v_marital_status_id INT;
  v_marital_status_code VARCHAR(10);
  v_marital_status_name VARCHAR(30);
  v_loc_id INT;
  v_loc_code VARCHAR(10);
  v_loc_name VARCHAR(30);
  v_dept_id INT; 
  v_dept_code VARCHAR(10);
  v_dept_name VARCHAR(30);
  v_pay_freq_id INT;
  v_pay_freq_code VARCHAR(10);
  v_pay_freq_name VARCHAR(30);
  v_pay_type_id INT;
  v_pay_type_code VARCHAR(10);
  v_pay_type_name VARCHAR(30);
  v_sup_job_id INT; 
  v_sup_job_code VARCHAR(10);
  v_sup_job_name VARCHAR(30);
  v_sup_name VARCHAR(50);
  v_audit_action CHAR(1);
BEGIN
  --- insert or update employee data
  FOR v_emp IN (SELECT 
                  TRIM(led.employee_number) employee_number, 
                  TRIM(led.title) title, 
                  TRIM(led.first_name) first_name,
                  TRIM(led.middle_name) middle_name,
                  TRIM(led.last_name) last_name,
                  CASE TRIM(UPPER(led.gender)) 
                    WHEN 'MALE' THEN 'M'
                    WHEN 'FEMALE' THEN 'F'
                    ELSE 'U'
                  END gender,
                  TO_DATE(TRIM(led.birthdate), 'yyyy-mm-dd') birthdate, 
                  TRIM(led.marital_status) marital_status, 
                  REGEXP_REPLACE(UPPER(TRIM(led.ssn)), '[^A-Z0-9]', '', 'g') ssn, 
                  TRIM(led.home_email) home_email, 
                  TO_DATE(TRIM(led.orig_hire_date), 'yyyy-mm-dd') orig_hire_date,
                  TO_DATE(TRIM(led.rehire_date), 'yyyy-mm-dd') rehire_date,
                  TO_DATE(TRIM(led.term_date), 'yyyy-mm-dd') term_date,
                  TRIM(led.term_type) term_type, 
                  TRIM(led.term_reason) term_reason, 
                  TRIM(led.job_code) job_code, 
                  TO_DATE(TRIM(led.job_st_date), 'yyyy-mm-dd') job_st_date,
                  TO_DATE(TRIM(led.job_end_date), 'yyyy-mm-dd') job_end_date,
                  TRIM(led.department_code) department_code, 
                  TRIM(led.location_code) location_code, 
                  TRIM(led.pay_freq) pay_freq,
                  TRIM(led.pay_type) pay_type,
                  COALESCE( TO_NUMBER(TRIM(led.hourly_amount), 'FM99G999G999.00'),
                            TO_NUMBER(TRIM(led.salary_amount), 'FM99G999G999.00') ) pay_amount,
                  TRIM(led.supervisor_job_code) supervisor_job_code, 
                  TRIM(led.employee_status) employee_status, 
                  TRIM(led.standard_hours) standard_hours,
                  TRIM(led.employee_type) employee_type, 
                  TRIM(led.employment_status) employment_status, 
                  TRIM(led.last_perf_num) last_perf_number, 
                  TRIM(led.last_perf_text) last_perf_text, 
                  TO_DATE(TRIM(led.last_perf_date), 'yyyy-mm-dd') last_perf_date, 
                  TRIM(led.home_street_num) home_street_num, 
                  TRIM(led.home_street_addr) home_street_addr, 
                  TRIM(led.home_street_suffix) home_street_suffix,
                  TRIM(led.home_city) home_city,
                  TRIM(led.home_state) home_state,
                  TRIM(led.home_country) home_country,
                  TRIM(led.home_zip_code) home_zip_code,
                  TRIM(led.bus_street_num) bus_street_num,
                  TRIM(led.bus_street_addr) bus_street_addr,
                  TRIM(led.bus_street_suffix) bus_street_suffix,
                  TRIM(led.bus_city) bus_city,
                  TRIM(led.bus_state) bus_state,
                  TRIM(led.bus_country) bus_country,
                  TRIM(led.bus_zip_code) bus_zip_code,
                  REGEXP_REPLACE(UPPER(TRIM(led.ph1_cc)), '[^A-Z0-9]', '', 'g') ph1_cc,
                  REGEXP_REPLACE(UPPER(TRIM(led.ph1_area)), '[^A-Z0-9]', '', 'g') ph1_area,
                  RIGHT(REGEXP_REPLACE(UPPER(TRIM(led.ph1_number)), '[^A-Z0-9]', '', 'g'), 7) ph1_number,
                  TRIM(led.ph1_extension) ph1_extension,
                  TRIM(led.ph1_type) ph1_type,  
                  REGEXP_REPLACE(UPPER(TRIM(led.ph2_cc)), '[^A-Z0-9]', '', 'g') ph2_cc, 
                  REGEXP_REPLACE(UPPER(TRIM(led.ph2_area)), '[^A-Z0-9]', '', 'g') ph2_area, 
                  RIGHT(REGEXP_REPLACE(UPPER(TRIM(led.ph2_number)), '[^A-Z0-9]', '', 'g'), 7) ph2_number, 
                  TRIM(led.ph2_extension) ph2_extension, 
                  TRIM(led.ph2_type) ph2_type,  
                  REGEXP_REPLACE(UPPER(TRIM(led.ph3_cc)), '[^A-Z0-9]', '', 'g') ph3_cc, 
                  REGEXP_REPLACE(UPPER(TRIM(led.ph3_area)), '[^A-Z0-9]', '', 'g') ph3_area, 
                  RIGHT(REGEXP_REPLACE(UPPER(TRIM(led.ph3_number)), '[^A-Z0-9]', '', 'g'), 7) ph3_number, 
                  TRIM(led.ph3_extension) ph3_extension, 
                  TRIM(led.ph3_type) ph3_type, 
                  REGEXP_REPLACE(UPPER(TRIM(led.ph4_cc)), '[^A-Z0-9]', '', 'g') ph4_cc, 
                  REGEXP_REPLACE(UPPER(TRIM(led.ph4_area)), '[^A-Z0-9]', '', 'g') ph4_area, 
                  RIGHT(REGEXP_REPLACE(UPPER(TRIM(led.ph4_number)), '[^A-Z0-9]', '', 'g'), 7) ph4_number,
                  TRIM(led.ph4_extension) ph4_extension, 
                  TRIM(led.ph4_type) ph4_type
                FROM load_employee_data led
                ORDER BY led.employee_number) LOOP
    
    -- get the employee number
    SELECT id
    INTO v_emp_id
    FROM employees 
    WHERE employee_number = v_emp.employee_number;

    -- get the employment status (A, I, P, U, S)
    SELECT id, code, name
    INTO v_employment_status_id, v_employment_status_code, v_employment_status_name
    FROM employment_status_types
    WHERE UPPER(name) = UPPER(v_emp.employment_status);
    
    SELECT id, code, name
    INTO v_term_type_id, v_term_type_code, v_term_type_name
    FROM termination_types 
    WHERE UPPER(name) = UPPER(v_emp.term_type);
    
    SELECT id, code, name
    INTO v_term_reason_id, v_term_reason_code, v_term_reason_name
    FROM termination_reasons
    WHERE UPPER(name) = UPPER(v_emp.term_reason);
    
    SELECT id, code, name
    INTO v_marital_status_id, v_marital_status_code, v_marital_status_name
    FROM marital_statuses 
    WHERE UPPER(name) = UPPER(v_emp.marital_status); 
    
    
    -- if the employee isn't in the database yet...
    IF v_emp_id IS NULL THEN 
    
      -- check to make sure the SSN isn't already in use or null
      FOR v_ssn_rec IN (SELECT id 
                        FROM employees 
                        WHERE ssn = v_emp.ssn) LOOP
        RAISE NOTICE 'ssn already in use. cannot insert record: %', v_emp;
        CONTINUE;                
      END LOOP;
     
     
     
      IF v_emp.ssn IS NOT NULL THEN 
        INSERT INTO employees(employee_number,title,first_name,middle_name,last_name,gender,ssn,birth_date,
                              marital_status_id,home_email,employment_status_id,hire_date,rehire_date,termination_date,
                              term_type_id, term_reason_id)
        VALUES (v_emp.employee_number,v_emp.title,v_emp.first_name,v_emp.middle_name,v_emp.last_name,v_emp.gender,
                v_emp.ssn, v_emp.birthdate,v_marital_status_id,v_emp.home_email,v_employment_status_id, 
                v_emp.orig_hire_date,v_emp.rehire_date,v_emp.term_date, v_term_type_id, v_term_reason_id)
        RETURNING id into v_emp_id;
        
        v_audit_action := 'I';
        INSERT INTO audit_employees (employee_id,employee_number,title,first_name,middle_name,last_name,gender,SSN,birth_date,marital_status_id,
                                 home_email,employment_status_id,hire_date,rehire_date,termination_date,term_reason_id,term_type_id,
                                 audit_date,audit_action,audit_user)
        VALUES (v_emp_id, v_emp.employee_number, v_emp.title, v_emp.first_name, v_emp.middle_name, v_emp.last_name, v_emp.gender, v_emp.ssn, 
                v_emp.birthdate, v_marital_status_id, v_emp.home_email, v_employment_status_id, v_emp.orig_hire_date, v_emp.rehire_date, 
                v_emp.term_date, v_term_type_id, v_term_reason_id, CURRENT_TIMESTAMP, v_audit_action, 'source_load');
      ELSE 
        RAISE NOTICE 'Skipping employee record. ssn null for employee: %', v_emp;
        CONTINUE;
      END IF;
    
    ELSE 
    -- if you found the employee number, check to make sure it's the employee number for the right person.
      -- Check to make sure this is the right person
      IF NOT v_emp.ssn = (SELECT ssn 
                          FROM employees
                          WHERE id = v_emp_id) THEN 
        RAISE NOTICE 'This employee number belongs to another employee: %', v_emp;
        CONTINUE;
      END IF;
      
      UPDATE employees 
      SET 
        title = v_emp.title, 
        first_name = v_emp.first_name, 
        middle_name = v_emp.middle_name,
        last_name = v_emp.last_name, 
        gender = v_emp.gender, 
        ssn = v_emp.ssn, 
        birth_date = v_emp.birthdate,
        marital_status_id = v_marital_status_id, 
        home_email = v_emp.home_email,
        employment_status_id = v_employment_status_id,
        hire_date = v_emp.orig_hire_date, 
        rehire_date = v_emp.rehire_date,
        termination_date = v_emp.term_date,
        term_type_id = v_term_type_id,
        term_reason_id = v_term_reason_id
      WHERE id = v_emp_id;
      
      v_audit_action := 'U';
      INSERT INTO audit_employees (employee_id,employee_number,title,first_name,middle_name,last_name,gender,SSN,birth_date,marital_status_id,
                               home_email,employment_status_id,hire_date,rehire_date,termination_date,term_reason_id,term_type_id,
                               audit_date,audit_action,audit_user)
      VALUES (v_emp_id, v_emp.employee_number, v_emp.title, v_emp.first_name, v_emp.middle_name, v_emp.last_name, v_emp.gender, v_emp.ssn, 
              v_emp.birthdate, v_marital_status_id, v_emp.home_email, v_employment_status_id, v_emp.orig_hire_date, v_emp.rehire_date, 
              v_emp.term_date, v_term_type_id, v_term_reason_id, CURRENT_TIMESTAMP, v_audit_action, 'source_load');
    END IF;
    
    
    -- 
    -- Performance 
    --
    --  look for an existing review for the employee with the date in the file
    SELECT id
    INTO v_perf_review_id
    FROM employee_reviews
    WHERE employee_id = v_emp_id 
      AND review_date = v_emp.last_perf_date;

    -- if it doesn't exist, insert it. Otherwise, update the rating 
    IF v_perf_review_id IS NULL AND v_emp.last_perf_number IS NOT NULL AND v_emp.last_perf_date IS NOT NULL THEN 
      INSERT INTO employee_reviews(employee_id, review_date, rating_id)
      VALUES (v_emp_id, v_emp.last_perf_date, v_emp.last_perf_number::INT);
    ELSIF v_emp.last_perf_number IS NOT NULL AND v_emp.last_perf_date IS NOT NULL THEN
      UPDATE employee_reviews
      SET rating_id = v_emp.last_perf_number::INT
      WHERE id = v_perf_review_id;
    END IF;
    
    
    --
    --  insert/update into employee jobs
    --
    
     -- get the employee type (REG/TEMP)
    SELECT id, code, name
    INTO v_employee_type_id, v_employee_type_code, v_employee_type_name
    FROM employee_types
    WHERE UPPER(name) = UPPER(v_emp.employee_type);
    
    
    -- get the employee status (F, P, C)
    SELECT id, code, name
    INTO v_employee_status_id, v_employee_status_code, v_employee_status_name
    FROM employee_statuses
    WHERE UPPER(name) = UPPER(v_emp.employee_status);
    
    -- look for an employee_job for this employee
    v_emp_job_id := NULL;
    FOR v_empjobs IN (SELECT ej.id
                      FROM 
                        employee_jobs ej, 
                        employees e,
                        jobs j
                      WHERE ej.employee_id = e.id 
                        AND e.employee_number = v_emp.employee_number 
                        AND ej.job_id = j.id
                        AND j.code = v_emp.job_code
                        AND v_emp.job_st_date = ej.effective_date) LOOP
      v_emp_job_id := v_empjobs.id;
    END LOOP;
    
    -- check to see if there is a job with this job code in this department/location combination.
    SELECT j.id
    INTO v_job_id
    FROM jobs j
    LEFT JOIN departments d ON j.department_id = d.id
    JOIN locations l ON l.id = d.location_id
    WHERE l.code = v_emp.location_code
      AND UPPER(j.code) = UPPER(v_emp.job_code);

    IF v_job_id IS NULL
    THEN
        RAISE NOTICE 'No job exists with this job code, department, location combination for employee %, "%"', v_emp_id, v_emp.job_code;
        CONTINUE;
    END IF;
    
    
    FOR job_rec IN (SELECT 
                      j.code job_code, 
                      j.name job_name, 
                      j.supervisor_job_id,
                      d.id dept_id, 
                      d.code dept_code, 
                      d.name dept_name, 
                      l.id loc_id, 
                      l.code loc_code, 
                      l.name loc_name, 
                      pf.id pay_freq_id, 
                      pf.code pay_freq_code, 
                      pf.name pay_freq_name,
                      pt.id pay_type_id, 
                      pt.code pay_type_code, 
                      pt.name pay_type_name
                    FROM
                      jobs j,
                      locations l,
                      departments d,
                      pay_frequencies pf,
                      pay_types pt
                    WHERE j.id = v_job_id
                      AND j.department_id = d.id
                      AND d.location_id = l.id
                      AND j.pay_type_id = pt.id
                      AND j.pay_frequency_id = pf.id) LOOP 
        v_job_code := job_rec.job_code;
        v_job_name := job_rec.job_name;
        v_dept_id := job_rec.dept_id; 
        v_dept_code := job_rec.dept_code; 
        v_dept_name := job_rec.dept_name; 
        v_loc_id := job_rec.loc_id; 
        v_loc_code := job_rec.loc_code; 
        v_loc_name := job_rec.loc_name;
        v_pay_freq_id := job_rec.pay_freq_id;
        v_pay_freq_code := job_rec.pay_freq_code;
        v_pay_freq_name := job_rec.pay_freq_name;
        v_pay_type_id := job_rec.pay_type_id;
        v_pay_type_code := job_rec.pay_type_code;
        v_pay_type_name := job_rec.pay_type_name;
        v_sup_job_id := job_rec.supervisor_job_id;            
    END LOOP; 
                     
    
    
    -- Find the supervisor job and the name of who is currently in that job
    FOR sup_job IN (SELECT 
                      concat(e.last_name, ', ', e.first_name) sup_name,
                      j.code sup_job_code, 
                      j.name sup_job_name
                    FROM 
                      employee_jobs ej, 
                      jobs j,
                      employees e
                    WHERE ej.job_id = j.id
                      AND e.id = ej.employee_id
                      AND j.id = v_sup_job_id
                      AND CURRENT_DATE BETWEEN ej.effective_date AND COALESCE(ej.expiry_date,CURRENT_DATE+1) ) LOOP
      v_sup_job_code := sup_job.sup_job_code;
      v_sup_job_name := sup_job.sup_job_name;
      v_sup_name := sup_job.sup_name;
    END LOOP;
    -- check if there's an existing open employee job for this employee and job combination 
    --   during this time period. 
    -- If there isn't, then check for an existing open employee job and close it, and then insert a new 
    --   employee job record.
    -- If there is, do an update. 
    IF v_emp_job_id IS NULL THEN 
    
      -- check for existing open employee job and expire it.
      FOR v_empjobs IN (SELECT 
                          ej.id, 
                          ej.employee_id, 
                          ej.job_id, 
                          ej.effective_date, 
                          ej.expiry_date, 
                          ej.pay_amount, 
                          ej.standard_hours, 
                          ej.employee_type_id,
                          ej.employee_status_id
                       FROM employee_jobs ej
                       WHERE ej.expiry_date IS NULL 
                         AND ej.employee_id = v_emp_id) LOOP
        UPDATE employee_jobs
        SET expiry_date = v_emp.job_st_date
        WHERE id = v_empjobs.id;
        
        v_audit_action := 'U';
        INSERT INTO audit_emp_jobs (emp_job_id, employee_id, job_id, effective_date, expiry_date, pay_amount, standard_hours, employee_type_id, 
                                  employee_status_id, audit_date, audit_action, audit_user)
        VALUES (v_empjobs.id, v_empjobs.employee_id, v_empjobs.job_id, v_empjobs.effective_date, v_empjobs.expiry_date, v_empjobs.pay_amount,
               v_empjobs.standard_hours, v_empjobs.employee_type_id,v_empjobs.employee_status_id, CURRENT_TIMESTAMP, v_audit_action, 'source_load');
        
      END LOOP;
      
      INSERT INTO employee_jobs(employee_id,job_id,effective_date,expiry_date,pay_amount,
                                standard_hours,employee_type_id,employee_status_id)
      VALUES(v_emp_id, v_job_id, v_emp.job_st_date, v_emp.job_end_date, v_emp.pay_amount, v_emp.standard_hours::INT, 
             v_employee_type_id, v_employee_status_id )
      RETURNING ID INTO v_emp_job_id;
      
      v_audit_action := 'I';
      INSERT INTO audit_emp_jobs (emp_job_id, employee_id, job_id, effective_date, expiry_date, pay_amount, standard_hours, employee_type_id, 
                                  employee_status_id, audit_date, audit_action, audit_user)
      VALUES (v_emp_job_id, v_emp_id, v_job_id, v_emp.job_st_date, v_emp.job_end_date, v_emp.pay_amount,
             v_emp.standard_hours::INT, v_employee_type_id, v_employee_status_id, CURRENT_TIMESTAMP, v_audit_action, 'source_load');
    ELSE 
      -- UPDATE employee_jobs 
      UPDATE employee_jobs 
      SET pay_amount = v_emp.pay_amount, 
          standard_hours = v_emp.standard_hours::INT, 
          employee_type_id = v_employee_type_id,
          employee_status_id = v_employee_status_id,
          effective_date = v_emp.job_st_date,
          expiry_date = v_emp.job_end_date
      WHERE id = v_emp_job_id;
      
      v_audit_action := 'U';
      INSERT INTO audit_emp_jobs (emp_job_id, employee_id, job_id, effective_date, expiry_date, pay_amount, standard_hours, employee_type_id, 
                                  employee_status_id, audit_date, audit_action, audit_user)
      VALUES (v_emp_job_id, v_emp_id, v_job_id, v_emp.job_st_date, v_emp.job_end_date, v_emp.pay_amount,
             v_emp.standard_hours::INT, v_employee_type_id, v_employee_status_id, CURRENT_TIMESTAMP, v_audit_action, 'source_load');
    END IF;
    

    
    -- insert all the gathered information into the employee histories table
    INSERT INTO employee_histories (history_date, history_source, employee_id,employee_number,title,first_name,middle_name,last_name,gender,SSN,birth_date,marital_status_id,marital_status_code,
                     marital_status_name,employment_status_id,employment_status_code,employment_status_name,hire_date,rehire_date,termination_date,term_reason_id,term_reason_code,
                     term_reason_name,term_type_id,term_type_code,term_type_name,job_id,job_code,job_title,job_start_date,job_end_date,pay_amount,
                     standard_hours,employee_type_id,employee_type_code,employee_type_name,employee_status_id,employee_status_code,
                     employee_status_name,department_id,department_code,department_name,location_id,location_code,location_name,
                     pay_frequency_id,pay_frequency_code,pay_frequency_name,pay_type_id,pay_type_code,pay_type_name,
                     supervisor_job_id,supervisor_job_code,supervisor_job_name,supervisor_name)
    VALUES (CURRENT_TIMESTAMP, 'source_load', v_emp_id, v_emp.employee_number, v_emp.title, v_emp.first_name, v_emp.middle_name, v_emp.last_name, v_emp.gender, v_emp.ssn, v_emp.birthdate,
            v_marital_status_id, v_marital_status_code, v_marital_status_name, v_employment_status_id, v_employment_status_code, v_employment_status_name, v_emp.orig_hire_date, v_emp.rehire_date, 
            v_emp.term_date, v_term_reason_id, v_term_reason_code, v_term_reason_name, v_term_type_id, v_term_type_code, v_term_type_name, v_job_id, 
            v_job_code, v_job_name, v_emp.job_st_date, v_emp.job_end_date, v_emp.pay_amount, v_emp.standard_hours::INT, v_employee_type_id, v_employee_type_code, v_employee_type_name, 
            v_employee_status_id, v_employee_status_code, v_employee_status_name, v_dept_id, v_dept_code, v_dept_name, v_loc_id, v_loc_code, v_loc_name,
            v_pay_freq_id, v_pay_freq_code, v_pay_freq_name, v_pay_type_id, v_pay_type_code, v_pay_type_name, v_sup_job_id, v_sup_job_code, v_sup_job_name, v_sup_name);


    
    --
    -- load addresses
    --
    
    -- add/update home addresses
    SELECT a.id
    INTO v_home_addr_id 
    FROM 
      emp_addresses a,
      address_types atype
    WHERE a.type_id = atype.id
      AND atype.code = 'HOME'
      AND a.employee_id = v_emp_id;
      
    SELECT id 
    INTO v_home_prov_id
    FROM provinces 
    WHERE UPPER(name) = UPPER(v_emp.home_state);
    
    SELECT id 
    INTO v_home_country_id
    FROM countries 
    WHERE UPPER(name) = UPPER(v_emp.home_country);
                          
    SELECT id 
    INTO v_home_addr_type_id
    FROM address_types 
    WHERE code = 'HOME';
   
    IF v_home_prov_id IS NOT NULL AND v_home_country_id IS NOT NULL THEN 
      IF v_home_addr_id IS NULL THEN 
        INSERT INTO emp_addresses(employee_id, street, city, province_id, country_id, postal_code, type_id) 
        VALUES(v_emp_id, v_emp.home_street_num || ' ' || v_emp.home_street_addr || ' ' || v_emp.home_street_suffix, 
               v_emp.home_city, v_home_prov_id, v_home_country_id, v_emp.home_zip_code, v_home_addr_type_id);
      ELSE 
        UPDATE emp_addresses
        SET street = v_emp.home_street_num || ' ' || v_emp.home_street_addr || ' ' || v_emp.home_street_suffix, 
            city = v_emp.home_city,
            province_id = v_home_prov_id, 
            country_id = v_home_country_id, 
            postal_code = v_emp.home_zip_code
        WHERE id = v_home_addr_id;            
      END IF;
    ELSE 
      RAISE NOTICE 'home province or country not found. Province id: %, Country id: %', v_home_prov_id, v_home_country_id;
    END IF; 
    
    
     -- add/update business addresses
    SELECT a.id
    INTO v_bus_addr_id 
    FROM 
      emp_addresses a,
      address_types atype
    WHERE a.type_id = atype.id
      AND atype.code = 'BUS'
      AND a.employee_id = v_emp_id;
      
    SELECT id 
    INTO v_bus_prov_id
    FROM provinces 
    WHERE UPPER(name) = UPPER(v_emp.bus_state);
    
    SELECT id 
    INTO v_bus_country_id
    FROM countries 
    WHERE UPPER(name) = UPPER(v_emp.bus_country);
                          
    SELECT id 
    INTO v_bus_addr_type_id
    FROM address_types 
    WHERE code = 'BUS'; 
     
    IF v_bus_prov_id IS NOT NULL AND v_bus_country_id IS NOT NULL THEN 
      IF v_bus_addr_id IS NULL THEN 
        INSERT INTO emp_addresses(employee_id, street, city, province_id, country_id, postal_code, type_id) 
        VALUES(v_emp_id, v_emp.bus_street_num || ' ' || v_emp.bus_street_addr || ' ' || v_emp.bus_street_suffix, 
               v_emp.bus_city, v_bus_prov_id, v_bus_country_id, v_emp.bus_zip_code, v_bus_addr_type_id);
      ELSE 
        UPDATE emp_addresses
        SET street = v_emp.bus_street_num || ' ' || v_emp.bus_street_addr || ' ' || v_emp.bus_street_suffix, 
            city = v_emp.bus_city,
            province_id = v_bus_prov_id, 
            country_id = v_bus_country_id, 
            postal_code = v_emp.bus_zip_code
        WHERE id = v_bus_addr_id;      
      END IF;      
    ELSE 
      RAISE NOTICE 'Bussiness province or country not found. Province id: %, Country id: %', v_bus_prov_id, v_bus_country_id;
    END IF;  



    -- 
    -- remove any existing phone numbers for this employee
    --
    DELETE FROM phone_numbers 
    WHERE employee_id = v_emp_id; 
    
    --
    --  load employee phone numbers
    --
    PERFORM load_phone_numbers(v_emp_id,v_emp.ph1_cc,v_emp.ph1_area,v_emp.ph1_number,v_emp.ph1_extension,v_emp.ph1_type);
    PERFORM load_phone_numbers(v_emp_id,v_emp.ph2_cc,v_emp.ph2_area,v_emp.ph2_number,v_emp.ph2_extension,v_emp.ph2_type);
    PERFORM load_phone_numbers(v_emp_id,v_emp.ph3_cc,v_emp.ph3_area,v_emp.ph3_number,v_emp.ph3_extension,v_emp.ph3_type);
    PERFORM load_phone_numbers(v_emp_id,v_emp.ph4_cc,v_emp.ph4_area,v_emp.ph4_number,v_emp.ph4_extension,v_emp.ph4_type);
             
   
                
  END LOOP;
  
END;
$$ LANGUAGE plpgsql;



-- Disabling the triggers and load 
DO $$
BEGIN 
  
  PERFORM set_config('session.trigs_enabled', 'N', FALSE);
  PERFORM load_employees();
  PERFORM set_config('session.trigs_enabled', 'Y', FALSE);

END; $$ LANGUAGE plpgsql;


SELECT * FROM audit_employees;
SELECT * FROM audit_emp_jobs;
SELECT * FROM employee_histories;


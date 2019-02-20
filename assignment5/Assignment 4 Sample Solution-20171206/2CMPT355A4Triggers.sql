-- Solution for 2017 Term 1 CMPT355 Assignment 4
-- Author: Ellen Redlick
-- Modified: Lujie Duan



-- Part 2: Triggers
DROP TRIGGER IF EXISTS aft_ins_upd_del_employees ON employees;
DROP TRIGGER IF EXISTS aft_ins_upd_del_emp_jobs ON employee_jobs;
DROP TRIGGER IF EXISTS aft_upd_employees_hist ON employees;
DROP TRIGGER IF EXISTS aft_ins_upd_emp_jobs_hist ON employee_jobs;


SELECT set_config('session.trigs_enabled', 'Y', FALSE);


CREATE OR REPLACE FUNCTION audit_employees()
RETURNS TRIGGER 
AS $$
DECLARE 
  v_audit_action CHAR(1);
  v_trig_enabled CHAR(1);
BEGIN
  SELECT COALESCE(current_setting('session.trigs_enabled'), set_config('session.trigs_enabled', 'N', FALSE)) 
  INTO v_trig_enabled; 
  
  IF v_trig_enabled THEN 
    IF (TG_OP = 'DELETE') THEN 
      v_audit_action := 'D';
      INSERT INTO audit_employees (employee_id,employee_number,title,first_name,middle_name,last_name,gender,SSN,birth_date,marital_status_id,
                                 home_email,employment_status_id,hire_date,rehire_date,termination_date,term_reason_id,term_type_id,
                                 audit_date,audit_action,audit_user)
      VALUES (OLD.id, OLD.employee_number, OLD.title, OLD.first_name, OLD.middle_name, OLD.last_name, OLD.gender, OLD.SSN, OLD.birth_date,
              OLD.marital_status_id, OLD.home_email, OLD.employment_status_id, OLD.hire_date, OLD.rehire_date, OLD.termination_date, OLD.term_reason_id, 
              OLD.term_type_id, CURRENT_TIMESTAMP, v_audit_action, user);
    ELSE
      IF (TG_OP = 'UPDATE') THEN 
        v_audit_action := 'U';
      ELSIF (TG_OP = 'INSERT') THEN 
        v_audit_action := 'I';
      END IF;
      INSERT INTO audit_employees (employee_id,employee_number,title,first_name,middle_name,last_name,gender,SSN,birth_date,marital_status_id,
                                 home_email,employment_status_id,hire_date,rehire_date,termination_date,term_reason_id,term_type_id,
                                 audit_date,audit_action,audit_user)
      VALUES (NEW.id, NEW.employee_number, NEW.title, NEW.first_name, NEW.middle_name, NEW.last_name, NEW.gender, NEW.SSN, NEW.birth_date,
              NEW.marital_status_id, NEW.home_email, NEW.employment_status_id, NEW.hire_date, NEW.rehire_date, NEW.termination_date, NEW.term_reason_id, 
              NEW.term_type_id, CURRENT_TIMESTAMP, v_audit_action, user);
    END IF;
  END IF;
  RETURN NULL;
END; $$ LANGUAGE plpgsql;


CREATE TRIGGER aft_ins_upd_del_employees AFTER INSERT OR UPDATE OR DELETE
ON employees 
FOR EACH ROW 
EXECUTE PROCEDURE audit_employees();

CREATE OR REPLACE FUNCTION audit_emp_jobs()
RETURNS TRIGGER 
AS $$
DECLARE 
  v_audit_action CHAR(1);
  v_trig_enabled CHAR(1);
BEGIN

  SELECT COALESCE(current_setting('session.trigs_enabled'), set_config('session.trigs_enabled', 'N', FALSE)) 
  INTO v_trig_enabled; 
  
  IF v_trig_enabled THEN 
    IF (TG_OP = 'DELETE') THEN 
      v_audit_action := 'D';
      INSERT INTO audit_emp_jobs (emp_job_id, employee_id, job_id, effective_date, expiry_date, pay_amount, standard_hours, employee_type_id, 
                                  employee_status_id, audit_date, audit_action, audit_user)
      VALUES (OLD.id, OLD.employee_id, OLD.job_id, OLD.effective_date, OLD.expiry_date, OLD.pay_amount, OLD.standard_hours, OLD.employee_type_id,
              OLD.employee_status_id, CURRENT_TIMESTAMP, v_audit_action, user);
    ELSE
      IF (TG_OP = 'UPDATE') THEN 
        v_audit_action := 'U';
      ELSIF (TG_OP = 'INSERT') THEN 
        v_audit_action := 'I';
      END IF;
      INSERT INTO audit_emp_jobs (emp_job_id, employee_id, job_id, effective_date, expiry_date, pay_amount, standard_hours, employee_type_id, 
                                  employee_status_id, audit_date, audit_action, audit_user)
      VALUES (NEW.id, NEW.employee_id, NEW.job_id, NEW.effective_date, NEW.expiry_date, NEW.pay_amount, NEW.standard_hours, NEW.employee_type_id,
              NEW.employee_status_id, CURRENT_TIMESTAMP, v_audit_action, user);
    END IF;
  END IF;
  RETURN NULL;
  
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER aft_ins_upd_del_emp_jobs AFTER INSERT OR UPDATE OR DELETE
ON employee_jobs 
FOR EACH ROW 
EXECUTE PROCEDURE audit_emp_jobs();



/*
 *  employee history tables triggers 
 * 
 */
CREATE OR REPLACE FUNCTION employee_history_emp()
RETURNS TRIGGER 
AS $$
DECLARE 
  v_trig_enabled CHAR(1);
  ej_rec RECORD;
  sup_job RECORD;
  
  v_mar_stat_code VARCHAR(5);
  v_mar_stat_name VARCHAR(20);
  v_empmt_stat_code VARCHAR(10);
  v_empmt_stat_name VARCHAR(20);
  v_term_reason_code VARCHAR(10);
  v_term_reason_name VARCHAR(30);
  v_term_type_code VARCHAR(10);
  v_term_type_name VARCHAR(30);
  v_job_id INT;
  v_job_code VARCHAR(10);
  v_job_name VARCHAR(20);
  v_job_st_date DATE;
  v_job_end_date DATE;
  v_pay_amount NUMERIC;
  v_standard_hours NUMERIC;
  v_emp_type_id INT;
  v_emp_type_code VARCHAR(10);
  v_emp_type_name VARCHAR(20);
  v_emp_st_id INT;
  v_emp_st_code VARCHAR(10);
  v_emp_st_name VARCHAR(20);
  v_dept_id INT;
  v_dept_code VARCHAR(10);
  v_dept_name VARCHAR(20);
  v_loc_id INT;
  v_loc_code VARCHAR(10);
  v_loc_name VARCHAR(20);
  v_pay_freq_id INT;
  v_pay_freq_code VARCHAR(10);
  v_pay_freq_name VARCHAR(20);
  v_pay_type_id INT;
  v_pay_type_code VARCHAR(10);
  v_pay_type_name VARCHAR(20);
  v_sup_job_id INT;
  v_sup_job_code VARCHAR(10);
  v_sup_job_name VARCHAR(30);
  v_sup_name VARCHAR(50);
BEGIN
  SELECT COALESCE(current_setting('session.trigs_enabled'), set_config('session.trigs_enabled', 'N', FALSE)) 
  INTO v_trig_enabled; 
  
  IF v_trig_enabled THEN 
    --
    -- find the employee's current supplemental information to insert into employee histories 
    -- 
    
    -- get marital status 
    SELECT code, name
    INTO v_mar_stat_code, v_mar_stat_name
    FROM marital_statuses 
    WHERE id = NEW.marital_status_id;
    
    SELECT code, name 
    INTO v_empmt_stat_code, v_empmt_stat_name
    FROM employment_status_types
    WHERE id = NEW.employment_status_id;
    
    SELECT code, name 
    INTO v_term_reason_code, v_term_reason_name
    FROM termination_reasons 
    WHERE id = NEW.term_reason_id;
    
    SELECT code, name 
    INTO v_term_type_code, v_term_type_name
    FROM termination_types 
    WHERE id = NEW.term_type_id;
    
    -- find the most recent employee job record - note: it's possible this job could be expired if the employee was just terminated. 
    FOR ej_rec IN (SELECT 
                     ej.id, 
                     ej.job_id, 
                     j.code job_code, 
                     j.name job_name, 
                     ej.effective_date job_eff_dt,
                     ej.expiry_date job_exp_dt,
                     ej.pay_amount,
                     ej.standard_hours,
                     et.id emp_type_id,
                     et.code emp_type_code,
                     et.name emp_type_name,
                     es.id emp_status_id, 
                     es.code emp_status_code, 
                     es.name emp_status_name, 
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
                     pt.name pay_type_name,
                     j.supervisor_job_id
                   FROM 
                     employee_jobs ej, 
                     jobs j,
                     employee_types et, 
                     employee_statuses es, 
                     departments d,
                     locations l, 
                     pay_frequencies pf, 
                     pay_types pt
                   WHERE ej.employee_id = NEW.id 
                     AND ej.job_id = j.id 
                     AND ej.employee_type_id = et.id 
                     AND ej.employee_status_id = es.id 
                     AND j.department_id = d.id
                     AND d.location_id = l.id 
                     AND ej.effective_date = (SELECT MAX(ej2.effective_date) 
                                              FROM employee_jobs ej2
                                              WHERE ej2.employee_id = ej.employee_id) ) LOOP
      v_job_id := ej_rec.job_id;
      v_job_code := ej_rec.job_code;
      v_job_name := ej_rec.job_name;
      v_job_st_date := ej_rec.job_eff_dt;
      v_job_end_date := ej_rec.job_exp_dt;
      v_pay_amount := ej_rec.pay_amount;
      v_standard_hours := ej_rec.standard_hours;
      v_emp_type_id := ej_rec.emp_type_id;
      v_emp_type_code := ej_rec.emp_type_code;
      v_emp_type_name := ej_rec.emp_type_name;
      v_emp_st_id := ej_rec.emp_status_id;
      v_emp_st_code := ej_rec.emp_status_code;
      v_emp_st_name := ej_rec.emp_status_name;
      v_dept_id := ej_rec.dept_id;
      v_dept_code := ej_rec.dept_code;
      v_dept_name := ej_rec.dept_name;
      v_loc_id := ej_rec.loc_id;
      v_loc_code := ej_rec.loc_code;
      v_loc_name := ej_rec.loc_name;
      v_pay_freq_id := ej_rec.pay_freq_id;
      v_pay_freq_code := ej_rec.pay_freq_code;
      v_pay_freq_name := ej_rec.pay_freq_name;
      v_pay_type_id := ej_rec.pay_type_id;
      v_pay_type_code := ej_rec.pay_type_code;
      v_pay_type_name := ej_rec.pay_type_name;
      v_sup_job_id := ej_rec.supervisor_job_id;
    END LOOP;
    
    IF v_job_id IS NULL THEN 
      RAISE EXCEPTION 'cannot insert employee histories record for employee %, cannot find employee job', NEW.id;
    END IF;
    
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
    
    -- insert all the gathered information into the employee histories table
    INSERT INTO employee_histories (history_date, history_source, employee_id,employee_number,title,first_name,middle_name,last_name,gender,SSN,birth_date,marital_status_id,marital_status_code,
                     marital_status_name,employment_status_id,employment_status_code,employment_status_name,hire_date,rehire_date,termination_date,term_reason_id,term_reason_code,
                     term_reason_name,term_type_id,term_type_code,term_type_name,job_id,job_code,job_title,job_start_date,job_end_date,pay_amount,
                     standard_hours,employee_type_id,employee_type_code,employee_type_name,employee_status_id,employee_status_code,
                     employee_status_name,department_id,department_code,department_name,location_id,location_code,location_name,
                     pay_frequency_id,pay_frequency_code,pay_frequency_name,pay_type_id,pay_type_code,pay_type_name,
                     supervisor_job_id,supervisor_job_code,supervisor_job_name,supervisor_name)
    VALUES (CURRENT_TIMESTAMP, user, NEW.id, NEW.employee_number, NEW.title, NEW.first_name, NEW.middle_name, NEW.last_name, NEW.gender, NEW.SSN, NEW.birth_date,
            NEW.marital_status_id, v_mar_stat_code, v_mar_stat_name, NEW.employment_status_id, v_empmt_stat_code, v_empmt_stat_name, NEW.hire_date, NEW.rehire_date, 
            NEW.termination_date, NEW.term_reason_id, v_term_reason_code, v_term_reason_name, NEW.term_type_id, v_term_type_code, v_term_type_name, v_job_id, 
            v_job_code, v_job_name, v_job_st_date, v_job_end_date, v_pay_amount, v_standard_hours, v_emp_type_id, v_emp_type_code, v_emp_type_name, v_emp_st_id,
            v_emp_st_code, v_emp_st_name, v_dept_id, v_dept_code, v_dept_name, v_loc_id, v_loc_code, v_loc_name, v_pay_freq_id,
            v_pay_freq_code, v_pay_freq_name, v_pay_type_id, v_pay_type_code, v_pay_type_name, v_sup_job_id, v_sup_job_code, v_sup_job_name, v_sup_name);

  END IF;
  RETURN NULL;
END; $$ LANGUAGE plpgsql;


CREATE TRIGGER aft_upd_employees_hist AFTER UPDATE 
ON employees 
FOR EACH ROW 
EXECUTE PROCEDURE employee_history_emp();



CREATE OR REPLACE FUNCTION emp_history_emp_jobs()
RETURNS TRIGGER 
AS $$
DECLARE
  v_trig_enabled CHAR(1);
  emp_rec RECORD;
  ej_rec RECORD;
  sup_job RECORD;
  
  v_employee_id INT;
  v_employee_number VARCHAR(30);
  v_title VARCHAR(5);
  v_fname VARCHAR(50);
  v_mname VARCHAR(50);
  v_lname VARCHAR(50);
  v_gender VARCHAR(2);
  v_ssn CHAR(9);
  v_birth_date DATE;
  v_hire_date DATE;
  v_rehire_date DATE;
  v_termination_date DATE;
  v_mar_stat_id INT;
  v_mar_stat_code VARCHAR(5);
  v_mar_stat_name VARCHAR(20);
  v_empmt_stat_id INT;
  v_empmt_stat_code VARCHAR(10);
  v_empmt_stat_name VARCHAR(20);
  v_term_reason_id INT;
  v_term_reason_code VARCHAR(10);
  v_term_reason_name VARCHAR(30);
  v_term_type_id INT;
  v_term_type_code VARCHAR(10);
  v_term_type_name VARCHAR(30);
  v_job_id INT;
  v_job_code VARCHAR(10);
  v_job_name VARCHAR(200);
  v_job_st_date DATE;
  v_job_end_date DATE;
  v_pay_amount NUMERIC;
  v_standard_hours NUMERIC;
  v_emp_type_id INT;
  v_emp_type_code VARCHAR(10);
  v_emp_type_name VARCHAR(20);
  v_emp_st_id INT;
  v_emp_st_code VARCHAR(10);
  v_emp_st_name VARCHAR(20);
  v_dept_id INT;
  v_dept_code VARCHAR(10);
  v_dept_name VARCHAR(20);
  v_loc_id INT;
  v_loc_code VARCHAR(10);
  v_loc_name VARCHAR(200);
  v_pay_freq_id INT;
  v_pay_freq_code VARCHAR(10);
  v_pay_freq_name VARCHAR(20);
  v_pay_type_id INT;
  v_pay_type_code VARCHAR(10);
  v_pay_type_name VARCHAR(20);
  v_sup_job_id INT;
  v_sup_job_code VARCHAR(10);
  v_sup_job_name VARCHAR(300);
  v_sup_name VARCHAR(50);
BEGIN
  SELECT COALESCE(current_setting('session.trigs_enabled'), set_config('session.trigs_enabled', 'N', FALSE)) 
  INTO v_trig_enabled; 
  
  IF v_trig_enabled THEN 
    --
    -- find the employee's current supplemental information to insert into employee histories 
    -- 
    FOR emp_rec IN (SELECT 
                      e.id employee_id, 
                      e.employee_number, 
                      e.title,
                      e.first_name,
                      e.middle_name,
                      e.last_name,
                      e.gender, 
                      e.ssn, 
                      e.birth_date,
                      e.marital_status_id,
                      ms.code mar_stat_code,
                      ms.name mar_stat_name,
                      e.employment_status_id,
                      est.code emp_status_code,
                      est.name emp_status_name, 
                      e.hire_date,
                      e.rehire_date,
                      e.termination_date, 
                      e.term_reason_id, 
                      tr.code term_reason_code,
                      tr.name term_reason_name, 
                      e.term_type_id,
                      tt.code term_type_code, 
                      tt.name term_type_name
                    FROM 
                      employees e, 
                      marital_statuses ms, 
                      employment_status_types est,
                      termination_reasons tr,
                      termination_types tt
                    WHERE e.id = NEW.employee_id 
                      AND e.marital_status_id = ms.id
                      AND (e.term_reason_id = tr.id OR e.term_reason_id IS NULL) 
                      AND (e.term_type_id = tt.id OR e.term_type_id IS NULL)
                      AND e.employment_status_id = est.id) LOOP
      v_employee_id := emp_rec.employee_id;
      v_employee_number := emp_rec.employee_number;
      v_title := emp_rec.title;
      v_fname := emp_rec.first_name;
      v_mname := emp_rec.middle_name;
      v_lname := emp_rec.last_name; 
      v_gender := emp_rec.gender;
      v_ssn := emp_rec.ssn;
      v_birth_date := emp_rec.birth_date; 
      v_mar_stat_id := emp_rec.marital_status_id;
      v_mar_stat_code := emp_rec.mar_stat_code;
      v_mar_stat_name := emp_rec.mar_stat_name;
      v_empmt_stat_id := emp_rec.employment_status_id;
      v_empmt_stat_code := emp_rec.emp_status_code;
      v_empmt_stat_name := emp_rec.emp_status_name;
      v_hire_date := emp_rec.hire_date;
      v_rehire_date := emp_rec.rehire_date;
      v_termination_date := emp_rec.termination_date;
      v_term_reason_id := emp_rec.term_reason_id;
      v_term_reason_code := emp_rec.term_reason_code;
      v_term_reason_name := emp_rec.term_reason_name; 
      v_term_type_id := emp_rec.term_type_id; 
      v_term_type_code := emp_rec.term_type_code;
      v_term_type_name := emp_rec.term_type_name; 
    END LOOP;
    
    -- find the most recent employee job record - note: it's possible this job could be expired if the employee was just terminated. 
    FOR ej_rec IN (SELECT 
                     j.code job_code, 
                     j.name job_name, 
                     et.code emp_type_code,
                     et.name emp_type_name, 
                     es.code emp_status_code, 
                     es.name emp_status_name, 
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
                     pt.name pay_type_name,
                     j.supervisor_job_id
                   FROM 
                     employee_jobs ej, 
                     jobs j,
                     employee_types et, 
                     employee_statuses es, 
                     departments d,
                     locations l, 
                     pay_frequencies pf, 
                     pay_types pt
                   WHERE ej.id = NEW.id 
                     AND ej.job_id = j.id 
                     AND ej.employee_type_id = et.id 
                     AND ej.employee_status_id = es.id 
                     AND j.department_id = d.id
                     AND d.location_id = l.id) LOOP
      v_job_code := ej_rec.job_code;
      v_job_name := ej_rec.job_name;
      v_emp_type_code := ej_rec.emp_type_code;
      v_emp_type_name := ej_rec.emp_type_name;
      v_emp_st_code := ej_rec.emp_status_code;
      v_emp_st_name := ej_rec.emp_status_name;
      v_dept_id := ej_rec.dept_id;
      v_dept_code := ej_rec.dept_code;
      v_dept_name := ej_rec.dept_name;
      v_loc_id := ej_rec.loc_id;
      v_loc_code := ej_rec.loc_code;
      v_loc_name := ej_rec.loc_name;
      v_pay_freq_id := ej_rec.pay_freq_id;
      v_pay_freq_code := ej_rec.pay_freq_code;
      v_pay_freq_name := ej_rec.pay_freq_name;
      v_pay_type_id := ej_rec.pay_type_id;
      v_pay_type_code := ej_rec.pay_type_code;
      v_pay_type_name := ej_rec.pay_type_name;
      v_sup_job_id := ej_rec.supervisor_job_id;
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
    
    -- insert all the gathered information into the employee histories table
    INSERT INTO employee_histories (history_date, history_source, employee_id,employee_number,title,first_name,middle_name,last_name,gender,SSN,birth_date,marital_status_id,marital_status_code,
                     marital_status_name,employment_status_id,employment_status_code,employment_status_name,hire_date,rehire_date,termination_date,term_reason_id,term_reason_code,
                     term_reason_name,term_type_id,term_type_code,term_type_name,job_id,job_code,job_title,job_start_date,job_end_date,pay_amount,
                     standard_hours,employee_type_id,employee_type_code,employee_type_name,employee_status_id,employee_status_code, 
                     employee_status_name,department_id,department_code,department_name,location_id,location_code,location_name,
                     pay_frequency_id,pay_frequency_code,pay_frequency_name,pay_type_id,pay_type_code,pay_type_name,
                     supervisor_job_id,supervisor_job_code,supervisor_job_name,supervisor_name)
    VALUES (CURRENT_TIMESTAMP, user, v_employee_id, v_employee_number, v_title, v_fname, v_mname, v_lname, v_gender, v_ssn, v_birth_date,
            v_mar_stat_id, v_mar_stat_code, v_mar_stat_name, v_empmt_stat_id, v_empmt_stat_code, v_empmt_stat_name, v_hire_date, v_rehire_date, 
            v_termination_date, v_term_reason_id, v_term_reason_code, v_term_reason_name, v_term_type_id, v_term_type_code, v_term_type_name, NEW.job_id, 
            v_job_code, v_job_name, NEW.effective_date, NEW.expiry_date, NEW.pay_amount, NEW.standard_hours, NEW.employee_type_id, v_emp_type_code,
            v_emp_type_name, NEW.employee_status_id, v_emp_st_code, v_emp_st_name, v_dept_id, v_dept_code, v_dept_name, 
            v_loc_id, v_loc_code, v_loc_name, v_pay_freq_id, v_pay_freq_code, v_pay_freq_name, v_pay_type_id, v_pay_type_code, 
            v_pay_type_name, v_sup_job_id, v_sup_job_code, v_sup_job_name, v_sup_name);

  END IF;
  RETURN NULL;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER aft_ins_upd_emp_jobs_hist AFTER INSERT OR UPDATE
ON employee_jobs 
FOR EACH ROW 
EXECUTE PROCEDURE emp_history_emp_jobs();


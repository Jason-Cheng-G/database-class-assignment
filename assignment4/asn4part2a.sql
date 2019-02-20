----Gong Cheng
----NSID goc558
----Student ID 11196838


 DROP TRIGGER IF EXISTS emp_audit ON employees;

 DROP TRIGGER IF EXISTS emp_jobs_audit ON employee_jobs;

 DROP TRIGGER IF EXISTS emp_history_on_employee_table ON employees;

 DROP TRIGGER IF EXISTS emp_history_on_employee_jobs_table ON employee_jobs;



-----Trigger function For emplyee audit table
CREATE OR REPLACE FUNCTION process_emp_audit() RETURNS TRIGGER AS $emp_audit$

DECLARE
v_trig_enabled VARCHAR(1);
BEGIN
	SELECT COALESCE(current_setting('session.trigs_enabled'), 'Y')
	INTO v_trig_enabled;
	IF v_trig_enabled = 'Y' THEN


		IF(TG_OP = 'DELETE') THEN
			INSERT INTO Employee_Audit(operartion,stamp,userid,employee_id,employee_number,title,first_name,middle_name,last_name,gender,
				ssn,birth_date,hire_date, rehire_date,termination_date, marital_status_id,home_email, employment_status_id,term_type_id,term_reason_id) 
			SELECT 'D',now(),user, OLD.*;
			RETURN OLD;
		ELSEIF(TG_OP = 'UPDATE') THEN
			INSERT INTO Employee_Audit(operartion,stamp,userid,employee_id,employee_number,title,first_name,middle_name,last_name,gender,
				ssn,birth_date,hire_date, rehire_date,termination_date, marital_status_id,home_email, employment_status_id,term_type_id,term_reason_id) 
			SELECT 'U',now(),user, NEW.*;
			RETURN OLD;
		ELSEIF(TG_OP = 'INSERT') THEN
             INSERT INTO Employee_Audit(operartion,stamp,userid,employee_id,employee_number,title,first_name,middle_name,last_name,gender,
			ssn,birth_date,hire_date, rehire_date,termination_date, marital_status_id,home_email, employment_status_id,term_type_id,term_reason_id) 			
             SELECT 'I',now(),user, NEW.*;
			RETURN NEW;
		END IF;
	END IF;
	RETURN NULL;
END; $emp_audit$ LANGUAGE plpgsql;

------- Apply trigger function
CREATE TRIGGER emp_audit
AFTER INSERT OR UPDATE OR DELETE ON employees
	FOR EACH ROW EXECUTE PROCEDURE process_emp_audit();


-----Trigger function For emplyee job audit table
CREATE OR REPLACE FUNCTION process_emp_job_audit() RETURNS TRIGGER AS $emp_job_audit$
DECLARE
v_trig_enabled VARCHAR(1);
BEGIN
	SELECT COALESCE(current_setting('session.trigs_enabled'), 'Y')
	INTO v_trig_enabled;
	IF v_trig_enabled = 'Y' THEN


		IF(TG_OP = 'DELETE') THEN
			INSERT INTO Employee_Job_Audit(operartion,stamp,userid,emplyee_job_id,employee_id,job_id,effective_date,expiry_date,pay_amount,
				standard_hours,employee_type_id,employee_status_id) 
			SELECT 'D',now(),user, OLD.*;
			RETURN OLD;
		ELSEIF(TG_OP = 'UPDATE') THEN
			INSERT INTO Employee_Job_Audit(operartion,stamp,userid,emplyee_job_id,employee_id,job_id,effective_date,expiry_date,pay_amount,
				standard_hours,employee_type_id,employee_status_id) 
			SELECT 'U',now(),user, NEW.*;
			RETURN OLD;
		ELSEIF(TG_OP = 'INSERT') THEN
			INSERT INTO Employee_Job_Audit(operartion,stamp,userid,emplyee_job_id,employee_id,job_id,effective_date,expiry_date,pay_amount,
			     standard_hours,employee_type_id,employee_status_id) 
			SELECT 'I',now(),user, NEW.*;
			RETURN NEW;
		END IF;
	END IF;
	RETURN NULL;
END;
$emp_job_audit$ LANGUAGE plpgsql;

------- Apply trigger function
CREATE TRIGGER emp_jobs_audit
AFTER INSERT OR UPDATE OR DELETE ON employee_jobs
	FOR EACH ROW EXECUTE PROCEDURE process_emp_job_audit();


------- Trigger function for employee to Update employee history table
CREATE OR REPLACE FUNCTION update_emplyee_history_employee_table() 
RETURNS TRIGGER AS $$
DECLARE
v_trig_enabled VARCHAR(1);
BEGIN
	SELECT COALESCE(current_setting('session.trigs_enabled'), 'Y')
	INTO v_trig_enabled;
	IF v_trig_enabled = 'Y' THEN

	IF TG_OP = 'UPDATE' AND NEW.first_name <> OLD.first_name OR NEW.middle_name <> OLD.middle_name OR 
		NEW.last_name <> OLD.last_name OR NEW.gender <> OLD.gender OR NEW.ssn <> OLD.gender OR 
		NEW.birth_date <> OLD.birth_date OR NEW.marital_status_id <> OLD.marital_status_id OR NEW.hire_date <> OLD.hire_date 
		OR NEW.rehire_date <> OLD.rehire_date OR NEW.termination_date <> OLD.termination_date OR NEW.term_reason_id <> OLD.term_reason_id
		OR NEW.term_type_id <> OLD.term_type_id OR NEW.employment_status_id <> OLD.employment_status_id
	THEN
			IF (NEW.term_type_id IS NULL) AND (NEW.term_reason_id IS NULL)					
			THEN
			INSERT INTO employee_history(
										    stamp,first_name ,middle_name,last_name ,gender ,ssn ,birth_date ,marital_status_id,marital_status_code,
											marital_status_name ,
											employee_status_id,employee_status_code,employee_status_name,hire_date,rehire_date,termination_date , 
										    term_reason_id,termination_reason_code,termination_reason_name,term_type_id,term_type_code,
											term_type_name,

											job_code,job_title,emp_job_start_date,emp_job_end_date,pay_amount,standard_hours,employee_type_id,
											employee_type_code,employee_type_name,

											employment_status_id,employment_status_code,employment_status_name,

											department_code ,department_name ,locaton_code ,locaton_name ,

											pay_frequency_id,pay_frequency_code,pay_frequency_name,

											pay_type_id ,pay_type_code,pay_type_name )

			SELECT  now(), NEW.first_name, NEW.middle_name, NEW.last_name, NEW.gender, NEW.ssn, NEW.birth_date, NEW.marital_status_id,m.code,
					m.name,
			        ej.employee_status_id,es.code, es.name, NEW.hire_date, NEW.rehire_date, NEW.termination_date,NEW.term_reason_id,NULL,NULL, NEW.term_type_id,
			        NULL,NULL, 

			        j.code,j.name, ej.effective_date, ej.expiry_date, ej.pay_amount, ej.standard_hours, ej.employee_type_id, et.code, et.name,

			        New.employment_status_id, est.code, est.name,

			        d.code, d.name, l.code,l.name,

			        j.pay_frequency_id,pf.code,pf.name,

			        j.pay_type_id, pt.code, pt.name


			FROM marital_statuses m,  employee_jobs ej, employee_statuses es,   jobs j, employee_types et, employment_status_types est,
			     departments d, locations l, pay_frequencies pf, pay_types pt
			WHERE m.id = NEW.marital_status_id AND ej.employee_id = NEW.id AND es.id = ej.employee_status_id   AND
				j.id = ej.job_id AND et.id = ej.employee_type_id AND est.id = NEW.employment_status_id AND d.id = j.department_id AND l.id = d.location_id AND 
				pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id;


			ELSEIF (NEW.term_type_id IS NOT NULL) AND (NEW.term_reason_id IS NULL)    
			     THEN
									INSERT INTO employee_history(
										    stamp,first_name ,middle_name,last_name ,gender ,ssn ,birth_date ,marital_status_id,marital_status_code,
											marital_status_name ,
											employee_status_id,employee_status_code,employee_status_name,hire_date,rehire_date,termination_date , 
										    term_reason_id,termination_reason_code,termination_reason_name,term_type_id,term_type_code,
											term_type_name,

											job_code,job_title,emp_job_start_date,emp_job_end_date,pay_amount,standard_hours,employee_type_id,
											employee_type_code,employee_type_name,

											employment_status_id,employment_status_code,employment_status_name,

											department_code ,department_name ,locaton_code ,locaton_name ,

											pay_frequency_id,pay_frequency_code,pay_frequency_name,

											pay_type_id ,pay_type_code,pay_type_name )

			SELECT  now(), NEW.first_name, NEW.middle_name, NEW.last_name, NEW.gender, NEW.ssn, NEW.birth_date, NEW.marital_status_id,m.code,
					m.name,
			        ej.employee_status_id,es.code, es.name, NEW.hire_date, NEW.rehire_date, NEW.termination_date,NEW.term_reason_id,NULL,NULL, NEW.term_type_id,
			        tt.code,tt.name, 

			        j.code,j.name, ej.effective_date, ej.expiry_date, ej.pay_amount, ej.standard_hours, ej.employee_type_id, et.code, et.name,

			        New.employment_status_id, est.code, est.name,

			        d.code, d.name, l.code,l.name,

			        j.pay_frequency_id,pf.code,pf.name,

			        j.pay_type_id, pt.code, pt.name


			FROM marital_statuses m,  employee_jobs ej, employee_statuses es,  termination_types tt, jobs j, employee_types et, employment_status_types est,
			     departments d, locations l, pay_frequencies pf, pay_types pt
			WHERE m.id = NEW.marital_status_id AND ej.employee_id = NEW.id AND es.id = ej.employee_status_id  AND tt.id = NEW.term_type_id AND
				j.id = ej.job_id AND et.id = ej.employee_type_id AND est.id = NEW.employment_status_id AND d.id = j.department_id AND l.id = d.location_id AND 
				pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id;
			ELSEIF (NEW.term_type_id IS NOT NULL) AND (NEW.term_reason_id IS NOT NULL)  
			THEN

						INSERT INTO employee_history(
										    stamp,first_name ,middle_name,last_name ,gender ,ssn ,birth_date ,marital_status_id,marital_status_code,
											marital_status_name ,
											employee_status_id,employee_status_code,employee_status_name,hire_date,rehire_date,termination_date , 
										    term_reason_id,termination_reason_code,termination_reason_name,term_type_id,term_type_code,
											term_type_name,

											job_code,job_title,emp_job_start_date,emp_job_end_date,pay_amount,standard_hours,employee_type_id,
											employee_type_code,employee_type_name,

											employment_status_id,employment_status_code,employment_status_name,

											department_code ,department_name ,locaton_code ,locaton_name ,

											pay_frequency_id,pay_frequency_code,pay_frequency_name,

											pay_type_id ,pay_type_code,pay_type_name )

			SELECT  now(), NEW.first_name, NEW.middle_name, NEW.last_name, NEW.gender, NEW.ssn, NEW.birth_date, NEW.marital_status_id,m.code,
					m.name,
			        ej.employee_status_id,es.code, es.name, NEW.hire_date, NEW.rehire_date, NEW.termination_date,NEW.term_reason_id,tr.code,tr.name, NEW.term_type_id,
			        tt.code,tt.name, 

			        j.code,j.name, ej.effective_date, ej.expiry_date, ej.pay_amount, ej.standard_hours, ej.employee_type_id, et.code, et.name,

			        New.employment_status_id, est.code, est.name,

			        d.code, d.name, l.code,l.name,

			        j.pay_frequency_id,pf.code,pf.name,

			        j.pay_type_id, pt.code, pt.name


			FROM marital_statuses m,  employee_jobs ej, employee_statuses es, termination_reasons tr, termination_types tt, jobs j, employee_types et, employment_status_types est,
			     departments d, locations l, pay_frequencies pf, pay_types pt
			WHERE m.id = NEW.marital_status_id AND ej.employee_id = NEW.id AND es.id = ej.employee_status_id AND tr.id = NEW.term_reason_id  AND tt.id = NEW.term_type_id AND
				j.id = ej.job_id AND et.id = ej.employee_type_id AND est.id = NEW.employment_status_id AND d.id = j.department_id AND l.id = d.location_id AND 
				pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id;
			END IF;


END IF;

END IF;
RETURN NULL;
END; $$ LANGUAGE plpgsql;



CREATE TRIGGER emp_history_on_employee_table
AFTER UPDATE 
	ON employees
	FOR EACH ROW 
	EXECUTE PROCEDURE update_emplyee_history_employee_table();



CREATE OR REPLACE FUNCTION update_emplyee_history_employee_jobs_table() 
RETURNS TRIGGER AS $$

DECLARE
v_trig_enabled VARCHAR(1);
v_termination_type_id INT;
v_termination_reason_id INT;
BEGIN

SELECT COALESCE(current_setting('session.trigs_enabled'), 'Y')
INTO v_trig_enabled;
IF v_trig_enabled = 'Y' THEN

    SELECT e.term_reason_id, e.term_type_id
    INTO v_termination_reason_id, v_termination_type_id
    FROM employees e
    WHERE e.id = NEW.employee_id;
   

	IF (TG_OP = 'UPDATE' ) 
	THEN
		IF (NEW.employee_id <> OLD.employee_id OR NEW.job_id <> OLD.job_id OR 
			NEW.effective_date <> OLD.effective_date OR NEW.expiry_date <> OLD.expiry_date OR NEW.standard_hours <> OLD.standard_hours OR 
			NEW.employee_type_id <> OLD.employee_type_id OR NEW.employee_status_id <> OLD.employee_status_id)
		THEN
		    IF (v_termination_type_id IS NULL) AND (v_termination_reason_id IS NULL)
			THEN
				INSERT INTO employee_history(
											    stamp,first_name ,middle_name,last_name ,gender ,ssn ,birth_date ,marital_status_id,marital_status_code,
												marital_status_name ,
												employee_status_id,employee_status_code,employee_status_name,hire_date,rehire_date,termination_date , 
											    term_reason_id,termination_reason_code,termination_reason_name,term_type_id,term_type_code,
												term_type_name,

												job_code,job_title,emp_job_start_date,emp_job_end_date,pay_amount,standard_hours,employee_type_id,
												employee_type_code,employee_type_name,

												employment_status_id,employment_status_code,employment_status_name,

												department_code ,department_name ,locaton_code ,locaton_name ,

												pay_frequency_id,pay_frequency_code,pay_frequency_name,

												pay_type_id ,pay_type_code,pay_type_name)


				SELECT  now(), e.first_name, e.middle_name, e.last_name, e.gender, e.ssn, e.birth_date, e.marital_status_id,m.code,
						m.name,
				        NEW.employee_status_id,es.code, es.name, e.hire_date, e.rehire_date, e.termination_date,e.term_reason_id,NULL,NULL, e.term_type_id,
				        NULL,NULL, 

				        j.code,j.name, NEW.effective_date, NEW.expiry_date, NEW.pay_amount, NEW.standard_hours, NEW.employee_type_id, et.code, et.name,

				        e.employment_status_id, est.code, est.name,

				        d.code, d.name, l.code,l.name,

				        j.pay_frequency_id,pf.code,pf.name,

				        j.pay_type_id, pt.code, pt.name


				FROM marital_statuses m,  employees e, employee_statuses es,  jobs j, employee_types et, employment_status_types est,
				     departments d, locations l, pay_frequencies pf, pay_types pt
				WHERE m.id = e.marital_status_id AND NEW.employee_id = e.id AND es.id = e.employment_status_id  AND
					j.id = NEW.job_id AND et.id = NEW.employee_type_id AND est.id = e.employment_status_id AND d.id = j.department_id AND l.id = d.location_id AND 
					pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id;


	    ELSEIF  (v_termination_type_id IS NOT NULL) AND (v_termination_reason_id IS NULL)      
	    THEN
			    INSERT INTO employee_history(
											    stamp,first_name ,middle_name,last_name ,gender ,ssn ,birth_date ,marital_status_id,marital_status_code,
												marital_status_name ,
												employee_status_id,employee_status_code,employee_status_name,hire_date,rehire_date,termination_date , 
											    term_reason_id,termination_reason_code,termination_reason_name,term_type_id,term_type_code,
												term_type_name,

												job_code,job_title,emp_job_start_date,emp_job_end_date,pay_amount,standard_hours,employee_type_id,
												employee_type_code,employee_type_name,

												employment_status_id,employment_status_code,employment_status_name,

												department_code ,department_name ,locaton_code ,locaton_name ,

												pay_frequency_id,pay_frequency_code,pay_frequency_name,

												pay_type_id ,pay_type_code,pay_type_name)


				SELECT  now(), e.first_name, e.middle_name, e.last_name, e.gender, e.ssn, e.birth_date, e.marital_status_id,m.code,
						m.name,
				        NEW.employee_status_id,es.code, es.name, e.hire_date, e.rehire_date, e.termination_date,e.term_reason_id,NULL,NULL, e.term_type_id,
				        tt.code,tt.name, 

				        j.code,j.name, NEW.effective_date, NEW.expiry_date, NEW.pay_amount, NEW.standard_hours, NEW.employee_type_id, et.code, et.name,

				        e.employment_status_id, est.code, est.name,

				        d.code, d.name,l.code,l.name,

				        j.pay_frequency_id,pf.code,pf.name,

				        j.pay_type_id, pt.code, pt.name


			FROM marital_statuses m,  employees e, employee_statuses es,  termination_types tt, jobs j, employee_types et, employment_status_types est,
			     departments d, locations l, pay_frequencies pf, pay_types pt
			WHERE m.id = e.marital_status_id AND NEW.employee_id = e.id AND es.id = e.employment_status_id AND tt.id = e.term_type_id AND
				j.id = NEW.job_id AND et.id = NEW.employee_type_id AND est.id = e.employment_status_id AND d.id = j.department_id AND l.id = d.location_id AND 
				pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id;


		ELSEIF (v_termination_type_id IS NOT NULL) AND (v_termination_reason_id IS NOT NULL)      
		THEN
		INSERT INTO employee_history(
									    stamp,first_name ,middle_name,last_name ,gender ,ssn ,birth_date ,marital_status_id,marital_status_code,
										marital_status_name ,
										employee_status_id,employee_status_code,employee_status_name,hire_date,rehire_date,termination_date , 
									    term_reason_id,termination_reason_code,termination_reason_name,term_type_id,term_type_code,
										term_type_name,

										job_code,job_title,emp_job_start_date,emp_job_end_date,pay_amount,standard_hours,employee_type_id,
										employee_type_code,employee_type_name,

										employment_status_id,employment_status_code,employment_status_name,

										department_code ,department_name ,locaton_code ,locaton_name ,

										pay_frequency_id,pay_frequency_code,pay_frequency_name,

										pay_type_id ,pay_type_code,pay_type_name)

				SELECT  now(), e.first_name, e.middle_name, e.last_name, e.gender, e.ssn, e.birth_date, e.marital_status_id,m.code,
						m.name,
				        NEW.employee_status_id,es.code, es.name, e.hire_date, e.rehire_date, e.termination_date,e.term_reason_id,tr.code,tr.name, e.term_type_id,
				        tt.code,tt.name, 

				        j.code,j.name, NEW.effective_date, NEW.expiry_date, NEW.pay_amount, NEW.standard_hours, NEW.employee_type_id, et.code, et.name,

				        e.employment_status_id, est.code, est.name,

				        d.code, d.name,l.code,l.name,

				        j.pay_frequency_id,pf.code,pf.name,

				        j.pay_type_id, pt.code, pt.name


				FROM marital_statuses m,  employees e, employee_statuses es, termination_reasons tr, termination_types tt, jobs j, employee_types et, employment_status_types est,
				     departments d, locations l, pay_frequencies pf, pay_types pt
				WHERE m.id = e.marital_status_id AND NEW.employee_id = e.id AND es.id = e.employment_status_id AND tr.id = e.term_reason_id AND tt.id = e.term_type_id AND
					j.id = NEW.job_id AND et.id = NEW.employee_type_id AND est.id = e.employment_status_id AND d.id = j.department_id AND l.id = d.location_id AND 
					pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id;
	END IF;

	END IF;

	ELSEIF TG_OP = 'INSERT'
	THEN
		IF (v_termination_type_id IS NULL) AND (v_termination_reason_id IS NULL)   
		THEN
				INSERT INTO employee_history(
											    stamp,first_name ,middle_name,last_name ,gender ,ssn ,birth_date ,marital_status_id,marital_status_code,
												marital_status_name ,
												employee_status_id,employee_status_code,employee_status_name,hire_date,rehire_date,termination_date , 
											    term_reason_id,termination_reason_code,termination_reason_name,term_type_id,term_type_code,
												term_type_name,

												job_code,job_title,emp_job_start_date,emp_job_end_date,pay_amount,standard_hours,employee_type_id,
												employee_type_code,employee_type_name,

												employment_status_id,employment_status_code,employment_status_name,

												department_code ,department_name ,locaton_code ,locaton_name ,

												pay_frequency_id,pay_frequency_code,pay_frequency_name,

												pay_type_id ,pay_type_code,pay_type_name)


			SELECT  now(), e.first_name, e.middle_name, e.last_name, e.gender, e.ssn, e.birth_date, e.marital_status_id,m.code,
					m.name,
			        NEW.employee_status_id,es.code, es.name, e.hire_date, e.rehire_date, e.termination_date,e.term_reason_id,NULL,NULL, e.term_type_id,
			        NULL,NULL, 

			        j.code,j.name, NEW.effective_date, NEW.expiry_date, NEW.pay_amount, NEW.standard_hours, NEW.employee_type_id, et.code, et.name,

			        e.employment_status_id, est.code, est.name,

			        d.code, d.name, l.code,l.name,

			        j.pay_frequency_id,pf.code,pf.name,

			        j.pay_type_id, pt.code, pt.name


			FROM marital_statuses m,  employees e, employee_statuses es,  jobs j, employee_types et, employment_status_types est,
			     departments d, locations l, pay_frequencies pf, pay_types pt
			WHERE m.id = e.marital_status_id AND NEW.employee_id = e.id AND es.id = e.employment_status_id  AND
				j.id = NEW.job_id AND et.id = NEW.employee_type_id AND est.id = e.employment_status_id AND d.id = j.department_id AND l.id = d.location_id AND 
				pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id;


		    ELSEIF  (v_termination_type_id IS NOT NULL) AND (v_termination_reason_id IS NULL)      
		    THEN
		    INSERT INTO employee_history(
										    stamp,first_name ,middle_name,last_name ,gender ,ssn ,birth_date ,marital_status_id,marital_status_code,
											marital_status_name ,
											employee_status_id,employee_status_code,employee_status_name,hire_date,rehire_date,termination_date , 
										    term_reason_id,termination_reason_code,termination_reason_name,term_type_id,term_type_code,
											term_type_name,

											job_code,job_title,emp_job_start_date,emp_job_end_date,pay_amount,standard_hours,employee_type_id,
											employee_type_code,employee_type_name,

											employment_status_id,employment_status_code,employment_status_name,

											department_code ,department_name ,locaton_code ,locaton_name ,

											pay_frequency_id,pay_frequency_code,pay_frequency_name,

											pay_type_id ,pay_type_code,pay_type_name)

			SELECT  now(), e.first_name, e.middle_name, e.last_name, e.gender, e.ssn, e.birth_date, e.marital_status_id,m.code,
					m.name,
			        NEW.employee_status_id,es.code, es.name, e.hire_date, e.rehire_date, e.termination_date,e.term_reason_id,NULL,NULL, e.term_type_id,
			        tt.code,tt.name, 

			        j.code,j.name, NEW.effective_date, NEW.expiry_date, NEW.pay_amount, NEW.standard_hours, NEW.employee_type_id, et.code, et.name,

			        e.employment_status_id, est.code, est.name,

			        d.code, d.name,l.code,l.name,

			        j.pay_frequency_id,pf.code,pf.name,

			        j.pay_type_id, pt.code, pt.name


			FROM marital_statuses m,  employees e, employee_statuses es,  termination_types tt, jobs j, employee_types et, employment_status_types est,
			     departments d, locations l, pay_frequencies pf, pay_types pt
			WHERE m.id = e.marital_status_id AND NEW.employee_id = e.id AND es.id = e.employment_status_id AND tt.id = e.term_type_id AND
				j.id = NEW.job_id AND et.id = NEW.employee_type_id AND est.id = e.employment_status_id AND d.id = j.department_id AND l.id = d.location_id AND 
				pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id;


			ELSEIF (v_termination_type_id IS NOT NULL) AND (v_termination_reason_id IS NOT NULL)      
			THEN
			INSERT INTO employee_history(
										    stamp,first_name ,middle_name,last_name ,gender ,ssn ,birth_date ,marital_status_id,marital_status_code,
											marital_status_name ,
											employee_status_id,employee_status_code,employee_status_name,hire_date,rehire_date,termination_date , 
										    term_reason_id,termination_reason_code,termination_reason_name,term_type_id,term_type_code,
											term_type_name,

											job_code,job_title,emp_job_start_date,emp_job_end_date,pay_amount,standard_hours,employee_type_id,
											employee_type_code,employee_type_name,

											employment_status_id,employment_status_code,employment_status_name,

											department_code ,department_name ,locaton_code ,locaton_name ,

											pay_frequency_id,pay_frequency_code,pay_frequency_name,

											pay_type_id ,pay_type_code,pay_type_name)

			SELECT  now(), e.first_name, e.middle_name, e.last_name, e.gender, e.ssn, e.birth_date, e.marital_status_id,m.code,
					m.name,
			        NEW.employee_status_id,es.code, es.name, e.hire_date, e.rehire_date, e.termination_date,e.term_reason_id,tr.code,tr.name, e.term_type_id,
			        tt.code,tt.name, 

			        j.code,j.name, NEW.effective_date, NEW.expiry_date, NEW.pay_amount, NEW.standard_hours, NEW.employee_type_id, et.code, et.name,

			        e.employment_status_id, est.code, est.name,

			        d.code, d.name,l.code,l.name,

			        j.pay_frequency_id,pf.code,pf.name,

			        j.pay_type_id, pt.code, pt.name


			FROM marital_statuses m,  employees e, employee_statuses es, termination_reasons tr, termination_types tt, jobs j, employee_types et, employment_status_types est,
			     departments d, locations l, pay_frequencies pf, pay_types pt
			WHERE m.id = e.marital_status_id AND NEW.employee_id = e.id AND es.id = e.employment_status_id AND tr.id = e.term_reason_id AND tt.id = e.term_type_id AND
				j.id = NEW.job_id AND et.id = NEW.employee_type_id AND est.id = e.employment_status_id AND d.id = j.department_id AND l.id = d.location_id AND 
				pf.id = j.pay_frequency_id AND pt.id = j.pay_type_id;

		END IF;

	END IF;
END IF;
RETURN NULL;
END; $$ LANGUAGE plpgsql;


CREATE TRIGGER emp_history_on_employee_jobs_table
AFTER INSERT OR UPDATE 
ON employee_jobs
FOR EACH ROW 
EXECUTE PROCEDURE update_emplyee_history_employee_jobs_table();




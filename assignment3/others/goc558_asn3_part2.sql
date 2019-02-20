-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION load_locations()
RETURNS void AS $$
DECLARE
  v_location RECORD;
  v_location_code VARCHAR(20);
BEGIN
	FOR v_location IN (SELECT 
							ll_location_code,
							ll_location_name,
							ll_street_addr,
   							ll_city,
     						ll_province,
     						ll_country,
     						ll_postal_code
     					FROM Load_locations) LOOP
	SELECT l_code 
	INTO v_location_code
	FROM Locations
	WHERE l_code = v_location.ll_location_code;

	IF v_location_code IS NULL THEN
		INSERT INTO Locations(l_id,l_code,l_name,l_addr,l_city,l_province,l_country)
		SELECT COALESCE(MAX(l_id)+1,0), v_location.ll_location_code,v_location.ll_location_name,v_location.ll_street_addr,v_location.ll_city,v_location.ll_province,v_location.ll_country
		FROM Locations;
	ELSE 
		UPDATE Locations
		SET	l_name=v_location.ll_location_name,
				l_addr=v_location.ll_street_addr,
				l_city=v_location.ll_city,
				l_province=v_location.ll_province,
				l_country= v_location.ll_country
		WHERE l_code = v_location_code;
	END IF;
	END LOOP;

END; $$ LANGUAGE plpgsql;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION load_employees()
RETURNS void AS $$
DECLARE
	v_employee RECORD;
	v_employee_number INTEGER;

BEGIN
	FOR v_employee IN ( SELECT
						    le_employee_id,
     						le_title,
     						le_first_name ,
     						le_last_name ,
     						le_gender,
						     le_birthdate,
						     le_marital_status ,
						     le_SSN,
						     le_home_email,
						     le_original_hire_date ,
						     le_rehire_date ,
						     le_term_date ,
						     le_term_type ,
						     le_term_reason ,
						     le_job_title ,
						     le_job_code,
						     le_job_start_date ,
						     le_job_end_date ,
						     le_supervisor_job_code,
						     le_employee_status,
						     le_employee_status_type,
						     le_last_performance_rating,
						     le_last_performance_rating_text ,
						     le_last_performance_rating_date
						 FROM Load_employees) LOOP

	SELECT e_employeeNumber 
	INTO v_employee_number
	FROM Employees 
	WHERE e_employeeNumber =CAST(v_employee.le_employee_id AS INTEGER);

	IF v_employee_number IS NULL THEN
		INSERT INTO Employees(e_id,e_employeeNumber,e_firstName,e_lastName,e_gender,e_SSN,e_hireDt,e_terminationDt,e_rehireDt,e_birthdate,e_marital_status,e_email_home,e_employ_status,e_l_performance_review_Text,e_l_performance_review_date,e_l_performance_review_rating)
		SELECT COALESCE(MAX(e_id)+1,0), CAST(v_employee.le_employee_id AS INTEGER),v_employee.le_first_name,v_employee.le_last_name,v_employee.le_gender,v_employee.le_SSN,CAST (v_employee.le_original_hire_date AS DATE),CAST (v_employee.le_term_date AS DATE),CAST(v_employee.le_rehire_date AS DATE),CAST(v_employee.le_birthdate AS DATE),v_employee.le_marital_status,v_employee.le_home_email,v_employee.le_employee_status_type,v_employee.le_last_performance_rating_text,CAST(v_employee.le_last_performance_rating_date AS DATE),v_employee.le_last_performance_rating
		FROM Employees;
	ELSE 
		UPDATE Employees
		SET	 		 e_firstName =  v_employee.le_first_name,
					 e_lastName	 =  v_employee.le_last_name	,
					 e_gender =		v_employee.le_gender,
					 e_SSN 	=	v_employee.le_SSN,
					 e_hireDt =		CAST (v_employee.le_original_hire_date AS DATE),
					 e_terminationDt =	CAST (v_employee.le_term_date AS DATE),
					 e_rehireDt  = CAST(v_employee.le_rehire_date AS DATE),
				 	 e_birthdate =    CAST(v_employee.le_birthdate AS DATE),
				 	 e_marital_status =         v_employee.le_marital_status  ,
				 	 e_email_home =      v_employee.le_home_email ,
					 e_employ_status =    v_employee.le_employee_status_type          ,
					 e_l_performance_review_Text =  v_employee.le_last_performance_rating_text,
					 e_l_performance_review_date = CAST(v_employee.le_last_performance_rating_date AS DATE),
					 e_l_performance_review_rating = v_employee.le_last_performance_rating   
		WHERE e_employeeNumber = v_employee_number;
	END IF;
	END LOOP;


END; $$ LANGUAGE plpgsql;
------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION load_departments_except_department_manager_job_id()
RETURNS void AS $$
DECLARE
  v_department RECORD;
  v_location RECORD;
  v_department_code VARCHAR(30);
  v_department_location_code VARCHAR(30);
  
BEGIN
	FOR v_department IN (SELECT 
							ld_department_code,
							ld_department_name,
							ld_department_manager_job_code,
   							ld_department_manager_job_title,
     						ld_department_eff_date,
     						ld_department_exp_date
     					FROM Load_departments) LOOP
    

			FOR v_location IN (SELECT
								l_id,
								l_code
								FROM Locations) LOOP
			IF EXISTS (SELECT le_department_code, le_location_code
						FROM Load_employees
						WHERE le_department_code = v_department.ld_department_code
		                AND le_location_code = v_location.l_code)
			THEN
				 SELECT d_code
				 INTO v_department_code
				 FROM Departments
				 WHERE d_code = v_department.ld_department_code
				   AND d_location_id = v_location.l_id; 

				 IF v_department_code IS NULL THEN
				 INSERT INTO Departments(d_id,d_code,d_name,d_manager_job_id,d_location_id)
				 SELECT COALESCE(MAX(d_id)+1,0), v_department.ld_department_code,v_department.ld_department_name, NULL ,v_location.l_id
				 FROM Departments;

				ELSE 
					UPDATE Departments
					SET	    d_name=v_department.ld_department_name
					WHERE d_code = v_department.ld_department_code
				       AND   d_location_id = v_location.l_id; 
				END IF;
			END IF;
			END LOOP;
		END LOOP;

END; $$ LANGUAGE plpgsql;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION load_employee_phoneno()
RETURNS void AS $$
DECLARE
	v_employee_phone RECORD;
	v_employee_phone_id INTEGER;
	v_employee_id INTEGER;

BEGIN
	FOR v_employee_phone IN ( SELECT
						    le_employee_id,

						     le_phone1_no_contry_code,
						     le_phone1_no_area_code,
						     le_phone1_no,
						     le_phone1_no_extension,
						     le_phone1_no_type,

						     le_phone2_no_contry_code,
						     le_phone2_no_area_code,
						     le_phone2_no,
						     le_phone2_no_extension,
						     le_phone2_no_type,

						     le_phone3_no_contry_code,
						     le_phone3_no_area_code,
						     le_phone3_no,
						     le_phone3_no_extension,
						     le_phone3_no_type,

						     le_phone4_no_contry_code,
						     le_phone4_no_area_code,
						     le_phone4_no,
						     le_phone4_no_extension,
						     le_phone4_no_type
						 FROM Load_employees) LOOP

	SELECT e_id
	INTO v_employee_id
	FROM Employees
	WHERE e_employeeNumber = CAST (v_employee_phone.le_employee_id AS INTEGER);
---------------------Get the Phone 1------------------------------------------------------------------
	IF v_employee_phone.le_phone1_no IS NOT NULL THEN

		SELECT ep_id 
		INTO v_employee_phone_id
		FROM Employee_PhoneNO
		WHERE ep_country_code = v_employee_phone.le_phone1_no_contry_code
		AND ep_area_code = v_employee_phone.le_phone1_no_area_code
		AND ep_phone_number =  v_employee_phone.le_phone1_no 
		AND ep_extension = v_employee_phone.le_phone1_no_extension;
	   
		IF v_employee_phone_id IS NULL THEN
			INSERT INTO Employee_PhoneNO(ep_id,ep_e_id,ep_country_code,ep_area_code,ep_phone_number,ep_extension,ep_type)
			SELECT COALESCE(MAX(ep_id)+1,0), v_employee_id, v_employee_phone.le_phone1_no_contry_code,v_employee_phone.le_phone1_no_area_code,v_employee_phone.le_phone1_no,v_employee_phone.le_phone1_no_extension,v_employee_phone.le_phone1_no_type
			FROM Employee_PhoneNO;
		ELSE 
			UPDATE Employee_PhoneNO
			SET	  ep_type = v_employee_phone.le_phone1_no_type
			WHERE ep_country_code = v_employee_phone.le_phone1_no_contry_code
				AND ep_area_code = v_employee_phone.le_phone1_no_area_code
				AND ep_phone_number =  v_employee_phone.le_phone1_no 
				AND ep_extension = v_employee_phone.le_phone1_no_extension;
		END IF;
	END IF;
-------------------Get the phone 2-------------------------------------------------------------------------
	IF v_employee_phone.le_phone2_no IS NOT NULL THEN

		SELECT ep_id 
		INTO v_employee_phone_id
		FROM Employee_PhoneNO
		WHERE ep_country_code = v_employee_phone.le_phone2_no_contry_code
		AND ep_area_code = v_employee_phone.le_phone2_no_area_code
		AND ep_phone_number =  v_employee_phone.le_phone2_no 
		AND ep_extension = v_employee_phone.le_phone2_no_extension;
	   
		IF v_employee_phone_id IS NULL THEN
			INSERT INTO Employee_PhoneNO(ep_id,ep_e_id,ep_country_code,ep_area_code,ep_phone_number,ep_extension,ep_type)
			SELECT COALESCE(MAX(ep_id)+1,0), v_employee_id, v_employee_phone.le_phone2_no_contry_code,v_employee_phone.le_phone2_no_area_code,v_employee_phone.le_phone2_no,v_employee_phone.le_phone2_no_extension,v_employee_phone.le_phone2_no_type
			FROM Employee_PhoneNO;
		ELSE 
			UPDATE Employee_PhoneNO
			SET	  ep_type = v_employee_phone.le_phone2_no_type
			WHERE ep_country_code = v_employee_phone.le_phone2_no_contry_code
				AND ep_area_code = v_employee_phone.le_phone2_no_area_code
				AND ep_phone_number =  v_employee_phone.le_phone2_no 
				AND ep_extension = v_employee_phone.le_phone2_no_extension;
		END IF;
	END IF;
-------------------Get the phone 3-----------------------------------------------------------------
	IF v_employee_phone.le_phone3_no IS NOT NULL THEN

		SELECT ep_id 
		INTO v_employee_phone_id
		FROM Employee_PhoneNO
		WHERE ep_country_code = v_employee_phone.le_phone3_no_contry_code
		AND ep_area_code = v_employee_phone.le_phone3_no_area_code
		AND ep_phone_number =  v_employee_phone.le_phone3_no 
		AND ep_extension = v_employee_phone.le_phone3_no_extension;
	   
		IF v_employee_phone_id IS NULL THEN
			INSERT INTO Employee_PhoneNO(ep_id,ep_e_id,ep_country_code,ep_area_code,ep_phone_number,ep_extension,ep_type)
			SELECT COALESCE(MAX(ep_id)+1,0), v_employee_id, v_employee_phone.le_phone3_no_contry_code,v_employee_phone.le_phone3_no_area_code,v_employee_phone.le_phone3_no,v_employee_phone.le_phone3_no_extension,v_employee_phone.le_phone3_no_type
			FROM Employee_PhoneNO;
		ELSE 
			UPDATE Employee_PhoneNO
			SET	  ep_type = v_employee_phone.le_phone3_no_type
			WHERE ep_country_code = v_employee_phone.le_phone3_no_contry_code
				AND ep_area_code = v_employee_phone.le_phone3_no_area_code
				AND ep_phone_number =  v_employee_phone.le_phone3_no 
				AND ep_extension = v_employee_phone.le_phone3_no_extension;
		END IF;
	END IF;

------------------------Get the phone 4--------------------------------------------------------------------------------
	IF v_employee_phone.le_phone4_no IS NOT NULL THEN

		SELECT ep_id 
		INTO v_employee_phone_id
		FROM Employee_PhoneNO
		WHERE ep_country_code = v_employee_phone.le_phone4_no_contry_code
		AND ep_area_code = v_employee_phone.le_phone4_no_area_code
		AND ep_phone_number =  v_employee_phone.le_phone4_no 
		AND ep_extension = v_employee_phone.le_phone4_no_extension;
	   
		IF v_employee_phone_id IS NULL THEN
			INSERT INTO Employee_PhoneNO(ep_id,ep_e_id,ep_country_code,ep_area_code,ep_phone_number,ep_extension,ep_type)
			SELECT COALESCE(MAX(ep_id)+1,0), v_employee_id, v_employee_phone.le_phone4_no_contry_code,v_employee_phone.le_phone4_no_area_code,v_employee_phone.le_phone4_no,v_employee_phone.le_phone4_no_extension,v_employee_phone.le_phone4_no_type
			FROM Employee_PhoneNO;
		ELSE 
			UPDATE Employee_PhoneNO
			SET	  ep_type = v_employee_phone.le_phone4_no_type
			WHERE ep_country_code = v_employee_phone.le_phone4_no_contry_code
				AND ep_area_code = v_employee_phone.le_phone4_no_area_code
				AND ep_phone_number =  v_employee_phone.le_phone4_no 
				AND ep_extension = v_employee_phone.le_phone4_no_extension;
		END IF;
	END IF;
-------------------------------------------------------------------------------------------------------
END LOOP;
END; $$ LANGUAGE plpgsql;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION load_employee_address()
RETURNS void AS $$
DECLARE
	v_employee_address RECORD;
	v_employee_address_id INTEGER;
	v_employee_id INTEGER;

BEGIN
	FOR v_employee_address IN ( SELECT
						    le_employee_id,

						     le_home_street_no,
						     le_home_street_name,
						     le_home_street_name_suffix,
						     le_home_city,
						     le_home_state,
						     le_home_country,
						     le_home_zip_code,

						     le_bus_street_no,
						     le_bus_street_name,
						     le_bus_street_name_suffix,
						     le_bus_street_zip_code,
						     le_bus_city,
						     le_bus_state,
    						 le_bus_country

						 FROM Load_employees) LOOP

	SELECT e_id
	INTO v_employee_id
	FROM Employees
	WHERE e_employeeNumber = CAST (v_employee_address.le_employee_id AS INTEGER);
---------------------Get the HOME address------------------------------------------------------------------
	IF v_employee_address.le_home_street_no IS NOT NULL THEN

		SELECT ea_id 
		INTO v_employee_address_id
		FROM Employee_Address
		WHERE ea_addr = concat (v_employee_address.le_home_street_no, v_employee_address.le_home_street_name, v_employee_address.le_home_street_name_suffix)
		AND ea_city = v_employee_address.le_home_city;

	   
		IF v_employee_address_id IS NULL THEN
			INSERT INTO Employee_Address(ea_id,ea_e_id,ea_addr,ea_city,ea_province,ea_country,ea_postal_code,ea_type)
			SELECT COALESCE(MAX(ea_id)+1,0), v_employee_id, concat (v_employee_address.le_home_street_no, v_employee_address.le_home_street_name, v_employee_address.le_home_street_name_suffix),
					v_employee_address.le_home_city, v_employee_address.le_home_state, v_employee_address.le_home_country,v_employee_address.le_home_zip_code, 'Home'
			FROM Employee_Address;
		ELSE 
			UPDATE Employee_Address
			SET	  ea_city = v_employee_address.le_home_city,
				ea_province = v_employee_address.le_home_state,
                ea_country = v_employee_address.le_home_country
			WHERE ea_addr = concat (v_employee_address.le_home_street_no, v_employee_address.le_home_street_name, v_employee_address.le_home_street_name_suffix)
			AND ea_city = v_employee_address.le_home_city;
		END IF;
	END IF;
-------------------Get the Business Address-------------------------------------------------------------------------
	IF v_employee_address.le_home_street_no IS NOT NULL THEN

		SELECT ea_id 
		INTO v_employee_address_id
		FROM Employee_Address
		WHERE ea_addr = concat (v_employee_address.le_bus_street_no, v_employee_address.le_bus_street_name, v_employee_address.le_bus_street_name_suffix)
		AND ea_city = v_employee_address.le_bus_city;

	   
		IF v_employee_address_id IS NULL THEN
			INSERT INTO Employee_Address(ea_id,ea_e_id,ea_addr,ea_city,ea_province,ea_country,ea_postal_code,ea_type)
			SELECT COALESCE(MAX(ea_id)+1,0), v_employee_id, concat (v_employee_address.le_bus_street_no, v_employee_address.le_bus_street_name, v_employee_address.le_bus_street_name_suffix),
					v_employee_address.le_bus_city, v_employee_address.le_bus_state, v_employee_address.le_bus_country,v_employee_address.le_bus_street_zip_code, 'Business'
			FROM Employee_Address;
		ELSE 
			UPDATE Employee_Address
			SET	  ea_city = v_employee_address.le_bus_city,
				ea_province = v_employee_address.le_bus_state,
                ea_country = v_employee_address.le_bus_country
			WHERE ea_addr = concat (v_employee_address.le_bus_street_no, v_employee_address.le_bus_street_name, v_employee_address.le_bus_street_name_suffix)
			AND ea_city = v_employee_address.le_bus_city;
		END IF;
	END IF;

-------------------------------------------------------------------------------------------------------
END LOOP;
END; $$ LANGUAGE plpgsql;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION load_jobs()
RETURNS void AS $$
DECLARE
  v_job RECORD;
  v_department RECORD;
  v_job_id INTEGER;
  v_pay_frequency VARCHAR(20);
  v_pay_type VARCHAR(20);

BEGIN
	FOR v_job IN (SELECT 
					     lj_job_code,
					     lj_job_name ,
					     lj_job_eff_date,
					     lj_job_job_exp_date
     					FROM Load_jobs) LOOP
		FOR v_department IN ( SELECT
								d_id,
								d_code
								FROM Departments) LOOP
		IF EXISTS (SELECT le_job_code, le_department_code
					FROM Load_employees
					WHERE le_job_code = v_job.lj_job_code
					AND le_department_code =  v_department.d_code
			)

		THEN
			SELECT j_id 
			INTO v_job_id
			FROM Jobs
			WHERE j_code = v_job.lj_job_code
			AND j_d_id = v_department.d_id;

	       SELECT frequency,type
	       INTO v_pay_frequency, v_pay_type
	       FROM  (SELECT le_job_code As code, le_pay_frequency AS frequency, le_pay_type AS type
	       			FROM Load_employees
	       			WHERE le_job_code = v_job.lj_job_code
	       			GROUP By code,frequency,type) subquery1
	       WHERE subquery1.code = v_job.lj_job_code;




			IF v_job_id IS NULL THEN
			SET datestyle = dmy;

			INSERT INTO Jobs(j_id,j_name,j_code,j_eff_date,j_exp_date,j_supervisor_job_id,j_d_id,j_pay_frequency,j_pay_type)
			SELECT COALESCE(MAX(j_id)+1,0),v_job.lj_job_name,v_job.lj_job_code, CAST (v_job.lj_job_eff_date AS DATE),CAST (v_job.lj_job_job_exp_date AS DATE), NULL, v_department.d_id,v_pay_frequency,v_pay_type
			FROM Jobs;


			END IF;
		END IF;
	END LOOP;
END LOOP;

END; $$ LANGUAGE plpgsql;


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION load_employee_job()
RETURNS void AS $$
DECLARE
  v_employee RECORD;
  v_job_id INTEGER;
  v_employee_id INTEGER;
  v_employee_job_id INTEGER;
  v_department_id INTEGER;
BEGIN
	FOR v_employee IN (SELECT 
						     le_employee_id,
						     le_home_email,
						     le_original_hire_date,
						     le_rehire_date,
						     le_term_date,
						     le_term_type,
						     le_term_reason,
						     le_job_title,
						     le_job_code,
						     le_job_start_date,
						     le_job_end_date,
						     le_department_code,
						     le_location_code,
						     le_pay_frequency,
						     le_pay_type,
						     le_hourly_amount,
						     le_salaried_amount,
						     le_supervisor_job_code,
						     le_employee_status,
						     le_standard_hours,
						     le_employee_type
     					FROM Load_employees) LOOP

						SELECT d_id
						INTO v_department_id
						FROM Departments
						WHERE d_code = v_employee.le_department_code;

						SELECT j_id 
						INTO v_job_id
						FROM Jobs
						WHERE j_code = v_employee.le_job_code
						AND  j_d_id = v_department_id;

						SELECT e_id
						INTO v_employee_id
						FROM Employees
						WHERE e_employeeNumber = CAST ( v_employee.le_employee_id AS INTEGER);

						SELECT ej_id
						INTO v_employee_job_id
						FROM Employee_Job
						WHERE ej_j_id = v_job_id
						AND ej_e_id = v_employee_id;

						IF v_employee_job_id IS NULL THEN
						INSERT INTO Employee_Job(ej_id,ej_e_id,ej_j_id,ej_start_date,ej_end_date,ej_salary_amount,ej_hourly_amount,ej_standard_hours,ej_contract_lenghth_type,ej_contract_type)
						SELECT COALESCE(MAX(ej_id)+1,0),v_employee_id,v_job_id, CAST( v_employee.le_job_start_date AS DATE), CAST (v_employee.le_job_end_date AS DATE),v_employee.le_salaried_amount,v_employee.le_hourly_amount, v_employee.le_standard_hours, v_employee.le_employee_type,v_employee.le_employee_status
						FROM Employee_Job;

						END IF;

	END LOOP;
END; $$ LANGUAGE plpgsql;
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
SELECT load_locations();
SELECT load_employees();
SELECT load_departments_except_department_manager_job_id();
SELECT  load_employee_phoneno();
SELECT load_employee_address();
SELECT load_jobs();
SELECT load_employee_job();






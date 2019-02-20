-- Gong Cheng
-- NSID:goc558
-- 11196838


DROP TABLE Employees CASCADE;
DROP TABLE Jobs CASCADE;
DROP TABLE Locations CASCADE;
DROP TABLE Departments CASCADE;
DROP TABLE Employee_Address CASCADE;
DROP TABLE Employee_Job CASCADE;
DROP TABLE Employee_PhoneNO CASCADE;



DROP TABLE Load_locations CASCADE;
DROP TABLE Load_jobs CASCADE;
DROP TABLE Load_departments CASCADE;
DROP TABLE Load_employees CASCADE;

DROP DOMAIN PhoneType;
DROP DOMAIN AddresseType;
DROP DOMAIN PayFrequency;
DROP DOMAIN PayType;

DROP DOMAIN ContractType;
DROP DOMAIN ContractLenghthType;
DROP DOMAIN EmploymentStatus;




CREATE DOMAIN PhoneType AS VARCHAR(20)
 	CHECK(VALUE IN ('Home','Mobile','Business'));

CREATE DOMAIN AddresseType AS VARCHAR(20)
 	CHECK(VALUE IN ('Home','Business'));

CREATE DOMAIN PayFrequency AS VARCHAR(20)
    CHECK(VALUE IN ('weekly','biweekly','monthly'));

CREATE DOMAIN PayType AS VARCHAR(20)
    CHECK(VALUE IN ('hourly','salary'));

CREATE TABLE Locations (
     l_id       INTEGER NOT NULL,
     l_code 	 VARCHAR(20) NOT NULL,
     l_name 	 VARCHAR(50) NOT NULL,
     l_addr 	 VARCHAR(50) NOT NULL,
     l_city 	 VARCHAR(50) NOT NULL,
     l_province  VARCHAR(50) NOT NULL,
     l_country   VARCHAR(50) NOT NULL,
     PRIMARY KEY(l_id)
);

CREATE TABLE Departments (
     d_id             INTEGER NOT NULL,
     d_code           VARCHAR(50) NOT NULL,
     d_name           VARCHAR(50) NOT NULL,
     d_manager_job_id INTEGER,
     d_location_id    INTEGER NOT NULL,
     PRIMARY KEY(d_id),
     FOREIGN KEY (d_location_id) REFERENCES Locations(l_id)
);



CREATE TABLE Employees (
	 e_id 			    INTEGER NOT NULL,
	 e_employeeNumber   INTEGER NOT NULL,
	 e_firstName        VARCHAR(20) NOT NULL,
	 e_lastName	   	   	VARCHAR(20) NOT NULL,
	 e_gender 			VARCHAR(20) NOT NULL,
	 e_SSN 				VARCHAR(50),
	 e_hireDt 			DATE NOT NULL,
	 e_terminationDt 	DATE ,
	 e_rehireDt DATE,
	 PRIMARY KEY(e_id)
);



CREATE TABLE Employee_Address (
     ea_id           INTEGER NOT NULL,
     ea_e_id 	      INTEGER NOT NULL,
     ea_addr         VARCHAR(50) NOT NULL,
     ea_city         VARCHAR(50) NOT NULL,
     ea_province     VARCHAR(50) NOT NULL,
     ea_country      VARCHAR(50) NOT NULL,
     ea_postal_code  VARCHAR(50) NOT NULL,
     ea_type         AddresseType NOT NULL,
     PRIMARY KEY(ea_id),
     FOREIGN KEY (ea_e_id) REFERENCES Employees(e_id)
);



CREATE TABLE Employee_PhoneNO (
     ep_id            INTEGER NOT NULL,
     ep_e_id          INTEGER NOT NULL,
     ep_country_code  VARCHAR(20) NOT NULL,
     ep_area_code     VARCHAR(20) NOT NULL,
     ep_phone_number  VARCHAR(20) NOT NULL,
     ep_extension     VARCHAR(20),
     ep_type          PhoneType  NOT NULL,
     PRIMARY KEY(ep_id),
     FOREIGN KEY (ep_e_id) REFERENCES Employees(e_id)
);

CREATE TABLE Jobs (
     j_id                INTEGER NOT NULL,
     j_name              VARCHAR(50) NOT NULL,
     j_code              VARCHAR(20) NOT NULL,
     j_eff_date          DATE NOT NULL,
     j_exp_date          DATE ,
     j_supervisor_job_id INTEGER,
     j_d_id               INTEGER,
     j_pay_frequency     PayFrequency NOT NULL,
     j_pay_type          PayType NOT NULL,
     PRIMARY KEY(j_id),
     FOREIGN KEY (j_supervisor_job_id) REFERENCES Jobs(j_id),
     FOREIGN KEY (j_d_id) REFERENCES Departments(d_id)
);


CREATE TABLE Employee_Job (
     ej_id            INTEGER NOT NULL,
     ej_e_id          INTEGER NOT NULL,
     ej_j_id          INTEGER NOT NULL,
     ej_start_date    DATE NOT NULL,
     ej_end_date      DATE,
     ej_salary_amount VARCHAR(20) ,
     ej_hourly_amount VARCHAR(20) ,
     PRIMARY KEY(ej_id),
     FOREIGN KEY (ej_e_id) REFERENCES Employees(e_id),
     FOREIGN KEY (ej_j_id) REFERENCES Jobs(j_id)
);

ALTER TABLE Departments ADD CONSTRAINT departmentFk FOREIGN KEY (d_manager_job_id) REFERENCES Jobs (j_id);

-----------------For Assignment 3 Part 1 ------------------------------------------------------------------

CREATE DOMAIN ContractType AS VARCHAR(20)
     CHECK(VALUE IN ('Full-time','Part-time','Casual'));

CREATE DOMAIN ContractLenghthType AS VARCHAR(20)
     CHECK(VALUE IN ('Regular','Temporary'));

CREATE DOMAIN EmploymentStatus AS VARCHAR(20)
     CHECK(VALUE IN ('Paid Leave','Suspended','Inactive','Active','Unpaid Leave'));


ALTER TABLE Employees
ADD COLUMN e_birthdate                   DATE,
ADD COLUMN e_marital_status              VARCHAR(20) NOT NULL,
ADD COLUMN e_email_home                  VARCHAR(50) NOT NULL,
ADD COLUMN e_employ_status               EmploymentStatus ,
ADD COLUMN e_l_performance_review_Text   VARCHAR(200),
ADD COLUMN e_l_performance_review_date   DATE,
ADD COLUMN e_l_performance_review_rating VARCHAR(20);

ALTER TABLE Employee_Job
ADD COLUMN ej_standard_hours         VARCHAR(20) NOT NULL,
ADD COLUMN ej_contract_lenghth_type  ContractLenghthType NOT NULL,
ADD COLUMN ej_contract_type          ContractType NOT NULL;

-----------------------------For Part 2----------------------------------------------------------------
CREATE TABLE Load_locations (
     ll_location_code TEXT,
     ll_location_name TEXT,
     ll_street_addr TEXT,
     ll_city TEXT,
     ll_province TEXT,
     ll_country TEXT,
     ll_postal_code TEXT
);

CREATE TABLE Load_jobs (
     lj_job_code TEXT,
     lj_job_name TEXT,
     lj_job_eff_date TEXT,
     lj_job_job_exp_date TEXT
);

CREATE TABLE Load_departments (
      ld_department_code TEXT,
      ld_department_name TEXT,
      ld_department_manager_job_code TEXT,
      ld_department_manager_job_title TEXT,
      ld_department_eff_date TEXT,
      ld_department_exp_date TEXT
);


CREATE TABLE Load_employees(
     le_employee_id TEXT,
     le_title TEXT,
     le_first_name TEXT,
     le_middle_name TEXT,
     le_last_name TEXT,
     le_gender TEXT,
     le_birthdate TEXT,
     le_marital_status TEXT,
     le_SSN TEXT,
     le_home_email TEXT,
     le_original_hire_date TEXT,
     le_rehire_date TEXT,
     le_term_date TEXT,
     le_term_type TEXT,
     le_term_reason TEXT,
     le_job_title TEXT,
     le_job_code TEXT,
     le_job_start_date TEXT,
     le_job_end_date TEXT,
     le_department_code TEXT,
     le_location_code TEXT,
     le_pay_frequency TEXT,
     le_pay_type TEXT,
     le_hourly_amount TEXT,
     le_salaried_amount TEXT,
     le_supervisor_job_code TEXT,
     le_employee_status TEXT,
     le_standard_hours TEXT,
     le_employee_type TEXT,
     le_employee_status_type TEXT,
     le_last_performance_rating TEXT,
     le_last_performance_rating_text TEXT,
     le_last_performance_rating_date TEXT,

     le_home_street_no TEXT,
     le_home_street_name TEXT,
     le_home_street_name_suffix TEXT,
     le_home_city TEXT,
     le_home_state TEXT,
     le_home_country TEXT,
     le_home_zip_code TEXT,

     le_bus_street_no TEXT,
     le_bus_street_name TEXT,
     le_bus_street_name_suffix TEXT,
     le_bus_street_zip_code TEXT,
     le_bus_city TEXT,
     le_bus_state TEXT,
     le_bus_country TEXT,

     le_phone1_no_contry_code TEXT,
     le_phone1_no_area_code TEXT,
     le_phone1_no TEXT,
     le_phone1_no_extension TEXT,
     le_phone1_no_type TEXT,

     le_phone2_no_contry_code TEXT,
     le_phone2_no_area_code TEXT,
     le_phone2_no TEXT,
     le_phone2_no_extension TEXT,
     le_phone2_no_type TEXT,

     le_phone3_no_contry_code TEXT,
     le_phone3_no_area_code TEXT,
     le_phone3_no TEXT,
     le_phone3_no_extension TEXT,
     le_phone3_no_type TEXT,

     le_phone4_no_contry_code TEXT,
     le_phone4_no_area_code TEXT,
     le_phone4_no TEXT,
     le_phone4_no_extension TEXT,
     le_phone4_no_type TEXT

);



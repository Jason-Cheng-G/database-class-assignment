----Gong Cheng
----NSID goc558
----Student ID 11196838

DROP TABLE IF EXISTS Employee_Audit;
DROP TABLE IF EXISTS Employee_Job_Audit;
DROP TABLE IF EXISTS Employee_History;


CREATE TABLE Employee_Audit(
	id               SERIAL, 
	operartion 		 CHAR(1)        	NOT NULL,
	stamp      		 timestamp     		NOT NULL,
	userid   		 text			    NOT NULL,
	employee_id 	 INT				NOT NULL,
	employee_number  VARCHAR(200), 
	title 			 VARCHAR(20), 
	first_name 		 VARCHAR(100) 		NOT NULL,
	middle_name 	 VARCHAR(100) 		NOT NULL,
	last_name 		 VARCHAR(100) 		NOT NULL,
	gender 			 GENDER 			NOT NULL,
	ssn 			 ssnType 			NOT NULL,
	birth_date 		 DATE,
	hire_date 		 DATE 				NOT NULL,
	rehire_date 	 DATE,
	termination_date DATE, 
	marital_status_id INT 				NOT NULL,
	home_email       VARCHAR(200),
    employment_status_id INT,
	term_type_id     INT ,
	term_reason_id   INT ,
    PRIMARY KEY(id)
);


CREATE TABLE Employee_Job_Audit(
	id                  SERIAL	,
	operartion 			VARCHAR(1)      	NOT NULL,
	stamp      			timestamp      		NOT NULL,
	userid   			text				NOT NULL,
 	emplyee_job_id 		INT,
  	employee_id 		INT 				NOT NULL ,
  	job_id 				INT 				NOT NULL ,
  	effective_date 		DATE 				NOT NULL,
  	expiry_date 		DATE,
  	pay_amount 			INT,
  	standard_hours 		INT,
  	employee_type_id 	INT ,
  	employee_status_id 	INT ,
  	PRIMARY KEY (id)
);

CREATE TABLE Employee_History(
	id               SERIAL,
	stamp			timestamp			NOT NULL,
	first_name 		 VARCHAR(100) 		NOT NULL,
	middle_name 	 VARCHAR(100) 		NOT NULL,
	last_name 		 VARCHAR(100) 		NOT NULL,
	gender 			 GENDER 			NOT NULL,
	ssn 			 ssnType 			NOT NULL,
	birth_date 		 DATE,
	marital_status_id INT 				NOT NULL,
    marital_status_code VARCHAR(10)     NOT NULL,
    marital_status_name VARCHAR(100)    NOT NULL,


	employee_status_id INT  			NOT NULL,
	employee_status_code VARCHAR(10)    NOT NULL,
	employee_status_name VARCHAR(100)   NOT NULL,
	hire_date 		 DATE 				NOT NULL,
	rehire_date 	 DATE,
	termination_date DATE, 
    term_reason_id   INT,
    termination_reason_code VARCHAR(10),
    termination_reason_name VARCHAR(100),
	term_type_id     INT,
	term_type_code   VARCHAR(10),
	term_type_name	 VARCHAR(100),

	job_code		VARCHAR(10) ,
	job_title       VARCHAR(100) ,
	emp_job_start_date  DATE,
	emp_job_end_date DATE,
	pay_amount INT,
	standard_hours INT,
	employee_type_id INT,
	employee_type_code VARCHAR(10),
	employee_type_name VARCHAR(100),

	employment_status_id INT,
	employment_status_code VARCHAR(10),
	employment_status_name VARCHAR(100),

	department_code VARCHAR(10),
	department_name VARCHAR(100),
	locaton_code    VARCHAR(10),
	locaton_name    VARCHAR(100),

	pay_frequency_id INT,
	pay_frequency_code VARCHAR(10),
	pay_frequency_name VARCHAR(100),

	pay_type_id     INT,
	pay_type_code   VARCHAR(10),
	pay_type_name   VARCHAR(100),

	PRIMARY KEY(id)
);

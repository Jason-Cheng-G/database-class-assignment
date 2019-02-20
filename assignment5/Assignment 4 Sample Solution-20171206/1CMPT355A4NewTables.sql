-- Solution for 2017 Term 1 CMPT355 Assignment 4
-- Author: Ellen Redlick
-- Modified: Lujie Duan



-- Part 1: Add history table and audit tables

DROP TABLE IF EXISTS employee_histories CASCADE;
DROP TABLE IF EXISTS audit_employees CASCADE;
DROP TABLE IF EXISTS audit_emp_jobs CASCADE;



CREATE TABLE employee_histories(
  id SERIAL PRIMARY KEY, 
  history_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  history_source VARCHAR(40),
  employee_id INT,
  employee_number VARCHAR(30),
  title VARCHAR(5),
  first_name VARCHAR(40),
  middle_name VARCHAR(40), 
  last_name VARCHAR(40),
  gender GENDER,
  SSN SSNTYPE,
  birth_date DATE, 
  marital_status_id INT,
  marital_status_code VARCHAR(10),
  marital_status_name VARCHAR(30), 
  employment_status_id INT,
  employment_status_code VARCHAR(10),
  employment_status_name VARCHAR(30),
  hire_date DATE,
  rehire_date DATE, 
  termination_date DATE, 
  term_reason_id INT,
  term_reason_code VARCHAR(10),
  term_reason_name VARCHAR(30), 
  term_type_id INT,
  term_type_code VARCHAR(10),
  term_type_name VARCHAR(30), 
  job_id INT,
  job_code VARCHAR(10), 
  job_title VARCHAR(50), 
  job_start_date DATE, 
  job_end_date DATE, 
  pay_amount NUMERIC, 
  standard_hours NUMERIC,
  employee_type_id INT, 
  employee_type_code VARCHAR(10), 
  employee_type_name VARCHAR(30),
  employee_status_id INT,  
  employee_status_code VARCHAR(10),  
  employee_status_name VARCHAR(30),
  department_id INT, 
  department_code VARCHAR(10),
  department_name VARCHAR(30),
  location_id INT, 
  location_code VARCHAR(10),
  location_name VARCHAR(30),
  pay_frequency_id INT,
  pay_frequency_code VARCHAR(10),
  pay_frequency_name VARCHAR(30),
  pay_type_id INT, 
  pay_type_code VARCHAR(10), 
  pay_type_name VARCHAR(30),
  supervisor_job_id INT, 
  supervisor_job_code VARCHAR(10),
  supervisor_job_name VARCHAR(30),
  supervisor_name VARCHAR(100)
  );
  
CREATE TABLE audit_employees(
  id SERIAL PRIMARY KEY, 
  employee_id INT, 
  employee_number VARCHAR(30), 
  title VARCHAR(5),
  first_name VARCHAR(40) NOT NULL,
  middle_name VARCHAR(40), 
  last_name VARCHAR(40),
  gender GENDER NOT NULL,
  SSN SSNTYPE NOT NULL,
  birth_date DATE, 
  marital_status_id INT,
  home_email VARCHAR(50), 
  employment_status_id INT,
  hire_date DATE NOT NULL,
  rehire_date DATE, 
  termination_date DATE, 
  term_reason_id INT, 
  term_type_id INT,
  audit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  audit_action CHAR(1) CHECK (audit_action IN ('I','U','D')),
  audit_user VARCHAR(100)
);


CREATE TABLE audit_emp_jobs(
  id SERIAL PRIMARY KEY,
  emp_job_id INT, 
  employee_id INT,
  job_id INT,
  effective_date DATE,
  expiry_date DATE,
  pay_amount NUMERIC, 
  standard_hours NUMERIC, 
  employee_type_id INT, 
  employee_status_id INT,
  audit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  audit_action CHAR(1) CHECK (audit_action IN ('I','U','D')),
  audit_user VARCHAR(100)
  );
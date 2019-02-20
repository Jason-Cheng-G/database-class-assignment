-- Solution for 2017 Term 1 CMPT355 Assignment 4
-- Author: Ellen Redlick
-- Modified: Lujie Duan


DELETE FROM audit_employees;
DELETE FROM audit_emp_jobs;
DELETE FROM employee_histories;


-- Part 2: Test Triggers
SELECT set_config('session.trigs_enabled', 'Y', FALSE);



-- 1. Test Employee Table
-- 1.1 Insert - This should insert a new record to the audit table, but not to the history table:
INSERT INTO employees(employee_number,title,first_name,middle_name,last_name,gender,ssn,birth_date,marital_status_id, 
                      home_email,employment_status_id,hire_date,rehire_date,termination_date,term_reason_id,term_type_id)
VALUES('1220000','Mr','Potato','J','Head','M','111111111',to_date('21/02/1984','mm/dd/yyyy'),3,
      'mptotato_head@gmail.com',1,to_date('01/01/1999','mm/dd/yyyy'),NULL,NULL,NULL,NULL);

SELECT * FROM audit_employees;
SELECT * FROM audit_emp_jobs;
SELECT * FROM employee_histories;


-- 1.2 Update - This should insert a new reocrd to the audit table, and a new record to the history table
UPDATE employees 
SET rehire_date = NULL 
WHERE employee_number = '100010';

SELECT * FROM audit_employees;
SELECT * FROM audit_emp_jobs;
SELECT * FROM employee_histories;


-- 1.3 Delete (optional) - This should insert a new reocrd to the audit table, but not to the history table


DELETE FROM employees WHERE employee_number = '1220000';

SELECT * FROM audit_employees;
SELECT * FROM audit_emp_jobs;
SELECT * FROM employee_histories;


-- 2. Test Employee Jobs Table
-- 1.1 Insert - This should insert a new record to the audit table, and a new record to the history table:
INSERT INTO employee_jobs(employee_id, job_id, effective_date, expiry_date, pay_amount, standard_hours, employee_type_id, employee_status_id)
VALUES (234, 95, current_date, NULL, 49000, 40, 1, 1);

SELECT * FROM audit_employees;
SELECT * FROM audit_emp_jobs;
SELECT * FROM employee_histories;


-- 1.2 Update - This should insert a new reocrd to the audit table, and a new record to the history table
UPDATE employee_jobs 
SET pay_amount = 10000 
WHERE id = 300;

SELECT * FROM audit_employees;
SELECT * FROM audit_emp_jobs;
SELECT * FROM employee_histories;


-- 1.3 Delete (optional) - This should insert a new reocrd to the audit table, but not to the history table
DELETE FROM employee_jobs WHERE id = 300;

SELECT * FROM audit_employees;
SELECT * FROM audit_emp_jobs;
SELECT * FROM employee_histories;





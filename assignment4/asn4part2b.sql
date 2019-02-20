----Gong Cheng
----NSID goc558
----Student ID 11196838

INSERT INTO employees
VALUES(900,111111, 'Mr', 'aaa', 'aaa', 'aaa', 'M', 00000000, '2000-11-11','2010-11-11', NULL, NULL, 1, 'aaaa@gmail.com', 1, NULL ,NULL);

INSERT INTO employees
VALUES(901,222222,'Ms', 'bbb', 'bbb', 'bbb', 'F', 00000000, '2000-11-11','2010-11-11',NULL, NULL,1, 'bbbb@gmail.com', 1, NULL ,NULL );

UPDATE employees 
SET middle_name = 'bbb'
WHERE id = 900;

UPDATE employees 
SET middle_name = 'aaa'
WHERE id = 901;

DELETE FROM employees
WHERE id = 900;

DELETE FROM employees
WHERE id = 901;


UPDATE employees 
SET middle_name = 'Smith'
WHERE id = 1;

UPDATE employees 
SET middle_name = 'Smith'
WHERE id = 2;

UPDATE employees 
SET middle_name = 'Smith'
WHERE id = 3;

UPDATE employee_jobs
SET standard_hours = 100
WHERE id = 4;

UPDATE employee_jobs
SET standard_hours = 100
WHERE id = 5;

UPDATE employee_jobs
SET standard_hours = 100
WHERE id = 6;











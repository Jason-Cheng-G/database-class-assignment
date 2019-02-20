-- Solution for 2017 Term 1 CMPT355 Assignment 4
-- Modified: Lujie Duan



-- Load data files for assignment 4
DELETE FROM load_employee_data;
DELETE FROM load_jobs;
DELETE FROM load_departments;
DELETE FROM load_locations;



-- copy in psql to load data files
\copy load_employee_data FROM 'assgn4-employeeFile.csv' CSV HEADER;



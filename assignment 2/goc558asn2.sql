-- Gong Cheng
-- NSID:goc558
-- 11196838


DROP TABLE Employees CASCADE;
DROP TABLE Jobs CASCADE;
DROP TABLE Locations CASCADE;
DROP TABLE Addresses CASCADE;
DROP TABLE Departments CASCADE;
DROP TABLE Employee_Address CASCADE;
DROP TABLE Employee_Job CASCADE;
DROP TABLE Employee_PhoneNO CASCADE;
DROP TABLE Location_Department CASCADE;



-- CREATE DOMAIN Name AS VARCHAR(20);



CREATE TABLE Locations (
     l_id  VARCHAR(10) NOT NULL,
     l_name  VARCHAR(10) NOT NULL,
     l_code VARCHAR(10) NOT NULL,
     l_address VARCHAR(50) NOT NULL,
     PRIMARY KEY(l_id)
);

CREATE TABLE Departments (
     d_id  VARCHAR(10) NOT NULL,
     d_name  VARCHAR(10) NOT NULL,
     d_code VARCHAR(10) NOT NULL,
     d_top_job VARCHAR(10) NOT NULL,
     PRIMARY KEY(d_id)
);

CREATE TABLE Location_Department (
     ld_id  VARCHAR(10) NOT NULL,
     ld_l_id  VARCHAR(10) NOT NULL,
     ld_d_id VARCHAR(10) NOT NULL,
     PRIMARY KEY(ld_id),
     FOREIGN KEY (ld_l_id) REFERENCES Locations(l_id),
     FOREIGN KEY (ld_d_id) REFERENCES Departments(d_id)
);


CREATE TABLE Employees (
	 e_id  VARCHAR(10) NOT NULL,
	 e_first_name  VARCHAR(10) NOT NULL,
	 e_last_name VARCHAR(10) NOT NULL,
	 e_gender VARCHAR(10) NOT NULL,
	 e_ssn VARCHAR(20) NOT NULL,
	 e_hire_date DATE NOT NULL,
	 e_termination_date DATE ,
	 e_rehire_date DATE,
	 e_ld_id VARCHAR(10),
	PRIMARY KEY(e_id),
	FOREIGN KEY (e_ld_id) REFERENCES Location_Department(ld_id)
);



CREATE TABLE Addresses (
     a_id  VARCHAR(10) NOT NULL,
     a_po_box  VARCHAR(10) NOT NULL,
     a_apt_unit VARCHAR(10) NOT NULL,
     a_street_no VARCHAR(10) NOT NULL,
     a_street_name VARCHAR(20) NOT NULL,
     a_city_town VARCHAR(20) NOT NULL,
     a_province VARCHAR(10) NOT NULL,
     a_country VARCHAR(20) NOT NULL,
     a_postal_code VARCHAR(10) NOT NULL,
     PRIMARY KEY(a_id)
    
);

CREATE TABLE Employee_Address (
     ea_id  VARCHAR(10) NOT NULL,
     ea_e_id  VARCHAR(10) NOT NULL,
     ea_a_id VARCHAR(10) NOT NULL,
     PRIMARY KEY(ea_id),
     FOREIGN KEY (ea_e_id) REFERENCES Employees(e_id),
     FOREIGN KEY (ea_a_id) REFERENCES Addresses(a_id)
);




CREATE TABLE Employee_PhoneNO (
     ep_e_id  VARCHAR(10) NOT NULL,
     ep_phone_no  VARCHAR(10) NOT NULL,
     ep_type VARCHAR(10) NOT NULL,
     PRIMARY KEY(ep_e_id,ep_phone_no),
     FOREIGN KEY (ep_e_id) REFERENCES Employees(e_id)
);

CREATE TABLE Jobs (
     j_id  VARCHAR(10) NOT NULL,
     j_name  VARCHAR(10) NOT NULL,
     j_code VARCHAR(10) NOT NULL,
     j_eff_date DATE NOT NULL,
     j_exp_date DATE NOT NULL,
     j_reports_to VARCHAR(10) NOT NULL,
     j_d_id VARCHAR(10) ,
     j_pay_frequency VARCHAR(10),
     j_pay_type VARCHAR(10),
     PRIMARY KEY(j_id),
     FOREIGN KEY (j_reports_to) REFERENCES Jobs(j_id),
     FOREIGN KEY (j_d_id) REFERENCES Departments(d_id)
);


CREATE TABLE Employee_Job (
     ej_id  VARCHAR(10) NOT NULL,
     ej_e_id  VARCHAR(10) NOT NULL,
     ej_j_id VARCHAR(20) NOT NULL,
     ej_start_date DATE NOT NULL,
     ej_end_date DATE ,
     ej_salary VARCHAR(20) NOT NULL,
    PRIMARY KEY(ej_id),
    FOREIGN KEY (ej_e_id) REFERENCES Employees(e_id),
    FOREIGN KEY (ej_j_id) REFERENCES Jobs(j_id)
);
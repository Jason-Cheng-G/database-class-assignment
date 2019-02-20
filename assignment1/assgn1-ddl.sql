CREATE TABLE universities(
  id INT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id));

CREATE TABLE departments(
  id INT,
  code VARCHAR(10) NOT NULL ,
  name VARCHAR(100), 
  university_id INT NOT NULL REFERENCES universities,
  PRIMARY KEY (id),
  UNIQUE (code, university_id));

CREATE TABLE courses(
  id INT,
  code VARCHAR(10) UNIQUE NOT NULL,
  name VARCHAR(100) NOT NULL,
  course_desc TEXT,
  credit_units NUMERIC,
  department_id INT NOT NULL REFERENCES departments, 
  PRIMARY KEY(id));

CREATE TABLE terms(
  id INT,
  code VARCHAR(10) UNIQUE NOT NULL,
  name VARCHAR(50),
  start_date DATE,
  end_date DATE,
  PRIMARY KEY (id));

CREATE TABLE instructors(
  id INT,
  employee_number INT,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  seniority_date DATE, 
  email_address VARCHAR(100),
  PRIMARY KEY (id));

CREATE TABLE students(
  id INT,
  student_number INT,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email_address VARCHAR(100),
  major_code VARCHAR(10),
  gender CHAR(1),
  PRIMARY KEY (id));

CREATE TABLE sections(
  id INT,
  section_code VARCHAR(10),
  course_id INT NOT NULL REFERENCES courses,
  lec_type VARCHAR(10) NOT NULL,
  term_id INT NOT NULL REFERENCES terms,
  max_enrollment INT NOT NULL, 
  num_enrolled INT DEFAULT 0,
  instructor_id INT REFERENCES instructors,
  days VARCHAR(3),
  start_time TIME,
  end_time TIME,
  location_code VARCHAR(20),
  PRIMARY KEY (id));

CREATE TABLE enrollments(
  id INT,
  student_id INT NOT NULL REFERENCES students,
  section_id INT NOT NULL REFERENCES sections,
  grade NUMERIC,
  status_code VARCHAR(10),
  PRIMARY KEY (id));


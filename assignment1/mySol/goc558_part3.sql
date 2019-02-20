-- cmpt355 assignment1 part 3
-- Gong Cheng
-- goc558
-- 11196838

---Part 3

---1)
-- 1. enrollment_id INT
-- 2. assesment_id INT
-- 3. NUMERIC
---4. NUMERIC
---5. NUMERIC
---6. DATE
---7. section_id INT
---------------------
---2)
CREATE TABLE assessments(
  id INT,
  section_id INT NOT NULL REFERENCES sections,
  name VARCHAR(100),
  type VARCHAR(10),
  total_points NUMERIC, 
  weight NUMERIC,
  due_date DATE,
  PRIMARY KEY (id));

CREATE TABLE enrollment_assessments(
	id INT,
	enrollment_id INT NOT NULL REFERENCES enrollments,
	assesment_id INT NOT NULL REFERENCES assessments,
	points NUMERIC,
	PRIMARY KEY (id)
);

--3)
  INSERT INTO assessments(id, section_id,name,type,total_points,weight,due_date)
  VALUES (1,'82736', 'assignmen 1','assignment',100,0.1,'2017-10-10');
  INSERT INTO assessments(id, section_id,name,type,total_points,weight,due_date)
  VALUES (2,'82736', 'assignmen 2','assignment',100,0.1,'2017-10-20');
  INSERT INTO assessments(id, section_id,name,type,total_points,weight,due_date)
  VALUES (3,'82736', 'assignmen 3','assignment',100,0.1,'2017-10-25');
  INSERT INTO assessments(id, section_id,name,type,total_points,weight,due_date)
  VALUES (4,'82736', 'assignmen 4','assignment',100,0.1,'2017-10-28');
  INSERT INTO assessments(id, section_id,name,type,total_points,weight,due_date)  
  VALUES (5,'82736', 'assignmen 5','assignment',100,0.1,'2017-11-3');


  INSERT INTO assessments(id, section_id,name,type,total_points,weight,due_date)
  VALUES (6,'82736', 'midterm','exam',100,0.2,'2017-10-20');
  INSERT INTO assessments(id, section_id,name,type,total_points,weight,due_date)
  VALUES (7,'82736', 'final','exam',100,0.3,'2017-12-10');

  --4)


  INSERT INTO Instructors(id,employee_number, first_name,last_name, seniority_date,email_address)
  VALUES ('41',8888,'Ellen','Redlick','2016-9-9','ellen.redlick@usask.ca');

  UPDATE sections
  SET instructor_id = '41'
  WHERE id IN (SELECT s.id
			  FROM sections s , Instructors i, Courses c
			  WHERE  s.course_id = c.id AND c.code = 'CMPT355' AND s.instructor_id = i.id
  	);


  -- DELETE FROM Instructors
  -- WHERE id = (SELECT i.id
		-- 	  FROM sections s , Instructors i, Courses c
		-- 	  WHERE s.lec_type = 'LEC' AND s.instructor_id = i.id AND s.course_id = c.id AND c.code = 'CMPT355'
  -- 	);





 
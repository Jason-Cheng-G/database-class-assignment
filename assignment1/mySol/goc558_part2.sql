-- cmpt355 assignment1 part 2
-- Gong Cheng
-- goc558
-- 11196838

---Part 2 
----1)
SELECT u.name AS university_name, d.name AS department_name, c.code AS course_code, c.name AS course_name, c.course_desc AS course_description, c.credit_units AS credits_units 
FROM Universities u, Departments d, Courses c
WHERE u.name = 'University of Saskatchewan' AND u.id = d.university_id AND d.id = c.department_id ;

----2)
SELECT COUNT(*)
FROM sections s, (SELECT e.section_id, COUNT(student_id) AS student_number
                  FROM enrollments e
                  GROUP BY section_id) a
WHERE s.id = a.section_id AND s.num_enrolled = a.student_number;

-----3)
---Implicit Join

SELECT c.code AS course_code, c.name AS course_name, s.lec_type, s.max_enrollment, s.num_enrolled, (s.max_enrollment-s.num_enrolled) AS remaining_number_available, (i.first_name || ' ' || i.last_name) AS instructor_name, t.start_date AS term_start_date, t.end_date AS term_end_date, s.start_time AS section_start_time, s.end_time AS section_end_time
From Courses c, Sections s, Instructors i, Terms t, Departments d
Where s.course_id = c.id AND s.term_id = t.id AND s.instructor_id=i.id AND c.department_id = d.id AND d.name= 'Computer Science';  

---Explicit Join
SELECT c.code AS course_code, c.name AS course_name, s.lec_type, s.max_enrollment, s.num_enrolled, (s.max_enrollment-s.num_enrolled) AS remaining_number_available, (i.first_name || ' ' || i.last_name) AS instructor_name, t.start_date AS term_start_date, t.end_date AS term_end_date, s.start_time AS section_start_time, s.end_time AS section_end_time
From  Sections s
JOIN Courses c  ON s.course_id = c.id 
JOIN Instructors i ON s.instructor_id=i.id 
JOIN Terms t ON s.term_id = t.id
JOIN Departments d ON c.department_id = d.id AND d.name= 'Computer Science';  
   
----4)
SELECT c.code, c.name, modified_sections.lec_type,  modified_sections.num_of_sections
FROM Courses c, 
     (SELECT  s.lec_type,s.course_id,COUNT(s.id) as num_of_sections
     	FROM sections s
     	GROUP BY course_id, lec_type
     	) as modified_sections
Where modified_sections.course_id = c.id
ORDER BY c.code,
         modified_sections.num_of_sections;

---5)
SELECT c.code, c.name, s.section_code, s.lec_type, 
       CASE
       WHEN s.max_enrollment > s.num_enrolled THEN 'room available'
       WHEN s.max_enrollment = s.num_enrolled THEN 'section full'
       WHEN s.max_enrollment < s.num_enrolled THEN 'section over-filled'
       END AS section_status
FROM Courses c, sections s
Where s.course_id = c.id;


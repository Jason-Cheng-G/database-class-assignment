DO $$
DECLARE 
  L_ENROLL_ID INT;
  L_ST_REC RECORD;
  L_ENROLL_REC RECORD;
BEGIN

  SELECT COALESCE(MAX(id)+1, 1)
  INTO L_ENROLL_ID
  FROM enrollments; 
  
  FOR L_ST_REC IN (SELECT st.id as student_id, st.major_code FROM students st) LOOP
    FOR L_ENROLL_REC IN (SELECT min(s.id) section_id, s.lec_type, s.course_id 
                        FROM sections s
                        JOIN courses c ON c.id = s.course_id
                        JOIN departments d ON d.id = c.department_id 
                        JOIN universities u ON u.id = d.university_id 
                        WHERE L_ST_REC.major_code = d.code
                          -- is there still room for enrollments?
                          AND s.num_enrolled > ( COALESCE ((SELECT COUNT(id)
                                                  FROM enrollments e
                                                  WHERE e.section_id = s.id ),0)) 
                          -- is this person already enrolled in a section of this same type and course id?
                          AND NOT EXISTS (SELECT 1 
                                          FROM enrollments e2
                                          WHERE e2.student_id = L_ST_REC.student_id 
                                            AND e2.section_id IN (SELECT s2.id 
                                                                  FROM sections s2
                                                                  WHERE s2.id = s.id 
                                                                    AND s2.lec_type = s.lec_type) )
                        GROUP BY s.lec_type, s.course_id                                            
                        ) LOOP
                                                  
      
      INSERT INTO enrollments(id,student_id,section_id,grade,status_code)
      VALUES (L_ENROLL_ID, L_ST_REC.student_id, L_ENROLL_REC.section_id, null, 'ENROLLED');
  
      L_ENROLL_ID := L_ENROLL_ID + 1;
     
    END LOOP; 
  END LOOP;
END; $$


DO $$
DECLARE 
  L_ENROLL_ID INT;
  L_ST_REC RECORD;
BEGIN
  
  -- add universities 
  INSERT INTO universities(id, name)
  VALUES (1, 'University of Saskatchewan');
  INSERT INTO universities(id, name)
  VALUES (2, 'University of Regina');
  
  -- add departments
  INSERT INTO departments(id, code, name, university_id)
  VALUES(1, 'CMPT', 'Computer Science', 1);
  INSERT INTO departments(id, code, name, university_id)
  VALUES(2, 'HIST', 'History', 1);
  INSERT INTO departments(id, code, name, university_id)
  VALUES(3, 'GEOG', 'Geography', 1);
  INSERT INTO departments(id, code, name, university_id)
  VALUES(4, 'AGRC', 'Agriculture', 1);
  INSERT INTO departments(id, code, name, university_id)
  VALUES(5, 'CMPT', 'Computer Science', 2);
  INSERT INTO departments(id, code, name, university_id)
  VALUES(6, 'HIST', 'History', 2);
  INSERT INTO departments(id, code, name, university_id)
  VALUES(7, 'GEOG', 'Geography', 2);
  INSERT INTO departments(id, code, name, university_id)
  VALUES(8, 'AGRC', 'Agriculture', 2);
  
  -- add courses
  INSERT INTO courses(id, code, name, course_desc, credit_units, department_id)
  VALUES(10, 'CMPT355', 'Theory and Application of Databases', 'Lectures, assignments and projects dealing with the management, storage, and retrieval of large volumes of data. Concentrates on the relational data model, and relational data base management systems. Topics include: temporal data, recovery and concurrency, integrity and security, normalization, and semantic modelling. Additional topics include multimedia databases and other paradigms.',
    3, 1);
  INSERT INTO courses(id, code, name, course_desc, credit_units, department_id)
  VALUES(11, 'CMPT140', 'Introduction to Creative Computing', 'Concepts in Computing such as algorithms, problem solving, and programming are explored using interactive multimedia systems as the creative focus. Basic skills in problem solving, programming, design and interaction, event-based behaviour, and prototyping are developed.',
    3, 1);
  INSERT INTO courses(id, code, name, course_desc, credit_units, department_id)
  VALUES(12, 'CMPT260', 'Mathematical Logic and Computing', 'An introduction to elementary applied propositional and predicate logic. Fundamental proof techniques with an emphasis on induction. The theory of sets, relations and functions. Course concepts are related to computer science areas, with an emphasis on relational databases.',
    3, 1);
  
  INSERT INTO courses(id, code, name, course_desc, credit_units, department_id)
  VALUES(20, 'HIST205', 'Europe and World in High Middle Ages 1000 to 1300','Cluny and the Gregorian reform; the rise of feudal monarchy; Byzantium, Islam and the Crusades; twelfth century renaissance; universities and scholasticism; new forms of religious life; the peasantry; medieval women; the Holy Roman Empire and the Papacy; castles and cathedrals; feudal monarchies.',
    3, 2);
  INSERT INTO courses(id, code, name, course_desc, credit_units, department_id)
  VALUES(21, 'HIST193', 'History Matters Topics in Canadian History','Courses offered under this heading examine focused topics in Canadian History. These courses explore historical issues, events, or trends of importance in Canadian history. The courses are designed to provide a basic understanding of the historical narrative from multiple perspectives, to explore how and why such narratives have been constructed the way they have been, and—through such explorations—to introduce students to ‘thinking historically’. Lectures will explore historical narratives, their genesis, and the sources used to produce such narratives. Seminars will dig deeper into the tools and methodologies used by historians, provide instruction and practice in critical thinking and clear expression.',
    3, 2);
  
  INSERT INTO courses(id, code, name, course_desc, credit_units, department_id)
  VALUES(30, 'GEOG120', 'Introduction to Global Environmental Systems','An introduction to the principles, processes and interactions in the earth''s physical environment with a particular emphasis on the flow of energy and matter within global environmental systems. Topics include global radiation and energy balances, atmospheric and oceanic processes, the hydrological cycle, earth surface processes and biogeochemical cycling. Case studies are introduced to illustrate the interaction between human activity and the natural environment.',
    3, 3);
  

  INSERT INTO courses(id, code, name, course_desc, credit_units, department_id)
  VALUES(40, 'AGRC112', 'Animal Agriculture and Food Science', 'An introduction to agricultural systems and the interactions between microbial plant, animal, and human components. The emphasis is on issues and problems associated with animal production, value-added processing, marketing and the consumption of food.',
    3, 4);

  
  
  -- ADD terms 
  INSERT INTO terms(id, code, name, start_date, end_date)
  VALUES(1, 'FT2017', 'Fall Term 2017/2018', TO_DATE('09/06/2017','MM/DD/YYYY'), TO_DATE('12/07/2017','MM/DD/YYYY'));
  INSERT INTO terms(id, code, name, start_date, end_date)
  VALUES(2, 'WT2017', 'Winter Term 2017/2018', TO_DATE('01/03/2018','MM/DD/YYYY'), TO_DATE('04/06/2018','MM/DD/YYYY'));


  
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      1, 3559, 'Britt', 'McRobert', TO_DATE('12/02/2014','MM/DD/YYYY'), 
      'bmcrobert0@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      2, 8652, 'Barn', 'Ducker', TO_DATE('02/25/2012','MM/DD/YYYY'), 
      'bducker1@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      3, 4036, 'Felizio', 'Seed', TO_DATE('04/27/1994','MM/DD/YYYY'), 
      'fseed2@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      4, 1218, 'Charlotta', 'Fawcett', TO_DATE('12/14/2001','MM/DD/YYYY'), 
      'cfawcett3@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      5, 5366, 'Glynnis', 'Sampey', TO_DATE('02/14/2004','MM/DD/YYYY'), 
      'gsampey4@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      6, 3020, 'Grazia', 'Kivelle', TO_DATE('08/18/2006','MM/DD/YYYY'), 
      'gkivelle5@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      7, 9463, 'Ruthann', 'Pettyfar', TO_DATE('09/03/2005','MM/DD/YYYYY'), 
      'rpettyfar6@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      8, 1495, 'Giulio', 'Ottiwill', TO_DATE('11/21/2014','MM/DD/YYYY'), 
      'gottiwill7@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      9, 4820, 'George', 'Leadbeatter', TO_DATE('12/01/2001','MM/DD/YYYY'), 
      'gleadbeatter8@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      10, 3060, 'Roanna', 'Clatworthy', TO_DATE('05/17/2007','MM/DD/YYYY'), 
      'rclatworthy9@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      11, 4882, 'Dannye', 'Pate', TO_DATE('05/13/2017','MM/DD/YYYY'), 
      'dpatea@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      12, 5188, 'Christyna', 'Ortmann', TO_DATE('03/16/2010','MM/DD/YYYY'), 
      'cortmannb@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      13, 3243, 'Brian', 'Signore', TO_DATE('01/01/1996','MM/DD/YYYY'), 
      'bsignorec@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      14, 1237, 'Sande', 'Yurivtsev', TO_DATE('09/18/2005','MM/DD/YYYY'), 
      'syurivtsevd@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      15, 2262, 'Bibbye', 'Orridge', TO_DATE('12/16/2009','MM/DD/YYYY'), 
      'borridgee@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      16, 5020, 'Dolores', 'McDonand', TO_DATE('09/01/1993','MM/DD/YYYY'), 
      'dmcdonandf@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      17, 6595, 'Row', 'Blennerhassett', 
      TO_DATE('11/20/2016','MM/DD/YYYY'), 'rblennerhassettg@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      18, 9058, 'Ozzy', 'Firk', TO_DATE('09/09/2010','MM/DD/YYYY'), 
      'ofirkh@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      19, 11, 'Norrie', 'Vasnetsov', TO_DATE('01/28/1993','MM/DD/YYYY'), 
      'nvasnetsovi@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      20, 9312, 'Zelda', 'Heckle', TO_DATE('11/14/1993','MM/DD/YYYY'), 
      'zhecklej@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      21, 3218, 'Bord', 'Cattanach', TO_DATE('03/29/2012','MM/DD/YYYY'), 
      'bcattanachk@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      22, 4987, 'Shelley', 'Stapels', TO_DATE('09/26/2016','MM/DD/YYYY'), 
      'sstapelsl@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      23, 9183, 'Elisha', 'Garnson', TO_DATE('02/25/2006','MM/DD/YYYY'), 
      'egarnsonm@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      24, 5217, 'Karrah', 'Bernardin', TO_DATE('11/28/2009','MM/DD/YYYY'), 
      'kbernardinn@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      25, 8322, 'Karyn', 'Andrioletti', TO_DATE('06/04/1995','MM/DD/YYYY'), 
      'kandriolettio@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      26, 3888, 'Keelia', 'Aitken', TO_DATE('12/03/1996','MM/DD/YYYY'), 
      'kaitkenp@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      27, 7727, 'Marijn', 'Smithson', TO_DATE('04/15/2010','MM/DD/YYYY'), 
      'msmithsonq@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      28, 6342, 'Erda', 'Amberson', TO_DATE('09/26/2001','MM/DD/YYYY'), 
      'eambersonr@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      29, 6449, 'Kathy', 'Checo', TO_DATE('06/01/2014','MM/DD/YYYY'), 
      'kchecos@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      30, 4154, 'Pincas', 'Goldthorp', TO_DATE('02/04/2011','MM/DD/YYYY'), 
      'pgoldthorpt@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      31, 1487, 'Lucho', 'O''Hannay', TO_DATE('07/27/2001','MM/DD/YYYY'), 
      'lohannayu@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      32, 7548, 'Evelina', 'Kezourec', TO_DATE('01/12/2003','MM/DD/YYYY'), 
      'ekezourecv@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      33, 2988, 'Christos', 'Zaniolo', TO_DATE('11/05/2012','MM/DD/YYYY'), 
      'czaniolow@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      34, 8051, 'Gwyn', 'Comoletti', TO_DATE('04/12/2006','MM/DD/YYYY'), 
      'gcomolettix@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      35, 7516, 'Ruthe', 'Anthona', TO_DATE('07/20/1993','MM/DD/YYYY'), 
      'ranthonay@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      36, 2011, 'Arch', 'Hayworth', TO_DATE('10/27/1993','MM/DD/YYYY'), 
      'ahayworthz@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      37, 7342, 'Heda', 'Cordingley', TO_DATE('04/26/2012','MM/DD/YYYY'), 
      'hcordingley10@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      38, 8365, 'Tilda', 'Chung', TO_DATE('04/06/2000','MM/DD/YYYY'), 
      'tchung11@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      39, 5275, 'Robbert', 'Doole', TO_DATE('10/15/2013','MM/DD/YYYY'), 
      'rdoole12@usask.ca'
    );
  /* INSERT QUERY */
  INSERT INTO instructors(
    id, employee_number, first_name, last_name, 
    seniority_date, email_address
  ) 
  VALUES 
    (
      40, 73, 'Teddy', 'Pooley', TO_DATE('08/19/1999','MM/DD/YYYY'), 
      'tpooley13@usask.ca'
    );


  -- INSERT COMPUTER SCIENCE CLASS SECTIONS
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (85763,'01',11,'LEC',1,90,80,31,'MWF','09:30','10:20','ENG 2C40');
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (85764,'03',11,'LEC',1,100,83,32,'TR','13:00','14:20','ARTS 102');
  
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (85771,'L01',11,'LAB',1,34,34,39,'M','12:30','13:50','THORV S320');
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (85772,'L03',11,'LAB',1,34,34,39,'T','14:30','15:50','THORV S320');
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (85773,'L05',11,'LAB',1,34,32,39,'W','10:30','11:50','THORV S320');

  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (82736,'01',10,'LEC',1,89,89,1,'MWF','11:30','12:20','THORV 159');
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (86541,'T01',10,'TUT',1,48,49,1,'R','16:00','17:20','THORV S320');
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (86542,'T03',10,'TUT',1,41,40,1,'F','12:30','13:50','THORV S320');
  
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (80037,'01',12,'LEC',1,89,89,14,'MWF','11:30','12:20','THORV 159');
  
  -- INSERT HISTORY CLASS SECTIONS
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (86240,'29',20,'LEC',1,35,21,21,'T','10:00','12:50','EDUC 3133');
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (83062,'61',20,'LEC',1,50,34,20,'MWF','14:30','15:20','STM 260');
  
  -- INSERT AGRICULTURE CLASS SECTIONS
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (86147,'C61',40,'LEC',1,35,21,26,'W','13:00','15:50','YORK');
  
  -- INSERT GEOGRAPHY CLASS SECTIONS
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (80100,'01',30,'LEC',1,140,132,17,'MWF','09:30','10:20','ARTS 146');
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (80102,'L01',30,'LAB',1,35,35,18,'T','14:30','15:20','KIRK 144');
  INSERT INTO sections(id,section_code,course_id,lec_type,term_id,max_enrollment,num_enrolled,instructor_id,days,start_time,end_time,location_code)
  VALUES (80103,'L03',30,'LAB',1,35,34,18,'W','12:30','13:20','AGRI 1E79');
  

  -- add students
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1, 5468, 'Mort', 'Huntress', 'mhuntress0@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      2, 4364, 'Reinaldo', 'Houndson', 'rhoundson1@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      3, 763, 'Irma', 'Zute', 'izute2@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4, 8248, 'Keven', 'Southerell', 'ksoutherell3@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      5, 5385, 'Kira', 'Garret', 'kgarret4@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      6, 2350, 'Dannel', 'Civitillo', 'dcivitillo5@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      7, 7205, 'Elmo', 'Blanchflower', 'eblanchflower6@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8, 860, 'Anna-diana', 'Reinmar', 'areinmar7@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      9, 1156, 'Nerte', 'Willingale', 'nwillingale8@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      10, 3303, 'Ax', 'Dunkley', 'adunkley9@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      11, 6799, 'Dani', 'Ayrs', 'dayrsa@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      12, 28, 'Yasmeen', 'Wilcher', 'ywilcherb@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      13, 7512, 'Marin', 'Brothwood', 'mbrothwoodc@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      14, 1114, 'Evvie', 'Fintoph', 'efintophd@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      15, 4655, 'Grantley', 'Endley', 'gendleye@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      16, 2624, 'Marney', 'Hardcastle', 'mhardcastlef@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      17, 9771, 'Dacey', 'Ahren', 'dahreng@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      18, 2522, 'Huberto', 'Bromilow', 'hbromilowh@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      19, 6544, 'Jermaine', 'Waby', 'jwabyi@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      20, 5495, 'Micheline', 'Saward', 'msawardj@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      21, 8815, 'Flossie', 'Say', 'fsayk@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      22, 74, 'Milli', 'Eble', 'meblel@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      23, 1214, 'Lambert', 'Suggey', 'lsuggeym@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      24, 1024, 'Alvy', 'Schultes', 'aschultesn@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      25, 2166, 'Gilles', 'Matuszkiewicz', 
      'gmatuszkiewiczo@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      26, 3849, 'Garland', 'Biesinger', 'gbiesingerp@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      27, 6778, 'Karyn', 'Chaffe', 'kchaffeq@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      28, 3518, 'Hazel', 'Cail', 'hcailr@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      29, 1835, 'Ivory', 'Obbard', 'iobbards@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      30, 4675, 'Putnam', 'Fendlow', 'pfendlowt@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      31, 1045, 'Brodie', 'Covely', 'bcovelyu@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      32, 6459, 'Riley', 'Copley', 'rcopleyv@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      33, 4853, 'Corrianne', 'Jordi', 'cjordiw@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      34, 7046, 'Audrey', 'MacAllester', 
      'amacallesterx@usask.ca', 'AGRC', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      35, 189, 'Irv', 'MacMichael', 'imacmichaely@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      36, 1655, 'Tabby', 'Glasebrook', 'tglasebrookz@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      37, 3236, 'Sibyl', 'Fairlem', 'sfairlem10@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      38, 414, 'Corine', 'Berrington', 'cberrington11@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      39, 2866, 'Nettie', 'Lynagh', 'nlynagh12@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      40, 6105, 'Vincents', 'Ravillas', 'vravillas13@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      41, 8766, 'Aland', 'Heffer', 'aheffer14@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      42, 3041, 'Clio', 'Kemme', 'ckemme15@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      43, 2251, 'Odille', 'Parren', 'oparren16@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      44, 9607, 'Giuditta', 'Vatcher', 'gvatcher17@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      45, 5024, 'Fidelia', 'Castle', 'fcastle18@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      46, 5944, 'Kristal', 'Trevillion', 
      'ktrevillion19@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      47, 503, 'Kale', 'Pepperd', 'kpepperd1a@usask.ca', 
      'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      48, 9926, 'Wendye', 'Solomon', 'wsolomon1b@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      49, 7229, 'Andris', 'Ferretti', 'aferretti1c@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      50, 8850, 'Rafaellle', 'Patington', 
      'rpatington1d@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      51, 4903, 'Meridith', 'Matushevitz', 
      'mmatushevitz1e@usask.ca', 'AGRC', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      52, 5458, 'Jocko', 'Wyeld', 'jwyeld1f@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      53, 4149, 'Gennie', 'Cotter', 'gcotter1g@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      54, 7527, 'Aleen', 'Haylands', 'ahaylands1h@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      55, 636, 'Shalne', 'Wartonby', 'swartonby1i@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      56, 1070, 'Noreen', 'Carlisi', 'ncarlisi1j@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      57, 412, 'Cindie', 'Lembrick', 'clembrick1k@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      58, 1423, 'Harmonie', 'Ramet', 'hramet1l@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      59, 1952, 'Othilie', 'Edmund', 'oedmund1m@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      60, 2132, 'Fredra', 'Kave', 'fkave1n@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      61, 4667, 'Lenci', 'Hemphall', 'lhemphall1o@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      62, 3156, 'Lucie', 'Clemmett', 'lclemmett1p@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      63, 8288, 'Cullan', 'Dedden', 'cdedden1q@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      64, 8822, 'Jori', 'Heaysman', 'jheaysman1r@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      65, 8656, 'Tasia', 'Leyton', 'tleyton1s@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      66, 596, 'Horacio', 'Dyka', 'hdyka1t@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      67, 8624, 'Beverlee', 'McGaughey', 
      'bmcgaughey1u@usask.ca', 'GEOG', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      68, 7586, 'Farly', 'Perillio', 'fperillio1v@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      69, 8981, 'Tam', 'Volke', 'tvolke1w@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      70, 3185, 'Kinny', 'Tomsett', 'ktomsett1x@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      71, 5507, 'Gwyn', 'Capponer', 'gcapponer1y@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      72, 2722, 'Noe', 'Leverett', 'nleverett1z@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      73, 8511, 'Jade', 'Simonnet', 'jsimonnet20@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      74, 258, 'Nanete', 'Wison', 'nwison21@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      75, 4753, 'Breanne', 'Sutherby', 'bsutherby22@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      76, 1698, 'Roxie', 'Airey', 'rairey23@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      77, 6457, 'Regan', 'McMeyler', 'rmcmeyler24@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      78, 2681, 'Salli', 'Wharram', 'swharram25@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      79, 2361, 'Tierney', 'Giorgini', 'tgiorgini26@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      80, 3459, 'Babita', 'Wellfare', 'bwellfare27@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      81, 6874, 'Meghann', 'Pusill', 'mpusill28@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      82, 6904, 'Cirstoforo', 'Jinkins', 
      'cjinkins29@usask.ca', 'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      83, 3966, 'Lincoln', 'Girton', 'lgirton2a@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      84, 271, 'Johannah', 'Leppington', 
      'jleppington2b@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      85, 5356, 'Carmelina', 'Humerstone', 
      'chumerstone2c@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      86, 4504, 'Randell', 'La Croce', 'rlacroce2d@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      87, 9532, 'Shela', 'Evreux', 'sevreux2e@usask.ca', 
      'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      88, 5834, 'Tine', 'Castanie', 'tcastanie2f@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      89, 1862, 'Chlo', 'Barnish', 'cbarnish2g@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      90, 444, 'Verne', 'Aindriu', 'vaindriu2h@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      91, 3853, 'Dahlia', 'Grelik', 'dgrelik2i@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      92, 2844, 'Malynda', 'McCorkindale', 
      'mmccorkindale2j@usask.ca', 'AGRC', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      93, 8334, 'Gilli', 'Allender', 'gallender2k@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      94, 6323, 'Claudelle', 'Swinbourne', 
      'cswinbourne2l@usask.ca', 'HIST', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      95, 6456, 'Ertha', 'Duer', 'eduer2m@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      96, 322, 'Astrid', 'Adanet', 'aadanet2n@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      97, 1015, 'Meier', 'Sneden', 'msneden2o@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      98, 1858, 'Claudio', 'Mathe', 'cmathe2p@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      99, 4093, 'Evelyn', 'Reims', 'ereims2q@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      100, 2411, 'Tully', 'Colnet', 'tcolnet2r@usask.ca', 
      'CMPT', 'U'
    );

  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4501, 22598, 'Tod', 'Boarer', 'tboarer0@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4502, 33747, 'Hedda', 'Dummigan', 'hdummigan1@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4503, 45532, 'Melany', 'Lindholm', 
      'mlindholm2@usask.ca', 'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4504, 49477, 'Tremayne', 'Baison', 
      'tbaison3@usask.ca', 'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4505, 37834, 'Susi', 'Cawt', 'scawt4@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4506, 38982, 'Arman', 'Shoorbrooke', 
      'ashoorbrooke5@usask.ca', 'GEOG', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4507, 54372, 'Mikel', 'Ballach', 'mballach6@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4508, 50312, 'Charleen', 'Persicke', 
      'cpersicke7@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4509, 21124, 'Margalit', 'Malenfant', 
      'mmalenfant8@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4510, 31828, 'Emmalynne', 'Benoy', 
      'ebenoy9@usask.ca', 'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4511, 43171, 'Karil', 'Laffin', 'klaffina@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4512, 59613, 'Marco', 'Sebyer', 'msebyerb@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4513, 54874, 'Faber', 'Southwell', 
      'fsouthwellc@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4514, 29837, 'Julienne', 'Shinfield', 
      'jshinfieldd@usask.ca', 'CMPT', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4515, 21406, 'Valle', 'Ferrey', 'vferreye@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4516, 58986, 'Chaim', 'Geany', 'cgeanyf@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4517, 20250, 'Darnall', 'Colegate', 
      'dcolegateg@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4518, 51068, 'Sophronia', 'Butterfill', 
      'sbutterfillh@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4519, 31385, 'Padgett', 'Fitzgerald', 
      'pfitzgeraldi@usask.ca', 'GEOG', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4520, 54579, 'Melisse', 'Gollop', 'mgollopj@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4521, 40647, 'Kristine', 'Pietruschka', 
      'kpietruschkak@usask.ca', 'HIST', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4522, 49360, 'Hortense', 'Gaskamp', 
      'hgaskampl@usask.ca', 'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4523, 37589, 'Elisa', 'Alywen', 'ealywenm@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4524, 37462, 'Ellis', 'Moss', 'emossn@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4525, 46955, 'Ethyl', 'Fyndon', 'efyndono@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4526, 49030, 'Rikki', 'Fallon', 'rfallonp@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4527, 49627, 'Morey', 'Champness', 
      'mchampnessq@usask.ca', 'CMPT', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4528, 56876, 'Pepita', 'Portwaine', 
      'pportwainer@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4529, 53639, 'Andeee', 'Cranidge', 
      'acranidges@usask.ca', 'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4530, 22844, 'Kassie', 'Chooter', 'kchootert@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4531, 50214, 'Adrian', 'Gytesham', 
      'agyteshamu@usask.ca', 'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4532, 33195, 'Della', 'Erik', 'derikv@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4533, 42584, 'Bo', 'Titford', 'btitfordw@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4534, 36744, 'Abel', 'Chavrin', 'achavrinx@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4535, 20353, 'Francene', 'Chadband', 
      'fchadbandy@usask.ca', 'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4536, 47467, 'Tina', 'Menicomb', 'tmenicombz@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4537, 41417, 'Kippy', 'Kalb', 'kkalb10@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4538, 29833, 'Eric', 'Everill', 'eeverill11@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4539, 22793, 'Martguerita', 'Cootes', 
      'mcootes12@usask.ca', 'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4540, 47228, 'Terese', 'Pettet', 'tpettet13@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4541, 22941, 'Damian', 'Swancott', 
      'dswancott14@usask.ca', 'AGRC', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4542, 23947, 'Graham', 'Lewsley', 'glewsley15@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4543, 32120, 'Janene', 'Thomasset', 
      'jthomasset16@usask.ca', 'GEOG', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4544, 34256, 'Dee', 'Moneti', 'dmoneti17@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4545, 47674, 'Sunshine', 'Gallanders', 
      'sgallanders18@usask.ca', 'HIST', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4546, 34625, 'Max', 'Reis', 'mreis19@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4547, 33137, 'Arlen', 'Harral', 'aharral1a@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4548, 31339, 'Gweneth', 'Braithwaite', 
      'gbraithwaite1b@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4549, 48886, 'Estelle', 'Willgoose', 
      'ewillgoose1c@usask.ca', 'HIST', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4550, 38657, 'Michale', 'Flowerdew', 
      'mflowerdew1d@usask.ca', 'CMPT', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4551, 23415, 'Eal', 'Meins', 'emeins1e@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4552, 58163, 'Karylin', 'Larcombe', 
      'klarcombe1f@usask.ca', 'AGRC', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4553, 23481, 'Nerte', 'De Minico', 
      'ndeminico1g@usask.ca', 'HIST', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4554, 36154, 'Gae', 'Vigne', 'gvigne1h@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4555, 45891, 'Elihu', 'Amorine', 'eamorine1i@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4556, 36304, 'Elwin', 'Stennard', 'estennard1j@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4557, 42393, 'Leila', 'Sandon', 'lsandon1k@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4558, 53108, 'Celia', 'Goundrill', 
      'cgoundrill1l@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4559, 49319, 'Lorita', 'Epinay', 'lepinay1m@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4560, 43540, 'Gus', 'Ruggieri', 'gruggieri1n@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4561, 33118, 'Flory', 'Riglesford', 
      'friglesford1o@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4562, 25886, 'Alano', 'Darkin', 'adarkin1p@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4563, 47110, 'Quinn', 'Slany', 'qslany1q@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4564, 56015, 'Stillmann', 'Lawrenceson', 
      'slawrenceson1r@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4565, 30159, 'Vania', 'Sifleet', 'vsifleet1s@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4566, 27200, 'Gretta', 'Cossem', 'gcossem1t@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4567, 59930, 'Rice', 'Gooble', 'rgooble1u@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4568, 33703, 'Vaughn', 'Woodley', 'vwoodley1v@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4569, 59721, 'Geoffry', 'Murton', 'gmurton1w@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4570, 22173, 'Roshelle', 'Millberg', 
      'rmillberg1x@usask.ca', 'HIST', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4571, 49678, 'Heda', 'Follitt', 'hfollitt1y@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4572, 58848, 'Rubin', 'Stern', 'rstern1z@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4573, 28838, 'Mireille', 'Alfonsetti', 
      'malfonsetti20@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4574, 31146, 'Roger', 'Bedham', 'rbedham21@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4575, 57041, 'Rora', 'Winnard', 'rwinnard22@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4576, 59088, 'Talbert', 'Bayliss', 
      'tbayliss23@usask.ca', 'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4577, 25594, 'Tedi', 'Wearne', 'twearne24@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4578, 32711, 'Rina', 'Jeynes', 'rjeynes25@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4579, 55609, 'Elenore', 'Dufton', 'edufton26@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4580, 51707, 'Bertie', 'Cressingham', 
      'bcressingham27@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4581, 24589, 'Natalee', 'Bencher', 
      'nbencher28@usask.ca', 'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4582, 28593, 'Charles', 'Barnfield', 
      'cbarnfield29@usask.ca', 'AGRC', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4583, 29129, 'Tiffani', 'Orange', 'torange2a@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4584, 55024, 'Palm', 'Epsley', 'pepsley2b@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4585, 25969, 'Kassie', 'Vaun', 'kvaun2c@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4586, 50943, 'Gabey', 'McEneny', 'gmceneny2d@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4587, 58355, 'Garner', 'Crowdace', 
      'gcrowdace2e@usask.ca', 'AGRC', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4588, 20181, 'Perri', 'Muncie', 'pmuncie2f@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4589, 56946, 'Orly', 'Wychard', 'owychard2g@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4590, 36566, 'Doro', 'Burlingame', 
      'dburlingame2h@usask.ca', 'CMPT', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4591, 56161, 'Trixi', 'Cargon', 'tcargon2i@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4592, 24387, 'Domenico', 'Stanion', 
      'dstanion2j@usask.ca', 'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4593, 54993, 'Dane', 'Van den Oord', 
      'dvandenoord2k@usask.ca', 'AGRC', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4594, 20652, 'Jarred', 'Delacourt', 
      'jdelacourt2l@usask.ca', 'AGRC', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4595, 21471, 'Rolf', 'Joslyn', 'rjoslyn2m@usask.ca', 
      'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4596, 31577, 'Kizzee', 'Fruchon', 'kfruchon2n@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4597, 30851, 'Virge', 'Amor', 'vamor2o@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4598, 44274, 'Carlita', 'Woolrich', 
      'cwoolrich2p@usask.ca', 'AGRC', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4599, 27458, 'Bale', 'Loveguard', 'bloveguard2q@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4600, 33893, 'Jeana', 'Guitte', 'jguitte2r@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4601, 34938, 'Sisile', 'Swinfon', 'sswinfon2s@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4602, 54598, 'Florentia', 'Giorgione', 
      'fgiorgione2t@usask.ca', 'AGRC', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4603, 27854, 'Zane', 'Moncaster', 'zmoncaster2u@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4604, 36007, 'Alexander', 'Alexsandrowicz', 
      'aalexsandrowicz2v@usask.ca', 'CMPT', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4605, 24868, 'Gizela', 'Folger', 'gfolger2w@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4606, 57038, 'Karalynn', 'Fawloe', 
      'kfawloe2x@usask.ca', 'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4607, 32699, 'Joyous', 'Escofier', 
      'jescofier2y@usask.ca', 'AGRC', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4608, 24262, 'Barny', 'Matthias', 'bmatthias2z@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4609, 52544, 'Reider', 'Partkya', 'rpartkya30@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4610, 21629, 'Marrissa', 'Polhill', 
      'mpolhill31@usask.ca', 'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4611, 33950, 'Joshua', 'Lunt', 'jlunt32@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4612, 28064, 'Shannon', 'Fallis', 'sfallis33@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4613, 58036, 'Cull', 'Kubin', 'ckubin34@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4614, 41651, 'Esmaria', 'Comoletti', 
      'ecomoletti35@usask.ca', 'GEOG', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4615, 44955, 'Martha', 'Burcher', 'mburcher36@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4616, 21030, 'Stoddard', 'Roscamps', 
      'sroscamps37@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4617, 22193, 'Kennith', 'Burfoot', 
      'kburfoot38@usask.ca', 'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4618, 55395, 'Allyce', 'Dalliwatr', 
      'adalliwatr39@usask.ca', 'GEOG', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4619, 23765, 'D''arcy', 'Caswill', 
      'dcaswill3a@usask.ca', 'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4620, 22515, 'Luciana', 'Ference', 
      'lference3b@usask.ca', 'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4621, 22794, 'Petronia', 'Krauss', 
      'pkrauss3c@usask.ca', 'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4622, 20786, 'Maximilianus', 'Charopen', 
      'mcharopen3d@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4623, 39911, 'Candida', 'Terrelly', 
      'cterrelly3e@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4624, 50420, 'Humfrey', 'Meletti', 
      'hmeletti3f@usask.ca', 'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4625, 24195, 'Linet', 'Byer', 'lbyer3g@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4626, 39648, 'Hermann', 'Tague', 'htague3h@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4627, 50305, 'Rourke', 'Gosnoll', 'rgosnoll3i@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4628, 45540, 'Chelsae', 'Labbey', 'clabbey3j@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4629, 32537, 'Mead', 'Bundey', 'mbundey3k@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4630, 27532, 'Kathryne', 'Norrington', 
      'knorrington3l@usask.ca', 'AGRC', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4631, 58646, 'Alric', 'Hassey', 'ahassey3m@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4632, 54480, 'Cherilyn', 'Aldrick', 
      'caldrick3n@usask.ca', 'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4633, 37449, 'Clotilda', 'Halwell', 
      'chalwell3o@usask.ca', 'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4634, 35436, 'Candida', 'Gandar', 'cgandar3p@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4635, 48986, 'Ruthie', 'Veneur', 'rveneur3q@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4636, 50489, 'Lucien', 'Stickles', 
      'lstickles3r@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4637, 40867, 'Clarissa', 'de Courcey', 
      'cdecourcey3s@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4638, 24577, 'Sadella', 'Holdin', 'sholdin3t@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4639, 59898, 'Gonzales', 'Vasile', 
      'gvasile3u@usask.ca', 'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4640, 44448, 'Chrysler', 'Dugald', 
      'cdugald3v@usask.ca', 'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4641, 42392, 'Everard', 'Tomasi', 'etomasi3w@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4642, 24684, 'Bobinette', 'Orrill', 
      'borrill3x@usask.ca', 'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4643, 34653, 'Jillana', 'Libbie', 'jlibbie3y@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4644, 32561, 'Winslow', 'Stranks', 
      'wstranks3z@usask.ca', 'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4645, 45453, 'Dario', 'Sextone', 'dsextone40@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4646, 23259, 'Wendel', 'Karpmann', 
      'wkarpmann41@usask.ca', 'GEOG', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4647, 48028, 'Humfried', 'Cheales', 
      'hcheales42@usask.ca', 'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4648, 51824, 'Collette', 'Guiraud', 
      'cguiraud43@usask.ca', 'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4649, 29262, 'Giffer', 'Quinet', 'gquinet44@usask.ca', 
      'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4650, 45248, 'Shep', 'Gherardini', 
      'sgherardini45@usask.ca', 'HIST', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4651, 44226, 'Conny', 'Cardinale', 
      'ccardinale46@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4652, 39331, 'Devina', 'Joust', 'djoust47@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4653, 36647, 'Yulma', 'MacRannell', 
      'ymacrannell48@usask.ca', 'HIST', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4654, 59699, 'Courtnay', 'Cartin', 
      'ccartin49@usask.ca', 'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4655, 30930, 'Tabbie', 'Woodcroft', 
      'twoodcroft4a@usask.ca', 'AGRC', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4656, 22719, 'Cordi', 'Shotboulte', 
      'cshotboulte4b@usask.ca', 'HIST', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4657, 45085, 'Tabitha', 'Kynan', 'tkynan4c@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4658, 35750, 'Mayor', 'Goodliffe', 
      'mgoodliffe4d@usask.ca', 'AGRC', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4659, 39842, 'Andreas', 'Poyzer', 'apoyzer4e@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4660, 54833, 'Christie', 'McGuiney', 
      'cmcguiney4f@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4661, 41967, 'Evelyn', 'Benger', 'ebenger4g@usask.ca', 
      'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4662, 37978, 'Winna', 'Stiddard', 'wstiddard4h@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4663, 21566, 'Bryana', 'Stetlye', 'bstetlye4i@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4664, 43158, 'Ethel', 'Delatour', 'edelatour4j@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4665, 20083, 'Brander', 'Vedenyapin', 
      'bvedenyapin4k@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4666, 45921, 'Peirce', 'Flitcroft', 
      'pflitcroft4l@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4667, 29025, 'Ardenia', 'Elphee', 'aelphee4m@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4668, 51988, 'Eachelle', 'Byrne', 'ebyrne4n@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4669, 32086, 'Lyle', 'Thoresbie', 'lthoresbie4o@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4670, 49969, 'Deni', 'Barratt', 'dbarratt4p@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4671, 48765, 'Bryna', 'Standbrooke', 
      'bstandbrooke4q@usask.ca', 'CMPT', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4672, 21782, 'Reinhard', 'Southerell', 
      'rsoutherell4r@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4673, 40982, 'Woody', 'Gliddon', 'wgliddon4s@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4674, 58805, 'Ardelia', 'Horsburgh', 
      'ahorsburgh4t@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4675, 23619, 'Gilda', 'Giorgeschi', 
      'ggiorgeschi4u@usask.ca', 'GEOG', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4676, 31327, 'Torrey', 'Shelly', 'tshelly4v@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4677, 32811, 'Danie', 'Dyball', 'ddyball4w@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4678, 58683, 'Clary', 'Lumm', 'clumm4x@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4679, 52367, 'Angy', 'Fenix', 'afenix4y@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4680, 33920, 'Ailyn', 'MacFaell', 'amacfaell4z@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4681, 40184, 'Mayer', 'Mattusov', 'mmattusov50@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4682, 53564, 'Errick', 'Esby', 'eesby51@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4683, 28482, 'Lind', 'Meaddowcroft', 
      'lmeaddowcroft52@usask.ca', 'AGRC', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4684, 25893, 'Elaina', 'Gudgeon', 'egudgeon53@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4685, 33303, 'Delmer', 'McDool', 'dmcdool54@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4686, 23888, 'Colas', 'Wagg', 'cwagg55@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4687, 49620, 'Lani', 'Courtier', 'lcourtier56@usask.ca', 
      'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4688, 43051, 'Bendicty', 'Pyner', 'bpyner57@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4689, 46272, 'Kiel', 'Scotchbrook', 
      'kscotchbrook58@usask.ca', 'GEOG', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4690, 23492, 'Cher', 'Michelin', 'cmichelin59@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4691, 24888, 'Fanechka', 'Chasemore', 
      'fchasemore5a@usask.ca', 'GEOG', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4692, 28389, 'Aubry', 'Littell', 'alittell5b@usask.ca', 
      'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4693, 58408, 'Felicdad', 'Labusquiere', 
      'flabusquiere5c@usask.ca', 'HIST', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4694, 34208, 'Barty', 'Gyrgorcewicx', 
      'bgyrgorcewicx5d@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4695, 59411, 'Daryle', 'Durn', 'ddurn5e@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4696, 27928, 'Reynold', 'Carlino', 
      'rcarlino5f@usask.ca', 'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4697, 59667, 'Godfree', 'Sammes', 'gsammes5g@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4698, 47289, 'Son', 'McIan', 'smcian5h@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4699, 40589, 'Eleni', 'Llewelly', 'ellewelly5i@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4700, 54610, 'Mavis', 'Crockatt', 'mcrockatt5j@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4701, 53409, 'Conny', 'Anersen', 'canersen5k@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4702, 36076, 'Gary', 'Greenset', 'ggreenset5l@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4703, 54275, 'Eloisa', 'McKeighan', 
      'emckeighan5m@usask.ca', 'CMPT', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4704, 46527, 'Arline', 'Truse', 'atruse5n@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4705, 24890, 'Alecia', 'Ravel', 'aravel5o@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4706, 25703, 'Heidi', 'Lamyman', 'hlamyman5p@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4707, 25189, 'Field', 'Nuttall', 'fnuttall5q@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4708, 35167, 'Elmo', 'Devers', 'edevers5r@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4709, 36643, 'Carolina', 'Chatt', 'cchatt5s@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4710, 47829, 'Blisse', 'Sterman', 'bsterman5t@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4711, 30128, 'Kristan', 'Sehorsch', 
      'ksehorsch5u@usask.ca', 'GEOG', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4712, 20360, 'Tedda', 'Chitham', 'tchitham5v@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4713, 33622, 'Haley', 'Winckworth', 
      'hwinckworth5w@usask.ca', 'CMPT', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4714, 59008, 'Mirna', 'Oxshott', 'moxshott5x@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4715, 25042, 'Gard', 'Conford', 'gconford5y@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4716, 49647, 'Ezra', 'Pharoah', 'epharoah5z@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4717, 42494, 'Cher', 'Kynett', 'ckynett60@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4718, 44116, 'Winni', 'Eddy', 'weddy61@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4719, 59477, 'Lian', 'Pellissier', 
      'lpellissier62@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4720, 48699, 'Alonso', 'Blackston', 
      'ablackston63@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4721, 35716, 'Evita', 'Guerro', 'eguerro64@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4722, 48865, 'Kain', 'Kinkaid', 'kkinkaid65@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4723, 25588, 'Gardie', 'Dalgety', 'gdalgety66@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4724, 34018, 'Guss', 'Marwood', 'gmarwood67@usask.ca', 
      'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4725, 53507, 'Beatrix', 'Baccus', 'bbaccus68@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4726, 53857, 'Etti', 'Pinchbeck', 'epinchbeck69@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4727, 32510, 'Vite', 'Maunsell', 'vmaunsell6a@usask.ca', 
      'AGRC', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4728, 42056, 'Ettie', 'Sweed', 'esweed6b@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4729, 41488, 'Fred', 'Neaves', 'fneaves6c@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4730, 37903, 'Egor', 'Bleasby', 'ebleasby6d@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4731, 36494, 'Bibby', 'MacHostie', 
      'bmachostie6e@usask.ca', 'GEOG', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4732, 53890, 'Averil', 'Fudge', 'afudge6f@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4733, 37035, 'Sheilakathryn', 'Eles', 
      'seles6g@usask.ca', 'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4734, 38384, 'Sayres', 'Massey', 'smassey6h@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4735, 22836, 'Roanne', 'Suttie', 'rsuttie6i@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4736, 59879, 'Darcee', 'Braine', 'dbraine6j@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4737, 28199, 'Elise', 'Illyes', 'eillyes6k@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4738, 41961, 'Shawn', 'Lipsett', 'slipsett6l@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4739, 23619, 'Freddy', 'Stoppard', 
      'fstoppard6m@usask.ca', 'CMPT', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4740, 51597, 'Sidnee', 'Haysar', 'shaysar6n@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4741, 29986, 'Willard', 'Donoghue', 
      'wdonoghue6o@usask.ca', 'HIST', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4742, 26454, 'Ulrica', 'Ollerhad', 
      'uollerhad6p@usask.ca', 'HIST', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4743, 53056, 'Robby', 'Quantrell', 
      'rquantrell6q@usask.ca', 'AGRC', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4744, 28657, 'Helaina', 'Ahearne', 
      'hahearne6r@usask.ca', 'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4745, 34262, 'Naomi', 'Beggin', 'nbeggin6s@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4746, 36151, 'Brittani', 'Burberry', 
      'bburberry6t@usask.ca', 'CMPT', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4747, 33824, 'Liuka', 'Redmain', 'lredmain6u@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4748, 59702, 'Wit', 'Swedeland', 'wswedeland6v@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4749, 20287, 'Gale', 'Nuth', 'gnuth6w@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4750, 38548, 'Ignazio', 'Jablonski', 
      'ijablonski6x@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4751, 52213, 'Melinda', 'Kermode', 
      'mkermode6y@usask.ca', 'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4752, 42896, 'Brockie', 'Chritchley', 
      'bchritchley6z@usask.ca', 'CMPT', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4753, 31997, 'Consuelo', 'Allport', 
      'callport70@usask.ca', 'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4754, 54805, 'Lek', 'Di Baudi', 'ldibaudi71@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4755, 26262, 'Frank', 'Karran', 'fkarran72@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4756, 22771, 'Alanson', 'Bachura', 
      'abachura73@usask.ca', 'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4757, 33975, 'Simonette', 'Dresser', 
      'sdresser74@usask.ca', 'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4758, 23045, 'Helena', 'Castelin', 
      'hcastelin75@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4759, 20630, 'Dulsea', 'Reichelt', 
      'dreichelt76@usask.ca', 'AGRC', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4760, 32925, 'Janelle', 'Hughf', 'jhughf77@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4761, 44940, 'Basilius', 'Aindriu', 
      'baindriu78@usask.ca', 'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4762, 25215, 'Torr', 'Kedward', 'tkedward79@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4763, 36414, 'Marcella', 'Pinyon', 
      'mpinyon7a@usask.ca', 'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4764, 47464, 'Adriena', 'Cockley', 
      'acockley7b@usask.ca', 'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4765, 22154, 'Lesley', 'Manchester', 
      'lmanchester7c@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4766, 48458, 'Debby', 'Viant', 'dviant7d@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4767, 29836, 'Nathanial', 'Braunter', 
      'nbraunter7e@usask.ca', 'GEOG', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4768, 56400, 'Leonerd', 'Snasel', 'lsnasel7f@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4769, 21301, 'Guglielma', 'Fery', 'gfery7g@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4770, 24436, 'Marabel', 'Ellson', 'mellson7h@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4771, 22320, 'Jo ann', 'Elliot', 'jelliot7i@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4772, 41941, 'Melli', 'FitzGilbert', 
      'mfitzgilbert7j@usask.ca', 'GEOG', 
      'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4773, 23153, 'Terence', 'Maier', 'tmaier7k@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4774, 48686, 'Peadar', 'Egalton', 'pegalton7l@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4775, 57240, 'Gilli', 'Heyward', 'gheyward7m@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4776, 29723, 'Loydie', 'Rutley', 'lrutley7n@usask.ca', 
      'GEOG', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4777, 30293, 'Janka', 'Innes', 'jinnes7o@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4778, 26523, 'Jehu', 'Pyford', 'jpyford7p@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4779, 34891, 'Kakalina', 'Poetz', 'kpoetz7q@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4780, 41168, 'Alameda', 'Findon', 'afindon7r@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4781, 55169, 'Charlton', 'Oulner', 
      'coulner7s@usask.ca', 'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4782, 26170, 'Eddie', 'Robilart', 'erobilart7t@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4783, 29485, 'Vassily', 'Joy', 'vjoy7u@usask.ca', 
      'HIST', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4784, 42145, 'Sonnnie', 'Bottle', 'sbottle7v@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4785, 54534, 'Maddy', 'Keating', 'mkeating7w@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4786, 48456, 'Alane', 'Theodoris', 
      'atheodoris7x@usask.ca', 'CMPT', 
      'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4787, 22083, 'Arlyn', 'Dioniso', 'adioniso7y@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4788, 40763, 'Tilly', 'Leuren', 'tleuren7z@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4789, 52158, 'Duffy', 'Allebone', 'dallebone80@usask.ca', 
      'HIST', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4790, 22902, 'Sephira', 'Kitman', 'skitman81@usask.ca', 
      'HIST', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4791, 34874, 'Margalo', 'Polino', 'mpolino82@usask.ca', 
      'GEOG', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4792, 54065, 'Ephrem', 'Bealing', 'ebealing83@usask.ca', 
      'HIST', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4793, 42121, 'Thorndike', 'Thirlwell', 
      'tthirlwell84@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4794, 46503, 'Emilie', 'Fann', 'efann85@usask.ca', 
      'AGRC', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4795, 59133, 'Lem', 'Girvan', 'lgirvan86@usask.ca', 
      'CMPT', 'N'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4796, 28038, 'Eadie', 'Valder', 'evalder87@usask.ca', 
      'CMPT', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4797, 26307, 'Elwyn', 'Jiruca', 'ejiruca88@usask.ca', 
      'AGRC', 'U'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4798, 24894, 'Rubina', 'Antognozzii', 
      'rantognozzii89@usask.ca', 'AGRC', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4799, 30759, 'Samantha', 'Beenham', 
      'sbeenham8a@usask.ca', 'AGRC', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      4800, 22007, 'Hobey', 'Littrick', 'hlittrick8b@usask.ca', 
      'GEOG', 'U'
    );
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8001, 78813, 'Agatha', 'Dunmuir', 'adunmuir0@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8002, 75005, 'Isac', 'Losseljong', 
      'ilosseljong1@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8003, 78819, 'Gawen', 'Tregale', 'gtregale2@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8004, 71735, 'Aile', 'Borgne', 'aborgne3@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8005, 73681, 'Lucia', 'Poskitt', 'lposkitt4@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8006, 78938, 'Henrieta', 'Brunt', 'hbrunt5@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8007, 77500, 'Darcy', 'Dossett', 'ddossett6@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8008, 76987, 'Susette', 'Cuerdale', 
      'scuerdale7@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8009, 76165, 'Devin', 'Newlan', 'dnewlan8@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8010, 76291, 'Amelia', 'Arrington', 
      'aarrington9@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8011, 70955, 'Delia', 'Rigby', 'drigbya@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8012, 78600, 'Marguerite', 'Lidierth', 
      'mlidierthb@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8013, 70965, 'Shirlee', 'Gerriet', 
      'sgerrietc@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8014, 78095, 'Sydel', 'Vitet', 'svitetd@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8015, 79461, 'Hollie', 'Edmund', 'hedmunde@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8016, 71098, 'Mara', 'Bayfield', 'mbayfieldf@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8017, 78052, 'Julio', 'Winger', 'jwingerg@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8018, 70272, 'Sayre', 'Bigley', 'sbigleyh@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8019, 76423, 'Mirella', 'Banger', 'mbangeri@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8020, 70212, 'Odessa', 'Bidewel', 'obidewelj@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8021, 79670, 'Gilbert', 'Goundrill', 
      'ggoundrillk@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8022, 72164, 'Lambert', 'Aulton', 'laultonl@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8023, 74405, 'Dusty', 'Rohlfing', 'drohlfingm@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8024, 78402, 'Raimund', 'Kidgell', 
      'rkidgelln@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8025, 76489, 'Jeanine', 'Hardstaff', 
      'jhardstaffo@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8026, 76254, 'Raychel', 'Willstrop', 
      'rwillstropp@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8027, 75888, 'Brien', 'Gallichiccio', 
      'bgallichiccioq@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8028, 78085, 'Hillie', 'Chestnut', 
      'hchestnutr@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8029, 78339, 'Noemi', 'McKeller', 'nmckellers@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8030, 74690, 'Penelopa', 'Narrie', 
      'pnarriet@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8031, 71817, 'Rosita', 'Kleinberer', 
      'rkleinbereru@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8032, 72539, 'Jocelyne', 'Surfleet', 
      'jsurfleetv@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8033, 73113, 'Tiffy', 'Gres', 'tgresw@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8034, 70957, 'Ossie', 'Dew', 'odewx@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8035, 77248, 'Hort', 'Gronaver', 'hgronavery@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8036, 72225, 'Findlay', 'Hugett', 'fhugettz@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8037, 70520, 'Costanza', 'Emblem', 
      'cemblem10@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8038, 79515, 'Chandler', 'Nickels', 
      'cnickels11@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8039, 70708, 'Heall', 'Canadine', 'hcanadine12@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8040, 77283, 'Thorndike', 'Gutridge', 
      'tgutridge13@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8041, 77988, 'Alessandra', 'Castano', 
      'acastano14@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8042, 74491, 'Jaquelyn', 'Lathy', 'jlathy15@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8043, 70957, 'Talia', 'Sinkinson', 
      'tsinkinson16@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8044, 74158, 'Basilio', 'Merrell', 
      'bmerrell17@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8045, 71446, 'Rickard', 'Berthot', 
      'rberthot18@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8046, 77438, 'Wyndham', 'Scholcroft', 
      'wscholcroft19@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8047, 76461, 'Nikola', 'Corkitt', 'ncorkitt1a@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8048, 75795, 'Ade', 'McIlwaine', 'amcilwaine1b@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8049, 71616, 'Sarajane', 'O''Crotty', 
      'socrotty1c@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8050, 75592, 'Celina', 'Sambell', 'csambell1d@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8051, 73194, 'Sharl', 'Huish', 'shuish1e@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8052, 79094, 'Mabel', 'Truder', 'mtruder1f@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8053, 75607, 'Maurene', 'Konertz', 
      'mkonertz1g@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8054, 77476, 'Christin', 'Delepine', 
      'cdelepine1h@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8055, 73409, 'Ingaborg', 'Sabbins', 
      'isabbins1i@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8056, 77602, 'Barry', 'Christall', 
      'bchristall1j@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8057, 79680, 'Che', 'Cruess', 'ccruess1k@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8058, 73845, 'Maegan', 'Batha', 'mbatha1l@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8059, 73811, 'Pauly', 'Askew', 'paskew1m@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8060, 78853, 'Tait', 'Rosekilly', 'trosekilly1n@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8061, 79902, 'Layton', 'Matias', 'lmatias1o@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8062, 75986, 'Randall', 'Shippey', 
      'rshippey1p@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8063, 79391, 'Frannie', 'Sherrott', 
      'fsherrott1q@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8064, 77310, 'Laurent', 'Pilmore', 
      'lpilmore1r@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8065, 73208, 'Adriana', 'Auston', 'aauston1s@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8066, 71854, 'Christie', 'Michiel', 
      'cmichiel1t@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8067, 72492, 'Eal', 'Pappi', 'epappi1u@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8068, 72301, 'Jorrie', 'Hobell', 'jhobell1v@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8069, 79996, 'Michal', 'Schlagtmans', 
      'mschlagtmans1w@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8070, 77342, 'Hube', 'Shepperd', 'hshepperd1x@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8071, 79366, 'Thea', 'O''Mahoney', 
      'tomahoney1y@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8072, 77961, 'Randi', 'Heenan', 'rheenan1z@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8073, 72433, 'Sharlene', 'Jewes', 'sjewes20@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8074, 73195, 'Sinclare', 'Barsam', 
      'sbarsam21@usask.ca', 'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8075, 75128, 'Normand', 'Bimson', 'nbimson22@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8076, 76576, 'Neala', 'Redington', 
      'nredington23@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8077, 76237, 'Devinne', 'McHan', 'dmchan24@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8078, 72905, 'Barry', 'Catherine', 
      'bcatherine25@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8079, 74819, 'Sven', 'Corde', 'scorde26@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8080, 77181, 'Janith', 'Grayson', 'jgrayson27@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8081, 77814, 'Maddi', 'Erie', 'merie28@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8082, 78534, 'Marcello', 'Sheehan', 
      'msheehan29@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8083, 76239, 'Blinnie', 'Bagster', 
      'bbagster2a@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8084, 74216, 'Kristofor', 'Sofe', 'ksofe2b@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8085, 70958, 'Augusto', 'Matchell', 
      'amatchell2c@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8086, 73116, 'Geoffrey', 'Veryan', 
      'gveryan2d@usask.ca', 'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8087, 75003, 'Aigneis', 'Von Welldun', 
      'avonwelldun2e@usask.ca', 'CMPT', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8088, 74303, 'Ivy', 'Belison', 'ibelison2f@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8089, 79199, 'Lorens', 'Dowsett', 'ldowsett2g@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8090, 73891, 'Emera', 'Doerren', 'edoerren2h@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8091, 75077, 'Jud', 'Elcocks', 'jelcocks2i@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8092, 75224, 'Anderea', 'Danick', 'adanick2j@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8093, 79055, 'Dayle', 'Hourston', 'dhourston2k@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8094, 78089, 'Sylvan', 'Rosenbarg', 
      'srosenbarg2l@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8095, 79947, 'Geralda', 'Craine', 'gcraine2m@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8096, 71657, 'Belicia', 'Llop', 'bllop2n@usask.ca', 
      'CMPT', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8097, 74736, 'Christi', 'Yvon', 'cyvon2o@usask.ca', 
      'CMPT', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8098, 79199, 'Genevra', 'Openshaw', 
      'gopenshaw2p@usask.ca', 'CMPT', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      8099, 70898, 'Kalindi', 'Varian', 'kvarian2q@usask.ca', 
      'CMPT', 'F'
    );

    
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1001, 75876, 'Mignonne', 'Eaken', 'meaken0@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1002, 77829, 'Mindy', 'Larner', 'mlarner1@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1003, 72071, 'Andras', 'Tidder', 'atidder2@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1004, 75034, 'Dasie', 'Mulles', 'dmulles3@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1005, 71138, 'Aleta', 'De Vries', 'adevries4@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1006, 72401, 'Gabriella', 'Irnis', 
      'girnis5@usask.ca', 'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1007, 78585, 'Maible', 'Le Sarr', 'mlesarr6@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1008, 78873, 'Penelope', 'Ellingham', 
      'pellingham7@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1009, 79735, 'Alic', 'Stickens', 'astickens8@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1010, 75337, 'Marjorie', 'Nusche', 
      'mnusche9@usask.ca', 'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1011, 79771, 'Salim', 'Hiers', 'shiersa@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1012, 76223, 'Ilse', 'Wilgar', 'iwilgarb@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1013, 70810, 'Lalo', 'Lockhart', 'llockhartc@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1014, 75797, 'Cassaundra', 'Woolerton', 
      'cwoolertond@usask.ca', 'GEOG', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1015, 76522, 'Ermengarde', 'Paynton', 
      'epayntone@usask.ca', 'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1016, 78049, 'Eduino', 'Dockery', 'edockeryf@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1017, 79399, 'Merilee', 'Hillen', 'mhilleng@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1018, 76924, 'Marketa', 'Cranna', 'mcrannah@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1019, 72700, 'Judye', 'Lethebridge', 
      'jlethebridgei@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1020, 78231, 'Lee', 'McHan', 'lmchanj@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1021, 79980, 'Emory', 'Renzullo', 'erenzullok@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1022, 72852, 'Louella', 'Molyneux', 
      'lmolyneuxl@usask.ca', 'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1023, 72002, 'Malva', 'Marder', 'mmarderm@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1024, 74416, 'Staford', 'Jacqueme', 
      'sjacquemen@usask.ca', 'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1025, 77894, 'Tish', 'Hannon', 'thannono@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1026, 76202, 'Hadleigh', 'Kleiner', 
      'hkleinerp@usask.ca', 'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1027, 79333, 'Corilla', 'Garthside', 
      'cgarthsideq@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1028, 77987, 'Desmund', 'Ledram', 'dledramr@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1029, 70807, 'Rayshell', 'Pipet', 'rpipets@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1030, 79340, 'Arabel', 'Rechert', 'arechertt@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1031, 78378, 'Hans', 'Tiltman', 'htiltmanu@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1032, 74969, 'Abagael', 'Alen', 'aalenv@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1033, 74686, 'Natty', 'Pendlebery', 
      'npendleberyw@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1034, 74311, 'Joelynn', 'Malin', 'jmalinx@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1035, 75200, 'Jessika', 'Taphouse', 
      'jtaphousey@usask.ca', 'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1036, 79936, 'Chas', 'Swansborough', 
      'cswansboroughz@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1037, 72992, 'Haroun', 'Caulkett', 
      'hcaulkett10@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1038, 70643, 'Berk', 'Prendergrast', 
      'bprendergrast11@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1039, 74222, 'Gibby', 'Ziem', 'gziem12@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1040, 78608, 'Joseito', 'Govey', 'jgovey13@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1041, 76963, 'Mervin', 'Tapenden', 
      'mtapenden14@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1042, 73116, 'Yettie', 'Hollington', 
      'yhollington15@usask.ca', 'GEOG', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1043, 76343, 'Arny', 'Kilmary', 'akilmary16@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1044, 71918, 'Mildrid', 'Ringham', 
      'mringham17@usask.ca', 'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1045, 77203, 'Jen', 'Postill', 'jpostill18@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1046, 70895, 'Vasily', 'Schindler', 
      'vschindler19@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1047, 76674, 'Cord', 'Jackman', 'cjackman1a@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1048, 77026, 'Stormy', 'Nigh', 'snigh1b@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1049, 78778, 'Branden', 'Gilbart', 
      'bgilbart1c@usask.ca', 'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1050, 78690, 'Aurie', 'McKearnen', 
      'amckearnen1d@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1051, 71013, 'Sibby', 'Clementson', 
      'sclementson1e@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1052, 77403, 'Chelsie', 'Mockford', 
      'cmockford1f@usask.ca', 'GEOG', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1053, 77236, 'Ruthie', 'Twitching', 
      'rtwitching1g@usask.ca', 'GEOG', 
      'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1054, 78533, 'Gearalt', 'Heselwood', 
      'gheselwood1h@usask.ca', 'GEOG', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1055, 70670, 'Umeko', 'Foad', 'ufoad1i@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1056, 74566, 'Betta', 'Whalley', 'bwhalley1j@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1057, 78649, 'Bartie', 'Yanshinov', 
      'byanshinov1k@usask.ca', 'GEOG', 
      'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1058, 79626, 'Vida', 'Crucetti', 'vcrucetti1l@usask.ca', 
      'GEOG', 'M'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1059, 71123, 'Rockie', 'Rillatt', 'rrillatt1m@usask.ca', 
      'GEOG', 'F'
    );
  /* INSERT QUERY */
  INSERT INTO students(
    id, student_number, first_name, last_name, 
    email_address, major_code, gender
  ) 
  VALUES 
    (
      1060, 76946, 'Tabbi', 'Lindenfeld', 
      'tlindenfeld1n@usask.ca', 'GEOG', 
      'M'
    );



END; $$

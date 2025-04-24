use marksheet;
select * from tb2;

select * from tb2 where Maths = 49;

SELECT * FROM tb2 ORDER BY Maths DESC;

SELECT gender, COUNT(*) AS total_students
FROM tb2
GROUP BY gender;

SELECT student.name, grades.subject, grades.marks
FROM student
INNER JOIN grades
ON student.id = grades.student_id;

SELECT a.Name AS student1, b.Name AS student2, a.Section
FROM tb2 a
JOIN tb2 b
  ON a.Section = b.Section AND a.id <> b.id;
  
SELECT a.Name AS student1, b.Name AS student2, a.Maths AS maths1, b.Maths AS maths2
FROM tb2 a
JOIN tb2 b
  ON a.id <> b.id
WHERE a.Maths > b.Maths;

SELECT a.Name, a.Section,
  (SELECT COUNT(*) FROM tb2 b WHERE b.Section = a.Section) AS total_in_section
FROM tb2 a;

SELECT Name, Maths
FROM tb2
WHERE Maths = (SELECT MAX(Maths) FROM tb2);

SELECT Name, English
FROM tb2
WHERE English > (SELECT AVG(English) FROM tb2);


SELECT Name, Section
FROM tb2
WHERE Section IN (
    SELECT Section
    FROM tb2
    GROUP BY Section
    HAVING COUNT(*) > 2
);


CREATE VIEW helllo AS
SELECT Name, 
       (Science + English + History + Maths) AS total_marks
FROM tb2;



CREATE VIEW average_marks_by_section AS
SELECT Section, 
       AVG(Science) AS avg_science,
       AVG(English) AS avg_english,
       AVG(History) AS avg_history,
       AVG(Maths) AS avg_maths
FROM tb2
GROUP BY Section;



CREATE VIEW students_above_avg_maths AS
SELECT Name, Maths
FROM tb2
WHERE Maths > (SELECT AVG(Maths) FROM tb2);



CREATE VIEW students_in_same_section AS
SELECT a.Name AS student1, b.Name AS student2, a.Section
FROM tb2 a
JOIN tb2 b
  ON a.Section = b.Section AND a.id <> b.id;


CREATE VIEW section_total_marks AS
SELECT Section, 
       SUM(Science + English + History + Maths) AS section_total_marks
FROM tb2
GROUP BY Section;


CREATE INDEX idx_section ON tb2(Section);
SELECT * FROM tb2 WHERE Section = 'A';


CREATE INDEX idx_section_age ON tb2(Section, Age);
SELECT * FROM tb2 WHERE Section = 'B' AND Age < 18;


CREATE INDEX idx_gender ON tb2(Gender);
SELECT * FROM tb2 WHERE Gender = 'Female';


CREATE INDEX idx_science ON tb2(Science);
CREATE INDEX idx_english ON tb2(English);
CREATE INDEX idx_history ON tb2(History);
CREATE INDEX idx_maths ON tb2(Maths);
SELECT * FROM tb2 WHERE Science > 50;










-- ============================================================
-- Project: tableau_project (Students)
-- File: tableau_project_students.sql
-- DB: MySQL
-- ============================================================

/* 1) DATABASE */
CREATE DATABASE IF NOT EXISTS tableau_project;
USE tableau_project;

/* 2) QUICK CHECK */
SELECT * FROM students;

/* 3) STANDARDIZE GENDER */
-- Before
SELECT gender, COUNT(*) AS total
FROM students
GROUP BY gender;

-- Normalize values
UPDATE students
SET gender = 'F'
WHERE gender = 'Female';

UPDATE students
SET gender = 'M'
WHERE gender = 'Male';

-- After
SELECT gender, COUNT(*) AS total
FROM students
GROUP BY gender;

/* 4) AGE DISTRIBUTION */
SELECT age, COUNT(*) AS total
FROM students
GROUP BY age
ORDER BY age DESC;

/* 5) ADD + POPULATE AGE GROUP */
ALTER TABLE students
ADD COLUMN IF NOT EXISTS Age_Group VARCHAR(20);

UPDATE students
SET Age_Group =
  CASE
    WHEN age BETWEEN 18 AND 24 THEN 'A1'
    WHEN age BETWEEN 25 AND 30 THEN 'A2'
    ELSE 'A3'
  END;

SELECT Age_Group, COUNT(*) AS total
FROM students
GROUP BY Age_Group;

/* 6) COLUMN LIST (METADATA) */
SELECT *
FROM information_schema.columns
WHERE table_schema = DATABASE()
  AND table_name = 'students';

/* 7) VALUE COUNTS FOR CATEGORICAL FIELDS */
SELECT `Academic Pressure`, COUNT(*) AS total_students
FROM students
GROUP BY `Academic Pressure`;

SELECT `Study Satisfaction`, COUNT(*) AS total_students
FROM students
GROUP BY `Study Satisfaction`;

SELECT `Sleep Duration`, COUNT(*) AS total_students
FROM students
GROUP BY `Sleep Duration`;

SELECT `Dietary Habits`, COUNT(*) AS total_students
FROM students
GROUP BY `Dietary Habits`;

SELECT `Have you ever had suicidal thoughts ?`, COUNT(*) AS total_students
FROM students
GROUP BY `Have you ever had suicidal thoughts ?`;

SELECT `Study Hours`, COUNT(*) AS total_students
FROM students
GROUP BY `Study Hours`;

SELECT `Financial Stress`, COUNT(*) AS total_students
FROM students
GROUP BY `Financial Stress`;

SELECT `Family History of Mental Illness`, COUNT(*) AS total_students
FROM students
GROUP BY `Family History of Mental Illness`;

SELECT `Depression`, COUNT(*) AS total_students
FROM students
GROUP BY `Depression`;

/* 8) ADD A SAFE AUTO-INCREMENT ID (MySQL needs it to be a KEY)
   If you already have a primary key, do NOT run this.
*/
ALTER TABLE students
ADD COLUMN IF NOT EXISTS Index_Column INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (Index_Column);
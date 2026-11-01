-- ============================================================
-- Anomaly experiments
-- Run AFTER anomaly-demo.sql
-- Execute statements one at a time
-- ============================================================

USE university_db;

-- A. REDUNDANCY + UPDATE ANOMALY

-- How many times is Dr. Perera's email stored?

SELECT COUNT(*) AS copies
FROM registration_flat
WHERE lecturer_email = 'perera@uni.lk';


-- Change the email in ONE row only

UPDATE registration_flat
SET lecturer_email = 'perera.new@uni.lk'
WHERE student_id = 'S001'
AND course_code = 'CS101';


-- Dr. Perera now has two different emails

SELECT DISTINCT lecturer_name, lecturer_email
FROM registration_flat
WHERE lecturer_name = 'Dr. Perera';


-- B. INSERT ANOMALY

-- A new course without students cannot be stored

INSERT INTO registration_flat
(
    course_code,
    course_title,
    credits,
    lecturer_name,
    lecturer_email,
    department_code,
    department_name
)
VALUES
(
    'CS301',
    'Software Engineering',
    3,
    'Dr. Fernando',
    'fernando@uni.lk',
    'D01',
    'Computer Science'
);


-- C. DELETE ANOMALY

-- Delete Dilini (S004), the only student of CS201

DELETE FROM registration_flat
WHERE student_id = 'S004';


-- Check whether CS201 still exists

SELECT *
FROM registration_flat
WHERE course_code = 'CS201';
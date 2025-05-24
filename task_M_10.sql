-- Active: 1747539716704@@localhost@5432@task
-- create Table
CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE Table students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    score NUMERIC(10, 2),
    department_id INT,
    Foreign Key (department_id) REFERENCES departments (id)
);

CREATE TABLE course_enrollments (
    id SERIAL PRIMARY KEY,
    student_id int REFERENCES students (student_id),
    course_title VARCHAR(60) NOT NULL,
    enrolled_no DATE NOT NULL
);

DROP Table course_enrollments;

ALTER Table course_enrollments
RENAME COLUMN enrolled_no to enrolled_on;

-- insert the value on each table.

INSERT INTO
    departments (department_name)
VALUES ('Computer Science'),
    ('Electrical Engineering'),
    ('Business Administration'),
    ('Mechanical Engineering'),
    ('Civil Engineering'),
    ('Biotechnology'),
    ('Mathematics'),
    ('Physics'),
    ('Chemistry'),
    ('Psychology');

INSERT INTO
    students (
        student_name,
        age,
        score,
        department_id
    )
VALUES ('Alice Johnson', 20, 88.50, 1),
    ('Bob Smith', 22, 76.25, 2),
    ('Clara Lee', 19, 91.00, 1),
    ('David Brown', 23, 64.75, 3),
    ('Eva Green', 21, 84.00, 4),
    ('Frank White', 20, 79.25, 5),
    ('Grace Hall', 22, 92.10, 6),
    ('Henry Adams', 21, 73.30, 7),
    (
        'Isabella Clark',
        20,
        85.60,
        8
    ),
    ('Jack Turner', 23, 78.45, 9),
    ('Karen Evans', 21, 67.20, 10),
    ('Liam Scott', 22, 90.00, 1),
    ('Mia Young', 19, 82.55, 2),
    ('Nathan King', 24, 69.70, 3),
    ('Olivia Hill', 20, 88.80, 4),
    ('Paul Wright', 23, 74.60, 5),
    (
        'Quinn Mitchell',
        22,
        86.10,
        6
    ),
    ('Rachel Perez', 21, 93.00, 7),
    ('Samuel Cook', 20, 71.40, 8),
    ('Tina Rogers', 21, 89.50, 9),
    ('Umar Brooks', 20, 68.90, 10),
    ('Violet Barnes', 22, 80.00, 1),
    (
        'William Simmons',
        23,
        87.25,
        2
    ),
    ('Xena Foster', 19, 84.75, 3),
    ('Yusuf Bailey', 21, 66.40, 4),
    ('Zoe Reed', 20, 91.30, 5),
    ('Aaron Hughes', 22, 79.80, 6),
    ('Bella Griffin', 21, 75.10, 7),
    ('Caleb Russell', 23, 83.60, 8),
    ('Diana Hayes', 20, 89.90, 9);

INSERT INTO
    course_enrollments (
        student_id,
        course_title,
        enrolled_on
    )
VALUES (1, 'Algorithms', '2025-02-15'),
    (
        2,
        'Circuits 101',
        '2025-01-20'
    ),
    (
        3,
        'Operating Systems',
        '2025-03-05'
    ),
    (
        4,
        'Business Management',
        '2025-01-25'
    ),
    (
        5,
        'Thermodynamics',
        '2025-02-01'
    ),
    (
        5,
        'Fluid Mechanics',
        '2025-02-18'
    );

SELECT * FROM departments;

SELECT * FROM students;

-- Retrieve all students who scored higher than the average score
SELECT *
FROM students
WHERE
    score > (
        SELECT avg(score)
        FROM students
    );

-- Find students whose age is greater than the average age of all students.
-- select avg(age) FROM students;

SELECT * FROM students WHERE age > ( select avg(age) FROM students );

-- Get names of students who are enrolled in any course (use IN with subquery).
SELECT * FROM course_enrollments;

SELECT student_name, course_title
FROM students
    JOIN course_enrollments USING (student_id)
WHERE
    student_id in (
        SELECT student_id
        FROM course_enrollments
    );

-- SELECT student_name, course_title
-- FROM course_enrollments
--     JOIN students USING (student_id)
-- WHERE
--     course_title in (
--         'Algorithms',
--         'Circuits 101',
--         'Business Management'
--     );

-- Retrieve departments with at least one student scoring above 90 (use EXISTS).

--  Exists and in ase almost similar.

SELECT *
FROM departments
WHERE
    EXISTS (
        SELECT 1
        FROM students
        WHERE
            students.student_id = departments.id
            AND students.score > 90
    )

-- Create a view to show each student’s name, department, and score.

CREATE View stn_view as (
    SELECT
        student_id,
        department_name,
        score
    FROM students
        JOIN departments on students.department_id = departments.id
);

-- SELECT student_id, department_name, score FROM students JOIN departments  on students.department_id = departments.id;

SELECT * FROM stn_view;

-- Create a view that lists all students enrolled in any course with the enrollment date.

CREATE or REPLACE View stn_list as (
    SELECT
        student_id,
        student_name,
        course_title,
        enrolled_on
    FROM students
        JOIN course_enrollments USING (student_id)
);

-- DROP View stn_list;

-- Query from your created views to verify the data.
SELECT * FROM stn_list;

-- Create a function that takes a student's score and returns a grade (e.g., A, B, C, F).
CREATE OR REPLACE FUNCTION get_grade(s_score NUMERIC)
RETURNS CHAR(1)
LANGUAGE plpgsql
AS
$$
 BEGIN
    IF s_score >= 90 THEN
        RETURN 'A';
    ELSEIF s_score >= 80 THEN
        RETURN 'B';
    ELSEIF s_score >= 70 THEN
        RETURN 'C';
    ELSEIF s_score >= 60 THEN
        RETURN 'D';
    ELSE
        RETURN 'F';
    END IF;
 END;
$$



-- DROP Function get_grade;

SELECT student_name, score, get_grade (score) FROM students;

-- Create a function that returns the full name and department of a student by ID.

CREATE OR REPLACE FUNCTION get_stn_info(s_id INT)
RETURNS TABLE(
    student_name VARCHAR,
    department_name VARCHAR
)
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        RETURN Query
        select s.student_name, d.department_name 
        FROM students s JOIN departments d on s.department_id  = d.id
        WHERE s.student_id = s_id;
    END;
$$;

DROP Function get_stn_info;

SELECT * FROM get_stn_info (1);

-- Write a stored procedure to update a student's department.

CREATE OR REPLACE Procedure update_stn_dept(s_id INT, new_d_id INT)
LANGUAGE plpgsql
AS
$$
 BEGIN
 UPDATE students
 set department_id = new_d_id
 WHERE student_id = s_id;
 END;
$$;

CALL update_stn_dept (1, 3);

-- Write a procedure to delete students who haven't enrolled in any course.

SELECT student_id
FROM students
    JOIN course_enrollments USING (student_id);

DELETE FROM students
WHERE
    student_id Not IN (
        SELECT student_id
        FROM students
            JOIN course_enrollments USING (student_id)
    );

CREATE Procedure remove_student()
LANGUAGE PLPGSQL
AS
$$
 BEGIN 
    DELETE FROM students 
WHERE student_id Not IN  (
    SELECT student_id FROM students JOIN course_enrollments USING(student_id)

);
 END;
$$;

CALL remove_student ()

-- Create a trigger that automatically logs enrollment when a student is added to course_enrollments.

CREATE Table enrollment_log (
    log_id SERIAL PRIMARY KEY,
    student_id INT,
    course_title VARCHAR(50),
    enrolled_on DATE,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION get_enroll_student()
 RETURNS TRIGGER
 LANGUAGE PLPGSQL
 AS
 $$
  BEGIN

  INSERT INTO enrollment_log(student_id, course_title, enrolled_on)
    VALUES(NEW.student_id, NEW.course_title, NEW.enrolled_on);
    RETURN NEW;

  END;

 $$;

--

--
CREATE OR REPLACE TRIGGER trg_log_enroll_student
AFTER INSERT 
ON course_enrollments
FOR EACH ROW
EXECUTE FUNCTION get_enroll_student();

INSERT INTO
    course_enrollments (
        student_id,
        course_title,
        enrolled_on
    )
VALUES (
        1,
        'Database Systems',
        '2025-05-20'
    );

-- TRUNCATE Table enrollment_log;

SELECT * FROM enrollment_log;

-- Add a trigger that sets the score to 0 if a new student record is added without a score.

CREATE OR REPLACE FUNCTION set_score_default()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
    IF NEW.score IS NULL THEN
        NEW.score := 0;
    END IF;
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER trg_set_score_default
BEFORE INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION set_score_default();

INSERT INTO
    students (
        student_name,
        age,
        department_id
    )
VALUES ('Aliya Vat', 27, 3);

-- Add an index to the score column in the students table.
EXPLAIN ANALYSE SELECT * FROM students WHERE students.score = 99.90;

CREATE INDEX idx_students_score ON students (score);

-- Add a composite index on student_id and enrolled_on in the course_enrollments table.

CREATE INDEX idx_course_enrollments_student_id_and_enrolled_on ON course_enrollments (student_id, enrolled_on);

-- Compare query performance with and without indexes using EXPLAIN.
EXPLAIN ANALYSE
SELECT *
FROM course_enrollments
WHERE
    student_id = 4
    AND enrolled_on = '2025-01-25';

SELECT * FROM students;

SELECT * FROM departments;

SELECT * FROM course_enrollments;
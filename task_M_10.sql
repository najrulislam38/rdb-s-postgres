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
SELECT * FROM course_enrollments;

SELECT * FROM students;

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

SELECT * FROM stn_list;
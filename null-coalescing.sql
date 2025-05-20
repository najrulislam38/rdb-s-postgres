SELECT * FROM students;

SELECT * FROM students WHERE NOT country = 'USA';

SELECT * FROM students WHERE email IS NOT NULL;

SELECT COALESCE(NULL, 'Email is not found');

SELECT
    COALESCE(email, 'Email is not found') as "Student Email",
    age,
    blood_group,
    country
FROM students;
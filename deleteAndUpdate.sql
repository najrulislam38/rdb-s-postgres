-- deletion (dangerous command)

-- DELETE FROM students; dangerous command . delete all row from the table when use this command.

SELECT * FROM students;

DELETE FROM students;

DELETE FROM students WHERE grade = 'B';

--- Update data;

UPDATE students
set
    email = 'default@gmail.com'
WHERE
    student_id = 53;
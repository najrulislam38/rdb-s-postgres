-- Active: 1747539716704@@localhost@5432@ph
CREATE TABLE person2 (
    _id INTEGER PRIMARY KEY,
    username VARCHAR(50),
    age INTEGER CHECK (age >= 18)
);

INSERT INTO
    person2 (_id, username, age)
VALUES (2, 'jafor.imam', 23),
    (3, 'haniya.hujaifa', 24);

ALTER TABLE person2
ADD COLUMN email VARCHAR(50) DEFAULT 'example@gmail.com' NOT NULL;

INSERT INTO
    person2
VALUES (
        4,
        'nafizullal',
        25,
        'nafiz@gmail.com'
    );

ALTER Table person2 drop COLUMN email;

ALTER TABLE person2 RENAME COLUMN _id to id;

ALTER TABLE person2 RENAME COLUMN username to user_name;

ALTER TABLE users RENAME to person2;

alter Table person2 RENAME COLUMN age to user_age;

ALTER Table person2 Alter COLUMN username type VARCHAR(40);

ALTER TABLE person2 ALTER COLUMN user_age set NOT NULL;

ALTER TABLE person2 ALTER COLUMN user_age drop NOT NULL;

ALTER TABLE person2
ADD constraint unique_person2_user_age UNIQUE (user_age);

ALTER Table person2 drop constraint unique_person2_user_age;

CREATE TABLE person3 (
    id INT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(150),
    age INT CHECK (age >= 18)
)

SELECT * FROM person2;

INSERT INTO
    person3 (
        id,
        first_name,
        last_name,
        email,
        age
    )
VALUES (
        1,
        'Adbullah',
        'Mondol',
        'abdul@gmail.com',
        25
    ),
    (
        2,
        'Abdur',
        'Rahman',
        'abrahman@gmail.com',
        24
    )

ALTER TABLE person3 ADD constraint pk_person3_id PRIMARY KEY (id);

ALTER TABLE person3 DROP constraint pk_person3_id;

TRUNCATE TABLE person3;

DROP Table person3;
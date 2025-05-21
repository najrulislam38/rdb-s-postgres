CREATE Table "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
)

CREATE Table post (
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user" (id) on delete CASCADE
)

INSERT INTO
    "user" (username)
VALUES ('akash'),
    ('batash'),
    ('sagor'),
    ('nodi');

INSERT INTO
    post (title, user_id)
VALUES (
        'Enjoying a sunny day with Akash! ☀️',
        2
    ),
    (
        'Batash just shared an amazing recipe! 🍲',
        1
    ),
    (
        'Exploring adventures with Sagor.🌟',
        4
    ),
    (
        'Nodi''s wisdom always leaves me inspired. 📚',
        4
    );

INSERT INTO
    post (id, title, user_id)
VALUES (
        5,
        'This is a test post title.',
        NULL
    );

DROP Table post;

DROP Table "user";

SELECT * from "user";

SELECT * from post;

-- SELECT title, username from post JOIN "user" on post.user_id = "user".id ;

-- inner join
select * from post INNER JOIN "user" on post.user_id = "user".id;

-- left join / left outer join

SELECT * from post left JOIN "user" on post.user_id = "user".id;

-- right join / right outer join

SELECT *
from post
    RIGHT OUTER JOIN "user" on post.user_id = "user".id;
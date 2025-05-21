-- Active: 1747539716704@@localhost@5432@ph
CREATE Table "user" (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL
);

INSERT INTO
    "user" (user_name)
VALUES ('Rahman'),
    ('Hasim'),
    ('Habib'),
    ('Hamid')

CREATE Table post (
    id serial PRIMARY KEY,
    title TEXT NOT NULL,
    -- user_id INTEGER REFERENCES "user" (id) on delete set NULL
    user_id INTEGER REFERENCES "user" (id) on delete set DEFAULT DEFAULT 2
);

DROP Table post;

DROP Table "user";

-- The user_id values 4 do not exist in the "user" table (only ids 1, 2, 3 exist).
-- To fix the foreign key constraint violation, use valid user_id values (1, 2, or 3):

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

INSERT INTO post (title, user_id) VALUES ('All is well', NULL)

SELECT * from "user";

SELECT * FROM post;

-- To set a default value for user_id column:

ALTER Table post ALTER COLUMN user_id set NOT NULL;
-- Insertion constraint on INSERT post
-- Attempting to insert a post with a user ID that does not exist
-- Inserting a post with a valid user ID
-- Attempting to insert a post without specifying a user ID

DELETE FROM "user" WHERE id = 4;

-- Deletion constraint on DELETE user
-- Restrict Deletion -> ON DELETE RESTRICT / ON DELETE NO ACTION (default)
-- Cascading Deletion -> ON DELETE CASCADE
-- Setting NULL -> ON DELETE SET NULL
-- Set Default value -> ON DELETE SET DEFAULT
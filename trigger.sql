/*
A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of actions in response to certain database events or conditions. 
*/

-- Table-Level Events:
-- INSERT, UPDATE, DELETE, TRUNCATE
-- Database-Level Events
-- Database Startup, Database Shutdown, Connection start and end etc

-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name
-- [FOR EACH ROW]
-- EXECUTE FUNCTION function_name();

CREATE TABLE players (
    player_id SERIAL NOT NULL,
    player_name VARCHAR(50),
    specialist VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO
    players (
        player_name,
        specialist,
        email
    )
VALUES (
        'Rakib',
        'Batsman',
        'rakib@mail.com'
    ),
    (
        'Mostak',
        'Baler',
        'mostak@mail.com'
    );

CREATE TABLE deleted_player_audit (
    player_name VARCHAR(50),
    deleteAt TIMESTAMP
);

SELECT * FROM players;

SELECT * FROM deleted_player_audit;

CREATE or REPLACE Function save_deleted_player()
RETURNS TRIGGER
LANGUAGE PLPGSQL
as
$$

BEGIN
 INSERT INTO deleted_player_audit VALUES(OLD.player_name, now());

--  RAISE NOTICE 'Deleted player audit log created.';
 RETURN OLD;
END

$$
;

DROP FUNCTION save_deleted_player;

CREATE or REPLACE Trigger simple_trigger
 BEFORE DELETE 
 ON players
 for EACH row
 EXECUTE FUNCTION save_deleted_player();

DELETE FROM players WHERE player_id = 3;

-- DROP Trigger simple_trigger on players;
-- trigger deletion command.
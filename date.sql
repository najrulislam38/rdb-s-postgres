SHOW timezone;

SELECT now();

CREATE TABLE timez (
    ts TIMESTAMP without time zone,
    tsz TIMESTAMP with time zone
);

SELECT CURRENT_DATE;

SELECT now()::date;
-- casting

SELECT now()::time;

SELECT to_char(now(), 'yyyy/mm/dd');

SELECT to_char(now(), 'dd/mm/yyyy');

SELECT to_char(now(), 'Month');

INSERT INTO timez VALUES ( '2020-01-01 10:00', '2020-01-01 10:00' )

SELECT CURRENT_DATE - INTERVAL '1 year';

SELECT CURRENT_DATE - INTERVAL '1 year 2 month';

SELECT age (CURRENT_DATE, '2000-09-09');

SELECT *, age (CURRENT_DATE, date_of_birth) FROM students;

SELECT extract( DAY FROM '2024-10-11'::date );

SELECT 'f'::BOOLEAN;
-- casting
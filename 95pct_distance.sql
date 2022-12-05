
WITH all_hired_trips AS (
SELECT distance FROM taxi_trips 
WHERE date(pickup_datetime) BETWEEN '2013-07-01' AND '2013-07-31'
UNION ALL
SELECT distance FROM uber_trips
WHERE date(pickup_datetime) BETWEEN '2013-07-01' AND '2013-07-31')

SELECT distance FROM all_hired_trips
ORDER BY distance
LIMIT 1
OFFSET (SELECT COUNT(*) FROM all_hired_trips) * 95 / 100 - 1 ;

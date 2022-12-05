
WITH all_hired_rides AS (
SELECT pickup_datetime, distance FROM taxi_trips 
WHERE strftime ('%Y',pickup_datetime)='2009'
UNION ALL
SELECT pickup_datetime, distance FROM uber_trips
WHERE strftime ('%Y',pickup_datetime)='2009')

SELECT date(pickup_datetime) AS date, AVG(distance) AS mean_dist, COUNT(*) AS number
FROM all_hired_rides
GROUP BY date
ORDER BY number DESC
LIMIT 10;

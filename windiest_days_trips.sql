
WITH all_hired_rides AS (
SELECT pickup_datetime FROM taxi_trips
WHERE strftime ('%Y',pickup_datetime)='2014'
UNION ALL
SELECT pickup_datetime FROM uber_trips
WHERE strftime ('%Y',pickup_datetime)='2014')

SELECT date(pickup_datetime) AS date, COUNT(*)
FROM all_hired_rides
GROUP BY date
HAVING date IN (SELECT date FROM daily_weather 
WHERE strftime ('%Y',date)='2014' 
ORDER BY DailyAverageWindSpeed DESC
LIMIT 10)

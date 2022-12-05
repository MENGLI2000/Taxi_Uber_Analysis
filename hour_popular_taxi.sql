
SELECT COUNT(*) AS trips, strftime ('%H',pickup_datetime) AS hour
FROM taxi_trips
GROUP BY hour
ORDER BY trips

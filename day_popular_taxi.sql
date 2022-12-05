
SELECT COUNT(*) AS trips, strftime ('%w',pickup_datetime) AS day
FROM uber_trips
GROUP BY day
ORDER BY trips

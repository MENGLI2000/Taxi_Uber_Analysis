WITH all_hired_rides AS (
SELECT strftime('%Y-%m-%d %H:00:00',pickup_datetime) AS rides_date
FROM taxi_trips
WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-11-05'
UNION ALL
SELECT strftime('%Y-%m-%d %H:00:00',pickup_datetime) AS rides_date
FROM uber_trips
WHERE pickup_datetime BETWEEN '2012-10-22' AND '2012-11-05')

SELECT strftime('%Y-%m-%d %H:00:00',hourly_weather.DATE) AS weather_date, COUNT(all_hired_rides.rides_date), HourlyPrecipitation, HourlyWindSpeed
FROM hourly_weather
LEFT JOIN all_hired_rides
ON weather_date = all_hired_rides.rides_date
WHERE date(weather_date) BETWEEN '2012-10-22' AND '2012-11-05'
GROUP BY weather_date

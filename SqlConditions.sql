-- SQL conditional Statements
-- write a query to arrange the range of model of air crafts so  Short range is less than 2000, Middle range is more than 2000 and less than 5000 & any range above 5000 is long range?

SELECT model, range, 
CASE WHEN range <2000 THEN 'Short'
     WHEN range <5000 THEN 'Middle'
     ELSE 'Long '
     END AS range
FROM aircrafts
ORDER BY model;



---What is the shortest flight duration for each possible flight from Moscow to St. Petersburg, and how many times was the flight delayed for more than an hour?

SELECT f.flight_no, (f.Scheduled_arrival - f.Scheduled_departure) AS scheduled_duration,
min(f.Scheduled_arrival - f.Scheduled_departure), max(f.Scheduled_arrival - f.Scheduled_departure),
sum(CASE WHEN f.actual_departure > f.scheduled_departure + INTERVAL '1 hour'THEN 1 ELSE 0 END) delays
FROM flights f
WHERE (SELECT city ->> 'en' FROM airports WHERE airport_code = departure_airport) = 'Moscow'
AND (SELECT city ->> 'en' FROM airports WHERE airport_code = arrival_airport) = 'St. Petersburg'
AND f.status = 'Arrived'
GROUP BY f.flight_no, (f.Scheduled_arrival - f.Scheduled_departure);
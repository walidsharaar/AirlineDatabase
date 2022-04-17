-- Determine how many flights from each city to other cities, return the the name of city and count of flights more than 50 order the data from the largest no of flights to the least?
SELECT (SELECT city ->> 'en' FROM airports WHERE airport_code =departure_airport) AS departure_city, COUNT(*)
FROM flights
GROUP BY (SELECT city ->> 'en' FROM airports WHERE airport_code =departure_airport)
HAVING count (*)>= 50
ORDER BY Count DESC;

-- Return all flight details in the indicated day 2017-08-28 include flight count ascending order and departures count and when departures happen in arrivals count and when arrivals happen?
SELECT f.flight_no,f.scheduled_departure :: time AS dep_time,
f.departure_airport AS departures,f.arrival_airport AS arrivals,
count (flight_id)AS flight_count
FROM flights f
WHERE f.departure_airport = 'KZN'
AND f.scheduled_departure >= '2017-08-28' :: date
AND f.scheduled_departure <'2017-08-29' :: date
GROUP BY 1,2,3,4,f.scheduled_departure
ORDER BY flight_count DESC,f.arrival_airport,f.scheduled_departure;

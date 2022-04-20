--How many people can be included into a single booking according to the available data?
SELECT tt.bookings_no,count(*)passengers_no
FROM (SELECT t.book_ref, count(*) bookings_no FROM tickets t GROUP BY t.book_ref) tt
GROUP BY tt.bookings_no
ORDER BY tt.bookings_no;

--Which combinations of first and last names occur most often? What is the ratio of the passengers with such names to the total number of passengers?
SELECT passenger_name, round( 100.0 * cnt / sum(cnt) OVER (), 2) AS percent
FROM (SELECT passenger_name, count(*) cnt  FROM tickets GROUP BY passenger_name) sub
ORDER BY percent DESC;

--What are the maximum and minimum ticket prices in all directions?

SELECT (SELECT city ->> 'en' FROM airports WHERE airport_code = f.departure_airport) AS departure_city, (SELECT city ->> 'en' FROM airports WHERE airport_code = f.arrival_airport) AS arrival_city, max (tf.amount), min (tf.amount)
FROM flights f
JOIN ticket_flights tf
ON f.flight_id = tf.flight_id
GROUP BY 1, 2
ORDER BY 1, 2;

--Get a list of airports in cities with more than one airport ?

SELECT aa.city ->> 'en'AS city, aa.airport_code, aa.airport_name ->> 'en' AS airport
FROM (SELECT city, count (*)FROM airports GROUP BY city HAVING count (*)> 1) AS a
JOIN airports AS aa
ON a.city = aa.city
ORDER BY aa.city, aa.airport_name;
--What will be the total number of different routes that are theoretically can be laid between all cities?
SELECT count (*)
FROM (SELECT DISTINCT city FROM airports) AS a1
JOIN (SELECT DISTINCT city FROM airports) AS a2
ON a1.city <> a2.city;
--Count the number of routes laid from the airports?
-- first we have create cities view
CREATE VIEW cities AS SELECT (SELECT city ->> 'en' FROM airports 
							  WHERE airport_code =departure_airport) 
							  AS departure_city, 
(SELECT city ->> 'en' FROM airports 
 WHERE airport_code =arrival_airport) 
AS arrival_city
FROM flights;

-- By using the view with can proceed the challenge
SELECT departure_city, count (*)
FROM cities
GROUP BY departure_city
HAVING departure_city IN (SELECT city->> 'en' FROM airports )
ORDER BY count DESC;


--Suppose our airline marketers want to know how often there are different names among the passengers?

SELECT LEFT(passenger_name, STRPOS(passenger_name, ' ') - 1) AS firstname, COUNT (*)
FROM tickets
GROUP BY 1
ORDER BY 2 DESC;
--Which combinations of first names and last names separately occur most often? What is the ratio of the passengers with such names to the total number of passengers?
WITH p AS (SELECT left(passenger_name, position(' ' IN passenger_name)) AS passenger_name FROM tickets)
SELECT passenger_name, round( 100.0 * cnt / sum(cnt) OVER (), 2) AS percent
FROM (SELECT passenger_name,count(*) cnt FROM p GROUP BY passenger_name) t
ORDER BY percent DESC;
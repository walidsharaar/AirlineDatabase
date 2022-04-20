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


--Which combinations of first names and last names separately occur most often? What is the ratio of the passengers with such names to the total number of passengers?

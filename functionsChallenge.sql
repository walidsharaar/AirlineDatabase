--Count the number of routes laid from the airports?
-- first we have create cities view
CREATE VIEW cities AS SELECT (SELECT city ->> 'en' FROM airports 
							  WHERE airport_code =departure_airport) 
							  AS departure_city, 
(SELECT city ->> 'en' FROM airports 
 WHERE airport_code =arrival_airport) 
AS arrival_city
FROM flights

--Suppose our airline marketers want to know how often there are different names among the passengers?


--Which combinations of first names and last names separately occur most often? What is the ratio of the passengers with such names to the total number of passengers?

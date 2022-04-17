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

select * from tickets;
--How many people can be included into a single booking according to the available data?


--Which combinations of first and last names occur most often? What is the ratio of the passengers with such names to the total number of passengers?
SELECT tt.bookings_no,count(*)passengers_no
FROM (SELECT t.book_ref, count(*) bookings_no FROM tickets t GROUP BY t.book_ref) tt
GROUP BY tt.bookings_no
ORDER BY tt.bookings_no;

--What are the maximum and minimum ticket prices in all directions?
SELECT passenger_name, round( 100.0 * cnt / sum(cnt) OVER (), 2) AS percent
FROM (SELECT passenger_name, count(*) cnt  FROM tickets GROUP BY passenger_name) sub
ORDER BY percent DESC;

--Get a list of airports in cities with more than one airport ?


--What will be the total number of different routes that are theoretically can be laid between all cities?
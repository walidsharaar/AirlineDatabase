copy (select passenger_name, DATE_PART('day', book_date) as day, DATE_PART('month',book_date) as month,
	  (select city->>'en' from airports where airport_code = f.departure_airport)as departure_city,
	  (select city->>'en'  from airports where airport_code = f.arrival_airport)as arrival_city,
	  sum(total_amount) as sales
	  from bookings b
	  join tickets t
	  on b.book_ref = t.book_ref
	  join ticket_flights tf
	  on t.ticket_no = tf.ticket_no
	  join flights f
	  on tf.flight_id = f.flight_id
	  group by 1,2,3,4,5
	  order by 3,6) to 'd:\csv\airlines_data_part.csv' DELIMITER ',' CSV HEADER;
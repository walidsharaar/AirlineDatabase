-- Who traveled from Moscow (SVO) to Novosibirsk (OVB) on seat 1A yesterday, and when was the ticket booked?

SELECT t.passenger_name, b.book_date
FROM bookings b
JOIN tickets t
ON t.book_ref = b.book_ref
JOIN boarding_passes bp
ON bp.ticket_no = t.ticket_no
JOIN flights f
ON f.flight_id = bp.flight_id
WHERE f.departure_airport = 'SVO' AND f.arrival_airport = 'OVB'
AND f.scheduled_departure::date = public.now()::date - INTERVAL '2 day'
AND bp.seat_no = '1A';

--Find the most disciplined passengers who checked in first for all their flights. Take into account only those passengers who took at least two flights ?

SELECT t.passenger_name, t.ticket_no
FROM tickets t
JOIN boarding_passes bp
ON bp.ticket_no = t.ticket_no
GROUP BY t.passenger_name, t.ticket_no
HAVING max(bp.boarding_no) = 1 AND count(*) > 1;

--Calculate the number of passengers and number of flights departing from one airport (SVO) during each hour on the indicated day 2017-08-02 ?



--Use SQL  joins to  return unique city name, flight_no, airport and timezone?
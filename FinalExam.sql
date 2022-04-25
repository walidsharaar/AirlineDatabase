-- Final Exam and Recap

--1. For each ticket, display all the included flight segments, together with connection time. Limit the result to the tickets booked a week ago?
SELECT tf.ticket_no, f.departure_airport, f.arrival_airport, f.scheduled_arrival,
lead(f.scheduled_departure) OVER w AS next_departure,
lead(f.scheduled_departure) OVER w - f.scheduled_arrival AS gap
FROM bookings b
JOIN tickets t
ON t.book_ref = b.book_ref
JOIN ticket_flights tf
ON tf.ticket_no = t.ticket_no
JOIN flights f
ON tf.flight_id = f.flight_id
WHERE b.book_date = public.now()::date - INTERVAL '7 day'
WINDOW w AS (PARTITION BY tf.ticket_no
ORDER BY f.scheduled_departure);

--2. Find the most disciplined passengers who checked in first for all their flights. Take into account only those passengers who took at least two flights?
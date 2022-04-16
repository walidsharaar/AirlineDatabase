-- List all cities where there is no flights from Moscow.

select distinct a.city ->>'en' as city
from airports a
where city ->> 'en' != 'Moscow'
order by city;

-- Select airports in a specific time zone

select *from airports
where timezone in('Asia/Kamchatka' , 'Asia/Vladivostok' );

-- What planes have a flight range in the range from 3000 km to 6000 km

select * from aircrafts
where range between 3000 and 6000

-- Get the model range and miles of every air craft exist in the airline database

select model,range,round(range/1.609,2)
as miles
from aircrafts



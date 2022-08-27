#How many airplanes have listed speeds? What is the
#minimum listed speed and the maximum listed speed?

select count(*) from planes #23
	where speed is not null;
select count(speed) from planes;


select max(speed) from planes; #432
select min(speed) from planes; #90

#What is the total distance flown by all of the planes inJanuary 2013? 
#What is the total distance flown by all of the planes in January 2013 where the tailnum is
#missing?

select count(*) as 'Number of Flights', sum(distance) as 'Total Distance' from flights;
select count(*) as 'Number of Flights', sum(distance) as 'Total Distance' from flights
	where (year = 2013 and month = 1);  #2718805
    
select count(tailnum) from flights; #336776
select count(*) from flights 
	where tailnum is not null; #336776
select count(*) from flights #0
	where tailnum is null;
    
select count(*) as 'Number of Flights', sum(distance) as 'Total Distance' from flights
	where (year = 2013 and month = 1)
and tailnum is not null; #27188805


#What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 

select count(*) as 'Number of Flights', manufacturer, sum(distance) as 'Total Distance'
from flights 
left join planes 
on flights.tailnum = planes.tailnum
where(flights.year = 2013 and flights.month = 7 and flights.day = 5)
Group by manufacturer;


select count(*) as 'Number of Flights', manufacturer, sum(distance) as 'Total Distance'
from flights 
inner join planes 
on flights.tailnum = planes.tailnum
where(flights.year = 2013 and flights.month = 7 and flights.day = 5)
Group by manufacturer;

select * from flights;

select * from planes;

select * from airports;

#what airports had the most starting points in July 2013? Grouped by manufacturer

select count(*) as 'Number of Flights',  manufacturer, origin as 'Starting Point'
from flights 
left join airports on flights.dest = airports.faa
left join planes on flights.tailnum = planes.tailnum
where (flights.year = 2013 and flights.month = 7 and flights.day = 5)
Group by name, manufacturer;

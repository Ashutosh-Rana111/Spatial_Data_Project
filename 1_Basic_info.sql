-- Question 1: How many stations does BigApple BikeShare company have? 
select count(station_id) as total_stations from public.stations 

-- Question 2: How many trips were taken on September 17th? 
select count(*) as total_trips 
from public.trip_data where start_time::date = '2024-09-17'

-- Question 3: What percentage of bike trips used an e-bike?
select (count(case when bike_type = 'ebike' then 1 end)*100/
count(*)) as E_bikes_percent
from public.trip_data 

-- Question 4: which bike station had the most starting trips on that day? 
select start_station_id, count(ride_id) as total_ride
from public.trip_data 
group by start_station_id 
order by total_ride desc
limit(5)

-- Question 5: What’s the average length of a bike trip?
select avg(end_time::timestamp - start_time::timestamp) as avg_trip_length
from public.trip_data td 


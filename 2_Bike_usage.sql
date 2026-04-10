-- Bike Usage

alter table  trip_data 
add column half_hour_start_time timestamp

update trip_data 
set half_hour_start_time = 
	date_trunc('hour', start_time::timestamp) +
	interval '30 minutes' * floor(extract(minute from start_time::timestamp) / 30);

select half_hour_start_time, count(*) as bike_usage
from public.trip_data td 
group by half_hour_start_time 
order by bike_usage desc
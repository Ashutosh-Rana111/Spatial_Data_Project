-- goal: group trip data by both temporal and spatial dimensions 

create table spatio_temporal_viz as
select half_hour_start_time, 
	nyct2020.ogc_fid as census_tract, 
	nyct2020.wkb_geometry as geom,
	count(trip_data.ride_id) as trip_count
from public.trip_data 
join public.stations on trip_data.start_station_id = stations.station_id 
join public.nyct2020 on ST_Within(stations.geom, nyct2020.wkb_geometry)
group by half_hour_start_time, census_tract
order by census_tract, half_hour_start_time;
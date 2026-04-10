-- Objective: determine how many bike trips started in each census tract.

-- 1. assign each bike station to the appropriate census tract using a spatial join
SELECT 
	s.station_id,
	nyct.ogc_fid,
	s.geom
from stations as s 
join nyct2020 as nyct
on ST_Within(s.geom, nyct.wkb_geometry);

-- 2. joining stations with trip_data
with station_census as (
	select 
		s.station_id,
		nyct.ogc_fid,
		s.geom 
	from 
		stations as s 
	join 
		nyct2020 as nyct
	on 	
		ST_Within(s.geom, nyct.wkb_geometry)
)
select 
	t.ride_id,
	t.half_hour_start_time,
	sc.ogc_fid,
	t.start_station_id
from 
	trip_data as t 
left join 
	station_census as sc
on 
	t.start_station_id  = sc.station_id ;

-- 3. grouping and counting trips by census tract
create table ct_trip_count as
with station_census as (
	select 
		s.station_id,
		nyct.ogc_fid,
		s.geom,
		nyct.wkb_geometry
	from 
		stations as s
	join 
		nyct2020 as nyct
	on 
		ST_Within(s.geom, nyct.wkb_geometry)
)
select 
	sc.ogc_fid,
	count(t.ride_id) as trip_count,
	sc.wkb_geometry
from 
	trip_data as t 
left join 
	station_census as sc
on 
	t.start_station_id = sc.station_id 
group by 
	sc.ogc_fid , sc.wkb_geometry 
order by 
	trip_count DESC











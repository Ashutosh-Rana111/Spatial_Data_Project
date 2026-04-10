-- Goal: turn stations table into geospatial data format and set the correct projection

-- add a new geometry column to the stations table
alter table stations 
add column geom geometry(Point, 4326);

--Fill geom using lat and lon columns
update public.stations 
set geom = ST_SetSRID(ST_MakePoint(station_lon, station_lat), 4326);

-- Transform to UTM Zone 18N projection
alter table stations 
alter column geom
type geometry(Point, 32618)
using ST_Transform(geom, 32618);







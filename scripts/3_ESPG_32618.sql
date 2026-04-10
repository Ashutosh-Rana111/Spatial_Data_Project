-- the projection we would like to use for our project is UTM zone 18N (EPSG: 32618)
alter table nyct2020
alter column wkb_geometry type geometry(MultiPolygon, 32618)
using ST_Transform(ST_SetSRID(wkb_geometry,4326), 32618);

SELECT ST_SRID(wkb_geometry) FROM nyct2020 LIMIT 5;

SELECT DISTINCT ST_GeometryType(wkb_geometry) FROM nyct2020;

SELECT COUNT(*) 
FROM nyct2020 
WHERE NOT ST_IsValid(wkb_geometry);
--- section 29 assignment
--1.Create a table in airport for navaids and import the CSV file you downloaded.
CREATE TABLE navaids (
	id int,
	filename text,
	ident varchar(10),
	name text,
	type varchar(10),
	frequency_khz float,
	latitude_deg float,
	longitude_deg float,
	elevation_ft int,
	iso_country varchar(10),
	dme_frequency_khz float,
	dme_channel varchar(10),
	dme_latitude_deg float,
	dme_longitude_deg float,
	dme_elevation_ft int,
	slaved_variation_deg float,
	magnetic_variation_deg float,
	usageType char(10),
	power char(10),
	associated_airport varchar(10)
)

\copy navaids (id,filename, ident, name, type, frequency_khz, latitude_deg, longitude_deg, elevation_ft, iso_country, dme_frequency_khz, dme_channel, dme_latitude_deg, dme_longitude_deg, dme_elevation_ft, slaved_variation_deg,magnetic_variation_deg, usageType, power, associated_airport) 
FROM 'D:\trainingnov21\training-database/navaids.csv' DELIMITER ',' CSV HEADER;
select count(*) from navaids;
select * from navaids;
----2.Create a table for regions and import the CSV file you downloaded.
CREATE TABLE regions (
	id int,
	code varchar(10),
	local_code varchar(10),
	name text,
	continent char(2),
	iso_country varchar(10),
	wikipedia_link text,
	keywords text
)
\copy regions (id,code, local_code, name, continent, iso_country, wikipedia_link, keywords) FROM 'D:\trainingnov21\training-database/regions.csv' DELIMITER ',' CSV HEADER;
select * from regions;
----3.Create a table for countries and import the CSV file you downloaded.
CREATE TABLE countries (
	id int,
	code varchar(10),
	name text,
	continent char(2),
	wikipedia_link text,
	keywords text
)
\copy countries ( id,code, name, continent, wikipedia_link, keywords) FROM 'D:\trainingnov21\training-database/regions.csv' DELIMITER ',' CSV HEADER;
select count(*) from countries;
---4.Create a table for runways and import the CSV file you downloaded.
CREATE TABLE runways (
	id int,
	airport_ref int,
	airport_ident varchar(10),
	length_ft int,
	width_ft int,
	surface text,
	lighted boolean,
	closed boolean,
	le_ident varchar(10),
	le_latitude_deg float,
	le_longitude_deg float,
	le_elevation_ft int,
	le_heading_degT float,
	le_displaced_threshold_ft int,
	he_ident varchar(10),
	he_latitude_deg float,
	he_longitude_deg float,
	he_elevation_ft int,
	he_heading_degT float,
	he_displaced_threshold_ft int
)

\copy runways ( id,airport_ref, airport_ident, length_ft, width_ft, surface, lighted, closed ,le_ident, le_latitude_deg, le_longitude_deg, le_elevation_ft, le_heading_degT, le_displaced_threshold_ft, he_ident, he_latitude_deg, he_longitude_deg, he_elevation_ft, he_heading_degT, he_displaced_threshold_ft)  FROM 'D:\trainingnov21\training-database/runways.csv' DELIMITER ',' CSV HEADER;

select * from runways;

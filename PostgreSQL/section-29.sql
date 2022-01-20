---section 29
"id","ident","type","name","latitude_deg","longitude_deg","elevation_ft","continent","iso_country","iso_region","municipality","scheduled_service","gps_code","iata_code","local_code","home_link","wikipedia_link","keywords"
CREATE DATABASE airport;
--create database airport
CREATE TABLE airports (
	id int NOT NULL,
	ident varchar(10),
	type text,
	name text,
	latitude_deg float,
	longitude_deg float,
	elevation_ft int,
	continent text,
	iso_country varchar(10),
	iso_region varchar(10),
	municipality text,
	scheduled_service text,
	gps_code varchar(10),
	iata_code varchar(20),
	local_code varchar(20),
	home_link text,
	wikipedia_link text,
	keywords text
);
 copy airports (id,ident,type,name,latitude_deg,longitude_deg,elevation_ft,continent,iso_country,iso_region,municipality,scheduled_service,gps_code,iata_code,local_code,home_link,wikipedia_link,keywords) FROM '/D:/trainingnov21/training-database/airports.csv'DELIMITER ',' CSV HEADER;
  select count(*) from airports;
  
  select * from airports;
  
  -----import airport_frequency into a table create table airport_frequeny
  "id","airport_ref","airport_ident","type","description","frequency_mhz"
  CREATE TABLE airport_frequencies (
	id int,
	airport_ref int,
	airport_ident varchar(10),
	type varchar(20),
	description text,
	frequency_mhz float
)

select * from airport_frequencies;
\copy airport_frequencies (id,airport_ref,airport_ident,type,description,frequency_mhz)FROM 'D:/trainingnov21/training-database/airport-frequencies.csv' DELIMITER ',' CSV HEADER;
---in cmd run this 
select count (*) from airport_frequencies;

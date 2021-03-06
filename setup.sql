use database citibike;

create or replace stage citibike_trips
url = 's3://snowflake-workshop-lab/citibike-trips';

create or replace table trips  
(tripduration integer,
  starttime timestamp,
  stoptime timestamp,
  start_station_id integer,
  start_station_name string,
  start_station_latitude float,
  start_station_longitude float,
  end_station_id integer,
  end_station_name string,
  end_station_latitude float,
  end_station_longitude float,
  bikeid integer,
  membership_type string,
  usertype string,
  birth_year integer,
  gender integer);

copy into trips from @citibike_trips
file_format=CSV;

create or replace table json_weather_data (v variant);

create or replace stage nyc_weather
url = 's3://snowflake-workshop-lab/weather-nyc';

copy into json_weather_data 
from @nyc_weather 
file_format = (type=json);


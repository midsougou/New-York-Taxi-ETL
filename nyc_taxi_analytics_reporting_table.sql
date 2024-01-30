CREATE OR REPLACE TABLE `new-york-taxis-etl-project.nyc_data_etl.taxi_anayltics_reporting` AS (
SELECT 
	f.trip_id,
	f.VendorID,
	d.tpep_pickup_datetime,
	d.tpep_dropoff_datetime,
	p.passenger_count,
	t.trip_distance,
	r.rate_code_name,
	pick.pickup_latitude,
	pick.pickup_longitude,
	drop.dropoff_latitude,
	drop.dropoff_longitude,
	pay.payment_type_name,
	f.fare_amount,
	f.extra,
	f.mta_tax,
	f.tip_amount,
	f.tolls_amount,
	f.improvement_surcharge,
	f.total_amount
FROM 

`new-york-taxis-etl-project.nyc_data_etl.fact_table` f
JOIN `new-york-taxis-etl-project.nyc_data_etl.datetime_dim` d  ON f.datetime_id=d.datetime_id
JOIN `new-york-taxis-etl-project.nyc_data_etl.passenger_count_dim` p  ON p.passenger_count_id=f.passenger_count_id  
JOIN `new-york-taxis-etl-project.nyc_data_etl.trip_distance_dim` t  ON t.trip_distance_id=f.trip_distance_id  
JOIN `new-york-taxis-etl-project.nyc_data_etl.rate_code_dim` r ON r.rate_code_id=f.rate_code_id  
JOIN `new-york-taxis-etl-project.nyc_data_etl.pickup_location_dim` pick ON pick.pickup_location_id=f.pickup_location_id
JOIN `new-york-taxis-etl-project.nyc_data_etl.dropoff_location_dim` drop ON drop.dropoff_location_id=f.dropoff_location_id
JOIN `new-york-taxis-etl-project.nyc_data_etl.payment_type_dim` pay ON pay.payment_type_id=f.payment_type_id)
;

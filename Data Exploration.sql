-- Checking the number of null values per column

SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `Cyclist_Dataset.Cyclist_Dataset`;


-- counting the number of ride_id and the number of distinct ride_id

SELECT COUNT(ride_id) AS total_ride_ids
FROM ` GoogleDataAnalytics.Cyclistic_Dataset `;
SELECT COUNT(DISTINCT ride_id) AS distinct_ride_ids 
FROM ` GoogleDataAnalytics.Cyclistic_Dataset `;
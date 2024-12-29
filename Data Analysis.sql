-- Total Trips by Bike Type and Rider Type 

SELECT 
  rideable_type, 
  member_casual, 
  COUNT(*) AS total_trips
FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
GROUP BY 
  member_casual, 
  rideable_type
ORDER BY 
  member_casual, 
  total_trips;


-- Total Trips by Month and Rider Type

SELECT 
  month, 
  member_casual, 
  COUNT(ride_id) AS total_trips_month
FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
GROUP BY 
  month, 
  member_casual
ORDER BY member_casual;



-- Total Trips by day of the week and Rider Type

SELECT 
  day_of_week, 
  member_casual, 
  COUNT(ride_id) AS total_trips_day
FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
GROUP BY 
  day_of_week, 
  member_casual
ORDER BY member_casual;



-- Total Trips by hour and Rider Type

SELECT 
  EXTRACT(HOUR FROM started_at) AS hour, 
  member_casual, 
  COUNT(ride_id) AS total_trips_hour
FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
GROUP BY 
  hour, 
  member_casual
ORDER BY member_casual;



-- Average Ride Length by Month and Rider Type

SELECT 
  month, 
  member_casual, 
  AVG(ride_length) AS average_ride_length_month
FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
GROUP BY 
  month, 
  member_casual;



-- Average Ride Length by day of the week and Rider Type

SELECT 
  day_of_week, 
  member_casual, 
  AVG(ride_length) AS average_ride_length_day
FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
GROUP BY 
  day_of_week, 
  member_casual;



-- Average Ride Length by hour and Rider Type

SELECT 
  EXTRACT(HOUR FROM started_at) AS hour, 
  member_casual, 
  AVG(ride_length) AS average_ride_length_hour
FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
GROUP BY 
  hour, 
  member_casual;



-- Frequent stations for members (departure + arrival)
SELECT 
  station_name, 
  COUNT(ride_id) AS total_trips
FROM (
  -- Partenza
  SELECT 
    start_station_name AS station_name, 
    ride_id
  FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
  WHERE member_casual = 'member'
  
  UNION ALL
  
  -- Arrivo
  SELECT 
    end_station_name AS station_name, 
    ride_id
  FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
  WHERE member_casual = 'member'
)
GROUP BY station_name
ORDER BY total_trips DESC;



-- Frequent stations for casual riders (departure + arrival)
SELECT 
  station_name, 
  COUNT(ride_id) AS total_trips
FROM (
  -- Partenza
  SELECT 
    start_station_name AS station_name, 
    ride_id
  FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
  WHERE member_casual = 'casual'
  
  UNION ALL
  
  -- Arrivo
  SELECT 
    end_station_name AS station_name, 
    ride_id
  FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
  WHERE member_casual = 'casual'
)
GROUP BY station_name
ORDER BY total_trips DESC;




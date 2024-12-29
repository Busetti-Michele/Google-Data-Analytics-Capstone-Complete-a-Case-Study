-- Creating a new table for data cleaning

DROP TABLE IF EXISTS `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`;

CREATE TABLE IF NOT EXISTS `GoogleDataAnalytics.Cyclistic_Dataset_cleaned` AS (
  WITH ranked_data AS (
    SELECT 
      a.ride_id, 
      a.rideable_type, 
      a.started_at, 
      a.ended_at, 
      (EXTRACT(HOUR FROM (a.ended_at - a.started_at)) * 60 + 
       EXTRACT(MINUTE FROM (a.ended_at - a.started_at)) + 
       EXTRACT(SECOND FROM (a.ended_at - a.started_at)) / 60) AS ride_length,  -- Calcoliamo ride_length direttamente
      FORMAT_TIMESTAMP('%a', a.started_at) AS day_of_week,  
      FORMAT_TIMESTAMP('%b', a.started_at) AS month,         
      a.start_station_name, 
      a.end_station_name, 
      a.start_lat, 
      a.start_lng, 
      a.end_lat, 
      a.end_lng, 
      a.member_casual,
      CASE 
        WHEN a.start_station_name = a.end_station_name THEN 1
        ELSE 0
      END AS start_equals_end,
      ROW_NUMBER() OVER (PARTITION BY a.ride_id ORDER BY a.started_at) AS row_num -- Numeriamo le righe duplicate
    FROM `GoogleDataAnalytics.Cyclistic_Dataset` a
  )
  SELECT 
    ride_id, 
    rideable_type, 
    started_at, 
    ended_at, 
    ride_length,  
    day_of_week,  
    month,         
    start_station_name, 
    end_station_name, 
    start_lat, 
    start_lng, 
    end_lat, 
    end_lng, 
    member_casual,
    start_equals_end
  FROM ranked_data
  WHERE row_num = 1 -- Selezioniamo solo la prima riga per ogni ride_id
);



-- Adjustment of the start_equals_end column

UPDATE `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
SET start_equals_end = 
  CASE 
    WHEN COALESCE(start_station_name, '') = COALESCE(end_station_name, '') THEN 1
    ELSE 0
  END
WHERE TRUE;



-- Removing all rows with duplicate ride_id values

DELETE FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
WHERE ride_id NOT IN (
  SELECT MIN(ride_id)
  FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
  GROUP BY ride_id
);



-- Removing trips with a duration greater than 24 hours (1440 minutes)

DELETE FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
WHERE ride_length > 1440;



-- Removing all rows where ride_length is less than one minute and start_equals_end equals 1
DELETE FROM `GoogleDataAnalytics.Cyclistic_Dataset_cleaned`
WHERE ride_length < 1 AND start_equals_end = 1;



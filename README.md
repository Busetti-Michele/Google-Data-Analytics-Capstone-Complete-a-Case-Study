# Google Data Analytics Capstone: Cyclistic Case Study

This capstone project is the final step of the Google Data Analytics Certificate and is designed to demonstrate my ability to apply the concepts and skills learned throughout the course. <br> 
My task is to answer key business questions by following the structured data analysis process: Ask, Prepare, Process, Analyze, Share, and Act. This roadmap will guide me through each step, helping me address the challenge effectively and present actionable insights supported by data.

## Table of Contents

- [Introduction](#introduction)
- [Ask](#ask)
- [Prepare](#prepare)
- [Process](#process)
- [Analyze](#analyze)

## Introduction


### Scenario
For this case study, I will act as a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compeling data insights and professional data visualizations.

### Characters and teams 
- <b> Cyclistic</b>: A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day. 

- <b> Lily Moreno</b>: The director of marketing and my manager. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.

- <b> Cyclistic marketing analytics team</b>: A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy. I joined this team six months ago and have been busy learning about Cyclistic’s mission and business goals—as well as how I, as a junior data analyst, can help Cyclistic achieve them. 

- <b> Cyclistic executive team</b>: The notoriously detail-oriented executive team wil decide whether to approve the recommended marketing program.

### About the company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. 

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. 

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## Ask
### Business Task
Three key questions will guide the future marketing program: 
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

### Assigned Task
I have been assigned the task of answering the first question: How do annual members and casual riders use Cyclistic bikes differently?
<br> My role is to provide a thorough analysis of how casual riders and annual members use Cyclistic bikes differently, offering reliable data that Lily Moreno and the marketing team can use to make strategic decisions. These insights will guide Cyclistic in creating targeted campaigns, optimizing bike allocation, and designing membership plans that appeal to casual riders, ultimately aiming to increase conversions and revenue.

## Prepare

### Data Source
For this analysis, I will use Cyclistic’s historical trip data from the past 12 months, which is organized by month. Each Excel sheet corresponds to a specific month, covering data from December 2023 through November 2024.  This dataset can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). It will help me explore how different customer types use Cyclistic bikes.

<i>(Disclaimer: The data is available through [this license](https://divvybikes.com/data-license-agreement), provided by Motivate International Inc. specifically for this case study. It is important to note that the data is anonymized, meaning that no personally identifiable information is included, such as riders’ names or credit card details. This ensures privacy and complies with data security regulations. The license allows the use of the data only for the purposes of this case study.)</i>

### Dataset Overview and Structure
The dataset comprises 12 files named using the YYYYMM-divvy-tripdata format, with each file representing a single month of data. These files contain details such as the ride ID, vehicle type, start and end times, start and end stations, start and end locations, and the rider's membership status. The corresponding column headers are: 
- ride_id
- rideable_type
- started_at
- ended_at
- start_station_name
- start_station_id
- end_station_name
- end_station_id
- start_lat
- start_lng
- end_lat
- end_lng
- member_casual

### Data Credibility and Bias
The dataset comes from Cyclistic’s historical trip data, ensuring credibility. However, potential biases include:
- Sampling Bias: Only Cyclistic bike trips are included, excluding other transport options.
- Geographical Bias: The data is specific to Chicago.
- Temporal Bias: The data covers December 2023 to November 2024, so insights are limited to this period.

The data meets ROCCC criteria:
- Reliable: From Cyclistic.
- Original: Directly collected from Cyclistic.
- Comprehensive: Covers all trips in the timeframe.
- Current: Includes data through November 2024.
- Cited: Proper attribution through the license.

## Process

### Data Format Conversion and Initial Setup
To handle the large dataset consisting of 5,906,269 rows efficiently, I uploaded all the monthly CSV files directly to Google Cloud's BigQuery. This approach allowed me to consolidate the data into a single table and leverage SQL for data exploration and cleaning. 

By using BigQuery, I was able to analyze the dataset's structure, identify inconsistencies, and prepare the data for further analysis. This method provided a scalable and efficient solution for managing and processing such a substantial volume of data.

### Data Exploration
In this step i'm going to explore the structure of my dataset.

The commands executed on BigQuery will be documented in the [Data Exploration.sql](https://github.com/Busetti-Michele/Google-Data-Analytics-Capstone-Complete-a-Case-Study/blob/main/Data%20Exploration.sql) file.

First, I aim to determine the number of null values in each column
![image](https://github.com/user-attachments/assets/a8e2bba1-2b3c-4b33-9e08-b164335cdf39)
As we can see from this image, some columns have no missing data, while others have a significant amount (approximately 1/6 of the dataset). 


#### Column ride_id

The ride_id  column will likely serve as our primary key. So, we will ensure that all values are distinct and have the same character length to guarantee there are no errors. 

![image](https://github.com/user-attachments/assets/b18a0383-9e68-409b-bbeb-1928c1d71817) ......
![image](https://github.com/user-attachments/assets/d3ba6d74-a348-445a-82c4-771258332bb7)

It will be necessary to remove the rows with duplicate ride_id values to ensure data consistency.

![image](https://github.com/user-attachments/assets/733b5ee9-949b-4017-a84b-f2510fa13cb5)


All ride_id values have a length of 16 characters


#### Column rideable_type
The rideable_type column indicates the type of vehicle used. 

![image](https://github.com/user-attachments/assets/5ab3536a-5956-4afc-9d4d-e42e88ab6c9d)

Note that classic bikes and electric bikes are the most frequently used vehicles

#### Columns started_at & ended_at
During the initial exploration of the dataset, I identified certain cases that seemed unusual and might require further attention. Specifically, trips with a duration exceeding 24 hours or those where the trip duration was less than one minute, with the start and end stations being the same, seemed likely to represent errors or insignificant trips. These situations suggest that either there were issues in recording the arrival time or users may have changed their minds shortly after starting the ride. These types of trips will need further consideration during the cleaning phase to ensure the dataset’s relevance and accuracy.


#### Columns start_station_name, start_station_id, end_station_name, end_station_id
For station_name and station_id, both for start and end stations, the information seems somewhat redundant. Since they contain the same amount of missing data, we might decide to keep one or the other. Keeping the station name appears to be the better choice compared to the ID, as it makes more sense to retain the names, which provide useful context about the departure or arrival stations. The IDs, on the other hand, wouldn't offer any meaningful insight.

Although some rows in the columns start_station_name, start_station_id, end_station_name, and end_station_id contain missing values, these rows will not be deleted. Removing these rows would result in losing valuable information about the ride durations. Since the duration of the rides could provide insights into the behavior of subscribed vs. casual users, it is important to retain all the data related to ride length, even if the station information is missing.


#### Columns start_lat, start_lng, end_lat, end_lng
The fact that we always have starting latitude and longitude but not ending coordinates could indicate errors in the trip completion phase. This might correlate with improper recording of trip end times.


#### Column member_casual
Finally, the last column, as we already know, indicates whether the rider was a subscribed member or a casual user.

![image](https://github.com/user-attachments/assets/d80b4119-4af4-420d-bec0-9315628a3723)

Note that a total of 3.7 million trips were made by members, while 2.1 million trips were made by casual riders. The main objective is to convert casual riders into members, and while we are on the right track, there is still room for improvement in understanding the behaviors of both groups to effectively drive this conversion


## Data Cleaning
In this repository, all data cleaning operations performed on BigQuery will be documented in the [Data_Cleaning.sql](https://github.com/Busetti-Michele/Google-Data-Analytics-Capstone-Complete-a-Case-Study/blob/main/Data%20Cleaning.sql) file.

To begin with, I created a new table called Cyclistic_Dataset_cleaned, where all the information from the original table was transferred, along with several new columns to enrich and simplify the analysis:

- ride_length: calculates the duration of each ride in minutes, helping identify unusually long or short trips.
- day_of_week: indicates the day of the week when the ride started, useful for temporal analysis and cyclical behaviors.
- month: clearly displays the month when the ride began, facilitating seasonal analysis.
- start_equals_end: checks if a ride started and ended at the same station

After transferring the information to the Cyclistic_Dataset_cleaned table and adding the new columns for analysis, I focused on removing any rows that might introduce inaccuracies or irrelevant data into the analysis.

I started by eliminating rows with duplicate ride_id values, as these represented repeated entries of the same ride. Following that, I removed trips where the duration exceeded 24 hours, as these were likely caused by errors in recording the arrival time at the station.

Next, I removed rows where the trip duration was less than one minute, and the start_equals_end column had a value of 1, indicating that the start and end stations were the same. These cases likely reflected instances where users had changed their mind shortly after starting the ride, and the data was not meaningful for the analysis.

Additionally, I decided to remove cases where the duration was less than one minute and the start_equals_end value of 1 was due to missing records for both the start and end stations. This was clearly an error in data collection and was removed to maintain the integrity of the dataset.

After these cleaning steps, the number of rows reduced from 5,906,269 to 5,794,919, and the dataset is now ready for analysis.

## Analyze & Share
The analyses performed in BigQuery will be included in the file [Data Analysis.sql](https://github.com/Busetti-Michele/Google-Data-Analytics-Capstone-Complete-a-Case-Study/blob/main/Data%20Analysis.sql), while the visualizations were created using Tableau.


Analyses Conducted:

### <b> 1. Analyzing Bike Usage to Understand the Current Situation </b>
First of all, I decided to analyze the usage of the bikes to assess the current situation of the company. 
This represents the usage in hours by members and casual riders:

![image](https://github.com/user-attachments/assets/30741af9-5c1c-40d0-b30d-4430b162237a)
From the data, we observe that the ride duration for both members and casual riders is quite similar, highlighting significant opportunities for improvement.




### <b> 2. Number of Rides Analysis </b>

Objective: To examine the total number of rides taken by members and casual riders across different timeframes (month, day, and hour).
![image](https://github.com/user-attachments/assets/f8ebbf1c-8826-4b93-86a5-7442267a537e)
![image](https://github.com/user-attachments/assets/df8d7625-b1d7-4350-97ff-9f81857a2b66)
![image](https://github.com/user-attachments/assets/778e4f1d-9ae1-448f-a91c-f79818daeca2)

The analysis of ride frequency highlights that members generally take more rides overall compared to casual users, reflecting their consistent and utilitarian use of the service.

- Monthly Trends: The highest number of rides occurs between June and September, aligning with the warmer months when cycling is most favorable. Conversely, usage significantly declines during the colder winter months.
- Weekly Trends: Members show a higher usage of bikes during weekdays, likely reflecting commuting patterns. In contrast, casual riders predominantly use the bikes on weekends, suggesting leisure-oriented usage.
- Hourly Trends: Overall bike usage increases steadily throughout the day, peaking in the late afternoon around 6 PM. For members, two distinct peaks are observed: one in the 7-8 AM timeframe and another in the 5-6 PM range, coinciding with typical commuting hours.



### <b> 3. Average Ride Duration Analysis</b>

Objective: To analyze the average ride duration across different timeframes, including by month, day of the week, and hour of the day.

![image](https://github.com/user-attachments/assets/7dae028a-2790-4c6d-be89-cc767ad19570)
![image](https://github.com/user-attachments/assets/abbff7dd-7b5e-4886-9101-eaba92bdfae1)
![image](https://github.com/user-attachments/assets/01886769-d787-4ae0-b5ff-6b0913712f85)

it is clear that casual riders tend to use the bike for longer periods during a ride. In contrast, the average ride duration for members remains similar across all three time periods analyzed.

- Monthly Trends: Casual riders use the bike for a longer duration on average, with peak usage occurring from April to August. On the other hand, member ride durations remain fairly consistent across all months.
- Weekly Trends: There is a slight increase in ride duration during weekends, suggesting that casual riders tend to have more leisurely rides compared to weekdays.
- Hourly Trends: The average ride duration is lower between 4 AM and 7 AM. However, it peaks between 10 AM and 3 PM.




### <b> 4. Analysis of Vehicle Usage by Rider Type </b>

Objective: To determine the types of vehicles (classic bikes, electric bikes, etc.) preferred by members and casual riders.
     ![image](https://github.com/user-attachments/assets/2552c853-88e3-42d2-811a-6a7ad9501ee0)
    ![image](https://github.com/user-attachments/assets/ddd688fe-b9b6-4c91-886d-4a8ef2d3a9cb)
As observed, the most utilized vehicles were classic bikes and electric bikes, both used in similar quantities by members and casual riders



### <b> 5. -- Frequent stations for members & casual riders (departure + arrival) </b>
The query allowed me to identify the most frequently used stations by members and casual riders. 

![image](https://github.com/user-attachments/assets/799b3838-61f4-4fb4-8223-13b0e8494cce).....
![image](https://github.com/user-attachments/assets/d818812b-4f6d-4501-affe-eebcc80a5860)


As shown in the two images provided, members (first one) tend to use bikes more often from stations located near residential areas and universities.
On the other hand, casual riders (second one) frequently start their trips from stations near parks, acquariums, planetariums and theaters





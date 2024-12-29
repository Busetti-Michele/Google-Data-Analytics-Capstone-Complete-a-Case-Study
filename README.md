# Google Data Analytics Capstone: Cyclistic Case Study

This capstone project is the final step of the Google Data Analytics Certificate and is designed to demonstrate my ability to apply the concepts and skills learned throughout the course. <br> 
My task is to answer key business questions by following the structured data analysis process: Ask, Prepare, Process, Analyze, Share, and Act. This roadmap will guide me through each step, helping me address the challenge effectively and present actionable insights supported by data.

## Table of Contents

- [Introduction](#introduction)
- [Ask](#ask)
- [Prepare](#prepare)
- [Process](#process)

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

The commands executed on BigQuery will be documented in the Data Exploration.sql file.

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


We have complete data for both start and end times, but it might be necessary to assess the consistency of these trips.

For station_name and station_id, both for start and end stations, the information seems somewhat redundant. Since they contain the same amount of missing data, we might decide to keep one or the other. Keeping the station name appears to be the better choice compared to the ID, as it makes more sense to retain the names, which provide useful context about the departure or arrival stations. The IDs, on the other hand, wouldn't offer any meaningful insight.

The fact that we always have starting latitude and longitude but not ending coordinates could indicate errors in the trip completion phase. This might correlate with improper recording of trip end times.

Finally, the last column, as we already know, indicates whether the rider was a subscribed member or a casual user.








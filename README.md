# PowerLine
### Data Warehouse for Energy Price Analytics

## Problem Statement
Energy is sold by wholesalers across the US in same-day and day-ahead markets. Same-day markets are especially volatile as the price can be affected by real-time energy consumption and weather. By creating a platform where energy buyers can compare how price changes through time relative to weather and consumption data, there is a large opportunity for energy companies to save money by predicting the most accurate amount of energy to purchase.

## Technologies Used
* AWS
  * EC2
* Python3.7
* PostgreSQL
* Python Libraries
  * pandas
  * plotly
* Dash
* Cron

## Pipeline


## Sample Pipeline .sh File

** Insert .sh file code

Data is downloaded from web services (.csv) and using OpenWeather API (.json). Each type of file is processed differently to load the data into Postgres. 

Once data is loaded into stage tables, it is then queried into formatted tables with a star schema model, as fact and dimension tables.

** Insert star schema example

Finally, the data is queried into the FrontEndTable, where data is directly used to show the following visuals in Dash:

** Insert demo gif


## Setup Instructions
** Insert setup


-- Read-me in progress, update coming 6/22/2020

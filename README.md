# PowerLine
### Data Warehouse for Energy Price Analytics

## Problem Statement
Energy is sold by wholesalers across the US in same-day and day-ahead markets. Same-day markets are especially volatile as the price can be affected by real-time energy consumption and weather. By creating a platform where energy buyers can compare how price changes through time relative to weather and consumption data, there is a large opportunity for energy companies to save money by predicting the most accurate amount of energy to purchase.

## Technologies Used
* AWS
  * EC2
* Python3.6
* PostgreSQL
* Python Libraries
  * pandas
  * plotly
* Dash
* Cron

## Pipeline


## Sample Pipeline .sh File

```
# Download .csv file from web
/usr/bin/python $project_folder/scripts/dl_spp.py https://marketplace.spp.org/file-browser-api/download/da-lmp-by-location?path=%2F$current_year%2F$current_month%2FBy_Day%2FDA-LMP-SL-"$

# Load .csv file into Postgres stage table
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_spp_lmp.sql

# Process and clean stage table into fact table
python $project_folder/scripts/exec_sql.py $project_folder/scripts/spp_lmp_fact.sql

```

Data is downloaded from web services (.csv) and using OpenWeather API (.json). Each type of file is processed differently to load the data into Postgres. 

Once data is loaded into stage tables, it is then queried into formatted tables with a star schema model, as fact and dimension tables.

** Insert star schema example

Finally, the data is queried into the FrontEndTable, where data is directly used to show the following visuals in Dash:

** Insert demo gif


## File Descriptions

1. downloads/spp
 * SPP is the ISO this project is built on. As more ISO's are added, this folder will include more directories.
 * Each source file is downloaded into the "Source" folder. Once it runs through the pipeline, it is moved to the   "Processed" folder.
 
2. Scripts
 * Includes .sh files to run each file download and process through the pipeline.
 * Includes .sql files for SQL queries to run when moving data between file, stage, and fact tables.
 * Includes Execute-SQL file to create a connection between EC2 Postgres and EC2 computer.
 
 
## Front End

Frontend is developed with Dash. Dash execute file is located in Dash folder.


-- Read-me in progress, update coming 6/22/2020

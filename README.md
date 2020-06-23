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

## File Descriptions

##### 1. downloads
 * SPP is the ISO this project is built on. As more ISO's are added, this folder will include more directories.
 * Weather downloads are in a separate folder within "downloads"
 * Each source file is downloaded into the "Source" folder. Once it runs through the pipeline, it is moved to the   "Processed" folder.
 
##### 2. scripts
 * Includes .sh files to run each file download and process through the pipeline.
 * Includes .sql files for SQL queries to run when moving data between file, stage, and fact tables.
 * Includes Execute-SQL file to create a connection between EC2 Postgres and EC2 computer.
 
##### 3. energyUI
 * Dash file for frontend

## Pipeline

<img width="784" alt="Screen Shot 2020-06-22 at 6 44 24 PM" src="https://user-images.githubusercontent.com/56900996/85352572-4b713c00-b4d4-11ea-8d5f-9163962efff7.png">

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

There is a total of 3 fact tables, each with 4 connecting dimension tables.
Below is an example of one schema:

<img width="385" alt="Screen Shot 2020-06-22 at 6 39 57 PM" src="https://user-images.githubusercontent.com/56900996/85352653-6d6abe80-b4d4-11ea-9765-8ff72210a85d.png">

## To Execute

1. Fill in database credentials in the following files:
 * /scripts/exec_sql.py
 * /energyUI/energyUI.py
 
2. Copy contents of crontab file into local Cron

3. To load frontend database, run the following code:
``` sudo python /scripts/fill_frontend.sh ```

4. To view Dash frontend, run the following code:
``` sudo python /energyUI/energyUI.py ```

## Frontend

Finally, the data is queried into the FrontEndTable, where data is directly used to show the following visuals in Dash:

![](powerline_demo.gif | width=800)




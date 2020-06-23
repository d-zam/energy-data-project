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

'''
#!/bin/sh

current_time=$(date "+%Y.%m.%d-%H.%M.%S")
current_date=$(date -d "1 day ago" "+%Y%m%d")
current_year=$(date "+%Y")
current_month=$(date "+%m")

project_folder=/home/ubuntu/insight/energy_pricing

# Download .csv file from web
/usr/bin/python $project_folder/scripts/dl_spp.py https://marketplace.spp.org/file-browser-api/download/da-lmp-by-location?path=%2F$current_year%2F$current_month%2FBy_Day%2FDA-LMP-SL-"$

# Load .csv file into Postgres stage table
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_spp_lmp.sql

# Process and clean stage table into fact table
python $project_folder/scripts/exec_sql.py $project_folder/scripts/spp_lmp_fact.sql


current_time=$(date "+%Y.%m.%d-%H.%M.%S")

# Move file from "source" to "processed" folder on EC2
mv $project_folder/downloads/spp/lmp/source/spp_lmp.csv $project_folder/downloads/spp/lmp/processed/spp_lmp.$current_time.csv
'''

Data is downloaded from web services (.csv) and using OpenWeather API (.json). Each type of file is processed differently to load the data into Postgres. 

'''
TRUNCATE TABLE spp_lmp_byloc;
COPY spp_lmp_byloc(Interval,GMTIntervalEnd,Settlement_Location,Pnode,LMP,MLC,MCC,MEC)
FROM '/home/ubuntu/insight/energy_pricing/downloads/spp/lmp/source/spp_lmp.csv' DELIMITER ',' CSV HEADER;
'''

Once data is loaded into stage tables, it is then queried into formatted tables with a star schema model, as fact and dimension tables.

'''
--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_lmp_byloc(
iso_pk,
setlmtloc_pk,
lmpprice,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, d.setlmntloc_pk, cast(LMP as decimal(12,2)), to_timestamp(s.GMTIntervalEnd,'MM/DD/YYYY HH24:MI:SS')
FROM spp_lmp_byloc AS s
LEFT JOIN dim_setlmntloc as d
ON lower(s.settlement_location) = lower(d.setlmtlocname)
--Left join to prevent downloading duplicate files
LEFT JOIN fact_lmp_byloc AS f
        ON to_timestamp(s.GMTIntervalEnd,'MM/DD/YYYY HH24:MI:SS') = f.timeend
        AND f.setlmtloc_pk = d.setlmntloc_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.setlmtloc_pk IS NULL;

'''

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

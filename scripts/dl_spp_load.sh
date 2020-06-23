#!/bin/sh

current_time=$(date "+%Y.%m.%d-%H.%M.%S")
current_date=$(date -d "2 days ago" "+%Y%m%d")
current_year=$(date "+%Y")

project_folder=/home/ubuntu/insight/energy_pricing

/usr/bin/python $project_folder/scripts/dl_spp.py https://marketplace.spp.org/file-browser-api/download/hourly-load?path=%2F$current_year%2FDAILY_HOURLY_LOAD-$current_date.csv $project_folder/downloads/spp/load/source/spp_load
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_spp_load.sql
python $project_folder/scripts/exec_sql.py $project_folder/scripts/spp_load_fact.sql

mv $project_folder/downloads/spp/load/source/spp_load.csv $project_folder/downloads/spp/load/processed/spp_load.$current_time.csv

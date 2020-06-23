#!/bin/sh

current_time=$(date "+%Y.%m.%d-%H.%M.%S")
current_date=$(date -d "1 day ago" "+%Y%m%d")
current_year=$(date "+%Y")
current_month=$(date "+%m")

project_folder=/home/ubuntu/insight/energy_pricing

/usr/bin/python $project_folder/scripts/dl_spp.py https://marketplace.spp.org/file-browser-api/download/da-lmp-by-location?path=%2F$current_year%2F$current_month%2FBy_Day%2FDA-LMP-SL-"$current_date"0100.csv $project_folder/downloads/spp/lmp/source/spp_lmp
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_spp_lmp.sql
python $project_folder/scripts/exec_sql.py $project_folder/scripts/spp_lmp_fact.sql


current_time=$(date "+%Y.%m.%d-%H.%M.%S")

mv $project_folder/downloads/spp/lmp/source/spp_lmp.csv $project_folder/downloads/spp/lmp/processed/spp_lmp.$current_time.csv

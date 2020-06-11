#!/bin/sh

project_folder=/home/ubuntu/insight/energy_pricing

/usr/bin/python $project_folder/scripts/dl_spp.py 'https://marketplace.spp.org/chart-api/load-forecast/asFile' $project_folder/downloads/spp/forecast/source/spp_forecast
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_spp_forecast.sql

current_time=$(date "+%Y.%m.%d-%H.%M.%S")

mv $project_folder/downloads/spp/forecast/source/spp_forecast.csv $project_folder/downloads/spp/forecast/processed/spp_forecast.$current_time.csv

#!/bin/sh

project_folder=/home/ubuntu/insight/energy_pricing
#epochtime=$(date +"%s")
epochtime=$(date --date="1 day ago" +"%s")

current_time=$(date "+%Y.%m.%d-%H.%M.%S")

/usr/bin/python $project_folder/scripts/dl_weather.py 36.08 -94.17 $epochtime $project_folder/downloads/weather/source/loc1_weather.json
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_weather.sql
python $project_folder/scripts/exec_sql.py $project_folder/scripts/weather_fact.sql 'ede'
python $project_folder/scripts/exec_sql.py $project_folder/scripts/weather_fact.sql 'csws'

mv $project_folder/downloads/weather/source/loc1_weather.json $project_folder/downloads/weather/processed/ede_csws_weather_$current_time.json

/usr/bin/python $project_folder/scripts/dl_weather.py 37.03 -95.62 $epochtime $project_folder/downloads/weather/source/loc1_weather.json
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_weather.sql
python $project_folder/scripts/exec_sql.py $project_folder/scripts/weather_fact.sql 'grda'

mv $project_folder/downloads/weather/source/loc1_weather.json $project_folder/downloads/weather/processed/grda_weather_$current_time.json

/usr/bin/python $project_folder/scripts/dl_weather.py 35.41 -98.90 $epochtime $project_folder/downloads/weather/source/loc1_weather.json
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_weather.sql
python $project_folder/scripts/exec_sql.py $project_folder/scripts/weather_fact.sql 'okge'

mv $project_folder/downloads/weather/source/loc1_weather.json $project_folder/downloads/weather/processed/okge_weather_$current_time.json

/usr/bin/python $project_folder/scripts/dl_weather.py 35.46 -97.52 $epochtime $project_folder/downloads/weather/source/loc1_weather.json
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_weather.sql
python $project_folder/scripts/exec_sql.py $project_folder/scripts/weather_fact.sql 'sps'

mv $project_folder/downloads/weather/source/loc1_weather.json $project_folder/downloads/weather/processed/sps_weather_$current_time.json

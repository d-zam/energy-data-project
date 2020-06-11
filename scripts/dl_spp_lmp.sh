#!/bin/sh

project_folder=/home/ubuntu/insight/energy_pricing

/usr/bin/python $project_folder/scripts/dl_spp.py 'https://marketplace.spp.org/chart-api/lmp-trend/asFile' $project_folder/downloads/spp/lmp/source/spp_lmp
python $project_folder/scripts/exec_sql.py $project_folder/scripts/load_spp_lmp.sql
python $project_folder/scripts/exec_sql.py $project_folder/scripts/spp_lmp_fact.sql


current_time=$(date "+%Y.%m.%d-%H.%M.%S")

mv $project_folder/downloads/spp/lmp/source/spp_lmp.csv $project_folder/downloads/spp/lmp/processed/spp_lmp.$current_time.csv

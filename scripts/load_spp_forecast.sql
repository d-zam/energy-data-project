TRUNCATE TABLE spp_forecast;
COPY spp_forecast(Interval,GMTIntervalEnd,STLF,MTLF,Actual_Load,STWF,MTWF,Actual_Wind, STSF, MTSF, Actual_Solar) 
FROM '/home/ubuntu/insight/energy_pricing/downloads/spp/forecast/source/spp_forecast.csv' DELIMITER ',' CSV HEADER;

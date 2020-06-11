TRUNCATE TABLE spp_lmp;
COPY spp_lmp(GMTTime, SPP_North, SPP_South, AECI, BLKW, EDDY, ERCOTE, ERCOTN, LAM345, MCWEST, MISO, RCEAST, SCSE, SGE, SPA, SPC, TVA) 
FROM '/home/ubuntu/insight/energy_pricing/downloads/spp/lmp/source/spp_lmp.csv' DELIMITER ',' CSV HEADER;

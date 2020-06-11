TRUNCATE TABLE spp_load;
COPY spp_load(MarketHour, CSWS, EDE, GRDA, INDN, KACY, KCPL, LES, MPS, NPPD, OKGE, OPPD, SECI, SPRM, SPS, WAUE, WFEC, WR) 
FROM '/home/ubuntu/insight/energy_pricing/downloads/spp/load/source/spp_load.csv' DELIMITER ',' CSV HEADER;

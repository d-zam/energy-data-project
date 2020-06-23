TRUNCATE TABLE spp_lmp_byloc;
COPY spp_lmp_byloc(Interval,GMTIntervalEnd,Settlement_Location,Pnode,LMP,MLC,MCC,MEC)
FROM '/home/ubuntu/insight/energy_pricing/downloads/spp/lmp/source/spp_lmp.csv' DELIMITER ',' CSV HEADER;

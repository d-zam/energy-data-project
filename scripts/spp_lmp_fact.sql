--Query to load LMP Fact table from Stage and Dimension Tables
--To Do: Error handling (move to error folder if fails)

DO $$
--Declare variables to select SPP ISO and Location
DECLARE dim_iso_pk integer;
DECLARE dim_location_pk integer;

--Variables calling for SPP as ISO and SPP North as location. -- TO DO: Confirm locations from file
BEGIN
dim_iso_pk = (SELECT iso_pk FROM dim_iso WHERE iso_name = 'SPP');
dim_location_pk = (SELECT location_pk FROM dim_location WHERE loc_name = 'SPP North');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_rtlmp(
iso_pk,
location_pk,
lmpprice,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_location_pk, cast(s.spp_north as decimal(12,2)), to_timestamp(s.gmttime,'YYYY-MM-DD HH24:MI:SS')
FROM spp_lmp AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_rtlmp AS f 
	ON to_timestamp(s.gmttime,'YYYY-MM-DD HH24:MI:SS') = f.timeend
	AND f.location_pk = dim_location_pk
	AND f.iso_pk = dim_iso_pk
	WHERE f.rtlmp_pk IS NULL;

END $$;

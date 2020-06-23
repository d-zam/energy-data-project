DO $$
--Declare variables to select SPP ISO and Location
DECLARE dim_iso_pk integer;

--Variables calling for SPP as ISO and SPP North as location. -- TO DO: Confirm locations from file
BEGIN
dim_iso_pk = (SELECT iso_pk FROM dim_iso WHERE iso_name = 'SPP');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_lmp_byloc(
iso_pk,
setlmtloc_pk,
lmpprice,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, d.setlmntloc_pk, cast(LMP as decimal(12,2)), to_timestamp(s.GMTIntervalEnd,'MM/DD/YYYY HH24:MI:SS')
FROM spp_lmp_byloc AS s
LEFT JOIN dim_setlmntloc as d
ON lower(s.settlement_location) = lower(d.setlmtlocname)
--Left join to prevent downloading duplicate files
LEFT JOIN fact_lmp_byloc AS f
        ON to_timestamp(s.GMTIntervalEnd,'MM/DD/YYYY HH24:MI:SS') = f.timeend
        AND f.setlmtloc_pk = d.setlmntloc_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.setlmtloc_pk IS NULL;

END $$;

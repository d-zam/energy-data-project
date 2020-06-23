--Query to load LMP Fact table from Stage and Dimension Tables
--To Do: Error handling (move to error folder if fails)

DO $$
--Declare variables to select SPP ISO and Location
DECLARE dim_iso_pk integer;
DECLARE dim_emszone_pk integer;

--Variables calling for SPP as ISO and SPP North as location. -- TO DO: Confirm locations from file
BEGIN
dim_iso_pk = (SELECT iso_pk FROM dim_iso WHERE iso_name = 'SPP');
dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'csws');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
	ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
	AND f.emszone_pk = dim_emszone_pk
	AND f.iso_pk = dim_iso_pk
	WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'ede');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'grda');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'indn');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;
dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'kacy');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;
dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'kcpl');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'les');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'mps');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'nppd');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'okge');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'oppd');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'seci');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'sprm');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'sps');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'waue');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'wfec');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = 'wr');

--Insert into Fact table: pk's from dim tables, lmpprice is the lmp from SPP North location and timeend is the gmttime field in spp_lmp.csv file
INSERT INTO fact_load(
iso_pk,
emszone_pk,
mw,
timeend
)

--Must convert the lmp price to decimal format from varchar (in stage table) and convert to datetime format from varchar
SELECT dim_iso_pk, dim_emszone_pk, cast(csws as decimal(12,2)), to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI')
FROM spp_load AS s
--Left join to prevent downloading duplicate files
LEFT JOIN fact_load AS f
        ON to_timestamp(s.MarketHour,'mm/dd/YY HH24:MI') = f.timeend
        AND f.emszone_pk = dim_emszone_pk
        AND f.iso_pk = dim_iso_pk
        WHERE f.emszone_pk IS NULL;

END $$;

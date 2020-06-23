DO $$

DECLARE dim_iso_pk integer;
DECLARE dim_emszone_pk integer;

BEGIN
dim_iso_pk = (SELECT iso_pk FROM dim_iso WHERE iso_name = 'SPP');
dim_emszone_pk = (SELECT emszone_pk FROM dim_emszone WHERE emszonename = '$1');

WITH hour_cte (hourly)
AS(
SELECT

value as hourly

FROM dl_weather as d
CROSS JOIN json_array_elements(d.weather -> 'hourly')
)

INSERT INTO fact_weather(
iso_pk, emszone_pk, windspeed, cloud, temp_fh, timeend)

SELECT
dim_iso_pk, dim_emszone_pk,
(h.hourly ->> 'wind_speed')::numeric,
(h.hourly ->> 'clouds')::int,
(h.hourly ->> 'temp')::numeric,
to_timestamp((h.hourly ->> 'dt')::int) AT TIME ZONE 'GMT' 
FROM hour_cte AS h

LEFT JOIN fact_weather AS w
ON to_timestamp((h.hourly ->> 'dt')::int) = w.timeend
AND w.emszone_pk = dim_emszone_pk
AND w.iso_pk = dim_iso_pk
WHERE w.weather_pk IS NULL;

END $$;

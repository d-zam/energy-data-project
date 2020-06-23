DELETE FROM public.frontendtable
WHERE datetime::date < CURRENT_DATE - 4;

INSERT INTO public.frontendtable(
 	datetime,
 	iso,
 	settlementloc,
 	emszone,
 	pricenodeloc,
 	lmp,
 	windspeed,
 	clouds,
 	load_cons
 )

SELECT
l.timeend,
b.iso_name,
f.setlmtlocname,
h.emszonename,
j.pnodename,
l.lmpprice,
w.windspeed,
w.cloud,
s.mw

FROM fact_lmp_byloc as l
JOIN dim_iso as b
	ON l.iso_pk = b.iso_pk
JOIN dim_setlmntloc as f
	ON l.setlmtloc_pk = f.setlmntloc_pk
JOIN dim_emszone as h
	ON f.emszone_pk = h.emszone_pk
JOIN dim_pricenode as j
	ON f.pricenode_pk = j.pricenode_pk
JOIN fact_load as s
	ON h.emszone_pk = s.emszone_pk
	AND l.timeend = s.timeend
LEFT JOIN fact_weather as w
	ON f.emszone_pk = w.emszone_pk
	AND l.timeend = w.timeend
LEFT JOIN public.frontendtable as z
	ON z.datetime = l.timeend
	AND f.setlmtlocname = z.settlementloc

WHERE l.timeend::date > CURRENT_DATE - 2
	AND z.datetime IS NULL
	AND h.emszonename IN ('csws', 'ede', 'grda', 'okge', 'sps')

#INSERT INTO revenue (rt_id, ncesid, rev_amount, year)
SELECT rt_id, ncesid, REV_AMOUNT, YR
FROM rev_types r 
INNER JOIN revenues_temp rt
ON r.rt_code = rt.REV_TYPE
INNER JOIN districts_staging_final d
ON rt.idcensus = d.idcensus
AND REV_AMOUNT > 0;

#INSERT INTO expenses (et_id, ncesid, exp_amount, year)
SELECT et_id, ncesid, EXP_AMOUNT, YR
FROM exp_types e 
INNER JOIN expenses_temp et
ON e.et_code = et.EXP_TYPE
INNER JOIN districts d
ON et.idcensus = d.idcensus
AND EXP_AMOUNT > 0
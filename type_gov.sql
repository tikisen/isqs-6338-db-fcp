INSERT INTO D50_G03_OLTP.type_gov (tg_id, tg_name, tg_desc)
SELECT DISTINCT MID(IDCENSUS,3,1), MID(IDCENSUS,3,1), CASE WHEN MID(IDCENSUS,3,1) = 0 THEN 'State Dependent School System' WHEN MID(IDCENSUS,3,1) = 1 THEN 'County Dependent School System' WHEN MID(IDCENSUS,3,1) = 1 THEN 'County Dependent School System' WHEN MID(IDCENSUS,3,1) = 2 THEN 'City Dependent School System' WHEN MID(IDCENSUS,3,1) = 3 THEN 'Township Dependent School System' WHEN MID(IDCENSUS,3,1) = 5 THEN 'Independent School System' END
FROM FCP_Dataset.full_dataset
ORDER BY 1 ASC
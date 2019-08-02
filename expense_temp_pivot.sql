CREATE TABLE expenses_temp (IDCENSUS VARCHAR(50), YRDATA INT, YR INT, EXP_TYPE VARCHAR(5), EXP_AMOUNT DECIMAL);
INSERT INTO expenses_temp (IDCENSUS, YRDATA, YR, EXP_TYPE, EXP_AMOUNT)

SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'E07' AS EXP_TYPE, SUM(E07) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'E08' AS EXP_TYPE, SUM(E08) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'E09' AS EXP_TYPE, SUM(E09) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'E11' AS EXP_TYPE, SUM(E11) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'E13' AS EXP_TYPE, SUM(E13) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'E17' AS EXP_TYPE, SUM(E17) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'F12' AS EXP_TYPE, SUM(F12) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'G15' AS EXP_TYPE, SUM(G15) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'I86' AS EXP_TYPE, SUM(I86) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J07' AS EXP_TYPE, SUM(J07) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J08' AS EXP_TYPE, SUM(J08) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J09' AS EXP_TYPE, SUM(J09) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J10' AS EXP_TYPE, SUM(J10) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J11' AS EXP_TYPE, SUM(J11) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J12' AS EXP_TYPE, SUM(J12) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J13' AS EXP_TYPE, SUM(J13) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J14' AS EXP_TYPE, SUM(J14) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J17' AS EXP_TYPE, SUM(J17) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J40' AS EXP_TYPE, SUM(J40) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J45' AS EXP_TYPE, SUM(J45) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J90' AS EXP_TYPE, SUM(J90) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J96' AS EXP_TYPE, SUM(J96) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J97' AS EXP_TYPE, SUM(J97) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J98' AS EXP_TYPE, SUM(J98) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'J99' AS EXP_TYPE, SUM(J99) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'K09' AS EXP_TYPE, SUM(K09) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'K10' AS EXP_TYPE, SUM(K10) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'K11' AS EXP_TYPE, SUM(K11) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'L12' AS EXP_TYPE, SUM(L12) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'M12' AS EXP_TYPE, SUM(M12) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'Q11' AS EXP_TYPE, SUM(Q11) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V10' AS EXP_TYPE, SUM(V10) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V11' AS EXP_TYPE, SUM(V11) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V12' AS EXP_TYPE, SUM(V12) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V13' AS EXP_TYPE, SUM(V13) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V14' AS EXP_TYPE, SUM(V14) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V15' AS EXP_TYPE, SUM(V15) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V16' AS EXP_TYPE, SUM(V16) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V17' AS EXP_TYPE, SUM(V17) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V18' AS EXP_TYPE, SUM(V18) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V21' AS EXP_TYPE, SUM(V21) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V22' AS EXP_TYPE, SUM(V22) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V23' AS EXP_TYPE, SUM(V23) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V24' AS EXP_TYPE, SUM(V24) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V29' AS EXP_TYPE, SUM(V29) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V30' AS EXP_TYPE, SUM(V30) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V32' AS EXP_TYPE, SUM(V32) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V37' AS EXP_TYPE, SUM(V37) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V38' AS EXP_TYPE, SUM(V38) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V40' AS EXP_TYPE, SUM(V40) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V45' AS EXP_TYPE, SUM(V45) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V60' AS EXP_TYPE, SUM(V60) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V65' AS EXP_TYPE, SUM(V65) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V70' AS EXP_TYPE, SUM(V70) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V75' AS EXP_TYPE, SUM(V75) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V80' AS EXP_TYPE, SUM(V80) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V85' AS EXP_TYPE, SUM(V85) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V90' AS EXP_TYPE, SUM(V90) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V91' AS EXP_TYPE, SUM(V91) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'V92' AS EXP_TYPE, SUM(V92) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'Z32' AS EXP_TYPE, SUM(Z32) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'Z33' AS EXP_TYPE, SUM(Z33) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2 UNION
SELECT IDCENSUS, YRDATA, CONCAT('20',YRDATA) AS YR, 'Z34' AS EXP_TYPE, SUM(Z34) AS EXP_AMOUNT FROM FCP_Dataset.full_dataset f GROUP BY 1,2
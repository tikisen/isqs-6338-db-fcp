-- TQ Senkungu
-- Sean McQuade
-- Biram Nicol
-- Jeremy Bixby
-- Group No 3 - D50 - ISQS 6338


-- DDL for creating the Finance Type Dimension
CREATE TABLE `DimFinanceType` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45),
  `fin_type` varchar(45),
  `subtype` varchar(45),
  `fin_desc` varchar(255),
  PRIMARY KEY (`ID`)
);

-- DML for dropping in the REVENUE finance types
 INSERT INTO
  D50_G03_OLAP.DimFinanceType (category, fin_type, subtype, fin_desc)
SELECT
  'REVENUE',
  src_name,
  rt_name,
  rt_desc
FROM
  (
    SELECT
      D50_G03_OLTP.rev_sources.src_name,
      D50_G03_OLTP.rev_types.rt_name,
      D50_G03_OLTP.rev_types.rt_desc
    FROM
      (
        D50_G03_OLTP.rev_sources
        inner join D50_G03_OLTP.rev_types on D50_G03_OLTP.rev_sources.rs_id = D50_G03_OLTP.rev_types.rt_id
      )
  ) as r;


 -- DML for dropping in the EXPENSE finance types
INSERT INTO
  D50_G03_OLAP.DimFinanceType (category, fin_type, subtype, fin_desc)
SELECT
  'EXPENSE',
  ec_desc,
  et_name,
  et_desc
FROM
  (
    SELECT
      D50_G03_OLTP.exp_categorys.ec_desc,
      D50_G03_OLTP.exp_types.et_name,
      D50_G03_OLTP.exp_types.et_desc
    FROM
      (
        D50_G03_OLTP.exp_categorys
        inner join D50_G03_OLTP.exp_types on D50_G03_OLTP.exp_categorys.ec_id = D50_G03_OLTP.exp_types.ec_id
      )
  ) as e;


  -- DML for dropping in the OTHER finance types
INSERT INTO
  D50_G03_OLAP.DimFinanceType (category, fin_type, subtype, fin_desc)
SELECT 'OTHER', 'SKIP LEVEL', of_name, of_desc
FROM
D50_G03_OLTP.other_financials;



-- DDL for creating the year dimension
CREATE TABLE `DimYear` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Year` varchar(4),
  PRIMARY KEY (`ID`)
);

-- DML for selecting and dropping in distinct years from the source OLTP DB
INSERT INTO
  DimYear(Year)
SELECT
  DISTINCT D50_G03_OLTP.revenue.year
FROM
  D50_G03_OLTP.revenue;


-- DDL for creating the DistrictInfo dimension
CREATE TABLE `DimDistrictInfo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ncesid` int,
  `idcensus` int,
  `dis_name` varchar(255),
  `csa` int,
  `cbsa` int,
  `CONUM` varchar(12),
  `state` varchar(20),
  `tg_name` varchar(100),
  `tg_desc` varchar(255),
  `mem_id` int,
  `mem_num` int,
  `sl_name` varchar(255),
  `sl_desc` varchar(255),
  `sl_id` int,
  PRIMARY KEY (`ID`)
);

-- DML for inserting data into the DistrictInfo Dimension
INSERT INTO
  DimDistrictInfo(
    ncesid,
    idcensus,
    dis_name,
    csa,
    cbsa,
    CONUM,
    state,
    tg_name,
    tg_desc,
    mem_id,
    mem_num,
    sl_name,
    sl_desc,
    sl_id
  )
SELECT
  ncesid,
  idcensus,
  dis_name,
  csa,
  cbsa,
  CONUM,
  state,
  tg_name,
  tg_desc,
  mem_id,
  mem_num,
  sl_name,
  sl_desc,
  sl_id
FROM
  (
    SELECT
      D50_G03_OLTP.districts.ncesid,
      D50_G03_OLTP.districts.idcensus,
      D50_G03_OLTP.districts.dis_name,
      D50_G03_OLTP.districts.csa,
      D50_G03_OLTP.districts.cbsa,
      D50_G03_OLTP.countys.conum,
      D50_G03_OLTP.countys.st_id,
      D50_G03_OLTP.type_gov.tg_name,
      D50_G03_OLTP.type_gov.tg_desc,
      D50_G03_OLTP.memberships.mem_id,
      D50_G03_OLTP.memberships.mem_num,
      D50_G03_OLTP.sch_levels.sl_name,
      D50_G03_OLTP.sch_levels.sl_desc,
      D50_G03_OLTP.sch_levels.sl_id
    FROM
      D50_G03_OLTP.districts
      inner join D50_G03_OLTP.type_gov on D50_G03_OLTP.districts.tg_id = D50_G03_OLTP.type_gov.tg_id
      inner join D50_G03_OLTP.memberships on D50_G03_OLTP.districts.mem_id = D50_G03_OLTP.memberships.mem_id
      inner join D50_G03_OLTP.countys on D50_G03_OLTP.districts.co_id = D50_G03_OLTP.countys.co_id
      inner join D50_03_OLTP.sch_levels on D50_G03_OLTP.districts.sl_id = D50_G03_OLTP.sch_levels.sl_id
  ) as d;



-- DDL for creating the district finance fact
CREATE TABLE `Fact_DistrictFinance` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Amount` decimal(15,2),
  `Year_ID` int,
  `District_ID` int,
  `Type_ID` int,
  PRIMARY KEY (`ID`),
  KEY `FK` (`Year_ID`, `District_ID`, `Type_ID`)
);

-- first lets get all the revenue data together in one spot as a derived table
select
  *
from
  (
    SELECT
      D50_G03_OLTP.revenue.rev_amount as Amount,
      D50_G03_OLTP.revenue.year,
      revenue.rt_id,
      D50_G03_OLTP.revenue.ncesid,
      D50_G03_OLTP.rev_sources.src_desc,
      D50_G03_OLTP.rev_sources.src_name,
      D50_G03_OLTP.rev_types.rt_code,
      D50_G03_OLTP.rev_types.rt_name,
      D50_G03_OLTP.rev_types.rt_desc
    FROM
      D50_G03_OLTP.revenue
      inner join D50_G03_OLTP.rev_types on D50_G03_OLTP.revenue.rt_id = D50_G03_OLTP.rev_types.rt_id
      inner join D50_G03_OLTP.rev_sources on D50_G03_OLTP.rev_types.rs_id = D50_G03_OLTP.rev_sources.rs_id
  ) as revenue;

-- getting all the expenses together in one derived table
select
  *
from
  (
    SELECT
      D50_G03_OLTP.expenditure.exp_amount as Amount,
      D50_G03_OLTP.expenditure.year,
      D50_G03_OLTP.expenditure.et_id,
      D50_G03_OLTP.expenditure.ncesid,
      D50_G03_OLTP.expenditure.exp_id,
      D50_G03_OLTP.exp_categorys.ec_code,
      D50_G03_OLTP.exp_categorys.ec_desc,
      D50_G03_OLTP.exp_categorys.ec_name,
      D50_G03_OLTP.exp_types.et_name,
      D50_G03_OLTP.exp_types.et_desc
    FROM
      D50_G03_OLTP.expenditure
      inner join D50_G03_OLTP.exp_types on D50_G03_OLTP.expenditure.et_id = D50_G03_OLTP.exp_types.et_id
      inner join D50_G03_OLTP.exp_categorys on D50_G03_OLTP.exp_types.ec_id = D50_G03_OLTP.exp_categorys.ec_id
  ) as expenses;


-- getting all the other financials in one derived table
select
  *
from
  (
    SELECT
      D50_G03_OLTP.other_financials.of_code,
      D50_G03_OLTP.other_financials.of_desc,
      D50_G03_OLTP.other_financials.of_id,
      D50_G03_OLTP.other_financials.of_name,
      D50_G03_OLTP.district_financials.df_amount as Amount,
      D50_G03_OLTP.district_financials.year,
      D50_G03_OLTP.district_financials.ncesid
    FROM
      D50_G03_OLTP.other_financials
      inner join D50_G03_OLTP.district_financials on D50_G03_OLTP.other_financials.of_id = D50_G03_OLTP.district_financials.of_id
  ) as otherfinance;


-- DML for inserting  the district revenues
INSERT INTO
  Fact_DistrictFinance(Amount, Year_ID, District_ID, Type_ID)
SELECT
  Amount,
  Year_ID,
  District_ID,
  Type_ID
FROM
  (
    SELECT
      revenue.Amount,
      D50_G03_OLAP.DimYear.ID,
      D50_G03_OLAP.DimDistrictInfo.ID,
      D50_G03_OLAP.DimFinanceType.ID
    FROM
      revenue
      inner join D50_G03_OLAP.DimYear on revenue.year = D50_G03_OLAP.DimYear.Year
      inner join D50_G03_OLAP.DimFinanceType on D50_G03_OLAP.DimFinanceType.fin_desc = revenue.rt_desc
      inner join D50_G03_OLAP.DimDistrictInfo on D50_G03_OLAP.DimDistrictInfo.ncesid = revenue.ncesid
  ) as r;


-- DML for inserting  the district expenses
INSERT INTO
  Fact_DistrictFinance(Amount, Year_ID, District_ID, Type_ID)
SELECT
  Amount,
  Year_ID,
  District_ID,
  Type_ID
FROM
  (
    SELECT
      expenses.Amount,
      D50_G03_OLAP.DimYear.ID,
      D50_G03_OLAP.DimDistrictInfo.ID,
      D50_G03_OLAP.DimFinanceType.ID
    FROM
      expenses
      inner join D50_G03_OLAP.DimYear on expenses.year = D50_G03_OLAP.DimYear.Year
      inner join D50_G03_OLAP.DimFinanceType on D50_G03_OLAP.DimFinanceType.fin_desc = expenses.exp_desc
      inner join D50_G03_OLAP.DimDistrictInfo on D50_G03_OLAP.DimDistrictInfo.ncesid = revenue.ncesid
  ) as e;


-- DML for inserting  the other financials
INSERT INTO
  Fact_DistrictFinance(Amount, Year_ID, District_ID, Type_ID)
SELECT
  Amount,
  Year_ID,
  District_ID,
  Type_ID
FROM
  (
    SELECT
      otherfinance.Amount,
      D50_G03_OLAP.DimYear.ID,
      D50_G03_OLAP.DimDistrictInfo.ID,
      D50_G03_OLAP.DimFinanceType.ID
    FROM
      otherfinance
      inner join D50_G03_OLAP.DimYear on expenses.year = D50_G03_OLAP.DimYear.Year
      inner join D50_G03_OLAP.DimFinanceType on D50_G03_OLAP.DimFinanceType.fin_desc = otherfinance.of_desc
      inner join D50_G03_OLAP.DimDistrictInfo on D50_G03_OLAP.DimDistrictInfo.ncesid = revenue.ncesid
  ) as o;

-- TQ Senkungu
-- Sean McQuade
-- Biram Nicol
-- Jeremy Bixby
-- Group No 3 - D50 - ISQS 6338

CREATE TABLE `transactionFacts` (
  `TransactionKey` int,
  `transaction_amt` decimal(15,2),
  `year` varchar(4),
  `TransactionSubcategoryKey` int,
  PRIMARY KEY (`TransactionKey`),
  KEY `FK` (`TransactionSubcategoryKey`)
);
CREATE TABLE `DimTransactionSubCategory` (
  `TransactionSubCategoryKey` int,
  `TransactionSubCategoryName` varchar(255),
  `TransactionCategoryKey` int,
  PRIMARY KEY (`TransactionSubCategoryKey`),
  KEY `FK` (`TransactionCategoryKey`)
);
CREATE TABLE `DimTransactionCategory` (
  `TransactionCategoryKey` int,
  `TransactionCategoryName` varchar(255),
  PRIMARY KEY (`TransactionCategoryKey`)
);
CREATE TABLE `DimSchoolDistrict` (
  `ncesid` int,
  `SchoolDistrictName` varchar(255),
  `SchoolLevel` int,
  `GeographyKey` int,
  `CONUM` varchar(10),
  `csa` varchar(10),
  `cbsa` varchar(10),
  `idcensus` int,
  `GovtType` int,
  PRIMARY KEY (`ncesid`),
  KEY `FK` (`GeographyKey`)
);
CREATE TABLE `DimGeography` (
  `GeographyKey` int,
  `County` int,
  `StateName` varchar(50),
  `StateCode` int,
  `usps_code` int,
  `CONUM` int,
  PRIMARY KEY (`GeographyKey`)
);

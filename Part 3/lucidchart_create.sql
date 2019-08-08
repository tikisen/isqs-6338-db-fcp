CREATE TABLE `transactionFacts` (
  `TransactionKey` <type>,
  `transaction_amt` <type>,
  `year` <type>,
  `TransactionSubcategoryKey` <type>,
  PRIMARY KEY (`TransactionKey`),
  KEY `Key` (`TransactionSubcategoryKey`)
);

CREATE TABLE `DimTransactionSubCategory` (
  `TransactionSubCategoryKey` <type>,
  `TransactionSubCategoryName` <type>,
  `TransactionCategoryKey` <type>,
  PRIMARY KEY (`TransactionSubCategoryKey`),
  KEY `FK` (`TransactionCategoryKey`)
);

CREATE TABLE `DimTransactionCategory` (
  `TransactionCategoryKey` <type>,
  `TransactionCategoryName` <type>,
  PRIMARY KEY (`TransactionCategoryKey`)
);

CREATE TABLE `DimSchoolDistrict` (
  `ncesid` <type>,
  `SchoolDistrictName` <type>,
  `SchoolLevel` <type>,
  `GeographyKey` <type>,
  `CONUM` <type>,
  `csa` <type>,
  `cbsa` <type>,
  `idcensus` <type>,
  `GovtType` <type>,
  PRIMARY KEY (`ncesid`),
  KEY `FK` (`GeographyKey`)
);

CREATE TABLE `DimGeography` (
  `GeographyKey` <type>,
  `County` <type>,
  `StateName` <type>,
  `StateCode` <type>,
  `usps_code` <type>,
  `CONUM` <type>,
  PRIMARY KEY (`GeographyKey`)
);



/*-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
*/
-- -----------------------------------------------------
-- Schema goodbusi_isqs_6338
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema goodbusi_isqs_6338
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goodbusi_isqs_6338` DEFAULT CHARACTER SET utf8 ;
USE `goodbusi_isqs_6338` ;

-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`rev_sources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`rev_sources` (
  `rs_id` INT NOT NULL,
  `src_name` VARCHAR(45) NULL,
  `src_desc` VARCHAR(255) NULL,
  PRIMARY KEY (`rs_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`other_financials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`other_financials` (
  `of_id` INT NOT NULL,
  `of_name` VARCHAR(45) NULL,
  `of_desc` VARCHAR(255) NULL,
  `of_code` VARCHAR(45) NULL,
  PRIMARY KEY (`of_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`csa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`csa` (
  `csa` INT NOT NULL,
  `csa_desc` VARCHAR(255) NULL,
  PRIMARY KEY (`csa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`cbsa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`cbsa` (
  `cbsa` INT NOT NULL,
  `cbsa_desc` VARCHAR(255) NULL,
  PRIMARY KEY (`cbsa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`sch_levels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`sch_levels` (
  `sl_id` INT NOT NULL,
  `sl_name` VARCHAR(45) NULL,
  `sl_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`sl_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`type_gov`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`type_gov` (
  `tg_id` INT NOT NULL,
  `tg_name` VARCHAR(45) NULL,
  `tg_desc` VARCHAR(100) NULL,
  PRIMARY KEY (`tg_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`states` (
  `st_id` INT NOT NULL,
  `st_name` VARCHAR(20) NULL,
  `usps_code` VARCHAR(10) NULL,
  PRIMARY KEY (`st_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`countys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`countys` (
  `co_id` INT NOT NULL,
  `conum` INT NULL,
  `co_name` VARCHAR(45) NULL,
  `st_id` INT NULL,
  PRIMARY KEY (`co_id`),
  INDEX `fk_countys_states1_idx` (`st_id` ASC) /*VISIBLE*/,
  CONSTRAINT `fk_countys_states1`
    FOREIGN KEY (`st_id`)
    REFERENCES `goodbusi_isqs_6338`.`states` (`st_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`districts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`districts` (
  `ncesid` INT NOT NULL,
  `idcensus` VARCHAR(45) NULL,
  `dis_name` VARCHAR(255) NULL,
  `csa` INT NULL,
  `cbsa` INT NULL,
  `co_id` INT NULL,
  `sl_id` INT NOT NULL,
  `tg_id` INT NULL,
  PRIMARY KEY (`ncesid`),
  INDEX `fk_districts_csa1_idx` (`csa` ASC) /*VISIBLE*/,
  INDEX `fk_districts_cbsa1_idx` (`cbsa` ASC) /*VISIBLE*/,
  INDEX `fk_districts_sch_levels1_idx` (`sl_id` ASC) /*VISIBLE*/,
  INDEX `fk_districts_type_gov1_idx` (`tg_id` ASC) /*VISIBLE*/,
  INDEX `fk_districts_countys1_idx` (`co_id` ASC) /*VISIBLE*/,
  CONSTRAINT `fk_districts_csa1`
    FOREIGN KEY (`csa`)
    REFERENCES `goodbusi_isqs_6338`.`csa` (`csa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_districts_cbsa1`
    FOREIGN KEY (`cbsa`)
    REFERENCES `goodbusi_isqs_6338`.`cbsa` (`cbsa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_districts_sch_levels1`
    FOREIGN KEY (`sl_id`)
    REFERENCES `goodbusi_isqs_6338`.`sch_levels` (`sl_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_districts_type_gov1`
    FOREIGN KEY (`tg_id`)
    REFERENCES `goodbusi_isqs_6338`.`type_gov` (`tg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_districts_countys1`
    FOREIGN KEY (`co_id`)
    REFERENCES `goodbusi_isqs_6338`.`countys` (`co_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`district_financials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`district_financials` (
  `df_id` INT NOT NULL,
  `of_id` INT NULL,
  `ncesid` INT NOT NULL,
  `df_amount` DECIMAL(15,2) NULL,
  `year` VARCHAR(4) NULL,
  PRIMARY KEY (`df_id`),
  INDEX `fk_district_financials_other_financials1_idx` (`of_id` ASC) /*VISIBLE*/,
  INDEX `fk_district_financials_districts1_idx` (`ncesid` ASC) /*VISIBLE*/,
  CONSTRAINT `fk_district_financials_other_financials1`
    FOREIGN KEY (`of_id`)
    REFERENCES `goodbusi_isqs_6338`.`other_financials` (`of_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_district_financials_districts1`
    FOREIGN KEY (`ncesid`)
    REFERENCES `goodbusi_isqs_6338`.`districts` (`ncesid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`exp_categorys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`exp_categorys` (
  `ec_id` INT NOT NULL,
  `ec_name` VARCHAR(45) NULL,
  `ec_desc` VARCHAR(45) NULL,
  `ec_code` VARCHAR(45) NULL,
  `parent_ec_id` INT NULL,
  PRIMARY KEY (`ec_id`),
  INDEX `fk_exp_categorys_exp_categorys1_idx` (`parent_ec_id` ASC) /*VISIBLE*/,
  CONSTRAINT `fk_exp_categorys_exp_categorys1`
    FOREIGN KEY (`parent_ec_id`)
    REFERENCES `goodbusi_isqs_6338`.`exp_categorys` (`ec_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`rev_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`rev_types` (
  `rt_id` INT NOT NULL,
  `rt_name` VARCHAR(45) NULL,
  `rt_desc` VARCHAR(45) NULL,
  `rt_code` VARCHAR(45) NULL,
  `rs_id` INT NOT NULL,
  PRIMARY KEY (`rt_id`),
  INDEX `fk_rev_types_rev_sources_idx` (`rs_id` ASC) /*VISIBLE*/,
  CONSTRAINT `fk_rev_types_rev_sources`
    FOREIGN KEY (`rs_id`)
    REFERENCES `goodbusi_isqs_6338`.`rev_sources` (`rs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`revenue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`revenue` (
  `rev_id` INT NOT NULL,
  `rt_id` INT NULL,
  `ncesid` INT NULL,
  `rev_amount` DECIMAL(15,2) NULL,
  `year` VARCHAR(4) NULL,
  PRIMARY KEY (`rev_id`),
  INDEX `fk_revenue_rev_types1_idx` (`rt_id` ASC) /*VISIBLE*/,
  INDEX `fk_revenue_districts1_idx` (`ncesid` ASC) /*VISIBLE*/,
  CONSTRAINT `fk_revenue_rev_types1`
    FOREIGN KEY (`rt_id`)
    REFERENCES `goodbusi_isqs_6338`.`rev_types` (`rt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_revenue_districts1`
    FOREIGN KEY (`ncesid`)
    REFERENCES `goodbusi_isqs_6338`.`districts` (`ncesid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`exp_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`exp_types` (
  `et_id` INT NOT NULL,
  `et_name` VARCHAR(45) NULL,
  `et_desc` VARCHAR(255) NULL,
  `et_code` VARCHAR(45) NULL,
  `ec_id` INT NOT NULL,
  PRIMARY KEY (`et_id`),
  INDEX `fk_exp_types_exp_categorys1_idx` (`ec_id` ASC) /*VISIBLE*/,
  CONSTRAINT `fk_exp_types_exp_categorys1`
    FOREIGN KEY (`ec_id`)
    REFERENCES `goodbusi_isqs_6338`.`exp_categorys` (`ec_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`expenditure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`expenditure` (
  `exp_id` INT NOT NULL,
  `ncesid` INT NULL,
  `et_id` INT NULL,
  `exp_amount` DECIMAL(15,2) NULL,
  `year` VARCHAR(4) NULL,
  PRIMARY KEY (`exp_id`),
  INDEX `fk_expenditure_districts1_idx` (`ncesid` ASC) /*VISIBLE*/,
  INDEX `fk_expenditure_exp_types1_idx` (`et_id` ASC) /*VISIBLE*/,
  CONSTRAINT `fk_expenditure_districts1`
    FOREIGN KEY (`ncesid`)
    REFERENCES `goodbusi_isqs_6338`.`districts` (`ncesid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_expenditure_exp_types1`
    FOREIGN KEY (`et_id`)
    REFERENCES `goodbusi_isqs_6338`.`exp_types` (`et_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goodbusi_isqs_6338`.`memberships`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goodbusi_isqs_6338`.`memberships` (
  `mem_id` INT NOT NULL,
  `mem_num` INT NULL,
  `year` VARCHAR(4) NULL,
  `ncesid` INT NULL,
  PRIMARY KEY (`mem_id`),
  INDEX `fk_memberships_districts1_idx` (`ncesid` ASC) /*VISIBLE*/,
  CONSTRAINT `fk_memberships_districts1`
    FOREIGN KEY (`ncesid`)
    REFERENCES `goodbusi_isqs_6338`.`districts` (`ncesid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


/*SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
*/
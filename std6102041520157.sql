-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema std6102041520157
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema std6102041520157
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `std6102041520157` DEFAULT CHARACTER SET utf8 ;
USE `std6102041520157` ;

-- -----------------------------------------------------
-- Table `std6102041520157`.`branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `std6102041520157`.`branch` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `branch_no` VARCHAR(5) NOT NULL,
  `street` VARCHAR(150) NOT NULL,
  `city` VARCHAR(150) NOT NULL,
  `postcode` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `std6102041520157`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `std6102041520157`.`client` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_no` VARCHAR(5) NULL DEFAULT NULL,
  `f_name` VARCHAR(100) NULL DEFAULT NULL,
  `l_name` VARCHAR(100) NULL DEFAULT NULL,
  `tel_no` VARCHAR(11) NULL DEFAULT NULL,
  `pref_type` VARCHAR(50) NULL DEFAULT NULL,
  `max_rent` FLOAT(7,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `std6102041520157`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `std6102041520157`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(128) NOT NULL,
  `email` VARCHAR(160) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `create_ad` DATETIME NULL DEFAULT NULL,
  `update_at` TIMESTAMP NULL DEFAULT NULL,
  `is_active` ENUM('Active', 'Inactive') NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `table1col_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `std6102041520157`.`private_owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `std6102041520157`.`private_owner` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `owner_no` VARCHAR(5) NOT NULL,
  `first_name` VARCHAR(300) NOT NULL,
  `last_name` VARCHAR(300) NOT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `telephone` INT(11) NULL DEFAULT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `std6102041520157`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `std6102041520157`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `std6102041520157`.`staff` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `staff_no` VARCHAR(5) NULL DEFAULT NULL,
  `f_name` VARCHAR(100) NULL DEFAULT NULL,
  `l_name` VARCHAR(100) NULL DEFAULT NULL,
  `position` VARCHAR(50) NULL DEFAULT NULL,
  `sex` VARCHAR(2) NULL DEFAULT NULL,
  `d_o_b` DATE NULL DEFAULT NULL,
  `salary` FLOAT(7,2) NULL DEFAULT NULL,
  `branch_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `branch_id` (`branch_id` ASC) VISIBLE,
  CONSTRAINT `staff_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `std6102041520157`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staff_ibfk_2`
    FOREIGN KEY (`branch_id`)
    REFERENCES `std6102041520157`.`branch` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `std6102041520157`.`property_for_rent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `std6102041520157`.`property_for_rent` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `property_no` VARCHAR(5) NULL DEFAULT NULL,
  `street` TEXT NULL DEFAULT NULL,
  `city` TEXT NULL DEFAULT NULL,
  `postcode` VARCHAR(10) NULL DEFAULT NULL,
  `type` VARCHAR(50) NULL DEFAULT NULL,
  `rooms` INT(5) NULL DEFAULT NULL,
  `rent` FLOAT(7,2) NULL DEFAULT NULL,
  `private_owner_id` INT(11) NULL DEFAULT NULL,
  `staff_id` INT(11) NULL DEFAULT NULL,
  `branch_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `branch_id` (`branch_id` ASC) VISIBLE,
  INDEX `private_owner_id` (`private_owner_id` ASC) VISIBLE,
  INDEX `staff_id` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `property_for_rent_ibfk_1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `std6102041520157`.`branch` (`id`),
  CONSTRAINT `property_for_rent_ibfk_2`
    FOREIGN KEY (`private_owner_id`)
    REFERENCES `std6102041520157`.`private_owner` (`id`),
  CONSTRAINT `property_for_rent_ibfk_3`
    FOREIGN KEY (`staff_id`)
    REFERENCES `std6102041520157`.`staff` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `std6102041520157`.`registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `std6102041520157`.`registration` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_id` INT(11) NULL DEFAULT NULL,
  `branch_id` INT(11) NULL DEFAULT NULL,
  `staff_id` INT(11) NULL DEFAULT NULL,
  `dateJoined` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id` (`client_id` ASC) VISIBLE,
  INDEX `branch_id` (`branch_id` ASC) VISIBLE,
  INDEX `staff_id` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `registration_ibfk_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `std6102041520157`.`client` (`id`),
  CONSTRAINT `registration_ibfk_2`
    FOREIGN KEY (`branch_id`)
    REFERENCES `std6102041520157`.`branch` (`id`),
  CONSTRAINT `registration_ibfk_3`
    FOREIGN KEY (`staff_id`)
    REFERENCES `std6102041520157`.`staff` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `std6102041520157`.`viewing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `std6102041520157`.`viewing` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_id` INT(11) NULL DEFAULT NULL,
  `property_for_rent_id` INT(11) NULL DEFAULT NULL,
  `view_date` DATE NULL DEFAULT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id` (`client_id` ASC) VISIBLE,
  INDEX `property_for_rent_id` (`property_for_rent_id` ASC) VISIBLE,
  CONSTRAINT `viewing_ibfk_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `std6102041520157`.`client` (`id`),
  CONSTRAINT `viewing_ibfk_2`
    FOREIGN KEY (`property_for_rent_id`)
    REFERENCES `std6102041520157`.`property_for_rent` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

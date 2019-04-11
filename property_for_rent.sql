DROP TABLE IF EXISTS `property_for_rent`;

CREATE TABLE IF NOT EXISTS `std6102041520165`.`property_for_rent` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `property_no` VARCHAR(5) NULL DEFAULT NULL,
  `type` VARCHAR(50) NULL DEFAULT NULL,
  `rooms` INT(5) NULL DEFAULT NULL,
  `rent` FLOAT(7,2) NULL DEFAULT NULL,
  `private_owner_id` INT(11) NULL DEFAULT NULL,
  `staff_id` INT(11) NULL DEFAULT NULL,
  `branch_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `branch_id` (`branch_id` ASC),
  INDEX `private_owner_id` (`private_owner_id` ASC),
  INDEX `staff_id` (`staff_id` ASC),
  CONSTRAINT `fk_pfr_private_owner_id`
    FOREIGN KEY (`private_owner_id`)
    REFERENCES `std6102041520165`.`private_owner` (`id`),
  CONSTRAINT `fk_pfr_staff_id`
    FOREIGN KEY (`staff_id`)
    REFERENCES `std6102041520165`.`staff` (`id`),
  CONSTRAINT `fk_pfr_branch_id`
    FOREIGN KEY (`branch_id`)
    REFERENCES `std6102041520165`.`branch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
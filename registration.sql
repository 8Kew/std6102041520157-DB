DROP TABLE IF EXISTS registration;

CREATE TABLE IF NOT EXISTS `std6102041520165`.`registration` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_id` INT(11) NULL DEFAULT NULL,
  `property_for_rent_id` INT NULL,
  `dateJoined` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id_idx` (`client_id` ASC),
  INDEX `property_for_rent_id_idx` (`property_for_rent_id` ASC),
  CONSTRAINT `fk_client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `std6102041520165`.`client` (`id`),
  CONSTRAINT `fk_property_for_rent_id`
    FOREIGN KEY (`property_for_rent_id`)
    REFERENCES `std6102041520165`.`property_for_rent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
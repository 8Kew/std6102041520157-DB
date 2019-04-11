DROP TABLE IF EXISTS `viewing`;

CREATE TABLE IF NOT EXISTS `std6102041520165`.`viewing` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_id` INT(11) NULL DEFAULT NULL,
  `property_for_rent_id` INT(11) NULL DEFAULT NULL,
  `view_date` DATE NULL DEFAULT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id_idx` (`client_id` ASC),
  INDEX `property_for_rent_id_idx` (`property_for_rent_id` ASC),
  CONSTRAINT `fk_viewing_client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `std6102041520165`.`client` (`id`),
  CONSTRAINT `fk_viewing_property_for_rent_id`
    FOREIGN KEY (`property_for_rent_id`)
    REFERENCES `std6102041520165`.`property_for_rent` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
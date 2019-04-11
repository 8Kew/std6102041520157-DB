DROP TABLE IF EXISTS `private_owner`;

CREATE TABLE IF NOT EXISTS `std6102041520165`.`private_owner` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `owner_no` VARCHAR(5) NOT NULL,
  `first_name` VARCHAR(300) NOT NULL,
  `last_name` VARCHAR(300) NOT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `telephone` INT(11) NULL DEFAULT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `std6102041520165`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
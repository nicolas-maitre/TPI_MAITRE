-- MySQL Script generated by MySQL Workbench
-- Wed May 15 11:18:54 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema messaging_web_app_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `messaging_web_app_db` ;

-- -----------------------------------------------------
-- Schema messaging_web_app_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `messaging_web_app_db` DEFAULT CHARACTER SET utf8 ;
USE `messaging_web_app_db` ;

-- -----------------------------------------------------
-- Table `messaging_web_app_db`.`files`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `messaging_web_app_db`.`files` (
  `id` VARCHAR(36) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `subtype` VARCHAR(45) NOT NULL,
  `extension` VARCHAR(5) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `owner` VARCHAR(36) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_files_users1`
    FOREIGN KEY (`owner`)
    REFERENCES `messaging_web_app_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `messaging_web_app_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `messaging_web_app_db`.`users` (
  `id` VARCHAR(36) NOT NULL,
  `image` VARCHAR(36) NULL,
  `email` VARCHAR(254) NOT NULL,
  `first_name` VARCHAR(200) NULL,
  `pseudo` VARCHAR(200) NULL,
  `last_name` VARCHAR(200) NULL,
  `creation_time` TIMESTAMP NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_users_files1`
    FOREIGN KEY (`image`)
    REFERENCES `messaging_web_app_db`.`files` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `messaging_web_app_db`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `messaging_web_app_db`.`groups` (
  `id` VARCHAR(36) NOT NULL,
  `image` VARCHAR(36) NULL,
  `creation_time` TIMESTAMP NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `type` VARCHAR(10) NOT NULL,
  `administrator` VARCHAR(36) NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_groups_files1`
    FOREIGN KEY (`image`)
    REFERENCES `messaging_web_app_db`.`files` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_groups_users1`
    FOREIGN KEY (`administrator`)
    REFERENCES `messaging_web_app_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `messaging_web_app_db`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `messaging_web_app_db`.`messages` (
  `id` VARCHAR(36) NOT NULL,
  `group` VARCHAR(36) NOT NULL,
  `owner` VARCHAR(36) NOT NULL,
  `file` VARCHAR(36) NULL,
  `text` LONGTEXT NULL,
  `creation_time` TIMESTAMP NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  `state` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_messages_groups`
    FOREIGN KEY (`group`)
    REFERENCES `messaging_web_app_db`.`groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`owner`)
    REFERENCES `messaging_web_app_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_files1`
    FOREIGN KEY (`file`)
    REFERENCES `messaging_web_app_db`.`files` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `messaging_web_app_db`.`user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `messaging_web_app_db`.`user_groups` (
  `user` VARCHAR(36) NOT NULL,
  `group` VARCHAR(36) NOT NULL,
  `creation_time` TIMESTAMP NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`user`, `group`),
  CONSTRAINT `fk_users_has_groups_users1`
    FOREIGN KEY (`user`)
    REFERENCES `messaging_web_app_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_groups_groups1`
    FOREIGN KEY (`group`)
    REFERENCES `messaging_web_app_db`.`groups` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `messaging_web_app_db`.`tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `messaging_web_app_db`.`tokens` (
  `id` VARCHAR(36) NOT NULL,
  `value` VARCHAR(36) NOT NULL,
  `type` VARCHAR(10) NOT NULL,
  `expiration_time` TIMESTAMP NOT NULL,
  `user` VARCHAR(36) NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tokens_users1`
    FOREIGN KEY (`user`)
    REFERENCES `messaging_web_app_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
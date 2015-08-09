
CREATE SCHEMA IF NOT EXISTS `teora_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `teora_db` ;

-- -----------------------------------------------------
-- Table `teora_db`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teora_db`.`subjects` (
  `subject_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` INT NOT NULL COMMENT '',
  `active` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '',
  `creation_date` DATETIME NOT NULL COMMENT '',
  `created_by` INT NOT NULL COMMENT '',
  `modification_date` DATETIME NULL COMMENT '',
  `modified_by` INT NULL COMMENT '',
  `removal_date` DATETIME NULL COMMENT '',
  `removed_by` INT NULL COMMENT '',
  PRIMARY KEY (`subject_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teora_db`.`user_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teora_db`.`user_types` (
  `user_type_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(20) NOT NULL COMMENT '',
  `active` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '',
  `creation_date` DATETIME NOT NULL COMMENT '',
  `created_by` INT NOT NULL COMMENT '',
  `modification_date` DATETIME NULL COMMENT '',
  `modified_by` INT NULL COMMENT '',
  `removal_date` DATETIME NULL COMMENT '',
  `removed_by` INT NULL COMMENT '',
  PRIMARY KEY (`user_type_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teora_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teora_db`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `user_type_id` INT NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `email` VARCHAR(90) NOT NULL COMMENT '',
  `password` VARCHAR(45) NOT NULL COMMENT '',
  `active` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '',
  `created_by` INT NOT NULL COMMENT '',
  `creation_date` DATETIME NOT NULL COMMENT '',
  `modification_date` DATETIME NULL COMMENT '',
  `modified_by` INT NULL COMMENT '',
  `removal_date` DATETIME NULL COMMENT '',
  `removed_by` INT NULL COMMENT '',
  PRIMARY KEY (`user_id`)  COMMENT '',
  INDEX `fk_users_user_types1_idx` (`user_type_id` ASC)  COMMENT '',
  CONSTRAINT `fk_users_user_types1`
    FOREIGN KEY (`user_type_id`)
    REFERENCES `teora_db`.`user_types` (`user_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teora_db`.`question_sources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teora_db`.`question_sources` (
  `question_source_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `active` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '',
  `creation_date` DATETIME NOT NULL COMMENT '',
  `created_by` INT NOT NULL COMMENT '',
  `modification_date` DATETIME NULL COMMENT '',
  `modified_by` INT NULL COMMENT '',
  `removal_date` DATETIME NULL COMMENT '',
  `removed_by` INT NULL COMMENT '',
  PRIMARY KEY (`question_source_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teora_db`.`question_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teora_db`.`question_types` (
  `question_type_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(20) NOT NULL COMMENT '',
  `active` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '',
  `creation_date` DATETIME NOT NULL COMMENT '',
  `created_by` INT NOT NULL COMMENT '',
  `modification_date` DATETIME NULL COMMENT '',
  `modified_by` INT NULL COMMENT '',
  `removal_date` DATETIME NULL COMMENT '',
  `removed_by` INT NULL COMMENT '',
  PRIMARY KEY (`question_type_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teora_db`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teora_db`.`questions` (
  `question_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `question_type_id` INT NOT NULL COMMENT '',
  `subject_id` INT NOT NULL COMMENT '',
  `user_id` INT NOT NULL COMMENT '',
  `question_source_id` INT NOT NULL COMMENT '',
  `question_title` VARCHAR(45) NOT NULL COMMENT '',
  `active` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '',
  `creation_date` DATETIME NOT NULL COMMENT '',
  `created_by` INT NOT NULL COMMENT '',
  `modification_date` DATETIME NULL COMMENT '',
  `modified_by` INT NULL COMMENT '',
  `removal_date` DATETIME NULL COMMENT '',
  `removed_by` INT NULL COMMENT '',
  PRIMARY KEY (`question_id`)  COMMENT '',
  INDEX `fk_questions_subjects1_idx` (`subject_id` ASC)  COMMENT '',
  INDEX `fk_questions_users1_idx` (`user_id` ASC)  COMMENT '',
  INDEX `fk_questions_question_sources1_idx` (`question_source_id` ASC)  COMMENT '',
  INDEX `fk_questions_question_types1_idx` (`question_type_id` ASC)  COMMENT '',
  CONSTRAINT `fk_questions_subjects1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `teora_db`.`subjects` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_questions_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `teora_db`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_questions_question_sources1`
    FOREIGN KEY (`question_source_id`)
    REFERENCES `teora_db`.`question_sources` (`question_source_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_questions_question_types1`
    FOREIGN KEY (`question_type_id`)
    REFERENCES `teora_db`.`question_types` (`question_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teora_db`.`question_options`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teora_db`.`question_options` (
  `question_option_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `question_id` INT NOT NULL COMMENT '',
  `user_id` INT NOT NULL COMMENT '',
  `question_title` VARCHAR(45) NOT NULL COMMENT '',
  `active` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '',
  `creation_date` DATETIME NOT NULL COMMENT '',
  `created_by` INT NOT NULL COMMENT '',
  `modification_date` DATETIME NULL COMMENT '',
  `modified_by` INT NULL COMMENT '',
  `removal_date` DATETIME NULL COMMENT '',
  `removed_by` INT NULL COMMENT '',
  PRIMARY KEY (`question_option_id`)  COMMENT '',
  INDEX `fk_question_options_questions1_idx` (`question_id` ASC)  COMMENT '',
  INDEX `fk_question_options_users1_idx` (`user_id` ASC)  COMMENT '',
  CONSTRAINT `fk_question_options_questions1`
    FOREIGN KEY (`question_id`)
    REFERENCES `teora_db`.`questions` (`question_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_options_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `teora_db`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teora_db`.`question_results`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teora_db`.`question_results` (
  `question_result_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `question_option_id` INT NOT NULL COMMENT '',
  `user_id` INT NOT NULL COMMENT '',
  `is_correct` TINYINT(4) NOT NULL COMMENT '',
  `active` TINYINT(4) NOT NULL DEFAULT 1 COMMENT '',
  `creation_date` DATETIME NOT NULL COMMENT '',
  `created_by` INT NOT NULL COMMENT '',
  `modification_date` DATETIME NULL COMMENT '',
  `modified_by` INT NULL COMMENT '',
  `removal_date` DATETIME NULL COMMENT '',
  `removed_by` INT NULL COMMENT '',
  PRIMARY KEY (`question_result_id`)  COMMENT '',
  INDEX `fk_question_results_question_options1_idx` (`question_option_id` ASC)  COMMENT '',
  INDEX `fk_question_results_users1_idx` (`user_id` ASC)  COMMENT '',
  CONSTRAINT `fk_question_results_question_options1`
    FOREIGN KEY (`question_option_id`)
    REFERENCES `teora_db`.`question_options` (`question_option_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_results_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `teora_db`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

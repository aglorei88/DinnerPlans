-- MySQL Script generated by MySQL Workbench
<<<<<<< HEAD
-- Mon Mar 23 18:38:21 2015
=======
-- Mon Mar 23 13:17:48 2015
>>>>>>> 462b774f2e332a25171903d712fa49b1737b7191
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema DinnerPlans
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DinnerPlans
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DinnerPlans` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `DinnerPlans` ;

-- -----------------------------------------------------
-- Table `DinnerPlans`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image` VARCHAR(145) NULL,
  `file_path` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
<<<<<<< HEAD
  `level` INT NOT NULL DEFAULT 4,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `image_id` INT NULL DEFAULT NULL,
=======
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `is_chef` INT NOT NULL DEFAULT 0,
  `password` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `last_login` DATETIME NULL,
  `login_ip` VARCHAR(45) NULL,
  `image_id` INT NOT NULL,
>>>>>>> 462b774f2e332a25171903d712fa49b1737b7191
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_users_images1_idx` (`image_id` ASC),
  CONSTRAINT `fk_users_images1`
    FOREIGN KEY (`image_id`)
    REFERENCES `DinnerPlans`.`images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NULL,
  `created_at` VARCHAR(45) NULL,
  `updated_at` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`meals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`meals` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `meal` VARCHAR(125) NULL,
  `description` TEXT NULL,
  `user_id` INT NOT NULL,
  `initial_price` FLOAT NULL,
<<<<<<< HEAD
  `current_price` FLOAT NULL,
  `duration` INT NULL,
  `category_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
=======
  `category_id` INT NOT NULL,
  `created_at` DATETIME NULL,
>>>>>>> 462b774f2e332a25171903d712fa49b1737b7191
  `updated_at` DATETIME NULL,
  `ended_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_items_users_idx` (`user_id` ASC),
  INDEX `fk_items_categories1_idx` (`category_id` ASC),
  CONSTRAINT `fk_items_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `DinnerPlans`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `DinnerPlans`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`bids`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`bids` (
  `id` INT NOT NULL AUTO_INCREMENT,
<<<<<<< HEAD
  `bid` FLOAT NULL,
  `user_id` INT NOT NULL,
  `meal_id` INT NOT NULL,
=======
  `user_id` INT NOT NULL,
  `meal_id` INT NOT NULL,
  `value` FLOAT NULL,
>>>>>>> 462b774f2e332a25171903d712fa49b1737b7191
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bids_users1_idx` (`user_id` ASC),
  INDEX `fk_bids_items1_idx` (`meal_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_bids_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DinnerPlans`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bids_items1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `DinnerPlans`.`meals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`options`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`options` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `option` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`watchlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`watchlists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `meal_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `meal_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_watchlists_users1_idx` (`user_id` ASC),
  INDEX `fk_watchlists_meals1_idx` (`meal_id` ASC),
  CONSTRAINT `fk_watchlists_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DinnerPlans`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_watchlists_meals1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `DinnerPlans`.`meals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`ingredients` (
  `id` INT NOT NULL,
  `ingredient` VARCHAR(45) NULL,
  `created_at` VARCHAR(45) NULL,
  `updated_at` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`meal_has_ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`meal_has_ingredients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `meal_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  PRIMARY KEY (`id`, `meal_id`, `ingredient_id`),
  INDEX `fk_meals_has_ingredients_ingredients1_idx` (`ingredient_id` ASC),
  INDEX `fk_meals_has_ingredients_meals1_idx` (`meal_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_meals_has_ingredients_meals1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `DinnerPlans`.`meals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meals_has_ingredients_ingredients1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `DinnerPlans`.`ingredients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`user_has_allergens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`user_has_allergens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `ingredient_id`),
  INDEX `fk_users_has_ingredients_ingredients1_idx` (`ingredient_id` ASC),
  INDEX `fk_users_has_ingredients_users1_idx` (`user_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_users_has_ingredients_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DinnerPlans`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_ingredients_ingredients1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `DinnerPlans`.`ingredients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`meal_has_options`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`meal_has_options` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `meal_id` INT NOT NULL,
  `option_id` INT NOT NULL,
  PRIMARY KEY (`id`, `meal_id`, `option_id`),
  INDEX `fk_meals_has_options_options1_idx` (`option_id` ASC),
  INDEX `fk_meals_has_options_meals1_idx` (`meal_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_meals_has_options_meals1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `DinnerPlans`.`meals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meals_has_options_options1`
    FOREIGN KEY (`option_id`)
    REFERENCES `DinnerPlans`.`options` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`orders` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `meal_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_users1_idx` (`user_id` ASC),
  INDEX `fk_orders_meals1_idx` (`meal_id` ASC),
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DinnerPlans`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_meals1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `DinnerPlans`.`meals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`messages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `to_user_id` INT NOT NULL,
  `from_user_id` INT NOT NULL,
  `message` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`, `to_user_id`, `from_user_id`),
  INDEX `fk_messages_users2_idx` (`from_user_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`to_user_id`)
    REFERENCES `DinnerPlans`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_users2`
    FOREIGN KEY (`from_user_id`)
    REFERENCES `DinnerPlans`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `review` TEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `reviewer_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reviews_users1_idx` (`reviewer_id` ASC),
  INDEX `fk_reviews_users2_idx` (`user_id` ASC),
  CONSTRAINT `fk_reviews_users1`
    FOREIGN KEY (`reviewer_id`)
    REFERENCES `DinnerPlans`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_users2`
    FOREIGN KEY (`user_id`)
    REFERENCES `DinnerPlans`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DinnerPlans`.`meal_has_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DinnerPlans`.`meal_has_images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `meal_id` INT NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`id`, `meal_id`, `image_id`),
  INDEX `fk_meals_has_images_images1_idx` (`image_id` ASC),
  INDEX `fk_meals_has_images_meals1_idx` (`meal_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_meals_has_images_meals1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `DinnerPlans`.`meals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meals_has_images_images1`
    FOREIGN KEY (`image_id`)
    REFERENCES `DinnerPlans`.`images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`fabricators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fabricators` (
  `fabricator_id` INT NOT NULL AUTO_INCREMENT,
  `fabricator` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`fabricator_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lenses` (
  `lense_id` INT NOT NULL AUTO_INCREMENT,
  `dioptres` INT NOT NULL,
  `price` DECIMAL(7,2) NULL,
  `delivery` DATETIME NULL,
  `fabricator_id` INT NOT NULL,
  PRIMARY KEY (`lense_id`, `fabricator_id`),
  INDEX `fk_lenses_fabricators1_idx` (`fabricator_id` ASC) VISIBLE,
  CONSTRAINT `fk_lenses_fabricators1`
    FOREIGN KEY (`fabricator_id`)
    REFERENCES `mydb`.`fabricators` (`fabricator_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`frames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`frames` (
  `frame_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(100) NULL,
  `price` DECIMAL(7,2) NULL,
  `delivery` DATETIME NULL,
  `fabricator_id` INT NOT NULL,
  PRIMARY KEY (`frame_id`, `fabricator_id`),
  INDEX `fk_frames_fabricators_idx` (`fabricator_id` ASC) VISIBLE,
  CONSTRAINT `fk_frames_fabricators`
    FOREIGN KEY (`fabricator_id`)
    REFERENCES `mydb`.`fabricators` (`fabricator_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `fio` VARCHAR(60) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL,
  `actual_delivery` DATETIME NULL,
  `payment_date` DATETIME NULL,
  `client_id` INT NOT NULL,
  `frame_id` INT NOT NULL,
  `left_lense_id` INT NOT NULL,
  `right_lense_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `client_id`, `frame_id`, `left_lense_id`, `right_lense_id`),
  INDEX `fk_orders_clients1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_orders_frames1_idx` (`frame_id` ASC) VISIBLE,
  INDEX `fk_orders_lenses1_idx` (`left_lense_id` ASC) VISIBLE,
  INDEX `fk_orders_lenses2_idx` (`right_lense_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_frames1`
    FOREIGN KEY (`frame_id`)
    REFERENCES `mydb`.`frames` (`frame_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_lenses1`
    FOREIGN KEY (`left_lense_id`)
    REFERENCES `mydb`.`lenses` (`lense_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_lenses2`
    FOREIGN KEY (`right_lense_id`)
    REFERENCES `mydb`.`lenses` (`lense_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`order_prices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order_prices` (`order_id` INT, `'order_price'` INT, `order_date` INT, `'delivery_date'` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`overdue_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`overdue_orders` (`order_id` INT, `order_date` INT, `delivery_date` INT, `order_price` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`fabricator_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fabricator_orders` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`order_prices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`order_prices`;
USE `mydb`;
CREATE  OR REPLACE VIEW `order_prices` AS
  SELECT o.order_id, f.price + l.price + r.price as 'order_price', o.order_date,
         CASE 
           WHEN (l.delivery >= r.delivery)AND(l.delivery >= f.delivery) THEN l.delivery
           WHEN (r.delivery >= l.delivery)AND(r.delivery >= f.delivery) THEN r.delivery
           ELSE f.delivery
		 END AS 'delivery_date'
    FROM orders o, lenses l, lenses r, frames f
    WHERE o.left_lense_id = l.lense_id
      AND o.right_lense_id = r.lense_id
      AND o.frame_id = f.frame_id;

-- -----------------------------------------------------
-- View `mydb`.`overdue_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`overdue_orders`;
USE `mydb`;
CREATE  OR REPLACE VIEW `overdue_orders` AS
  SELECT op.order_id, op.order_date, 
         op.delivery_date, op.order_price
    FROM order_prices op
    WHERE op.delivery_date > op.order_date;

-- -----------------------------------------------------
-- View `mydb`.`fabricator_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`fabricator_orders`;
USE `mydb`;
CREATE  OR REPLACE VIEW `fabricator_orders` AS
  WITH lense_fabr as (
		SELECT l.fabricator_id, YEAR(l.delivery) fyear, 
			   MONTH(l.delivery) fmonth, SUM(l.price) lense_price
		  FROM lenses l
		  GROUP BY l.fabricator_id, YEAR(l.delivery), MONTH(l.delivery)),
       frame_fabr as (
		SELECT f.fabricator_id, YEAR(f.delivery) fyear, 
			   MONTH(f.delivery) fmonth, SUM(f.price) frame_price
		  FROM frames f
		  GROUP BY f.fabricator_id, YEAR(f.delivery), MONTH(f.delivery))
  SELECT IFNULL(lf.fabricator_id, ff.fabricator_id) as fabricator_id,
         IFNULL(lf.fyear, ff.fyear) as order_year,
         IFNULL(lf.fmonth, ff.fmonth) as order_month,
         IFNULL(lf.lense_price, 0) + IFNULL(ff.frame_price, 0) as order_price
    FROM lense_fabr lf
    FULL OUTER JOIN frame_fabr ff
      ON l.fabricator_id = f.fabricator_id 
        AND l.fyear = f.fyear AND l.fmonth = f.fmonth;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

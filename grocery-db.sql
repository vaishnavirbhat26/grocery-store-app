CREATE SCHEMA `grocery` ;

USE 'grocery';

CREATE TABLE `grocery`.`products` (
  `prod_id` INT NOT NULL AUTO_INCREMENT,
  `prod_name` VARCHAR(100) NOT NULL,
  `unit_id` INT NOT NULL,
  `ppu` DOUBLE NOT NULL,
  PRIMARY KEY (`prod_id`));

CREATE TABLE `grocery`.`unit` (
  `unit_id` INT NOT NULL AUTO_INCREMENT,
  `unit_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`unit_id`));

ALTER TABLE `grocery`.`products` 
ADD CONSTRAINT `fk_unit_id`
  FOREIGN KEY (`unit_id`)
  REFERENCES `grocery`.`unit` (`unit_id`)
  ON DELETE NO ACTION
  ON UPDATE RESTRICT;

CREATE TABLE `grocery`.`order_details` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  `total_price` DOUBLE NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_prod_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `grocery`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_prod_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `grocery`.`products` (`prod_id`)
    ON DELETE NO ACTION
    ON UPDATE RESTRICT);

CREATE TABLE `grocery`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `cust_name` VARCHAR(100) NOT NULL,
  `total` DOUBLE NOT NULL,
  `datetime` DATE NOT NULL,
  PRIMARY KEY (`order_id`));

INSERT INTO `grocery`.`products` (`prod_id`, `prod_name`, `unit_id`, `ppu`) VALUES ('1', 'Toothpaste', '1', '30');
INSERT INTO `grocery`.`products` (`prod_id`, `prod_name`, `unit_id`, `ppu`) VALUES ('2', 'Rice', '2', '45');
INSERT INTO `grocery`.`products` (`prod_id`, `prod_name`, `unit_id`, `ppu`) VALUES ('3', 'MoongDal', '2', '25');
INSERT INTO `grocery`.`products` (`prod_id`, `prod_name`, `unit_id`, `ppu`) VALUES ('4', 'Soap', '1', '60');
INSERT INTO `grocery`.`products` (`prod_id`, `prod_name`, `unit_id`, `ppu`) VALUES ('5', 'Banana', '2', '20');
INSERT INTO `grocery`.`products` (`prod_id`, `prod_name`, `unit_id`, `ppu`) VALUES ('7', 'Onions', '2', '26');
INSERT INTO `grocery`.`products` (`prod_id`, `prod_name`, `unit_id`, `ppu`) VALUES ('8', 'Apple', '2', '80');
INSERT INTO `grocery`.`products` (`prod_id`, `prod_name`, `unit_id`, `ppu`) VALUES ('9', 'FaceMask', '1', '50');
INSERT INTO `grocery`.`products` (`prod_id`, `prod_name`, `unit_id`, `ppu`) VALUES ('11', 'Okra', '2', '30');


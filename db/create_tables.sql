-- create database/schema in your local mysql instance
create schema IF NOT EXISTS tansy_cloud;

-- change your current database in mysql workbench/GUI client
use tansy_cloud;

-- create product table
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_status` tinyint NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL DEFAULT now(),
  `modified_date` datetime NOT NULL DEFAULT now(),
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `uix_01_product` (`product_name`)
);

-- create client table
CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) NOT NULL,
  `client_status` tinyint NOT NULL DEFAULT '1',
  `mobile_phone` bigint ,
  `email_address` varchar(100),
  `city` varchar(100) ,
  `created_date` datetime NOT NULL DEFAULT now(),
  `modified_date` datetime NOT NULL DEFAULT now(),
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `uix_01_client` (`client_name`, `mobile_phone`)
);

-- create sales table
-- parent invoice table and invoice foreign key is out of scope for this project
CREATE TABLE IF NOT EXISTS `sales` (
  `sales_id` int NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(100) NOT NULL,
  `client_id` int NOT NULL,
  `product_id` int NOT NULL,
  `sales_date` datetime ,
  `quantity` int,
  `unit_price` DECIMAL(18,3) NOT NULL ,
  `row_total` DECIMAL(18,3) NOT NULL ,
  `created_date` datetime NOT NULL DEFAULT now(),
  `modified_date` datetime NOT NULL DEFAULT now(),
  PRIMARY KEY (`sales_id`),
  UNIQUE KEY `uix_01_sales` (`invoice_number`, `product_id`),
  CONSTRAINT `fk_01_sales`
    FOREIGN KEY (`client_id`)
    REFERENCES `client` (`client_id`),
  CONSTRAINT `fk_02_sales`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`product_id`)  
);

-- create user table
-- in real production environment there are lot more columns than what we have here
CREATE TABLE IF NOT EXISTS `app_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `login_id` varchar(100) NOT NULL,
  `hashed_password` varchar(500) NOT NULL,
  `user_status` tinyint NOT NULL DEFAULT '1',  
  `created_date` datetime NOT NULL DEFAULT now(),  
  `modified_date` datetime NOT NULL DEFAULT now(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uix_01_app_user` (`login_id`)
);
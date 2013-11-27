-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 27, 2013 at 03:06 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ingsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email_address` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `registration_date` date NOT NULL,
  `birthday_date` date NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `address_line1` varchar(45) NOT NULL,
  `address_line2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `country` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `credit_card_holder` varchar(45) DEFAULT NULL,
  `card_type` varchar(45) DEFAULT NULL,
  `card_number` varchar(45) DEFAULT NULL,
  `card_security_code` varchar(45) DEFAULT NULL,
  `card_expiration_date` date DEFAULT NULL,
  `shopperpoint` int(11) NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `ID_UNIQUE` (`account_id`),
  UNIQUE KEY `email_address_UNIQUE` (`email_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `name`, `email_address`, `password`, `registration_date`, `birthday_date`, `gender`, `address_line1`, `address_line2`, `city`, `state`, `postal_code`, `country`, `phone_number`, `credit_card_holder`, `card_type`, `card_number`, `card_security_code`, `card_expiration_date`, `shopperpoint`) VALUES
(1, 'andi', 'andi@andi', 'andi', '2013-11-06', '2013-11-21', 1, 'asd1', 'asd2', 'asd', 'asd', 123, 'asd', 'asdasdasd', 'asdasd', 'asdasd', 'asdasd', 'asd', '2013-11-08', 43211);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `shipping_method` varchar(45) NOT NULL,
  `shipping_cost` varchar(45) NOT NULL,
  `total_cost` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`,`account_id`),
  KEY `fk_order_account_idx` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `count` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `release_date` date NOT NULL,
  `aviability` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `weight` varchar(45) NOT NULL,
  `label` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id_UNIQUE` (`product_id`),
  UNIQUE KEY `product_name_UNIQUE` (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_carted`
--

CREATE TABLE IF NOT EXISTS `product_carted` (
  `product_carted_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`product_carted_id`),
  KEY `fk_product_carted_account1_idx` (`account_id`),
  KEY `fk_product_carted_product1_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_ordered`
--

CREATE TABLE IF NOT EXISTS `product_ordered` (
  `product_ordered_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`product_ordered_id`),
  KEY `fk_product_ordered_order1_idx` (`order_id`),
  KEY `fk_product_ordered_product1_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_carted`
--
ALTER TABLE `product_carted`
  ADD CONSTRAINT `fk_product_carted_account1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_carted_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_ordered`
--
ALTER TABLE `product_ordered`
  ADD CONSTRAINT `fk_product_ordered_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_ordered_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2013 at 03:52 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ruserba`
--
CREATE DATABASE IF NOT EXISTS `ruserba` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ruserba`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `username` varchar(20) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `kuantitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `creditcard`
--

CREATE TABLE IF NOT EXISTS `creditcard` (
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date` varchar(10) NOT NULL,
  `username` varchar(50) DEFAULT '',
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creditcard`
--

INSERT INTO `creditcard` (`number`, `name`, `date`, `username`) VALUES
('1234567890123456', 'Test1', '01-12-2013', NULL),
('1111111111111111', 'ruserba', '25-12-2013', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sold` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `quantity`, `sold`, `category`, `picture`) VALUES
(1, 'Gelatinous Milk', 'This milk has been mixed with gelatin, making it gelatinous (don''t worry about health risk though, because it is pasteurized).', 5000, 10, 3, 'Dairy', 'Gelatinous_Milk.jpg'),
(2, 'Longevity Cheese', 'This particular cheese has been mixed with an organic material to ensure that anyone (or anything) that eats it will be blessed with longevity.', 10000, 15, 12, 'Dairy', 'Longevity_Cheese.jpg'),
(3, 'Rainbow Butter', 'This is one of those unique kinds of butter that will change its color to the opposite of its surface (amazing, right?).', 3500, 12, 8, 'Dairy', 'Rainbow_Butter.jpg'),
(4, 'Nutrient Yogurt', 'This yogurt contains everything that you need to consume in a day (although it won''t make you full).', 6500, 69, 184, 'Dairy', 'Nutrient_Yogurt.jpg'),
(5, 'Jack-o''-Pumpkin', 'If you don''t have time to craft pumpkins for Halloween, fear not! This pumpkin will craft itself into a Jack-o''-lantern.\r\nWarning : Only use it on your cooking on days other than  Halloween day. You have been warned.', 11500, 43, 20, 'Fruit', 'Jack-o''-Pumpkin.jpg'),
(6, 'Starfruit', 'This is literally a star fruit. Make sure that you don''t keep it in the open so that it doesn''t go out into the sky. It tastes divine though!', 5000, 62, 31, 'Fruit', 'Starfruit.jpg'),
(7, 'Annoying Orange', 'This orange will emit a strange sound that definitely will annoy you, hence the name.', 6666, 32, 10, 'Fruit', 'Annoying_Orange.jpg'),
(8, 'Truth and Lie Apple', 'This unique apple will make you always tell truth when you eat one side, and will always make you lie when you eat the other side.', 9500, 30, 51, 'Fruit', 'Truth_and_Lie_Apple.jpg'),
(9, 'Popeye Spinach', 'Most people that were born on late 20th century should know about this. This particular spinach will increase your energy by an amazing 1000%!', 10000, 164, 100, 'Vegetable', 'Popeye_Spinach.jpg'),
(10, 'Peashooter', 'Plants vs. Zombies fans familiar with this? Like in the game, this will shoot a pea for you to cook (not to kill zombies, sorry...).', 12000, 251, 56, 'Vegetable', 'Peashooter.jpg'),
(11, 'Cornpop', 'Don''t be startled when you cook this, because it will turn into a popcorn in an instant when cooked!', 7500, 45, 72, 'Vegetable', 'Cornpop.jpg'),
(12, 'Fishy Meat', 'This fish meat looks really fishy that you will think twice before using it to cook. It''s actually edible though.', 4000, 12, 2, 'Meat', 'Fishy_Meat.jpg'),
(13, 'T-Bone Meat', 'This is a bone-in meat that looks like letter T... unnaturally. It tasted like other fantastic steaks though.', 15000, 20, 43, 'Meat', 'T-Bone_Meat.jpg'),
(14, 'Lame Meat', 'This particular lamb meat will make your cooking feel lame, no matter how good you do it...', 13000, 31, 23, 'Meat', 'Lame_Meat.jpg'),
(15, 'Curly Powder', 'This is actually a curry powder, but somehow... This powder will fuse into each other, making something like a long string.', 8000, 50, 29, 'Spice', 'Curly_Powder.jpg'),
(16, 'Six-Spice Powder', 'This is actually five-spice powder that is mixed with another ingredient, which is... salt.', 10500, 64, 38, 'Spice', 'Six-Spice_Powder.jpg'),
(17, 'Negative Powder', 'Another unique powder. This one will always reverse the taste of a cooking. In other words : Use this ONLY in a REALLY, REALLY, BAD cooking, which will make it taste fantastic (health risk not gone though...).', 12500, 86, 89, 'Spice', 'Negative_Powder.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `provinsi` text NOT NULL,
  `kota` varchar(20) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `akses` varchar(5) NOT NULL DEFAULT 'biasa',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Berisi user ruserba';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama`, `email`, `hp`, `alamat`, `provinsi`, `kota`, `kodepos`, `akses`) VALUES
('abbaa', '12345678', 'd da', 'd@dd.ddd', '123', '', '', '', '', 'biasa'),
('admin', 'adminadmin', 'admin admin', 'admin@admin.com', '', ' ', '', '', '', 'admin'),
('asdasd', 'asdasdad', 'asdasdasd', 'sdasdasda', 'asdasd', 'asda', 'asd', 'asd', 'sd', 'biasa'),
('azalea', 'hahahaha', 'azal destra', 'azal@destra.com', '', '', 'asdasd', '', '', 'biasa'),
('dikra', 'fufufufu', 'dikra prasetya', 'dikra@dick.dick', '', '', '', '', '', 'biasa');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `creditcard_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

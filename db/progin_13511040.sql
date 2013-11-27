-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2013 at 02:08 PM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alat_pesta`
--
CREATE DATABASE IF NOT EXISTS `alat_pesta` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `alat_pesta`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `no_customer` int(10) NOT NULL AUTO_INCREMENT,
  `nama` char(35) NOT NULL,
  `kota` char(35) DEFAULT NULL,
  `kodepos` int(20) DEFAULT NULL,
  `email` char(35) NOT NULL,
  `hp` int(12) DEFAULT NULL,
  `password` varchar(15) NOT NULL,
  `username` varchar(12) NOT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `card_number` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`no_customer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`no_customer`, `nama`, `kota`, `kodepos`, `email`, `hp`, `password`, `username`, `provinsi`, `alamat`, `card_number`) VALUES
(4, 'Andrian Octavianus', 'Kudus', 59319, 'andrian.octo@gmail.com', 0, '31023102', 'gtsquadron', '', '', '1231312312'),
(13, 'hhh', '', 0, 'krisdayanto@t.cd', 0, '312312312', 'andrian', 'brasdasd', 'asdasd', ''),
(14, 'adasdasdasdasd afasdasd', 'asdasdasd', 123123, 'asdasd@das.dsf', 1213123123, '123123123', 'aasdasdasd', 'asdasdasd', '1312asdasdasd', ''),
(15, 'tukul aja', '', 0, 'qwe@kj.mp', 0, '123123123', 'tukulArwana', '', '', ''),
(16, 'Raden Fajar Hadria Putra', 'bandung', 14045, 'f@f.com', 2147483647, '1234', 'Fazkool', 'jaabra', 'kajaa', '1234567891234567'),
(24, 'asu wbd', 'bandung', 14045, 'asdf@yahoo.com', 898989, 'asdfasdf', 'asuwbd', 'jawa barat', 'jalannan', NULL),
(25, 'asu wbd', 'bandung', 14045, 'asdf@yahoo.com', 898989, 'asdfasdf', 'asuwbd', 'jawa barat', 'jalannan', NULL),
(26, 'asu wbd', 'bandung', 14045, 'asdf@yahoo.com', 898989, 'asdfasdf', 'asuwbd', 'jawa barat', 'jalannan', NULL),
(28, 'sadfsdf sadfs', 'bandun', 14094, 'asdfff@yahoo.com', 89829, 'asdfasdf', 'cmasfo', 'jawaba', 'jalanan', NULL),
(29, 'sadfsdf sadfs', 'bandun', 14094, 'asdfff@yahoo.com', 89829, 'asdfasdf', 'cmasfo', 'jawaba', 'jalanan', NULL),
(30, 'asdfs sadfdfsa', 'bandung', 1404, 'safdsdf@yahoo.com', 8908080, 'asdfasdf', 'asdfdsaf', 'jawabawa', 'asdfsdasf', NULL),
(31, 'asfd sadf', '', 12, 'asdfsfd@yahoo.com', 123, 'asdfasdf', 'asdfsd', '', '', NULL),
(32, 'asfd sadf', 'bandung', 12, 'asdfssfd@yahoo.com', 123, 'asdfasdf', 'asdfsdw', 'jawa baba', 'jalnanan', NULL),
(33, 'asfd sadf', 'bandung', 12, 'asdfssfd@yahoo.com', 123, 'asdfasdf', 'asdfsdw', 'jawa baba', 'jalnanan', NULL),
(34, 'jlkjklsf sdafsfd', 'bandung', 14045, 'sadfasfds@yahoo.com', 898981, 'asdfasdf', 'asdfasd', 'jawabarat', 'jalnanan', NULL),
(35, 'jlkjklsf sdafsfd', 'bandung', 14045, 'sadfasfds@yahoo.com', 898981, 'asdfasdf', 'asdfasd', 'jawabarat', 'jalnanan', NULL),
(36, 'asfsdafd sdfsdf', 'sdfsdf', 2921, 'dafdfsd@yahoo.com', 89898981, 'asdfasdf', 'asdfsadf', 'afdsaf', 'sajf', NULL),
(37, 'asdf asdf', 'bandung', 14045, 'asdfeee@yahoo.com', 2147483647, 'asdfasdf', 'database', 'jawabaraat', 'jalan', NULL),
(38, 'asdfs sdfsdf', 'bandung', 14045, 'asnnlkn@yahoo.com', 91231, 'asdfasdf', 'asdaa', 'jawaba', 'jalann', NULL),
(39, 'asdf sdaf', 'bandung', 14034, 'sadfsdffd@yahoo.com', 884822, 'asdfasdf', 'asdfff', 'jawabarat', 'jalnanan', NULL),
(40, 'fafafa fafaf', '', 0, 'sdfasfdf@yahoo.com', 0, 'asdfasdf', 'fafafa', '', '', NULL),
(41, 'admin', NULL, NULL, 'admin@admin.admin', NULL, 'admin', 'admin', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kartu_kredit`
--

CREATE TABLE IF NOT EXISTS `kartu_kredit` (
  `card_number` varchar(16) NOT NULL,
  `card_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kartu_kredit`
--

INSERT INTO `kartu_kredit` (`card_number`, `card_name`) VALUES
('1234567891234567', 'andrian'),
('9876543219876543', 'joko');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE IF NOT EXISTS `keranjang` (
  `id_cart` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) NOT NULL,
  `id_alat` int(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `pesan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cart`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id_cart`, `id_customer`, `id_alat`, `jumlah`, `pesan`) VALUES
(1, 0, 25, 11, 'standart'),
(2, 0, 25, 11, 'standart'),
(3, 0, 25, 11, 'standart'),
(4, 0, 25, 11, 'standart'),
(5, 0, 25, 11, 'standart'),
(6, 0, 25, 11, 'standart'),
(7, 16, 8, 6, 'null'),
(8, 16, 8, 5, 'null'),
(9, 16, 8, 8, 'null'),
(10, 16, 8, 3, 'null'),
(11, 16, 21, 9, 'null'),
(12, 16, 21, 40, 'null'),
(13, 16, 29, 45, 'null'),
(14, 16, 13, 2, 'null');

-- --------------------------------------------------------

--
-- Table structure for table `peralatan`
--

CREATE TABLE IF NOT EXISTS `peralatan` (
  `no_alat` int(10) NOT NULL AUTO_INCREMENT,
  `nama` char(25) DEFAULT NULL,
  `kategori` char(20) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  `harga` int(20) DEFAULT NULL,
  `deskripsi` tinytext,
  `foto` char(50) DEFAULT NULL,
  `status` char(20) DEFAULT NULL,
  PRIMARY KEY (`no_alat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `peralatan`
--

INSERT INTO `peralatan` (`no_alat`, `nama`, `kategori`, `jumlah`, `harga`, `deskripsi`, `foto`, `status`) VALUES
(1, 'Browny', 'Sweater', 1984, 400000, 'You like brown? THIS is brown! The silk is out of this world!', 'images/Sweater1.jpg', 'Tersedia'),
(2, 'Coldplay 1', 'TShirt', 2000, 75000, 'For Coldplay Fans out there!', 'images/TShirt1.jpg', 'Tersedia'),
(3, 'Coldplay Mugs', 'Misc', 2000, 60000, 'A sleek black mug for your drinking pleasure', 'images/Misc1.jpg', 'Tersedia'),
(4, 'Devil''s Jacket', 'Jaket', 1965, 150000, 'Jacket for Daredevils, I mean YOU!', 'images/Jaket1.jpg', 'tersedia'),
(5, 'Pokemon HeartGold Version', 'Pokemon', 2000, 400000, 'Lets go back to Johto!', 'images/Pokemon1.jpg', 'tersedia'),
(6, 'Viva la Vida', 'Sweater', 2000, 150000, 'Taken from limited cover art of Viva la Vida, it will show everyone that you hear Jerussalem bells are ringing!', 'images/Sweater2.jpg', 'tersedia'),
(7, 'Coldplay 2', 'TShirt', 2000, 75000, 'For Coldplay Fans out there!', 'images/TShirt2.jpg', 'tersedia'),
(8, 'Coldplay Pins', 'Misc', 2000, 30000, 'Pins for your Coldplay-ish stationary', 'images/Misc2.jpg', 'tersedia'),
(9, 'Ghost Jacket', 'Jaket', 2000, 200000, 'Your choice for eerie fashion', 'images/Jaket2.jpg', 'tersedia'),
(10, 'Pokemon Ruby Version', 'Pokemon', 1890, 300000, 'Experience the beautiful Hoenn Region!', 'images/Pokemon2.jpg', 'tersedia'),
(11, 'Live2012', 'Sweater', 2000, 200000, 'You''ve seen Coldplay Live 2012? Tell everyone you''ve seen it with this sweater!', 'images/Sweater3.jpg', 'tersedia'),
(12, 'Coldplay 3', 'TShirt', 2000, 75000, 'For Coldplay Fans out there!', 'images/TShirt3.jpg', 'tersedia'),
(13, 'Coldplay Hat', 'Misc', 2000, 80000, 'Wear your hat to proclaim yourself as a Coldplayer!', 'images/Misc3.jpg', 'tersedia'),
(14, 'Dark Jacket', 'Jaket', 2000, 200000, 'The darkest jacket there is', 'images/Jaket3.jpg', 'tersedia'),
(15, 'Pokemon SoulSilver', 'Pokemon', 2500, 400000, 'Lets go back to Johto!', 'images/Pokemon3.jpg', 'tersedia'),
(16, 'Pure Jacket', 'Jaket', 34, 80000, 'For Purists who like pure white', 'images/Jaket4.jpg', 'tersedia'),
(17, 'Steve Jacket', 'Jaket', 2323, 400000, 'A jacket who belonged to Steve Austin', 'images/Jaket7.jpg', 'tersedia'),
(18, 'Mr. Jacket', 'Jaket', 700, 100000, 'Jacket for big guys and brave young men', 'images/Jaket5.jpg', 'aasdasd'),
(19, 'Jajaccket', 'Jaket', 80, 40000, 'Weird name, cool style!', 'images/Jaket6.jpg', 'tersedia'),
(20, 'Jacketron', 'Jaket', 909, 180000, 'Welcome to the future with this futuristic wear!', 'images/Jaket8.jpg', ''),
(21, 'Lady Jacketine', 'Jaket', 78, 150000, 'Just for Ladies and Pinky Men', 'images/Jaket9.jpg', ''),
(22, 'JJJ Jacket', 'Jaket', 7070, 70000, 'For the frugals', 'images/Jaket10.jpg', ''),
(23, 'Sub-Lime', 'Jaket', 80, 120000, 'Sooo Limy!! For you who likes brightness', 'images/Jaket11.jpg', ''),
(24, 'Orange', 'Jaket', 80, 200000, 'For fruity people, we mean like eating fruit!', 'images/Jaket12.jpg', ''),
(25, 'Racer''s Armor', 'Jaket', 0, 500000, 'Wear your armor, racers!', 'images/Jaket13.jpg', ''),
(26, 'Mylo Xyloto', 'Sweater', 200, 150000, 'Share your favorite Coldplay concept album with this sweater!!', 'images/Sweater4.jpg', NULL),
(27, 'Northlane', 'Sweater', 200, 90000, 'For Northlane fans out there', 'images/Sweater5.jpg', NULL),
(28, 'Marceline', 'Sweater', 200, 100000, 'For Marceline fans out there', 'images/Sweater6.jpg', NULL),
(29, 'Jem and the Holograms', 'Sweater', 200, 130000, 'For Jam and the Holograms Fans out there!', 'images/Sweater7.jpg', NULL),
(30, 'Slipknot', 'Sweater', 200, 70000, 'For Slipknot Fans out there!', 'images/Sweater8.jpg', ''),
(31, 'Sleeping with Sir', 'Sweater', 200, 190000, 'Watch your favorite Sleeping with Sir with this sweater!', 'images/Sweater9.jpg', ''),
(32, 'Led Zeppelin', 'Sweater', 200, 170000, 'For Led Zeppelin Fans out there!', 'images/Sweater10.jpg', ''),
(33, 'KISS', 'Sweater', 200, 100000, 'For KISS Fans out there!', 'images/Sweater11.jpg', ''),
(34, 'Viva la Vida Cup', 'Misc', 2000, 50000, 'White Coldplay coffe for your white feeling', 'images/Misc4.jpg', ''),
(35, 'ETIAW Handbag', 'Misc', 20000, 30000, 'Shop with every teardrop in your head!', 'images/Misc5.jpg', ''),
(36, 'Fuzzy Man Hadbag', 'Misc', 20000, 30000, 'Fuzzy man will help you with your shopping!', 'images/Misc6.jpg', ''),
(37, 'Viva la Vida Mug', 'Misc', 2000, 40000, 'Hear the Jerussalem bells ringing while drinking with this sleek mug!', 'images/Misc7.jpg', ''),
(38, 'Coldplay Stainless Bottle', 'Misc', 2000, 130000, 'Going to Violet Hill? You should bring this nice Coldplay bottle!', 'images/Misc8.jpg', ''),
(39, 'Buckland Hat', 'Misc', 2000, 80000, 'Be Jon Buckland with this Buckland hat!', 'images/Misc9.jpg', ''),
(40, 'Coldplay Mug 2', 'Misc', 2000, 40000, 'Dont like black? Why not buy the white one?', 'images/Misc10.jpg', ''),
(41, 'Coldplay Blue Handbag', 'Misc', 2000, 50000, 'Lets go to the Paradise of shopping with this handbag!', 'images/Misc11.jpg', ''),
(42, 'Coldplay 4', 'TShirt', 200, 75000, 'A Great Coldplayish design just for you', 'images/TShirt4.jpg', ''),
(43, 'Coldplay 5', 'TShirt', 200, 75000, 'A Great Coldplayish design just for you', 'images/TShirt5.jpg', ''),
(44, 'Coldplay 6', 'TShirt', 200, 75000, 'A Great Coldplayish design just for you', 'images/TShirt6.jpg', ''),
(45, 'Coldplay 7', 'TShirt', 200, 75000, 'A Great Coldplayish design just for you', 'images/TShirt7.jpg', ''),
(46, 'Coldplay 8', 'TShirt', 200, 75000, 'A Great Coldplayish design just for you', 'images/TShirt8.jpg', ''),
(47, 'Coldplay 9', 'TShirt', 200, 75000, 'A Great Coldplayish design just for you', 'images/TShirt9.jpg', ''),
(48, 'Coldplay 10', 'TShirt', 200, 75000, 'A Great Coldplayish design just for you', 'images/TShirt10.jpg', ''),
(49, 'Coldplay 11', 'TShirt', 200, 75000, 'A Great Coldplayish design just for you', 'images/TShirt11.jpg', ''),
(50, 'Pokemon White Version', 'Pokemon', 200, 400000, 'Start from the beginning with Pokemon White Version', 'images/Pokemon4.jpg', ''),
(51, 'Pokemon Diamond Version', 'Pokemon', 200, 400000, 'Explore the mythical Sinnoh Region!', 'images/Pokemon5.jpg', ''),
(52, 'Pokemon Emerald Version', 'Pokemon', 200, 300000, 'Go back to Hoenn to save the world with Rayquaza!', 'images/Pokemon6.jpg', ''),
(53, 'Pokemon Pearl Version', 'Pokemon', 200, 400000, 'Explore the mythical Sinnoh Region!', 'images/Pokemon7.jpg', ''),
(54, 'Pokemon Sapphire Version', 'Pokemon', 200, 300000, 'Experience the beautiful Hoenn Region!', 'images/Pokemon8.jpg', ''),
(55, 'Pokemon Y', 'Pokemon', 200, 450000, 'See the beauty of Kalos Region with full 3D!', 'images/Pokemon9.jpg', ''),
(56, 'Pokemon X', 'Pokemon', 200, 450000, 'See the beauty of Kalos Region with full 3D!', 'images/Pokemon10.jpg', ''),
(57, 'Pokemon LeafGreen Version', 'Pokemon', 200, 3000000, 'Lets go back to Kanto! Start your journey all over again!', 'images/Pokemon11.jpg', ''),
(58, 'Nattasha Nauljam', 'Misc', 1, 999999999, 'The Ultimate Thing !', 'images/Nattasha Nauljam.jpg', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `terbayar`
--

CREATE TABLE IF NOT EXISTS `terbayar` (
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `id_costumer` int(11) NOT NULL,
  `pesan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terbayar`
--

INSERT INTO `terbayar` (`id_barang`, `jumlah`, `id_costumer`, `pesan`) VALUES
(25, 4, 16, 'standart'),
(25, 1, 4, 'sdf'),
(25, 10, 4, '123'),
(25, 10, 4, '123'),
(25, 100, 4, '12131'),
(25, 10, 4, ''),
(25, 10, 4, ''),
(25, 10, 4, ''),
(25, 10, 4, ''),
(25, 10, 4, ''),
(25, 10, 4, ''),
(25, 10, 4, ''),
(25, 10, 4, ''),
(25, 10, 4, ''),
(25, 10, 4, ''),
(10, 5, 16, ''),
(10, 5, 16, ''),
(10, 100, 16, ''),
(21, 1, 16, 'null'),
(21, 1, 16, 'null'),
(25, 1, 16, 'null'),
(25, 4, 16, 'null'),
(1, 4, 16, 'null'),
(1, 4, 16, 'null'),
(1, 4, 16, 'null'),
(1, 4, 16, 'null');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

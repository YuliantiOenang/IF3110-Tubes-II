-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2013 at 01:05 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `frexesc`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_user`
--

CREATE TABLE IF NOT EXISTS `barang_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_barang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `tanggal_pembelian` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deskripsi_tambahan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `nomor_kartu` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `expired` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `handphone` varchar(20) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `kodepos` varchar(20) NOT NULL,
  `email` varchar(200) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `handphone`, `alamat`, `provinsi`, `kota`, `kodepos`, `email`, `role`, `nama`) VALUES
(1, 'jamesjaya', 'testestes', '', '', '', '', '', '', 0, ''),
(2, 'pakbos', 'pakbos', '4611941', 'pakbos', 'bos', 'bos', '123', 'pakbos@pakbos.com', 0, 'Pak Bos'),
(4, 'pakbos2', 'pakbos', '123', 'pakbos', 'pakbos', 'pakbos', 'pakbos', 'pakbos', 0, 'pakbos'),
(5, 'pika', 'pika', 'pika', 'pika', 'pika', 'pika', 'pika', 'pika', 0, 'pika'),
(6, 'lika', 'lika', 'lika', 'lika', 'lika', 'lika', 'lika', 'lika', 0, 'lika');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

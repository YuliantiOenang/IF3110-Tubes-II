-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 29 Okt 2013 pada 13.45
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `datauser`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `IdBarang` int(11) DEFAULT NULL,
  `NamaBarang` varchar(20) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL,
  `Kategori` varchar(20) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`IdBarang`, `NamaBarang`, `Harga`, `Kategori`, `Jumlah`) VALUES
(1, 'DagingSapi', 80000, 'Daging', 15),
(2, 'IceCream', 10000, 'Snack', 15),
(3, 'ChickenNugget', 30000, 'Frozen Food', 13),
(4, 'BayamItali', 5000, 'Sayuran', 15),
(5, 'BerasCarrefour', 12000, 'Beras', 11),
(6, 'DagingYak', 85000, 'Daging', 12),
(7, 'BerasTajMahal', 25000, 'Beras', 9),
(8, 'BerasHCSR04', 22000, 'Beras', 7),
(9, 'BerasRaskin', 20000, 'Beras', 12),
(10, 'DagingAyam', 122000, 'Daging', 2),
(11, 'DagingDomba', 92000, 'Daging', 8),
(12, 'PetaiCHINA', 2500, 'Sayuran', 6),
(13, 'SeledriHongkong', 4500, 'Sayuran', 12),
(14, 'TimunAustralia', 14500, 'Sayuran', 5),
(15, 'SOZZZZZZIS', 32000, 'Frozen Food', 25),
(16, 'FIESTANIGGA', 22000, 'Frozen Food', 15),
(17, 'BAKSOSOGOOD', 28000, 'Frozen Food', 42),
(18, 'Beras A-KING', 200, 'Beras', 22);

-- --------------------------------------------------------

--
-- Struktur dari tabel `creditcard`
--

CREATE TABLE IF NOT EXISTS `creditcard` (
  `number` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `expiredate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `creditcard`
--

INSERT INTO `creditcard` (`number`, `name`, `expiredate`) VALUES
('12341234', 'budi lagi', '2014-04-07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactionlog`
--

CREATE TABLE IF NOT EXISTS `transactionlog` (
  `IdBarang` int(11) DEFAULT NULL,
  `NamaBarang` varchar(20) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `Kategori` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transactionlog`
--

INSERT INTO `transactionlog` (`IdBarang`, `NamaBarang`, `Harga`, `Jumlah`, `Username`, `Kategori`) VALUES
(1, 'DagingSapi', 80000, 3, 'budie', 'Daging'),
(1, 'DagingSapi', 80000, 2, 'budie', 'Daging'),
(2, 'IceCream', 10000, 3, 'budie', 'Snack'),
(2, 'IceCream', 10000, 4, 'budie', 'Snack'),
(3, 'ChickenNugget', 30000, 1, 'budie', 'Frozen Food'),
(3, 'ChickenNugget', 30000, 1, 'budie', 'Frozen Food'),
(4, 'BayamItali', 5000, 7, 'budie', 'Sayuran'),
(5, 'BerasCarrefour', 12000, 2, 'budie', 'Beras'),
(6, 'DagingYak', 85000, 7, 'budie', 'Daging'),
(6, 'DagingYak', 85000, 5, 'budie', 'Daging'),
(6, 'DagingYak', 85000, 5, 'budie', 'Daging'),
(5, 'BerasCarrefour', 12000, 3, 'budie', 'Beras'),
(7, 'BerasTajMahal', 25000, 5, 'budie', 'Beras'),
(1, 'DagingSapi', 80000, 2, 'budie', 'Daging'),
(10, 'DagingAyam', 122000, 3, 'budie', 'Daging'),
(4, 'BayamItali', 5000, 2, 'budie', 'Sayuran'),
(12, 'PetaiCHINA', 2500, 3, 'budie', 'Sayuran'),
(3, 'ChickenNugget', 30000, 2, 'budie', 'Frozen Food'),
(5, 'BerasCarrefour', 12000, 1, 'Boci', 'Beras'),
(2, 'IceCream', 10000, 2, 'budie', 'Snack'),
(5, 'BerasCarrefour', 12000, 2, 'budie', 'Beras'),
(3, 'ChickenNugget', 30000, 2, 'budie', 'Frozen Food');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `namalengkap` varchar(50) DEFAULT NULL,
  `nohp` varchar(50) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `kotakabupaten` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `kodepos` varchar(50) DEFAULT NULL,
  `nocredit` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`, `email`, `namalengkap`, `nohp`, `provinsi`, `kotakabupaten`, `alamat`, `kodepos`, `nocredit`) VALUES
('aditya', '12341234', 'adt@adit.com', 'adit ya', '1234123048', 'aksjdfkansd', 'kansdknf', 'kjjdinfoa', '2134123', '12341234'),
('budie', '12345678', 'budie@gmail.com', 'budi budi', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', '12341234'),
('budih', '12341234', 'budie@budi.com', 'budi handoko', '12345', 'lalala', 'lalala', 'lalala', '4444', '12341234'),
('cobabro', '12341234', 'coba@bro.com', 'coba bro', '081508150815', 'Jambi', 'Jambi', 'Jambi', '3000', NULL),
('cobadulu', '12345678', 'coba@dulu.com', 'coba dulu', '01234', 'SULAWESI', 'sulawesi', 'sulawesi', '7000', '12341234'),
('cobalagi', '12341234', 'cobalagi@lagi.com', 'coba dong', '085708570857', 'Jambi', 'Jambi', 'Jambi', '31365', NULL),
('lalayeye', '12345678', 'lala@yeye.com', 'lala yeye', '981379134', 'asdfgs', 'asdgs', 'adfhgs', '345', NULL),
('riandy', '12341234', 'riandy@riandy.com', 'riandy r', '234353', 'sdfgsdfv', 'asdf', 'asdfasd', '143', '123123123'),
('testtest', '12341234', 'test@test.com', 'test test', '0102030405', 'jawa', 'jawa', 'jawa', '1234', NULL),
('username1', '12345678', 'username@username.com', 'username satu', '12344312', 'Jawa Barat', 'Jawa', 'Jawa', '1000', NULL),
('yanti', '1234512345', 'yanti@yanti.com', 'yanti yanti', '08080909', 'Kalimantan Barat', 'Jakarta', 'Jalan layang no 44', '5000', '12341234'),
('yoibro', '12345678', 'yoi@bro.com', 'yoi bro', '0101010101', 'lalala', 'yeyeye', 'layelaye', '000', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 21 Nov 2013 pada 13.29
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
(1, 'DagingSapi', 80000, 'Daging', 10),
(2, 'IceCream', 10000, 'Snack', 14),
(3, 'ChickenNugget', 30000, 'Frozen Food', 13),
(4, 'BayamItali', 5000, 'Sayuran', 7),
(5, 'BerasCarrefour', 12000, 'Beras', 10),
(6, 'DagingYak', 85000, 'Daging', 11),
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
(18, 'Beras A-KING', 200, 'Beras', 19),
(19, 'DagingBebek', 15000, 'Daging', 10),
(20, 'SiomayMantap', 20500, 'Frozen Food', 10),
(21, 'Kangkung', 5300, 'Sayuran', 10),
(22, 'ToKaeNoi', 5400, 'Snack', 10),
(23, 'LeoKripikKentang', 3100, 'Snack', 10),
(24, 'MiGemez', 1200, 'Snack', 24),
(25, 'Bengbeng', 2050, 'Snack', 10);

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
(3, 'ChickenNugget', 30000, 2, 'budie', 'Frozen Food'),
(4, 'BayamItali', 5000, 2, 'yuhustore', 'Sayuran'),
(1, 'DagingSapi', 80000, 1, 'budie', 'Daging'),
(4, 'BayamItali', 5000, 1, 'budie', 'Sayuran'),
(5, 'BerasCarrefour', 12000, 1, 'budie', 'Beras'),
(18, 'Beras A-KING', 200, 3, 'budie', 'Beras'),
(4, 'BayamItali', 5000, 4, 'budie', 'Sayuran'),
(2, 'IceCream', 10000, 1, 'budie', 'Snack'),
(1, 'DagingSapi', 80000, 1, 'budie', 'Daging'),
(1, 'DagingSapi', 80000, 20, 'budie', 'Daging'),
(6, 'DagingYak', 85000, 1, 'aditya2', 'Daging'),
(1, 'DagingSapi', 80000, 1, 'aditya2', 'Daging'),
(4, 'BayamItali', 5000, 1, 'budie', 'Sayuran'),
(8, 'BerasHCSR04', 22000, 1, 'Budie', 'Beras'),
(9, 'BerasRaskin', 20000, 1, 'Budie', 'Beras'),
(21, 'Kangkung', 5300, 1, 'Budie', 'Sayuran'),
(21, 'Kangkung', 5300, 1, 'Budie', 'Sayuran'),
(14, 'TimunAustralia', 14500, 1, 'Budie', 'Sayuran'),
(23, 'LeoKripikKentang', 3100, 1, 'Budie', 'Snack'),
(2, 'IceCream', 10000, 1, 'Budie', 'Snack'),
(25, 'Bengbeng', 2050, 2, 'Budie', 'Snack'),
(20, 'SiomayMantap', 20500, 1, 'Budie', 'Frozen Food'),
(17, 'BAKSOSOGOOD', 28000, 1, 'Budie', 'Frozen Food');

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
('aditya', '12345678', 'adt@adit.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', '12341234'),
('aditya2', '12345678', 'aditya@yahoo.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', '12341234'),
('aditya3', '12345678', 'aditya3@yahoo.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', '12341234'),
('bebek', '12345678', 'bebek@bebek.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('budie', '12341234', 'budie@gmail.com', 'budi ebudi', '087899', 'Jawa Timur', 'Surabaya', 'Surabaya', '5000', '12341234'),
('budih', '12345678', 'budie@budi.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', '12341234'),
('cobabro', '12345678', 'coba@bro.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('cobadulu', '12345678', 'coba@dulu.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', '12341234'),
('cobalagi', '12345678', 'cobalagi@lagi.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('heybro', '12345678', 'hey@bro.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('kucing', '12345678', 'kucing@kucing.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('lalaye', '12345678', 'lalaye@lalaye.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('lalayeye', '12345678', 'lala@yeye.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('popop', '12345678', 'pop@pop.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('riandy', '12345678', 'riandy@riandy.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', '123123123'),
('testtest', '12345678', 'test@test.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('username1', '12345678', 'username@username.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('username2', '12345678', 'usernam2@com.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('username4', '12345678', 'username4@com.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('yanti', '12345678', 'yanti@yanti.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', '12341234'),
('yoibro', '12345678', 'yoi@bro.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', NULL),
('yuhustore', '12345678', 'yuhu@store.com', 'budi doang', '2134', 'Jawa Barat', 'Bandung', 'Bandung', '4001', '12341234');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

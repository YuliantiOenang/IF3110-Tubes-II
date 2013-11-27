-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 27 Nov 2013 pada 14.58
-- Versi Server: 5.6.11
-- Versi PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `wbd_ciangstore`
--
CREATE DATABASE IF NOT EXISTS `wbd_ciangstore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `wbd_ciangstore`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `IdName` varchar(50) NOT NULL,
  KEY `Customer_membeli` (`id`),
  KEY `dipesan_oleh` (`IdName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `credit`
--

CREATE TABLE IF NOT EXISTS `credit` (
  `CardNumber` varchar(20) NOT NULL,
  `CardName` varchar(50) NOT NULL,
  `ExpiredDate` varchar(50) NOT NULL,
  PRIMARY KEY (`CardNumber`),
  KEY `index_cardname` (`CardName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `credit`
--

INSERT INTO `credit` (`CardNumber`, `CardName`, `ExpiredDate`) VALUES
('101010101010101', 'EmpatPuluh MP', '2012-12-12'),
('202020202020202', 'Cody Simpson', '2013-03-30'),
('303030303030303', 'Krayon Pop', '2013-10-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `IdName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `NamaLengkap` varchar(50) NOT NULL,
  `NomorHP` varchar(13) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Kota` varchar(50) NOT NULL,
  `Provinsi` varchar(50) NOT NULL,
  `KodePos` varchar(5) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Transaksi` int(11) NOT NULL,
  `Role` int(11) NOT NULL,
  PRIMARY KEY (`IdName`),
  KEY `index_namalengkap` (`NamaLengkap`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`IdName`, `Password`, `NamaLengkap`, `NomorHP`, `Alamat`, `Kota`, `Provinsi`, `KodePos`, `Email`, `Transaksi`, `Role`) VALUES
('jumping', 'heyjumping', 'Krayon Pop', '08176356635', 'Jl. di Korea', 'Jumping', 'KR', '75532', 'jumpingheyeverybody@gmail.com', 18, 0),
('karakuri', 'piieerroott', 'EmpatPuluh MP', '08176339017', 'Jl. Tubagus Ismail no 1', 'Bandung', 'Jawa Barat', '12345', 'karakuri.pierot@yahoo.com', 0, 1),
('ladadee', 'laladadoo', 'Cody Simpson', '085725706477', 'Jl. Tidak Tau no x', 'There''s', 'OnlyYou', '51243', 'ladadee@gmail.com', 5, 0),
('riandyrn', '12345678', 'Riandy Rahman', '085793174788', 'Jl. Tubagus Ismail no 1', 'Bandung', 'Jawa Barat', '40286', 'riandyrn@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `have`
--

CREATE TABLE IF NOT EXISTS `have` (
  `CardNumber` varchar(20) NOT NULL,
  `IdName` varchar(50) NOT NULL,
  KEY `Customer_memiliki` (`CardNumber`),
  KEY `dimiliki_oleh` (`IdName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `have`
--

INSERT INTO `have` (`CardNumber`, `IdName`) VALUES
('101010101010101', 'karakuri'),
('202020202020202', 'ladadee'),
('303030303030303', 'jumping');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(75) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL,
  `jumlah_beli` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `kategori`, `nama`, `harga`, `deskripsi`, `gambar`, `stok`, `jumlah_beli`) VALUES
(1, 'Beras', 'Beras Raja Lelas', 300, 'Beras dengan kualitas terjamin', 'prdct-beras-carrefour.jpg', 1, 4),
(2, 'Beras', 'Beras Ratu Lele', 350, 'Beras ratu dengan kualitas terjamin', 'prdct-beras-carrefour.jpg', 2, 3),
(3, 'Beras', 'Beras Super', 500, 'Beras dengan kualitas terjamin', 'prdct-beras-carrefour.jpg', 1, 0),
(4, 'Daging', 'Daging Ayam', 200, 'Daging Ayam Kampung', 'prdct-daging-ayam.jpg', 12, 0),
(5, 'Daging', 'Daging Sapi', 400, 'Daging Sapi dengan kualitas terjamin', 'prdct-daging-sapi.jpg', 2, 7),
(6, 'Daging', 'Daging Kambing', 500, 'Kambing dengan kualitas terjamin', 'prdct-daging-kambing.jpg', 23, 0),
(7, 'Daging', 'Daging Salmon', 100, 'ikan dengan kualitas terjamin', 'prdct-daging-salmon.jpg', 8, 0),
(8, 'Daging', 'Daging Tuna', 100, 'Ikan dengan kualitas terjamin', 'prdct-daging-tuna.jpg', 7, 0),
(9, 'Sayuran', 'Bayam Itali', 300, 'Bayam asli itali', 'prdct-bayam-itali.jpg', 8, 0),
(10, 'FrozenFood', 'Chicken Nugget', 300, 'Fiesta Chicken Nugget', 'prdct-nugget-fiesta.jpg', 13, 0),
(11, 'Snack', 'Ice Cream Magnum', 300, 'Bongkar Bongkar Bongkar', 'prdct-icecream-magnum.png', 5, 0),
(14, 'Daging', 'Daging Yak', 75000, 'Daging yak bergizi asli mongolia', 'prdct-daging-yak.jpg', 8, 0);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `Customer_membeli` FOREIGN KEY (`id`) REFERENCES `produk` (`id`),
  ADD CONSTRAINT `dipesan_oleh` FOREIGN KEY (`IdName`) REFERENCES `customer` (`IdName`);

--
-- Ketidakleluasaan untuk tabel `have`
--
ALTER TABLE `have`
  ADD CONSTRAINT `Customer_memiliki` FOREIGN KEY (`CardNumber`) REFERENCES `credit` (`CardNumber`),
  ADD CONSTRAINT `dimiliki_oleh` FOREIGN KEY (`IdName`) REFERENCES `customer` (`IdName`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

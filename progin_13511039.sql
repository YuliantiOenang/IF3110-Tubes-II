-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 27 Nov 2013 pada 14.35
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `ruserba`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `popularitas` int(11) NOT NULL,
  PRIMARY KEY (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`nama`, `keterangan`, `harga`, `kategori`, `jumlah`, `popularitas`) VALUES
('Apel Mematikan', 'Apel yang kalo dimakan apelnya mati.', 10000, 'makanan', 10, 14),
('Baju Sang Ksatria', 'Baju biar keliatan kaya Ksatria.', 100000, 'pakaian', 1, 7),
('Buah Rangga', 'Buah yang berasal dari keharmonisan Rangga (Rumah tangga).', 20000, 'makanan', 20, 32),
('Celana Kasat Mata', 'Celana yang baru bisa digunakan setelah mengkasatkan mata yang menggunakan.', 200000, 'pakaian', 5, 6),
('Ikan Hasil Nelayan', 'Nelayan telah berusaha keras menangkap ikan. Terma kasih banyak om nelayan.', 15000, 'makanan', 2, 3),
('Kursi Menghindar', 'Kursi ini tidak suka diduduki, akan selalu menghindar jika tidak diberi susu.', 500000, 'furnitur', 2, 21),
('Lemari Bau Melon', 'Nikmati kehidupan anda di rumah baru dengan furnitur yang selalu menghasilkan bau melon!', 50000, 'furnitur', 10, 23),
('Lubang Hidung Tambahan', 'Gunakan di bagian telinga untuk menambah jumlah lubang hidung.', 70000, 'aksesoris', 10, 12),
('Meja Terbang', 'Meja yang bisa terbang sesuai dengan keinginan yang diatas.', 45000, 'furnitur', 4, 2),
('NerveGear', 'Mainan ini dapat mempermainkan saraf kamu! Nikmati sensasi menggerakan tangan padahal ingin menggera', 400000, 'mainan', 4, 3),
('Pbox4', 'Argh saya mau beli PS4 D:', 5000000, 'mainan', 10, 23),
('Sarung Tangan Bentuk Kaki', 'Sarung tangan yang dibuat dari kulit kaki manusia asli.', 30000, 'aksesoris', 5, 1),
('SBoxONE', 'Udah ga kreatif lagi bikin nama...', 10000, 'mainan', 1, 1),
('Sepatu Untuk Kaki', 'Sebuah benda yang digunakan di kaki.', 5000, 'aksesoris', 7, 11),
('Topi Anti Maling', 'Topi yang akan melindungi kita dari berubah menjadi maling.', 250000, 'pakaian', 1, 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `namabarang` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `creditcard`
--

CREATE TABLE IF NOT EXISTS `creditcard` (
  `nomorkartu` varchar(50) NOT NULL,
  `namakartu` varchar(50) NOT NULL,
  `expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `creditcard`
--

INSERT INTO `creditcard` (`nomorkartu`, `namakartu`, `expired`) VALUES
('1234', 'kartusaya', '2014-04-04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `have`
--

CREATE TABLE IF NOT EXISTS `have` (
  `username` varchar(50) NOT NULL,
  `nomorkartu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `have`
--

INSERT INTO `have` (`username`, `nomorkartu`) VALUES
('yanuararistya', '1234'),
('aksel5556', '1234'),
('jemsjems', '1234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `kodepos` varchar(50) NOT NULL,
  `nohp` varchar(50) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `transaksi` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`, `fullname`, `alamat`, `provinsi`, `kota`, `kodepos`, `nohp`, `tipe`, `email`, `transaksi`) VALUES
('aksel5556', 'yanuaredi', 'yanuar edi', 'anaslk', 'laskdj ', 'lkasj', 'lkasj', 'lkas', 'pembeli', 'lsad@as.com', 0),
('asdfasdf', 'asdasdasd', 'a ads ads', 'jaskldsaj', 'lkadsj ', 'adslj', 'lasd', 'ldjsa', 'pembeli', 'ljks@moc.com', 0),
('cobain', 'cobacoba', 'coba coba', 'coba c', 'aosid ', 'adls', 'aldkj', 'lkajsd', 'pembeli', 'kljsad@com.com', 0),
('jemsjems', 'asdfasdf', 'asdf asdf', 'asdf ', 'assdf ', 'asd', 'af', 'asd', 'pembeli', 'ad@co.com', 0),
('reigun', 'reireirei', 'reii gun', '091823', 'djsjlka ', 'aslkdj', 'adslkj', 'qladjs', 'pembeli', 'reigun@moc.com', 0),
('yanuar', 'asdasdasd', 'yanua ae', 'dimanapun', 'asdf', 'asdf', 'adf', 'asdf', 'pembeli', 'aasd@com.com', 0),
('yanuararis', 'poklijmunloki', 'asd sad', 'asda', 'asdlkj ', 'asjd', 'lasd', 'saldk', 'pembeli', 'oos@c.com', 0),
('yanuararist', 'asdfasdf', 'lasdj as', 'as', 'as ', 'asd', 'ad', 'ad', 'pembeli', 'sad@com.com', 0),
('yanuararistya', 'poklijmunloki', 'Yanuar Aristya Edy Putra', 'Jalan Tubagus Ismail I no 5', 'Jawa Barat', 'Bandung', '40134', '087867961609', 'admin', 'yanuararistya@gmail.com', 7);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

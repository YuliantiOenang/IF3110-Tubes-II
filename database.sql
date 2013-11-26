-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2013 pada 05.40
-- Versi Server: 5.5.32
-- Versi PHP: 5.4.19

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `toko_imba`
--
CREATE DATABASE IF NOT EXISTS `toko_imba` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `toko_imba`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
CREATE TABLE IF NOT EXISTS `credit_card` (
  `id_credit_card` int(10) NOT NULL AUTO_INCREMENT,
  `credit_card_number` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expired_date` date NOT NULL,
  PRIMARY KEY (`id_credit_card`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventori`
--

DROP TABLE IF EXISTS `inventori`;
CREATE TABLE IF NOT EXISTS `inventori` (
  `id_inventori` int(10) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(10) NOT NULL,
  `nama_inventori` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `harga` int(10) NOT NULL,
  PRIMARY KEY (`id_inventori`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data untuk tabel `inventori`
--

INSERT INTO `inventori` (`id_inventori`, `id_kategori`, `nama_inventori`, `jumlah`, `gambar`, `description`, `harga`) VALUES
(1, 1, 'Roti Buaya', 10, 'barang/Buaya.png', 'Roti buaya adalah hidangan Betawi berupa roti manis berbentuk buaya. Roti buaya senantiasa hadir dalam upacara pernikahan dan kenduri tradisional Betawi. Rasakan sensasi nyata Roti Buaya di lidah Anda!', 100000),
(2, 1, 'Roti Canai', 26, 'barang/Canai.png', 'Roti canai adalah sejenis roti pipih (flatbread) dengan pengaruh India, yang banyak ditemukan di Indonesia dan Malaysia. Roti ini sangat pipih karena dibuat dengan cara diputar hingga tipis, kemudian dilipat dan dipanggang dengan minyak, atau bisa pula dengan menebarkan adonan setipis mungkin di atas panggangan. Dihidangkan dengan kari kambing atau domba, roti canai akan melengkapi hari Anda dengan sempurna.', 30000),
(3, 1, 'Bolu Gulung', 19, '/barang/BolGul.png', 'Kue bolu yang dipanggang menggunakan loyang dangkal, diisi dengan selai   atau krim mentega kemudian digulung selagi masih panas sewaktu baru   diangkat dari oven untuk menjaga kelenturan sewaktu digulung dan tidak   patah. Gulungan bisa dibuka lagi kalau kue sudah agak dingin untuk diolesi   selai atau krim dari mentega dan setelah itu kue digulung kembali. Lengkapi waktu anda bersama keluarga dengan kudapan sehat nan nikmat ini.', 50000),
(4, 1, 'Muffin', 29, '/barang/Muffin.png', 'Kue khas negeri Inggris dan lahir pada zaman Victoria. Roti tradisional berbentuk gulungan, bundar dan tipis ini terbuat dari adonan roti yang diberi ragi. Paling enak kue manis ini dinikmati saat musim dingin dan disajikan bersama minuman hangat seperti teh atau kopi. Roti yang biasanya disobek dulu dan diberi olesan mentega kemudian dipanggang lagi ini sering diolesi diolesi dengan selai buah buatan sendiri untuk menambah citarasa. Dapatkan citarasa global ala dapur pribadi dalam sajian roti muffin kami!', 30000),
(5, 1, 'Baguette', 32, '/barang/FBread.png', 'Roti yang berasal dari Prancis ini adalah roti yang bentuknya lain dari roti lainnya yaitu panjang dan ukurannya yang besar, dan sangat renyah. Diameter standar baguette kami sekitar 5 atau 6 cm, dan panjang dapat mencapai 1 meter. Roti yang renyah di luar dan lembut didalam ini biasanya dipotong-potong terlebih dahulu sebelum disantap dengan berbagai pelengkap seperti mentega, keju, atau selai dan bahkan saus sphagetti. Dengan berat rata-rata 250 gram, roti ini tentu akan menyempurnakan makan pagi,siang, atau bahkan makan malam anda.', 60000),
(6, 1, 'Roti Jala', 35, '/barang/Jala.png', 'Roti yang merupakan makananan kegemaran di Malaysia dan juga di negara-negara ASEAN seperti namanya, berbentuk seperti jala. Cocok dimakan bersama kuah, bekas tempat memasak yang mempunyai beberapa lubang biasanya digunakan bagi menghasilkan roti jala yang dimasak di atas kuali leper. Roti Jala yang sering menjadi pilihan pada perayaan istimewa ini nikmat  dihidangkan dengan kari atau gulai ayam atau daging. Puaskan lidah anda dengan sensasi melayu nan kaya dengan roti jala ini.', 36000),
(7, 2, 'Coca-Cola', 10, 'barang/Buaya.png', '', 10000),
(8, 2, 'Pepsi', 10, 'barang/Buaya.png', '', 10000),
(9, 2, 'Beer', 10, 'barang/Buaya.png', '', 10000),
(10, 2, 'Fanta', 10, 'barang/Buaya.png', '', 10000),
(11, 2, 'Sprite', 10, 'barang/Buaya.png', '', 10000),
(12, 2, 'Dr. Pepper', 10, 'barang/Buaya.png', '', 10000),
(13, 3, 'Sarden Kalengan', 10, 'barang/Buaya.png', '', 10000),
(14, 3, 'Sup Kalengan', 10, 'barang/Buaya.png', '', 10000),
(15, 3, 'Buah Kalengan', 10, 'barang/Buaya.png', '', 10000),
(16, 3, 'Kacang Kalengan', 10, 'barang/Buaya.png', '', 10000),
(17, 3, 'Sayur Kalengan', 10, 'barang/Buaya.png', '', 10000),
(18, 3, 'Daging Kalengan', 10, 'barang/Buaya.png', '', 10000),
(19, 4, 'Daging', 10, 'barang/Buaya.png', '', 10000),
(20, 4, 'Seafood', 10, 'barang/Buaya.png', '', 10000),
(21, 4, 'Telur', 10, 'barang/Buaya.png', '', 10000),
(22, 4, 'Sayur', 10, 'barang/Buaya.png', '', 10000),
(23, 4, 'Buah', 10, 'barang/Buaya.png', '', 10000),
(24, 4, 'Kacang', 10, 'barang/Buaya.png', '', 10000),
(25, 5, 'Palu', 10, 'barang/Buaya.png', '', 10000),
(26, 5, 'Screwdriver', 10, 'barang/Buaya.png', '', 10000),
(27, 5, 'Sapu', 10, 'barang/Buaya.png', '', 10000),
(28, 5, 'Ember', 10, 'barang/Buaya.png', '', 10000),
(29, 5, 'Gayung', 10, 'barang/Buaya.png', '', 10000),
(30, 5, 'Obeng', 10, 'barang/Buaya.png', '', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(10) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'roti'),
(2, 'minuman'),
(3, 'kalengan'),
(4, 'segar'),
(5, 'peralatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE IF NOT EXISTS `pengguna` (
  `id_pengguna` int(10) NOT NULL AUTO_INCREMENT,
  `nama_pengguna` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nomor_hp` varchar(50) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `kota_kabupaten` varchar(100) NOT NULL,
  `kode_pos` varchar(10) NOT NULL,
  `total_transaksi` int(11) NOT NULL,
  PRIMARY KEY (`id_pengguna`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `email`, `nomor_hp`, `alamat`, `provinsi`, `kota_kabupaten`, `kode_pos`, `total_transaksi`) VALUES
(4, 'wkwk', 'aaa', 'aa', 'aa@aa.com', '12198', 'asaunu', 'asausah', 'asahsua', '1111', 100),
(5, 'harits elfahmi', 'aaaaa', '70c881d4a26984ddce795f6f71817c9cf4480e79', 'adilelfahmi@gmail.com', '0', '', '', '', '0', 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` int(10) NOT NULL AUTO_INCREMENT,
  `id_pengguna` int(10) NOT NULL,
  `id_inventori` int(10) NOT NULL,
  `jumlah` int(100) NOT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `id_pengguna` (`id_pengguna`),
  KEY `id_inventori` (`id_inventori`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pengguna`, `id_inventori`, `jumlah`) VALUES
(29, 4, 1, 3),
(30, 4, 2, 4),
(31, 4, 3, 5),
(32, 4, 4, 6),
(33, 4, 5, 7),
(34, 4, 6, 8),
(35, 4, 7, 9),
(36, 4, 8, 10),
(37, 4, 9, 11),
(38, 4, 10, 12),
(39, 4, 11, 13),
(40, 4, 12, 14),
(41, 4, 13, 15),
(42, 4, 14, 16),
(43, 4, 15, 17),
(44, 4, 16, 18),
(45, 4, 17, 19),
(46, 4, 18, 20),
(47, 4, 19, 21),
(48, 4, 20, 22),
(49, 4, 21, 23),
(50, 4, 22, 24),
(51, 4, 23, 25),
(52, 4, 24, 26),
(53, 4, 25, 27),
(54, 4, 26, 28),
(55, 4, 27, 29),
(56, 4, 28, 30),
(57, 4, 29, 31),
(58, 4, 30, 32);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `inventori`
--
ALTER TABLE `inventori`
  ADD CONSTRAINT `inventori_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_inventori`) REFERENCES `inventori` (`id_inventori`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

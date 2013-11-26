-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2013 pada 13.11
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
  `total_transaksi` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_inventori`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data untuk tabel `inventori`
--

INSERT INTO `inventori` (`id_inventori`, `id_kategori`, `nama_inventori`, `jumlah`, `gambar`, `description`, `harga`, `total_transaksi`) VALUES
(1, 1, 'Roti Buaya', 10, 'barang/Buaya.png', 'Roti buaya adalah hidangan Betawi berupa roti manis berbentuk buaya. Roti buaya senantiasa hadir dalam upacara pernikahan dan kenduri tradisional Betawi. Rasakan sensasi nyata Roti Buaya di lidah Anda!', 100000, 0),
(2, 1, 'Roti Canai', 26, 'barang/Canai.png', 'Roti canai adalah sejenis roti pipih (flatbread) dengan pengaruh India, yang banyak ditemukan di Indonesia dan Malaysia. Roti ini sangat pipih karena dibuat dengan cara diputar hingga tipis, kemudian dilipat dan dipanggang dengan minyak, atau bisa pula dengan menebarkan adonan setipis mungkin di atas panggangan. Dihidangkan dengan kari kambing atau domba, roti canai akan melengkapi hari Anda dengan sempurna.', 30000, 0),
(3, 1, 'Bolu Gulung', 19, '/barang/BolGul.png', 'Kue bolu yang dipanggang menggunakan loyang dangkal, diisi dengan selai   atau krim mentega kemudian digulung selagi masih panas sewaktu baru   diangkat dari oven untuk menjaga kelenturan sewaktu digulung dan tidak   patah. Gulungan bisa dibuka lagi kalau kue sudah agak dingin untuk diolesi   selai atau krim dari mentega dan setelah itu kue digulung kembali. Lengkapi waktu anda bersama keluarga dengan kudapan sehat nan nikmat ini.', 50000, 0),
(4, 1, 'Muffin', 29, '/barang/Muffin.png', 'Kue khas negeri Inggris dan lahir pada zaman Victoria. Roti tradisional berbentuk gulungan, bundar dan tipis ini terbuat dari adonan roti yang diberi ragi. Paling enak kue manis ini dinikmati saat musim dingin dan disajikan bersama minuman hangat seperti teh atau kopi. Roti yang biasanya disobek dulu dan diberi olesan mentega kemudian dipanggang lagi ini sering diolesi diolesi dengan selai buah buatan sendiri untuk menambah citarasa. Dapatkan citarasa global ala dapur pribadi dalam sajian roti muffin kami!', 30000, 0),
(5, 1, 'Baguette', 32, '/barang/FBread.png', 'Roti yang berasal dari Prancis ini adalah roti yang bentuknya lain dari roti lainnya yaitu panjang dan ukurannya yang besar, dan sangat renyah. Diameter standar baguette kami sekitar 5 atau 6 cm, dan panjang dapat mencapai 1 meter. Roti yang renyah di luar dan lembut didalam ini biasanya dipotong-potong terlebih dahulu sebelum disantap dengan berbagai pelengkap seperti mentega, keju, atau selai dan bahkan saus sphagetti. Dengan berat rata-rata 250 gram, roti ini tentu akan menyempurnakan makan pagi,siang, atau bahkan makan malam anda.', 60000, 0),
(6, 1, 'Roti Jala', 35, '/barang/Jala.png', 'Roti yang merupakan makananan kegemaran di Malaysia dan juga di negara-negara ASEAN seperti namanya, berbentuk seperti jala. Cocok dimakan bersama kuah, bekas tempat memasak yang mempunyai beberapa lubang biasanya digunakan bagi menghasilkan roti jala yang dimasak di atas kuali leper. Roti Jala yang sering menjadi pilihan pada perayaan istimewa ini nikmat  dihidangkan dengan kari atau gulai ayam atau daging. Puaskan lidah anda dengan sensasi melayu nan kaya dengan roti jala ini.', 36000, 0),
(7, 2, 'Coca-Cola', 10, 'barang/Buaya.png', '', 10000, 0),
(8, 2, 'Pepsi', 10, 'barang/Buaya.png', '', 10000, 0),
(9, 2, 'Beer', 10, 'barang/Buaya.png', '', 10000, 0),
(10, 2, 'Fanta', 10, 'barang/Buaya.png', '', 10000, 0),
(11, 2, 'Sprite', 10, 'barang/Buaya.png', '', 10000, 0),
(12, 2, 'Dr. Pepper', 10, 'barang/Buaya.png', '', 10000, 0),
(13, 3, 'Sarden Kalengan', 10, 'barang/Buaya.png', '', 10000, 0),
(14, 3, 'Sup Kalengan', 10, 'barang/Buaya.png', '', 10000, 0),
(15, 3, 'Buah Kalengan', 10, 'barang/Buaya.png', '', 10000, 0),
(16, 3, 'Kacang Kalengan', 10, 'barang/Buaya.png', '', 10000, 0),
(17, 3, 'Sayur Kalengan', 10, 'barang/Buaya.png', '', 10000, 0),
(18, 3, 'Daging Kalengan', 10, 'barang/Buaya.png', '', 10000, 0),
(19, 4, 'Daging', 10, 'barang/Buaya.png', '', 10000, 0),
(20, 4, 'Seafood', 10, 'barang/Buaya.png', '', 10000, 0),
(21, 4, 'Telur', 10, 'barang/Buaya.png', '', 10000, 0),
(22, 4, 'Sayur', 10, 'barang/Buaya.png', '', 10000, 0),
(23, 4, 'Buah', 10, 'barang/Buaya.png', '', 10000, 0),
(24, 4, 'Kacang', 10, 'barang/Buaya.png', '', 10000, 0),
(25, 5, 'Palu', 10, 'barang/Buaya.png', '', 10000, 0),
(26, 5, 'Screwdriver', 10, 'barang/Buaya.png', '', 10000, 0),
(27, 5, 'Sapu', 10, 'barang/Buaya.png', '', 10000, 0),
(28, 5, 'Ember', 10, 'barang/Buaya.png', '', 10000, 0),
(29, 5, 'Gayung', 10, 'barang/Buaya.png', '', 10000, 0),
(30, 5, 'Obeng', 10, 'barang/Buaya.png', '', 10000, 0);

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
-- Struktur dari tabel `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `provinsi` varchar(30) NOT NULL,
  `kotakabupaten` varchar(30) NOT NULL,
  `kodepos` int(11) NOT NULL,
  `nomor_handphone` int(20) NOT NULL,
  `creditcardnum` int(11) NOT NULL DEFAULT '0',
  `creditcardname` varchar(50) DEFAULT NULL,
  `expireddate` date DEFAULT NULL,
  `privilege` enum('Admin','User') NOT NULL DEFAULT 'User',
  `transaction` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `full_name`, `alamat`, `provinsi`, `kotakabupaten`, `kodepos`, `nomor_handphone`, `creditcardnum`, `creditcardname`, `expireddate`, `privilege`, `transaction`) VALUES
('Hafizh', 'asda@adsaas.com', '11111111', 'alalala s', '2qwewqeqwe', 'qweeq', 'qwew', 1123213, 1123213, 4444, 'HafizhA', '1992-12-12', 'User', 0),
('Hafizhs', 'asda@adsaas.comq', '', '', '', '', '', 0, 0, 1232131, 'HafizhAdi', '1212-12-12', 'User', 0),
('lala', 'email', '', '', '', '', '', 0, 0, 1232131, 'HafizhAdi', '1212-12-12', 'User', 0);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `inventori`
--
ALTER TABLE `inventori`
  ADD CONSTRAINT `inventori_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

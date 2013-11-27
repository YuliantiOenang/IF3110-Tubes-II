-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2013 at 10:30 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `wbd1`
--
CREATE DATABASE IF NOT EXISTS `wbd1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `wbd1`;

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE IF NOT EXISTS `anggota` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nomorhp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `provinsi` varchar(20) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `kodepos` int(11) NOT NULL,
  `email` text NOT NULL,
  `foto` text NOT NULL,
  `jmlhtransaksi` int(11) NOT NULL,
  `tipe` int(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`username`, `password`, `nama`, `nomorhp`, `alamat`, `provinsi`, `kota`, `kodepos`, `email`, `foto`, `jmlhtransaksi`, `tipe`) VALUES
('rifki', 'kikikiki', 'Rifki Afina Putri', '0890980999', 'jalan mana aja', 'jawa barat', 'bandung...', 490940, 'rifki@fina-put.ri', '1378714_10201562960288197_1397267956_a.jpg', 0, 0),
('identityope', 'opeopeope', 'Taufik Hidayat', '087825996141-1', 'jalan ganesha 10', 'jawa barat', 'Bandung', 40262, 'identityope@gmail.com', 'avatars-000051574937-7m4ugf-t200x200.jpg', 0, 0),
('cgunardi', 'opeopeope', 'Taufik Hidayat', '08997978829', 'jakarta', 'dki', 'jakarta', 11111, 'christian_gunardi@hotmail.com', '', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `harga` double NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `terjual` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1000 ;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `gambar`, `kategori`, `harga`, `jumlah`, `keterangan`, `terjual`) VALUES
(1, 'Beras 3 kg', 'images/beras.jpg', 'Makanan Pokok', 12000, 0, 'Beras super langsung dari sawah pilihan.', 12),
(2, 'Momogi Rasa Keju', 'images/momogikeju.jpg', 'Makanan Ringan', 1000, 100, 'Momogi rasa keju. Nagih abis lho.', 10),
(3, 'Momogi Rasa Jagung Bakar', 'images/momogijagung.jpg', 'Makanan Ringan', 1000, 100, 'Momogi rasa jagung bakar. Temennya momogi keju.', 10),
(4, 'Marimas', 'images/marimas.jpg', 'Minuman', 500, 35, 'Marimaaas~ aww! Minuman menyegarkan. Bukan telenovela.', 10),
(5, 'Fanta', 'images/fanta.jpg', 'Minuman', 500, 1, 'Minuman soda yang bisa bikin gembira.', 10),
(6, 'Bigcola', 'images/bigcola.jpg', 'Minuman', 3000, 4, 'Cola tapi big. Bigcola.', 15),
(7, 'Katel', 'images/katel.jpg', 'Alat Dapur', 5000, 27, 'Katel atau disebut juga wajan, adalah alat untuk memasak.', 11),
(8, 'Panci', 'images/panci.jpg', 'Alat Dapur', 8000, 12, 'Panci untuk masak yang berkuah-kuah. Warnanya juga pink unyu lucu gitu.', 10),
(9, 'Indomie', 'images/indomie.jpg', 'Makanan Siap Saji', 800, 99, 'Makanan favorit mahasiswa terutama anak-anak kosan. Lumayan kalau udah bosen pinter bisa dimakan setiap hari.', 11),
(10, 'Popmie', 'images/popmie.jpg', 'Makanan Siap Saji', 2000, 23, 'Saingannya indomie, lebih portable, bisa dibawa kemana-mana.', 10),
(11, 'Buku Binder', 'images/binder.jpg', 'Alat Kantor', 5000, 6, 'Buku binder buat nyatet.', 12),
(12, 'Baju Koko', 'images/bajukoko.jpg', 'Pakaian', 50000, 0, 'Baju keren buat cowok-cowok kece anak gaul masjid.', 14),
(13, 'Tahu', 'images/tahu.jpg', 'Makanan Pokok', 500, 95, 'Makanan yang terbuat dari kedelai. Temennya tempe.', 15),
(14, 'Tempe', 'images/tempe.jpg', 'Makanan Pokok', 800, 88, 'Makanan yang terbuat dari kedelai. Temennya tahu.', 52),
(15, 'Jaket', 'images/jaket.jpg', 'Pakaian', 80000, 12, 'Jaket trendy untuk menghangatkan tubuhmu.', 11),
(16, 'Kaos', 'images/kaos.jpg', 'Pakaian', 60000, 13, 'Kaos santai dengan berbagai pilihan warna dan ukuran.', 11),
(17, 'Kemeja', 'images/kemeja.jpg', 'Pakaian', 80000, 10, 'Kemeja rapi dan gaul.', 10),
(18, 'Nyam Nyam', 'images/nyamnyam.jpg', 'Makanan Ringan', 1500, 61, 'Jajanan masa kecil.', 9),
(19, 'Pulpen', 'images/pulpen.jpg', 'Alat Kantor', 2000, 50, 'Pulpen dengan tinta pilihan yang cocok untuk semua kertas.', 0),
(20, 'Tempat Pensil', 'images/tempatpensil.jpg', 'Alat Kantor', 10000, 60, 'Tempat untuk menaruh pensil dan alat tulis lainnya.', 0),
(21, 'Aqua', 'images/aqua.jpg', 'Minuman', 2500, 32, 'Air mineral dari mata air pilihan.', 12),
(22, 'Coca Cola', 'images/cocacola.jpg', 'Minuman', 8000, 71, 'Minuman soda berwarna coklat.', 12),
(23, 'Floridina', 'images/floridina.jpg', 'Minuman', 6000, 70, 'Minuman rasa jeruk dengan bulir jeruk asli.', 10),
(24, 'Fruit Tea', 'images/fruittea.jpg', 'Minuman', 6500, 70, 'Teh dengan aneka rasa buah-buahan.', 13),
(25, 'Mogu Mogu', 'images/mogumogu.jpg', 'Minuman', 5500, 48, 'Minuman manis aneka rasa.', 2),
(26, 'Nescafe', 'images/nescafe.jpg', 'Minuman', 4000, 55, 'Minuman yang setia menemani untuk begadang ngerjain tubes.', 10),
(27, 'Nu Milk Tea', 'images/numilktea.jpg', 'Minuman', 5000, 60, 'Teh susu.', 10),
(28, 'Okky Jelly Drink', 'images/okkyjelly.jpg', 'Minuman', 1000, 100, 'Minuman penunda lapar.', 10),
(29, 'Pocari Sweat', 'images/pocarisweat.jpg', 'Minuman', 7000, 78, 'Minuman elektrolit.', 12),
(30, 'Pop Ice', 'images/popice.jpg', 'Minuman', 500, 79, 'Pop ice blender seger.', 11),
(31, 'Sirup ABC', 'images/sirupabc.jpg', 'Minuman', 20000, 60, 'Sirup dengan berbagai pilihan rasa.', 10),
(32, 'Sirup Marjan', 'images/sirupmarjan.jpg', 'Minuman', 25000, 70, 'Temennya sirup ABC.', 10),
(33, 'Sprite', 'images/sprite.jpg', 'Minuman', 12000, 54, 'Soda bening pembawa kegembiraan.', 1),
(34, 'Teh Botol', 'images/tehbotol.jpg', 'Minuman', 3000, 80, 'Teh di dalam botol.', 0),
(35, 'Teh Gelas', 'images/tehgelas.jpg', 'Minuman', 1000, 80, 'Teh di dalam gelas.', 10),
(36, 'Teh Kotak', 'images/tehkotak.jpg', 'Minuman', 4000, 70, 'Teh di dalam kotak.', 10),
(37, 'Ultra Milk', 'images/ultramilk.jpg', 'Minuman', 5000, 69, 'Susu coklat di dalam kotak.', 11);

-- --------------------------------------------------------

--
-- Table structure for table `kartu_kredit`
--

CREATE TABLE IF NOT EXISTS `kartu_kredit` (
  `owner` varchar(20) NOT NULL,
  `card_number` char(16) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `expired` varchar(10) NOT NULL,
  PRIMARY KEY (`card_number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kartu_kredit`
--

INSERT INTO `kartu_kredit` (`owner`, `card_number`, `nama`, `expired`) VALUES
('cgunardi', '1234567890123456', 'Christian Gunardi', '2013-10-31'),
('rifki', '1290091827819281', 'Rifki Afina Putri', '20-20-2020'),
('identityope', '1212123123123453', 'Taufik Hidayat', '2013-11-08');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `username` varchar(30) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `tambahan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 27, 2013 at 08:27 PM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `ruserba`
--

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
  `tipe` varchar(10) NOT NULL DEFAULT 'User',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`username`, `password`, `nama`, `nomorhp`, `alamat`, `provinsi`, `kota`, `kodepos`, `email`, `foto`, `jmlhtransaksi`, `tipe`) VALUES
('rifki', 'ef592c87c9ff628ae52bf96a796de2f3', 'Rifki Afina Putri', '0890980999', 'jalan mana aja', 'jawa barat', 'bandung...', 490940, 'rifki@fina-put.ri', '1378714_10201562960288197_1397267956_a.jpg', 0, 'User'),
('identityope', '8dd521a3163fce68bc713e5ad951ec1a', 'Taufik Hidayat', '087825996140', 'jalan mana aja', 'jawa barat', 'Bandung', 40262, 'identityope@gmail.com', '', 0, 'User'),
('terserah', 'nananana', 'nana nana', '123456789', 'dimana ya', 'jawa barat', 'bandung', 1234567, 'kiki@haha.com', '', 0, 'User'),
('sahesahe', 'hehehehe', 'harits sahe', '12345678', 'cisitu', 'jabar', 'bandung', 12345, 'sahe@imba.com', '', 0, 'Admin'),
('cobacoba', 'lalalala', 'jaja jaja', '98989', 'dimana coba', 'disitu pokoknya', 'jakarta', 909090, 'apa@aja.com', '', 0, 'User');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `gambar`, `kategori`, `harga`, `jumlah`, `keterangan`, `terjual`) VALUES
(1, 'Beras 3 kg', 'images/beras.jpg', 'Makanan Pokok', 12000, 10, 'Beras super langsung dari sawah pilihan.', 0),
(2, 'Momogi Rasa Keju', 'images/momogikeju.jpg', 'Makanan Ringan', 1000, 100, 'Momogi rasa keju. Nagih abis lho.', 0),
(3, 'Momogi Rasa Jagung Bakar', 'images/momogijagung.jpg', 'Makanan Ringan', 1000, 100, 'Momogi rasa jagung bakar. Temennya momogi keju.', 0),
(4, 'Marimas', 'images/marimas.jpg', 'Minuman', 500, 38, 'Marimaaas~ aww! Minuman menyegarkan. Bukan telenovela.', 2),
(5, 'Fanta', 'images/fanta.jpg', 'Minuman', 500, 9, 'Minuman soda yang bisa bikin gembira.', 1),
(6, 'Bigcola', 'images/bigcola.jpg', 'Minuman', 3000, 10, 'Cola tapi big. Bigcola.', 2),
(7, 'Katel', 'images/katel.jpg', 'Alat Dapur', 5000, 30, 'Katel atau disebut juga wajan, adalah alat untuk memasak.', 0),
(8, 'Panci', 'images/panci.jpg', 'Alat Dapur', 8000, 12, 'Panci untuk masak yang berkuah-kuah. Warnanya juga pink unyu lucu gitu.', 0),
(9, 'Indomie', 'images/indomie.jpg', 'Makanan Siap Saji', 800, 100, 'Makanan favorit mahasiswa terutama anak-anak kosan. Lumayan kalau udah bosen pinter bisa dimakan setiap hari.', 99),
(10, 'Popmie', 'images/popmie.jpg', 'Makanan Siap Saji', 2000, 23, 'Saingannya indomie, lebih portable, bisa dibawa kemana-mana.', 0),
(11, 'Buku Binder', 'images/binder.jpg', 'Alat Kantor', 5000, 11, 'Buku binder buat nyatet.', 0),
(12, 'Baju Koko', 'images/bajukoko.jpg', 'Pakaian', 50000, 10, 'Baju keren buat cowok-cowok kece anak gaul masjid.', 0),
(13, 'Tahu', 'images/tahu.jpg', 'Makanan Pokok', 500, 100, 'Makanan yang terbuat dari kedelai. Temennya tempe.', 10),
(14, 'Tempe', 'images/tempe.jpg', 'Makanan Pokok', 800, 90, 'Makanan yang terbuat dari kedelai. Temennya tahu.', 50),
(15, 'Jaket', 'images/jaket.jpg', 'Pakaian', 80000, 15, 'Jaket trendy untuk menghangatkan tubuhmu.', 0),
(16, 'Kaos', 'images/kaos.jpg', 'Pakaian', 60000, 15, 'Kaos santai dengan berbagai pilihan warna dan ukuran.', 0),
(17, 'Kemeja', 'images/kemeja.jpg', 'Pakaian', 80000, 10, 'Kemeja rapi dan gaul.', 0),
(18, 'Nyam Nyam', 'images/nyamnyam.jpg', 'Makanan Ringan', 1500, 70, 'Jajanan masa kecil.', 8),
(19, 'Pulpen', 'images/pulpen.jpg', 'Alat Kantor', 2000, 50, 'Pulpen dengan tinta pilihan yang cocok untuk semua kertas.', 0),
(20, 'Tempat Pensil', 'images/tempatpensil.jpg', 'Alat Kantor', 10000, 60, 'Tempat untuk menaruh pensil dan alat tulis lainnya.', 0),
(21, 'Aqua', 'images/aqua.jpg', 'Minuman', 2500, 50, 'Air mineral dari mata air pilihan.', 0),
(22, 'Coca Cola', 'images/cocacola.jpg', 'Minuman', 8000, 75, 'Minuman soda berwarna coklat.', 0),
(23, 'Floridina', 'images/floridina.jpg', 'Minuman', 6000, 70, 'Minuman rasa jeruk dengan bulir jeruk asli.', 0),
(24, 'Fruit Tea', 'images/fruittea.jpg', 'Minuman', 6500, 75, 'Teh dengan aneka rasa buah-buahan.', 0),
(25, 'Mogu Mogu', 'images/mogumogu.jpg', 'Minuman', 5500, 50, 'Minuman manis aneka rasa.', 0),
(26, 'Nescafe', 'images/nescafe.jpg', 'Minuman', 4000, 55, 'Minuman yang setia menemani untuk begadang ngerjain tubes.', 0),
(27, 'Nu Milk Tea', 'images/numilktea.jpg', 'Minuman', 5000, 60, 'Teh susu.', 0),
(28, 'Okky Jelly Drink', 'images/okkyjelly.jpg', 'Minuman', 1000, 100, 'Minuman penunda lapar.', 0),
(29, 'Pocari Sweat', 'images/pocarisweat.jpg', 'Minuman', 7000, 80, 'Minuman elektrolit.', 0),
(30, 'Pop Ice', 'images/popice.jpg', 'Minuman', 500, 80, 'Pop ice blender seger.', 0),
(31, 'Sirup ABC', 'images/sirupabc.jpg', 'Minuman', 20000, 60, 'Sirup dengan berbagai pilihan rasa.', 0),
(32, 'Sirup Marjan', 'images/sirupmarjan.jpg', 'Minuman', 25000, 70, 'Temennya sirup ABC.', 0),
(33, 'Sprite', 'images/sprite.jpg', 'Minuman', 12000, 55, 'Soda bening pembawa kegembiraan.', 0),
(34, 'Teh Botol', 'images/tehbotol.jpg', 'Minuman', 3000, 80, 'Teh di dalam botol.', 0),
(35, 'Teh Gelas', 'images/tehgelas.jpg', 'Minuman', 1000, 80, 'Teh di dalam gelas.', 0),
(36, 'Teh Kotak', 'images/tehkotak.jpg', 'Minuman', 4000, 70, 'Teh di dalam kotak.', 0),
(37, 'Ultra Milk', 'images/ultramilk.jpg', 'Minuman', 5000, 70, 'Susu coklat di dalam kotak.', 0),
(38, 'Gaun Minion', 'images/gaunminion.png', 'Pakaian', 500000, 20, 'Gaun unyu bertema minion.', 200);

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
('', '09172629737', '', ''),
('rifki', '1290091827819281', 'Rifki Afina Putri', '20-20-2020'),
('identityope', '9372894563901230', 'Taufik Hidayat', '12-12-2013'),
('terserah', '1234567890123456', 'Rifki Afina Putri', '2013-11-05');

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

--
-- Dumping data for table `transaksi`
--


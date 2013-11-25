-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 29 Okt 2013 pada 13.30
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `database`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `harga` int(10) NOT NULL,
  `sold` int(255) NOT NULL,
  `stok` int(255) NOT NULL,
  `image` varchar(60) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `keterangan` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `harga`, `sold`, `stok`, `image`, `kategori`, `keterangan`) VALUES
(1, 'malkist', 5000, 3, 7, 'img/snack/malkist.jpg', 'snack', 'biskuit ditaburi dengan malt'),
(2, 'kacangatom', 2000, 4, 6, 'img/snack/kacangatom.jpg', 'snack', 'kacang di dalam lapisan tepung'),
(3, 'tango', 6000, 2, 8, 'img/snack/tango.jpg', 'snack', 'wafer berlapis coklat'),
(4, 'chiki', 1000, 1, 9, 'img/snack/chiki.jpg', 'snack', 'makanan ringan berbentuk bola'),
(5, 'oreo', 4000, 7, 3, 'img/snack/oreo.jpg', 'snack', 'biskiut coklat dengan cream susu'),
(6, 'milkshake', 10000, 3, 7, 'img/minuman/milkshake.jpg', 'minuman', 'susu dengan rasa buah'),
(7, 'kopi', 6000, 9, 1, 'img/minuman/kopi.jpg', 'minuman', 'minuman berkafein pencegah kantuk'),
(8, 'esteh', 2500, 8, 2, 'img/minuman/esteh.jpg', 'minuman', 'teh manis dingin'),
(9, 'jus', 5000, 4, 6, 'img/minuman/jus.jpg', 'minuman', 'jus buah'),
(10, 'beer', 15000, 1, 9, 'img/minuman/beer.jpg', 'minuman', 'minuman beralkohol'),
(11, 'ayam', 12000, 4, 6, 'img/makanan/ayam.jpg', 'makanan', 'ayam goreng'),
(12, 'burger', 8000, 2, 8, 'img/makanan/burger.jpg', 'makanan', 'beef cheese burger'),
(13, 'pizza', 20000, 3, 7, 'img/makanan/pizza.jpg', 'makanan', 'pizza bertoping aneka sayur dan daging'),
(14, 'steak', 18000, 4, 6, 'img/makanan/steak.jpg', 'makanan', 'daging panggang'),
(15, 'spageti', 13000, 2, 8, 'img/makanan/spageti.jpg', 'makanan', 'mie dengan saus khas italia'),
(16, 'kasur', 500000, 1, 9, 'img/properti/kasur.jpg', 'properti', 'tempat untuk tidur'),
(17, 'sofa', 300000, 2, 8, 'img/properti/sofa.jpg', 'properti', 'tempat duduk yang nyaman'),
(18, 'lemari', 400000, 1, 9, 'img/properti/lemari.jpg', 'properti', 'tempat menyimpan barang'),
(19, 'meja', 150000, 2, 8, 'img/properti/meja.jpg', 'properti', 'tempat menaruh barang'),
(20, 'kursi', 100000, 4, 6, 'img/properti/kursi.jpg', 'properti', 'tempat duduk'),
(21, 'melon', 20000, 7, 3, 'img/buah/melon.jpg', 'buah', 'buah melon segar'),
(22, 'apel', 2000, 4, 6, 'img/buah/apel.jpg', 'buah', 'buah apel segar'),
(23, 'stroberi', 1000, 8, 2, 'img/buah/stroberi.jpg', 'buah', 'buah stroberi segar'),
(24, 'jeruk', 1500, 9, 1, 'img/buah/jeruk.jpg', 'buah', 'buah jeruk segar'),
(25, 'semangka', 6000, 3, 7, 'img/buah/semangka.jpg', 'buah', 'buah semangka segar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `nohp` varchar(60) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `provinsi` varchar(60) NOT NULL,
  `kota` varchar(60) NOT NULL,
  `kodepos` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `transaksi` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `nama`, `nohp`, `alamat`, `provinsi`, `kota`, `kodepos`, `email`, `password`, `transaksi`, `balance`) VALUES
(1, 'andreas', 'andreas dwi', '081234567890', 'Jln. Ganesha 10', 'Jawa Barat', 'Bandung', '40116', 'andreas.dwi@gmail.com', '12345678', 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

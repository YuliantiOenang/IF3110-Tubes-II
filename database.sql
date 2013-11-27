-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2013 pada 10.18
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
-- Struktur dari tabel `membeli`
--

CREATE TABLE IF NOT EXISTS `membeli` (
  `id_pembelian` int(30) NOT NULL AUTO_INCREMENT,
  `id_user` int(30) NOT NULL,
  `id_barang` int(30) NOT NULL,
  `jumlah` int(30) NOT NULL,
  PRIMARY KEY (`id_pembelian`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `harga`, `sold`, `stok`, `image`, `kategori`) VALUES
(1, 'malkist', 5000, 3, 7, 'img/snack/malkist.jpg', 'snack'),
(2, 'kacangatom', 2000, 4, 6, 'img/snack/kacangatom.jpg', 'snack'),
(3, 'tango', 6000, 2, 8, 'img/snack/tango.jpg', 'snack'),
(4, 'chiki', 1000, 1, 9, 'img/snack/chiki.jpg', 'snack'),
(5, 'oreo', 4000, 7, 3, 'img/snack/oreo.jpg', 'snack'),
(6, 'milkshake', 10000, 3, 7, 'img/minuman/milkshake.jpg', 'minuman'),
(7, 'kopi', 6000, 9, 1, 'img/minuman/kopi.jpg', 'minuman'),
(8, 'esteh', 2500, 8, 2, 'img/minuman/esteh.jpg', 'minuman'),
(9, 'jus', 5000, 4, 6, 'img/minuman/jus.jpg', 'minuman'),
(10, 'beer', 15000, 1, 9, 'img/minuman/beer.jpg', 'minuman'),
(11, 'ayam', 12000, 4, 6, 'img/makanan/ayam.jpg', 'makanan'),
(12, 'burger', 8000, 2, 8, 'img/makanan/burger.jpg', 'makanan'),
(13, 'pizza', 20000, 3, 7, 'img/makanan/pizza.jpg', 'makanan'),
(14, 'steak', 18000, 4, 6, 'img/makanan/steak.jpg', 'makanan'),
(15, 'spageti', 13000, 2, 8, 'img/makanan/spageti.jpg', 'makanan'),
(16, 'kasur', 500000, 1, 9, 'img/properti/kasur.jpg', 'properti'),
(17, 'sofa', 300000, 2, 8, 'img/properti/sofa.jpg', 'properti'),
(18, 'lemari', 400000, 1, 9, 'img/properti/lemari.jpg', 'properti'),
(19, 'meja', 150000, 2, 8, 'img/properti/meja.jpg', 'properti'),
(20, 'kursi', 100000, 4, 6, 'img/properti/kursi.jpg', 'properti'),
(21, 'melon', 20000, 7, 3, 'img/buah/melon.jpg', 'buah'),
(22, 'apel', 2000, 4, 6, 'img/buah/apel.jpg', 'buah'),
(23, 'stroberi', 1000, 8, 2, 'img/buah/stroberi.jpg', 'buah'),
(24, 'jeruk', 1500, 9, 1, 'img/buah/jeruk.jpg', 'buah'),
(25, 'semangka', 6000, 3, 7, 'img/buah/semangka.jpg', 'buah');

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
  `role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `nama`, `nohp`, `alamat`, `provinsi`, `kota`, `kodepos`, `email`, `password`, `transaksi`, `balance`, `role`) VALUES
(1, 'lubis', 'sucipto', '08292934634', 'Jln. Ganesha 10', 'Jawa Barat', 'Bandung', '40116', 'lubis@gmail.com', '12345678', 0, 0, NULL),
(2, 'evan', 'budianto', '0852929236235', 'bla bla', 'JB', 'Bandung', '86798', 'dkjfsd@fgdf.vom', '12345678', 0, 0, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

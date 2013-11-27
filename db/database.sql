-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 29 Okt 2013 pada 11.20
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
  `keterangan` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `harga`, `sold`, `stok`, `image`, `kategori`, `keterangan`) VALUES
(1, 'malkist', 5000, 3, 7, 'assets/img/snack/malkist.jpg', 'snack', 'tes keterangan'),
(2, 'kacangatom', 2000, 4, 6, 'assets/img/snack/kacangatom.jpg', 'snack', 'keterangan snack'),
(3, 'tango', 6000, 2, 8, 'assets/img/snack/tango.jpg', 'snack', 'keterangan snack'),
(4, 'chiki', 1000, 1, 9, 'assets/img/snack/chiki.jpg', 'snack', 'keterangan snack'),
(5, 'oreo', 4000, 7, 3, 'assets/img/snack/oreo.jpg', 'snack', 'keterangan snack'),
(6, 'milkshake', 10000, 3, 7, 'assets/img/minuman/milkshake.jpg', 'minuman', 'keterangan minuman'),
(7, 'kopi', 6000, 9, 1, 'assets/img/minuman/kopi.jpg', 'minuman', 'keterangan minuman'),
(8, 'esteh', 2500, 8, 2, 'assets/img/minuman/esteh.jpg', 'minuman', 'keterangan minuman'),
(9, 'jus', 5000, 4, 6, 'assets/img/minuman/jus.jpg', 'minuman', 'keterangan minuman'),
(10, 'beer', 15000, 1, 9, 'assets/img/minuman/beer.jpg', 'minuman', 'keterangan minuman'),
(11, 'ayam', 12000, 4, 6, 'assets/img/makanan/ayam.jpg', 'makanan', 'keterangan makanan'),
(12, 'burger', 8000, 2, 8, 'assets/img/makanan/burger.jpg', 'makanan', 'A cheeseburger is a hamburger topped with cheese'),
(13, 'pizza', 20000, 3, 7, 'assets/img/makanan/pizza.jpg', 'makanan', 'an oven-baked, flat, round bread typically topped with a tomato sauce, cheese and various toppings.'),
(14, 'steak', 18000, 4, 6, 'assets/img/makanan/steak.jpg', 'makanan', 'a cut of beef sliced perpendicular to the muscle fibers, or of fish cut perpendicular to the spine.'),
(15, 'spageti', 13000, 2, 8, 'assets/img/makanan/spageti.jpg', 'makanan', 'a long, thin, cylindrical pasta of Italian and Sicilian origin. Spaghetti is made of semolina or flour and water.'),
(16, 'kasur', 500000, 1, 9, 'assets/img/properti/kasur.jpg', 'properti', 'produk manufaktur untuk tidur atau berbaring, yang terdiri dari bahan elastis dan ditutupi dengan kain luar atau kain kasur. Di negara maju, biasanya ditetapkan sebagai bagian dari tempat tidur dan ditempatkan pada dasar.'),
(17, 'sofa', 300000, 2, 8, 'assets/img/properti/sofa.jpg', 'properti', '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(18, 'lemari', 400000, 1, 9, 'assets/img/properti/lemari.jpg', 'properti', '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(19, 'meja', 150000, 2, 8, 'assets/img/properti/meja.jpg', 'properti', '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(20, 'kursi', 100000, 4, 6, 'assets/img/properti/kursi.jpg', 'properti', '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(21, 'melon', 20000, 7, 3, 'assets/img/buah/melon.jpg', 'buah', 'dimakan segar sebagai buah meja atau diiris-iris sebagai campuran es buah. Bagian yang dimakan adalah daging buah (mesokarp). Teksturnya lunak, berwarna putih sampai merah'),
(22, 'apel', 2000, 4, 6, 'assets/img/buah/apel.jpg', 'buah', 'apel bagus dimakan mentah-mentah (tak dimasak), dan juga digunakan banyak jenis makanan pesta. Apel dimasak sampai lembek untuk dibuat saus apel. Apel juga dibuat untuk menjadi minuman sari buah apel.'),
(23, 'stroberi', 1000, 8, 2, 'assets/img/buah/stroberi.jpg', 'buah', 'Secara umum buah ini bukanlah buah, melainkan buah palsu,artinya daging buahnya tidak berasal dari ovari tanaman tapi dari bagian bawah hypanthium yang berbentuk mangkok tempat ovari tanaman itu berada.'),
(24, 'jeruk', 1500, 9, 1, 'assets/img/buah/jeruk.jpg', 'buah', ' buah yang berdaging dengan rasa masam yang segar, meskipun banyak di antara anggotanya yang memiliki rasa manis.'),
(25, 'semangka', 6000, 3, 7, 'assets/img/buah/semangka.jpg', 'buah', 'Semangka biasa dipanen buahnya untuk dimakan segar atau dibuat jus. Biji semangka yang dikeringkan dan disangrai juga dapat dimakan isinya sebagai kuaci'),
(26, 'apel hijau', 2000, 4, 5, 'assets/img/buah/apel_hijau.jpg', 'buah', 'apel bagus dimakan mentah-mentah (tak dimasak), dan juga digunakan banyak jenis makanan pesta. Apel dimasak sampai lembek untuk dibuat saus apel. Apel juga dibuat untuk menjadi minuman sari buah apel'),
(27, 'jambu merah', 2000, 4, 5, 'assets/img/buah/jambu_biji_merah.png', 'buah', 'Buah jambu biji mengandung banyak vitamin dan serat, sehingga sangat cocok sekali dikonsumsi untuk menjaga kesehatan. Warna daging jambu biji yang merah mengidikasikan jambu biji kaya akan vitamin A untuk kesehatan mata dan antioksidan.'),
(28, 'jambu biji', 1900, 9, 7, 'assets/img/buah/jambu_biji.png', 'buah', 'Buah jambu biji mengandung banyak vitamin dan serat, sehingga sangat cocok sekali dikonsumsi untuk menjaga kesehatan. Warna daging jambu biji yang merah mengidikasikan jambu biji kaya akan vitamin A untuk kesehatan mata dan antioksidan'),
(29, 'sirsak', 3000, 5, 19, 'assets/img/buah/sirsak.png', 'buah', ' sirsak banyak mengandung vitamin C, kandungan serat dan nutrisi penting lainnya banyak terkandung dalam buah yang banyak ditemui di negara Tropis'),
(30, 'semangka', 2500, 3, 5, 'assets/img/buah/semangka.png', 'buah', 'Semangka biasa dipanen buahnya untuk dimakan segar atau dibuat jus. Biji semangka yang dikeringkan dan disangrai juga dapat dimakan isinya sebagai kuaci'),
(31, 'mangga indramayu', 2500, 5, 6, 'assets/img/buah/mangga_indramayu.png', 'buah', 'Buah yang matang umum dimakan dalam keadaan segar, sebagai buah meja atau campuran es, dalam bentuk irisan atau diblender.'),
(32, 'jeruk siam madu', 2400, 3, 5, 'assets/img/buah/jeruk_siam_madu.png', 'buah', '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(33, 'terong belanda', 1000, 3, 4, 'assets/img/buah/terong-belanda.png', 'buah', 'dimakan sebagai buah segar, untuk bumbu masak, sayuran dan minuman.'),
(34, 'pisang mas', 25000, 4, 7, 'assets/img/buah/pisang-mas.png', 'buah', 'Buah pisang sebagai bahan pangan merupakan sumber energi (karbohidrat) dan mineral, terutama kalium'),
(35, 'pisang', 15000, 3, 7, 'assets/img/buah/Pisang.png', 'buah', 'Buah pisang sebagai bahan pangan merupakan sumber energi (karbohidrat) dan mineral, terutama kalium'),
(36, 'kentang', 2000, 4, 6, 'assets/img/buah/kentang.png', 'buah', '"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');

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

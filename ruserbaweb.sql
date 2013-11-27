-- MySQL dump 10.13  Distrib 5.5.8, for Win32 (x86)
--
-- Host: localhost    Database: progin_13510025
-- ------------------------------------------------------
-- Server version	5.5.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer_table`
--

DROP TABLE IF EXISTS `customer_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_table` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kode_pos` varchar(5) NOT NULL,
  `nomor_hp` varchar(100) NOT NULL,
  `jumlah_transaksi` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_table`
--

LOCK TABLES `customer_table` WRITE;
/*!40000 ALTER TABLE `customer_table` DISABLE KEYS */;
INSERT INTO `customer_table` VALUES (1,'dummy_is_me','dumdumdummy','Dummy bin Dammi','dumdummy@dummy.dum','Jl. Dummy Selatan no. 13 Kota Dummy','Dummiez','Dummies','00000','0800110011',0);
/*!40000 ALTER TABLE `customer_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_table`
--

DROP TABLE IF EXISTS `item_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_table` (
  `id` varchar(6) NOT NULL,
  `img` varchar(100) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` decimal(3,2) NOT NULL,
  `deskripsi` varchar(300) NOT NULL,
  `req_user` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `img` (`img`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_table`
--

LOCK TABLES `item_table` WRITE;
/*!40000 ALTER TABLE `item_table` DISABLE KEYS */;
INSERT INTO `item_table` VALUES ('BD001','imagesBD001.png','BumbuDapur','Kecap Manis',9.99,'Kecap manis tradisional yang manisnya memabukkan. Dijual dalam satuan botolan',''),('BD002','imagesBD002.png','BumbuDapur','Kecap Asin',9.99,'Kecap asin impor yang diproduksi secara mutakhir. Dijual dalam satuan botolan',''),('BD003','imagesBD003.png','BumbuDapur','Gula',9.99,'Gula yang sangat manis seperti senyummu, tapi tidak membuat diabetes. Dijual dalam satuan kilogram',''),('BD004','imagesBD004.png','BumbuDapur','Garam',9.99,'Garam yang diproses secara modern dari air laut. Rasanya asin. Dijual dalam satuan sachet',''),('BD005','imagesBD005.png','BumbuDapur','Merica',9.99,'Merica. Apabila ditambahkan pada makanan akan menjadi terasa seperti ditambahkan merica. Dijual dalam satuan sachet',''),('BE001','imagesBE001.png','Beras','Beras Rojolele',9.99,'Beras Rojolele. Kualitas unggul, dijual dalam satuan kilo',''),('BE002','imagesBE002.png','Beras','Beras C4',9.99,'Beras C4 yang kualitas sedikit di bawah Rojolele. Dijual dalam satuan kilogram',''),('BE003','imagesBE003.png','Beras','Beras Menthik Wangi',9.99,'Beras yang apabila ditanak menjadi nasi mengeluarkan aroma yang menggoda. Dijual dalam satuan kilogram',''),('BE004','imagesBE004.png','Beras','Beras Basmati',9.99,'Beras impor dari Bangladesh. Dijual dalam satuan kilogram',''),('BE005','imagesBE005.png','Beras','Beras Cianjur',9.99,'Beras lokal dari Cianjur dengan kualitas yang unggul. Dijual dalam satuan kilogram',''),('DA001','imagesDA001.png','Daging','Daging Sapi',9.99,'Daging sapi yang rasanya seperti daging sapi. Dijual dalam satuan kilogram',''),('DA002','imagesDA002.png','Daging','Daging Kambing',9.99,'Daging kambing yang rasanya seperti daging kambing. Dijual dalam satuan kilogram',''),('DA003','imagesDA003.png','Daging','Daging Ayam',9.99,'Daging ayam yang rasanya seperti daging ayam. Dijual dalam satuan kilogram',''),('DA004','imagesDA004.png','Daging','Daging Babi',9.99,'Daging babi yang rasanya seperti daging babi. Awas mengandung babi! Dijual dalam satuan kilogram',''),('DA005','imagesDA005.png','Daging','Daging Kerbau',9.99,'Daging kerbau yang rasanya seperti daging kerbau. Dijual dalam satuan kilogram',''),('FF001','imagesFF001.png','FrozenFood','Chicken Nugget',9.99,'Chicken nugget yang dibekukan. Dijual per kemasan',''),('FF002','imagesFF002.png','FrozenFood','Sosis sapi',9.99,'Sosis sapi yang dibekukan. Dijual per kemasan',''),('FF003','imagesFF003.png','FrozenFood','Sosis ayam',9.99,'Sosis ayam yang dibekukan. Dijual per kemasan',''),('FF004','imagesFF004.png','FrozenFood','Korned sapi',9.99,'Korned sapi yang dibekukan. Dijual per kemasan',''),('FF005','imagesFF005.png','FrozenFood','Sarden Kalengan',9.99,'Sarden kalengan yang dibekukan. Dijual per kemasan',''),('MN001','imagesMN001.png','Minuman','Teh',9.99,'Minuman teh siap saji. Rasanya seperti teh. Dijual per kemasan',''),('MN002','imagesMN002.png','Minuman','Kopi',9.99,'Minuman kopi siap saji. Rasanya seperti kopi. Dijual per kemasan',''),('MN003','imagesMN003.png','Minuman','Susu',9.99,'Minuman susu siap saji. Rasanya seperti susu. Dijual per kemasan',''),('MN004','imagesMN004.png','Minuman','Sirup',9.99,'Minuman sirup siap saji. Rasanya seperti sirup. Dijual per kemasan',''),('MN005','imagesMN005.png','Minuman','Air Mineral',9.99,'Air mineral siap saji. Rasanya seperti air mineral. Dijual per kemasan','');
/*!40000 ALTER TABLE `item_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-29 19:07:25

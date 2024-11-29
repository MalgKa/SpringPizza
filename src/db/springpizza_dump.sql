-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: springpizza
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `springpizza`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `springpizza` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `springpizza`;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `short_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Pizza Margherita to klasyka włoskiej kuchni. W naszym wydaniu serwujemy pizzę na cienkim cieście z ręcznie przygotowanym sosem pomidorowym i oryginalnym serem mozarella','/img/margherita.png','Pizza Margherita',22.59,'Włoska pizza na cienkim cieście z serem i sosem pomidorowym','pizza','Y'),(2,'Pizza Capriciosa to po Marghericie najpopularniejsza wersja tej smacznej włoskiej potrawy. Oprócz naszego domowego sosu pomidorowego i oryginalnej włoskiej mozarelli znajdziesz tutaj także pieczarki i wyśmienitą szynkę.','/img/capricciosa.png','Pizza Capriciosa',25.93,'Pizza na cienkim cieście z serem, sosem pomidorowym i pieczarkami','pizza','Y'),(3,'Spaghetti bolognese w naszym wykonaniu to ręcznie przygotowany makaron z sosem pomidorowym oraz wysokiej jakości wołowiną. Do przygotowania sosu wykorzystujemy pomidory z lokalnych upraw oraz świeże zioła.','/img/bolognese.png','Spaghetti Bolognese',32.99,'Robiona na miejscu pasta z sosem pomidorowym i wołowiną Idealna propozycja dla każdego miłośnika pasty.','pasta','Y'),(4,'Masz ochodę na coś słodkiego? Ta propozycja to nasza interpretacja jednego z najbardziej rozpoznawalnych włoskich deserów. Przygotowujemy go ze śmietanki BIO, świeżego mleka i prawdziwej wanilii. Na życzenie deser podajemy w alternatywnej wersji z sosem cytrynowo-malinowym','/img/panna-cotta.png','Panna Cotta',18.99,'Klasyczny włoski deser o smaku śmietankowym z polewą z truskawek','dessert','Y'),(5,'Napój gazowany Coca-Cola 500 ml Składniki woda, cukier, dwutlenek węgla, barwnik E 150d, kwas: kwas fosforowy, naturalne aromaty w tym kofeina','/img/cola.png','Coca-cola',10.99,'orzeźwiający napój gazowany','drink','Y'),(6,'Napój gazowany o smaku pomarańczowym. Zawiera cukier i substancje słodzące.wyraźnie pomarańczowy smak, mniejsza zawartość cukru o 30% w porównaniu z większością napojów gazowanych o smaku pomarańczowym','/img/fanta.png','Fanta',9.99,'Napój gazowany o smaku pomarańczowym','drink','Y'),(7,'Klasyczny Grecki trunek charakteryzuje się bogatym i aksamitnym smakiem z nutami fig, suszonych śliwek i lukrecji. Powstaje z najlepszych destylatów winnych typu Muscat, pochodzących z jednych z najdroższych na świecie, zbieranych ręcznie winogron.','/img/metaxa.jpg','Metaxa',39.99,'najlepszy drink świata','drink','N'),(8,'Makaron penne w sosie z czterech włoskich serów podawany z pomidorkami koktajlowymi, szpinakiem i krewetkami','/img/quatro.png','Penne Ai Quattro Formaggi',49.99,'Sycylijski przysmak!','pasta','Y');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  KEY `FKo5d8io03ue2y89j3wbnju0let` (`item_id`),
  KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  CONSTRAINT `FKo5d8io03ue2y89j3wbnju0let` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (100,4),(100,2),(100,1),(100,1),(100,6),(100,6),(110,1),(110,3),(110,5),(95,2),(95,5),(93,1),(93,5),(93,2),(93,3),(97,1),(97,2),(97,3),(97,4),(97,6),(97,6),(97,5),(97,4),(97,3),(97,1),(97,2),(97,3);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_time` datetime(6) DEFAULT NULL,
  `sum` double DEFAULT NULL,
  `place_id` bigint DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoq6pbd7um89xccacm0xsk0xjx` (`place_id`),
  KEY `FKsskkpl1vd8t45wcvx150udmvo` (`status_id`),
  CONSTRAINT `FKoq6pbd7um89xccacm0xsk0xjx` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `FKsskkpl1vd8t45wcvx150udmvo` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (93,'2023-11-02 20:21:00.000000',92.5,3,4),(95,'2023-11-02 20:56:00.000000',36.92,6,4),(97,'2023-11-04 10:14:11.321459',264.96,5,4),(100,'2023-12-10 11:05:14.720285',110.08,2,4),(110,'2024-11-28 13:02:30.299596',66.57,7,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'red'),(2,'green'),(3,'yellow'),(4,'orange'),(5,'blue'),(6,'pink'),(7,'darkblue'),(8,'salmon'),(9,'olive');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'order placed','new'),(2,'in preparation','in progress'),(3,'delivered to the table','completed'),(4,'paid','done');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_order`
--

DROP TABLE IF EXISTS `user_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_order` (
  `user_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`order_id`),
  UNIQUE KEY `UK_t5ah1x4wm9314qclf90dy0lyu` (`order_id`),
  CONSTRAINT `FKbbwlke5ei3gh1ki65yiiojmck` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKrlglekn12wx5o456laekbv32u` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_order`
--

LOCK TABLES `user_order` WRITE;
/*!40000 ALTER TABLE `user_order` DISABLE KEYS */;
INSERT INTO `user_order` VALUES (1,93),(1,95),(1,97),(2,100),(2,110);
/*!40000 ALTER TABLE `user_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','User','User','{noop}user','ROLE_USER','user'),(2,_binary '','Admin','Admin','{noop}admin','ROLE_ADMIN','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 10:37:22

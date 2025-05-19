-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: mangadb
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'thalesh','thalesh.patil@gmail.com','scrypt:32768:8:1$LnDhr6dgLyjxKmi1$247db37564e60db1296161e002822b819901e269189dba31688c58f495369bdaaa9f5caa109d5eae2a63cb38d1db71f9c9539552b4d1a765af132ebd0a6a020a','2025-05-08 23:07:08'),(2,'testuser','test@example.com','pbkdf2:sha256:600000$WnvFHQPpZK...','2025-05-08 23:13:07'),(7,'thalesh ','thalesh@gmail.com','scrypt:32768:8:1$GKGRS23rlGrMT9Hy$48e05df99fcd646f597dd8078db493fe5837efcc65e54ce19ba0243335caee8d6d8df6b405a6bb4d8266a94337a251cb6f0eecc0af0088c78319d15b3c3fe045','2025-05-08 23:41:00'),(10,'Max','max@gmail.com','max123','2025-05-09 01:42:54'),(11,'chetu','chetu@gmail.com','chetu123','2025-05-09 01:45:07'),(13,'thalesh1','thalesh.2004@gmail.com','scrypt:32768:8:1$sGtunPOh0Q5KRQuK$0e6968f5aee7be84f81bdd0c3036a5de4665accdf4f4c13716128d2af6cbaa56ebbd0d18d00250d86fef637445927f1cfb2e7d001084fc2d7ef1106083190640','2025-05-09 01:49:38'),(14,'Lalit','lalit2013@gmail.com','scrypt:32768:8:1$J4pIP0RzuXXZFgaF$5de599fd3c7db083f20f5746ca03e7fd98ff433196937aa85be7081f33cb9f2747fb3ed4943021d5616d735f5813d99ef7a7ca6d70a553b6338c96fd3d736172','2025-05-09 03:54:33'),(15,'Avi','avi@gmail.com','scrypt:32768:8:1$zwVt54OQ0Bs4Qxlx$2fd129c05682a12958c617f0aa45d04f294fba26389f208073f760b7e16aa7d05ca56827e2a64b439d5434a6b780c43787e34e911d518bf19491cbb10665a81a','2025-05-09 03:58:52'),(18,'chaitanya','chaitanyadamke7804@gmail.com','scrypt:32768:8:1$KIki6WI4z28VEMCS$ca8da1d66c4e02731f04bd4b6ba9407760042dd77aa815c945cc7e2c49543ea4b4343f05b80a70c984b24624d788d4d572a718da66360cfd580c4e07c6775281','2025-05-17 04:13:35');
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

-- Dump completed on 2025-05-19 23:00:53

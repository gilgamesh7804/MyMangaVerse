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
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `manga_id` int NOT NULL,
  `chapter_number` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pdf_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manga_id` (`manga_id`),
  CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT INTO `chapters` VALUES (11,1,1,NULL,'manga_pdfs\\kaiju_no._8_ch1.pdf'),(14,2,1,NULL,'manga_pdfs/blue_lock_ch1.pdf'),(15,3,1,NULL,'manga_pdfs/mashle_ch1.pdf'),(17,5,1,NULL,'manga_pdfs/death_note_ch1.pdf'),(18,6,1,NULL,'manga_pdfs/mha_ch1.pdf'),(19,7,1,NULL,'manga_pdfs/one_piece_ch1.pdf'),(20,8,1,NULL,'manga_pdfs/jujutsu_ch1.pdf'),(21,9,1,NULL,'manga_pdfs/dandadan_ch1.pdf'),(22,10,1,NULL,'manga_pdfs/berserk_ch1.pdf'),(23,11,1,NULL,'manga_pdfs/vinland_ch1.pdf'),(24,12,1,NULL,'manga_pdfs/pluto_ch1.pdf'),(25,13,1,NULL,'manga_pdfs/20cb_ch1.pdf'),(26,14,1,NULL,'manga_pdfs/monster_ch1.pdf'),(30,10,2,NULL,'manga_pdfs/Berserk_Volume_02.pdf'),(31,4,1,NULL,'manga_pdfs/Vol_01_Naruto_MangaXAura.pdf');
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
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

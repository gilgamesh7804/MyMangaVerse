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
-- Table structure for table `manga`
--

DROP TABLE IF EXISTS `manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manga` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `cover_image` varchar(255) DEFAULT NULL,
  `category` enum('latest','popular','trending','hidden') DEFAULT 'latest',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manga`
--

LOCK TABLES `manga` WRITE;
/*!40000 ALTER TABLE `manga` DISABLE KEYS */;
INSERT INTO `manga` VALUES (1,'Kaiju No. 8','Monsters invade Japan.','covers/kaiju.jpg','latest'),(2,'Blue Lock','Battle to become the best striker.','covers/blue_lock.jpg','latest'),(3,'Mashle','Magic and muscles collide.','covers/mashle.jpg','latest'),(4,'Naruto','A ninja seeks recognition and dreams of becoming Hokage.','covers/naruto.jpg','popular'),(5,'Death Note','A notebook that kills. Justice or power?','covers/death_note.jpg','popular'),(6,'My Hero Academia','Superpowers are the norm. One boy stands out.','covers/mha.jpg','popular'),(7,'One Piece','A pirate adventure with the Straw Hat crew.','covers/one_piece.jpg','trending'),(8,'Jujutsu Kaisen','Sorcerers battle curses in modern Tokyo.','covers/jujutsu.jpg','trending'),(9,'Dandadan','Aliens, ghosts, and crazy powers.','covers/dandadan.jpg','trending'),(10,'Berserk','In a dark and unforgiving medieval world, the lone swordsman Guts battles both monstrous creatures and the demons of his past. Known for its deep themes, brutal action, and tragic storytelling, Berserk is a legendary epic that explores the nature of fate and free will.','covers/berserk.jpg','hidden'),(11,'Vinland Saga','Set in the era of Viking conquest, Vinland Saga follows Thorfinn, a young warrior driven by revenge and caught between the ideals of honor and the brutality of war. A gripping tale of history, loyalty, and redemption inspired by real events.','covers/vinland.jpg','hidden'),(12,'Pluto','In a futuristic society where robots and humans coexist, renowned detective Gesicht investigates the mysterious deaths of the world?s most advanced robots. Pluto is a masterfully written sci-fi thriller based on Osamu Tezuka?s Astro Boy universe, reimagined by Naoki Urasawa.','covers/pluto.jpg','hidden'),(13,'20th Century Boys','What if your childhood game became a global conspiracy? As adults, a group of friends discovers that a cult is enacting the world-ending prophecy they made as kids. 20th Century Boys is a suspenseful mystery spanning decades, memory, and friendship.','covers/20cb.jpg','hidden'),(14,'Monster','Dr. Kenzo Tenma saves a boy?s life over a VIP patient-only to learn the boy grows up to become a sociopathic killer. Wracked with guilt and hunted by the past, Tenma must uncover the truth behind the Monster he may have helped create.','covers/monster.jpg','hidden');
/*!40000 ALTER TABLE `manga` ENABLE KEYS */;
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

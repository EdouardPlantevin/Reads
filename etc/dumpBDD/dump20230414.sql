-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: database    Database: starterkit_symfony
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64C19C1727ACA70` (`parent_id`),
  CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,NULL,'Categorie1'),(2,NULL,'Categorie2'),(3,NULL,'Categorie3');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20230201150914','2023-02-01 16:48:31',15),('DoctrineMigrations\\Version20230208160210','2023-02-08 17:09:05',894),('DoctrineMigrations\\Version20230212151628','2023-02-12 16:18:26',140),('DoctrineMigrations\\Version20230212185845','2023-02-12 19:59:11',140),('DoctrineMigrations\\Version20230215093140','2023-02-15 10:32:41',123),('DoctrineMigrations\\Version20230215142331','2023-02-15 15:28:55',204),('DoctrineMigrations\\Version20230219031507','2023-02-19 04:15:53',202),('DoctrineMigrations\\Version20230301230245','2023-03-09 10:21:16',16),('DoctrineMigrations\\Version20230309091924','2023-03-09 10:25:04',96),('DoctrineMigrations\\Version20230331130123','2023-03-31 15:03:45',143);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `date_creation` date NOT NULL DEFAULT '2023-03-09',
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`),
  CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'produit1','desc produit1',100,'2022-03-09'),(2,1,'produit2','desc produit2',100,'2023-03-09'),(3,2,'produit3','desc produit3',200,'2023-03-09'),(4,1,'produit4','desc produit4',2002,'2023-03-09'),(5,1,'produit5','desc produit5',20,'2023-03-09'),(6,3,'produit6','desc produit',24,'2023-03-09'),(7,2,'produit7','desc produit',23,'2023-03-09'),(8,2,'produit8','desc produit',23,'2023-03-09'),(9,2,'produit9','desc produit',23,'2020-03-09'),(10,2,'produit10','desc produit',23,'2023-04-09'),(11,1,'produit11','desc produit',23,'2023-03-09'),(12,1,'produit12','desc produit',24,'2023-03-09'),(13,1,'produit13','desc produit',24,'2023-03-09'),(14,1,'produit14','desc produit',24,'2023-03-09');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_activation_compte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_account` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  UNIQUE KEY `UNIQ_8D93D649239D0979` (`token_activation_compte`),
  UNIQUE KEY `UNIQ_8D93D649D7C8DC19` (`reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test@test.fr','[]','$2y$13$c3wbvQxKiUL.VlUKT9O09OdVoxBQG/mGIG1aADouMMfd5be3KRG9i',0,'ronde de profession','La Table',NULL,NULL,'en',1),(2,'test2@test.fr','[]','$2y$13$vqXtgnbOT8Yd.vJNqk2Hd.YvLHNbeFy2mJqVbiKdFTyDry3zYCAFu',0,'Pendragon','Utherrr',NULL,NULL,'fr',1),(3,'test3@test.fr','[]','$2y$13$KGONMD.9F2DoyS7MjTDMDeNE8kEBWPN604DQTh6GcgPdmLbC.0diS',0,'la Fée','Morgane',NULL,NULL,'fr',1),(4,'test4@test.fr','[]','$2y$13$rdTe7LqgJAsZC6SgwhbqFOFl9wDIvPmc1QM2bHEJ6eE6ntk6E.mMu',0,'Pendragon','Arthur',NULL,NULL,'fr',1),(5,'test5@test.fr','[]','$2y$13$4MMJYfQn4g4IDSN/UknUEu.JY4moX8oQnCLAfBRy5s18yPBd9lYn.',0,'le Magicien','Merlin',NULL,NULL,'fr',0),(6,'test6@test.fr','[]','$2y$13$mlq5Bkqcv9z7SdiBm8z6te5J0TZq96taxIe2pMotwz6qIAEuWydcO',0,'la Douce','Guenièvre',NULL,NULL,'fr',1),(10,'test7@test.fr','[]','$2y$13$vlC0OJhiRFc8pBr0p2EQ4eLeCL.vX3w9VVQ5rPl4ScYxwuXGlYj2G',0,'Au Lion','Yvain',NULL,NULL,'fr',1),(17,'n.loisy@eurelis.com','[\"ROLE_ADMIN\"]','$2y$13$MRqktn7oHyq4m4qFKYFmee9HEALECjUNK1AB3UnSFRmQN4pE8dOsq',1,'de Carmélide','Léodagan','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNywiaWF0IjoxNjc2NDY3MzA5LCJleHAiOjE2NzY0NzgxMDl9.Wj0ESbA_RYA_0APj2PdpdHZ87JqOz0TYfTS2fWBpKU4','iWBzzrcKt86DvNS8c9Ct-_0oWaqJLce-7qwm9rFkxXM','fr',1),(18,'test8@test.fr','[\"ROLE_ADMIN\"]','$2y$13$TvfYWzNSwnRW5A6TforQ7.6fDoSI.zxCtovPANtQHEuMzUIflbJIS',1,'Admin','Admin',NULL,NULL,'fr',1),(19,'test9@test.fr','[\"ROLE_ADMIN\"]','$2y$13$PbxnmvxbtuKRzXTvPdxv/e3rNFuUjYRC61UPPzMcBt26U4iqA/yp2',1,'Admin','Admin',NULL,NULL,'fr',1),(23,'test10@test.fr','[]','$2y$13$7mrKQ6r8hPi.01RwfgvWhuGxXERK7m9Y8CLJLnN7OOafzEngjq4Oq',0,'du Lac','Lancelot','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiaWF0IjoxNjc2OTM2MDc2LCJleHAiOjE2NzY5NDY4NzZ9.MWAQnxzLBwvl6vDiGSnbTXgBEihRRvXn90EDP3S6seE',NULL,'fr',1),(24,'test11@test.fr','[]','$2y$13$UvNgLUcqhQTk9JrV272LQe6ul2WWC6hEDAbRO1EUPlpgwaRbN7Y8C',1,'d\'Orcanie','Gauvain','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNCwiaWF0IjoxNjc2OTM2MzMxLCJleHAiOjE2NzY5NDcxMzF9.nfeJDx1Lfs58IgcgX_tKL0WrA3ZsUx3LFHFSpymeu8A',NULL,'fr',1),(25,'test12@test.fr','[]','$2y$13$QwrrHIORLzo.vUy6GJEt..hF.gJkMk/BNUU1Sls/sU4tPfsvC7ani',1,'Duc d\'Orcanie','Galessin','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNSwiaWF0IjoxNjc3MDUzODA0LCJleHAiOjE2NzcwNjQ2MDR9.c-3obzLvTZ8_7Nfm3jBsixLAjBvJucF7nY0ZeQ9ENRU',NULL,'fr',1),(26,'testAdmin@test.fr','[\"ROLE_ADMIN\"]','$2y$13$1C6nFTttj7L7ma4Wcn8Sieb3K8JGw58jMOfiTAmpo5bV1FgdpoB/C',1,'Admin','Admin',NULL,NULL,'fr',1),(27,'test13@test.fr','[]','$2y$13$fbxG.7tWIjXV.5qXKl8Iq.qzCOpCo4SfZ6R.UFT1CyHVCGR2a.0Aq',0,'le fou','Dagonet','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyNywiaWF0IjoxNjc3MDc0MDY1LCJleHAiOjE2NzcwODQ4NjV9.wtKPQmW19S3VhG4DIFo7U2fx-Fyexhz9eYUdM77ScUE',NULL,'fr',1),(28,'test14@test.fr','[]','$2y$13$evmJ3t3mehZT/Dc1bXamDO3Z/8WUW4r22BHrbv06SJ8v1TuDFaQRS',0,'le Brave','Calogrenant','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyOCwiaWF0IjoxNjc3MDc0MTAzLCJleHAiOjE2NzcwODQ5MDN9.T8wBgI4o5kAS2P168uc60-mRHq2UMJz8Nf0gHyVFmmU',NULL,'fr',1),(29,'test15@test.fr','[]','$2y$13$LkvavZrxK7PEq0rCLWZwxutamUYR2iqQvG5BeOJdQHyciK7Q5/UdG',0,'de Galles','Caradoc','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyOSwiaWF0IjoxNjc3MDc0MTI1LCJleHAiOjE2NzcwODQ5MjV9.4tZ0gY5wrVLuGpUcyp0hxJ2nl7FIKlniyBEio7kRtIQ',NULL,'fr',1),(30,'test16@test.fr','[]','$2y$13$a/GTDtPxnENWtF9sLqY53e.TOufHqSTF0YZW.Qv/VGhuPm.DwCwru',1,'l\'Exilé','Bohort','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMCwiaWF0IjoxNjc3MDc0MTY3LCJleHAiOjE2NzcwODQ5Njd9.wKIo9RGg__ptBQ2CA6gncRFMW2m-2GSgxnQnVAsa6Xg','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMCwiaWF0IjoxNjc3MDc0NDcyLCJleHAiOjE2NzcwNzQ0ODJ9.0E_MtSJ27EKiMkmhjD7BNEHBNcvqF-xoiuQG3Cbj6QA','fr',1),(33,'test17@test.fr','[]','$2y$13$kSdQ5zroiaTKtX8x/8e8KuVh99iVd00g/EM47MMA6gAFuUQUixFXm',0,'Le Gallois','Perceval','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozMywiaWF0IjoxNjgwMzA2NTIyLCJleHAiOjE2ODAzMTAxMjJ9.Af1jNbhZ7P9vLkaGmMevanGgrFc1GrxxII4my0AATnI',NULL,'fr',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 11:01:57

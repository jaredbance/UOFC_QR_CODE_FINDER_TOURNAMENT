-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: qrexplorer
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Admin` (
  `username` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Edits`
--

DROP TABLE IF EXISTS `Edits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Edits` (
  `username` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`username`,`ID`),
  KEY `edit_id_idx` (`ID`),
  CONSTRAINT `edit_id` FOREIGN KEY (`ID`) REFERENCES `qr_code` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `edit_username` FOREIGN KEY (`username`) REFERENCES `admin` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Edits`
--

LOCK TABLES `Edits` WRITE;
/*!40000 ALTER TABLE `Edits` DISABLE KEYS */;
/*!40000 ALTER TABLE `Edits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entry`
--

DROP TABLE IF EXISTS `Entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Entry` (
  `id` int(11) NOT NULL,
  `nickname` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_nickname` (`nickname`),
  CONSTRAINT `entry_nickname` FOREIGN KEY (`nickname`) REFERENCES `player` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entry`
--

LOCK TABLES `Entry` WRITE;
/*!40000 ALTER TABLE `Entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Friends_Leaderboard`
--

DROP TABLE IF EXISTS `Friends_Leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Friends_Leaderboard` (
  `id` int(11) NOT NULL,
  `owner_username` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `top_player` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `friend_owner` (`owner_username`),
  KEY `friend_top_player` (`top_player`),
  CONSTRAINT `friend_id` FOREIGN KEY (`id`) REFERENCES `entry` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `friend_owner` FOREIGN KEY (`owner_username`) REFERENCES `player` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `friend_top_player` FOREIGN KEY (`top_player`) REFERENCES `player` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friends_Leaderboard`
--

LOCK TABLES `Friends_Leaderboard` WRITE;
/*!40000 ALTER TABLE `Friends_Leaderboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `Friends_Leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Global_Leaderboard`
--

DROP TABLE IF EXISTS `Global_Leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Global_Leaderboard` (
  `id` int(11) NOT NULL,
  `top_player` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `global_top_player` (`top_player`),
  CONSTRAINT `global_id` FOREIGN KEY (`id`) REFERENCES `entry` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `global_top_player` FOREIGN KEY (`top_player`) REFERENCES `player` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Global_Leaderboard`
--

LOCK TABLES `Global_Leaderboard` WRITE;
/*!40000 ALTER TABLE `Global_Leaderboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `Global_Leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Joins`
--

DROP TABLE IF EXISTS `Joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Joins` (
  `player_username` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `friend_leader_id` int(11) NOT NULL,
  PRIMARY KEY (`player_username`,`friend_leader_id`),
  KEY `join_id_idx` (`friend_leader_id`),
  CONSTRAINT `join_id` FOREIGN KEY (`friend_leader_id`) REFERENCES `friends_leaderboard` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `join_username` FOREIGN KEY (`player_username`) REFERENCES `player` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Joins`
--

LOCK TABLES `Joins` WRITE;
/*!40000 ALTER TABLE `Joins` DISABLE KEYS */;
/*!40000 ALTER TABLE `Joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manages`
--

DROP TABLE IF EXISTS `Manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Manages` (
  `admin_username` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `player_username` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`admin_username`,`player_username`),
  KEY `manage_player_user` (`player_username`),
  CONSTRAINT `manage_admin_user` FOREIGN KEY (`admin_username`) REFERENCES `admin` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `manage_player_user` FOREIGN KEY (`player_username`) REFERENCES `player` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manages`
--

LOCK TABLES `Manages` WRITE;
/*!40000 ALTER TABLE `Manages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Manages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permissions` (
  `username` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `permissions` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `admin` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Player` (
  `username` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `score` int(11) DEFAULT '0',
  `f_id` int(11) DEFAULT NULL,
  `team_name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `g_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `player_team_name` (`team_name`),
  KEY `friend_leader_id_idx` (`f_id`),
  KEY `global_leader_id_idx` (`g_id`),
  CONSTRAINT `friend_leader_id` FOREIGN KEY (`f_id`) REFERENCES `friends_leaderboard` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `global_leader_id` FOREIGN KEY (`g_id`) REFERENCES `global_leaderboard` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `player_team_name` FOREIGN KEY (`team_name`) REFERENCES `teams` (`team_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qr_code`
--

DROP TABLE IF EXISTS `qr_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qr_code` (
  `ID` int(11) NOT NULL,
  `Create_Admin_Username` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Point_Value` int(11) NOT NULL,
  `Location` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Difficulty` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `create_username` (`Create_Admin_Username`),
  CONSTRAINT `create_username` FOREIGN KEY (`Create_Admin_Username`) REFERENCES `admin` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_code`
--

LOCK TABLES `qr_code` WRITE;
/*!40000 ALTER TABLE `qr_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `qr_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scans`
--

DROP TABLE IF EXISTS `Scans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Scans` (
  `ID` int(11) NOT NULL,
  `player_username` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `scan_username` (`player_username`),
  CONSTRAINT `scan_id` FOREIGN KEY (`ID`) REFERENCES `qr_code` (`ID`) ON DELETE RESTRICT,
  CONSTRAINT `scan_username` FOREIGN KEY (`player_username`) REFERENCES `admin` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scans`
--

LOCK TABLES `Scans` WRITE;
/*!40000 ALTER TABLE `Scans` DISABLE KEYS */;
/*!40000 ALTER TABLE `Scans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team_Leaderboard`
--

DROP TABLE IF EXISTS `Team_Leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Team_Leaderboard` (
  `ID` int(11) NOT NULL,
  `top_team` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `top_team` (`top_team`),
  CONSTRAINT `team_id` FOREIGN KEY (`ID`) REFERENCES `entry` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `top_team` FOREIGN KEY (`top_team`) REFERENCES `teams` (`team_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team_Leaderboard`
--

LOCK TABLES `Team_Leaderboard` WRITE;
/*!40000 ALTER TABLE `Team_Leaderboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `Team_Leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Teams` (
  `team_name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `leader_username` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `num_of_members` int(11) DEFAULT NULL,
  `t_leaderboard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`team_name`,`leader_username`),
  UNIQUE KEY `team_name_UNIQUE` (`team_name`),
  KEY `leader_username` (`leader_username`),
  KEY `t_leaderboard_id_idx` (`t_leaderboard_id`),
  CONSTRAINT `leader_username` FOREIGN KEY (`leader_username`) REFERENCES `player` (`username`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_leaderboard_id` FOREIGN KEY (`t_leaderboard_id`) REFERENCES `team_leaderboard` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-03 11:12:50

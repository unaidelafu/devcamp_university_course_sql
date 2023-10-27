-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: devcamp_university_course
-- ------------------------------------------------------
-- Server version	11.3.0-MariaDB

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) NOT NULL,
  `c_professor_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `courses_FK` (`c_professor_id`),
  CONSTRAINT `courses_FK` FOREIGN KEY (`c_professor_id`) REFERENCES `professors` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Math',1),(2,'Biologic',3),(3,'Physics',1),(4,'Electricity',2),(5,'Electric motors',2),(6,'Informatic',3),(7,'Accounting',3);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_course_id` int(11) NOT NULL,
  `g_student_id` int(11) NOT NULL,
  `g_grade` float DEFAULT NULL,
  PRIMARY KEY (`g_id`),
  UNIQUE KEY `grades_un` (`g_course_id`,`g_student_id`),
  KEY `grades_FK` (`g_student_id`),
  CONSTRAINT `grades_FK` FOREIGN KEY (`g_student_id`) REFERENCES `students` (`s_id`),
  CONSTRAINT `grades_FK_1` FOREIGN KEY (`g_course_id`) REFERENCES `courses` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,1,1,7.3),(2,1,2,5.3),(3,1,3,4.7),(4,1,4,7.7),(5,1,5,4.4),(6,1,6,8.8),(7,1,7,0.9),(8,1,8,8.1),(9,2,1,7.6),(10,2,2,3.8),(11,2,3,6.2),(12,2,4,9.6),(13,2,5,9.4),(14,2,6,8.2),(15,2,7,3),(16,2,8,0.2),(17,3,1,2),(18,3,2,9.6),(19,3,3,1.7),(20,3,4,9.7),(21,3,5,3.5),(22,3,6,8.4),(23,3,7,1.5),(24,3,8,2.4),(25,4,1,7.5),(26,4,2,0.4),(27,4,3,9.4),(28,4,4,5.9),(29,4,5,1.4),(30,4,6,9.3),(31,4,7,2.3),(32,4,8,3.6),(33,5,1,0.9),(34,5,2,3.9),(35,5,3,6.7),(36,5,4,1.8),(37,5,5,9.1),(38,5,6,9.8),(39,5,7,2),(40,5,8,0.4),(41,6,1,5.9),(42,6,2,8.3),(43,6,3,4.1),(44,6,4,5.4),(45,6,5,4.6),(46,6,6,6.7),(47,6,7,9.9),(48,6,8,9.2),(49,7,8,8.2);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_sid` varchar(100) DEFAULT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `p_surname` varchar(100) DEFAULT NULL,
  `p_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `students_un` (`p_sid`),
  UNIQUE KEY `students_un_mail` (`p_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES (1,'87498490A','Diego','Garcia','dg001@devamp.com'),(2,'15869590J','Gabriel','Oteiza','go001@devamp.com'),(3,'70074988T','Carla','Gutierrez','cg001@devamp.com');
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_sid` varchar(100) DEFAULT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_surname` varchar(100) DEFAULT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `students_un` (`s_sid`),
  UNIQUE KEY `students_un_mail` (`s_email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'15478490A','Alberto','Ordorika','ao21@devamp.com'),(2,'15874990A','Sofia','Granja','sg021@devamp.com'),(3,'77774988T','Peter','Petreli','pp63@devamp.com'),(4,'77779740M','Jaime','Calvo','jc97@devamp.com'),(5,'84715180Q','Nerea','Manin','nm21@devamp.com'),(6,'67054182P','Alazne','Prado','ap09@devamp.com'),(7,'69754182P','Margalida','Arroyo','ma23@devamp.com'),(8,'96754182P','Sol','Arroyo','sa33@devamp.com');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'devcamp_university_course'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-27 10:22:28

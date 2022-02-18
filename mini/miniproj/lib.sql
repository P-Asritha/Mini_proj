-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(80) DEFAULT NULL,
  `book_author` varchar(80) DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  `stock` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `books_chk_1` CHECK ((lower(`stock`) in (_utf8mb4'y',_utf8mb4'n')))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (3,'Introduction to Algorithms','Thomas H. Corman',1,'y'),(4,'Algorithms','Robert Sedgwik',1,'n'),(5,'Concepts of Programming Languages','Robert W. Sebesta',2,'y'),(7,'Programming Languages, Principles and Paradigms','Allen B. Tucker',2,'y'),(9,'Fundamentals of Data Structures in C++','Ellis Horowitz',1,'y'),(10,'Algorithms, Data Structures and Problem Solving with C++','Mark Allen',1,'n'),(11,'Fundamentals of Data Structures','Ellis Horowitz',1,'y'),(12,'Concepts of Programming Languages','Robert W. Sebesta',2,'y'),(13,'Programming Language Design Concepts','D. A. Watt',2,'n'),(14,'LISP','Patric Henry Winston',2,'y');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(80) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject` (`subject`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Data Structures and Algorithms',3),(2,'Principles of Programming Languages',3),(3,'Java',4),(4,'Computer Organization',4),(5,'Database Management Systems',4),(6,'Software Engineering',5),(7,'Operating Systems',5),(8,'Automata Languages and Computation',5),(9,'Artificial Intelligence',5),(10,'Data Analytics',5),(11,'Blockchain Technologies',5),(12,'Web and Internet Technologies',5),(13,'Information Retrieval System',5),(14,'Compiler Design',6),(15,'Computer Networks',6),(16,'Design and Analysis of Algorithms',6),(17,'Machine Learning',6),(18,'Cloud Computing',6),(19,'Data Mining',6),(20,'Internet of Things',6),(21,'Information Security',7),(22,'Data Science using R Programming',7),(23,'Distributed Systems',7),(24,'Data Science',7),(25,'Cyber Security',7),(26,'Mobile Computing',8),(27,'Semantic Web and Social Networking',8),(28,'Principles of Electronic Communications',8),(29,'Mechatronics',8),(30,'Electric Transaction Systems',8);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-01 20:42:02

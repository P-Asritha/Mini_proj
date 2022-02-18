-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: library
-- ------------------------------------------------------
-- Server version	8.0.27

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
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (3,'Introduction to Algorithms','Thomas H. Corman',1,'y'),(4,'Algorithms','Robert Sedgwik',1,'n'),(5,'Concepts of Programming Languages','Robert W. Sebesta',2,'y'),(7,'Programming Languages, Principles and Paradigms','Allen B. Tucker',2,'y'),(9,'Fundamentals of Data Structures in C++','Ellis Horowitz',1,'y'),(10,'Algorithms, Data Structures and Problem Solving with C++','Mark Allen',1,'n'),(11,'Fundamentals of Data Structures','Ellis Horowitz',1,'y'),(12,'Concepts of Programming Languages','Robert W. Sebesta',2,'y'),(13,'Programming Language Design Concepts','D. A. Watt',2,'n'),(14,'LISP','Patric Henry Winston',2,'y'),(15,'Java The complete reference','Herbert Schildt',3,'y'),(16,'Understanding OOP with Java','T. Budd',3,'y'),(17,'Head First Java','Bert Bates, Kathy Sierra',3,'n'),(18,'Introduction to Java programming','Y. Daniel Liang',3,'y'),(19,'An Introduction to OOP','T. Budd',3,'y'),(20,'Computer system Architecture','Morris Mano',4,'y'),(21,'Computer Organization and Architecture','William Stallings',4,'n'),(22,'Structured Computer Organization','Andrew S. Tanenbaum',4,'y'),(23,'Advanced Micro Processor and Peripherals','Hall/ A K Ray',4,'y'),(24,'Computer Architecture a quantitative approach','John L. Hennessy and David A. Patterson',4,'y'),(25,'Database System Concepts','Abraham Silberschatz, Henry F Korth, S Sudarshan',5,'y'),(26,'Database Management Systems','Ramakrishnan, Gehrke',5,'n'),(27,'Fundamentals of Database Systems','Elmasri, Navathe, Somayajulu',5,'y'),(28,'Fundamentals of DBMS','Masood Ahmed',5,'y'),(29,'DBMS 101','Shreya VS',5,'y'),(32,'An Integrated Approach to Software Engineering','Pankaj Jalote',6,'n'),(33,'Software Engineering : A Practitioners Approach','Roger S. Pressman',6,'y'),(34,'Software Engineering Fundamentals','Ali Behforooz, Frederick J. Hudson',6,'y'),(36,'Software Engineering 101','Masood Ahmed',6,'y'),(37,'Software Engineering for CSE','Shreya VS',6,'n'),(38,'Operating Systems Concepts Essentials','Peter Galvin, Greg Gagne',7,'y'),(39,'Operating Systems: Three Easy Pieces','Andrea Arpaci-Dusseau and Remzi Arpaci-Dusseau',7,'y'),(40,'Operating Systems: Internals and Design Principles','William Stallings',7,'n'),(41,'Modern Operating Systems','Andrew S. Tanenbaum',7,'y'),(42,'Operating Systems: A Design-oriented Approach','Charles Patrick Crowley',7,'n'),(43,'Introduction to Automata Theory, Languages, and Computation\n','Jeffrey Ullman, John Hopcroft',8,'y'),(44,'Introduction to the Theory of Computation ','Michael Sipser ',8,'y'),(45,'An Introduction to Formal Languages and Automata  ','Peter Linz',8,'n'),(46,'Automata and Computability ','Dexter Kozen ',8,'n'),(47,'Automata and Languages: Theory and Applications\n','Alexander Meduna\n',8,'y'),(48,'Artificial Intelligence: A Modern Approach\n','Peter Norvig, Stuart J. Russell ',9,'y'),(49,'Principles of Artificial Intelligence','Nils J. Nilsson ',9,'y'),(50,'The Quest for Artificial Intelligence','Nils J. Nilsson ',9,'n'),(51,'Deep Learning','Aaron Courville, Ian Goodfellow, Yoshua Bengio ',9,'y'),(52,'Artificial Intelligence: A Guide for Thinking Humans ','Melanie Mitchell\n',9,'n'),(53,'Data Mining: Concepts and Techniques','Jiawei Han, ‎Micheline Kamber ',10,'y'),(54,'A General Introduction to Data Analytics','João Moreira, ‎Andre Carvalho, ‎Tom Horvath',10,'y'),(55,'Data Science and Big Data Analytics','David Dietrich',10,'n'),(56,'Data Analytics for Beginners','Paul Kinley ',10,'n'),(57,'Doing Data Science: Straight Talk from the Frontline\n','Cathy O\'Neil, Rachel Schutt ',10,'y'),(58,'Bitcoin and Cryptocurrency Technologies: A Comprehensive Introduction\n','Arvind Narayanan, ‎Joseph Bonneau, ‎Edward Felten ',11,'n'),(59,'Blockchain: Blueprint for a New Economy','Melanie Swan',11,'y'),(60,'Introducing Ethereum and Solidity','Chris Dannen\n',11,'n'),(61,'The Blockchain and the New Architecture of Trust\n','Kevin Werbach',11,'y'),(62,'The Basics of Bitcoins and Blockchains','Antony Lewis\n',11,'y'),(63,'Internet and Web Technologies','Raj Kamal ',12,'y'),(64,'Internet Technologies and Information Services','Joseph B. Miller',12,'y'),(65,'Web Programming and Internet Technologies: An E-commerce approach','Porter Scobey, ‎Pawan Lingras ',12,'n'),(66,'Web Programming and Internet Technologies','Scobey, ‎Pawan Lingras',12,'n'),(67,'Web Technology & Design','C. Xavier ',12,'y'),(68,'Introduction to Information Retrieval','Christopher D. Manning, ‎Prabhakar Raghavan, ‎Hinrich Schütze',13,'y'),(69,'Information retrieval systems\n','Gerald Kowalski\n',13,'y'),(70,'Information Retrieval: Data Structures & Algorithms\n','William B. Frakes\n',13,'y'),(71,'Mining the Web: Discovering Knowledge from Hypertext Data\n','Soumen Chakrabarti\n',13,'n'),(72,'Information Retrieval System: A Linguistic Study\n','R. C. Pandey',13,'n'),(73,'Principles of Compiler Design\n','Alfred Aho, Jeffrey Ullman ',14,'y'),(74,'Advanced Compiler Design and Implementation\n','Steven Muchnick\n',14,'n'),(75,'Compiler Design\n','O. G. Kakde\n',14,'y'),(76,'Compiler Design: Simply In Depth\n','Ajit Singh',14,'n'),(77,'Compiler construction','W. M. Waite',14,'y'),(78,'Data Communications and Networking\n','Behrouz A. Forouzan',15,'y'),(79,'Computer Networking: A Top-Down Approach\n','Jim Kurose\n',15,'y'),(80,'Computer Networks\n','Andrew S. Tanenbaum\n',15,'n'),(81,'Computer Networking','Russell Scott\n',15,'n'),(82,'UNIX Network Programming\n','W. Richard Stevens\n',15,'y'),(83,'Introduction to the Design & Analysis of Algorithms','Anany Levitin',16,'y'),(84,'The Design and Analysis of Computer Algorithms\n','Alfred Aho, Jeffrey Ullman, John Hopcroft ',16,'n'),(85,'Algorithms: Design and Analysis\n','Harsh Bhasin\n',16,'n'),(86,'Introduction to Algorithms',' Thomas H. Cormen, Charles E. Leiserson',16,'y'),(87,'Design and Analysis of Algorithms: A Contemporary Perspective\n',' Amit Kumar, Sandeep Sen ',16,'y'),(88,'Introduction to Natural Language Processing books','Jacob Eisenstein',17,'y'),(89,'\nDeep Learning for Natural Language Processing','Stephan Raaijmakers ',17,'y'),(90,'Applied Machine Learning','M.Gopal',17,'y'),(91,'Applications of Machine Learning','Prashant Johri, ‎Jitendra Kumar Verma, ‎Sudip Paul ',17,'n'),(92,'\n\nMachine Learning','Tom M. Mitchell',17,'n'),(93,'Cloud Computing: Concepts, Technology & Architecture\n','Ricardo Puttini, Thomas Erl, and Zaigham Mahmood\n',18,'y'),(94,'Cloud Computing: From Beginning to End\n','Ray Rafaels\n',18,'y'),(95,'Cloud Computing: A Hands-on Approach','Arshdeep Bahga, Vijay K. Madisetti ',18,'y'),(96,'Mastering Cloud Computing: Foundations and Applications Programming\n','Christian Vecchiola, Rajkumar Buyya, S. Thamarai Selvi',18,'n'),(97,'Cloud Computing Design Patterns\n','Amin Naserpour, Robert J. Cope,Thomas Erl ',18,'n'),(98,'Data Mining: Concepts and Techniques\n','Jiawei Han\n',19,'y'),(99,'Data Mining: The Textbook\n','Charu C. Aggarwal\n',19,'n'),(100,'Data Mining and Analysis: Fundamental Concepts and Algorithms\n','Mohammed J. Zaki\n',19,'y'),(101,'Data Preparation for Data Mining','Dorian Pyle',19,'n'),(102,'Introduction to Data Mining','Vipin Kumar, Michael Steinbach, Anuj Karpatne\n',19,'y'),(103,'The Internet of Things','Samuel Greengard',20,'y'),(104,'Internet of Things, for Things, and by Things','Abhik Chaudhuri',20,'n'),(105,'Internet of Things: A Hands-On Approach','Arshdeep Bahga, ‎Vijay Madisetti',20,'n'),(106,'The Internet of Things: From Data to Insight','John Davies, ‎Carolina Fortuna ',20,'y'),(107,'Fundamentals of Internet of Things','Sudhir Kumar ',20,'y'),(108,'Principles of Information Security','Michael E Whitman, Herbert J Mattord',21,'y'),(109,'Information Security Fundamentals','Thomas R Peltier',21,'y'),(110,'Information Security: Policy, Processes, and Practices','Seymour Goodman',21,'n'),(111,' Information Security Principle and Practices','Mark Merkow',21,'n'),(112,'Elementary Information Security','Richard E. Smith',21,'y'),(113,'R for Data Science','Hadley Wickham',22,'y'),(114,'The Book of R: A First Course in Programming and Statistics','Tilman M. Davies',22,'y'),(115,'The Art of R Programming','Norman Matloff',22,'n'),(116,'Practical Data Science with R','Nina Zumel & John Mount',22,'y'),(117,'Advanced R','Hadley Wickham',22,'n'),(118,'Distributed systems: Principles and Paradigms','Andrew S. Tanenbaum',23,'n'),(119,'Designing Distributed Systems','Brendan Burns',23,'y'),(120,'Distributed Systems: Concepts and Design','George Coulouris, Jean Dollimore, and Tim Kindberg',23,'n'),(121,'Distributed Computing: Principles, Algorithms, and Systems','Ajay D. Kshemkalyani and Mukesh Singhal',23,'y'),(122,'Distributed Systems: An Algorithmic Approach','Sukumar Ghosh',23,'y'),(123,'Practical Statistics for Data Scientists','Andrew Bruce',24,'n'),(124,'Python Data Science Handbook','Jake VanderPlas',24,'y'),(125,'Doing Data Science','Cathy O\'Neil and Rachel Schutt',24,'y'),(126,'The Data Science Handbook','Henry Wang',24,'y'),(127,'An Introduction to Data Science','Jeffrey M. Stanton and Jeffrey S. Saltz',24,'y'),(128,'Cybersecurity for Beginners','Raef Meeuwisse',25,'y'),(129,'Cybersecurity Essentials','Donald Short',25,'n'),(130,'Cybersecurity and Cyberwar','Allan Friedman and P. W. Singer',25,'y'),(131,'Cybersecurity: The Beginner\'s Guide','Erdal Ozkaya',25,'n'),(132,'Cybersecurity: An Essential Guide','Lester Evans',25,'y'),(133,'Mobile Communications','Jochen Schiller',26,'n'),(134,'Mobile Computing','Kurnkum Garg',26,'y'),(135,'Mobile Computing','Asoke K Taludkar',26,'y'),(136,'Mobile Computing','Raj Kamal',26,'y'),(137,'A Survey of Mobile Transactions','Kluwer Academics',26,'n'),(138,NULL,NULL,27,'y'),(139,NULL,NULL,27,'n'),(140,NULL,NULL,27,'y'),(141,NULL,NULL,27,'y'),(142,NULL,NULL,27,'y');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `sno` int NOT NULL AUTO_INCREMENT,
  `rollno` varchar(40) NOT NULL,
  `book_name` varchar(150) NOT NULL,
  `book_author` varchar(150) NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'160419733069','Concepts of Programming Languages','Robert W. Sebesta','2022-01-09','2022-01-23'),(2,'160419733069','Modern Operating Systems','Andrew S. Tanenbaum','2022-01-13','2022-01-27'),(3,'160419733069','Computer Networking','Russell Scott ','2022-01-12','2022-01-26'),(4,'160419733069','BDSM 101','Shreya VS','2022-01-09','2022-01-23'),(5,'160419733066','Applications of Machine Learning','Prashant Johri, ‎Jitendra Kumar Verma, ‎Sudip Paul ','2022-01-09','2022-01-23'),(6,'160419733066','R for Data Science','Hadley Wickham','2022-01-10','2022-01-24'),(7,'160419733066','Cybersecurity and Cyberwar','Allan Friedman and P. W. Singer','2022-01-14','2022-01-28'),(8,'160419733076','Deep Learning','Aaron Courville, Ian Goodfellow, Yoshua Bengio ','2022-01-12','2022-01-27'),(9,'160420000000','Automata and Computability ','Dexter Kozen ','2022-01-11','2022-01-25');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Data Structures and Algorithms',3),(2,'Principles of Programming Languages',3),(3,'Java',4),(4,'Computer Organization',4),(5,'Database Management Systems',4),(6,'Software Engineering',5),(7,'Operating Systems',5),(8,'Automata Languages and Computation',5),(9,'Artificial Intelligence',5),(10,'Data Analytics',5),(11,'Blockchain Technologies',5),(12,'Web and Internet Technologies',5),(13,'Information Retrieval System',5),(14,'Compiler Design',6),(15,'Computer Networks',6),(16,'Design and Analysis of Algorithms',6),(17,'Machine Learning',6),(18,'Cloud Computing',6),(19,'Data Mining',6),(20,'Internet of Things',6),(21,'Information Security',7),(22,'Data Science using R Programming',7),(23,'Distributed Systems',7),(24,'Data Science',7),(25,'Cyber Security',7),(26,'Mobile Computing',8),(27,'Semantic Web and Social Networking',8),(28,'Principles of Electronic Communications',8),(29,'Mechatronics',8),(30,'Electric Transaction Systems',8),(31,'MISC',0);
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

-- Dump completed on 2022-02-18 13:31:48

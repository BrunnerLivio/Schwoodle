-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: schwoodle
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `absenz`
--

DROP TABLE IF EXISTS `absenz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absenz` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fach_Id` int(11) NOT NULL,
  `Metadaten_Id` int(11) NOT NULL,
  `Schüler_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Absenz_Fach1_idx` (`Fach_Id`),
  KEY `fk_Absenz_Metadaten1_idx` (`Metadaten_Id`),
  KEY `fk_Absenz_Schüler1_idx` (`Schüler_Id`),
  CONSTRAINT `fk_Absenz_Fach1` FOREIGN KEY (`Fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Absenz_Metadaten1` FOREIGN KEY (`Metadaten_Id`) REFERENCES `metadaten` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Absenz_Schüler1` FOREIGN KEY (`Schüler_Id`) REFERENCES `schüler` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absenz`
--

LOCK TABLES `absenz` WRITE;
/*!40000 ALTER TABLE `absenz` DISABLE KEYS */;
/*!40000 ALTER TABLE `absenz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fach`
--

DROP TABLE IF EXISTS `fach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fach` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(150) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fach`
--

LOCK TABLES `fach` WRITE;
/*!40000 ALTER TABLE `fach` DISABLE KEYS */;
INSERT INTO `fach` VALUES (1,'Mathe'),(2,'Deutsch'),(3,'M153');
/*!40000 ALTER TABLE `fach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasse`
--

DROP TABLE IF EXISTS `klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klasse` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse`
--

LOCK TABLES `klasse` WRITE;
/*!40000 ALTER TABLE `klasse` DISABLE KEYS */;
/*!40000 ALTER TABLE `klasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasse_fach`
--

DROP TABLE IF EXISTS `klasse_fach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klasse_fach` (
  `Klasse_Id` int(11) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fach_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Klasse_has_Fach_Klasse1_idx` (`Klasse_Id`),
  KEY `fk_Klasse_Fach_Fach1_idx` (`Fach_Id`),
  CONSTRAINT `fk_Klasse_Fach_Fach1` FOREIGN KEY (`Fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Klasse_has_Fach_Klasse1` FOREIGN KEY (`Klasse_Id`) REFERENCES `klasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse_fach`
--

LOCK TABLES `klasse_fach` WRITE;
/*!40000 ALTER TABLE `klasse_fach` DISABLE KEYS */;
/*!40000 ALTER TABLE `klasse_fach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrkraft`
--

DROP TABLE IF EXISTS `lehrkraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrkraft` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Einstellungsdatum` datetime NOT NULL,
  `Entlassungsdatum` datetime DEFAULT NULL,
  `Person_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Lehrkraft_Person1_idx` (`Person_Id`),
  CONSTRAINT `fk_Lehrkraft_Person1` FOREIGN KEY (`Person_Id`) REFERENCES `person` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrkraft`
--

LOCK TABLES `lehrkraft` WRITE;
/*!40000 ALTER TABLE `lehrkraft` DISABLE KEYS */;
INSERT INTO `lehrkraft` VALUES (1,'2000-05-16 00:00:00',NULL,4);
/*!40000 ALTER TABLE `lehrkraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lehrkraft_fach`
--

DROP TABLE IF EXISTS `lehrkraft_fach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lehrkraft_fach` (
  `Lehrkraft_Id` int(11) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fach_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Lehrkraft_has_Fach_Lehrkraft1_idx` (`Lehrkraft_Id`),
  KEY `fk_Lehrkraft_Fach_Fach1_idx` (`Fach_Id`),
  CONSTRAINT `fk_Lehrkraft_Fach_Fach1` FOREIGN KEY (`Fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lehrkraft_has_Fach_Lehrkraft1` FOREIGN KEY (`Lehrkraft_Id`) REFERENCES `lehrkraft` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lehrkraft_fach`
--

LOCK TABLES `lehrkraft_fach` WRITE;
/*!40000 ALTER TABLE `lehrkraft_fach` DISABLE KEYS */;
INSERT INTO `lehrkraft_fach` VALUES (1,1,3);
/*!40000 ALTER TABLE `lehrkraft_fach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadaten`
--

DROP TABLE IF EXISTS `metadaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadaten` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Erstellungsdatum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ErstellerEmail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadaten`
--

LOCK TABLES `metadaten` WRITE;
/*!40000 ALTER TABLE `metadaten` DISABLE KEYS */;
INSERT INTO `metadaten` VALUES (1,'2016-04-12 22:00:00','rolf.hirschi@gibz.ch'),(2,'2016-05-10 19:48:23','livio.brunner@hotmail.ch'),(3,'2016-05-10 19:48:23','manuel.pietro@juvenis.ch'),(4,'2016-05-10 19:48:23','manuel.pietro@juvenis.ch'),(5,'2016-05-10 19:48:23','livio.brunner@hotmail.com'),(6,'2016-05-10 19:48:23','nur2@jagino.ch'),(7,'2016-05-10 19:48:23','hunde.sohn@gmai.com');
/*!40000 ALTER TABLE `metadaten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Wert` double DEFAULT NULL,
  `Wertung` int(11) DEFAULT NULL,
  `ErreichtePunkte` double DEFAULT NULL,
  `MaximalPunkte` double DEFAULT NULL,
  `Schüler_Id` int(11) NOT NULL,
  `Metadaten_Id` int(11) NOT NULL,
  `Fach_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Note_Schüler1_idx` (`Schüler_Id`),
  KEY `fk_Note_Metadaten1_idx` (`Metadaten_Id`),
  KEY `fk_Note_Fach1_idx` (`Fach_Id`),
  CONSTRAINT `fk_Note_Fach1` FOREIGN KEY (`Fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Note_Metadaten1` FOREIGN KEY (`Metadaten_Id`) REFERENCES `metadaten` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Note_Schüler1` FOREIGN KEY (`Schüler_Id`) REFERENCES `schüler` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,5,100,8,10,2,1,3);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Vorname` varchar(45) NOT NULL,
  `Geburtstdatum` datetime NOT NULL,
  `Passwort` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Brunner','Livio','1998-08-21 00:00:00','1234','livio.brunner@hotmail.com'),(2,'Brunner','Livio','1998-08-21 00:00:00','81dc9bdb52d04dc20036dbd8313ed055','livio.brunner@hotmail.com'),(3,'Vognstrup','Lars','1998-08-25 00:00:00','827ccb0eea8a706c4c34a16891f84e7b','lars.vognstrup@hotmail.com'),(4,'Hirschi','Rolf','1990-04-03 00:00:00','e10adc3949ba59abbe56e057f20f883e','rolf.hirschi@gibz.ch');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prüfung`
--

DROP TABLE IF EXISTS `prüfung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prüfung` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Durchführungsdatum` datetime DEFAULT NULL,
  `Wertung` int(11) DEFAULT NULL,
  `MaximalPunkte` double DEFAULT NULL,
  `Lehrkraft_Id` int(11) NOT NULL,
  `fach_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_prüfung_lehrkraft_idx` (`Lehrkraft_Id`),
  KEY `fk_prüfung_fach1_idx` (`fach_Id`),
  CONSTRAINT `fk_prüfung_fach1` FOREIGN KEY (`fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prüfung_lehrkraft` FOREIGN KEY (`Lehrkraft_Id`) REFERENCES `lehrkraft` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prüfung`
--

LOCK TABLES `prüfung` WRITE;
/*!40000 ALTER TABLE `prüfung` DISABLE KEYS */;
/*!40000 ALTER TABLE `prüfung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schüler`
--

DROP TABLE IF EXISTS `schüler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schüler` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Schulbeginn` datetime NOT NULL,
  `Schulende` datetime NOT NULL,
  `Person_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Schüler_Person_idx` (`Person_Id`),
  CONSTRAINT `fk_Schüler_Person` FOREIGN KEY (`Person_Id`) REFERENCES `person` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schüler`
--

LOCK TABLES `schüler` WRITE;
/*!40000 ALTER TABLE `schüler` DISABLE KEYS */;
INSERT INTO `schüler` VALUES (1,'2015-08-16 00:00:00','2018-06-15 00:00:00',2),(2,'2015-08-16 00:00:00','2018-06-15 00:00:00',3);
/*!40000 ALTER TABLE `schüler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schüler_klasse`
--

DROP TABLE IF EXISTS `schüler_klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schüler_klasse` (
  `Schüler_Id` int(11) NOT NULL,
  `Klasse_Id` int(11) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`),
  KEY `fk_Schüler_has_Klasse_Klasse1_idx` (`Klasse_Id`),
  KEY `fk_Schüler_has_Klasse_Schüler1_idx` (`Schüler_Id`),
  CONSTRAINT `fk_Schüler_has_Klasse_Klasse1` FOREIGN KEY (`Klasse_Id`) REFERENCES `klasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schüler_has_Klasse_Schüler1` FOREIGN KEY (`Schüler_Id`) REFERENCES `schüler` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schüler_klasse`
--

LOCK TABLES `schüler_klasse` WRITE;
/*!40000 ALTER TABLE `schüler_klasse` DISABLE KEYS */;
/*!40000 ALTER TABLE `schüler_klasse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-01 10:38:17

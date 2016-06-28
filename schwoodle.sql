-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2016 at 09:31 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `schwoodle`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `GetAbsenzenFromThisYearBySchülerId`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAbsenzenFromThisYearBySchülerId`(IN schuelerId INT(4))
BEGIN
SELECT fach.Bezeichnung, metadaten.ErstellungsDatum FROM absenz
		INNER JOIN fach
		ON absenz.Fach_Id = fach.Id
		INNER JOIN metadaten
		ON absenz.Metadaten_Id = metadaten.Id
		WHERE absenz.Schüler_Id = schuelerId
		AND YEAR(metadaten.ErstellungsDatum) = YEAR(CURDATE());
END$$

DROP PROCEDURE IF EXISTS `GetFaecherByLehrkraftId`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFaecherByLehrkraftId`(IN LehrkraftId INT(4))
BEGIN
	SELECT Bezeichnung FROM fach
    WHERE Id = (SELECT Fach_Id FROM lehrkraft_fach WHERE Lehrkraft_Id = LehrkraftId);
END$$

DROP PROCEDURE IF EXISTS `GetNotenBySchülerId`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNotenBySchülerId`(IN schuelerId INT(4))
BEGIN
SELECT note.Id, note.Wert, note.ErreichtePunkte, note.MaximalPunkte, fach.Bezeichnung, metadaten.Erstellungsdatum
		FROM note
		INNER JOIN fach
		ON note.Fach_Id = fach.Id
		INNER JOIN metadaten
		ON note.Metadaten_Id = metadaten.Id
		WHERE Schüler_Id = schuelerId;
END$$

DROP PROCEDURE IF EXISTS `GetSchüler`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSchüler`()
BEGIN
	SELECT person.Name, person.Vorname, schüler.Id 
    From schüler
    INNER JOIN person
    ON schüler.Person_Id = person.Id;
END$$

DROP PROCEDURE IF EXISTS `InsertAbsenz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAbsenz`(IN schuelerId INT(4), IN lehrerId INT(4), IN fachId INT(4), IN datum timestamp)
BEGIN

    Set @LehrerPersonId = (Select Person_Id From lehrkraft Where Id = lehrerId);
    Set @ErstellerMail = (Select Email From person Where Id = @LehrerPersonId);
    Set @Jetzgrad = NOW();
    
	INSERT INTO metadaten (Erstellungsdatum, ErstellerEmail)
	VALUES (datum, @ErstellerMail);
    
    Set @MetadatenIdMAX = (SELECT max(id) FROM metadaten);
    
    INSERT INTO absenz (Fach_Id, Metadaten_Id, Schüler_Id)
    Values (fachId, @MetadatenIdMAX, schuelerId);
    
END$$

DROP PROCEDURE IF EXISTS `InsertNote`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNote`(IN wert INT(4), IN wertung INT(4), IN erreichtePunkte INT(4), IN maximalPunkte INT(4), IN schuelerId INT(4), IN lehrkraftId INT(4), IN fachId INT(4))
BEGIN
	Set @LehrerPersonId = (Select Person_Id From lehrkraft Where Id = lehrkraftId);
    Set @ErstellerMail = (Select Email From person Where Id = @LehrerPersonId);
    Set @Jetzgrad = NOW();
    
	INSERT INTO metadaten (Erstellungsdatum, ErstellerEmail)
	VALUES (@Jetzgrad, @ErstellerMail);
    
    Set @MetadatenIdMAX = (SELECT max(id) FROM metadaten);
    
    INSERT INTO note (Wert, Wertung, ErreichtePunkte, MaximalPunkte, Schüler_Id, Metadaten_Id, Fach_Id)
    VALUES (wert, wertung, erreichtePunkte, maximalPunkte, schuelerId, @MetadatenIdMAX, fachId);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `absenz`
--

DROP TABLE IF EXISTS `absenz`;
CREATE TABLE IF NOT EXISTS `absenz` (
`Id` int(11) NOT NULL,
  `Fach_Id` int(11) NOT NULL,
  `Metadaten_Id` int(11) NOT NULL,
  `Schüler_Id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `absenz`
--

TRUNCATE TABLE `absenz`;
--
-- Dumping data for table `absenz`
--

INSERT INTO `absenz` (`Id`, `Fach_Id`, `Metadaten_Id`, `Schüler_Id`) VALUES
(1, 2, 1, 4),
(2, 2, 10, 4),
(3, 2, 11, 4),
(4, 2, 12, 4),
(5, 2, 7, 4),
(6, 2, 7, 4),
(7, 2, 10, 4),
(8, 2, 13, 4),
(9, 3, 21, 4),
(10, 3, 22, 4),
(11, 3, 23, 4),
(12, 1, 24, 4),
(13, 1, 25, 4),
(14, 2, 26, 4),
(15, 2, 27, 4),
(16, 2, 28, 4),
(17, 2, 29, 4),
(18, 2, 30, 4),
(19, 1, 31, 4),
(20, 1, 32, 4),
(21, 1, 33, 4),
(22, 1, 34, 4),
(23, 1, 35, 4),
(24, 1, 36, 4),
(25, 1, 37, 4),
(26, 1, 38, 4),
(27, 1, 39, 4),
(28, 1, 40, 4),
(29, 1, 41, 4),
(30, 1, 42, 4),
(31, 1, 43, 4),
(32, 1, 44, 4),
(33, 1, 45, 4),
(34, 1, 46, 4),
(35, 1, 47, 4),
(36, 1, 48, 4),
(37, 1, 49, 4),
(38, 1, 50, 4),
(39, 1, 51, 4),
(40, 1, 52, 4),
(41, 1, 53, 4),
(42, 1, 54, 4),
(43, 1, 55, 4),
(44, 1, 56, 4),
(45, 1, 57, 4),
(46, 1, 58, 4),
(47, 1, 59, 4),
(48, 1, 60, 4),
(49, 1, 61, 4),
(50, 1, 62, 4),
(51, 1, 63, 4),
(52, 1, 64, 4),
(53, 1, 65, 4),
(54, 1, 66, 4),
(55, 1, 67, 4),
(56, 1, 68, 4),
(57, 1, 69, 4),
(58, 1, 70, 4),
(59, 1, 71, 4),
(60, 1, 72, 4),
(61, 1, 73, 4),
(62, 1, 74, 4),
(63, 1, 75, 4),
(64, 1, 76, 4),
(65, 1, 77, 4),
(66, 1, 78, 4),
(67, 1, 82, 4),
(68, 1, 83, 4);

-- --------------------------------------------------------

--
-- Table structure for table `fach`
--

DROP TABLE IF EXISTS `fach`;
CREATE TABLE IF NOT EXISTS `fach` (
`Id` int(11) NOT NULL,
  `Bezeichnung` varchar(150) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `fach`
--

TRUNCATE TABLE `fach`;
--
-- Dumping data for table `fach`
--

INSERT INTO `fach` (`Id`, `Bezeichnung`) VALUES
(1, 'Mathe'),
(2, 'Deutsch'),
(3, 'M153');

-- --------------------------------------------------------

--
-- Table structure for table `klasse`
--

DROP TABLE IF EXISTS `klasse`;
CREATE TABLE IF NOT EXISTS `klasse` (
`Id` int(11) NOT NULL,
  `Bezeichnung` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `klasse`
--

TRUNCATE TABLE `klasse`;
-- --------------------------------------------------------

--
-- Table structure for table `klasse_fach`
--

DROP TABLE IF EXISTS `klasse_fach`;
CREATE TABLE IF NOT EXISTS `klasse_fach` (
  `Klasse_Id` int(11) NOT NULL,
`Id` int(11) NOT NULL,
  `Fach_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `klasse_fach`
--

TRUNCATE TABLE `klasse_fach`;
-- --------------------------------------------------------

--
-- Table structure for table `lehrkraft`
--

DROP TABLE IF EXISTS `lehrkraft`;
CREATE TABLE IF NOT EXISTS `lehrkraft` (
`Id` int(11) NOT NULL,
  `Einstellungsdatum` datetime NOT NULL,
  `Entlassungsdatum` datetime DEFAULT NULL,
  `Person_Id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `lehrkraft`
--

TRUNCATE TABLE `lehrkraft`;
--
-- Dumping data for table `lehrkraft`
--

INSERT INTO `lehrkraft` (`Id`, `Einstellungsdatum`, `Entlassungsdatum`, `Person_Id`) VALUES
(1, '2000-05-16 00:00:00', NULL, 4),
(2, '2016-05-22 00:00:00', '2016-08-17 00:00:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `lehrkraft_fach`
--

DROP TABLE IF EXISTS `lehrkraft_fach`;
CREATE TABLE IF NOT EXISTS `lehrkraft_fach` (
  `Lehrkraft_Id` int(11) NOT NULL,
`Id` int(11) NOT NULL,
  `Fach_Id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `lehrkraft_fach`
--

TRUNCATE TABLE `lehrkraft_fach`;
--
-- Dumping data for table `lehrkraft_fach`
--

INSERT INTO `lehrkraft_fach` (`Lehrkraft_Id`, `Id`, `Fach_Id`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `metadaten`
--

DROP TABLE IF EXISTS `metadaten`;
CREATE TABLE IF NOT EXISTS `metadaten` (
`Id` int(11) NOT NULL,
  `Erstellungsdatum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ErstellerEmail` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `metadaten`
--

TRUNCATE TABLE `metadaten`;
--
-- Dumping data for table `metadaten`
--

INSERT INTO `metadaten` (`Id`, `Erstellungsdatum`, `ErstellerEmail`) VALUES
(1, '2016-04-12 22:00:00', 'rolf.hirschi@gibz.ch'),
(2, '2016-05-10 19:48:23', 'livio.brunner@hotmail.ch'),
(3, '2016-05-10 19:48:23', 'manuel.pietro@juvenis.ch'),
(4, '2016-05-10 19:48:23', 'manuel.pietro@juvenis.ch'),
(5, '2016-05-10 19:48:23', 'livio.brunner@hotmail.com'),
(6, '2016-05-10 19:48:23', 'nur2@jagino.ch'),
(7, '2016-05-10 19:48:23', 'hunde.sohn@gmai.com'),
(8, '2016-06-04 18:53:07', 'livio.brunner@hotmail.com'),
(9, '2016-06-03 18:53:07', 'livio.brunner@hotmail.com'),
(10, '2016-05-17 18:53:07', 'livio.brunner@hotmail.com'),
(11, '2016-05-19 18:53:07', 'livio.brunner@hotmail.com'),
(12, '2016-05-27 18:53:07', 'livio.brunner@hotmail.com'),
(13, '2016-02-08 19:53:07', 'livio.brunner@hotmail.com'),
(14, '2016-06-19 14:41:25', 'rolf.hirsch@gibz.ch'),
(15, '2016-06-19 14:41:25', 'rolf.hirsch@gibz.ch'),
(16, '2016-06-19 14:41:25', 'rolf.hirsch@gibz.ch'),
(17, '2016-06-19 14:41:25', 'rolf.hirsch@gibz.ch'),
(18, '2016-06-19 14:42:03', 'rolf.hirsch@gibz.ch'),
(19, '2016-06-19 14:42:03', 'rolf.hirsch@gibz.ch'),
(20, '2016-06-19 14:42:03', 'rolf.hirsch@gibz.ch'),
(21, '2016-06-19 14:42:45', 'rolf.hirsch@gibz.ch'),
(22, '2016-06-19 14:42:45', 'rolf.hirsch@gibz.ch'),
(23, '2016-06-19 14:42:45', 'rolf.hirsch@gibz.ch'),
(24, '2016-06-19 14:43:27', 'rolf.hirsch@gibz.ch'),
(25, '2016-06-19 14:43:27', 'rolf.hirsch@gibz.ch'),
(26, '2016-06-19 14:47:00', 'rolf.hirsch@gibz.ch'),
(27, '2016-06-19 14:47:00', 'rolf.hirsch@gibz.ch'),
(28, '2016-06-19 14:47:00', 'rolf.hirsch@gibz.ch'),
(29, '2016-06-19 14:47:00', 'rolf.hirsch@gibz.ch'),
(30, '2016-06-19 14:47:00', 'rolf.hirsch@gibz.ch'),
(31, '2016-06-19 14:52:55', 'rolf.hirsch@gibz.ch'),
(32, '2016-06-19 14:52:55', 'rolf.hirsch@gibz.ch'),
(33, '2016-06-19 14:53:25', 'rolf.hirsch@gibz.ch'),
(34, '2016-06-19 14:53:25', 'rolf.hirsch@gibz.ch'),
(35, '2016-06-19 14:53:25', 'rolf.hirsch@gibz.ch'),
(36, '2016-06-19 15:03:58', 'rolf.hirsch@gibz.ch'),
(37, '2016-06-19 15:03:58', 'rolf.hirsch@gibz.ch'),
(38, '2016-06-19 15:03:58', 'rolf.hirsch@gibz.ch'),
(39, '2016-06-19 15:09:43', 'rolf.hirsch@gibz.ch'),
(40, '2016-06-19 15:12:27', 'rolf.hirsch@gibz.ch'),
(41, '2016-06-19 15:12:27', 'rolf.hirsch@gibz.ch'),
(42, '2016-06-19 15:13:00', 'rolf.hirsch@gibz.ch'),
(43, '2016-06-19 15:13:00', 'rolf.hirsch@gibz.ch'),
(44, '2016-06-19 15:13:58', 'rolf.hirsch@gibz.ch'),
(45, '2016-06-19 15:14:46', 'rolf.hirsch@gibz.ch'),
(46, '2016-06-19 15:14:46', 'rolf.hirsch@gibz.ch'),
(47, '2016-06-19 15:15:02', 'rolf.hirsch@gibz.ch'),
(48, '2016-06-19 15:15:02', 'rolf.hirsch@gibz.ch'),
(49, '2016-06-19 15:15:42', 'rolf.hirsch@gibz.ch'),
(50, '2016-06-19 15:17:01', 'rolf.hirsch@gibz.ch'),
(51, '2016-06-19 15:17:01', 'rolf.hirsch@gibz.ch'),
(52, '2016-06-19 15:18:16', 'rolf.hirsch@gibz.ch'),
(53, '2016-06-19 15:18:16', 'rolf.hirsch@gibz.ch'),
(54, '2016-06-19 15:19:59', 'rolf.hirsch@gibz.ch'),
(55, '2016-06-19 15:20:47', 'rolf.hirsch@gibz.ch'),
(56, '2016-06-19 15:20:47', 'rolf.hirsch@gibz.ch'),
(57, '2016-06-19 15:26:20', 'rolf.hirsch@gibz.ch'),
(58, '2016-06-19 15:26:45', 'rolf.hirsch@gibz.ch'),
(59, '2016-06-19 15:26:45', 'rolf.hirsch@gibz.ch'),
(60, '2016-06-19 15:27:06', 'rolf.hirsch@gibz.ch'),
(61, '2016-06-19 15:28:59', 'rolf.hirsch@gibz.ch'),
(62, '2016-06-19 15:28:59', 'rolf.hirsch@gibz.ch'),
(63, '2016-06-19 15:30:23', 'rolf.hirsch@gibz.ch'),
(64, '2016-06-19 16:20:12', 'rolf.hirsch@gibz.ch'),
(65, '2016-06-19 16:20:12', 'rolf.hirsch@gibz.ch'),
(66, '2016-06-19 16:20:12', 'rolf.hirsch@gibz.ch'),
(67, '2016-06-19 16:20:12', 'rolf.hirsch@gibz.ch'),
(68, '2016-06-19 16:20:29', 'rolf.hirsch@gibz.ch'),
(69, '2016-06-19 16:20:29', 'rolf.hirsch@gibz.ch'),
(70, '2016-06-19 16:20:29', 'rolf.hirsch@gibz.ch'),
(71, '2016-06-19 16:22:11', 'rolf.hirsch@gibz.ch'),
(72, '2016-06-19 16:22:11', 'rolf.hirsch@gibz.ch'),
(73, '0000-00-00 00:00:00', 'rolf.hirsch@gibz.ch'),
(74, '0000-00-00 00:00:00', 'rolf.hirsch@gibz.ch'),
(75, '0000-00-00 00:00:00', 'rolf.hirsch@gibz.ch'),
(76, '0000-00-00 00:00:00', 'rolf.hirsch@gibz.ch'),
(77, '2016-08-31 22:00:00', 'rolf.hirsch@gibz.ch'),
(78, '2016-08-31 22:00:00', 'rolf.hirsch@gibz.ch'),
(79, '2016-06-19 17:30:28', 'rolf.hirsch@gibz.ch'),
(80, '2016-06-19 17:30:48', 'rolf.hirsch@gibz.ch'),
(81, '2016-06-19 17:31:21', 'rolf.hirsch@gibz.ch'),
(82, '2016-06-20 22:00:00', 'rolf.hirsch@gibz.ch'),
(83, '2016-06-20 22:00:00', 'rolf.hirsch@gibz.ch'),
(84, '2016-06-21 19:59:02', 'rolf.hirsch@gibz.ch');

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
`Id` int(11) NOT NULL,
  `Wert` double DEFAULT NULL,
  `Wertung` int(11) DEFAULT NULL,
  `ErreichtePunkte` double DEFAULT NULL,
  `MaximalPunkte` double DEFAULT NULL,
  `Schüler_Id` int(11) NOT NULL,
  `Metadaten_Id` int(11) NOT NULL,
  `Fach_Id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `note`
--

TRUNCATE TABLE `note`;
--
-- Dumping data for table `note`
--

INSERT INTO `note` (`Id`, `Wert`, `Wertung`, `ErreichtePunkte`, `MaximalPunkte`, `Schüler_Id`, `Metadaten_Id`, `Fach_Id`) VALUES
(1, 5, 100, 8, 10, 2, 1, 3),
(2, 5.6, 100, 14, 15, 4, 8, 2),
(3, 5.4, 100, 14, 15, 4, 9, 2),
(4, 3.8, 100, 14, 15, 4, 10, 1),
(5, 3.8, 100, 14, 15, 4, 11, 2),
(6, 4.6, 100, 14, 15, 4, 11, 1),
(7, 6, 100, 12, 12, 4, 79, 1),
(8, 6, 100, 12, 13, 4, 80, 1),
(9, 6, 100, 25, 25, 4, 81, 3),
(10, 6, 100, 15, 15, 4, 84, 1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
`Id` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Vorname` varchar(45) NOT NULL,
  `Geburtstdatum` datetime NOT NULL,
  `Passwort` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `person`
--

TRUNCATE TABLE `person`;
--
-- Dumping data for table `person`
--

INSERT INTO `person` (`Id`, `Name`, `Vorname`, `Geburtstdatum`, `Passwort`, `Email`) VALUES
(1, 'Brunner', 'Livio', '1998-08-21 00:00:00', '1234', 'livio.brunner@hotmail.com'),
(3, 'Vognstrup', 'Lars', '1998-08-25 00:00:00', '827ccb0eea8a706c4c34a16891f84e7b', 'lars.vognstrup@hotmail.com'),
(4, 'Brunners', 'Livio', '1990-04-03 00:00:00', 'e10adc3949ba59abbe56e057f20f883e', 'livio.brunner@hotmail.com'),
(5, 'Hirschi', 'Rolf', '2016-03-14 00:00:00', '1234', 'rolf.hirsch@gibz.ch');

-- --------------------------------------------------------

--
-- Table structure for table `prüfung`
--

DROP TABLE IF EXISTS `prüfung`;
CREATE TABLE IF NOT EXISTS `prüfung` (
`Id` int(11) NOT NULL,
  `Durchführungsdatum` datetime DEFAULT NULL,
  `Wertung` int(11) DEFAULT NULL,
  `MaximalPunkte` double DEFAULT NULL,
  `Lehrkraft_Id` int(11) NOT NULL,
  `fach_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `prüfung`
--

TRUNCATE TABLE `prüfung`;
-- --------------------------------------------------------

--
-- Table structure for table `schüler`
--

DROP TABLE IF EXISTS `schüler`;
CREATE TABLE IF NOT EXISTS `schüler` (
`Id` int(11) NOT NULL,
  `Schulbeginn` datetime NOT NULL,
  `Schulende` datetime NOT NULL,
  `Person_Id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `schüler`
--

TRUNCATE TABLE `schüler`;
--
-- Dumping data for table `schüler`
--

INSERT INTO `schüler` (`Id`, `Schulbeginn`, `Schulende`, `Person_Id`) VALUES
(2, '2015-08-16 00:00:00', '2018-06-15 00:00:00', 3),
(4, '2016-03-07 00:00:00', '2016-06-29 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `schüler_klasse`
--

DROP TABLE IF EXISTS `schüler_klasse`;
CREATE TABLE IF NOT EXISTS `schüler_klasse` (
  `Schüler_Id` int(11) NOT NULL,
  `Klasse_Id` int(11) NOT NULL,
`Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `schüler_klasse`
--

TRUNCATE TABLE `schüler_klasse`;
--
-- Indexes for dumped tables
--

--
-- Indexes for table `absenz`
--
ALTER TABLE `absenz`
 ADD PRIMARY KEY (`Id`), ADD KEY `fk_Absenz_Fach1_idx` (`Fach_Id`), ADD KEY `fk_Absenz_Metadaten1_idx` (`Metadaten_Id`), ADD KEY `fk_Absenz_Schüler1_idx` (`Schüler_Id`);

--
-- Indexes for table `fach`
--
ALTER TABLE `fach`
 ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `klasse`
--
ALTER TABLE `klasse`
 ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `klasse_fach`
--
ALTER TABLE `klasse_fach`
 ADD PRIMARY KEY (`Id`), ADD KEY `fk_Klasse_has_Fach_Klasse1_idx` (`Klasse_Id`), ADD KEY `fk_Klasse_Fach_Fach1_idx` (`Fach_Id`);

--
-- Indexes for table `lehrkraft`
--
ALTER TABLE `lehrkraft`
 ADD PRIMARY KEY (`Id`), ADD KEY `fk_Lehrkraft_Person1_idx` (`Person_Id`);

--
-- Indexes for table `lehrkraft_fach`
--
ALTER TABLE `lehrkraft_fach`
 ADD PRIMARY KEY (`Id`), ADD KEY `fk_Lehrkraft_has_Fach_Lehrkraft1_idx` (`Lehrkraft_Id`), ADD KEY `fk_Lehrkraft_Fach_Fach1_idx` (`Fach_Id`);

--
-- Indexes for table `metadaten`
--
ALTER TABLE `metadaten`
 ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
 ADD PRIMARY KEY (`Id`), ADD KEY `fk_Note_Schüler1_idx` (`Schüler_Id`), ADD KEY `fk_Note_Metadaten1_idx` (`Metadaten_Id`), ADD KEY `fk_Note_Fach1_idx` (`Fach_Id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
 ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `prüfung`
--
ALTER TABLE `prüfung`
 ADD PRIMARY KEY (`Id`), ADD KEY `fk_prüfung_lehrkraft_idx` (`Lehrkraft_Id`), ADD KEY `fk_prüfung_fach1_idx` (`fach_Id`);

--
-- Indexes for table `schüler`
--
ALTER TABLE `schüler`
 ADD PRIMARY KEY (`Id`), ADD KEY `fk_Schüler_Person_idx` (`Person_Id`);

--
-- Indexes for table `schüler_klasse`
--
ALTER TABLE `schüler_klasse`
 ADD PRIMARY KEY (`Id`), ADD KEY `fk_Schüler_has_Klasse_Klasse1_idx` (`Klasse_Id`), ADD KEY `fk_Schüler_has_Klasse_Schüler1_idx` (`Schüler_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absenz`
--
ALTER TABLE `absenz`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `fach`
--
ALTER TABLE `fach`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `klasse`
--
ALTER TABLE `klasse`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `klasse_fach`
--
ALTER TABLE `klasse_fach`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lehrkraft`
--
ALTER TABLE `lehrkraft`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `lehrkraft_fach`
--
ALTER TABLE `lehrkraft_fach`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `metadaten`
--
ALTER TABLE `metadaten`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `prüfung`
--
ALTER TABLE `prüfung`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `schüler`
--
ALTER TABLE `schüler`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `schüler_klasse`
--
ALTER TABLE `schüler_klasse`
MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `absenz`
--
ALTER TABLE `absenz`
ADD CONSTRAINT `fk_Absenz_Fach1` FOREIGN KEY (`Fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Absenz_Metadaten1` FOREIGN KEY (`Metadaten_Id`) REFERENCES `metadaten` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Absenz_Schüler1` FOREIGN KEY (`Schüler_Id`) REFERENCES `schüler` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `klasse_fach`
--
ALTER TABLE `klasse_fach`
ADD CONSTRAINT `fk_Klasse_Fach_Fach1` FOREIGN KEY (`Fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Klasse_has_Fach_Klasse1` FOREIGN KEY (`Klasse_Id`) REFERENCES `klasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lehrkraft`
--
ALTER TABLE `lehrkraft`
ADD CONSTRAINT `fk_Lehrkraft_Person1` FOREIGN KEY (`Person_Id`) REFERENCES `person` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lehrkraft_fach`
--
ALTER TABLE `lehrkraft_fach`
ADD CONSTRAINT `fk_Lehrkraft_Fach_Fach1` FOREIGN KEY (`Fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Lehrkraft_has_Fach_Lehrkraft1` FOREIGN KEY (`Lehrkraft_Id`) REFERENCES `lehrkraft` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `note`
--
ALTER TABLE `note`
ADD CONSTRAINT `fk_Note_Fach1` FOREIGN KEY (`Fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Note_Metadaten1` FOREIGN KEY (`Metadaten_Id`) REFERENCES `metadaten` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Note_Schüler1` FOREIGN KEY (`Schüler_Id`) REFERENCES `schüler` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `prüfung`
--
ALTER TABLE `prüfung`
ADD CONSTRAINT `fk_prüfung_fach1` FOREIGN KEY (`fach_Id`) REFERENCES `fach` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_prüfung_lehrkraft` FOREIGN KEY (`Lehrkraft_Id`) REFERENCES `lehrkraft` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `schüler`
--
ALTER TABLE `schüler`
ADD CONSTRAINT `fk_Schüler_Person` FOREIGN KEY (`Person_Id`) REFERENCES `person` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schüler_klasse`
--
ALTER TABLE `schüler_klasse`
ADD CONSTRAINT `fk_Schüler_has_Klasse_Klasse1` FOREIGN KEY (`Klasse_Id`) REFERENCES `klasse` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Schüler_has_Klasse_Schüler1` FOREIGN KEY (`Schüler_Id`) REFERENCES `schüler` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

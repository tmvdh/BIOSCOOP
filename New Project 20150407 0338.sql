-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.21


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cinema
--

CREATE DATABASE IF NOT EXISTS cinema;
USE cinema;

--
-- Definition of table `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE `films` (
  `Film_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Year` year(4) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Runtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Film_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `films`
--

/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` (`Film_ID`,`Title`,`Year`,`Description`,`Runtime`) VALUES 
 (1,'Harry Potter and the Philosopher\'s Stone',2001,'Harry learns that he\'s a wizard!',159),
 (2,'Harry Potter and the Chamber of Secrets',2002,'Snakes!',174),
 (3,'Harry Potter and the Prisoner of Azkaban',2003,'Something wicked this way comes!',142);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;


--
-- Definition of table `screens`
--

DROP TABLE IF EXISTS `screens`;
CREATE TABLE `screens` (
  `Screen_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Seats` int(10) unsigned NOT NULL,
  `Width` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Screen_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screens`
--

/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` (`Screen_ID`,`Seats`,`Width`) VALUES 
 (1,180,15),
 (2,180,15),
 (3,225,15),
 (4,300,15),
 (5,270,15);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;


--
-- Definition of table `shows`
--

DROP TABLE IF EXISTS `shows`;
CREATE TABLE `shows` (
  `Show_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Film_ID` int(10) unsigned NOT NULL,
  `Screen_ID` int(10) unsigned NOT NULL,
  `Time` datetime NOT NULL,
  PRIMARY KEY (`Show_ID`),
  KEY `FK_film` (`Film_ID`),
  KEY `FK_screen` (`Screen_ID`),
  CONSTRAINT `FK_film` FOREIGN KEY (`Film_ID`) REFERENCES `films` (`Film_ID`),
  CONSTRAINT `FK_screen` FOREIGN KEY (`Screen_ID`) REFERENCES `screens` (`Screen_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shows`
--

/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` (`Show_ID`,`Film_ID`,`Screen_ID`,`Time`) VALUES 
 (1,2,1,'2015-04-08 20:00:00'),
 (2,1,3,'2015-04-08 20:00:00'),
 (3,3,2,'2015-04-08 20:00:00'),
 (4,3,1,'2015-04-08 20:00:00'),
 (5,3,2,'2015-04-08 20:00:00');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;


--
-- Definition of table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `Ticket_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` int(10) unsigned NOT NULL,
  `Show_ID` int(10) unsigned NOT NULL,
  `Seat` int(10) unsigned NOT NULL,
  `Barcode` varchar(20) NOT NULL,
  PRIMARY KEY (`Ticket_ID`),
  KEY `FK_show` (`Show_ID`),
  KEY `FK_user` (`User_ID`),
  CONSTRAINT `FK_show` FOREIGN KEY (`Show_ID`) REFERENCES `shows` (`Show_ID`),
  CONSTRAINT `FK_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` (`Ticket_ID`,`User_ID`,`Show_ID`,`Seat`,`Barcode`) VALUES 
 (1,1,2,50,'');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `User_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Fname` varchar(45) NOT NULL,
  `Sname` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`User_ID`,`Fname`,`Sname`,`Email`) VALUES 
 (1,'Tom','Vanderheijden','tom@dftba.eu');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

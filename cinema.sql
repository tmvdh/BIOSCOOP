-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2015 at 05:28 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE IF NOT EXISTS `films` (
`Film_ID` int(10) unsigned NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Year` year(4) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Runtime` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`Film_ID`, `Title`, `Year`, `Description`, `Runtime`) VALUES
(1, 'Harry Potter and the Philosopher''s Stone', 2001, 'Harry learns that he''s a wizard!', 159),
(2, 'Harry Potter and the Chamber of Secrets', 2002, 'Snakes!', 174),
(3, 'Harry Potter and the Prisoner of Azkaban', 2003, 'Something wicked this way comes!', 142);

-- --------------------------------------------------------

--
-- Table structure for table `screens`
--

CREATE TABLE IF NOT EXISTS `screens` (
`Screen_ID` int(10) unsigned NOT NULL,
  `Seats` int(10) unsigned NOT NULL,
  `Width` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screens`
--

INSERT INTO `screens` (`Screen_ID`, `Seats`, `Width`) VALUES
(1, 180, 15),
(2, 180, 15),
(3, 225, 15),
(4, 300, 15);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE IF NOT EXISTS `shows` (
`Show_ID` int(10) unsigned NOT NULL,
  `Film_ID` int(10) unsigned NOT NULL,
  `Screen_ID` int(10) unsigned NOT NULL,
  `Time` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`Show_ID`, `Film_ID`, `Screen_ID`, `Time`) VALUES
(1, 2, 1, '2015-04-04 20:00:00'),
(2, 1, 3, '2015-04-04 16:45:00'),
(3, 3, 2, '2015-04-04 22:00:00'),
(4, 3, 1, '2015-04-03 01:00:00'),
(5, 3, 2, '2015-04-03 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
`Ticket_ID` int(10) unsigned NOT NULL,
  `User_ID` int(10) unsigned NOT NULL,
  `Show_ID` int(10) unsigned NOT NULL,
  `Seat` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`User_ID` int(10) unsigned NOT NULL,
  `Fname` varchar(45) NOT NULL,
  `Sname` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `films`
--
ALTER TABLE `films`
 ADD PRIMARY KEY (`Film_ID`);

--
-- Indexes for table `screens`
--
ALTER TABLE `screens`
 ADD PRIMARY KEY (`Screen_ID`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
 ADD PRIMARY KEY (`Show_ID`), ADD KEY `FK_film` (`Film_ID`), ADD KEY `FK_screen` (`Screen_ID`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
 ADD PRIMARY KEY (`Ticket_ID`), ADD KEY `FK_show` (`Show_ID`), ADD KEY `FK_user` (`User_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
MODIFY `Film_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `screens`
--
ALTER TABLE `screens`
MODIFY `Screen_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
MODIFY `Show_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
MODIFY `Ticket_ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `User_ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
ADD CONSTRAINT `FK_film` FOREIGN KEY (`Film_ID`) REFERENCES `films` (`Film_ID`),
ADD CONSTRAINT `FK_screen` FOREIGN KEY (`Screen_ID`) REFERENCES `screens` (`Screen_ID`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
ADD CONSTRAINT `FK_show` FOREIGN KEY (`Show_ID`) REFERENCES `shows` (`Show_ID`),
ADD CONSTRAINT `FK_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

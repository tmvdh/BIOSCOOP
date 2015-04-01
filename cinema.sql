-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Machine: 127.0.0.1
-- Gegenereerd op: 01 apr 2015 om 13:58
-- Serverversie: 5.6.21
-- PHP-versie: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `cinema`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `films`
--

CREATE TABLE IF NOT EXISTS `films` (
`Film_ID` int(10) unsigned NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Year` year(4) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Runtime` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `screens`
--

CREATE TABLE IF NOT EXISTS `screens` (
`Screen_ID` int(10) unsigned NOT NULL,
  `Seats` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `shows`
--

CREATE TABLE IF NOT EXISTS `shows` (
`Show_ID` int(10) unsigned NOT NULL,
  `Film_ID` int(10) unsigned NOT NULL,
  `Screen_ID` int(10) unsigned NOT NULL,
  `Time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
`Ticket_ID` int(10) unsigned NOT NULL,
  `User_ID` int(10) unsigned NOT NULL,
  `Show_ID` int(10) unsigned NOT NULL,
  `Seat` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`User_ID` int(10) unsigned NOT NULL,
  `Fname` varchar(45) NOT NULL,
  `Sname` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `films`
--
ALTER TABLE `films`
 ADD PRIMARY KEY (`Film_ID`);

--
-- Indexen voor tabel `screens`
--
ALTER TABLE `screens`
 ADD PRIMARY KEY (`Screen_ID`);

--
-- Indexen voor tabel `shows`
--
ALTER TABLE `shows`
 ADD PRIMARY KEY (`Show_ID`), ADD KEY `FK_film` (`Film_ID`), ADD KEY `FK_screen` (`Screen_ID`);

--
-- Indexen voor tabel `tickets`
--
ALTER TABLE `tickets`
 ADD PRIMARY KEY (`Ticket_ID`), ADD KEY `FK_show` (`Show_ID`), ADD KEY `FK_user` (`User_ID`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `films`
--
ALTER TABLE `films`
MODIFY `Film_ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `screens`
--
ALTER TABLE `screens`
MODIFY `Screen_ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `shows`
--
ALTER TABLE `shows`
MODIFY `Show_ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `tickets`
--
ALTER TABLE `tickets`
MODIFY `Ticket_ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
MODIFY `User_ID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `shows`
--
ALTER TABLE `shows`
ADD CONSTRAINT `FK_film` FOREIGN KEY (`Film_ID`) REFERENCES `films` (`Film_ID`),
ADD CONSTRAINT `FK_screen` FOREIGN KEY (`Screen_ID`) REFERENCES `screens` (`Screen_ID`);

--
-- Beperkingen voor tabel `tickets`
--
ALTER TABLE `tickets`
ADD CONSTRAINT `FK_show` FOREIGN KEY (`Show_ID`) REFERENCES `shows` (`Show_ID`),
ADD CONSTRAINT `FK_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

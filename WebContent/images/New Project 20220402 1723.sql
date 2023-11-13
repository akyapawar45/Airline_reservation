-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.47


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema airline
--

CREATE DATABASE IF NOT EXISTS airline;
USE airline;

--
-- Definition of table `airline`
--

DROP TABLE IF EXISTS `airline`;
CREATE TABLE `airline` (
  `al_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_id` int(10) unsigned NOT NULL,
  `pname` varchar(45) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY (`al_id`),
  KEY `FK_airline_1` (`ar_id`),
  CONSTRAINT `FK_airline_1` FOREIGN KEY (`ar_id`) REFERENCES `airlinename` (`ar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline`
--

/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` (`al_id`,`ar_id`,`pname`,`image`) VALUES 
 (5,1,'Mark151','airline/WIN_20200218_22_25_06_Pro.jpg'),
 (6,1,'mark152','airline/WIN_20200218_22_25_06_Pro.jpg'),
 (7,1,'m30','airline/WIN_20200218_22_25_06_Pro.jpg'),
 (8,1,'Demo','airline/Jetliner-Airplane-Flying-777x518.jpg');
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;


--
-- Definition of table `airlinename`
--

DROP TABLE IF EXISTS `airlinename`;
CREATE TABLE `airlinename` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airlinename`
--

/*!40000 ALTER TABLE `airlinename` DISABLE KEYS */;
INSERT INTO `airlinename` (`ar_id`,`ar_name`) VALUES 
 (1,'Kingfisher');
/*!40000 ALTER TABLE `airlinename` ENABLE KEYS */;


--
-- Definition of table `airpoort`
--

DROP TABLE IF EXISTS `airpoort`;
CREATE TABLE `airpoort` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airpoort`
--

/*!40000 ALTER TABLE `airpoort` DISABLE KEYS */;
INSERT INTO `airpoort` (`aid`,`name`,`city`,`address`) VALUES 
 (1,'Latur Airport','Latur','12 No. Barshi road.'),
 (2,'Barshi Airport','Barshi','Barshi, Solapur');
/*!40000 ALTER TABLE `airpoort` ENABLE KEYS */;


--
-- Definition of table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cityname` varchar(45) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`cid`,`cityname`) VALUES 
 (1,'Latur'),
 (2,'Pune');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `plain_body`
--

DROP TABLE IF EXISTS `plain_body`;
CREATE TABLE `plain_body` (
  `pl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_id` int(10) unsigned NOT NULL,
  `al_id` int(10) unsigned NOT NULL,
  `seat_row` varchar(45) NOT NULL,
  `bfrom` varchar(45) NOT NULL,
  `bto` varchar(45) NOT NULL,
  PRIMARY KEY (`pl_id`),
  KEY `FK_plain_body_1` (`ar_id`) USING BTREE,
  KEY `FK_plain_body_2` (`al_id`),
  CONSTRAINT `FK_plain_body_1` FOREIGN KEY (`ar_id`) REFERENCES `airlinename` (`ar_id`),
  CONSTRAINT `FK_plain_body_2` FOREIGN KEY (`al_id`) REFERENCES `airline` (`al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plain_body`
--

/*!40000 ALTER TABLE `plain_body` DISABLE KEYS */;
INSERT INTO `plain_body` (`pl_id`,`ar_id`,`al_id`,`seat_row`,`bfrom`,`bto`) VALUES 
 (4,1,5,'40','1','10'),
 (5,1,6,'38','1','8'),
 (6,1,7,'50','1','10');
/*!40000 ALTER TABLE `plain_body` ENABLE KEYS */;


--
-- Definition of table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `r_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `mob` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` (`r_id`,`name`,`mob`,`email`,`pass`) VALUES 
 (1,'ashish Gokhale','8087422232','ashishgokhalem314@gmail.com','yo'),
 (2,'Mahesh Ramesh Sherekar','9834951863','maheshsherekar20@gmail.com','123456');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;


--
-- Definition of table `rout`
--

DROP TABLE IF EXISTS `rout`;
CREATE TABLE `rout` (
  `r_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_id` varchar(45) NOT NULL,
  `source` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `ar_id` int(10) unsigned NOT NULL,
  `al_id` int(10) unsigned NOT NULL,
  `seattype` varchar(45) NOT NULL,
  `price` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`r_id`),
  KEY `FK_rout_1` (`ar_id`),
  KEY `FK_rout_2` (`al_id`),
  CONSTRAINT `FK_rout_1` FOREIGN KEY (`ar_id`) REFERENCES `airlinename` (`ar_id`),
  CONSTRAINT `FK_rout_2` FOREIGN KEY (`al_id`) REFERENCES `airline` (`al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rout`
--

/*!40000 ALTER TABLE `rout` DISABLE KEYS */;
INSERT INTO `rout` (`r_id`,`a_id`,`source`,`destination`,`ar_id`,`al_id`,`seattype`,`price`,`time`,`date`) VALUES 
 (2,'select Airport Name','Latur','Latur',1,5,'Economy','2400','10:45','2020-02-12'),
 (3,'Barshi Airport','Pune','Latur',1,8,'Economy','4000','11:12','2022-03-29'),
 (4,'Barshi Airport','Pune','Latur',1,8,'Economy','2000','12:29','2022-03-31');
/*!40000 ALTER TABLE `rout` ENABLE KEYS */;


--
-- Definition of table `seatbook`
--

DROP TABLE IF EXISTS `seatbook`;
CREATE TABLE `seatbook` (
  `s_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seat` varchar(45) DEFAULT NULL,
  `u_id` varchar(45) DEFAULT NULL,
  `p_id` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `aid` varchar(45) DEFAULT NULL,
  `rout_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seatbook`
--

/*!40000 ALTER TABLE `seatbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `seatbook` ENABLE KEYS */;


--
-- Definition of table `seatbookfinal`
--

DROP TABLE IF EXISTS `seatbookfinal`;
CREATE TABLE `seatbookfinal` (
  `seatbookfinal_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` varchar(45) DEFAULT NULL,
  `p_id` varchar(45) DEFAULT NULL,
  `seat` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `gtotal` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `aid` varchar(45) DEFAULT NULL,
  `rout_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seatbookfinal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seatbookfinal`
--

/*!40000 ALTER TABLE `seatbookfinal` DISABLE KEYS */;
INSERT INTO `seatbookfinal` (`seatbookfinal_id`,`u_id`,`p_id`,`seat`,`price`,`gtotal`,`date`,`time`,`aid`,`rout_id`) VALUES 
 (1,'2','8','a1','2000','8000','2022-03-31','12:29','2','3'),
 (2,'2','8','b1','2000','8000','2022-03-31','12:29','2','3'),
 (3,'2','8','c2','2000','8000','2022-03-31','12:29','2','3'),
 (4,'2','8','a2','2000','8000','2022-03-31','12:29','2','3'),
 (5,'2','8','c1','2000','2000','2022-03-31','12:29','2','3'),
 (6,'2','8','a1','4000','8000','2022-03-29','11:12','2','3'),
 (7,'2','8','b2','4000','8000','2022-03-29','11:12','2','3'),
 (8,'2','8','c1','4000','8000','2022-03-29','11:12','2','3'),
 (9,'2','8','e3','4000','8000','2022-03-29','11:12','2','3'),
 (10,'2','8','d1','4000','8000','2022-03-29','11:12','2','3'),
 (11,'2','8','f5','4000','8000','2022-03-29','11:12','2','3'),
 (12,'2','8','e1','4000','8000','2022-03-29','11:12','2','3'),
 (13,'2','8','f1','4000','8000','2022-03-29','11:12','2','3'),
 (14,'2','8','d2','4000','8000','2022-03-29','11:12','2','3'),
 (15,'2','8','f2','4000','8000','2022-03-29','11:12','2','3');
/*!40000 ALTER TABLE `seatbookfinal` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

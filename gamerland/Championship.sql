-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 208.91.198.197:3306
-- Generation Time: Aug 20, 2016 at 06:58 AM
-- Server version: 5.1.69
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Championship`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`championship`@`%` PROCEDURE `getChampTableDetails`(IN `champid` INT, IN `userid` INT, IN `opponentid` INT, IN `roundid` INT)
    NO SQL
BEGIN

Select User.`username`,User.`profile_pic`,O.`username` as oppuser,O.`profile_pic` as opppic,ImagesTable.`TotalRounds`,ImagesTable.UserRegistered,Round.Round FROM User,Round,ScheduleRound,User AS O,ImagesTable WHERE ScheduleRound.RoundId=Round.RoundId AND User.user_id=ScheduleRound.UserId AND O.user_id=ScheduleRound.OpponentId AND ImagesTable.imgId=ScheduleRound.ChampionshipId AND ScheduleRound.`ChampionshipId`=champid AND ScheduleRound.`UserId`=userid AND ScheduleRound.`OpponentId`=opponentid AND ScheduleRound.RoundId=roundid;



END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ChampTable`
--

CREATE TABLE IF NOT EXISTS `ChampTable` (
  `ChampTableId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `NumberOfPlayers` text NOT NULL,
  `TotalNumberOfMatches` text NOT NULL,
  `CurrentNumberOfMatch` text NOT NULL,
  `GameType` text NOT NULL,
  `CurrentOpponentId` int(11) NOT NULL,
  `CurrentOpponentName` text NOT NULL,
  `CurrentOpponentImg` text NOT NULL,
  `CurrentOpponentScore` text NOT NULL,
  `UserName` text NOT NULL,
  `userImg` text NOT NULL,
  `CurrentUserScore` text NOT NULL,
  `GameName` text NOT NULL,
  `Platform` text NOT NULL,
  PRIMARY KEY (`ChampTableId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ChampTable`
--

INSERT INTO `ChampTable` (`ChampTableId`, `userId`, `NumberOfPlayers`, `TotalNumberOfMatches`, `CurrentNumberOfMatch`, `GameType`, `CurrentOpponentId`, `CurrentOpponentName`, `CurrentOpponentImg`, `CurrentOpponentScore`, `UserName`, `userImg`, `CurrentUserScore`, `GameName`, `Platform`) VALUES
(1, 2, '100', '7', '7', 'NUMERIC', 2, 'Pankaj', 'pankaj.png', '5', 'Ashish', 'ashish.png', '10', 'Call Of Duty', 'PlayStation4'),
(2, 2, '100', '7', '6', 'NUMERIC', 5, 'Dheeraj', 'Dheeraj.jpg', '6', 'Ashish', 'ashish.png', '8', 'Call Of Duty', 'PlayStation4'),
(3, 2, '100', '7', '5', 'NUMERIC', 7, 'Prashant', 'Prashant.jpg', '10', 'Ashish', 'ashish.png', '12', 'Call Of Duty', 'PlayStation4'),
(4, 2, '100', '7', '4', 'NUMERIC', 3, 'Gaurav', 'gaurav.png', '6', 'Ashish', 'ashish.png', '8', 'Call Of Duty', 'Play Station 4'),
(5, 2, '100', '7', '3', 'NUMERIC', 4, 'Akshay', 'akshay.png', '9', 'Ashish', 'ashish.png', '10', 'Call Of Duty', 'play Station4');

-- --------------------------------------------------------

--
-- Table structure for table `CreditCardDetails`
--

CREATE TABLE IF NOT EXISTS `CreditCardDetails` (
  `cardno` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` text NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `cardholdername` text NOT NULL,
  `cardtype` text NOT NULL,
  `userid` int(11) NOT NULL,
  `firstfourdigit` text NOT NULL,
  `secondfourdigit` text NOT NULL,
  `thirdfourdigit` text NOT NULL,
  `fourthfourdigit` text NOT NULL,
  PRIMARY KEY (`cardno`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `CreditCardDetails`
--

INSERT INTO `CreditCardDetails` (`cardno`, `fullname`, `month`, `year`, `cardholdername`, `cardtype`, `userid`, `firstfourdigit`, `secondfourdigit`, `thirdfourdigit`, `fourthfourdigit`) VALUES
(1, 'ashish', 8, 2020, 'ashish', 'visa-160.png', 1, '1234', '5678', '4321', '8765'),
(3, 'ashish', 8, 2020, 'ashish', 'visa', 2, '1122', '2211', '1212', '2121');

-- --------------------------------------------------------

--
-- Table structure for table `Dispute`
--

CREATE TABLE IF NOT EXISTS `Dispute` (
  `DisputeId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Attachments` text NOT NULL,
  `Comments` text NOT NULL,
  PRIMARY KEY (`DisputeId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Dispute`
--

INSERT INTO `Dispute` (`DisputeId`, `UserId`, `Attachments`, `Comments`) VALUES
(1, 0, '25607-01-12-48-53-PM.png,47807-01-12-50-13-PM.png', 'hi'),
(2, 0, '81807-01-12-58-14-PM.png', 'wrong result'),
(3, 0, '31707-02-12-55-01-PM.png', 'he is wrong'),
(4, 33, '97608-12-11-25-19-AM.png', 'kehfjdhsafuhduif'),
(5, 33, '[IMG_20160729_114026564_HDR.jpg, IMG_20160714_174716419_HDR.jpg, IMG_20160727_010200379.jpg]', 'Dbbd'),
(6, 33, '[IMG_20160724_224957463.jpg, IMG_20160812_115418829_HDR.jpg, IMG_20160729_114026564_HDR.jpg, IMG_20160714_174716419_HDR.jpg]', 'Csc'),
(7, 33, '[IMG_20160812_115418829_HDR.jpg, IMG_20160729_114026564_HDR.jpg, IMG_20160714_174716419_HDR.jpg, IMG_20160724_224957463.jpg, IMG_20160727_010200379.jpg]', 'Testing'),
(8, 33, '[Screenshot_2016-08-16-10-00-20.png, Screenshot_2016-08-16-09-59-59.png, Screenshot_2016-08-16-09-59-50.png, Screenshot_2016-08-16-09-59-41.png, Screenshot_2016-08-16-09-59-03.png]', 'Fvvh');

-- --------------------------------------------------------

--
-- Table structure for table `FacebookDetails`
--

CREATE TABLE IF NOT EXISTS `FacebookDetails` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `Email` text NOT NULL,
  `Name` text NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `FacebookDetails`
--

INSERT INTO `FacebookDetails` (`fid`, `Email`, `Name`) VALUES
(1, 'Email', 'Name'),
(2, 'Email', 'Name'),
(3, 'garud.ashish51@gmail.com', 'Ashish Garud'),
(4, 'garud.ashish51@gmail.com', 'Ashish Garud'),
(5, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(6, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(7, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(8, 'garud.ashish51@gmail.com', 'Ashish Garud'),
(9, 'garud.ashish51@gmail.com', 'Ashish Garud'),
(10, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(11, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(12, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(13, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(14, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(15, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(16, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(17, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(18, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(19, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(20, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(21, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(22, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(23, 'ronankenupp@hotmail.com', 'Ronan Kenupp'),
(24, 'ronankenupp@hotmail.com', 'Ronan Kenupp');

-- --------------------------------------------------------

--
-- Table structure for table `FinancialSummary`
--

CREATE TABLE IF NOT EXISTS `FinancialSummary` (
  `fsid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `spent` int(11) NOT NULL,
  `won` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `year` text NOT NULL,
  PRIMARY KEY (`fsid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `FinancialSummary`
--

INSERT INTO `FinancialSummary` (`fsid`, `userid`, `spent`, `won`, `credit`, `balance`, `year`) VALUES
(1, 33, 200, 1000, 50, 100020, '2016'),
(2, 33, 1000, 3434, 343423, 432421, '2015'),
(3, 33, 888, 2222, 2121, 21222, '2003');

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

CREATE TABLE IF NOT EXISTS `Games` (
  `gameid` int(11) NOT NULL AUTO_INCREMENT,
  `gamename` text NOT NULL,
  `gameImage` text NOT NULL,
  PRIMARY KEY (`gameid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Games`
--

INSERT INTO `Games` (`gameid`, `gamename`, `gameImage`) VALUES
(1, 'Call Of Duty', 'callofduty.png'),
(2, 'FIFA 16', 'fifa.png'),
(3, 'BattelField', 'battlefield.png');

-- --------------------------------------------------------

--
-- Table structure for table `ImagesTable`
--

CREATE TABLE IF NOT EXISTS `ImagesTable` (
  `imgId` int(11) NOT NULL AUTO_INCREMENT,
  `images` text NOT NULL,
  `gameName` text NOT NULL,
  `platform` text NOT NULL,
  `gamePrice` text NOT NULL,
  `until` text NOT NULL,
  `purchasePrize` text NOT NULL,
  `gameType` text NOT NULL,
  `UserRegistered` int(11) NOT NULL,
  `TotalRounds` int(11) NOT NULL,
  PRIMARY KEY (`imgId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `ImagesTable`
--

INSERT INTO `ImagesTable` (`imgId`, `images`, `gameName`, `platform`, `gamePrice`, `until`, `purchasePrize`, `gameType`, `UserRegistered`, `TotalRounds`) VALUES
(1, '2.png', 'BATTLEFIELD 4', 'PLAYSTATION 4', '10', '09/30/2016', '320', 'ALPHA', 10, 5),
(2, 'callofduty.png', 'CALL OF DUTY II', 'PLAYSTATION 3', '15', '09/30/2016', '560', 'ALPHA', 0, 0),
(3, 'fifa.png', 'FIFA 16', 'XBOX ONE', '20', '09/28/2016', '120', 'NUMERIC', 4, 2),
(4, 'pes.png', 'PES 2016', 'PC', '15', '09/15/2016', '520', 'NUMERIC', 10, 5),
(23, '1.png', 'BATTLEFIELD1', 'PLAYSTATION', '20', '09/18/2016', '120', 'ALPHA', 0, 0),
(22, '2.png', 'BATTLEFIELD1', 'PLAYSTATION', '20', '09/20/2016', '120', 'ALPHA', 0, 0),
(21, '3.png', 'BATTLEFIELD1', 'PLAYSTATION', '20', '07/10/2016', '120', 'ALPHA', 0, 0),
(20, '4.png', 'BATTLEFIELD1', 'PLAYSTATION', '20', '07/08/2016', '120', 'ALPHA', 0, 0),
(19, 'battlefield6.png', 'BATTLEFIELD1', 'PLAYSTATION', '20', '07/08/2016', '120', 'ALPHA', 0, 0),
(18, 'battlefield5.png', 'BATTLEFIELD1', 'PLAYSTATION', '20', '07/08/2016', '120', 'ALPHA', 0, 0),
(17, 'battlefield4.png', 'BATTLEFIELD1', 'PLAYSTATION', '20', '07/08/2016', '120', 'ALPHA', 0, 0),
(16, 'battlefield3.png', 'BATTLEFIELD1', 'PLAYSTATION', '20', '07/08/2016', '120', 'ALPHA', 0, 0),
(15, 'battlefield2.png', 'BATTLEFIELD1', 'PLAYSTATION', '20', '07/08/2016', '120', 'ALPHA', 0, 0),
(25, 'callofduty2.png', 'CALLOFDUTY', 'PLAYSTATION', '20', '08/05/2016', '120', 'ALPHA', 0, 0),
(26, 'callofduty3.png', 'CALLOFDUTY', 'PLAYSTATION', '20', '08/05/2016', '120', 'ALPHA', 0, 0),
(27, 'callofduty4.png', 'CALLOFDUTY', 'PLAYSTATION', '20', '08/05/2016', '120', 'ALPHA', 0, 0),
(28, 'callofduty5.png', 'CALLOFDUTY', 'PLAYSTATION', '20', '08/05/2016', '120', 'ALPHA', 0, 0),
(29, 'callofduty6.png', 'CALLOFDUTY', 'PLAYSTATION', '20', '08/05/2016', '120', 'ALPHA', 0, 0),
(30, 'callofduty7.png', 'CALLOFDUTY', 'PLAYSTATION', '20', '08/05/2016', '120', 'ALPHA', 0, 0),
(31, 'callofduty8.png', 'CALLOFDUTY', 'PLAYSTATION', '20', '08/05/2016', '120', 'ALPHA', 0, 0),
(32, 'callofduty9.png', 'CALLOFDUTY', 'PLAYSTATION', '20', '08/05/2016', '120', 'ALPHA', 0, 0),
(33, 'fifa1.png', 'FIFA', 'PLAYSTATION', '20', '09/05/2016', '120', 'NUMERIC', 0, 0),
(39, 'strawberry.ico', 'Hatim-Game', 'PLAYSTATION 41', '99', '12/30/2016', '2001', 'game', 0, 11),
(38, 'metacpan.ico', 'Somegame', 'PLAYSTATION 41', '991', '12/30/2016', '2001', 'NUMERIC1', 1, 11),
(37, 'fifa.png', 'Hatim-Game', 'PLAYSTATION 4', '99', '09/30/2016', '200', 'NUMERIC', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `LogTable`
--

CREATE TABLE IF NOT EXISTS `LogTable` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `date` text NOT NULL,
  `why` text NOT NULL,
  `category` text NOT NULL,
  `howmuch` text NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `LogTable`
--

INSERT INTO `LogTable` (`logid`, `userid`, `date`, `why`, `category`, `howmuch`, `status`) VALUES
(1, 1, '10-06-2016', 'credit', 'ADDED', '10', 'ACTIVE'),
(2, 1, '12-10-2016', 'FIFA Championship Won', 'ADDED', '300', 'PROCESSING'),
(3, 1, '13-10-2016', 'Call Of Duty Championship Lost', 'SUBTRACTED', '300', 'PROCESSING'),
(6, 33, '07-15-2016', 'Credit', 'ADDED', '10', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `masterChampRound`
--

CREATE TABLE IF NOT EXISTS `masterChampRound` (
  `masterChampRoundId` int(11) NOT NULL AUTO_INCREMENT,
  `MinimumLimt` int(11) NOT NULL,
  `MaximumLimit` int(11) NOT NULL,
  `Rounds` int(11) NOT NULL,
  PRIMARY KEY (`masterChampRoundId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `masterChampRound`
--

INSERT INTO `masterChampRound` (`masterChampRoundId`, `MinimumLimt`, `MaximumLimit`, `Rounds`) VALUES
(1, 1, 2, 1),
(2, 3, 4, 2),
(3, 5, 8, 3),
(4, 9, 16, 4),
(5, 17, 32, 5),
(6, 33, 64, 6),
(7, 65, 128, 7),
(8, 129, 256, 8),
(9, 257, 512, 9),
(10, 513, 1024, 10),
(11, 1025, 2048, 11),
(12, 2049, 4096, 12),
(13, 4097, 8192, 13),
(14, 8193, 16384, 14),
(15, 16385, 32768, 15),
(16, 32769, 65536, 16);

-- --------------------------------------------------------

--
-- Table structure for table `MyChampionship`
--

CREATE TABLE IF NOT EXISTS `MyChampionship` (
  `MychampionshipId` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `champid` int(11) NOT NULL,
  `status` text,
  PRIMARY KEY (`MychampionshipId`),
  KEY `userid` (`userid`),
  KEY `champid` (`champid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `MyChampionship`
--

INSERT INTO `MyChampionship` (`MychampionshipId`, `userid`, `champid`, `status`) VALUES
(4, 33, 4, 'Waiting'),
(14, 1, 3, 'Waiting'),
(13, 4, 3, 'Waiting'),
(15, 2, 3, 'Waiting'),
(16, 36, 4, 'Waiting');

-- --------------------------------------------------------

--
-- Table structure for table `MyGames`
--

CREATE TABLE IF NOT EXISTS `MyGames` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gamename` text NOT NULL,
  `gameimage` text NOT NULL,
  `userid` text NOT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `MyGames`
--

INSERT INTO `MyGames` (`gid`, `gamename`, `gameimage`, `userid`) VALUES
(18, 'mmm', 'india', '1'),
(16, 'abc', 'bbc', '1'),
(65, 'FIFA 16', 'callofduty.png', '98'),
(17, 'ashish', 'india', '1'),
(64, 'BattelField', 'fifa.png', '98'),
(20, 'BattelField', 'battlefield.png', '32'),
(21, 'Call Of Duty', 'callofduty.png', '32'),
(22, 'Call Of Duty', 'callofduty.png', '33'),
(23, 'FIFA 16', 'fifa.png', '33'),
(24, 'FIFA 16', 'fifa.png', '34'),
(25, 'Call Of Duty', 'callofduty.png', '34'),
(26, 'Call Of Duty', 'callofduty.png', '36'),
(27, 'BattelField', 'battlefield.png', '36'),
(28, 'FIFA 16', 'fifa.png', '36'),
(29, 'FIFA 16', 'fifa.png', '37'),
(30, 'Call Of Duty', 'callofduty.png', '38'),
(31, 'BattelField', 'battlefield.png', '38'),
(32, 'FIFA 16', 'fifa.png', '38'),
(33, 'Call Of Duty', 'callofduty.png', '39'),
(34, 'FIFA 16', 'fifa.png', '39'),
(35, 'FIFA 16', 'fifa.png', '40'),
(36, 'Call Of Duty', 'callofduty.png', '41'),
(37, 'FIFA 16', 'fifa.png', '41'),
(38, 'Call Of Duty', 'callofduty.png', '42'),
(39, 'FIFA 16', 'fifa.png', '42'),
(40, 'Call Of Duty', 'callofduty.png', '43'),
(41, 'FIFA 16', 'fifa.png', '43'),
(42, 'FIFA 16', 'fifa.png', '44'),
(43, 'BattelField', 'battlefield.png', '44'),
(44, 'Call Of Duty', 'callofduty.png', '47'),
(45, 'FIFA 16', 'fifa.png', '47'),
(46, 'BattelField', 'battlefield.png', '47'),
(47, 'god of war', 'god of war.png', '90'),
(48, 'battlefield', 'battlefield.png', '90'),
(49, 'battlefield', 'battlefield.png', '91'),
(50, 'god of war', 'god of war.png', '91'),
(51, 'fifa', 'fifa.png', '91'),
(52, 'god of war', 'god of war.png', '92'),
(53, 'battlefield', 'battlefield.png', '92'),
(54, 'BattelField', 'fifa.png', '93'),
(55, 'FIFA 16', 'callofduty.png', '93'),
(56, 'BattelField', 'fifa.png', '94'),
(57, 'FIFA 16', 'callofduty.png', '94'),
(58, 'FIFA 16', 'callofduty.png', '95'),
(59, 'BattelField', 'fifa.png', '95'),
(60, 'Call Of Duty', 'callofduty.png', '96'),
(61, 'FIFA 16', 'fifa.png', '96'),
(62, 'Call Of Duty', 'callofduty.png', '97'),
(63, 'FIFA 16', 'fifa.png', '97'),
(66, 'BattelField', 'fifa.png', '99'),
(67, 'FIFA 16', 'callofduty.png', '99'),
(68, 'FIFA 16', 'callofduty.png', '101'),
(69, 'BattelField', 'fifa.png', '101');

-- --------------------------------------------------------

--
-- Table structure for table `PromoCode`
--

CREATE TABLE IF NOT EXISTS `PromoCode` (
  `promoId` int(11) NOT NULL AUTO_INCREMENT,
  `Code` text NOT NULL,
  `HowMuch` text NOT NULL,
  `Status` text NOT NULL,
  PRIMARY KEY (`promoId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `PromoCode`
--

INSERT INTO `PromoCode` (`promoId`, `Code`, `HowMuch`, `Status`) VALUES
(1, 'QWCZX123', '10', 'False'),
(2, 'QWZC135HH', '10', 'True'),
(3, 'WNBZX13TU', '10', 'True');

-- --------------------------------------------------------

--
-- Table structure for table `Ranking`
--

CREATE TABLE IF NOT EXISTS `Ranking` (
  `RankingNumber` int(11) NOT NULL AUTO_INCREMENT,
  `Rank` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `UserName` text NOT NULL,
  `Medal` int(11) NOT NULL,
  `Loss` int(11) NOT NULL,
  `Trophee` int(11) NOT NULL,
  PRIMARY KEY (`RankingNumber`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Ranking`
--

INSERT INTO `Ranking` (`RankingNumber`, `Rank`, `userId`, `UserName`, `Medal`, `Loss`, `Trophee`) VALUES
(1, 1, 1, 'ashish', 3, 4, 2),
(2, 3, 2, 'Cook', 2, 4, 1),
(3, 2, 36, 'newtesting', 0, 0, 0),
(4, 4, 33, 'testing', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `RegisterForChampionship`
--

CREATE TABLE IF NOT EXISTS `RegisterForChampionship` (
  `RegisterChampId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `ChampionshipId` int(11) NOT NULL,
  `PaymentInfo` int(11) NOT NULL,
  PRIMARY KEY (`RegisterChampId`),
  KEY `UserId` (`UserId`),
  KEY `ChampionshipId` (`ChampionshipId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Results`
--

CREATE TABLE IF NOT EXISTS `Results` (
  `resultId` int(11) NOT NULL AUTO_INCREMENT,
  `ChampId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `OpponentId` int(11) NOT NULL,
  `UserScore` text NOT NULL,
  `OpponentScore` text NOT NULL,
  `Round` int(11) NOT NULL,
  `Status` text NOT NULL,
  PRIMARY KEY (`resultId`),
  KEY `WinnerId` (`UserId`),
  KEY `LosserId` (`OpponentId`),
  KEY `ChampId` (`ChampId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Results`
--

INSERT INTO `Results` (`resultId`, `ChampId`, `UserId`, `OpponentId`, `UserScore`, `OpponentScore`, `Round`, `Status`) VALUES
(1, 1, 1, 33, '15', '10', 1, 'CLOSED'),
(4, 1, 2, 33, '10', '15', 2, 'CLOSED');

-- --------------------------------------------------------

--
-- Table structure for table `Round`
--

CREATE TABLE IF NOT EXISTS `Round` (
  `RoundId` int(11) NOT NULL AUTO_INCREMENT,
  `Round` int(11) NOT NULL,
  `ChampId` int(11) NOT NULL,
  `Status` text NOT NULL,
  `PlayDate` text NOT NULL,
  PRIMARY KEY (`RoundId`),
  KEY `ChampId` (`ChampId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Round`
--

INSERT INTO `Round` (`RoundId`, `Round`, `ChampId`, `Status`, `PlayDate`) VALUES
(1, 1, 1, 'Waiting', '07/13/2016'),
(2, 2, 1, 'Waiting', '08/07/2016'),
(3, 3, 1, 'Waiting', '10/07/2016');

-- --------------------------------------------------------

--
-- Table structure for table `ScheduleMaster`
--

CREATE TABLE IF NOT EXISTS `ScheduleMaster` (
  `ScheduledId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `MatchPlayed` int(11) NOT NULL,
  `MatchTillFinal` int(11) NOT NULL,
  `NextOpponent` text NOT NULL,
  `UserRank` int(11) NOT NULL,
  `OpponentRank` int(11) NOT NULL,
  `PlayRoundUntil` text NOT NULL,
  `champId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ScheduledId`),
  KEY `champId` (`champId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ScheduleMaster`
--

INSERT INTO `ScheduleMaster` (`ScheduledId`, `userId`, `MatchPlayed`, `MatchTillFinal`, `NextOpponent`, `UserRank`, `OpponentRank`, `PlayRoundUntil`, `champId`) VALUES
(1, 33, 2, 0, 'newtest', 4, 2, '10/07/2015', 1),
(2, 36, 2, 1, '1', 33, 1, '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `SchedulePushMessage`
--

CREATE TABLE IF NOT EXISTS `SchedulePushMessage` (
  `PushId` int(11) NOT NULL AUTO_INCREMENT,
  `ScheduleId` int(11) NOT NULL,
  `FirstUserId` int(11) NOT NULL,
  `SecondUserId` int(11) NOT NULL,
  `PushDate` text NOT NULL,
  `PushTime` text NOT NULL,
  `Message` text NOT NULL,
  `Status` text NOT NULL,
  PRIMARY KEY (`PushId`),
  KEY `FirstUserId` (`FirstUserId`),
  KEY `SecondUserId` (`SecondUserId`),
  KEY `ScheduleId` (`ScheduleId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `SchedulePushMessage`
--

INSERT INTO `SchedulePushMessage` (`PushId`, `ScheduleId`, `FirstUserId`, `SecondUserId`, `PushDate`, `PushTime`, `Message`, `Status`) VALUES
(1, 1, 33, 1, '10/12/2016', '20.00PM', 'I got a Message', 'REQUEST'),
(6, 1, 1, 33, '10-12-2016', '12:07', 'Got Mail', 'ACCEPT'),
(7, 1, 1, 33, '10-12-2017', '12.08', 'hi I have no time', 'ACCEPT'),
(8, 1, 33, 1, '14/07/2016', '01:24 PM', 'hi i dont have time', 'REQUEST'),
(5, 1, 1, 2, '12/07/2016', '02:56 ', 'hi\n', 'REQUEST'),
(9, 1, 33, 1, '14/07/2016', '01:26 PM', 'hi  this is not schedule time for me', 'REQUEST'),
(10, 3, 33, 1, '14/07/2016', '03:25 PM', 'got msg... suits the time', 'REQUEST');

-- --------------------------------------------------------

--
-- Table structure for table `ScheduleRound`
--

CREATE TABLE IF NOT EXISTS `ScheduleRound` (
  `ScheduleRoundId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `OpponentId` int(11) NOT NULL,
  `ChampionshipId` int(11) NOT NULL,
  `RoundId` int(11) NOT NULL,
  `Time` text NOT NULL,
  `Date` text NOT NULL,
  `Status` text NOT NULL,
  PRIMARY KEY (`ScheduleRoundId`),
  KEY `UserId` (`UserId`),
  KEY `OpponentId` (`OpponentId`),
  KEY `ChampionshipId` (`ChampionshipId`),
  KEY `RoundId` (`RoundId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ScheduleRound`
--

INSERT INTO `ScheduleRound` (`ScheduleRoundId`, `UserId`, `OpponentId`, `ChampionshipId`, `RoundId`, `Time`, `Date`, `Status`) VALUES
(1, 33, 1, 1, 1, '10.00AM', '10/12/2016', 'WAITING'),
(2, 33, 2, 1, 2, '10:10', '08/07/2016', 'WAITING'),
(3, 33, 36, 1, 3, '10:10', '10/07/2016', 'WAITING');

-- --------------------------------------------------------

--
-- Table structure for table `Support`
--

CREATE TABLE IF NOT EXISTS `Support` (
  `SupportId` int(11) NOT NULL AUTO_INCREMENT,
  `Issue` text NOT NULL,
  `Comment` text NOT NULL,
  `Attachments` text NOT NULL,
  PRIMARY KEY (`SupportId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `Support`
--

INSERT INTO `Support` (`SupportId`, `Issue`, `Comment`, `Attachments`) VALUES
(1, '', '', 'file.zip'),
(2, 'asas', 'asasa', ''),
(3, 'not  getting logs', 'its not  working', '693202016-06-30-02-55-10-PM.png,6062652016-06-30-02-55-59-PM.png'),
(4, 'crash when open a game', 'dislike', '4306-30-03-20-57-PM.png,26006-30-03-21-15-PM.png,806-30-03-21-26-PM.png'),
(5, 'does not  get proper output', ' app without ads..', '52406-30-03-27-08-PM.png'),
(6, 'dffgxfg', 'gcc', '20206-30-03-28-12-PM.png'),
(7, 'Getting back  oop up', '\n', '32807-04-02-24-31-PM.png'),
(8, 'too much problem', 'getting issue\n', '33107-04-02-43-43-PM.png'),
(9, 'too much problem', 'getting issue\n', '33107-04-02-43-43-PM.png'),
(10, 'too much problem', 'getting issue\n', '33107-04-02-43-43-PM.png'),
(11, 'getting issue', 'not getting response\n', '11407-04-02-47-02-PM.png'),
(12, 'Issue one', 'Comment one', 'Attachment one'),
(13, 'Issue one', 'Comment one', 'Attachment one'),
(14, 'won match', 'Won the match', '208-09-04-02-20-PM.png,8208-09-04-02-30-PM.png'),
(15, 'loss the match', 'Won the match', '47808-09-04-09-44-PM.png,27408-09-04-09-56-PM.png,85708-09-04-10-05-PM.png'),
(16, 'abc', 'Abc', '61308-09-04-14-33-PM.png,18508-09-04-14-52-PM.png'),
(17, 'abc', 'Abc', '97208-09-04-19-25-PM.png,32508-09-04-19-37-PM.png'),
(18, 'Issue one', 'Comment one', 'Attachment one'),
(19, 'Issue one', 'Comment one', 'Attachment one'),
(20, 'Issue one', 'Comment one', 'Attachment one'),
(21, 'Issue one', 'Comment one', 'Attachment one'),
(22, 'Payment Fails', 'whenever I use visa card payment fails', '[tmp1470810099265.png]'),
(23, 'Payment Fails', 'whenever I use visa card payment fails', '[tmp1470810099265.png]'),
(24, 'Payment Fails', 'whenever I use visa card payment fails', '[tmp1470810099265.png]'),
(25, 'Testing', 'testing the same time as', '[IMG_20160729_114026564_HDR.jpg, IMG_20160727_010200379.jpg]'),
(26, 'Akshay Test', 'you can get y', '[IMG_20160729_114026564_HDR.jpg, IMG_20160714_174716419_HDR.jpg, IMG_20160727_010200379.jpg]');

-- --------------------------------------------------------

--
-- Table structure for table `TentativeSchedule`
--

CREATE TABLE IF NOT EXISTS `TentativeSchedule` (
  `TentativeId` int(11) NOT NULL AUTO_INCREMENT,
  `RoundId` int(11) NOT NULL,
  `ChampId` int(11) NOT NULL,
  `FirstUserId` int(11) NOT NULL,
  `SecondUserId` int(11) NOT NULL,
  `Status` text NOT NULL,
  PRIMARY KEY (`TentativeId`),
  KEY `ChampId` (`ChampId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `TentativeSchedule`
--

INSERT INTO `TentativeSchedule` (`TentativeId`, `RoundId`, `ChampId`, `FirstUserId`, `SecondUserId`, `Status`) VALUES
(1, 1, 1, 2, 33, 'WAITING');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` text NOT NULL,
  `country` text NOT NULL,
  `platform` text NOT NULL,
  `username` text NOT NULL,
  `language` text NOT NULL,
  `profile_pic` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `facebookLogin` text,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`user_id`, `fullname`, `country`, `platform`, `username`, `language`, `profile_pic`, `password`, `email`, `facebookLogin`) VALUES
(1, 'ashish', 'india', 'ps-4', 'Ash3', 'English', '10307-04-02-42-46-PM.png', '123', 'ashish.garud@gmail.com', 'NO'),
(33, 'ashish', 'India', 'Xbox One', 'testing', 'English', 'dgavcgv.png', '123456', 'testing@test.com', 'NO'),
(35, 'abc', 'India', 'PC', 'abc', 'English', '10307-04-02-42-46-PM.png', '123456', 'abc@abc.com', 'NO'),
(36, 'newtest', 'India', 'Xbox One', 'newtest', 'English', '5789112016-07-12-11-11-31-PM.png', '123456', 'new@new.com', 'NO'),
(97, 'Amitkumar Ghodke', 'India', 'PlayStation 4', 'amit', 'English', 'https://scontent.xx.fbcdn.net/v/t1.0-1/s200x200/1918235_1006445772747453_5635808988056330978_n.jpg?oh=4e44ae7f44e81c3367c82834a255f251&oe=5813B87D', '', 'amitkumar.ghodke@gmail.com', 'YES'),
(40, 'Sagar Kumar', 'India', 'PlayStation 3', 's', 'English', '2037372016-07-20-05-39-14-PM.png', '', 'saurabhk721@gmail.com', 'YES'),
(41, 'mmmmmm', 'India', 'PlayStation 3', 'mmmmm', 'English', '643182016-07-21-01-21-12-PM.png', '123456', 'mm@mm.com', 'NO'),
(43, 'demo', 'India', 'PlayStation 3', 'demo', 'English', '3099062016-07-21-03-42-57-PM.png', '123456', 'demo@demo.com', 'NO'),
(44, 'Akshay', 'India', 'PlayStation 3', 'akshay', 'English', '7335162016-08-02-06-45-45-PM.png', '123456', 'akshay@gmail.com', 'NO'),
(45, 'hjjkk', 'India', 'Playstation 3', 'bbbbb', 'English', 'YAZ.png', '12345678', 'hhnb@trst.com', 'NO'),
(46, 'akshay', 'India', 'Playstation 3', 'akshay3015', 'English', 'YAZ.png', '12345678', 'akshay@test.com', 'NO'),
(47, 'akshay', 'India', 'PlayStation 4', 'bambi', 'English', '2477202016-07-19-02-17-50-PM.png', '123456', 'akshay@test.com', 'NO'),
(48, 'akshay', 'India', 'Playstation 3', 'akshay12', 'English', 'YAZ.png', '12345678', 'test@test.com', 'NO'),
(49, 'gamr', 'India', 'Playstation 3', 'gamer', 'English', 'YAZ.png', '12341234', 'gamer@test.com', 'NO'),
(50, 'game', 'India', 'Playstation 3', 'gamer1', 'English', 'YAZ.png', '12341234', 'gamer@test.com', 'NO'),
(51, 'games', 'India', 'Playstation 3', 'game', 'English', 'YAZ.png', '12341234', 'game@test.com', 'NO'),
(52, 'akshaygd', 'India', 'Playstation 3', 'user', 'English', 'YAZ.png', '12341234', 'user@test.com', 'NO'),
(53, 'sagar', 'India', 'Playstation 3', 'sagar', 'English', 'YAZ.png', '12341234', 'sagar@testing.com', 'NO'),
(54, 'qwerry', 'India', 'Playstation 3', 'qwe', 'English', 'YAZ.png', '12341234', 'gsg@test.com', 'NO'),
(55, 'qwerry', 'India', 'Playstation 3', 'qweyy', 'English', 'YAZ.png', '12341234', 'gh@test.com', 'NO'),
(56, 'bdbd', 'India', 'Playstation 3', 'qhdbdh', 'English', 'YAZ.png', '12341234', 'testf@test.com', 'NO'),
(57, 'hsbdbb', 'India', 'Playstation 3', 'asas', 'English', 'YAZ.png', '12341234', 'g@test.com', 'NO'),
(58, 'absb', 'India', 'Playstation 3', 'gdgdbdb', 'English', 'YAZ.png', '12341234', 'gsg@test.com', 'NO'),
(59, 'hddh', 'India', 'Playstation 3', 'qweeer', 'English', 'YAZ.png', '12341234', 'hsh@test.com', 'NO'),
(60, 'vbxbx', 'India', 'Playstation 3', 'hdbdb', 'English', 'YAZ.png', '12341234', 'test@test.com', 'NO'),
(61, 'fbsb', 'India', 'Playstation 3', 'vsv', 'English', 'YAZ.png', '12341234', 'gsg@test.com', 'NO'),
(62, 'bxb', 'India', 'Playstation 3', 'gdbdb', 'English', 'YAZ.png', '12341234', 'gdg@test.com', 'NO'),
(63, 'vzvzv', 'India', 'Playstation 3', 'dgbs', 'English', 'YAZ.png', '12341234', 'gs@hs.mm', 'NO'),
(64, 'fff', 'India', 'Playstation 3', 'dgbsd', 'English', 'YAZ.png', '12341234', 'gs@hs.mm', 'NO'),
(65, 'sbbdb', 'India', 'Playstation 3', 'sgs', 'English', 'YAZ.png', '12341234', 'gssg@twsds.snsn', 'NO'),
(66, 'bsbdb', 'India', 'Playstation 3', 'bxbdb', 'English', 'YAZ.png', '12341234', 'bs@test.com', 'NO'),
(67, 'bdbd', 'India', 'Playstation 3', 'bxbd', 'English', 'YAZ.png', '12341234', 'test@test.com', 'NO'),
(68, 'vzvzv', 'India', 'Playstation 3', 'usertf', 'English', 'YAZ.png', '12341234', 'gh@hh.mm', 'NO'),
(69, 'hshs', 'India', 'Playstation 3', 'gdvd', 'English', 'YAZ.png', '12341234', 'hd@jd.jdj', 'NO'),
(70, 'bxbx', 'India', 'Playstation 3', 'hdhdbx', 'English', 'YAZ.png', '12341234', 'hs@hd.dd', 'NO'),
(71, 'dbbd', 'India', 'Playstation 3', 'bzbz', 'English', 'YAZ.png', '12341234', 'hh@yest.com', 'NO'),
(72, 'of', 'India', 'Playstation 3', 'ycxyx', 'English', 'YAZ.png', '12341234', 'testingvh@hh.nn', 'NO'),
(73, 'bsbdb', 'India', 'Playstation 3', 'vdhsb', 'English', 'YAZ.png', '12341234', 'hshs@teat.com', 'NO'),
(74, 'hdhd', 'India', 'Playstation 3', 'hsjsj', 'English', 'YAZ.png', '12341234', 'hah@hs.bdm', 'NO'),
(75, 'vxvxb', 'India', 'Playstation 3', 'userns', 'English', 'YAZ.png', '12341234', 'ga@hs.nd', 'NO'),
(76, 'Prashant Jadhav', 'India', 'Playstation 3', 'jprashant', 'English', 'YAZ.png', '9637638089', 'jprashant610@gmail.com', 'NO'),
(77, 'prashant', 'India', 'Playstation 3', 'j.p', 'English', 'YAZ.png', '12341234', 'test@test.com', 'NO'),
(78, 'ajsb', 'India', 'Playstation 3', 'sgsv', 'English', 'YAZ.png', '12341234', 'test@testing.com', 'NO'),
(79, 'bsbs', 'India', 'Playstation 3', 'hshs', 'English', 'YAZ.png', '12341234', 'shh@hh.nj', 'NO'),
(80, 'ahshsh', 'India', 'Playstation 3', 'ahhshs', 'English', 'YAZ.png', '12341234', 'ag@test.com', 'NO'),
(81, 'akshay', 'India', 'Playstation 3', 'hshsh', 'English', 'YAZ.png', '12312312', 'gah@hh.mm', 'NO'),
(82, 'akshay', 'India', 'Playstation 3', 'abbsbs', 'English', 'YAZ.png', '12341234', 'test@testing.dk', 'NO'),
(83, 'upload', 'India', 'Playstation 3', 'hh', 'English', 'YAZ.png', '12341234', 'hh@test.com', 'NO'),
(84, 'tttttt', 'India', 'Playstation 3', 'svvs', 'English', 'YAZ.png', '12341234', 'test@hw.js', 'NO'),
(85, 'dhbd', 'India', 'Playstation 3', 'TAG', 'English', 'YAZ.png', '12341234', 'hsh@test.com', 'NO'),
(86, 'hdbd', 'India', 'Playstation 3', 'saga', 'English', 'YAZ.png', '12341234', 'hs@teat.com', 'NO'),
(87, 'hdhdhne', 'India', 'Playstation 3', 'herosix', 'English', 'YAZ.png', '12341234', 'gsg@tte.djn', 'NO'),
(88, 'dbbdb', 'India', 'Playstation 3', 'biswas', 'English', 'biswas.jpg', '12341234', 'hdhd@yest.dm', 'NO'),
(89, 'ahsbs', 'India', 'Playstation 3', 'qwennnn', 'English', 'qwennnn.jpg', '12341234', 'hs@test.com', 'NO'),
(90, 'bdbdb', 'India', 'Playstation 3', 'vsvsv', 'English', 'vsvsv.jpg', '12341234', 'hdhdhs@hs.dj', 'NO'),
(91, 'abdbbdbf', 'India', 'Playstation 3', 'aqwheh', 'English', 'aqwheh.jpg', '12341234', 'hsh@test.com', 'NO'),
(92, 'hdhrur', 'India', 'Playstation 3', '12344', 'English', '12344.jpg', '12341234', 'Hey@hehe.nd', 'NO'),
(93, 'hero', 'India', 'Playstation 3', 'hero6', 'English', 'hero6.jpg', '12341234', 'dhh@test.com', 'NO'),
(94, 'bdbdj', 'India', 'Playstation 3', 'bdbdj', 'English', 'bdbdj.jpg', '12341234', 'test@twbs.com', 'NO'),
(95, 'hsbsb', 'India', 'Playstation 3', 'dhdhdj', 'English', 'dhdhdj.jpg', '12341234', 'gsg@hd.nm', 'NO'),
(96, 'ht', 'India', 'PlayStation 3', 'ht', 'English', '1131482016-08-06-12-22-04-PM.png', '123456', 'ht@gmail.com', 'NO'),
(98, 'Akshay Shahane', 'India', 'Playstation 3', 'testing123', 'English', 'testing123.jpg', '12345678', 'akshay.shahane13@gmail.com', 'NO'),
(99, 'Akshay Shahane', 'India', 'Playstation 3', 'testing321', 'English', 'testing321.jpg', '12345678', 'akshay.shahane13@gmail.com', 'YES'),
(100, 'Akshay Shahane', 'India', 'Playstation 3', 'Akshayfff', 'English', 'Akshayfff.jpg', '12345678', 'akshay.shahane13@gmail.com', 'YES'),
(101, 'Akshay Shahane', 'India', 'Playstation 3', 'testingtest', 'English', 'testingtest.jpg', '12345678', 'akshay.shahane13@gmail.com', 'YES');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2019 at 08:13 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sbrq`
--

-- --------------------------------------------------------

--
-- Table structure for table `examresults`
--

CREATE TABLE `examresults` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `courseCode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseTitle` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marks` double(4,2) NOT NULL,
  `regNo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `examId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `examresults`
--

INSERT INTO `examresults` (`id`, `courseCode`, `courseTitle`, `marks`, `regNo`, `examId`, `created_at`, `updated_at`) VALUES
(1, 'BIT 421', 'INFORMATION MANAGEMENT', 80.00, 'BIT/0037/15', 1, '2019-05-22 09:13:37', NULL),
(2, 'BIT 422', 'IT ENTREPRENEURSHIP', 70.00, 'BIT/0037/15', 1, '2019-05-22 09:13:37', NULL),
(3, 'BIT 421', 'INFORMATION MANAGEMENT', 90.00, 'BIT/0039/15', 1, '2019-05-22 09:14:48', NULL),
(4, 'BIT 422', 'IT ENTREPRENEURSHIP', 86.00, 'BIT/0039/15', 1, '2019-05-22 09:14:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `acYear` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `acYear`, `status`, `created_at`, `updated_at`) VALUES
(1, '2018/2019', 1, '2019-05-22 08:25:45', '2019-05-22 08:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regNo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `amount`, `balance`, `regNo`, `created_at`, `updated_at`) VALUES
(1, '17500', '0', 'BIT/0037/15', '2019-05-22 17:10:55', NULL),
(2, '17500', '0', 'BIT/0039/15', '2019-05-22 17:11:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messagein`
--

CREATE TABLE `messagein` (
  `Id` int(11) NOT NULL,
  `SendTime` datetime DEFAULT NULL,
  `ReceiveTime` datetime DEFAULT NULL,
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `SMSC` varchar(80) DEFAULT NULL,
  `MessageText` text,
  `MessageType` varchar(80) DEFAULT NULL,
  `MessageParts` int(11) DEFAULT NULL,
  `MessagePDU` text,
  `Gateway` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messagein`
--

INSERT INTO `messagein` (`Id`, `SendTime`, `ReceiveTime`, `MessageFrom`, `MessageTo`, `SMSC`, `MessageText`, `MessageType`, `MessageParts`, `MessagePDU`, `Gateway`, `UserId`) VALUES
(1, NULL, NULL, '+254716235834', NULL, NULL, 'RESULTS', NULL, NULL, NULL, NULL, NULL);

--
-- Triggers `messagein`
--
DELIMITER $$
CREATE TRIGGER `msgtoreq` AFTER INSERT ON `messagein` FOR EACH ROW INSERT INTO requests SET
requests.shortCode = NEW.MessageText,
requests.sender = NEW.MessageFrom,
requests.created_at = NEW.ReceiveTime
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `messagelog`
--

CREATE TABLE `messagelog` (
  `Id` int(11) NOT NULL,
  `SendTime` datetime DEFAULT NULL,
  `ReceiveTime` datetime DEFAULT NULL,
  `StatusCode` int(11) DEFAULT NULL,
  `StatusText` varchar(80) DEFAULT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageText` text,
  `MessageType` varchar(80) DEFAULT NULL,
  `MessageId` varchar(80) DEFAULT NULL,
  `ErrorCode` varchar(80) DEFAULT NULL,
  `ErrorText` varchar(80) DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `MessageParts` int(11) DEFAULT NULL,
  `MessagePDU` text,
  `Connector` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL,
  `UserInfo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messagelog`
--

INSERT INTO `messagelog` (`Id`, `SendTime`, `ReceiveTime`, `StatusCode`, `StatusText`, `MessageTo`, `MessageFrom`, `MessageText`, `MessageType`, `MessageId`, `ErrorCode`, `ErrorText`, `Gateway`, `MessageParts`, `MessagePDU`, `Connector`, `UserId`, `UserInfo`) VALUES
(1, '2019-05-22 12:40:16', NULL, 300, NULL, '+254708058225', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2019-05-22 16:00:03', NULL, 300, NULL, '+254716235834', NULL, 'KIBU RESULTS For Koech\nBIT 421- 80.00,BIT 421- 80.00,BIT 422- 70.00,BIT 422- 70.00,BIT 421- 70.00,BIT 421- 70.00,BIT 422- 86.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2019-05-22 16:05:06', NULL, 300, NULL, '+254712108244', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 421- 80.00,BIT 421- 80.00,BIT 422- 70.00,BIT 422- 70.00,BIT 422- 70.00,BIT 421- 70.00,BIT 421- 70.00,BIT 421- 70.00,BIT 422- 86.00,BIT 422- 86.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2019-05-22 16:05:31', NULL, 300, NULL, '+254708058225', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 421- 80.00,BIT 421- 80.00,BIT 421- 80.00,BIT 422- 70.00,BIT 422- 70.00,BIT 422- 70.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2019-05-22 16:07:12', NULL, 300, NULL, '+254708058225', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2019-05-22 16:07:43', NULL, 300, NULL, '+254712108244', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2019-05-22 19:58:41', NULL, 300, NULL, '+254712108244', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2019-05-22 19:59:43', NULL, 300, NULL, '+254708058225', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2019-05-22 20:01:09', NULL, 300, NULL, '+254724773475', NULL, 'KIBU RESULTS For Koech\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2019-05-22 20:01:44', NULL, 300, NULL, '+254716235834', NULL, 'KIBU RESULTS For Koech\nBIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2019-05-22 20:32:42', NULL, 300, NULL, '+254708058225', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2019-05-22 20:33:13', NULL, 300, NULL, '+254712108244', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2019-05-22 20:38:19', NULL, 300, NULL, '+254708058225', NULL, 'HELP CONTENT\r\n                              Type RESULTS, to view current results.\r\n                              Type REASON to know why you have no results.\r\n                              Type academic year(e.g 2018/2019) to view previous results.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2019-05-22 20:39:20', NULL, 300, NULL, '+254724773475', NULL, 'INVALID QUERY.\r\n                              Type RESULTS, to view current results.\r\n                              Type REASON to know why you have no results.\r\n                              Type academic year(e.g 2018/2019) to view previous results.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2019-05-22 20:39:50', NULL, 300, NULL, '+254712108244', NULL, 'Reasons for unavailability of exams can be    fee balances or pending specials. Your fee balance and special application are shown here:\n0KES fee balance.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2019-05-22 20:48:22', NULL, 300, NULL, '+254708058225', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2019-05-22 20:50:13', NULL, 300, NULL, '+254712108244', NULL, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 90.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messageout`
--

CREATE TABLE `messageout` (
  `Id` int(11) NOT NULL,
  `MessageTo` varchar(80) DEFAULT NULL,
  `MessageFrom` varchar(80) DEFAULT NULL,
  `MessageText` text,
  `MessageType` varchar(80) DEFAULT NULL,
  `Gateway` varchar(80) DEFAULT NULL,
  `UserId` varchar(80) DEFAULT NULL,
  `UserInfo` text,
  `Priority` int(11) DEFAULT NULL,
  `Scheduled` datetime DEFAULT NULL,
  `ValidityPeriod` int(11) DEFAULT NULL,
  `IsSent` tinyint(1) NOT NULL DEFAULT '0',
  `IsRead` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(18, '2014_10_12_000000_create_users_table', 1),
(19, '2014_10_12_100000_create_password_resets_table', 1),
(20, '2019_05_21_133710_create_parents_table', 1),
(21, '2019_05_21_133858_create_students_table', 1),
(22, '2019_05_21_133918_create_exams_table', 1),
(23, '2019_05_21_133941_create_examresults_table', 1),
(24, '2019_05_21_133953_create_fees_table', 1),
(25, '2019_05_21_134010_create_requests_table', 1),
(26, '2019_05_21_134022_create_responses_table', 1),
(27, '2019_05_21_134037_create_specials_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phoneNo` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idNo` int(10) UNSIGNED NOT NULL,
  `surName` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otherName` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `phoneNo`, `email`, `idNo`, `surName`, `otherName`, `created_at`, `updated_at`) VALUES
(1, '+254712108244', 'rcngetich@gmail.com', 20190235, 'Ngetich', 'Rc', '2019-05-21 21:00:00', NULL),
(2, '+254716235834', 'idad@gmail.com', 20989777, 'Kimaiyo', 'David', '2019-05-22 08:58:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shortCode` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `shortCode`, `sender`, `created_at`, `updated_at`) VALUES
(3, 'RESULTS', '+254708058225', '2019-05-22 09:32:59', NULL),
(4, 'RESULTS', '+254716235834', NULL, NULL),
(5, 'RESULTS', '+254712108244', '2019-05-22 13:05:05', NULL),
(6, 'RESULTS', '+254708058225', '2019-05-22 13:05:30', NULL),
(8, 'RESULTS', '+254708058225', '2019-05-21 21:00:00', NULL),
(9, 'RESULTS', '+254712108244', '2019-05-22 13:07:40', NULL),
(10, 'RESULTS', '+254712108244', '2019-05-22 16:58:39', NULL),
(11, 'RESULTS', '+254708058225', '2019-05-22 16:59:38', NULL),
(12, 'RESULTS', '+254724773475', '2019-05-22 17:01:07', NULL),
(13, 'RESULTS', '+254716235834', '2019-05-22 17:01:40', NULL),
(14, 'RESULTS', '+254708058225', '2019-05-22 17:32:40', NULL),
(15, 'RESULTS', '+254712108244', '2019-05-22 17:33:11', NULL),
(16, 'HELP', '+254708058225', '2019-05-22 17:38:15', NULL),
(17, 'FFF', '+254724773475', '2019-05-22 17:39:14', NULL),
(18, 'REASON', '+254712108244', '2019-05-22 17:39:50', NULL),
(19, 'RESULTS', '+254708058225', '2019-05-22 17:48:21', NULL),
(21, 'RESULTS', '+254712108244', '2019-05-22 17:50:11', NULL);

--
-- Triggers `requests`
--
DELIMITER $$
CREATE TRIGGER `addres` AFTER INSERT ON `requests` FOR EACH ROW IF NEW.shortCode = "RESULTS"
	THEN INSERT INTO responses
    SET responses.recipient = NEW.sender,
    responses.requestId = NEW.id,
    responses.message =CONCAT("KIBU RESULTS For ",(SELECT students.surName FROM students WHERE students.phoneNo = NEW.sender OR  students.parentPhone = NEW.sender), "\n",(SELECT  GROUP_CONCAT(DISTINCT examresults.courseCode, "- " , examresults.marks) FROM students,requests,examresults WHERE students.regNo = examresults.regNo AND students.regNo = (SELECT students.regNo FROM students WHERE students.phoneNo = NEW.sender)  OR  students.regNo = (SELECT students.regNo FROM students WHERE students.parentPhone = NEW.sender)),"\nType HELP or call/SMS 0708058225.");
    ELSEIF NEW.shortCode = "REASON"
    THEN
    INSERT INTO responses
    SET responses.recipient = NEW.sender,
    responses.requestId = NEW.id,
    responses.message =CONCAT("Reasons for unavailability of exams can be    fee balances or pending specials. Your fee balance and special application are shown here:\n",(SELECT DISTINCT fees.balance FROM fees,students,requests WHERE fees.regNo = students.regNo AND students.phoneNo = (SELECT students.phoneNo FROM students WHERE students.parentPhone = NEW.sender)),"KES fee balance.\n");
    ELSEIF NEW.shortCode = "HELP"
    THEN
     INSERT INTO responses
    SET responses.recipient = NEW.sender,
    responses.requestId = NEW.id,
    responses.message =CONCAT("HELP CONTENT\r\n                              Type RESULTS, to view current results.\r\n                              Type REASON to know why you have no results.\r\n                              Type academic year(e.g 2018/2019) to view previous results.\r\n                             Type HELP or call/SMS 0708058225 for more.");
    ELSE
     INSERT INTO responses
    SET responses.recipient = NEW.sender,
    responses.requestId = NEW.id,
    responses.message =CONCAT("INVALID QUERY.\r\n                              Type RESULTS, to view current results.\r\n                              Type REASON to know why you have no results.\r\n                              Type academic year(e.g 2018/2019) to view previous results.\r\n                             Type HELP or call/SMS 0708058225 for more.");
  END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE `responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requestId` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `responses`
--

INSERT INTO `responses` (`id`, `message`, `recipient`, `requestId`, `created_at`, `updated_at`) VALUES
(1, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00', '+254708058225', 3, NULL, NULL),
(2, 'KIBU RESULTS For Koech\nBIT 421- 80.00,BIT 421- 80.00,BIT 422- 70.00,BIT 422- 70.00,BIT 421- 70.00,BIT 421- 70.00,BIT 422- 86.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', '+254716235834', 4, NULL, NULL),
(3, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 421- 80.00,BIT 421- 80.00,BIT 422- 70.00,BIT 422- 70.00,BIT 422- 70.00,BIT 421- 70.00,BIT 421- 70.00,BIT 421- 70.00,BIT 422- 86.00,BIT 422- 86.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', '+254712108244', 5, NULL, NULL),
(4, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 421- 80.00,BIT 421- 80.00,BIT 421- 80.00,BIT 422- 70.00,BIT 422- 70.00,BIT 422- 70.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', '+254708058225', 6, NULL, NULL),
(5, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', '+254708058225', 8, NULL, NULL),
(6, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', '+254712108244', 9, NULL, NULL),
(7, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', '+254712108244', 10, NULL, NULL),
(8, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', '+254708058225', 11, NULL, NULL),
(9, 'KIBU RESULTS For Koech\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', '+254724773475', 12, NULL, NULL),
(10, 'KIBU RESULTS For Koech\nBIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', '+254716235834', 13, NULL, NULL),
(11, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', '+254708058225', 14, NULL, NULL),
(12, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 70.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', '+254712108244', 15, NULL, NULL),
(13, 'HELP CONTENT\r\n                              Type RESULTS, to view current results.\r\n                              Type REASON to know why you have no results.\r\n                              Type academic year(e.g 2018/2019) to view previous results.\r\n    ', '+254708058225', 16, NULL, NULL),
(14, 'INVALID QUERY.\r\n                              Type RESULTS, to view current results.\r\n                              Type REASON to know why you have no results.\r\n                              Type academic year(e.g 2018/2019) to view previous results.\r\n  ', '+254724773475', 17, NULL, NULL),
(15, 'Reasons for unavailability of exams can be    fee balances or pending specials. Your fee balance and special application are shown here:\n0KES fee balance.\n', '+254712108244', 18, NULL, NULL),
(16, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00\nType HELP or call/SMS 0708058225.', '+254708058225', 19, NULL, NULL),
(17, 'KIBU RESULTS For Ng\'etich\nBIT 421- 80.00,BIT 422- 70.00,BIT 421- 90.00,BIT 422- 86.00\nType HELP or call/SMS 0708058225.', '+254712108244', 21, NULL, NULL);

--
-- Triggers `responses`
--
DELIMITER $$
CREATE TRIGGER `msgout` AFTER INSERT ON `responses` FOR EACH ROW INSERT INTO messageout SET
messageout.MessageTo = NEW.recipient,
messageout.MessageText = NEW.message
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

CREATE TABLE `specials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `acYear` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regNo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `regNo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idNo` int(10) UNSIGNED NOT NULL,
  `phoneNo` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surName` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otherName` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentPhone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yos` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `regNo`, `idNo`, `phoneNo`, `email`, `surName`, `otherName`, `parentPhone`, `yos`, `created_at`, `updated_at`) VALUES
(1, 'BIT/0037/15', 33664782, '+254708058225', 'dekingetich@gmail.com', 'Ng\'etich', 'Dennis', '+254712108244', 4, '2019-05-22 07:00:00', NULL),
(2, 'BIT/0039/15', 34445678, '+254724773475', 'koechisaac62@gmail.com', 'Koech', 'Isaac', '+254716235834', 4, '2019-05-22 08:24:17', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kiprotich Ngetich', 'dekingetich@gmail.com', NULL, '$2y$10$SIvl4UfubTpIGGe09yCS2OmxjnNXJpDVRVmM0YDfqjbDCwtjnh/a6', NULL, '2019-05-22 07:34:41', '2019-05-22 07:34:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `examresults`
--
ALTER TABLE `examresults`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `examresults_id_unique` (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exams_id_unique` (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fees_id_unique` (`id`);

--
-- Indexes for table `messagein`
--
ALTER TABLE `messagein`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `messagelog`
--
ALTER TABLE `messagelog`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IDX_MessageId` (`MessageId`,`SendTime`);

--
-- Indexes for table `messageout`
--
ALTER TABLE `messageout`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IDX_IsRead` (`IsRead`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parents_id_unique` (`id`),
  ADD UNIQUE KEY `parents_phoneno_unique` (`phoneNo`),
  ADD UNIQUE KEY `parents_email_unique` (`email`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `requests_id_unique` (`id`);

--
-- Indexes for table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `responses_id_unique` (`id`);

--
-- Indexes for table `specials`
--
ALTER TABLE `specials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `specials_id_unique` (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_id_unique` (`id`),
  ADD UNIQUE KEY `students_regno_unique` (`regNo`),
  ADD UNIQUE KEY `students_phoneno_unique` (`phoneNo`),
  ADD UNIQUE KEY `students_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `examresults`
--
ALTER TABLE `examresults`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messagein`
--
ALTER TABLE `messagein`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messagelog`
--
ALTER TABLE `messagelog`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `messageout`
--
ALTER TABLE `messageout`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `specials`
--
ALTER TABLE `specials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

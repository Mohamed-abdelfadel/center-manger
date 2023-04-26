-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 09, 2022 at 08:23 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `center_manger`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `student_id`, `teacher_id`, `group_id`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 3),
(3, 3, 1, 2),
(4, 4, 1, 2),
(5, 5, 1, 0),
(6, 6, 1, 3),
(7, 7, 1, 0),
(8, 8, 1, 2),
(9, 9, 1, 2),
(10, 10, 1, 3),
(11, 11, 1, 2),
(12, 12, 1, 0),
(13, 13, 1, 2),
(14, 14, 1, 3),
(15, 15, 1, 3),
(16, 16, 1, 2),
(17, 17, 1, 2),
(18, 18, 1, 3),
(19, 19, 1, 2),
(20, 20, 1, 3),
(21, 21, 1, 2),
(22, 22, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `teacher` (`teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `teacher`, `price`) VALUES
(0, 'undifined', 'غير موجود', 1, 0),
(2, 'M-T-11', ' Monday-Tuesday-11:00am', 1, 350),
(3, 'M-T-12', ' Monday-Tuesday-12:00am', 1, 370);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `paid` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `grade` int(11) NOT NULL DEFAULT '0',
  `exam` int(11) DEFAULT '0',
  `attendance` int(100) NOT NULL DEFAULT '0',
  `absence` int(100) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `phone`, `paid`, `total`, `grade`, `exam`, `attendance`, `absence`, `active`) VALUES
(1, 'Ù‡Ø§Ù†ÙŠ ', 'Ù…Ø§Ø±ØªÙŠÙ†Ø²', '01121118319', 0, 0, 0, 50, 0, 0, 1),
(2, 'Ø§Ø­Ù…Ø¯', 'Ù…Ø­Ù…Ø¯', '01551001234', 0, 0, 0, 50, 0, 0, 1),
(3, 'Ø§Ø­Ù…Ø¯', 'Ù…Ø­Ù…ÙˆØ¯', '01550444044', 0, 0, 0, 0, 0, 0, 1),
(4, 'Ø£Ù…ÙŠØ±', 'Ø¢Ø¯Ù…', '01553444443', 0, 0, 0, 0, 0, 0, 1),
(5, 'Ø¢Ø³Ø±', 'ÙŠØ³ÙŠÙ†', '01003806197', 0, 0, 0, 40, 0, 0, 1),
(6, 'Ø¥ÙŠØ§Ø¯', 'Ù…Ø­Ù…Ø¯', '01555523001', 0, 0, 0, 0, 0, 0, 1),
(7, 'Ø£Ù†Ø³', 'Ù…Ø­Ù…Ø¯', '01552301111', 0, 0, 0, 0, 0, 0, 1),
(8, 'Ø§Ø­Ù…Ø¯', 'Ø®Ø§Ù„Ø¯ ', '01501575375', 0, 0, 0, 0, 0, 0, 1),
(9, 'Ø£Ø´Ø±Ù', 'ÙˆØ­ÙŠØ¯', '01501523234', 0, 0, 0, 0, 0, 0, 1),
(10, 'Ø­Ø§ØªÙ…', 'Ø§Ø­Ù…Ø¯', '01550440009', 0, 0, 0, 0, 0, 0, 1),
(11, ' Ø­Ø³Ø§Ù…', 'Ù…Ø­Ù…ÙˆØ¯', '01550050504', 0, 0, 0, 0, 0, 0, 1),
(12, 'Ø±ÙŠØ§Ù†', 'Ø§Ø­Ù…Ø¯', '01503838538', 0, 0, 0, 0, 0, 0, 1),
(13, 'Ø²ÙŠØ§Ø¯', 'Ù…Ø­Ù…Ø¯', '01555777757', 0, 0, 0, 0, 0, 0, 1),
(14, 'Ø³Ø¹ÙŠØ¯', 'Ø¹Ø¨Ø¯Ø§Ù„Ù…Ù†Ø¹Ù…', '01554915599', 0, 0, 0, 0, 0, 0, 1),
(15, 'Ø³Ø§Ù…ÙŠ', 'Ø§Ø­Ù…Ø¯', '01550444044', 0, 0, 0, 0, 0, 0, 1),
(16, 'Ù…Ø­Ù…Ø¯', 'Ø®Ø§Ù„Ø¯', '01555559158', 0, 0, 0, 0, 0, 0, 1),
(17, 'ÙØ§Ø¯ÙŠ', 'ÙØ¤Ø§Ø¯', '01555680008', 0, 0, 0, 0, 0, 0, 1),
(18, 'Ù…Ø­Ù…Ø¯', 'ØµØ§Ø¨Ø±', '01550088950', 0, 0, 0, 0, 0, 0, 1),
(19, 'Ø£Ø±ÙˆÙ‰', 'Ù…Ø­Ù…Ø¯', '01544420000', 0, 0, 0, 0, 0, 0, 1),
(20, 'Ø¯ÙŠÙ†Ø§', 'Ø§Ø­Ù…Ø¯', '01033588533', 0, 0, 0, 0, 0, 0, 1),
(21, 'ÙØ±ÙŠØ¯Ø©', 'Ø§Ø­Ù…Ø¯', '01551553755', 0, 0, 0, 0, 0, 0, 1),
(22, 'Ø§Ø³Ø§Ù…Ù‡', 'Ø¨ÙƒØ±ÙŠ', '11111111111111111', 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) CHARACTER SET utf8 NOT NULL,
  `last_name` varchar(60) CHARACTER SET utf8 NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `first_name`, `last_name`, `email`, `password`, `verified`) VALUES
(1, 'Ù…Ø­Ù…Ø¯', 'ÙŠØ§Ø³Ø±', 'mohamed@gmail.com', '$2y$10$z7VCb4uEAq9RL1OaezGf/uPWSpmBf0z1lGRaev85.xezA7xrXqniu', 0),
(2, 'vvvvvvv', 'vvvvvv', 'dddddd@gmail', '$2y$10$jB0JS2EbsmVvQIPLTPxjeeCEkoasoN8rOxVz7vE5FQmBVHAQPPMda', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_3` FOREIGN KEY (`id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

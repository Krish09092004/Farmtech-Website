-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2024 at 10:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agroculture`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aid` int(255) NOT NULL,
  `aname` varchar(255) NOT NULL,
  `ausername` varchar(255) NOT NULL,
  `apassword` varchar(255) NOT NULL,
  `ahash` varchar(255) NOT NULL,
  `aemail` varchar(255) NOT NULL,
  `amobile` varchar(255) NOT NULL,
  `aaddress` text NOT NULL,
  `aactive` int(255) NOT NULL DEFAULT 0,
  `arating` int(11) NOT NULL DEFAULT 0,
  `picExt` varchar(255) NOT NULL DEFAULT 'png',
  `picStatus` int(10) NOT NULL DEFAULT 0,
  `code` int(10) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `aname`, `ausername`, `apassword`, `ahash`, `aemail`, `amobile`, `aaddress`, `aactive`, `arating`, `picExt`, `picStatus`, `code`, `status`) VALUES
(1, 'Krish', 'admin', '$2y$10$a44Lq3XOtmltMfRDAeRAWOZsrRFO9Io4F/XAqjx4CsyL3iyRQ.Fy.', '7f6ffaa6bb0b408017b62254211691b5', 'maniarkrish2004@gmail.com', '6353952351', 'vapi', 0, 0, 'png', 0, 151798, 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `blogdata`
--

CREATE TABLE `blogdata` (
  `blogId` int(10) NOT NULL,
  `blogUser` varchar(256) NOT NULL,
  `blogTitle` varchar(256) NOT NULL,
  `blogContent` longtext NOT NULL,
  `blogTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blogdata`
--

INSERT INTO `blogdata` (`blogId`, `blogUser`, `blogTitle`, `blogContent`, `blogTime`, `likes`) VALUES
(19, 'ThePhenom', 'First Blog', '<p>Its Awesome website<img alt=\"wink\" src=\"https://cdn.ckeditor.com/4.8.0/full/plugins/smiley/images/wink_smile.png\" style=\"height:23px; width:23px\" title=\"wink\" /></p>\r\n', '2018-02-25 13:09:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogfeedback`
--

CREATE TABLE `blogfeedback` (
  `blogId` int(10) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `commentUser` varchar(256) NOT NULL,
  `commentPic` varchar(256) NOT NULL DEFAULT 'profile0.png',
  `commentTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `blogfeedback`
--

INSERT INTO `blogfeedback` (`blogId`, `comment`, `commentUser`, `commentPic`, `commentTime`) VALUES
(19, 'Mast yarr', 'ThePhenom', 'profile0.png', '2018-02-25 13:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `bid` int(100) NOT NULL,
  `bname` varchar(100) NOT NULL,
  `busername` varchar(100) NOT NULL,
  `bpassword` varchar(100) NOT NULL,
  `bhash` varchar(100) NOT NULL,
  `bemail` varchar(100) NOT NULL,
  `bmobile` varchar(100) NOT NULL,
  `baddress` text NOT NULL,
  `bactive` int(100) NOT NULL DEFAULT 0,
  `picExt` varchar(255) NOT NULL DEFAULT 'png',
  `picStatus` text NOT NULL DEFAULT '0',
  `code` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`bid`, `bname`, `busername`, `bpassword`, `bhash`, `bemail`, `bmobile`, `baddress`, `bactive`, `picExt`, `picStatus`, `code`, `status`) VALUES
(1, 'buyer', 'buyer', '$2y$10$gX04ctFdmX5xw/a3VgPXRulp47k7nWZ4k9jwDzB0FhIYSbjcYcG4O', '123', 'maniarkrish06@gmail.com', '1111111111', 'vapi', 0, 'png', '0', 0, 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `bid` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `pimage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `bid`, `pid`, `product`, `price`, `quantity`, `pimage`) VALUES
(61, 0, 33, 'ladyfinger', 50, 1, ' ladyfinger.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `fid` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `fusername` varchar(255) NOT NULL,
  `fpassword` varchar(255) NOT NULL,
  `fhash` varchar(255) NOT NULL,
  `femail` varchar(255) NOT NULL,
  `fmobile` varchar(255) NOT NULL,
  `faddress` text NOT NULL,
  `factive` int(255) NOT NULL DEFAULT 0,
  `frating` int(11) NOT NULL DEFAULT 0,
  `picExt` varchar(255) NOT NULL DEFAULT 'png',
  `picStatus` int(10) NOT NULL DEFAULT 0,
  `code` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`fid`, `fname`, `fusername`, `fpassword`, `fhash`, `femail`, `fmobile`, `faddress`, `factive`, `frating`, `picExt`, `picStatus`, `code`, `status`) VALUES
(7, 'farmer', 'admin', '$2y$10$UXOByAKO.xDQF2jYMAPuYehsUn6zUdSrNdYgk/VB4u80zO1URVVKe', '288cc0ff022877bd3df94bc9360b9c5d', 'patelmahim240@gmail.com', '1111111111', 'vadodara', 0, 0, '123.jpg', 1, 0, 'verified'),
(18, 'farmer', 'famre', '$2y$10$tGEOZfTJObzNbmWROCbtYO8qPIF2Hb/E5x0ib0eYeWj3uR..EcckS', '9cf81d8026a9018052c429cc4e56739b', 'maniarkrish06@gmail.com', '1111111111', 'vapi', 0, 0, 'k.jpg', 1, 0, 'verified'),
(20, 'sahaj', 'sahaj', '$2y$10$BjyMi0y.kJW8FtQnbvKCReUqZIYGmJWHGlFYBff9h/rXkq09l3TJy', '182be0c5cdcd5072bb1864cdee4d3d6e', 'kathiriyasahaj@gmail.com', '1111111111', 'vadodara', 0, 0, 'png', 0, 0, 'verified'),
(22, 'farmer', 'jgf ekuyfgef', '$2y$10$o.fI9QiDfPXJ03dFAuIJHu0ZS.jv4rq.qXUPo8WXJFNgWVS6apD16', '4fac9ba115140ac4f1c22da82aa0bc7f', 'maniarkrish06@gmail.com', '1233333333', 'vapi', 0, 0, 'k.jpg', 1, 0, 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `fproduct`
--

CREATE TABLE `fproduct` (
  `fid` int(255) NOT NULL,
  `pid` int(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `pcat` varchar(255) NOT NULL,
  `pinfo` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `pimage` varchar(255) NOT NULL DEFAULT 'blank.png',
  `picStatus` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fproduct`
--

INSERT INTO `fproduct` (`fid`, `pid`, `product`, `pcat`, `pinfo`, `price`, `pimage`, `picStatus`) VALUES
(4, 32, 'greenapple', 'fruits', 'fresh', 50, 'greenapple.jpg', 1),
(18, 34, 'banana', 'fruits', 'Fresh and sweet Product.', 20, 'banana.JPG', 1),
(7, 35, 'bajari', 'grains', 'fresh', 120, 'bajari.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`) VALUES
(1, 439190297, 1658336909, 'hello'),
(2, 943155791, 1598504030, 'aghdukyagd87weudhsjebro87webfsg8e rb7ywgdyuse efy egfusdgfusdgfuysyg efghauygfweiufhw');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `bid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `bid`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(12, 0, 'Krish', '2323232323', 'maniarkrish06@gmail.com', 'cash on delivery', 'flat no. b3-706,Shubham green city vapi Gujarat  india - 111111', ', Bajra ( 1 ), Banana ( 1 )', 800, '28-Nov-2023', 'completed'),
(15, 2, 'krish', '45454545454', 'dhruv@gmail.com', 'cash on delivery', 'flat no. 3r213qsgfc   ngdgfbv  gfdmgc gy,uh - 111111', ', ladyfinger ( 3 )', 150, '01-Dec-2023', ''),
(16, 0, 'mahim', '121231231231', 'maniarkrish2004@gmail.com', 'cash on delivery', 'flat no. b3-706,Shubham green city 1121 Gujarat  india - 12131321', ', banana ( 2 )', 240, '26-Dec-2023', 'pending'),
(17, 0, 'Krish', '1111111111', 'maniarkrish2004@gmail.com', 'cash on delivery', 'flat no. adasdawdqwasd 1121 sdsadasd dasdasd - ', ', Bajra ( 3 ), greenapple ( 4 )', 1400, '27-Dec-2023', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `sensordata`
--

CREATE TABLE `sensordata` (
  `id` int(6) UNSIGNED NOT NULL,
  `SensorData` varchar(30) NOT NULL,
  `LocationData` varchar(30) NOT NULL,
  `value1` varchar(10) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `value3` varchar(255) DEFAULT NULL,
  `reading_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sensordata`
--

INSERT INTO `sensordata` (`id`, `SensorData`, `LocationData`, `value1`, `value2`, `value3`, `reading_time`) VALUES
(132, 'Humidity sensor', 'farm', '25.80', '68.00', '1', '2023-12-27 12:05:49'),
(133, 'Humidity sensor', 'farm', '25.80', '68.00', '1', '2023-12-27 12:06:00'),
(134, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:06:10'),
(135, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:06:21'),
(136, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:06:32'),
(137, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:06:46'),
(138, 'Humidity sensor', 'farm', '25.80', '73.00', '1', '2023-12-27 12:06:56'),
(139, 'Humidity sensor', 'farm', '26.70', '79.00', '1', '2023-12-27 12:07:07'),
(140, 'Humidity sensor', 'farm', '26.70', '77.00', '1', '2023-12-27 12:07:21'),
(141, 'Humidity sensor', 'farm', '27.10', '74.00', '1', '2023-12-27 12:07:36'),
(142, 'Humidity sensor', 'farm', '27.10', '73.00', '1', '2023-12-27 12:07:47'),
(143, 'Humidity sensor', 'farm', '26.70', '69.00', '1', '2023-12-27 12:08:32'),
(144, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:18:48'),
(145, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:18:59'),
(146, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:24:44'),
(147, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:24:54'),
(148, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:25:04'),
(149, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:25:14'),
(150, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:25:25'),
(151, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:25:35'),
(152, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:25:45'),
(153, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:25:55'),
(154, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:26:05'),
(155, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:26:15'),
(156, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:26:25'),
(157, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:26:35'),
(158, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:26:45'),
(159, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:26:55'),
(160, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:27:05'),
(161, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:27:15'),
(162, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:27:25'),
(163, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:27:35'),
(164, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:27:46'),
(165, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:27:56'),
(166, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:28:06'),
(167, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:28:16'),
(168, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:28:26'),
(169, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:28:36'),
(170, 'Humidity sensor', 'farm', '25.80', '69.00', '1', '2023-12-27 12:28:46'),
(171, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:28:56'),
(172, 'Humidity sensor', 'farm', '25.80', '70.00', '1', '2023-12-27 12:29:06'),
(173, 'Humidity sensor', 'farm', '26.20', '70.00', '1', '2023-12-27 12:29:16'),
(174, 'Humidity sensor', 'farm', '26.20', '70.00', '1', '2023-12-27 12:29:26'),
(175, 'Humidity sensor', 'farm', '26.20', '70.00', '1', '2023-12-27 12:29:36'),
(176, 'Humidity sensor', 'farm', '26.20', '69.00', '1', '2023-12-27 12:29:46'),
(177, 'Humidity sensor', 'farm', '26.20', '69.00', '1024', '2023-12-27 12:30:17'),
(178, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:30:27'),
(179, 'Humidity sensor', 'farm', '25.80', '69.00', '975', '2023-12-27 12:30:37'),
(180, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:30:47'),
(181, 'Humidity sensor', 'farm', '25.80', '69.00', '1008', '2023-12-27 12:30:57'),
(182, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:31:07'),
(183, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:31:17'),
(184, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:31:27'),
(185, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:31:37'),
(186, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:31:47'),
(187, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:31:57'),
(188, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:32:08'),
(189, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:32:18'),
(190, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:32:28'),
(191, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:32:38'),
(192, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:32:48'),
(193, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:32:58'),
(194, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:33:08'),
(195, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:33:18'),
(196, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:33:28'),
(197, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:33:38'),
(198, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:33:48'),
(199, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:33:58'),
(200, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:34:08'),
(201, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:34:18'),
(202, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:34:29'),
(203, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:34:39'),
(204, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:34:49'),
(205, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:34:59'),
(206, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:35:09'),
(207, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:35:19'),
(208, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:35:29'),
(209, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:35:39'),
(210, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:35:49'),
(211, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:35:59'),
(212, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:36:09'),
(213, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:36:19'),
(214, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:36:29'),
(215, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:36:39'),
(216, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:36:49'),
(217, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:37:00'),
(218, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:37:10'),
(219, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:37:20'),
(220, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:37:30'),
(221, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:37:40'),
(222, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:37:50'),
(223, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:38:00'),
(224, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:38:10'),
(225, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:38:20'),
(226, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:38:30'),
(227, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:38:40'),
(228, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:38:50'),
(229, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:39:00'),
(230, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:39:10'),
(231, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:39:23'),
(232, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:39:33'),
(233, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:39:44'),
(234, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:39:54'),
(235, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:40:04'),
(236, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:40:14'),
(237, 'Humidity sensor', 'farm', '25.80', '69.00', '1024', '2023-12-27 12:40:26'),
(238, 'Humidity sensor', 'farm', '25.70', '69.00', '1024', '2023-12-27 12:40:39'),
(239, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:41:04'),
(240, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:41:14'),
(241, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:41:24'),
(242, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:41:34'),
(243, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:41:44'),
(244, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:41:54'),
(245, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:42:05'),
(246, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:42:15'),
(247, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:42:25'),
(248, 'Humidity sensor', 'farm', '25.30', '69.00', '1024', '2023-12-27 12:42:35'),
(249, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:06:51'),
(250, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:07:26'),
(251, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:07:37'),
(252, 'Humidity sensor', 'farm', '25.30', '72.00', '581', '2023-12-27 14:07:48'),
(253, 'Humidity sensor', 'farm', '25.30', '72.00', '438', '2023-12-27 14:07:58'),
(254, 'Humidity sensor', 'farm', '25.30', '72.00', '438', '2023-12-27 14:08:08'),
(255, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:08:18'),
(256, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:08:28'),
(257, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:08:38'),
(258, 'Humidity sensor', 'farm', '25.80', '73.00', '1024', '2023-12-27 14:08:48'),
(259, 'Humidity sensor', 'farm', '25.80', '76.00', '1024', '2023-12-27 14:08:58'),
(260, 'Humidity sensor', 'farm', '26.20', '75.00', '1024', '2023-12-27 14:09:08'),
(261, 'Humidity sensor', 'farm', '26.20', '74.00', '1024', '2023-12-27 14:09:18'),
(262, 'Humidity sensor', 'farm', '26.20', '73.00', '1024', '2023-12-27 14:09:28'),
(263, 'Humidity sensor', 'farm', '26.20', '73.00', '1024', '2023-12-27 14:09:39'),
(264, 'Humidity sensor', 'farm', '26.20', '73.00', '1024', '2023-12-27 14:09:49'),
(265, 'Humidity sensor', 'farm', '26.20', '73.00', '1024', '2023-12-27 14:09:59'),
(266, 'Humidity sensor', 'farm', '26.10', '72.00', '1024', '2023-12-27 14:10:09'),
(267, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:10:19'),
(268, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:10:29'),
(269, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:10:39'),
(270, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:10:49'),
(271, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:10:59'),
(272, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:11:09'),
(273, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:11:19'),
(274, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:11:29'),
(275, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:11:39'),
(276, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:11:49'),
(277, 'Humidity sensor', 'farm', '25.80', '72.00', '1024', '2023-12-27 14:11:59'),
(278, 'Humidity sensor', 'farm', '25.70', '72.00', '1024', '2023-12-27 14:12:09'),
(279, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:12:19'),
(280, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:12:30'),
(281, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:12:40'),
(282, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:12:50'),
(283, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:13:00'),
(284, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:13:10'),
(285, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:13:20'),
(286, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:13:30'),
(287, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:13:40'),
(288, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:13:50'),
(289, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:14:01'),
(290, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:14:11'),
(291, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:14:21'),
(292, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:14:31'),
(293, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:14:41'),
(294, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:14:51'),
(295, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:15:01'),
(296, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:15:11'),
(297, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:15:22'),
(298, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:15:32'),
(299, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:15:42'),
(300, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:15:52'),
(301, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:16:02'),
(302, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:16:13'),
(303, 'Humidity sensor', 'farm', '25.30', '72.00', '1024', '2023-12-27 14:16:23'),
(304, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:29:06'),
(305, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:29:16'),
(306, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:29:26'),
(307, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:29:36'),
(308, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:29:47'),
(309, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:29:57'),
(310, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:30:07'),
(311, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:30:19'),
(312, 'Humidity sensor', 'farm', '24.60', '72.00', '1024', '2023-12-27 14:30:29'),
(313, 'Humidity sensor', 'farm', '24.50', '72.00', '1024', '2023-12-27 14:30:39'),
(314, 'Humidity sensor', 'farm', '24.50', '72.00', '1024', '2023-12-27 14:30:50'),
(315, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:31:00'),
(316, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:31:10'),
(317, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:31:39'),
(318, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:31:49'),
(319, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:32:00'),
(320, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:32:10'),
(321, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:32:20'),
(322, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:32:30'),
(323, 'Humidity sensor', 'farm', '24.80', '72.00', '487', '2023-12-27 14:32:40'),
(324, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:32:50'),
(325, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:33:01'),
(326, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:33:11'),
(327, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:33:21'),
(328, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:33:31'),
(329, 'Humidity sensor', 'farm', '24.80', '72.00', '1024', '2023-12-27 14:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `unique_id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `unique_id`, `fname`, `lname`, `email`, `password`, `img`, `status`) VALUES
(1, 143335028, 'kamlesh', 'patel', 'kamlesh@gmail.com', '202cb962ac59075b964b07152d234b70', '1703496060k.jpg', 'Offline now'),
(2, 1537247463, 'Mahim', 'Patel', 'mahim@gmail.com', '202cb962ac59075b964b07152d234b70', '1703496130logo.png', 'Offline now'),
(3, 373184815, 'krish', 'maniar', 'krish@gmail.com', '202cb962ac59075b964b07152d234b70', '1703496157k.jpg', 'Offline now'),
(4, 1658336909, 'sahaj', 'kathariya', 'sahaj@gmail.com', '202cb962ac59075b964b07152d234b70', '1703496202k.jpg', 'Offline now'),
(5, 439190297, 'raj', 'patel', 'raj@gmail.com', '202cb962ac59075b964b07152d234b70', '1703496231k.jpg', 'Offline now'),
(6, 943155791, 'daksh', 'patel', 'daksh@gmail.com', '202cb962ac59075b964b07152d234b70', '1703496259k.jpg', 'Offline now'),
(7, 1598504030, 'tanush', 'patel', 'tanush@gmail.com', '202cb962ac59075b964b07152d234b70', '1703496291k.jpg', 'Offline now');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `aid` (`aid`);

--
-- Indexes for table `blogdata`
--
ALTER TABLE `blogdata`
  ADD PRIMARY KEY (`blogId`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`bid`),
  ADD UNIQUE KEY `bid` (`bid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`fid`),
  ADD UNIQUE KEY `fid` (`fid`);

--
-- Indexes for table `fproduct`
--
ALTER TABLE `fproduct`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensordata`
--
ALTER TABLE `sensordata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogdata`
--
ALTER TABLE `blogdata`
  MODIFY `blogId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `bid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `farmer`
--
ALTER TABLE `farmer`
  MODIFY `fid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `fproduct`
--
ALTER TABLE `fproduct`
  MODIFY `pid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sensordata`
--
ALTER TABLE `sensordata`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

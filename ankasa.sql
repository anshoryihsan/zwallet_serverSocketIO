-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 07, 2020 at 11:27 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ankasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE `airlines` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `facilities` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `code` varchar(8) NOT NULL,
  `terminal` varchar(255) NOT NULL,
  `seat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`id`, `name`, `image`, `facilities`, `class`, `code`, `terminal`, `seat`) VALUES
(1, 'Garuda Indonesia', 'https://i.ibb.co/QpbHPn0/kisspng-logo-airplane-garuda-indonesia-airline-members-benefits-ppia-unimelb-5b6cf86a673673-33004425.png', 'Snack,Baggage,Wifi,Toilet', 'First', 'GA-001', 'A,B,C', 200),
(2, 'Fly Emirates', 'https://i.ibb.co/PQZ5YBQ/kisspng-emirates-auckland-airline-team-new-zealand-united-arab-emirates-5b0698dfbfb6a1-1361480515271.png', 'Snack,Baggage,Wifi,Toilet', 'Business', 'EK-001', 'A,C', 250),
(3, 'Air Asia', 'https://i.ibb.co/QHJJbvH/kisspng-airasia-logo-product-brand-airbus-a32-family-spicy-bucket-vector-logos-free-download-5b80bf7.png', 'Snack,Baggage,Wifi,Toilet', 'Business', 'AK-001', 'A,B,C', 300),
(4, 'Citilink', 'https://i.ibb.co/K0Kv25Y/kisspng-garuda-indonesia-citilink-airline-logo-garuda-indonesia-5b205d32749384-878126131528847666477.png', 'Snack,Baggage,Toilet', 'Economy', 'QG-001', 'A', 150),
(5, 'Lion Air', 'https://i.ibb.co/CbTk2P2/Lion-Air-logo-logotype-2.png', 'Toilet', 'Economy', 'JT-001', 'B', 120);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ordered_seat` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `fee` int(16) NOT NULL,
  `isPaid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `flight_id`, `user_id`, `ordered_seat`, `time`, `fee`, `isPaid`) VALUES
(1, 201, 1, '1', '2020-11-30 16:23:30', 0, 0),
(2, 201, 1, '2', '2020-11-30 16:23:36', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `id_from` int(11) NOT NULL,
  `id_to` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `sending_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `id_from`, `id_to`, `message`, `sending_time`) VALUES
(1, 1, 2, 'ini first chat', '2020-11-28 22:56:38'),
(2, 2, 1, 'ini second chat', '2020-11-28 23:56:26'),
(3, 2, 1, 'hallo', '2020-11-29 01:21:41'),
(4, 1, 2, 'testing kuy', '2020-11-29 01:26:18'),
(5, 1, 2, 'testing lagi kuy', '2020-11-29 01:31:53'),
(6, 1, 2, 'hallo juga', '2020-11-29 01:32:43'),
(7, 1, 2, 'hai lagi', '2020-11-29 01:38:08'),
(8, 1, 2, 'mantap gan', '2020-11-29 02:14:15'),
(9, 1, 2, '123123', '2020-11-29 02:16:36'),
(10, 1, 2, 'hai', '2020-11-29 09:09:41'),
(11, 1, 2, 'testing kuy', '2020-11-29 09:11:59'),
(12, 1, 3, 'hallo admin', '2020-11-30 07:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `id` int(11) NOT NULL,
  `city_departure` varchar(255) NOT NULL,
  `city_arrived` varchar(255) NOT NULL,
  `plane` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `seat` int(11) NOT NULL,
  `departure` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `time_estimate` time NOT NULL,
  `gate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id`, `city_departure`, `city_arrived`, `plane`, `price`, `seat`, `departure`, `status`, `time_estimate`, `gate`) VALUES
(201, 'Jakarta', 'Tokyo', 1, 700000, 2, '2020-11-30 16:23:36', 0, '03:30:00', 2),
(202, 'Jakarta', 'Tokyo', 3, 900000, 0, '2020-12-01 22:03:57', 0, '02:30:00', 2),
(203, 'Tokyo', 'Jakarta', 2, 400000, 0, '2020-12-01 19:03:57', 0, '03:30:00', 2),
(204, 'Tokyo', 'Jakarta', 4, 500000, 0, '2020-12-01 22:03:57', 0, '02:30:00', 2),
(205, 'Barcelona', 'Jakarta', 5, 500000, 0, '2020-12-02 00:03:57', 0, '03:30:00', 2),
(206, 'Jakarta', 'London', 1, 700000, 0, '2020-12-02 00:03:47', 0, '05:30:00', 2),
(207, 'Jakarta', 'London', 3, 900000, 0, '2020-12-02 01:03:57', 0, '03:30:00', 2),
(208, 'London', 'Jakarta', 2, 400000, 0, '2020-12-02 02:03:57', 0, '05:30:00', 2),
(209, 'London', 'Jakarta', 4, 500000, 0, '2020-12-02 03:03:57', 0, '03:30:00', 2),
(210, 'Jakarta', 'Barcelona', 5, 500000, 0, '2020-12-02 05:03:57', 0, '05:30:00', 2),
(211, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-02 19:03:47', 0, '03:30:00', 2),
(212, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-02 22:03:57', 0, '02:30:00', 2),
(213, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-02 19:03:57', 0, '03:30:00', 2),
(214, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-02 22:03:57', 0, '01:30:00', 2),
(215, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-03 00:03:57', 0, '06:30:00', 2),
(216, 'Istanbul', 'London', 1, 700000, 0, '2020-12-03 00:03:47', 0, '04:30:00', 2),
(217, 'Istanbul', 'London', 3, 900000, 0, '2020-12-03 01:03:57', 0, '03:30:00', 2),
(218, 'London', 'Istanbul', 2, 400000, 0, '2020-12-03 02:03:57', 0, '02:30:00', 2),
(219, 'London', 'Istanbul', 4, 500000, 0, '2020-12-03 03:03:57', 0, '03:30:00', 2),
(220, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-03 05:03:57', 0, '04:30:00', 2),
(221, 'Jakarta', 'Tokyo', 1, 700000, 0, '2020-12-03 19:03:47', 0, '03:30:00', 2),
(222, 'Jakarta', 'Tokyo', 3, 900000, 0, '2020-12-03 22:03:57', 0, '02:30:00', 2),
(223, 'Tokyo', 'Jakarta', 2, 400000, 0, '2020-12-03 19:03:57', 0, '03:30:00', 2),
(224, 'Tokyo', 'Jakarta', 4, 500000, 0, '2020-12-03 22:03:57', 0, '02:30:00', 2),
(225, 'Barcelona', 'Jakarta', 5, 500000, 0, '2020-12-04 00:03:57', 0, '03:30:00', 2),
(226, 'Jakarta', 'London', 1, 700000, 0, '2020-12-04 00:03:47', 0, '05:30:00', 2),
(227, 'Jakarta', 'London', 3, 900000, 0, '2020-12-04 01:03:57', 0, '03:30:00', 2),
(228, 'London', 'Jakarta', 2, 400000, 0, '2020-12-04 02:03:57', 0, '05:30:00', 2),
(229, 'London', 'Jakarta', 4, 500000, 0, '2020-12-04 03:03:57', 0, '03:30:00', 2),
(230, 'Jakarta', 'Barcelona', 5, 500000, 0, '2020-12-04 05:03:57', 0, '05:30:00', 2),
(231, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-07 19:03:47', 0, '03:30:00', 2),
(232, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-07 22:03:57', 0, '02:30:00', 2),
(233, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-07 19:03:57', 0, '03:30:00', 2),
(234, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-07 22:03:57', 0, '01:30:00', 2),
(235, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-08 00:03:57', 0, '06:30:00', 2),
(236, 'Istanbul', 'London', 1, 700000, 0, '2020-12-08 00:03:47', 0, '04:30:00', 2),
(237, 'Istanbul', 'London', 3, 900000, 0, '2020-12-08 01:03:57', 0, '03:30:00', 2),
(238, 'London', 'Istanbul', 2, 400000, 0, '2020-12-08 02:03:57', 0, '02:30:00', 2),
(239, 'London', 'Istanbul', 4, 500000, 0, '2020-12-08 03:03:57', 0, '03:30:00', 2),
(240, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-08 05:03:57', 0, '04:30:00', 2),
(241, 'Sydney', 'Jakarta', 1, 700000, 0, '2020-12-04 19:03:47', 0, '03:30:00', 2),
(242, 'Sydney', 'Jakarta', 3, 900000, 0, '2020-12-04 22:03:57', 0, '02:30:00', 2),
(243, 'Jakarta', 'Sydney', 2, 400000, 0, '2020-12-04 19:03:57', 0, '03:30:00', 2),
(244, 'Jakarta', 'Sydney', 4, 500000, 0, '2020-12-04 22:03:57', 0, '02:30:00', 2),
(245, 'Barcelona', 'Sydney', 5, 500000, 0, '2020-12-05 00:03:57', 0, '03:30:00', 2),
(246, 'Sydney', 'London', 1, 700000, 0, '2020-12-05 00:03:47', 0, '05:30:00', 2),
(247, 'Sydney', 'London', 3, 900000, 0, '2020-12-05 01:03:57', 0, '03:30:00', 2),
(248, 'London', 'Sydney', 2, 400000, 0, '2020-12-05 02:03:57', 0, '05:30:00', 2),
(249, 'London', 'Sydney', 4, 500000, 0, '2020-12-05 03:03:57', 0, '03:30:00', 2),
(250, 'Sydney', 'Barcelona', 5, 500000, 0, '2020-12-05 05:03:57', 0, '05:30:00', 2),
(251, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-05 19:03:47', 0, '03:30:00', 2),
(252, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-05 22:03:57', 0, '02:30:00', 2),
(253, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-05 19:03:57', 0, '03:30:00', 2),
(254, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-05 22:03:57', 0, '01:30:00', 2),
(255, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-06 00:03:57', 0, '06:30:00', 2),
(256, 'Istanbul', 'London', 1, 700000, 0, '2020-12-06 00:03:47', 0, '04:30:00', 2),
(257, 'Istanbul', 'London', 3, 900000, 0, '2020-12-06 01:03:57', 0, '03:30:00', 2),
(258, 'London', 'Istanbul', 2, 400000, 0, '2020-12-06 02:03:57', 0, '02:30:00', 2),
(259, 'London', 'Istanbul', 4, 500000, 0, '2020-12-06 03:03:57', 0, '03:30:00', 2),
(260, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-06 05:03:57', 0, '04:30:00', 2),
(261, 'Sydney', 'Jakarta', 1, 700000, 0, '2020-12-06 19:03:47', 0, '03:30:00', 2),
(262, 'Sydney', 'Jakarta', 3, 900000, 0, '2020-12-06 22:03:57', 0, '02:30:00', 2),
(263, 'Jakarta', 'Sydney', 2, 400000, 0, '2020-12-06 19:03:57', 0, '03:30:00', 2),
(264, 'Jakarta', 'Sydney', 4, 500000, 0, '2020-12-06 22:03:57', 0, '02:30:00', 2),
(265, 'Barcelona', 'Sydney', 5, 500000, 0, '2020-12-07 00:03:57', 0, '03:30:00', 2),
(266, 'Sydney', 'London', 1, 700000, 0, '2020-12-07 00:03:47', 0, '05:30:00', 2),
(267, 'Sydney', 'London', 3, 900000, 0, '2020-12-07 01:03:57', 0, '03:30:00', 2),
(268, 'London', 'Sydney', 2, 400000, 0, '2020-12-07 02:03:57', 0, '05:30:00', 2),
(269, 'London', 'Sydney', 4, 500000, 0, '2020-12-07 03:03:57', 0, '03:30:00', 2),
(270, 'Sydney', 'Barcelona', 5, 500000, 0, '2020-12-07 05:03:57', 0, '05:30:00', 2),
(271, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-08 19:03:47', 0, '03:30:00', 2),
(272, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-08 22:03:57', 0, '02:30:00', 2),
(273, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-08 19:03:57', 0, '03:30:00', 2),
(274, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-08 22:03:57', 0, '01:30:00', 2),
(275, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-09 00:03:57', 0, '06:30:00', 2),
(276, 'Istanbul', 'London', 1, 700000, 0, '2020-12-09 00:03:47', 0, '04:30:00', 2),
(277, 'Istanbul', 'London', 3, 900000, 0, '2020-12-09 01:03:57', 0, '03:30:00', 2),
(278, 'London', 'Istanbul', 2, 400000, 0, '2020-12-09 02:03:57', 0, '02:30:00', 2),
(279, 'London', 'Istanbul', 4, 500000, 0, '2020-12-09 03:03:57', 0, '03:30:00', 2),
(280, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-09 05:03:57', 0, '04:30:00', 2),
(281, 'Sydney', 'Jakarta', 1, 700000, 0, '2020-12-09 19:03:47', 0, '03:30:00', 2),
(282, 'Sydney', 'Jakarta', 3, 900000, 0, '2020-12-09 22:03:57', 0, '02:30:00', 2),
(283, 'Jakarta', 'Sydney', 2, 400000, 0, '2020-12-09 19:03:57', 0, '03:30:00', 2),
(284, 'Jakarta', 'Sydney', 4, 500000, 0, '2020-12-09 22:03:57', 0, '02:30:00', 2),
(285, 'Barcelona', 'Sydney', 5, 500000, 0, '2020-12-10 00:03:57', 0, '03:30:00', 2),
(286, 'Sydney', 'London', 1, 700000, 0, '2020-12-10 00:03:47', 0, '05:30:00', 2),
(287, 'Sydney', 'London', 3, 900000, 0, '2020-12-10 01:03:57', 0, '03:30:00', 2),
(288, 'London', 'Sydney', 2, 400000, 0, '2020-12-10 02:03:57', 0, '05:30:00', 2),
(289, 'London', 'Sydney', 4, 500000, 0, '2020-12-10 03:03:57', 0, '03:30:00', 2),
(290, 'Sydney', 'Barcelona', 5, 500000, 0, '2020-12-10 05:03:57', 0, '05:30:00', 2),
(291, 'Istanbul', 'Paris', 1, 700000, 0, '2020-12-10 19:03:47', 0, '03:30:00', 2),
(292, 'Istanbul', 'Paris', 3, 900000, 0, '2020-12-10 22:03:57', 0, '02:30:00', 2),
(293, 'Paris', 'Istanbul', 2, 400000, 0, '2020-12-10 19:03:57', 0, '03:30:00', 2),
(294, 'Paris', 'Istanbul', 4, 500000, 0, '2020-12-10 22:03:57', 0, '01:30:00', 2),
(295, 'Phuket', 'Istanbul', 5, 500000, 0, '2020-12-11 00:03:57', 0, '06:30:00', 2),
(296, 'Istanbul', 'London', 1, 700000, 0, '2020-12-11 00:03:47', 0, '04:30:00', 2),
(297, 'Istanbul', 'London', 3, 900000, 0, '2020-12-11 01:03:57', 0, '03:30:00', 2),
(298, 'London', 'Istanbul', 2, 400000, 0, '2020-12-11 02:03:57', 0, '02:30:00', 2),
(299, 'London', 'Istanbul', 4, 500000, 0, '2020-12-11 03:03:57', 0, '03:30:00', 2),
(300, 'Istanbul', 'Phuket', 5, 500000, 0, '2020-12-11 05:03:57', 0, '04:30:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tittle` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `isRead` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `tittle`, `description`, `isRead`) VALUES
(1, 2, 'sealmat dapet duit', 'tapi boong', 1),
(2, 1, 'dapet duit', 'ga boong', 0);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `airline_id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `airline_id`, `rating`, `user_id`) VALUES
(1, 1, 5, 3),
(2, 1, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `top_destination`
--

CREATE TABLE `top_destination` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `top_destination`
--

INSERT INTO `top_destination` (`id`, `city`, `country`, `img`) VALUES
(1, 'Tokyo', 'Japan', 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80%20750w'),
(2, 'Bali', 'Indonesia', 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=377&q=80%20377w'),
(3, 'Singapore', 'Singapore', 'https://images.unsplash.com/photo-1565967511849-76a60a516170?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80%20751w'),
(4, 'Agra', 'India', 'https://images.unsplash.com/photo-1545562083-c583d014b4f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=718&q=80 718w'),
(5, 'Barcelona', 'Spain', 'https://images.unsplash.com/photo-1562883676-8c7feb83f09b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=361&q=80 361w'),
(6, 'Sydney', 'Australia', 'ttps://images.unsplash.com/photo-1549180030-48bf079fb38a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=282&q=80 282w'),
(7, 'Paris', 'France', 'https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80 334w'),
(8, 'Phuket', 'Thailand', 'https://images.unsplash.com/photo-1568434927638-4acfab6b11dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80 375w'),
(9, 'London', 'England', 'https://images.unsplash.com/photo-1494922275507-58dc039ed337?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80%20334w'),
(10, 'Istanbul', 'Turkey', 'https://images.unsplash.com/photo-1602941800793-78c44baca4d8?ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80%20375w'),
(11, 'Washington DC', 'United States', 'https://images.unsplash.com/photo-1565571370459-5c78ebb358de?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80 400w');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `biometric` varchar(1000) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(1000) DEFAULT NULL,
  `phone` int(11) NOT NULL DEFAULT 0,
  `device_token` varchar(255) DEFAULT NULL,
  `google_id` varchar(100) DEFAULT NULL,
  `facebook_id` varchar(100) DEFAULT NULL,
  `role` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `biometric`, `address`, `photo`, `phone`, `device_token`, `google_id`, `facebook_id`, `role`) VALUES
(1, 'Saidina Hamzah', 'hamzah12@gmail.com', '$2b$10$U.Ovrzqn.f07FvWVykcODO1VYt78MT4/xez.UbTlDrVtfURPsyjri', NULL, '', '', 0, '', '', '', 0),
(2, 'Rizky Agung', 'kigung@gmail.com', '$2b$10$GJEqGmA3AXGowrcxvUYItujcVczkQIpcvOcWJyOwlLeON/QnDAkMW', NULL, '', '', 0, '', '', '', 0),
(3, 'admin', '', '', NULL, '', '', 0, '', '', '', 0),
(4, 'ihsan', 'a@a.com', '$2b$10$7BsUlB3HYeVGpULL4T85QOKuKE4qOb7TLOZeqOEgw.ySOhg3mIxfG', NULL, NULL, NULL, 0, '', '', '', 0),
(5, 'ihsan', 'anshoryihsan@gmail.com', '$2b$10$Ry8dD2c6HFo.xpeKXQIq7.cuhYt/k0EUUgs52EaLRcK3aMy3.At1q', NULL, NULL, NULL, 0, '', '', '', 0),
(6, 'ihsan', 'ihsan@mail.com', '$2b$10$850reE3wM1pNyJUpBS.gWe2sxSGr3mD0IH.luLG0GrPcPnvwZABde', NULL, NULL, '1606879327176-Screenshot-from-2020-11-26-11-04-21.png', 0, NULL, '', '', 0),
(7, 'ihsan', 'ihsana@mail.com', '$2b$10$UwAZjUbGs4B2jIyQNWxhfORtvPMqwzaqRFHWS/myxHVLHzNLrtdVO', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_from` (`id_from`),
  ADD KEY `id_to` (`id_to`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plane` (`plane`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `airplane_id` (`airline_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `top_destination`
--
ALTER TABLE `top_destination`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airlines`
--
ALTER TABLE `airlines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `top_destination`
--
ALTER TABLE `top_destination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`id_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`plane`) REFERENCES `airlines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`airline_id`) REFERENCES `airlines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

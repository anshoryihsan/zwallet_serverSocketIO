-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2020 at 09:41 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zwallet`
--

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(15) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL DEFAULT ' ',
  `photo` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(13) NOT NULL DEFAULT '0',
  `email` varchar(40) NOT NULL,
  `balance` varchar(40) NOT NULL DEFAULT '0',
  `pin` int(10) NOT NULL DEFAULT 0,
  `verified` enum('0','1') NOT NULL DEFAULT '0',
  `role_id` int(11) DEFAULT 25
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `first_name`, `last_name`, `photo`, `password`, `phone`, `email`, `balance`, `pin`, `verified`, `role_id`) VALUES
(54, 'Ihsan Anshory', ' ', '1607588997718-IMG_20201208_131328-01.jpeg', '$2b$10$3u1neey/nrQ/aeYgm9pdhOCAsDUtusvG9inncFr.GZyIPiuRvW3ku', '08180954756', 'ihsan@gmail.com', '14189000', 555555, '0', 25),
(55, 'Taufik', ' ', '1607586734880-man1.jpeg', '$2b$10$e1ZliVVRkRJDCFBhVvxjlOK8mizbuzlpMvjoaetb4rPSDSMuozL4.', '085696314', 'opik@gmail.com', '10831000', 555555, '0', 25),
(56, 'Robert', ' ', '1607586797427-user1.jpeg', '$2b$10$txJBgbmB9kiFeW6XeIF26.hwXUxBrhccg0MZlDQWh0Ytlwc1F9Xeq', '08945612345', 'robert@gmail.com', '8880000', 555555, '0', 25),
(57, 'silvi', ' ', '1607586849148-woman2.jpg', '$2b$10$SA56BEYZW9bEjNx0KLHG0upB8ldTkJZOPWHGS3Kg9u7s.BRC66NnS', '08654123987', 'silvi@gmail.com', '2100000', 555555, '0', 25),
(58, 'wendy', ' ', '1607586581030-woman1.jpeg', '$2b$10$Fs2/jOjC/KLVNfi9mRuLD.WvNGIGYJuO4YmvldE0qTw6sfZb8uRA2', '081805556666', 'wendy@gmail.com', '9000000', 555555, '0', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tb_role`
--

CREATE TABLE `tb_role` (
  `id` int(15) NOT NULL,
  `role_name` varchar(15) NOT NULL DEFAULT 'consumer'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_role`
--

INSERT INTO `tb_role` (`id`, `role_name`) VALUES
(24, 'admin'),
(25, 'consumer');

-- --------------------------------------------------------

--
-- Table structure for table `tes`
--

CREATE TABLE `tes` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `pass` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tes`
--

INSERT INTO `tes` (`id`, `name`, `pass`) VALUES
(8, 'satu', '\"ÃË§ƒ;?ÓtÇÈÐHÐC˜'),
(9, 'dua', 'hZÅø=ù@œì&é+{Ì|'),
(10, 'tiga', '=üþ…–Ow\"â;tà5¦Œ');

-- --------------------------------------------------------

--
-- Table structure for table `top_up`
--

CREATE TABLE `top_up` (
  `id` int(3) NOT NULL,
  `step` int(11) NOT NULL,
  `article` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `top_up`
--

INSERT INTO `top_up` (`id`, `step`, `article`) VALUES
(1, 1, 'Go to the nearest ATM or you can use E-Banking.'),
(2, 2, 'Type your security number on the ATM or E-Banking.'),
(3, 3, 'Select “Transfer” in the menu'),
(4, 4, 'Type the virtual account number that we provide you at the top.'),
(5, 5, 'Type the amount of the money you want to top up.'),
(6, 6, 'Read the summary details'),
(7, 7, 'Press transfer / top up'),
(8, 8, 'You can see your money in Zwallet within 3 hours.'),
(14, 9, 'this is an articleaa'),
(15, 90, 'this is an articleaa'),
(16, 999, 'this is an article'),
(18, 9, 'this is an article');

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `transfer_id` int(15) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `trans_name` varchar(25) NOT NULL DEFAULT 'transfer',
  `trans_type` varchar(25) NOT NULL DEFAULT 'out',
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `note` text NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`transfer_id`, `profile_id`, `receiver_id`, `amount`, `trans_name`, `trans_type`, `date`, `note`) VALUES
(1, 57, 57, 4500000, 'transfer', 'out', '2020-12-10 14:57:50', 'transfer'),
(2, 57, 54, 1500000, 'transfer', 'out', '2020-12-10 15:06:03', 'transfer'),
(3, 57, 54, 1500000, 'transfer', 'out', '2020-12-10 15:07:31', 'transfer'),
(4, 57, 54, 1500000, 'transfer', 'out', '2020-12-10 15:09:31', 'transfer'),
(5, 57, 54, 1500000, 'transfer', 'out', '2020-12-10 15:12:35', 'transfer'),
(6, 57, 54, 1500000, 'transfer', 'out', '2020-12-10 15:14:35', 'transfer'),
(7, 54, 57, 300000, 'transfer', 'out', '2020-12-10 15:14:36', 'transfer'),
(8, 54, 57, 300000, 'transfer', 'out', '2020-12-10 15:16:19', 'transfer'),
(9, 56, 54, 60000, 'transfer', 'out', '2020-12-10 15:17:40', 'transfer'),
(10, 56, 54, 60000, 'transfer', 'out', '2020-12-10 15:20:38', 'transfer'),
(11, 54, 55, 986000, 'transfer', 'out', '2020-12-10 15:21:47', 'transfer'),
(12, 54, 55, 845000, 'transfer', 'out', '2020-12-10 15:26:39', 'transfer');

-- --------------------------------------------------------

--
-- Table structure for table `transfer1`
--

CREATE TABLE `transfer1` (
  `transfer_id` int(16) NOT NULL,
  `wallet_id` int(16) NOT NULL,
  `beneficiary_id` int(16) NOT NULL,
  `amount` int(16) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `transfer1`
--

INSERT INTO `transfer1` (`transfer_id`, `wallet_id`, `beneficiary_id`, `amount`, `date`, `note`) VALUES
(1, 1, 2, 3000, '0000-00-00 00:00:00', 'hy'),
(2, 1, 3, 10000, '0000-00-00 00:00:00', 'hyy'),
(3, 2, 1, 2000, '2020-10-06 16:41:35', 'buy'),
(4, 3, 1, 900, '2020-10-13 00:45:00', 'haha'),
(5, 2, 3, 800, '2020-10-13 00:51:50', 'tes');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `wallet_id` int(15) NOT NULL,
  `user_id` int(15) NOT NULL,
  `pin` int(6) NOT NULL,
  `balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`wallet_id`, `user_id`, `pin`, `balance`) VALUES
(1, 1, 123456, 120000),
(2, 2, 123456, 120000),
(3, 3, 123456, 120000),
(4, 4, 123456, 120000),
(5, 5, 123456, 120000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role_id`);

--
-- Indexes for table `tb_role`
--
ALTER TABLE `tb_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tes`
--
ALTER TABLE `tes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `top_up`
--
ALTER TABLE `top_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `transaction` (`profile_id`),
  ADD KEY `transaction2` (`receiver_id`);

--
-- Indexes for table `transfer1`
--
ALTER TABLE `transfer1`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tes`
--
ALTER TABLE `tes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `top_up`
--
ALTER TABLE `top_up`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `transfer_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transfer1`
--
ALTER TABLE `transfer1`
  MODIFY `transfer_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `wallet_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transaction` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction2` FOREIGN KEY (`receiver_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

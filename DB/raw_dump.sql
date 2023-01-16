-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2023 at 08:06 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arduino`
--

-- --------------------------------------------------------

--
-- Table structure for table `raw_dump`
--

CREATE TABLE `raw_dump` (
  `id` int(11) NOT NULL,
  `data_a` varchar(500) DEFAULT NULL,
  `sync_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `raw_dump`
--

INSERT INTO `raw_dump` (`id`, `data_a`, `sync_time`) VALUES
(1, 'sensor:0value:426', '2023-01-16 19:49:26'),
(2, 'sensor:1value:48', '2023-01-16 19:49:27'),
(3, 'sensor:2value:183', '2023-01-16 19:49:28'),
(4, 'sensor:3value:364', '2023-01-16 19:49:29'),
(5, 'sensor:4value:33', '2023-01-16 19:49:30'),
(6, 'sensor:5value:384', '2023-01-16 19:49:31'),
(7, 'sensor:0value:399', '2023-01-16 19:54:26'),
(8, 'sensor:1value:273', '2023-01-16 19:54:27'),
(9, 'sensor:2value:421', '2023-01-16 19:54:28'),
(10, 'sensor:3value:447', '2023-01-16 19:54:29'),
(11, 'sensor:4value:373', '2023-01-16 19:54:30'),
(12, 'sensor:5value:563', '2023-01-16 19:54:31'),
(13, 'sensor:0value:130', '2023-01-16 19:59:26'),
(14, 'sensor:1value:307', '2023-01-16 19:59:27'),
(15, 'sensor:2value:74', '2023-01-16 19:59:28'),
(16, 'sensor:3value:205', '2023-01-16 19:59:29'),
(17, 'sensor:4value:293', '2023-01-16 19:59:30'),
(18, 'sensor:5value:166', '2023-01-16 19:59:31'),
(19, 'sensor:0value:360', '2023-01-16 20:04:27'),
(20, 'sensor:1value:89', '2023-01-16 20:04:28'),
(21, 'sensor:2value:85', '2023-01-16 20:04:29'),
(22, 'sensor:3value:131', '2023-01-16 20:04:30'),
(23, 'sensor:4value:346', '2023-01-16 20:04:31'),
(24, 'sensor:5value:454', '2023-01-16 20:04:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `raw_dump`
--
ALTER TABLE `raw_dump`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `raw_dump`
--
ALTER TABLE `raw_dump`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

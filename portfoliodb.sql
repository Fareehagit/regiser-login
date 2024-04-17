-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Feb 01, 2024 at 09:29 PM
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
-- Database: `portfoliodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `userName` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_No` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`userName`, `firstName`, `lastName`, `email`, `contact_No`, `gender`) VALUES
('fariha liaqat', 'Fariha', 'Liaqat', 'fareehaliaqat6@gmail.com', '03326616708', ''),
('fariha liaqat', 'Fariha', 'Liaqat', 'fareehaliaqat6@gmail.com', '03326616708', 'Female'),
('test user', 'test', 'user', 'hjkliuytgfd6@gmail.com', '87906543890', 'Male'),
('comon practic', 'comon', 'practice', 'hjkliuytgfd6@gmail.com', '87906543890', 'Male'),
('adnan ali', 'adnan', 'ali', 'hjkliuytgfd6@gmail.com', '87906543890', 'Male'),
('akif ali', 'akif', 'ali', 'hjkliuytgfd6@gmail.com', '87906543890', 'Male'),
('maria b', 'maria', 'b', 'hjkliuytgfd6@gmail.com', '87906543890', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `userName`, `password`) VALUES
(14, 'adnan ali', 'adnan'),
(15, 'adnan ali', 'adnan'),
(17, 'adnan ali', 'lukman'),
(19, 'akif ali', 'akif'),
(20, 'maria b', 'maria');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

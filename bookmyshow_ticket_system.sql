-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2024 at 04:54 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookmyshow_ticket_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `show_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `seats_booked` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `show_id`, `user_name`, `seats_booked`, `booking_date`) VALUES
(1, 1, 'John Doe', 2, '2024-04-24 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `genre`, `duration`, `language`) VALUES
(1, 'Dasara', 'Drama', 148, 'Telugu'),
(2, 'Kisi Ka Bhai Kisi Ki Jaan', 'Drama', 161, 'Hindi'),
(3, 'Tu Jhoothi Main Makkaar', 'Romantic Comedy', 164, 'Hindi'),
(4, 'Avatar: The Way of Water', 'Action', 192, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `theatre_id` int(11) DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`, `theatre_id`, `seat_number`) VALUES
(1, 1, 'A1'),
(2, 1, 'A2'),
(3, 1, 'A3');

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `show_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `theatre_id` int(11) DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `show_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `movie_id`, `theatre_id`, `show_date`, `show_time`) VALUES
(1, 1, 1, '2024-04-25', '12:15:00'),
(2, 2, 1, '2024-04-25', '01:00:00'),
(3, 2, 1, '2024-04-25', '04:10:00'),
(4, 2, 1, '2024-04-25', '06:20:00'),
(5, 2, 1, '2024-04-25', '07:30:00'),
(6, 2, 1, '2024-04-25', '10:30:00'),
(7, 3, 1, '2024-04-25', '01:15:00'),
(8, 4, 1, '2024-04-25', '01:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `show_seats`
--

CREATE TABLE `show_seats` (
  `show_seat_id` int(11) NOT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `show_id` int(11) DEFAULT NULL,
  `status` enum('Available','Booked') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `show_seats`
--

INSERT INTO `show_seats` (`show_seat_id`, `seat_id`, `show_id`, `status`) VALUES
(1, 1, 1, 'Booked'),
(2, 2, 1, 'Available'),
(3, 3, 2, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `theatres`
--

CREATE TABLE `theatres` (
  `theatre_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theatres`
--

INSERT INTO `theatres` (`theatre_id`, `name`, `location`) VALUES
(1, 'PVR', 'Nexus (Forum Mall)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `show_id` (`show_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `theatre_id` (`theatre_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`show_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `theatre_id` (`theatre_id`);

--
-- Indexes for table `show_seats`
--
ALTER TABLE `show_seats`
  ADD PRIMARY KEY (`show_seat_id`),
  ADD KEY `seat_id` (`seat_id`),
  ADD KEY `show_id` (`show_id`);

--
-- Indexes for table `theatres`
--
ALTER TABLE `theatres`
  ADD PRIMARY KEY (`theatre_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `show_seats`
--
ALTER TABLE `show_seats`
  MODIFY `show_seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `theatres`
--
ALTER TABLE `theatres`
  MODIFY `theatre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`theatre_id`) REFERENCES `theatres` (`theatre_id`);

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`theatre_id`) REFERENCES `theatres` (`theatre_id`);

--
-- Constraints for table `show_seats`
--
ALTER TABLE `show_seats`
  ADD CONSTRAINT `show_seats_ibfk_1` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`seat_id`),
  ADD CONSTRAINT `show_seats_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

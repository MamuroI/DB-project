-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2020 at 05:29 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
CREATE Database `omakase`;
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `trip_list` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `tel`, `username`, `password`, `trip_list`) VALUES
(1, 'admin', 'admin@test.com', '1234567890', 'admin', 'test', ''),
(11, 'test', 'test@test.com', '1234567890', 'test', '1234', '1'),
(12, 'Musashi', 'musashi@tk.com', '1234567890', 'musashi', '1234', '1,1'),
(13, 'photo', 'photo@test.com', '1234567890', 'photo', '1234', '');

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `trip_id` int(11) NOT NULL,
  `trip_name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `date` date DEFAULT NULL,
  `price` float NOT NULL,
  `seat` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`trip_id`, `trip_name`, `description`, `date`, `price`, `seat`) VALUES
(1, 'Beginer', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-08-26', 100, 3),
(2, 'Bronze', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2020-08-30', 200, 0),
(3, 'Iron', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam finibus pulvinar mauris, eu semper lectus. Sed tempus dui eget ultrices facilisis. Ut dignissim eget eros a sagittis. Proin ullamcorper nunc diam, id lobortis felis ultricies eu. Nam imperdiet ipsum ultrices bibendum imperdiet. Integer viverra lacus mauris, nec imperdiet nisi placerat ultrices. Suspendisse vel elit dui. Cras non venenatis arcu, quis condimentum purus. Aenean finibus in ligula nec placerat. Interdum et malesuada fames ac ante ipsum primis in faucibus.', '2020-09-22', 200, 0),
(5, 'Platinum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean arcu justo, venenatis a libero nec, semper posuere tortor. Ut lectus dui, mattis ac gravida at, dapibus non lacus. Morbi enim lectus, vehicula ac tristique consequat, laoreet sit amet mi. Donec in fermentum mauris. Nam fringilla porta tempus. Donec velit odio, finibus id massa non, suscipit iaculis tortor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque et libero non ligula hendrerit ornare. Praesent volutpat arcu ligula, sed pellentesque nisl euismod vitae. In pharetra eros id lectus eleifend, sit amet laoreet leo semper. Aenean congue tempor justo ut luctus. Nulla suscipit ipsum fringilla nisl vehicula tincidunt. Vestibulum accumsan ante ac sagittis porttitor. Vestibulum sagittis felis augue, in tempor libero pellentesque ac.', '2020-09-19', 300, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`trip_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

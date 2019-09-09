-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2019 at 05:40 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `production_plant`
--

-- --------------------------------------------------------

--
-- Table structure for table `buy`
--

CREATE TABLE `buy` (
  `buy_id` int(11) NOT NULL,
  `fk_user_from` int(11) NOT NULL,
  `buy_message` varchar(300) NOT NULL,
  `buy_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_status` enum('worker','manager') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employment_app`
--

CREATE TABLE `employment_app` (
  `employment_id` int(12) NOT NULL,
  `employment_fullname` varchar(200) NOT NULL,
  `employment_email` varchar(200) NOT NULL,
  `employment_message` text NOT NULL,
  `employment_file` varchar(200) NOT NULL,
  `fk_user_from` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `machine_id` int(12) NOT NULL,
  `machine_name` varchar(200) NOT NULL,
  `machine_description` varchar(250) NOT NULL,
  `machine_date` date NOT NULL,
  `machine_status` enum('active','defect') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_quantity` int(200) NOT NULL,
  `product_date` datetime NOT NULL,
  `product_description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `q_message`
--

CREATE TABLE `q_message` (
  `q_message` int(12) NOT NULL,
  `q_message_name` varchar(200) NOT NULL,
  `q_message_email` varchar(200) NOT NULL,
  `q_message_subject` varchar(200) NOT NULL,
  `q_message_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `raw_material`
--

CREATE TABLE `raw_material` (
  `raw_material_id` int(12) NOT NULL,
  `raw_material_name` varchar(200) NOT NULL,
  `raw_material_date` datetime NOT NULL,
  `raw_material_description` text NOT NULL,
  `raw_material_price` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repository`
--

CREATE TABLE `repository` (
  `repository_id` int(11) NOT NULL,
  `repository_name` varchar(200) NOT NULL,
  `repository_description` varchar(250) NOT NULL,
  `fk_user_owner` int(11) NOT NULL,
  `fk_employee_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `request_id` int(12) NOT NULL,
  `request_type` enum('buy','sale','pay') NOT NULL,
  `request_message` varchar(250) NOT NULL,
  `request_date` datetime NOT NULL,
  `fk_user_from` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `salary_id` int(11) NOT NULL,
  `fk_user_from` int(11) NOT NULL,
  `fk_user_to` int(11) NOT NULL,
  `salary_amount` varchar(200) NOT NULL,
  `salary_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(12) NOT NULL,
  `section_name` varchar(200) NOT NULL,
  `section_description` text NOT NULL,
  `fk_raw_material_id` int(12) NOT NULL,
  `fk_user_id` int(12) NOT NULL,
  `fk_employee_id` int(12) NOT NULL,
  `fk_machine` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `show_requests`
--

CREATE TABLE `show_requests` (
  `show_request_id` int(11) NOT NULL,
  `show_request_name` varchar(200) NOT NULL,
  `show_request_type` enum('buy','sale','pay') NOT NULL,
  `show_request_description` varchar(200) NOT NULL,
  `fk_user_from` int(11) NOT NULL,
  `fk_user_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(12) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `telefon` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `gender` enum('f','m') NOT NULL,
  `status` enum('Married','single') NOT NULL,
  `children` int(200) NOT NULL,
  `nationality` varchar(200) NOT NULL,
  `education` varchar(200) NOT NULL,
  `date_of_start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `salary` varchar(200) NOT NULL,
  `role` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`buy_id`),
  ADD KEY `fk_user_from` (`fk_user_from`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `employment_app`
--
ALTER TABLE `employment_app`
  ADD PRIMARY KEY (`employment_id`),
  ADD KEY `fk_user_from` (`fk_user_from`);

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`machine_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `q_message`
--
ALTER TABLE `q_message`
  ADD PRIMARY KEY (`q_message`);

--
-- Indexes for table `raw_material`
--
ALTER TABLE `raw_material`
  ADD PRIMARY KEY (`raw_material_id`);

--
-- Indexes for table `repository`
--
ALTER TABLE `repository`
  ADD PRIMARY KEY (`repository_id`),
  ADD KEY `fk_user_owner` (`fk_user_owner`),
  ADD KEY `fk_product_id` (`fk_product_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_user_from` (`fk_user_from`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `fk_user_from` (`fk_user_from`),
  ADD KEY `fk_user_to` (`fk_user_to`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `fk_raw_material_id` (`fk_raw_material_id`),
  ADD KEY `fk_user_id` (`fk_user_id`),
  ADD KEY `fk_machine` (`fk_machine`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `show_requests`
--
ALTER TABLE `show_requests`
  ADD PRIMARY KEY (`show_request_id`),
  ADD KEY `fk_user_from` (`fk_user_from`),
  ADD KEY `fk_user_to` (`fk_user_to`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buy`
--
ALTER TABLE `buy`
  MODIFY `buy_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employment_app`
--
ALTER TABLE `employment_app`
  MODIFY `employment_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `machine_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `q_message`
--
ALTER TABLE `q_message`
  MODIFY `q_message` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raw_material`
--
ALTER TABLE `raw_material`
  MODIFY `raw_material_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repository`
--
ALTER TABLE `repository`
  MODIFY `repository_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `request_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `show_requests`
--
ALTER TABLE `show_requests`
  MODIFY `show_request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`fk_user_from`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `employment_app`
--
ALTER TABLE `employment_app`
  ADD CONSTRAINT `employment_app_ibfk_1` FOREIGN KEY (`fk_user_from`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `repository`
--
ALTER TABLE `repository`
  ADD CONSTRAINT `repository_ibfk_1` FOREIGN KEY (`fk_user_owner`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `repository_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `repository_ibfk_3` FOREIGN KEY (`fk_employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`fk_user_from`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`fk_user_from`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`fk_user_from`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `salary_ibfk_2` FOREIGN KEY (`fk_user_to`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `sections_ibfk_2` FOREIGN KEY (`fk_raw_material_id`) REFERENCES `raw_material` (`raw_material_id`),
  ADD CONSTRAINT `sections_ibfk_3` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `sections_ibfk_4` FOREIGN KEY (`fk_machine`) REFERENCES `machine` (`machine_id`),
  ADD CONSTRAINT `sections_ibfk_5` FOREIGN KEY (`fk_employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `show_requests`
--
ALTER TABLE `show_requests`
  ADD CONSTRAINT `show_requests_ibfk_1` FOREIGN KEY (`fk_user_from`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `show_requests_ibfk_2` FOREIGN KEY (`fk_user_to`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

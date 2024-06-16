-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2024 at 03:38 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloud_comp_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `status` enum('interview','declined','pending') NOT NULL DEFAULT 'pending',
  `createdBy` int(11) NOT NULL,
  `jobType` enum('full-time','part-time','remote','internship') NOT NULL DEFAULT 'full-time',
  `jobLocation` varchar(255) NOT NULL DEFAULT 'my city',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `company`, `position`, `status`, `createdBy`, `jobType`, `jobLocation`, `createdAt`, `updatedAt`) VALUES
(1, 'Strosin, Nicolas and Robel', 'VP Product Management', 'declined', 2, 'full-time', 'my city', '2022-12-29 06:27:42', '2024-06-16 13:38:02'),
(2, 'Bechtelar Inc', 'Associate Professor', 'declined', 2, 'part-time', 'my city', '2022-06-06 17:23:18', '2024-06-16 13:38:02'),
(3, 'Cummerata Inc', 'Environmental Tech', 'declined', 2, 'part-time', 'my city', '2022-12-25 12:39:15', '2024-06-16 13:38:02'),
(4, 'Oberbrunner-Leannon', 'Cost Accountant', 'declined', 2, 'part-time', 'my city', '2023-07-06 10:17:35', '2024-06-16 13:38:02'),
(5, 'Harber-Beer', 'Graphic Designer', 'declined', 2, 'remote', 'my city', '2022-09-14 03:57:04', '2024-06-16 13:38:02'),
(6, 'Runolfsdottir Group', 'Analyst Programmer', 'declined', 2, 'remote', 'my city', '2022-05-27 13:04:06', '2024-06-16 13:38:02'),
(7, 'Schimmel LLC', 'Product Engineer', 'interview', 2, 'remote', 'my city', '2023-12-21 03:19:12', '2024-06-16 13:38:02'),
(8, 'Considine-Hyatt', 'Staff Accountant III', 'declined', 2, 'full-time', 'my city', '2023-04-03 20:44:55', '2024-06-16 13:38:02'),
(9, 'Rolfson and Sons', 'Account Representative I', 'declined', 2, 'full-time', 'my city', '2022-08-21 02:19:48', '2024-06-16 13:38:02'),
(10, 'Bergnaum Group', 'Office Assistant I', 'interview', 2, 'remote', 'my city', '2023-12-16 19:03:05', '2024-06-16 13:38:02'),
(11, 'Johns Inc', 'Account Coordinator', 'interview', 2, 'remote', 'my city', '2022-08-05 03:02:26', '2024-06-16 13:38:02'),
(12, 'Waters LLC', 'Operator', 'declined', 2, 'full-time', 'my city', '2023-03-21 23:32:21', '2024-06-16 13:38:02'),
(13, 'Spinka, Reichel and Cummings', 'Statistician II', 'declined', 2, 'remote', 'my city', '2023-05-07 01:12:29', '2024-06-16 13:38:02'),
(14, 'Robel, Hauck and Graham', 'Developer III', 'interview', 2, 'full-time', 'my city', '2022-05-24 18:37:01', '2024-06-16 13:38:02'),
(15, 'Treutel, Lebsack and Borer', 'Internal Auditor', 'pending', 2, 'full-time', 'my city', '2022-05-27 17:46:11', '2024-06-16 13:38:02'),
(16, 'Hermiston, Emard and Hand', 'Occupational Therapist', 'declined', 2, 'full-time', 'my city', '2022-08-31 04:09:37', '2024-06-16 13:38:02'),
(17, 'Kerluke Group', 'Environmental Specialist', 'interview', 2, 'full-time', 'my city', '2023-12-16 02:15:32', '2024-06-16 13:38:02'),
(18, 'Skiles-Corwin', 'Social Worker', 'declined', 2, 'remote', 'my city', '2023-12-25 18:16:06', '2024-06-16 13:38:02'),
(19, 'Macejkovic, Murphy and Hamill', 'Research Nurse', 'declined', 2, 'part-time', 'my city', '2022-05-20 17:32:55', '2024-06-16 13:38:02'),
(20, 'Bergstrom, Dickens and Crist', 'Legal Assistant', 'pending', 2, 'internship', 'my city', '2022-11-25 20:47:30', '2024-06-16 13:38:02'),
(21, 'Frami LLC', 'Developer II', 'interview', 2, 'part-time', 'my city', '2023-04-21 02:54:48', '2024-06-16 13:38:02'),
(22, 'Borer-Ruecker', 'Actuary', 'pending', 2, 'full-time', 'my city', '2022-05-19 05:04:26', '2024-06-16 13:38:02'),
(23, 'Dickinson-Walter', 'Media Manager II', 'declined', 2, 'internship', 'my city', '2022-06-25 08:58:12', '2024-06-16 13:38:02'),
(24, 'Stokes, Conn and Ferry', 'Engineer II', 'declined', 2, 'full-time', 'my city', '2024-01-25 15:40:40', '2024-06-16 13:38:02'),
(25, 'Rice, Smith and Heathcote', 'Desktop Support Technician', 'interview', 2, 'remote', 'my city', '2022-10-09 11:23:48', '2024-06-16 13:38:02'),
(26, 'Feil Inc', 'Geologist I', 'interview', 2, 'remote', 'my city', '2022-09-03 06:47:37', '2024-06-16 13:38:02'),
(27, 'Jakubowski, Spencer and Kiehn', 'Professor', 'pending', 2, 'part-time', 'my city', '2023-09-03 13:02:21', '2024-06-16 13:38:02'),
(28, 'Erdman LLC', 'Media Manager III', 'pending', 2, 'internship', 'my city', '2024-01-26 16:31:19', '2024-06-16 13:38:02'),
(29, 'Jacobson-Douglas', 'Web Developer I', 'declined', 2, 'full-time', 'my city', '2022-12-14 18:19:19', '2024-06-16 13:38:02'),
(30, 'Nikolaus-Rodriguez', 'Office Assistant IV', 'interview', 2, 'part-time', 'my city', '2022-04-26 05:53:39', '2024-06-16 13:38:02'),
(31, 'Becker Group', 'Automation Specialist II', 'declined', 2, 'full-time', 'my city', '2023-05-02 12:26:50', '2024-06-16 13:38:02'),
(32, 'Wehner, Nitzsche and Shanahan', 'Junior Executive', 'interview', 2, 'part-time', 'my city', '2023-06-19 07:38:26', '2024-06-16 13:38:02'),
(33, 'Kreiger Group', 'Geological Engineer', 'declined', 2, 'part-time', 'my city', '2023-07-14 03:19:30', '2024-06-16 13:38:02'),
(34, 'Botsford-Gutmann', 'Graphic Designer', 'interview', 2, 'remote', 'my city', '2023-10-07 04:42:10', '2024-06-16 13:38:02'),
(35, 'Nikolaus-Bayer', 'Director of Sales', 'declined', 2, 'full-time', 'my city', '2023-12-14 01:19:23', '2024-06-16 13:38:02'),
(36, 'Ferry, Dare and Stamm', 'Analyst Programmer', 'declined', 2, 'remote', 'my city', '2023-07-22 06:48:41', '2024-06-16 13:38:02'),
(37, 'Crist, McKenzie and Legros', 'Assistant Manager', 'pending', 2, 'remote', 'my city', '2023-10-20 07:41:38', '2024-06-16 13:38:02'),
(38, 'O\'Conner-Pacocha', 'Quality Control Specialist', 'pending', 2, 'full-time', 'my city', '2022-12-20 22:33:49', '2024-06-16 13:38:02'),
(39, 'Stracke and Sons', 'Help Desk Technician', 'declined', 2, 'part-time', 'my city', '2022-03-02 10:40:13', '2024-06-16 13:38:02'),
(40, 'Effertz Inc', 'Social Worker', 'declined', 2, 'remote', 'my city', '2022-10-14 14:34:24', '2024-06-16 13:38:02'),
(41, 'Beer LLC', 'Programmer III', 'declined', 2, 'remote', 'my city', '2022-04-19 00:36:38', '2024-06-16 13:38:02'),
(42, 'Moen and Sons', 'Mechanical Systems Engineer', 'interview', 2, 'remote', 'my city', '2022-07-04 00:33:59', '2024-06-16 13:38:02'),
(43, 'Torphy, Hegmann and Bauch', 'Social Worker', 'interview', 2, 'internship', 'my city', '2023-12-23 14:24:34', '2024-06-16 13:38:02'),
(44, 'Nader, Mertz and Williamson', 'Geologist III', 'pending', 2, 'part-time', 'my city', '2024-01-01 21:34:54', '2024-06-16 13:38:02'),
(45, 'Steuber-Aufderhar', 'Chemical Engineer', 'interview', 2, 'part-time', 'my city', '2022-06-30 22:53:25', '2024-06-16 13:38:02'),
(46, 'Borer-Davis', 'Senior Cost Accountant', 'pending', 2, 'remote', 'my city', '2023-05-30 22:48:35', '2024-06-16 13:38:02'),
(47, 'Waters, Schuppe and Reichel', 'VP Marketing', 'declined', 2, 'internship', 'my city', '2023-06-20 14:04:42', '2024-06-16 13:38:02'),
(48, 'Zboncak, Cassin and Mayert', 'Staff Scientist', 'declined', 2, 'internship', 'my city', '2022-04-24 00:25:41', '2024-06-16 13:38:02'),
(49, 'Turcotte, Pacocha and Wisozk', 'Programmer IV', 'pending', 2, 'full-time', 'my city', '2023-02-12 21:00:20', '2024-06-16 13:38:02'),
(50, 'Feil Inc', 'Tax Accountant', 'declined', 2, 'part-time', 'my city', '2022-07-13 06:41:32', '2024-06-16 13:38:02'),
(51, 'Bogisich-Bednar', 'Paralegal', 'declined', 2, 'full-time', 'my city', '2023-08-02 12:32:21', '2024-06-16 13:38:02'),
(52, 'Hickle, Roob and Kerluke', 'Programmer IV', 'interview', 2, 'full-time', 'my city', '2023-01-21 12:53:49', '2024-06-16 13:38:02'),
(53, 'Klocko, Gleichner and Bode', 'Nurse Practicioner', 'declined', 2, 'full-time', 'my city', '2022-08-15 13:32:46', '2024-06-16 13:38:02'),
(54, 'Ward Group', 'General Manager', 'declined', 2, 'full-time', 'my city', '2022-02-11 17:07:08', '2024-06-16 13:38:02'),
(55, 'Marvin LLC', 'Senior Quality Engineer', 'pending', 2, 'part-time', 'my city', '2023-07-13 08:30:55', '2024-06-16 13:38:02'),
(56, 'Rosenbaum LLC', 'VP Quality Control', 'pending', 2, 'remote', 'my city', '2023-09-09 05:48:48', '2024-06-16 13:38:02'),
(57, 'Ortiz and Sons', 'Internal Auditor', 'interview', 2, 'remote', 'my city', '2022-11-30 23:35:46', '2024-06-16 13:38:02'),
(58, 'Homenick Inc', 'Health Coach I', 'declined', 2, 'part-time', 'my city', '2022-07-17 18:41:37', '2024-06-16 13:38:02'),
(59, 'Adams and Sons', 'Assistant Manager', 'interview', 2, 'remote', 'my city', '2022-08-09 18:16:55', '2024-06-16 13:38:02'),
(60, 'Olson-Bradtke', 'Assistant Professor', 'interview', 2, 'full-time', 'my city', '2022-06-22 07:56:35', '2024-06-16 13:38:02'),
(61, 'Anderson and Sons', 'Professor', 'declined', 2, 'internship', 'my city', '2023-01-30 03:31:37', '2024-06-16 13:38:02'),
(62, 'Hermiston, Hansen and Schroeder', 'Software Engineer III', 'declined', 2, 'internship', 'my city', '2022-05-09 00:35:19', '2024-06-16 13:38:02'),
(63, 'Terry-Little', 'Quality Control Specialist', 'declined', 2, 'full-time', 'my city', '2022-11-28 21:56:04', '2024-06-16 13:38:02'),
(64, 'Torp-Olson', 'Cost Accountant', 'pending', 2, 'full-time', 'my city', '2022-05-05 04:35:56', '2024-06-16 13:38:02'),
(65, 'Witting-Casper', 'Pharmacist', 'pending', 2, 'remote', 'my city', '2022-04-21 14:22:30', '2024-06-16 13:38:02'),
(66, 'Parker Group', 'Sales Representative', 'declined', 2, 'remote', 'my city', '2023-03-10 06:18:25', '2024-06-16 13:38:02'),
(67, 'Bednar and Sons', 'Assistant Media Planner', 'declined', 2, 'remote', 'my city', '2022-04-16 01:19:08', '2024-06-16 13:38:02'),
(68, 'Bruen, Sporer and Thompson', 'Editor', 'pending', 2, 'internship', 'my city', '2022-12-23 02:21:10', '2024-06-16 13:38:02'),
(69, 'Boehm-Weber', 'Design Engineer', 'declined', 2, 'internship', 'my city', '2022-03-01 15:22:35', '2024-06-16 13:38:02'),
(70, 'Cronin-Homenick', 'Teacher', 'pending', 2, 'internship', 'my city', '2023-04-22 17:13:13', '2024-06-16 13:38:02'),
(71, 'Ruecker-Ryan', 'Health Coach III', 'interview', 2, 'part-time', 'my city', '2022-05-23 00:19:38', '2024-06-16 13:38:02'),
(72, 'Quitzon and Sons', 'Senior Sales Associate', 'pending', 2, 'part-time', 'my city', '2022-12-24 08:39:57', '2024-06-16 13:38:02'),
(73, 'Hartmann-Kassulke', 'General Manager', 'declined', 2, 'part-time', 'my city', '2023-08-26 14:03:34', '2024-06-16 13:38:02'),
(74, 'Nader-Parker', 'Chief Design Engineer', 'declined', 2, 'internship', 'my city', '2023-01-15 03:01:49', '2024-06-16 13:38:02'),
(75, 'Reilly-Grady', 'Marketing Manager', 'interview', 2, 'internship', 'my city', '2023-07-24 05:35:47', '2024-06-16 13:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL DEFAULT 'lastname',
  `location` varchar(255) NOT NULL DEFAULT 'my city',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `lastName`, `location`, `createdAt`, `updatedAt`) VALUES
(1, 'malik', 'malik@gmail.com', '$2a$10$hS/kaHDsPjGtv3nkcTuZF.7BFD3KpXBmSH9/Zu/v91XQj21uKpplq', 'lastname', 'my city', '2024-06-16 13:35:59', '2024-06-16 13:35:59'),
(2, 'demo user', 'testuser@test.com', '$2a$10$zFGH1okSNWiuj0KuzvL.F.8tmk9PBbH0WTRE14Z9fg32lGiMn17Ku', 'lastname', 'my city', '2024-06-16 13:36:42', '2024-06-16 13:36:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdBy` (`createdBy`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

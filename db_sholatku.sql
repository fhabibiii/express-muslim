-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2025 at 05:12 AM
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
-- Database: `db_sholatku`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `id` int(11) NOT NULL,
  `fajr` varchar(191) NOT NULL,
  `sunrise` varchar(191) NOT NULL,
  `dhuhr` varchar(191) NOT NULL,
  `asr` varchar(191) NOT NULL,
  `maghrib` varchar(191) NOT NULL,
  `isha` varchar(191) NOT NULL,
  `imsak` varchar(191) NOT NULL,
  `date` varchar(191) NOT NULL,
  `hijriDate` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`, `city`, `country`) VALUES
(6, 'Faqihuddin Habibi', 'habibii@gmail.com', '$2a$10$kBUudXL/1KGIbcOVJ6.wM.m69XWijP6oB6z5ZwEcSIFeKQGy0eH9y', '2025-01-02 08:48:18.703', '2025-01-04 06:09:46.904', 'sragen', 'indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('09e2131e-451e-4ea5-b319-4a658d223b46', '4af8e8915de6cf1c81bb2409fbaaff316148c4e7ee61912199982d09e60a9610', '2025-01-01 01:45:43.049', '20250101014543_update_citycountry', NULL, NULL, '2025-01-01 01:45:43.042', 1),
('8200de6a-87a4-4a45-beee-c4e730270312', '2b0cc541c6646dfd6105d963e5e0eed52ab77c0efcd180157158520adb6e4eca', '2025-01-01 01:44:16.849', '20250101014340_update_cache_schema', NULL, NULL, '2025-01-01 01:44:16.824', 1),
('c0216836-8d7d-4488-9848-2459517dfe9d', 'e0f8f4ebc2e01c2b4dc1a7efb2fac28c65cd05117bbb7607065e710adb26b467', '2024-12-31 11:03:16.398', '20241231110316_user_cache', NULL, NULL, '2024-12-31 11:03:16.326', 1),
('e849c767-2b3b-4378-b5c9-83e162d95c4b', '531d2f40bd50acd2f0c1f0631adc55304cd50b63527a6e45623afe4a98ab9d18', '2025-01-01 03:22:46.440', '20250101032246_update_user', NULL, NULL, '2025-01-01 03:22:46.427', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cache`
--
ALTER TABLE `cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

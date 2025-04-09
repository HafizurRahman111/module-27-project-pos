-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2025 at 07:40 PM
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
-- Database: `ostad_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Ferry, Doyle and Schaefer', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(2, 'Shanahan, Rowe and Kuphal', 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(3, 'Stroman Ltd', 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(4, 'Rutherford-Hartmann', 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(5, 'Keeling Group', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(6, 'Lemke LLC', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(7, 'Windler-Johnston', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(8, 'Anderson Ltd', 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(9, 'Reinger-Botsford', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(10, 'Lesch, Shanahan and Rutherford', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'delectus', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(2, 'veniam', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(3, 'vel', 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(4, 'occaecati', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(5, 'voluptate', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(6, 'hic', 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(7, 'est', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(8, 'iure', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(9, 'officia', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(10, 'sunt', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Jaqueline Lebsack', 'johnnie32@example.org', '+1-360-879-7020', 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(2, 'Madalyn Bernhard', 'josianne.blick@example.org', '+1.620.585.8124', 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(3, 'Obie Collier', 'powlowski.myrna@example.net', '1-612-302-6685', 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(4, 'Mara Pagac', 'amclaughlin@example.org', '1-941-513-7913', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(5, 'Jamaal Hirthe', 'lsipes@example.com', '779.312.6903', 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `payable` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','overdue') NOT NULL DEFAULT 'pending',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `customer_id`, `total_amount`, `discount`, `vat`, `payable`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'INV-7930', 3, 940.79, 34.22, 14.00, 304.53, 'paid', 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(2, 'INV-9538', 4, 605.97, 65.64, 9.47, 183.89, 'paid', 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(3, 'INV-6290', 3, 969.82, 57.83, 14.61, 381.35, 'overdue', 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(4, 'INV-9950', 1, 551.88, 0.31, 19.87, 567.19, 'overdue', 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(5, 'INV-4280', 3, 151.96, 7.05, 17.65, 790.46, 'pending', 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(6, 'INV-3797', 4, 933.66, 82.18, 10.54, 605.38, 'paid', 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(7, 'INV-6938', 2, 476.05, 66.46, 14.10, 359.59, 'paid', 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(8, 'INV-0145', 3, 583.01, 92.12, 11.61, 687.68, 'overdue', 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(9, 'INV-9332', 2, 310.35, 18.88, 18.32, 434.71, 'overdue', 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(10, 'INV-6837', 3, 300.49, 52.50, 18.05, 459.26, 'pending', 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `invoice_id`, `product_id`, `quantity`, `sale_price`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 7, 10.81, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(2, 1, 2, 8, 62.03, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(3, 1, 10, 10, 61.41, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(4, 2, 6, 8, 97.86, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(5, 2, 8, 3, 86.69, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(6, 2, 2, 4, 34.91, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(7, 3, 2, 9, 17.63, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(8, 3, 4, 10, 21.76, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(9, 3, 10, 4, 75.27, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(10, 4, 2, 7, 89.43, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(11, 4, 8, 10, 67.97, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(12, 4, 9, 6, 28.24, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(13, 5, 1, 6, 57.01, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(14, 5, 3, 2, 66.48, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(15, 5, 5, 2, 27.30, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(16, 6, 2, 4, 69.62, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(17, 6, 8, 2, 89.89, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(18, 6, 9, 3, 46.67, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(19, 7, 3, 1, 97.12, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(20, 7, 8, 3, 35.88, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(21, 7, 7, 7, 56.42, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(22, 8, 2, 3, 34.82, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(23, 8, 4, 9, 12.42, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(24, 8, 9, 4, 97.84, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(25, 9, 9, 2, 99.99, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(26, 9, 5, 1, 79.31, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(27, 9, 9, 8, 90.08, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(28, 10, 7, 1, 32.64, 2, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(29, 10, 8, 9, 18.09, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58'),
(30, 10, 2, 4, 97.79, 1, '2025-04-09 11:38:58', '2025-04-09 11:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(211, '0001_01_01_000000_create_users_table', 1),
(212, '0001_01_01_000001_create_cache_table', 1),
(213, '0001_01_01_000002_create_jobs_table', 1),
(214, '2025_04_06_184449_create_customers_table', 1),
(215, '2025_04_06_184805_create_brands_table', 1),
(216, '2025_04_06_185004_create_categories_table', 1),
(217, '2025_04_06_185255_create_products_table', 1),
(218, '2025_04_06_185419_create_invoices_table', 1),
(219, '2025_04_06_185510_create_invoice_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `unit` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `unit`, `image`, `description`, `user_id`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'porro velit in', 11.40, 82, 'https://via.placeholder.com/640x480.png/0044ff?text=neque', 'Quas reiciendis qui fuga nisi suscipit aliquam. Aliquid et sint fugiat eius. Laborum perspiciatis debitis ex labore ut eum ut. Sunt ea voluptas doloribus rerum quod quasi harum.', 2, 3, 8, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(2, 'sapiente dolorum aut', 477.07, 21, 'https://via.placeholder.com/640x480.png/00ee00?text=similique', 'Atque accusamus ut ut qui. Nisi reiciendis harum sed voluptatum fuga et. Eum eveniet magni est quos in placeat.', 1, 3, 7, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(3, 'iusto consequatur reprehenderit', 225.99, 73, 'https://via.placeholder.com/640x480.png/006677?text=rem', 'Aut molestiae repellendus dolorum nulla rem. Dolores modi voluptas ullam omnis iste consectetur.', 1, 2, 4, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(4, 'id magni numquam', 35.81, 59, 'https://via.placeholder.com/640x480.png/00cccc?text=rerum', 'Perspiciatis modi nisi voluptas ab esse qui. Necessitatibus est inventore unde eligendi nisi officia veniam. Excepturi quam rem error quos ipsam. Sed aut in aut id animi non saepe.', 2, 3, 10, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(5, 'est aut quis', 461.94, 91, 'https://via.placeholder.com/640x480.png/0099ee?text=doloribus', 'Sed veritatis porro ipsa ut aut quo aut similique. Eos ea odio et. Ab magni qui et modi. Eius et repellendus quis est autem ex odio. Delectus quas voluptas molestiae vitae.', 1, 10, 9, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(6, 'itaque asperiores quo', 492.41, 91, 'https://via.placeholder.com/640x480.png/005522?text=sequi', 'Blanditiis rerum autem a. Laborum corrupti unde repellendus possimus voluptas ipsam esse. Amet tenetur voluptas ut atque ea provident.', 1, 5, 5, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(7, 'pariatur sunt adipisci', 351.07, 25, 'https://via.placeholder.com/640x480.png/004455?text=nisi', 'Tempore omnis et maiores ut labore sunt ut. Adipisci omnis sed repellat. Quia molestiae optio inventore provident.', 2, 4, 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(8, 'dicta molestias quia', 180.70, 56, 'https://via.placeholder.com/640x480.png/00aaee?text=voluptas', 'Sequi voluptatem qui pariatur veritatis. Sit corporis nam harum cum et totam voluptatem. Assumenda rerum perferendis nesciunt.', 2, 2, 2, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(9, 'ut et delectus', 362.29, 46, 'https://via.placeholder.com/640x480.png/003388?text=magnam', 'Porro error maxime rerum aut commodi laboriosam. Aspernatur doloribus placeat qui quis. Aut et earum aperiam est nihil. Ab omnis non numquam non quae inventore.', 2, 8, 4, '2025-04-09 11:38:57', '2025-04-09 11:38:57'),
(10, 'adipisci quo qui', 220.33, 32, 'https://via.placeholder.com/640x480.png/003322?text=repellendus', 'Eveniet vel mollitia vero veritatis temporibus quia magnam. Minus consectetur ut quidem deserunt ducimus. Id repellendus quibusdam ipsa nemo esse.', 2, 1, 1, '2025-04-09 11:38:57', '2025-04-09 11:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL DEFAULT '0',
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `otp_attempts` varchar(255) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `mobile`, `otp`, `otp_expires_at`, `otp_attempts`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User 1', 'test1@example.com', '2025-04-09 11:38:55', '$2y$12$NXmOvqJ0OllLYQG38Pi6JOZ1h7cOKjsi.UyOflv./rJBNBVxV70Wi', '1234567890', '123456', NULL, '0', 'krftHMTzr3', '2025-04-09 11:38:56', '2025-04-09 11:38:56'),
(2, 'Test User 2', 'test2@example.com', '2025-04-09 11:38:56', '$2y$12$58KEDoYaHiOxSKmjb/1wyeikAZ5fNlnSVC5KqiooRtdlnotZ/FBWm', '9876543210', '567809', NULL, '0', 'n4nLF5P1IP', '2025-04-09 11:38:56', '2025-04-09 11:38:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_products_user_id_foreign` (`user_id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

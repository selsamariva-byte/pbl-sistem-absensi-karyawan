-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 09, 2026 at 02:04 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Hadir',
  `total_kerja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lembur` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `employee_id`, `tanggal`, `check_in`, `check_out`, `status`, `total_kerja`, `lembur`, `created_at`, `updated_at`) VALUES
(4, 1, '2026-06-10', '09:51:59', '09:52:33', 'Hadir', '0 Jam 1 Menit', NULL, '2026-06-18 02:51:59', '2026-06-18 02:52:33'),
(5, 1, '2026-06-09', '08:02:05', '12:02:05', 'Hadir', '4 Jam 0 Menit', NULL, NULL, NULL),
(6, 1, '2026-06-11', '08:26:28', '15:26:28', 'Hadir', '7 Jam 0 Menit', NULL, NULL, NULL),
(7, 1, '2026-06-12', '07:30:01', '16:27:01', 'Hadir', '8 Jam 57 Menit', NULL, NULL, NULL),
(8, 1, '2026-06-13', '10:27:51', '11:27:51', 'Hadir', '1 Jam 0 Menit', NULL, NULL, NULL),
(10, 1, '2026-05-29', '08:35:41', '15:59:41', 'Hadir', '7 Jam 24 Menit', NULL, NULL, NULL),
(11, 1, '2026-06-18', '11:39:26', '11:39:32', 'Terlambat', '0 Jam 0 Menit', NULL, '2026-06-18 04:39:26', '2026-06-18 04:39:32'),
(12, 2, '2026-06-18', '13:55:52', '13:57:29', 'Terlambat', '0 Jam 2 Menit', NULL, '2026-06-18 06:55:52', '2026-06-18 06:57:29'),
(14, 1, '2026-06-19', '13:25:10', '13:26:09', 'Terlambat', '0 Jam 0 Menit', NULL, '2026-06-19 06:25:10', '2026-06-19 06:26:09'),
(15, 1, '2026-06-22', '08:58:59', '10:42:48', 'Terlambat', '1 Jam 43 Menit', NULL, '2026-06-22 01:58:59', '2026-06-22 03:42:48'),
(16, 1, '2026-06-26', '08:39:06', '16:05:09', 'Terlambat', '7 Jam 26 Menit', NULL, '2026-06-26 07:39:06', '2026-06-26 07:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `nip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `divisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `join_date` date DEFAULT NULL,
  `role` enum('employee','hr','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'employee',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `nip`, `nama`, `email`, `divisi`, `phone`, `alamat`, `foto`, `fcm_token`, `join_date`, `role`, `created_at`, `updated_at`, `password`) VALUES
(1, '123', 'Elsa maryva sianturi', 'elsa@mail.com', 'Multimedia', '0891323392', 'Pamekasan', 'profile/R5vVH923LsC5MeemMbvQyHDoFU3p8dbJEYipwCxi.jpg', 'cGos0ShuQSmiixdtzYFtBK:APA91bFphQAobpqG5w0ROWfiArXpv1dtRHdx0OmSKPHIP46tlytqHyYlZcK-1ZUxusG_CPXh3Q1hMIcB5-atlC2PWFsxPBNFCvmjWijxfBgQTTOGipBo38U', '2026-06-10', 'employee', NULL, '2026-06-26 03:56:14', '123456'),
(2, '124', 'budiyanto yono', 'budi@mail.com', 'Multimedia', '0886547894', 'jl. segara', NULL, NULL, '2026-06-10', 'employee', NULL, '2026-06-18 06:56:18', '123456'),
(3, '126', 'Nadia', 'nadia@mail.com', 'Customer Support', '08636726583', 'Jl. Kenjeran', NULL, NULL, '2026-06-19', 'employee', '2026-06-19 04:43:14', '2026-06-19 04:43:14', NULL),
(4, '127', 'Elsa frozen', 'elcaa@gmail.com', 'UI/UX Designer', '082229273733', 'Medan', NULL, NULL, '2026-06-19', 'hr', '2026-06-19 07:48:07', '2026-06-19 07:48:07', NULL),
(5, '125', 'Syifa Annisa', 'syifa@mail.com', 'Customer Support', '08624714367', 'jl. veteran', NULL, NULL, '2006-06-14', 'employee', '2026-06-22 03:22:36', '2026-06-26 05:40:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `jenis` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `employee_id`, `jenis`, `start_date`, `end_date`, `jam_mulai`, `jam_selesai`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Izin', '2026-06-12', '2026-06-13', NULL, NULL, 'Acara keluarga', 'rejected', '2026-06-11 16:43:55', '2026-06-11 16:49:02'),
(3, 1, 'Sakit', '2026-06-18', '2026-06-19', NULL, NULL, 'pusing', 'approved', '2026-06-18 08:48:29', '2026-06-18 08:48:29'),
(4, 1, 'Izin', '2026-06-22', '2026-06-24', NULL, NULL, 'Acara keluarga', 'approved', '2026-06-18 10:26:53', '2026-06-19 07:45:32'),
(5, 1, 'Izin', '2026-06-26', '2026-06-26', NULL, NULL, 'Keperluan ke dukcapil', 'approved', '2026-06-18 10:53:05', '2026-06-19 07:45:36'),
(6, 1, 'Izin', '2026-06-29', '2026-06-30', NULL, NULL, 'Ke surabaya', 'approved', '2026-06-18 12:38:10', '2026-06-19 07:45:38'),
(8, 1, 'Izin', '2026-06-20', '2026-06-21', NULL, NULL, 'Acara keluarga', 'approved', '2026-06-19 00:20:16', '2026-06-19 07:45:41'),
(9, 1, 'Lembur', '2026-06-23', '2026-06-23', '18:00:00', '21:30:00', 'Deploy aplikasi', 'approved', '2026-06-19 00:23:54', '2026-06-19 07:45:58'),
(10, 1, 'Sakit', '2026-06-20', '2026-06-22', NULL, NULL, 'sakit malaria', 'approved', '2026-06-19 06:03:30', '2026-06-19 07:46:34'),
(11, 1, 'Izin', '2026-06-19', '2026-06-19', NULL, NULL, 'pulkam', 'rejected', '2026-06-19 06:19:49', '2026-06-19 08:32:37'),
(12, 1, 'Lembur', '2026-06-27', '2026-06-27', '16:00:00', '21:00:00', 'final app testing', 'approved', '2026-06-19 06:21:26', '2026-06-19 08:32:36'),
(13, 1, 'Lembur', '2026-06-19', '2026-06-19', '19:00:00', '13:30:00', 'kelarin projek', 'approved', '2026-06-19 06:24:43', '2026-06-19 08:32:27'),
(14, 1, 'Lembur', '2026-06-30', '2026-06-30', '14:25:00', '18:25:00', 'rekap data', 'rejected', '2026-06-19 06:25:56', '2026-06-19 08:32:25'),
(15, 1, 'Lembur', '2026-06-19', '2026-06-19', '21:30:00', '02:30:00', 'finalisasi data', 'approved', '2026-06-19 08:31:48', '2026-06-19 08:32:22'),
(16, 1, 'Izin', '2026-06-25', '2026-06-27', NULL, NULL, 'keluar kota', 'approved', '2026-06-19 08:38:31', '2026-06-19 08:40:22'),
(17, 1, 'Izin', '2026-06-25', '2026-06-26', NULL, NULL, 'dinas ke jakarta', 'rejected', '2026-06-19 08:50:44', '2026-06-19 08:53:32'),
(18, 1, 'Izin', '2026-06-22', '2026-06-22', NULL, NULL, 'panen padi', 'approved', '2026-06-22 01:59:49', '2026-06-22 02:02:25'),
(19, 1, 'Sakit', '2026-06-23', '2026-06-23', NULL, NULL, 'sakit sebadan badan', 'rejected', '2026-06-22 02:00:27', '2026-06-22 02:02:32'),
(20, 1, 'Lembur', '2026-06-24', '2026-06-24', '19:00:00', '00:30:00', 'rekap gaji', 'approved', '2026-06-22 02:01:26', '2026-06-22 02:02:38'),
(21, 1, 'Izin', '2026-06-25', '2026-06-25', NULL, NULL, 'ke luar kota', 'approved', '2026-06-22 03:20:23', '2026-06-22 03:34:27'),
(22, 1, 'Sakit', '2026-06-22', '2026-06-22', NULL, NULL, 'pusing', 'approved', '2026-06-22 03:44:10', '2026-06-22 03:44:59'),
(23, 1, 'Lembur', '2026-06-22', '2026-06-22', '19:00:00', '22:00:00', 'merekap data', 'approved', '2026-06-22 04:04:08', '2026-06-26 00:49:42'),
(24, 1, 'Izin', '2026-06-26', '2026-06-26', NULL, NULL, 'ke luar kota', 'approved', '2026-06-26 00:50:35', '2026-06-26 00:50:55'),
(25, 1, 'Izin', '2026-06-27', '2026-06-27', NULL, NULL, 'ke luar negeri', 'rejected', '2026-06-26 00:53:32', '2026-06-26 00:53:51'),
(26, 1, 'Izin', '2026-06-30', '2026-06-30', NULL, NULL, 'ke surabaya', 'approved', '2026-06-26 00:55:18', '2026-06-26 00:55:29'),
(27, 1, 'Izin', '2026-06-29', '2026-06-29', NULL, NULL, 'pergi ke rumah mertua', 'approved', '2026-06-26 01:01:26', '2026-06-26 01:01:47'),
(28, 1, 'Izin', '2026-07-01', '2026-07-02', NULL, NULL, 'menjenguk mertua', 'approved', '2026-06-26 01:05:49', '2026-06-26 01:06:03'),
(29, 1, 'Izin', '2026-07-02', '2026-07-02', NULL, NULL, 'jaga anak sakit', 'approved', '2026-06-26 01:07:33', '2026-06-26 01:07:49'),
(30, 1, 'Izin', '2026-06-26', '2026-06-26', NULL, NULL, 'ke malang', 'approved', '2026-06-26 01:09:58', '2026-06-26 01:10:10'),
(31, 1, 'Izin', '2026-06-26', '2026-06-26', NULL, NULL, 'acara keluarga', 'approved', '2026-06-26 01:16:25', '2026-06-26 01:16:35'),
(32, 1, 'Izin', '2026-06-26', '2026-06-26', NULL, NULL, 'ke malang', 'approved', '2026-06-26 01:23:34', '2026-06-26 01:23:46'),
(33, 1, 'Izin', '2026-06-26', '2026-06-26', NULL, NULL, 'ke malang', 'approved', '2026-06-26 01:29:06', '2026-06-26 01:32:41'),
(34, 1, 'Sakit', '2026-06-26', '2026-06-26', NULL, NULL, 'pusing', 'approved', '2026-06-26 01:52:30', '2026-06-26 01:53:12'),
(35, 1, 'Izin', '2026-06-26', '2026-06-26', NULL, NULL, 'tes', 'approved', '2026-06-26 01:55:19', '2026-06-26 01:56:15'),
(36, 1, 'Sakit', '2026-06-26', '2026-06-28', NULL, NULL, 'sakit demam berdarah', 'approved', '2026-06-26 03:56:55', '2026-06-26 03:57:21'),
(37, 1, 'Izin', '2026-06-27', '2026-06-28', NULL, NULL, 'Nikah', 'approved', '2026-06-26 04:06:07', '2026-06-26 04:06:45'),
(38, 1, 'Sakit', '2026-06-26', '2026-06-27', NULL, NULL, 'buntaber', 'approved', '2026-06-26 04:16:56', '2026-06-26 04:17:13'),
(39, 1, 'Izin', '2026-06-28', '2026-06-30', NULL, NULL, 'Dinas luar kota', 'approved', '2026-06-26 04:34:01', '2026-06-26 04:39:28'),
(40, 1, 'Izin', '2026-07-01', '2026-07-04', NULL, NULL, 'dinas luar negeri', 'approved', '2026-06-26 04:48:20', '2026-06-26 04:48:54'),
(41, 1, 'Sakit', '2026-06-26', '2026-06-30', NULL, NULL, 'opname', 'approved', '2026-06-26 04:52:23', '2026-06-26 05:11:19'),
(42, 1, 'Lembur', '2026-06-26', '2026-06-26', '09:10:00', '11:59:00', 'rekapan', 'approved', '2026-06-26 05:00:01', '2026-06-26 07:52:59'),
(43, 1, 'Izin', '2026-06-26', '2026-06-28', NULL, NULL, 'kepentingan keluarga', 'pending', '2026-06-26 08:17:23', '2026-06-26 08:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '0001_01_01_000000_create_users_table', 1),
(7, '0001_01_01_000001_create_cache_table', 1),
(8, '0001_01_01_000002_create_jobs_table', 1),
(9, '2026_06_11_224904_create_employees_table', 1),
(10, '2026_06_11_224916_create_leave_requests_table', 1),
(11, '2026_06_12_010001_add_password_to_employees_table', 2),
(12, '2026_06_13_112313_create_attendances_table', 2),
(13, '2026_06_18_185536_create_payrolls_table', 3),
(14, '2026_06_19_070203_add_jam_to_leaves_table', 4),
(15, '2026_06_26_070749_add_fcm_token_to_employees_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `bulan` int NOT NULL,
  `tahun` int NOT NULL,
  `gaji_pokok` decimal(12,2) NOT NULL,
  `tunjangan_hadir` decimal(12,2) NOT NULL DEFAULT '0.00',
  `bonus_lembur` decimal(12,2) NOT NULL DEFAULT '0.00',
  `potongan_telat` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_gaji` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `employee_id`, `bulan`, `tahun`, `gaji_pokok`, `tunjangan_hadir`, `bonus_lembur`, `potongan_telat`, `total_gaji`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 2026, '4000000.00', '300000.00', '150000.00', '75000.00', '4375000.00', '2026-06-18 13:18:23', '2026-06-18 13:18:23'),
(2, 2, 6, 2026, '4000000.00', '20000.00', '0.00', '25000.00', '3995000.00', '2026-06-18 13:28:04', '2026-06-18 13:28:04'),
(3, 1, 5, 2026, '4000000.00', '250000.00', '200000.00', '100000.00', '4350000.00', '2026-06-18 13:37:04', '2026-06-18 13:37:04');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0nmB7KzaCqxs6XCNwDG3cKcrLe8jTccexkA2InLW', NULL, '192.168.1.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJRMk9ySUwzYlAwRm1IMUtGQU1ZM0VWeEhTb0FnNlpqZGxIRVhEWUdsIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzE5Mi4xNjguMS42MDo5MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1782445026),
('681H8cPAAG4JieEuTczIsAoQc6UEGOp6y20v7zov', NULL, '127.0.0.1', 'PostmanRuntime/7.54.0', 'eyJfdG9rZW4iOiJTbjJnTGo2ejU5UmtpR21PREFTMWpicW9DckgybXlJUVlDck5ZNVV0IiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1781220647),
('bprYhcGcIyuj0IbqI34WICEmLBmsu5H0q6lkYjAJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJmcEh0WHlBMlZxcHVvdXgya2F2WXdVTjhUVE1veHAxR2RMNG0yVGNrIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo5MDAwXC9sZWF2ZXMiLCJyb3V0ZSI6bnVsbH0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=', 1781220415);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_nip_unique` (`nip`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

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
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_requests_employee_id_foreign` (`employee_id`);

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
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payrolls_employee_id_foreign` (`employee_id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

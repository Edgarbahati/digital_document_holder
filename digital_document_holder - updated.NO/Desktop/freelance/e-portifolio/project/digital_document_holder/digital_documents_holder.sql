-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2024 at 04:58 PM
-- Server version: 11.5.2-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digital_documents_holder`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add users', 6, 'add_users'),
(22, 'Can change users', 6, 'change_users'),
(23, 'Can delete users', 6, 'delete_users'),
(24, 'Can view users', 6, 'view_users'),
(25, 'Can add password resets', 7, 'add_passwordresets'),
(26, 'Can change password resets', 7, 'change_passwordresets'),
(27, 'Can delete password resets', 7, 'delete_passwordresets'),
(28, 'Can view password resets', 7, 'view_passwordresets'),
(29, 'Can add students', 8, 'add_students'),
(30, 'Can change students', 8, 'change_students'),
(31, 'Can delete students', 8, 'delete_students'),
(32, 'Can view students', 8, 'view_students'),
(33, 'Can add teachers', 9, 'add_teachers'),
(34, 'Can change teachers', 9, 'change_teachers'),
(35, 'Can delete teachers', 9, 'delete_teachers'),
(36, 'Can view teachers', 9, 'view_teachers'),
(37, 'Can add departments', 10, 'add_departments'),
(38, 'Can change departments', 10, 'change_departments'),
(39, 'Can delete departments', 10, 'delete_departments'),
(40, 'Can view departments', 10, 'view_departments'),
(41, 'Can add classes', 11, 'add_classes'),
(42, 'Can change classes', 11, 'change_classes'),
(43, 'Can delete classes', 11, 'delete_classes'),
(44, 'Can view classes', 11, 'view_classes'),
(45, 'Can add documents', 12, 'add_documents'),
(46, 'Can change documents', 12, 'change_documents'),
(47, 'Can delete documents', 12, 'delete_documents'),
(48, 'Can view documents', 12, 'view_documents'),
(49, 'Can add modules', 13, 'add_modules'),
(50, 'Can change modules', 13, 'change_modules'),
(51, 'Can delete modules', 13, 'delete_modules'),
(52, 'Can view modules', 13, 'view_modules'),
(53, 'Can add subjects', 14, 'add_subjects'),
(54, 'Can change subjects', 14, 'change_subjects'),
(55, 'Can delete subjects', 14, 'delete_subjects'),
(56, 'Can view subjects', 14, 'view_subjects'),
(57, 'Can add hods', 15, 'add_hods'),
(58, 'Can change hods', 15, 'change_hods'),
(59, 'Can delete hods', 15, 'delete_hods'),
(60, 'Can view hods', 15, 'view_hods'),
(61, 'Can add options', 16, 'add_options'),
(62, 'Can change options', 16, 'change_options'),
(63, 'Can delete options', 16, 'delete_options'),
(64, 'Can view options', 16, 'view_options'),
(65, 'Can add student log', 17, 'add_studentlog'),
(66, 'Can change student log', 17, 'change_studentlog'),
(67, 'Can delete student log', 17, 'delete_studentlog'),
(68, 'Can view student log', 17, 'view_studentlog'),
(69, 'Can add student logs', 17, 'add_studentlogs'),
(70, 'Can change student logs', 17, 'change_studentlogs'),
(71, 'Can delete student logs', 17, 'delete_studentlogs'),
(72, 'Can view student logs', 17, 'view_studentlogs'),
(73, 'Can add student messages', 18, 'add_studentmessages'),
(74, 'Can change student messages', 18, 'change_studentmessages'),
(75, 'Can delete student messages', 18, 'delete_studentmessages'),
(76, 'Can view student messages', 18, 'view_studentmessages'),
(77, 'Can add programs', 16, 'add_programs'),
(78, 'Can change programs', 16, 'change_programs'),
(79, 'Can delete programs', 16, 'delete_programs'),
(80, 'Can view programs', 16, 'view_programs');

-- --------------------------------------------------------

--
-- Table structure for table `custom_admin_departments`
--

CREATE TABLE `custom_admin_departments` (
  `id` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `custom_admin_departments`
--

INSERT INTO `custom_admin_departments` (`id`, `name`) VALUES
('f9425460-3b14-4809-8334-bcd7c92b5aa3', 'Automobile Mechanic'),
('233143e0-29b6-4a72-b81b-b7d683bf57bf', 'Hospitality Management'),
('07dab5ec-9e25-417e-94d7-86f4c7ebb493', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `custom_admin_programs`
--

CREATE TABLE `custom_admin_programs` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `department_id` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `custom_admin_programs`
--

INSERT INTO `custom_admin_programs` (`id`, `name`, `department_id`) VALUES
('571cf71e-f0e1-42b1-8fe2-79afdb138c79', 'Auto', 'f9425460-3b14-4809-8334-bcd7c92b5aa3'),
('571cf71e-f0e1-42b1-8fe2-79afdb138c80', 'ICT', '233143e0-29b6-4a72-b81b-b7d683bf57bf'),
('571cf71e-f0e1-42b1-8fe2-79afdb138c81', 'Room Division Management', '233143e0-29b6-4a72-b81b-b7d683bf57bf'),
('571cf71e-f0e1-42b1-8fe2-79afdb138c82', 'Food and Beverage ', '233143e0-29b6-4a72-b81b-b7d683bf57bf'),
('571cf71e-f0e1-42b1-8fe2-79afdb138c83', 'Culinary Art', '233143e0-29b6-4a72-b81b-b7d683bf57bf'),
('571cf71e-f0e1-42b1-8fe2-79afdb138c88', 'Information Technology', '07dab5ec-9e25-417e-94d7-86f4c7ebb493'),
('571cf71e-f0e1-42b1-8fe2-79afdb138c89', 'Manufacturing Technology', 'f9425460-3b14-4809-8334-bcd7c92b5aa3');

-- --------------------------------------------------------

--
-- Table structure for table `custom_auth_hods`
--

CREATE TABLE `custom_auth_hods` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `custom_auth_hods`
--

INSERT INTO `custom_auth_hods` (`id`, `user_id`) VALUES
(1, 'fed28e91-7310-4dca-91b5-4654f9bba835');

-- --------------------------------------------------------

--
-- Table structure for table `custom_auth_passwordresets`
--

CREATE TABLE `custom_auth_passwordresets` (
  `id` varchar(64) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `expired_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `custom_auth_passwordresets`
--

INSERT INTO `custom_auth_passwordresets` (`id`, `token`, `created_at`, `user_id`, `expired_at`) VALUES
('0a53d418-e4a8-4188-9182-24ee230aa19f', 'c044ad9d-7336-4e02-8c08-bc911ffacf5f', '2024-09-13 08:33:53.216245', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 12:33:30.297258'),
('260ad576-56e5-40e9-9745-f19e4e222853', '14c7320a-2e9f-4d0f-abf7-84677fbbbc20', '2024-09-13 08:06:54.212833', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 12:06:11.431571'),
('318ef39a-3a82-4005-a4e7-1ebfc26ae5bc', '587f97ee-6d9f-403b-a320-d2a95a3c86f8', '2024-09-13 07:41:04.857389', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:40:48.933946'),
('3286990f-cae5-48e8-916a-45de243aa0dc', 'ead220ab-4f8f-4e06-ae2b-6b2da8a48b67', '2024-09-13 08:53:53.486302', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 12:33:30.297258'),
('332a0451-1843-4de0-b2e6-84c9ef1c6693', '0257ddd4-bbb6-4e3d-aedc-f081d1b38945', '2024-09-13 07:44:06.933805', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:44:01.033729'),
('3d3677a2-7287-4804-978a-98c22a51f69e', 'ae8daf2d-d9fa-4998-950a-3f0c252eebd2', '2024-09-13 08:07:36.068872', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 12:07:27.894319'),
('4783df1f-7d15-44ba-a1e1-2f395be5beea', 'e8771d1a-2fa8-440f-986e-7ccdbc0e0ed6', '2024-09-13 09:56:20.033838', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 10:53:16.906122'),
('4d47464e-2bc5-4af4-b6f3-e40869a2b029', '85ceebfa-de4b-4d86-8574-c897a2e1c96e', '2024-09-13 08:15:12.302604', '3fb6b6b4-12b9-4749-a794-ded3a52e74cb', '2024-09-13 12:07:27.894319'),
('6aa3654b-dfa6-4237-9d81-1cac1c2ab9ed', '66382719-0a32-4d43-ad5d-3fcbbeca5a98', '2024-09-13 08:26:41.442657', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 12:26:26.649288'),
('7473687c-acd5-4833-b796-b1ca0fa747d9', '0d14a6be-000c-4f9b-8172-045dea507374', '2024-09-13 07:49:30.318945', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:49:12.833349'),
('84e41893-6445-4c38-bc77-8e99a9063c2b', 'e6b3f3ac-60b3-4e17-af22-1f52a0ba4dd7', '2024-09-13 07:42:24.645816', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:40:48.933946'),
('999f9771-833b-4bb4-bb55-b1b17f15660d', 'b43c3b51-7128-4119-9755-2c55df9fef39', '2024-09-13 09:04:15.068714', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 13:00:31.406874'),
('9a2aaf32-146c-4ae6-81a4-894bd8e0fdeb', 'f18d9f61-6e1b-4ec1-b9a3-c330049fffa1', '2024-09-13 07:44:55.429956', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:44:49.195915'),
('9ab16c3e-6497-4058-b7a9-7e79a3b00080', 'ad8f37e3-e138-41d7-8bfc-9c9c2bf7d188', '2024-09-19 15:16:30.552737', '3fb6b6b4-12b9-4749-a794-ded3a52e74cb', '2024-09-19 16:11:38.724085'),
('9ee02b25-58ae-468d-a417-7431d0b2be46', 'd81d3e33-ae49-4c83-a384-7fa9dd9baa8f', '2024-09-13 10:28:46.392977', '3fb6b6b4-12b9-4749-a794-ded3a52e74cb', '2024-09-13 11:25:43.514288'),
('9fae6b9c-326d-40f7-8a2b-1280e50eae64', '0cc999a6-bbe0-486c-b399-dd765d1ee2ef', '2024-09-13 10:03:46.241886', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:03:26.699199'),
('ab53ba4a-6a74-41fa-9d52-7a10f3b3b017', 'e8f50b09-deb1-472f-8f6f-50de4ad38b26', '2024-09-13 07:44:15.740417', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:44:01.033729'),
('c9421a62-9e4e-4b72-ac80-cd2b2d302524', 'e2d07e04-34a6-43cf-9f09-ff501e77cd0a', '2024-09-13 07:40:04.296801', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:38:16.514242'),
('cc229e11-9551-446c-93eb-455c8cc958d3', 'e95cd42e-b2e9-4b7f-adbb-81f7d9e674ba', '2024-09-13 07:43:36.127699', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:43:25.162598'),
('ce5920cf-62bc-4ef7-ba2a-e6032f9bdf43', 'b6cbf847-c480-416c-b85c-ca4a6f345485', '2024-09-13 08:25:56.700353', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 12:24:27.337907'),
('cec061c9-bb67-4ddf-a341-22695895171f', '8d9d71df-9293-4ad7-b4a6-dcc22c6182a0', '2024-09-13 07:41:56.616503', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:40:48.933946'),
('d1dd5d8a-7f65-4fa6-81fa-fee5f7e15024', '66d1cff1-4ffb-4aa2-a724-937ce93cab62', '2024-09-13 07:38:41.090405', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:38:16.514242'),
('ea55ed2a-cf04-4a20-baf1-f1370a7a8c07', '39299310-77c8-4d02-b715-2be3a9064e10', '2024-09-13 07:42:00.110481', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '2024-09-13 11:40:48.933946');

-- --------------------------------------------------------

--
-- Table structure for table `custom_auth_students`
--

CREATE TABLE `custom_auth_students` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `program_id` varchar(64) DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `custom_auth_students`
--

INSERT INTO `custom_auth_students` (`id`, `user_id`, `program_id`, `year`) VALUES
(1, '828ff383-4e0b-43f5-a5c0-4b9b784613f6', '571cf71e-f0e1-42b1-8fe2-79afdb138c88', 2),
(3, 'a7b5df8a-9633-45d2-b1ca-9c7e4851d46d', '571cf71e-f0e1-42b1-8fe2-79afdb138c82', NULL),
(4, 'b7cf875a-3953-4552-ac67-6a0ac1702203', '571cf71e-f0e1-42b1-8fe2-79afdb138c89', 3),
(5, '0deca907-1abe-4916-b0ac-d523d707b976', '571cf71e-f0e1-42b1-8fe2-79afdb138c88', 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_auth_teachers`
--

CREATE TABLE `custom_auth_teachers` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `custom_auth_teachers`
--

INSERT INTO `custom_auth_teachers` (`id`, `user_id`) VALUES
(3, '18b8c0d0-d301-4b38-9be7-11e5b9416ed3'),
(2, '8de08616-718b-4ec6-83ca-81cac6722651');

-- --------------------------------------------------------

--
-- Table structure for table `custom_auth_users`
--

CREATE TABLE `custom_auth_users` (
  `password` varchar(128) NOT NULL,
  `id` varchar(64) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `registration_number` varchar(20) DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_student` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_hod` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superadmin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `department_id` varchar(64) DEFAULT NULL,
  `is_teacher` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `custom_auth_users`
--

INSERT INTO `custom_auth_users` (`password`, `id`, `email`, `first_name`, `last_name`, `username`, `registration_number`, `date_joined`, `last_login`, `is_student`, `is_admin`, `is_hod`, `is_active`, `is_superadmin`, `is_staff`, `department_id`, `is_teacher`) VALUES
('pbkdf2_sha256$870000$hC0uh1yuv9y6IM0YdpTdc6$qOC9gPHEUbHGKJDfHFE03IT/MO2U95PNUnwdbC9Lzkk=', '08e87623-7a72-4e51-9622-9ebe80415f00', 'Impa@gmail.com', 'Impano', 'nock', 'Impa', 'Impa@gmail.com', '2024-09-10 12:45:59.281092', '2024-09-10 12:45:59.333819', 0, 0, 1, 1, 0, 0, '233143e0-29b6-4a72-b81b-b7d683bf57bf', 0),
('pbkdf2_sha256$870000$RPgL7BHr1DfYUKEUQJul1B$9fRg3tusK1UAclcXxIy15Lgt7nKZVlaKWC6GCbcO0NY=', '0deca907-1abe-4916-b0ac-d523d707b976', 'impanm@gmail.com', 'IMPano', 'm', 'impanm', '21rp09094', '2024-09-19 15:21:16.477172', '2024-09-19 15:22:15.477327', 1, 0, 0, 1, 0, 0, '07dab5ec-9e25-417e-94d7-86f4c7ebb493', 0),
('pbkdf2_sha256$870000$8bJNujGP1vWMJOMjrIZeuS$f3exMZgiy787lPbXz7xs7htR0/VAV3iuOter0yclD+8=', '18b8c0d0-d301-4b38-9be7-11e5b9416ed3', 'impano1@gmail.com', 'MANZI', 'mmm', 'impano1', NULL, '2024-09-17 11:41:35.284851', '2024-09-17 11:41:35.303686', 0, 0, 0, 1, 0, 0, '07dab5ec-9e25-417e-94d7-86f4c7ebb493', 1),
('pbkdf2_sha256$870000$SzU4WNrawEJNN4AZ9wqCzM$8W8T4uY/y3KBTObBes6XZIn+0ipe1jyK4z4qpXtM5+M=', '3fb6b6b4-12b9-4749-a794-ded3a52e74cb', 'impanodeveloper@proton.me', 'Impano', 'Manz', 'impanodeveloper', '', '2024-09-10 12:30:35.053037', '2024-09-19 15:19:21.056372', 0, 0, 1, 1, 0, 0, '07dab5ec-9e25-417e-94d7-86f4c7ebb493', 0),
('pbkdf2_sha256$870000$BgIQXOJ9aUP0ZnxVvkd76a$kisvm59PUwRRPc107VqJuTxDNVl0BpcqHCzreUurrFc=', '40a05951-0372-4a8b-98ae-835fa9fe5448', 'impan@gmail.com', 'IMPANO', 'MANZI', 'impan', '21rp09876', '2024-09-17 11:23:28.290576', '2024-09-17 11:23:28.338132', 1, 0, 0, 1, 0, 0, 'f9425460-3b14-4809-8334-bcd7c92b5aa3', 0),
('pbkdf2_sha256$870000$zapDw3lkDwDm9KdvlZrURS$NAun1k3RLQ838Hmf3IXBeUYYPcfw8mRomarXOn6plLw=', '56df75fa-01bd-47cd-b90d-80f0ddfe3061', 'impano@gmail.com', 'IMPANO', 'Manzi', 'impano', '21rp03907', '2024-09-17 11:21:49.669430', '2024-09-17 11:21:49.669430', 1, 0, 0, 1, 0, 0, 'f9425460-3b14-4809-8334-bcd7c92b5aa3', 0),
('pbkdf2_sha256$870000$rB41TJgZ9Fyp6STTyC3kck$ssRfX6gZu3ubHfBKuZim0JeREI3nUwoPn7Y+9ToS5as=', '71e870f1-d0dc-4e57-a1ef-daedd3b3e2d2', 'edgar@gmail.com', 'edgar', 'ed', 'edgar', NULL, '2024-09-10 09:41:17.212322', '2024-09-10 12:01:22.272385', 0, 1, 0, 1, 1, 1, NULL, 0),
('pbkdf2_sha256$870000$hKdAxlKUhBI7YnLFuOgVoY$edvX6f0PYhgG1/FPBaTTcCaS3orPrUETVzwDKlYI3ck=', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', 'impanomanzienock@gmail.com', 'Impano', 'Manzi Enock', 'impanomanzienock', '21rp01620', '2024-09-10 09:50:45.241353', '2024-09-24 16:38:32.233428', 1, 0, 0, 1, 0, 0, '233143e0-29b6-4a72-b81b-b7d683bf57bf', 0),
('pbkdf2_sha256$870000$UMoArlpdub46UlFARD22Lc$MQMgaHjHhrwqRtwVMdC+CqiHcIltaK9tb15LOpEOeT4=', '8de08616-718b-4ec6-83ca-81cac6722651', 'enock@gmail.com', 'IMPANO', 'm', 'enock', 'enock@gmail.com', '2024-09-10 12:58:22.742831', '2024-09-10 12:58:22.833547', 0, 0, 0, 1, 0, 0, '07dab5ec-9e25-417e-94d7-86f4c7ebb493', 1),
('pbkdf2_sha256$870000$vkDWGhz2uCxB0QkTf20wA4$7P3JvgqOE3E9wV/81AoU7wrq4yLMDu/OhlOAIRl24XQ=', 'a7b5df8a-9633-45d2-b1ca-9c7e4851d46d', 'david@gmail.com', 'David', 'M', 'david', '21rp05512', '2024-09-17 11:25:34.164543', '2024-09-17 11:25:34.185533', 1, 0, 0, 1, 0, 0, '233143e0-29b6-4a72-b81b-b7d683bf57bf', 0),
('pbkdf2_sha256$870000$eS4ch7JXCnaKJ1jc7nd4xm$sDkRY7xUq2nsbxqiDfA3reb8OJAs/m4KQwWE7r1Lpx4=', 'b7cf875a-3953-4552-ac67-6a0ac1702203', 'fab@gmail.com', 'Fabrice', 'T', 'fab', '21rp0565', '2024-09-17 11:28:14.442086', '2024-09-17 11:28:14.504654', 1, 0, 0, 1, 0, 0, 'f9425460-3b14-4809-8334-bcd7c92b5aa3', 0),
('pbkdf2_sha256$870000$ashTxhGEBJZxedNF055mm8$UAqD030MbFF9NZUNN0mbbIGSv2jkqwcBDLYUG/xzn10=', 'fed28e91-7310-4dca-91b5-4654f9bba835', 'impanoenock@gmail.com', 'IMPANO', 'Enock', 'impanoenock', NULL, '2024-09-17 11:39:00.783586', '2024-09-19 14:53:59.805469', 0, 0, 1, 1, 0, 0, '07dab5ec-9e25-417e-94d7-86f4c7ebb493', 0);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-09-10 09:45:46.711216', '07dab5ec-9e25-417e-94d7-86f4c7ebb493', 'Departments object (07dab5ec-9e25-417e-94d7-86f4c7ebb493)', 1, '[{\"added\": {}}]', 10, '71e870f1-d0dc-4e57-a1ef-daedd3b3e2d2'),
(2, '2024-09-10 09:46:13.599198', 'f9425460-3b14-4809-8334-bcd7c92b5aa3', 'Departments object (f9425460-3b14-4809-8334-bcd7c92b5aa3)', 1, '[{\"added\": {}}]', 10, '71e870f1-d0dc-4e57-a1ef-daedd3b3e2d2'),
(3, '2024-09-10 09:46:29.893649', '233143e0-29b6-4a72-b81b-b7d683bf57bf', 'Departments object (233143e0-29b6-4a72-b81b-b7d683bf57bf)', 1, '[{\"added\": {}}]', 10, '71e870f1-d0dc-4e57-a1ef-daedd3b3e2d2'),
(4, '2024-09-10 12:53:54.804444', '1', 'Impa@gmail.com', 3, '', 9, '71e870f1-d0dc-4e57-a1ef-daedd3b3e2d2'),
(5, '2024-09-10 12:59:39.983953', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 'Modules object (8d71668b-5fb5-4bf2-9df7-fbfd1cc92094)', 1, '[{\"added\": {}}]', 13, '71e870f1-d0dc-4e57-a1ef-daedd3b3e2d2'),
(6, '2024-09-10 14:01:05.293890', '571cf71e-f0e1-42b1-8fe2-79afdb138c80', 'Options object (571cf71e-f0e1-42b1-8fe2-79afdb138c80)', 1, '[{\"added\": {}}]', 16, '71e870f1-d0dc-4e57-a1ef-daedd3b3e2d2'),
(7, '2024-09-10 14:01:09.685359', '1', 'impanomanzienock@gmail.com', 1, '[{\"added\": {}}]', 8, '71e870f1-d0dc-4e57-a1ef-daedd3b3e2d2');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(11, 'custom_admin', 'classes'),
(10, 'custom_admin', 'departments'),
(16, 'custom_admin', 'programs'),
(15, 'custom_auth', 'hods'),
(7, 'custom_auth', 'passwordresets'),
(8, 'custom_auth', 'students'),
(9, 'custom_auth', 'teachers'),
(6, 'custom_auth', 'users'),
(13, 'hod', 'modules'),
(14, 'hod', 'subjects'),
(5, 'sessions', 'session'),
(12, 'student', 'documents'),
(17, 'student', 'studentlogs'),
(18, 'student', 'studentmessages');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'custom_admin', '0001_initial', '2024-09-10 09:34:52.242432'),
(2, 'custom_auth', '0001_initial', '2024-09-10 09:34:52.752063'),
(3, 'contenttypes', '0001_initial', '2024-09-10 09:34:52.854807'),
(4, 'admin', '0001_initial', '2024-09-10 09:34:53.022372'),
(5, 'admin', '0002_logentry_remove_auto_add', '2024-09-10 09:34:53.036392'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2024-09-10 09:34:53.058957'),
(7, 'contenttypes', '0002_remove_content_type_name', '2024-09-10 09:34:53.206388'),
(8, 'auth', '0001_initial', '2024-09-10 09:34:53.609428'),
(9, 'auth', '0002_alter_permission_name_max_length', '2024-09-10 09:34:53.681764'),
(10, 'auth', '0003_alter_user_email_max_length', '2024-09-10 09:34:53.699300'),
(11, 'auth', '0004_alter_user_username_opts', '2024-09-10 09:34:53.715996'),
(12, 'auth', '0005_alter_user_last_login_null', '2024-09-10 09:34:53.735362'),
(13, 'auth', '0006_require_contenttypes_0002', '2024-09-10 09:34:53.741495'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2024-09-10 09:34:53.768196'),
(15, 'auth', '0008_alter_user_username_max_length', '2024-09-10 09:34:53.796087'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2024-09-10 09:34:53.818155'),
(17, 'auth', '0010_alter_group_name_max_length', '2024-09-10 09:34:53.924660'),
(18, 'auth', '0011_update_proxy_permissions', '2024-09-10 09:34:53.952923'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2024-09-10 09:34:53.973366'),
(20, 'hod', '0001_initial', '2024-09-10 09:34:54.200639'),
(21, 'sessions', '0001_initial', '2024-09-10 09:34:54.276753'),
(22, 'student', '0001_initial', '2024-09-10 09:34:54.393485'),
(23, 'custom_auth', '0002_alter_users_department', '2024-09-10 09:39:28.308295'),
(24, 'custom_admin', '0002_alter_departments_id', '2024-09-10 09:45:17.976872'),
(25, 'student', '0002_remove_documents_file_name_and_more', '2024-09-10 11:52:35.706571'),
(26, 'hod', '0002_rename_uploaded_at_modules_created_at_and_more', '2024-09-10 12:09:29.912160'),
(27, 'custom_admin', '0003_remove_classes_department_options', '2024-09-10 12:31:22.518904'),
(28, 'custom_auth', '0003_remove_students_s_class_remove_teachers_department_and_more', '2024-09-10 12:31:23.424874'),
(29, 'custom_admin', '0004_delete_classes', '2024-09-10 12:31:23.446110'),
(30, 'custom_auth', '0004_users_is_teacher', '2024-09-10 12:51:29.773223'),
(31, 'student', '0003_alter_documents_status', '2024-09-10 13:07:16.625113'),
(32, 'hod', '0003_rename_deparment_modules_department', '2024-09-10 13:19:29.135069'),
(33, 'custom_auth', '0005_passwordresets_expired_at_and_more', '2024-09-13 07:37:41.874539'),
(34, 'custom_auth', '0006_alter_passwordresets_expired_at', '2024-09-13 07:49:00.772826'),
(35, 'custom_auth', '0007_alter_passwordresets_expired_at', '2024-09-13 09:54:11.257363'),
(36, 'custom_auth', '0008_alter_passwordresets_expired_at', '2024-09-14 06:11:53.841921'),
(37, 'student', '0004_studentlog', '2024-09-14 06:11:53.987258'),
(38, 'custom_auth', '0009_alter_passwordresets_expired_at', '2024-09-14 06:23:58.962584'),
(39, 'student', '0005_rename_studentlog_studentlogs_studentmessages', '2024-09-14 06:23:59.206551'),
(40, 'custom_auth', '0010_alter_passwordresets_expired_at', '2024-09-14 19:48:04.165722'),
(41, 'custom_auth', '0011_alter_passwordresets_expired_at', '2024-09-14 19:52:09.355553'),
(42, 'custom_auth', '0012_alter_passwordresets_expired_at', '2024-09-14 19:54:37.065266'),
(43, 'student', '0006_alter_documents_id_alter_studentlogs_id_and_more', '2024-09-14 19:54:37.362946'),
(44, 'custom_auth', '0013_alter_passwordresets_expired_at', '2024-09-14 19:57:06.870197'),
(45, 'student', '0007_alter_documents_id_alter_studentlogs_id_and_more', '2024-09-14 19:57:07.188673'),
(46, 'custom_auth', '0014_rename_option_students_program_and_more', '2024-09-17 10:13:35.107130'),
(47, 'custom_admin', '0005_rename_options_programs', '2024-09-17 10:13:35.598089'),
(48, 'custom_auth', '0015_alter_passwordresets_expired_at_and_more', '2024-09-17 16:29:07.552649'),
(49, 'custom_auth', '0016_alter_passwordresets_expired_at', '2024-09-17 16:29:07.569769'),
(50, 'hod', '0004_modules_year', '2024-09-17 16:29:07.619910'),
(51, 'custom_auth', '0017_alter_passwordresets_expired_at', '2024-09-17 16:36:14.266450'),
(52, 'hod', '0005_modules_program', '2024-09-17 16:36:14.349955'),
(53, 'custom_auth', '0018_alter_passwordresets_expired_at', '2024-09-18 20:47:17.276815'),
(54, 'hod', '0006_alter_modules_created_at', '2024-09-18 20:47:17.325036');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0qveqfjjdgvdgepnz64y3n82p8k2nldw', '.eJxVjsEOwiAQRP-FszRbWAp4NPGqiT_QLLBYo9WklJPx362mB73OzHuZp-ipzkNfC0_9JYmtcMrlrJ2WyBAk6mwkmQgSgw_WYdfq3InNLxYoXvn-YWMt82P8Vs2almY_0uV2nE58PtQx8LRb53-OgcqwCCwGQs2OklE-QKIOEpsEMRhnUJGxrWF2ynsCnVtYLpFCqwEcoYpRvN7CH0H0:1spjzO:BKnBeq_UfVoAsC4C7Y_l-d8sQDH2Eulj5hR6ffH6QGU', '2024-09-29 07:48:10.754409'),
('5jniwq15153trskzv3onkz9a1vl0mvvn', '.eJxVjcEOwiAQRP-FszRUYBc8mnjVxB9oFlhso9WklJPx362mB73OzHvzFB3Vue9q4akbktgJlTiSVyhbCiyNb0EGRVEmu9UJFQaPIDa_WKB45fuHjbXMj_FbNWtamsNIw-00nflyrGPgab_O_xw9lX4ReG2JScFypS0TIwL56CG1EMHonDEaZOMUYmakQOicMzlk3BpG68XrDR4aQuQ:1srIz1:toQ5XqBKx37SGMmZovSUcae5zIGZS-iSQCgYo3dP2zQ', '2024-10-03 15:22:15.487469'),
('66zffk5f9cxedam1c0r629y24c1zpkw7', '.eJxVjjsOwjAQRO_imkS2dx2vKZFoQeICkX9LEASkOK4QdyegFNDOzHuap-h9nYe-ljz1lyS2gjQxA0GDWYYGgU3jTZQNBhcsYaeAO7H5xYKP13z_sLGW-TF-q3ZNS7sf_eV2nE75fKhjyNNunf85Bl-GRYDR2SjJOODsICWQjrWPCVUkRzGxVsFadMYqQInoiTt0Gkgu7yBo8XoDs8tBkA:1st8Ya:RZxXY5j8dM0Or_4Iw976NeiShAoZ35WBfBxsw9JCSLc', '2024-10-08 16:38:32.251209'),
('8mpukt2oz2slavtpjms9sk2n9bczv8e5', '.eJxVjsEOwiAQRP-FszRbWAp4NPGqiT_QLLBYo9WklJPx362mB73OzHuZp-ipzkNfC0_9JYmtcMrlrJ2WyBAk6mwkmQgSgw_WYdfq3InNLxYoXvn-YWMt82P8Vs2almY_0uV2nE58PtQx8LRb53-OgcqwCCwGQs2OklE-QKIOEpsEMRhnUJGxrWF2ynsCnVtYLpFCqwEcoYpRvN7CH0H0:1spjzS:gelr79GQ3b0oSalgyTt1t5vnktcP6pnuccuem2BKCuI', '2024-09-29 07:48:14.251425'),
('a64jr39p94a01awa6h8w51hylg9jmq32', '.eJxVjsEOwiAQRP-FszRbWAp4NPGqiT_QLLBYo9WklJPx362mB73OzHuZp-ipzkNfC0_9JYmtcMrlrJ2WyBAk6mwkmQgSgw_WYdfq3InNLxYoXvn-YWMt82P8Vs2almY_0uV2nE58PtQx8LRb53-OgcqwCCwGQs2OklE-QKIOEpsEMRhnUJGxrWF2ynsCnVtYLpFCqwEcoYpRvN7CH0H0:1spjzY:80TVzOSmwAKbfXVp7ZXT7ZUUCHk5cJ3TMl_WkGkh8dI', '2024-09-29 07:48:20.875858'),
('jzuktztm02n7848o3z8irbb4y60unxud', '.eJxVjsEOwiAQRP-FszRbWAp4NPGqiT_QLLBYo9WklJPx362mB73OzHuZp-ipzkNfC0_9JYmtcMrlrJ2WyBAk6mwkmQgSgw_WYdfq3InNLxYoXvn-YWMt82P8Vs2almY_0uV2nE58PtQx8LRb53-OgcqwCCwGQs2OklE-QKIOEpsEMRhnUJGxrWF2ynsCnVtYLpFCqwEcoYpRvN7CH0H0:1spjzY:80TVzOSmwAKbfXVp7ZXT7ZUUCHk5cJ3TMl_WkGkh8dI', '2024-09-29 07:48:20.342464'),
('kx8rj7w0fi6pzhtwl3p6k67mahx6sze8', '.eJxVjjsOwjAQRO_imkS2dx2vKZFoQeICkX9LEASkOK4QdyegFNDOzHuap-h9nYe-ljz1lyS2gjQxA0GDWYYGgU3jTZQNBhcsYaeAO7H5xYKP13z_sLGW-TF-q3ZNS7sf_eV2nE75fKhjyNNunf85Bl-GRYDR2SjJOODsICWQjrWPCVUkRzGxVsFadMYqQInoiTt0Gkgu7yBo8XoDs8tBkA:1ssfH8:629VSNZ5MW3gYj4fEjWS_GdUnM78rXJwvt7fJOxOWjg', '2024-10-07 09:22:34.881871'),
('xe94a4jujqm17zkby903daouz81aqz6t', '.eJxVjsEOwiAQRP-FszRbWAp4NPGqiT_QLLBYo9WklJPx362mB73OzHuZp-ipzkNfC0_9JYmtcMrlrJ2WyBAk6mwkmQgSgw_WYdfq3InNLxYoXvn-YWMt82P8Vs2almY_0uV2nE58PtQx8LRb53-OgcqwCCwGQs2OklE-QKIOEpsEMRhnUJGxrWF2ynsCnVtYLpFCqwEcoYpRvN7CH0H0:1spjo7:G5vwCoLjjLt3fur-3hcCxogStRt4apZBUKnf-Rtrw5Y', '2024-09-29 07:36:31.164606'),
('y4csw0rlt1hmnftaa7jcvnp9w9axp456', '.eJxVjsEOwiAQRP-FszRbWAp4NPGqiT_QLLBYo9WklJPx362mB73OzHuZp-ipzkNfC0_9JYmtcMrlrJ2WyBAk6mwkmQgSgw_WYdfq3InNLxYoXvn-YWMt82P8Vs2almY_0uV2nE58PtQx8LRb53-OgcqwCCwGQs2OklE-QKIOEpsEMRhnUJGxrWF2ynsCnVtYLpFCqwEcoYpRvN7CH0H0:1spjzY:80TVzOSmwAKbfXVp7ZXT7ZUUCHk5cJ3TMl_WkGkh8dI', '2024-09-29 07:48:20.371479');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `department_id` varchar(64) DEFAULT NULL,
  `learning_hours` int(11) DEFAULT NULL,
  `year` varchar(1) DEFAULT NULL,
  `program_id` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `title`, `created_at`, `teacher_id`, `department_id`, `learning_hours`, `year`, `program_id`) VALUES
('0261cdff-78dd-4c70-a387-01ceb6f3d93f', 'Basics of networking', '2024-09-18 20:52:00.306557', 2, '07dab5ec-9e25-417e-94d7-86f4c7ebb493', 40, '2', '571cf71e-f0e1-42b1-8fe2-79afdb138c88'),
('890cfc7a-1144-441f-b40a-aaae2f80b4bf', 'Basic of Machine Learning', '2024-09-18 20:53:32.909532', 3, '07dab5ec-9e25-417e-94d7-86f4c7ebb493', 100, '1', '571cf71e-f0e1-42b1-8fe2-79afdb138c88'),
('8a63de63-4d31-4d3b-a177-d4b6ee5f1d2c', 'Basics of networking', '2024-09-18 20:48:28.939382', 2, '07dab5ec-9e25-417e-94d7-86f4c7ebb493', 40, '2', '571cf71e-f0e1-42b1-8fe2-79afdb138c88'),
('8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 'ARTIFICIAL INTELLIGENCY', '2024-09-10 12:59:27.000000', 2, '233143e0-29b6-4a72-b81b-b7d683bf57bf', 30, '3', '571cf71e-f0e1-42b1-8fe2-79afdb138c88'),
('8d71668b-5fb5-4bf2-9df7-fbfd1cc92095', 'Advanced Web development', '2024-09-24 23:17:05.000000', 2, '233143e0-29b6-4a72-b81b-b7d683bf57bf', 50, '2', '571cf71e-f0e1-42b1-8fe2-79afdb138c88');

-- --------------------------------------------------------

--
-- Table structure for table `student_documents`
--

CREATE TABLE `student_documents` (
  `id` bigint(20) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `status` varchar(8) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `module_id` varchar(64) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_documents`
--

INSERT INTO `student_documents` (`id`, `uploaded_at`, `status`, `file`, `module_id`, `student_id`) VALUES
(1, '2024-09-10 14:07:50.815573', 'pending', 'tf_model_train_args_pipeline_config.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(2, '2024-09-13 20:06:18.525872', 'pending', 'Markdown_Cheat_Sheet_NwjxG23.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(3, '2024-09-13 20:06:18.526886', 'pending', 'Markdown_Cheat_Sheet.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(4, '2024-09-13 20:18:08.534641', 'pending', 'GROUP_COVER.docx', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(5, '2024-09-13 20:19:39.351142', 'pending', 'GROUP_COVER_LO1yRFq.docx', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(6, '2024-09-13 20:19:56.465283', 'pending', 'Markdown_Cheat_Sheet_85PhGtC.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(7, '2024-09-13 20:24:04.756975', 'pending', 'django.html', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(8, '2024-09-13 20:24:13.485396', 'pending', 'django_nJRsvps.html', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(9, '2024-09-13 20:31:47.809791', 'pending', 'ENGLISH_ASSSIGNMENT_CORRECTION.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(10, '2024-09-13 20:32:51.183291', 'pending', 'Markdown_Cheat_Sheet_QWTPPTw.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(11, '2024-09-13 20:33:05.968392', 'pending', 'group_1_food_and_bavrage_revenue.docx', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(12, '2024-09-13 20:33:07.198109', 'pending', 'GROUP_COVER_f9seLX3.docx', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(13, '2024-09-13 20:33:08.184117', 'pending', 'guess_number_flowchart.odg', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(14, '2024-09-13 20:33:10.703525', 'pending', 'Markdown_Cheat_Sheet_ey4bvSS.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(15, '2024-09-13 20:33:11.481320', 'pending', 'New_Project.pdsprj', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(16, '2024-09-13 20:33:12.119093', 'pending', 'New_Project.pdsprj.IMPANO-PC2.IMPANO.workspace', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(17, '2024-09-13 20:33:13.403697', 'pending', 'Phoenix.apk', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(18, '2024-09-13 20:33:14.371040', 'pending', 'phone-password', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(19, '2024-09-13 20:33:15.830024', 'pending', 'QR_CODE_SHOPPING.pub', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(20, '2024-09-13 20:33:16.705825', 'pending', 'login_system_flowchart.odg', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(21, '2024-09-13 20:33:17.515478', 'pending', 'guess_number.odg', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(22, '2024-09-13 20:33:18.293786', 'pending', 'RDR61D_ZX399_OK2173_PCB01_GPRS_MT6261_S00.ZX399_MTK_XS_OKING_OK2173_EN_V01_20230912.BIN.bin', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(23, '2024-09-14 09:11:39.660241', 'pending', 'CamScanner_12-15-2023_18.21-2.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(24, '2024-09-14 09:12:07.735322', 'pending', 'Markdown_Cheat_Sheet_u7tKf9O.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(25, '2024-09-14 11:32:07.766923', 'pending', 'IAP_Report.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(26, '2024-09-14 11:32:09.935855', 'pending', 'IAP_Report_kfRzn90.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(27, '2024-09-14 11:35:53.131220', 'pending', 're_updated_claude.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92094', 1),
(30, '2024-09-17 19:30:25.897105', 'accepted', 'CamScanner_09-14-2024_16_GthI8nU.41.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92095', 1),
(31, '2024-09-17 19:30:30.806644', 'rejected', 'CamScanner_12-15-2023_18_kpH6iPx.21-2.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92095', 1),
(32, '2024-09-17 19:36:32.039147', 'accepted', 'CamScanner_09-14-2024_16_JakKGpW.41.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92095', 1),
(33, '2024-09-17 19:36:44.801506', 'rejected', 'CamScanner_09-14-2024_16_UBARkVf.41.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92095', 1),
(34, '2024-09-19 15:26:30.014654', 'pending', 'Hands-On_Machine_Learning_with_Scikit-Learn_and_TensorFlow__Concepts_Tools_and_Technique_HIB1iAf.pdf', '890cfc7a-1144-441f-b40a-aaae2f80b4bf', 5),
(35, '2024-09-19 16:28:16.857123', 'pending', 'google_scholar_api_0BQT4aA_1.pdf', '0261cdff-78dd-4c70-a387-01ceb6f3d93f', 5),
(36, '2024-09-19 16:30:56.325865', 'pending', 'CamScanner_09-14-2024_16_vn7iUY7.41.pdf', '890cfc7a-1144-441f-b40a-aaae2f80b4bf', 5),
(37, '2024-09-19 16:36:43.018378', 'pending', 'CamScanner_12-15-2023_18_VbHzqkI.21-2.pdf', '0261cdff-78dd-4c70-a387-01ceb6f3d93f', 5),
(38, '2024-09-19 16:48:07.572232', 'pending', 'CamScanner_09-14-2024_16_2SJPhqc.41.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92095', 1),
(39, '2024-09-19 16:49:05.554051', 'pending', 'CamScanner_12-15-2023_18_mtAC632.21-2.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92095', 1),
(40, '2024-09-19 16:50:46.155477', 'pending', 'CamScanner_09-14-2024_16_D4M98dU.41.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92095', 1),
(41, '2024-09-19 16:52:21.044960', 'pending', 'CamScanner_12-15-2023_18_Z5JNDnN.21-2.pdf', '8d71668b-5fb5-4bf2-9df7-fbfd1cc92095', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_studentlogs`
--

CREATE TABLE `student_studentlogs` (
  `id` bigint(20) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `student_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_studentlogs`
--

INSERT INTO `student_studentlogs` (`id`, `activity`, `datetime`, `student_id`) VALUES
(1, 'Profile updated', '2024-09-14 06:43:20.703891', 1),
(2, 'Profile updated', '2024-09-14 06:57:31.820451', 1),
(3, 'Profile updated', '2024-09-14 08:50:15.234354', 1),
(4, 'Upload new ARTIFICIAL INTELLIGENCY document uploaded', '2024-09-14 09:11:39.671809', 1),
(5, 'Upload new ARTIFICIAL INTELLIGENCY document uploaded', '2024-09-14 09:12:07.738909', 1),
(6, 'Upload new ARTIFICIAL INTELLIGENCY document uploaded', '2024-09-14 11:32:07.774971', 1),
(7, 'Upload new ARTIFICIAL INTELLIGENCY document uploaded', '2024-09-14 11:32:09.939389', 1),
(8, 'Upload new ARTIFICIAL INTELLIGENCY document uploaded', '2024-09-14 11:35:53.136571', 1),
(9, 'Upload new ARTIFICIAL INTELLIGENCY document uploaded', '2024-09-14 18:33:03.156451', 1),
(10, 'Upload new ARTIFICIAL INTELLIGENCY document uploaded', '2024-09-14 18:40:13.915431', 1),
(11, 'Upload new Advanced Web development document uploaded', '2024-09-14 19:00:38.055087', 1),
(12, 'Upload new Advanced Web development document uploaded', '2024-09-14 19:06:52.390610', 1),
(13, 'Upload new Basic of Machine Learning document uploaded', '2024-09-19 16:32:33.434473', 5),
(14, 'Upload new Advanced Web development document uploaded', '2024-09-19 16:48:36.394529', 1),
(15, 'Upload new Advanced Web development document uploaded', '2024-09-19 16:50:05.946745', 1),
(16, 'Upload new Advanced Web development document uploaded', '2024-09-19 16:51:27.698984', 1),
(17, 'Upload new Advanced Web development document uploaded', '2024-09-19 16:54:45.811571', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_studentmessages`
--

CREATE TABLE `student_studentmessages` (
  `id` bigint(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `status` varchar(64) NOT NULL,
  `sender_id` varchar(64) NOT NULL,
  `student_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_studentmessages`
--

INSERT INTO `student_studentmessages` (`id`, `message`, `datetime`, `status`, `sender_id`, `student_id`) VALUES
(1, 'Your document verification failed', '2024-09-14 18:33:03.139364', 'read', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', 1),
(2, 'Your document verification failed', '2024-09-14 18:40:13.892319', 'read', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', 1),
(3, 'Your document verification failed', '2024-09-14 19:00:38.024027', 'read', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', 1),
(4, 'Your document verification failed', '2024-09-14 19:06:52.367417', 'read', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', 1),
(5, 'your document <a href=\'/media/CamScanner_09-14-2024_16_JakKGpW.41.pdf\'>document</a> has accepted by IMPANO.', '2024-09-17 19:36:32.045110', 'read', 'fed28e91-7310-4dca-91b5-4654f9bba835', 1),
(6, 'your document /media/CamScanner_09-14-2024_16_UBARkVf.41.pdf has rejected by IMPANO.', '2024-09-17 19:36:44.807037', 'read', 'fed28e91-7310-4dca-91b5-4654f9bba835', 1),
(7, 'your document /media/CamScanner_09-14-2024_16_yvB1iDc.41.pdf has  deleted by IMPANO.', '2024-09-17 19:48:59.210854', 'read', 'fed28e91-7310-4dca-91b5-4654f9bba835', 1),
(8, 'your document /media/CamScanner_12-15-2023_18_S53BEQu.21-2.pdf has  deleted by IMPANO.', '2024-09-17 19:49:05.820821', 'read', 'fed28e91-7310-4dca-91b5-4654f9bba835', 1),
(9, 'Your document verification failed', '2024-09-19 16:32:33.416407', 'unread', '0deca907-1abe-4916-b0ac-d523d707b976', 5),
(10, 'Your document verification failed', '2024-09-19 16:48:36.380441', 'read', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', 1),
(11, 'Your document verification failed', '2024-09-19 16:50:05.941772', 'read', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', 1),
(12, 'Your document verification failed', '2024-09-19 16:51:27.691977', 'read', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', 1),
(13, 'Your document verification failed', '2024-09-19 16:54:45.793551', 'read', '828ff383-4e0b-43f5-a5c0-4b9b784613f6', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `custom_admin_departments`
--
ALTER TABLE `custom_admin_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `custom_admin_programs`
--
ALTER TABLE `custom_admin_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_admin_options_department_id_f3f64275_fk_custom_ad` (`department_id`);

--
-- Indexes for table `custom_auth_hods`
--
ALTER TABLE `custom_auth_hods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `custom_auth_passwordresets`
--
ALTER TABLE `custom_auth_passwordresets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_auth_password_user_id_cd300a35_fk_custom_au` (`user_id`);

--
-- Indexes for table `custom_auth_students`
--
ALTER TABLE `custom_auth_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `custom_auth_students_program_id_af244642_fk_custom_ad` (`program_id`);

--
-- Indexes for table `custom_auth_teachers`
--
ALTER TABLE `custom_auth_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `custom_auth_users`
--
ALTER TABLE `custom_auth_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `registration_number` (`registration_number`),
  ADD KEY `custom_auth_users_department_id_9cc2e874_fk` (`department_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_custom_auth_users_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_teacher_id_5be685f0_fk_custom_auth_teachers_id` (`teacher_id`),
  ADD KEY `modules_department_id_3971a4d4_fk_custom_admin_departments_id` (`department_id`),
  ADD KEY `modules_program_id_5f71636f_fk_custom_admin_programs_id` (`program_id`);

--
-- Indexes for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_documents_module_id_8b966792_fk_modules_id` (`module_id`),
  ADD KEY `student_documents_student_id_4a6e63f8_fk_custom_auth_students_id` (`student_id`);

--
-- Indexes for table `student_studentlogs`
--
ALTER TABLE `student_studentlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_studentlog_student_id_00fe48b6_fk_custom_au` (`student_id`);

--
-- Indexes for table `student_studentmessages`
--
ALTER TABLE `student_studentmessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_studentmessa_sender_id_33194c41_fk_custom_au` (`sender_id`),
  ADD KEY `student_studentmessa_student_id_2e8327e1_fk_custom_au` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `custom_auth_hods`
--
ALTER TABLE `custom_auth_hods`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_auth_students`
--
ALTER TABLE `custom_auth_students`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `custom_auth_teachers`
--
ALTER TABLE `custom_auth_teachers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `student_documents`
--
ALTER TABLE `student_documents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `student_studentlogs`
--
ALTER TABLE `student_studentlogs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `student_studentmessages`
--
ALTER TABLE `student_studentmessages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `custom_admin_programs`
--
ALTER TABLE `custom_admin_programs`
  ADD CONSTRAINT `custom_admin_options_department_id_f3f64275_fk_custom_ad` FOREIGN KEY (`department_id`) REFERENCES `custom_admin_departments` (`id`);

--
-- Constraints for table `custom_auth_hods`
--
ALTER TABLE `custom_auth_hods`
  ADD CONSTRAINT `custom_auth_hods_user_id_4e9f74d7_fk_custom_auth_users_id` FOREIGN KEY (`user_id`) REFERENCES `custom_auth_users` (`id`);

--
-- Constraints for table `custom_auth_passwordresets`
--
ALTER TABLE `custom_auth_passwordresets`
  ADD CONSTRAINT `custom_auth_password_user_id_cd300a35_fk_custom_au` FOREIGN KEY (`user_id`) REFERENCES `custom_auth_users` (`id`);

--
-- Constraints for table `custom_auth_students`
--
ALTER TABLE `custom_auth_students`
  ADD CONSTRAINT `custom_auth_students_program_id_af244642_fk_custom_ad` FOREIGN KEY (`program_id`) REFERENCES `custom_admin_programs` (`id`),
  ADD CONSTRAINT `custom_auth_students_user_id_04762731_fk_custom_auth_users_id` FOREIGN KEY (`user_id`) REFERENCES `custom_auth_users` (`id`);

--
-- Constraints for table `custom_auth_teachers`
--
ALTER TABLE `custom_auth_teachers`
  ADD CONSTRAINT `custom_auth_teachers_user_id_0fe9155d_fk_custom_auth_users_id` FOREIGN KEY (`user_id`) REFERENCES `custom_auth_users` (`id`);

--
-- Constraints for table `custom_auth_users`
--
ALTER TABLE `custom_auth_users`
  ADD CONSTRAINT `custom_auth_users_department_id_9cc2e874_fk` FOREIGN KEY (`department_id`) REFERENCES `custom_admin_departments` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_custom_auth_users_id` FOREIGN KEY (`user_id`) REFERENCES `custom_auth_users` (`id`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_department_id_3971a4d4_fk_custom_admin_departments_id` FOREIGN KEY (`department_id`) REFERENCES `custom_admin_departments` (`id`),
  ADD CONSTRAINT `modules_program_id_5f71636f_fk_custom_admin_programs_id` FOREIGN KEY (`program_id`) REFERENCES `custom_admin_programs` (`id`),
  ADD CONSTRAINT `modules_teacher_id_5be685f0_fk_custom_auth_teachers_id` FOREIGN KEY (`teacher_id`) REFERENCES `custom_auth_teachers` (`id`);

--
-- Constraints for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD CONSTRAINT `student_documents_module_id_8b966792_fk_modules_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `student_documents_student_id_4a6e63f8_fk_custom_auth_students_id` FOREIGN KEY (`student_id`) REFERENCES `custom_auth_students` (`id`);

--
-- Constraints for table `student_studentlogs`
--
ALTER TABLE `student_studentlogs`
  ADD CONSTRAINT `student_studentlog_student_id_00fe48b6_fk_custom_au` FOREIGN KEY (`student_id`) REFERENCES `custom_auth_students` (`id`);

--
-- Constraints for table `student_studentmessages`
--
ALTER TABLE `student_studentmessages`
  ADD CONSTRAINT `student_studentmessa_sender_id_33194c41_fk_custom_au` FOREIGN KEY (`sender_id`) REFERENCES `custom_auth_users` (`id`),
  ADD CONSTRAINT `student_studentmessa_student_id_2e8327e1_fk_custom_au` FOREIGN KEY (`student_id`) REFERENCES `custom_auth_students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

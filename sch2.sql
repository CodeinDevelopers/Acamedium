-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2025 at 03:28 AM
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
-- Database: `sch2`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `balance` double(18,2) NOT NULL DEFAULT 0.00,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `number`, `description`, `balance`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'uba', '24357689', 'vdd', 349143407.00, 1, '2025-03-24 20:05:30', '2025-03-24 21:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `addon`
--

CREATE TABLE `addon` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `version` varchar(100) NOT NULL,
  `purchase_code` varchar(255) DEFAULT NULL,
  `items_code` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advance_salary`
--

CREATE TABLE `advance_salary` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `deduct_month` varchar(20) DEFAULT NULL,
  `year` varchar(20) NOT NULL,
  `reason` text CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `paid_date` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=pending,2=paid,3=rejected',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `issued_by` varchar(200) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_events`
--

CREATE TABLE `alumni_events` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `audience` varchar(100) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `selected_list` longtext NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `show_web` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_students`
--

CREATE TABLE `alumni_students` (
  `id` int(11) NOT NULL,
  `enroll_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `address` varchar(500) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `type_id` int(11) NOT NULL,
  `uploader_id` varchar(20) NOT NULL,
  `class_id` varchar(20) DEFAULT 'unfiltered',
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `subject_id` varchar(200) DEFAULT 'unfiltered',
  `session_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachments_type`
--

CREATE TABLE `attachments_type` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `attachments_type`
--

INSERT INTO `attachments_type` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Djdjfjff', 1, '2025-02-12 22:44:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `gift_item` varchar(255) NOT NULL,
  `award_amount` decimal(18,2) NOT NULL,
  `award_reason` text NOT NULL,
  `given_date` date NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `isbn_no` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `edition` varchar(255) NOT NULL,
  `purchase_date` date NOT NULL,
  `description` text NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `total_stock` varchar(20) NOT NULL,
  `issued_copies` varchar(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_category`
--

CREATE TABLE `book_category` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `date_of_issue` date DEFAULT NULL,
  `date_of_expiry` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fine_amount` decimal(18,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1 = accepted, 2 = rejected, 3 = returned',
  `issued_by` varchar(255) DEFAULT NULL,
  `return_by` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `school_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `currency_formats` tinyint(4) NOT NULL DEFAULT 1,
  `symbol_position` tinyint(4) NOT NULL DEFAULT 1,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `stu_generate` tinyint(4) NOT NULL DEFAULT 0,
  `stu_username_prefix` varchar(255) NOT NULL,
  `stu_default_password` varchar(255) NOT NULL,
  `grd_generate` tinyint(4) NOT NULL DEFAULT 0,
  `grd_username_prefix` varchar(255) NOT NULL,
  `grd_default_password` varchar(255) NOT NULL,
  `teacher_restricted` tinyint(1) DEFAULT 1,
  `due_days` float NOT NULL DEFAULT 30,
  `due_with_fine` tinyint(4) NOT NULL DEFAULT 1,
  `translation` varchar(255) NOT NULL DEFAULT 'english',
  `timezone` varchar(255) NOT NULL,
  `weekends` varchar(255) NOT NULL DEFAULT '1',
  `reg_prefix_enable` tinyint(1) NOT NULL DEFAULT 0,
  `student_login` tinyint(4) NOT NULL DEFAULT 1,
  `parent_login` tinyint(4) NOT NULL DEFAULT 1,
  `teacher_mobile_visible` tinyint(4) NOT NULL DEFAULT 1,
  `teacher_email_visible` tinyint(4) NOT NULL DEFAULT 1,
  `reg_start_from` tinyint(4) NOT NULL DEFAULT 1,
  `institution_code` varchar(100) DEFAULT NULL,
  `reg_prefix_digit` int(11) NOT NULL,
  `offline_payments` tinyint(1) NOT NULL DEFAULT 1,
  `attendance_type` tinyint(1) NOT NULL DEFAULT 0,
  `show_own_question` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `unique_roll` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `school_name`, `email`, `mobileno`, `currency`, `symbol`, `currency_formats`, `symbol_position`, `city`, `state`, `address`, `stu_generate`, `stu_username_prefix`, `stu_default_password`, `grd_generate`, `grd_username_prefix`, `grd_default_password`, `teacher_restricted`, `due_days`, `due_with_fine`, `translation`, `timezone`, `weekends`, `reg_prefix_enable`, `student_login`, `parent_login`, `teacher_mobile_visible`, `teacher_email_visible`, `reg_start_from`, `institution_code`, `reg_prefix_digit`, `offline_payments`, `attendance_type`, `show_own_question`, `status`, `unique_roll`, `created_at`, `updated_at`) VALUES
(1, 'Readeemers High school', 'Redeemers High School', 'info@rhs.com.ng', '07045653356', 'NGN', '₦', 1, 1, '', '', '', 0, '', '', 0, '', '', 1, 30, 1, 'english', 'Africa/Lagos', '0', 0, 1, 1, 1, 0, 127, 'RHS', 5, 1, 0, 1, 1, 1, '2025-02-02 23:24:30', '2025-04-12 12:54:24');

-- --------------------------------------------------------

--
-- Table structure for table `bulk_msg_category`
--

CREATE TABLE `bulk_msg_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT 'sms=1, email=2',
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulk_sms_email`
--

CREATE TABLE `bulk_sms_email` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(255) DEFAULT NULL,
  `sms_gateway` varchar(55) DEFAULT '0',
  `message` text DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `message_type` tinyint(4) DEFAULT 0 COMMENT 'sms=1, email=2',
  `recipient_type` tinyint(4) NOT NULL COMMENT 'group=1, individual=2, class=3',
  `recipients_details` longtext DEFAULT NULL,
  `additional` longtext DEFAULT NULL,
  `schedule_time` datetime DEFAULT NULL,
  `posting_status` tinyint(4) NOT NULL COMMENT 'schedule=1,competed=2',
  `total_thread` int(11) NOT NULL,
  `successfully_sent` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_log`
--

CREATE TABLE `call_log` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `purpose_id` int(11) DEFAULT NULL,
  `call_type` tinyint(1) DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `follow_up` date DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `call_purpose`
--

CREATE TABLE `call_purpose` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `card_templete`
--

CREATE TABLE `card_templete` (
  `id` int(11) NOT NULL,
  `card_type` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `background` varchar(355) DEFAULT NULL,
  `logo` varchar(355) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `layout_width` varchar(11) NOT NULL DEFAULT '54',
  `layout_height` varchar(11) NOT NULL DEFAULT '86',
  `photo_style` tinyint(1) NOT NULL,
  `photo_size` varchar(25) NOT NULL,
  `top_space` varchar(25) NOT NULL,
  `bottom_space` varchar(25) NOT NULL,
  `right_space` varchar(25) NOT NULL,
  `left_space` varchar(25) NOT NULL,
  `qr_code` varchar(25) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates_templete`
--

CREATE TABLE `certificates_templete` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `background` varchar(355) DEFAULT NULL,
  `logo` varchar(355) DEFAULT NULL,
  `signature` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `page_layout` tinyint(1) NOT NULL,
  `photo_style` tinyint(1) NOT NULL,
  `photo_size` varchar(25) NOT NULL,
  `top_space` varchar(25) NOT NULL,
  `bottom_space` varchar(25) NOT NULL,
  `right_space` varchar(25) NOT NULL,
  `left_space` varchar(25) NOT NULL,
  `qr_code` varchar(25) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_numeric` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`, `name_numeric`, `created_at`, `updated_at`, `branch_id`) VALUES
(1, 'Play group', '', '2025-01-18 16:40:24', NULL, 1),
(2, 'Nursery 1', '', '2025-01-18 16:43:04', NULL, 1),
(3, 'Nursery 2', '', '2025-01-18 16:43:16', NULL, 1),
(4, 'Nursery 3', '', '2025-01-18 16:43:44', NULL, 1),
(5, 'Primary 1', '', '2025-01-18 16:44:12', NULL, 1),
(6, 'Primary 2', '', '2025-01-18 16:44:26', NULL, 1),
(7, 'Primary 3', '', '2025-01-18 16:44:53', NULL, 1),
(8, 'Primary 4', '', '2025-01-18 16:45:04', NULL, 1),
(9, 'Primary 5', '', '2025-01-18 16:45:19', NULL, 1),
(10, 'Primary 6', '', '2025-01-18 16:45:47', NULL, 1),
(11, 'Jss 1', '', '2025-01-18 16:46:01', NULL, 1),
(12, 'Jss 2', '', '2025-01-18 16:46:15', NULL, 1),
(13, 'Jss3', '', '2025-01-18 16:46:29', NULL, 1),
(14, 'Sss 1', '', '2025-01-18 16:46:50', NULL, 1),
(15, 'Sss 2', '', '2025-01-18 16:47:12', NULL, 1),
(16, 'Sss 3', '', '2025-01-18 16:47:25', NULL, 1),
(17, 'test3', '', '2025-02-15 18:14:05', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `assigned_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `date_of_solution` date DEFAULT NULL,
  `file` varchar(500) NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_domain`
--

CREATE TABLE `custom_domain` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `domain_type` varchar(255) NOT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_domain_instruction`
--

CREATE TABLE `custom_domain_instruction` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `instruction` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `dns_status` tinyint(1) NOT NULL DEFAULT 1,
  `dns_title` varchar(255) DEFAULT NULL,
  `dns_type_1` varchar(255) DEFAULT NULL,
  `dns_host_1` varchar(255) DEFAULT NULL,
  `dns_value_1` varchar(255) NOT NULL,
  `dns_type_2` varchar(255) NOT NULL,
  `dns_host_2` varchar(255) NOT NULL,
  `dns_value_2` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `custom_domain_instruction`
--

INSERT INTO `custom_domain_instruction` (`id`, `title`, `instruction`, `status`, `dns_status`, `dns_title`, `dns_type_1`, `dns_host_1`, `dns_value_1`, `dns_type_2`, `dns_host_2`, `dns_value_2`, `created_at`) VALUES
(1, 'Custom Domain Settings Instruction', NULL, 0, 1, 'Configure your DNS records', 'CNAME Records', 'www', '', 'A Records', '@', '', '2023-05-31 10:37:43'),
(11, 'Custom Domain Settings Instruction', NULL, 0, 1, 'Configure your DNS records', 'CNAME Records', 'www', '', 'A Records', '@', '', '2023-05-31 10:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE `custom_field` (
  `id` int(11) NOT NULL,
  `form_to` varchar(50) DEFAULT NULL,
  `field_label` varchar(100) NOT NULL,
  `default_value` text DEFAULT NULL,
  `field_type` enum('text','textarea','dropdown','date','checkbox','number','url','email') NOT NULL,
  `required` varchar(5) NOT NULL DEFAULT 'false',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `show_on_table` varchar(5) DEFAULT NULL,
  `field_order` int(11) NOT NULL,
  `bs_column` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `custom_field`
--

INSERT INTO `custom_field` (`id`, `form_to`, `field_label`, `default_value`, `field_type`, `required`, `status`, `show_on_table`, `field_order`, `bs_column`, `branch_id`, `created_at`) VALUES
(1, 'student', 'House', 'Green house, Red House, Purple House', 'dropdown', '0', 1, '1', 8, 4, 1, '2025-02-12 13:39:06'),
(2, 'student', 'Club', 'Jet CLub', 'dropdown', '0', 1, '1', 9, 4, 1, '2025-02-12 13:42:07');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_online_values`
--

CREATE TABLE `custom_fields_online_values` (
  `id` int(11) NOT NULL,
  `relid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `custom_fields_online_values`
--

INSERT INTO `custom_fields_online_values` (`id`, `relid`, `field_id`, `value`) VALUES
(16, 5, 1, ''),
(17, 5, 2, ''),
(18, 6, 1, ''),
(19, 6, 2, ''),
(20, 7, 1, ''),
(21, 7, 2, ''),
(22, 8, 1, ''),
(23, 8, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_values`
--

CREATE TABLE `custom_fields_values` (
  `id` int(11) NOT NULL,
  `relid` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `custom_fields_values`
--

INSERT INTO `custom_fields_values` (`id`, `relid`, `field_id`, `value`) VALUES
(1, 2, 1, 'green_house'),
(2, 2, 2, 'jet_club'),
(3, 3, 1, 'red_house'),
(4, 3, 2, 'jet_club');

-- --------------------------------------------------------

--
-- Table structure for table `disable_reason`
--

CREATE TABLE `disable_reason` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `disable_reason`
--

INSERT INTO `disable_reason` (`id`, `name`, `branch_id`) VALUES
(1, 'Transferred Student', 1);

-- --------------------------------------------------------

--
-- Table structure for table `disable_reason_details`
--

CREATE TABLE `disable_reason_details` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `disable_reason_details`
--

INSERT INTO `disable_reason_details` (`id`, `student_id`, `reason_id`, `note`, `date`) VALUES
(1, 2, 1, 'fef4erferfef', '2025-02-11');

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) NOT NULL,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(255) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_encryption` varchar(10) DEFAULT NULL,
  `smtp_auth` varchar(10) NOT NULL DEFAULT 'true',
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_encryption`, `smtp_auth`, `branch_id`) VALUES
(1, 'email@demo.com', 'smtp', 'smtp.demo.com', 'email@demo.com', '123456', '465', 'ssl', 'true', 9999);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `tags`) VALUES
(1, 'account_registered', '{institute_name}, {name}, {login_username}, {password}, {user_role}, {login_url}'),
(2, 'forgot_password', '{institute_name}, {username}, {email}, {reset_url}'),
(3, 'change_password', '{institute_name}, {name}, {email}, {password}'),
(4, 'new_message_received', '{institute_name}, {recipient}, {message}, {message_url}'),
(5, 'payslip_generated', '{institute_name}, {username}, {month_year}, {payslip_url}'),
(6, 'award', '{institute_name}, {winner_name}, {award_name}, {gift_item}, {award_reason}, {given_date}'),
(7, 'leave_approve', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
(8, 'leave_reject', '{institute_name}, {applicant_name}, {start_date}, {end_date}, {comments}'),
(9, 'advance_salary_approve', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}'),
(10, 'advance_salary_reject', '{institute_name}, {applicant_name}, {deduct_motnh}, {amount}, {comments}'),
(11, 'apply_online_admission', '{institute_name}, {reference_no}, {applicant_name}, {applicant_mobile}, {class}, {section}, {apply_date}, {payment_url}, {admission_copy_url}, {paid_amount}'),
(12, 'student_admission', '{institute_name}, {academic_year}, {admission_date}, {admission_no}, {roll}, {category}, {student_name}, {student_mobile}, {class}, {section}, {login_username}, {password}, {login_url}'),
(13, 'email_pdf_exam_marksheet', '{institute_name}, {academic_year}, {admission_date}, {admission_no}, {roll}, {student_name}, {class}, {section}, {exam_name}'),
(14, 'email_pdf_fee_invoice', '{institute_name}, {academic_year}, {today_date}, {admission_date}, {admission_no}, {roll}, {student_name}, {class}, {section}');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_details`
--

CREATE TABLE `email_templates_details` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `template_body` text NOT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT 0,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `previous_school` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `reference_id` int(11) NOT NULL,
  `response_id` int(11) NOT NULL,
  `response` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(255) NOT NULL,
  `assigned_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `no_of_child` float NOT NULL,
  `class_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_follow_up`
--

CREATE TABLE `enquiry_follow_up` (
  `id` int(11) NOT NULL,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `follow_up_by` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_reference`
--

CREATE TABLE `enquiry_reference` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_response`
--

CREATE TABLE `enquiry_response` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `roll` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `default_login` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `is_alumni` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`id`, `student_id`, `class_id`, `section_id`, `roll`, `session_id`, `default_login`, `branch_id`, `is_alumni`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 1, 0, 5, 0, 1, 0, '2025-02-07 18:21:36', NULL),
(2, 2, 14, 5, 0, 5, 0, 1, 0, '2025-02-08 16:35:01', NULL),
(3, 3, 3, 2, 0, 5, 0, 1, 0, '2025-02-13 12:23:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` text NOT NULL,
  `audition` longtext NOT NULL,
  `selected_list` longtext NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `show_web` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `remark`, `status`, `type`, `audition`, `selected_list`, `start_date`, `end_date`, `image`, `created_by`, `session_id`, `created_at`, `updated_at`, `branch_id`, `show_web`) VALUES
(1, 'DESFFEFEEFE', '<p>\\SEWFWEWFEWESFWEWFWF</p>', 1, '1', '1', 'null', '2025-02-11', '2025-02-13', 'OMOROGBE_IRENE_IFEOMA_CF.jpg', '1', 5, '2025-02-12 08:24:33', NULL, 1, 0),
(2, 'Interhouse Sport', '<p>our Inter house sport is upcoiming</p>', 1, '1', '1', 'null', '2025-03-31', '2025-04-02', 'Screenshot_2025-03-24_211216.png', '4', 5, '2025-03-31 18:00:31', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `event_types`
--

INSERT INTO `event_types` (`id`, `name`, `icon`, `branch_id`) VALUES
(1, 'NEWEWEWE', 'flag-checkered', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `term_id` int(11) DEFAULT NULL,
  `type_id` tinyint(4) NOT NULL COMMENT '1=mark,2=gpa,3=both',
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `remark` text NOT NULL,
  `mark_distribution` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `publish_result` tinyint(1) NOT NULL DEFAULT 1,
  `rank_generated` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `name`, `term_id`, `type_id`, `session_id`, `branch_id`, `remark`, `mark_distribution`, `status`, `publish_result`, `rank_generated`, `created_at`, `updated_at`) VALUES
(1, 'First Term Exam', 1, 3, 5, 1, '', '[\"4\",\"5\",\"6\",\"7\"]', 1, 0, 0, '2025-02-15 15:17:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_attendance`
--

CREATE TABLE `exam_attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `status` varchar(4) DEFAULT NULL COMMENT 'P=Present, A=Absent, L=Late',
  `remark` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_hall`
--

CREATE TABLE `exam_hall` (
  `id` int(11) NOT NULL,
  `hall_no` longtext NOT NULL,
  `seats` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `exam_hall`
--

INSERT INTO `exam_hall` (`id`, `hall_no`, `seats`, `branch_id`) VALUES
(2, '001', 10000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_mark_distribution`
--

CREATE TABLE `exam_mark_distribution` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `exam_mark_distribution`
--

INSERT INTO `exam_mark_distribution` (`id`, `name`, `branch_id`) VALUES
(4, 'Mid Term', 1),
(5, 'Paper 1', 1),
(6, 'Paper 2', 1),
(7, 'Paper 3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam_rank`
--

CREATE TABLE `exam_rank` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `enroll_id` int(11) NOT NULL,
  `principal_comments` text DEFAULT NULL,
  `teacher_comments` text DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `exam_rank`
--

INSERT INTO `exam_rank` (`id`, `exam_id`, `enroll_id`, `principal_comments`, `teacher_comments`, `rank`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'tesgfgr', 'ttgtgt', 1, '2025-02-15 15:24:06', NULL),
(2, 1, 2, 'Nice one bro - Promted to ss2', 'fefeef', 1, '2025-02-16 08:44:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_term`
--

CREATE TABLE `exam_term` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `exam_term`
--

INSERT INTO `exam_term` (`id`, `name`, `branch_id`, `session_id`) VALUES
(1, 'First Term', 1, 5),
(2, 'Second Term', 1, 5),
(3, 'Third Term', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `fees_reminder`
--

CREATE TABLE `fees_reminder` (
  `id` int(11) NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `days` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `dlt_template_id` varchar(255) DEFAULT NULL,
  `student` tinyint(4) NOT NULL,
  `guardian` tinyint(4) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_type`
--

CREATE TABLE `fees_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fee_code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `system` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fees_type`
--

INSERT INTO `fees_type` (`id`, `name`, `fee_code`, `description`, `branch_id`, `system`, `created_at`) VALUES
(1, 'Tuition Fee', 'tuition-fee', '', 1, 0, '2025-02-12 09:59:40'),
(2, 'Registration Fee', 'registration-fee', '', 1, 0, '2025-02-12 10:00:01'),
(3, 'Examination Fee', 'examination-fee', '', 1, 0, '2025-02-12 10:00:13'),
(4, 'Development Levy', 'development-levy', '', 1, 0, '2025-02-12 10:00:23'),
(5, 'Library Fee', 'library-fee', '', 1, 0, '2025-02-12 10:00:31'),
(6, 'Laboratory Fee', 'laboratory-fee', '', 1, 0, '2025-02-12 10:00:38'),
(7, 'ICT/Computer Fee', 'ict/computer-fee', '', 1, 0, '2025-02-12 10:00:43'),
(8, 'Lesson Fee', 'lesson-fee', '', 1, 0, '2025-02-12 10:00:50'),
(9, 'ID Card Fee', 'id-card-fee', '', 1, 0, '2025-02-12 10:00:58'),
(10, 'PTA Levy', 'pta-levy', '', 1, 0, '2025-02-12 10:01:05'),
(11, 'Hostel Fee', 'hostel-fee', '', 1, 0, '2025-02-12 10:01:14'),
(12, 'Medical/Health Fee', 'medical/health-fee', '', 1, 0, '2025-02-12 10:01:22'),
(13, 'School Uniform Fee', 'school-uniform-fee', '', 1, 0, '2025-02-12 10:01:28'),
(14, 'Books and Stationery Fee', 'books-and-stationery-fee', '', 1, 0, '2025-02-12 10:01:36'),
(15, 'Sports/Games Fee', 'sports/games-fee', '', 1, 0, '2025-02-12 10:01:44'),
(16, 'Graduation Fee', 'graduation-fee', '', 1, 0, '2025-02-12 10:01:53'),
(17, 'NECO Fee', 'neco-fee', '', 1, 0, '2025-02-12 10:02:04'),
(18, 'UTME Fee', 'utme-fee', '', 1, 0, '2025-02-12 10:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `fee_allocation`
--

CREATE TABLE `fee_allocation` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `prev_due` decimal(18,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fee_allocation`
--

INSERT INTO `fee_allocation` (`id`, `student_id`, `group_id`, `branch_id`, `session_id`, `prev_due`, `created_at`) VALUES
(1, 1, 1, 1, 5, 0.00, '2025-02-12 16:37:40'),
(2, 2, 1, 1, 5, 0.00, '2025-02-12 16:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `fee_fine`
--

CREATE TABLE `fee_fine` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `fine_value` varchar(20) NOT NULL,
  `fine_type` varchar(20) NOT NULL,
  `fee_frequency` varchar(20) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups`
--

CREATE TABLE `fee_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `system` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fee_groups`
--

INSERT INTO `fee_groups` (`id`, `name`, `description`, `session_id`, `system`, `branch_id`, `created_at`) VALUES
(1, 'Primary 6 fees', '', 5, 0, 1, '2025-02-12 16:37:16');

-- --------------------------------------------------------

--
-- Table structure for table `fee_groups_details`
--

CREATE TABLE `fee_groups_details` (
  `id` int(11) NOT NULL,
  `fee_groups_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fee_groups_details`
--

INSERT INTO `fee_groups_details` (`id`, `fee_groups_id`, `fee_type_id`, `amount`, `due_date`, `created_at`) VALUES
(1, 1, 1, 2000.00, '2025-02-12', '2025-02-12 16:37:16');

-- --------------------------------------------------------

--
-- Table structure for table `fee_payment_history`
--

CREATE TABLE `fee_payment_history` (
  `id` int(11) NOT NULL,
  `allocation_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `collect_by` varchar(20) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL,
  `discount` decimal(18,2) NOT NULL,
  `fine` decimal(18,2) NOT NULL,
  `pay_via` varchar(20) NOT NULL,
  `remarks` longtext NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fee_payment_history`
--

INSERT INTO `fee_payment_history` (`id`, `allocation_id`, `type_id`, `collect_by`, `amount`, `discount`, `fine`, `pay_via`, `remarks`, `date`) VALUES
(1, 1, 1, '1', 2000.00, 0.00, 0.00, '1', 'grrhrhh', '2025-02-12');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_about`
--

CREATE TABLE `front_cms_about` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `about_image` varchar(255) NOT NULL,
  `elements` mediumtext NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_about`
--

INSERT INTO `front_cms_about` (`id`, `title`, `subtitle`, `page_title`, `content`, `banner_image`, `about_image`, `elements`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Welcome to School', 'Best Education Mangment Systems', 'About Us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut volutpat rutrum eros amet sollicitudin interdum. Suspendisse pulvinar, velit nec pharetra interdum, ante tellus ornare mi, et mollis tellus neque vitae elit. Mauris adipiscing mauris fringilla turpis interdum sed pulvinar nisi malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n                        </p>\r\n                        <p>\r\n                            Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula. Mauris sit amet neque nec nunc gravida. \r\n                        </p>\r\n                        <div class=\"row\">\r\n                            <div class=\"col-sm-6 col-12\">\r\n                                <ul class=\"list-unstyled list-style-3\">\r\n                                    <li><a href=\"#\">Cardiothoracic Surgery</a></li>\r\n                                    <li><a href=\"#\">Cardiovascular Diseases</a></li>\r\n                                    <li><a href=\"#\">Ophthalmology</a></li>\r\n                                    <li><a href=\"#\">Dermitology</a></li>\r\n                                </ul>\r\n                            </div>\r\n                            <div class=\"col-sm-6 col-12\">\r\n                                <ul class=\"list-unstyled list-style-3\">\r\n                                    <li><a href=\"#\">Cardiothoracic Surgery</a></li>\r\n                                    <li><a href=\"#\">Cardiovascular Diseases</a></li>\r\n                                    <li><a href=\"#\">Ophthalmology</a></li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>', 'about1.jpg', 'about1.png', '{\"cta_title\":\"Get in touch to join our community\",\"button_text\":\"Contact Our Office\",\"button_url\":\"contact\"}', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_admission`
--

CREATE TABLE `front_cms_admission` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `terms_conditions_title` varchar(255) DEFAULT NULL,
  `terms_conditions_description` text NOT NULL,
  `fee_elements` text DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_admission`
--

INSERT INTO `front_cms_admission` (`id`, `title`, `description`, `page_title`, `terms_conditions_title`, `terms_conditions_description`, `fee_elements`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Make An Admission', '<p>Lorem ipsum dolor sit amet, eum illum dolore concludaturque ex, ius latine adipisci no. Pro at nullam laboramus definitiones. Mandamusconceptam omittantur cu cum. Brute appetere it scriptorem ei eam, ne vim velit novum nominati. Causae volutpat percipitur at sed ne.</p>\r\n', 'Admission', '', '', '{\"1\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"2\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"3\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"4\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"5\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"6\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"7\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"8\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"9\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"10\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"11\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"12\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"13\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"14\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"15\":{\"fee_status\":\"1\",\"amount\":\"1000\"},\"16\":{\"fee_status\":\"1\",\"amount\":\"1000\"}}', 'admission1.jpg', 'Ramom - School Management System With CMS', 'Ramom  Admission Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_admitcard`
--

CREATE TABLE `front_cms_admitcard` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `templete_id` int(11) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_admitcard`
--

INSERT INTO `front_cms_admitcard` (`id`, `page_title`, `templete_id`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Admit Card', 1, 'admit_card1.jpg', 'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.', 'Ramom - School Management System With CMS', 'Ramom Admit Card Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_certificates`
--

CREATE TABLE `front_cms_certificates` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_certificates`
--

INSERT INTO `front_cms_certificates` (`id`, `page_title`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Certificates', 'certificates1.jpg', 'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.', 'Ramom - School Management System With CMS', 'Ramom Admit Card Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_contact`
--

CREATE TABLE `front_cms_contact` (
  `id` int(11) NOT NULL,
  `box_title` varchar(255) DEFAULT NULL,
  `box_description` varchar(500) DEFAULT NULL,
  `box_image` varchar(255) DEFAULT NULL,
  `form_title` varchar(355) DEFAULT NULL,
  `address` varchar(355) DEFAULT NULL,
  `phone` varchar(355) DEFAULT NULL,
  `email` varchar(355) DEFAULT NULL,
  `submit_text` varchar(355) NOT NULL,
  `map_iframe` text DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_contact`
--

INSERT INTO `front_cms_contact` (`id`, `box_title`, `box_description`, `box_image`, `form_title`, `address`, `phone`, `email`, `submit_text`, `map_iframe`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'WE\'D LOVE TO HEAR FROM YOU', 'Fusce convallis diam vitae velit tempus rutrum. Donec nisl nisl, vulputate eu sapien sed, adipiscing vehicula massa. Mauris eget commodo neque, id molestie enim.', 'contact-info-box1.png', 'Get in touch by filling the form below', '4896  Romrog Way, LOS ANGELES,\r\nCalifornia', '954-648-1802, \r\n963-612-1782', 'info@example.com\r\nsupport@example.com', 'Send', '<iframe width=\"100%\" height=\"350\" id=\"gmap_canvas\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3313.3833161665298!2d-118.03745848530627!3d33.85401093559897!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80dd2c6c97f8f3ed%3A0x47b1bde165dcc056!2sOak+Dr%2C+La+Palma%2C+CA+90623%2C+USA!5e0!3m2!1sen!2sbd!4v1544238752504\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\"></iframe>', 'Contact Us', 'contact1.jpg', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_events`
--

CREATE TABLE `front_cms_events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_events`
--

INSERT INTO `front_cms_events` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Upcoming Events', '<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p><p>Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.</p>', 'Events', 'events1.jpg', 'Ramom - School Management System With CMS', 'Ramom Events Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_exam_results`
--

CREATE TABLE `front_cms_exam_results` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `grade_scale` tinyint(1) NOT NULL,
  `attendance` tinyint(1) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_exam_results`
--

INSERT INTO `front_cms_exam_results` (`id`, `page_title`, `grade_scale`, `attendance`, `banner_image`, `description`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Exam Results', 1, 1, 'exam_results1.jpg', 'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.', 'Ramom - School Management System With CMS', 'Ramom Admit Card Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq`
--

CREATE TABLE `front_cms_faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_faq`
--

INSERT INTO `front_cms_faq` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Frequently Asked Questions', '<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p>\r\n\r\n<p>Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven&#39;t heard of them accusamus labore sustainable VHS.</p>', 'Faq', 'faq1.jpg', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq_list`
--

CREATE TABLE `front_cms_faq_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_gallery`
--

CREATE TABLE `front_cms_gallery` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_gallery`
--

INSERT INTO `front_cms_gallery` (`id`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Gallery', 'gallery1.jpg', 'Acamedium', 'Ramom Gallery  Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_gallery_category`
--

CREATE TABLE `front_cms_gallery_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_gallery_content`
--

CREATE TABLE `front_cms_gallery_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb_image` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `elements` longtext NOT NULL,
  `show_web` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home`
--

CREATE TABLE `front_cms_home` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `item_type` varchar(20) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `elements` mediumtext NOT NULL,
  `color1` varchar(100) DEFAULT NULL,
  `color2` varchar(100) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_home`
--

INSERT INTO `front_cms_home` (`id`, `title`, `subtitle`, `item_type`, `description`, `elements`, `color1`, `color2`, `branch_id`, `active`) VALUES
(1, 'Welcome To Education', 'We will give you future', 'wellcome', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using content.\r\n\r\nMaking it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '{\"image\":\"wellcome1.png\"}', '#000', NULL, 1, 1),
(2, 'Experience Teachers Team', NULL, 'teachers', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident.', '{\"teacher_start\":\"0\",\"image\":\"featured-parallax1.jpg\"}', NULL, NULL, 1, 1),
(3, 'WHY CHOOSE US', NULL, 'services', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '', NULL, NULL, 1, 1),
(4, 'Request for a free Education Class', 'Medical Services', 'cta', '', '{\"mobile_no\":\"+2484-398-8987\",\"button_text\":\"Request Now\",\"button_url\":\"http:\\/\\/localhost\\/multi_pro\\/home\\/admission\\/\"}', NULL, NULL, 1, 1),
(11, 'WHAT PEOPLE SAYS', NULL, 'testimonial', 'Fusce sem dolor, interdum in efficitur at, faucibus nec lorem. Sed nec molestie justo.', '', NULL, NULL, 1, 1),
(12, '20 years experience in the field of study', NULL, 'statistics', 'Lorem Ipsum is simply dummy text printer took a galley of type and scrambled it to make a type specimen book.', '{\"image\":\"counter-parallax1.jpg\",\"widget_title_1\":\"Certified Teachers\",\"widget_icon_1\":\"fas fa-user-tie\",\"type_1\":\"teacher\",\"widget_title_2\":\"Students Enrolled\",\"widget_icon_2\":\"fas fa-user-graduate\",\"type_2\":\"student\",\"widget_title_3\":\"Classes\",\"widget_icon_3\":\"fas fa-graduation-cap\",\"type_3\":\"class\",\"widget_title_4\":\"Section\",\"widget_icon_4\":\"fas fa-award\",\"type_4\":\"section\"}', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home_seo`
--

CREATE TABLE `front_cms_home_seo` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_home_seo`
--

INSERT INTO `front_cms_home_seo` (`id`, `page_title`, `meta_keyword`, `meta_description`, `branch_id`) VALUES
(1, 'Home', 'Ramom  Home Page', 'Ramom - School Management System With CMS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu`
--

CREATE TABLE `front_cms_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `open_new_tab` int(11) NOT NULL DEFAULT 0,
  `ext_url` tinyint(4) NOT NULL DEFAULT 0,
  `ext_url_address` text DEFAULT NULL,
  `publish` tinyint(4) NOT NULL,
  `system` tinyint(4) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_menu`
--

INSERT INTO `front_cms_menu` (`id`, `title`, `alias`, `ordering`, `parent_id`, `open_new_tab`, `ext_url`, `ext_url_address`, `publish`, `system`, `branch_id`, `created_at`) VALUES
(1, 'Home', '', 1, 0, 0, 0, '', 1, 1, 0, '2019-08-09 11:18:54'),
(2, 'Events', 'events', 3, 0, 0, 0, '', 1, 1, 0, '2019-08-09 11:18:54'),
(3, 'Teachers', 'teachers', 2, 0, 0, 0, '', 1, 1, 0, '2019-08-09 11:18:54'),
(4, 'About Us', 'about', 4, 0, 0, 0, '', 1, 1, 0, '2019-08-09 11:18:54'),
(5, 'FAQ', 'faq', 5, 0, 0, 0, '', 1, 1, 0, '2019-08-09 11:18:54'),
(6, 'Online Admission', 'admission', 6, 0, 0, 0, '', 1, 1, 0, '2019-08-09 11:18:54'),
(7, 'Contact Us', 'contact', 13, 0, 0, 0, '', 1, 1, 0, '2019-08-09 11:18:54'),
(8, 'Pages', 'pages', 9, 0, 0, 1, '#', 1, 1, 0, '2019-08-09 11:18:54'),
(9, 'Admit Card', 'admit_card', 10, 8, 0, 0, '', 1, 1, 0, '2021-03-16 03:24:32'),
(10, 'Exam Results', 'exam_results', 11, 8, 0, 0, '', 1, 1, 0, '2021-03-16 03:24:32'),
(11, 'Certificates', 'certificates', 12, 8, 0, 0, '', 1, 1, 0, '2021-03-21 11:04:44'),
(12, 'Gallery', 'gallery', 7, 0, 0, 0, '', 1, 1, 0, '2021-03-21 11:04:44'),
(13, 'News', 'news', 8, 0, 0, 0, '', 1, 1, 0, '2024-05-12 13:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu_visible`
--

CREATE TABLE `front_cms_menu_visible` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  `parent_id` varchar(11) DEFAULT NULL,
  `ordering` varchar(20) DEFAULT NULL,
  `invisible` tinyint(4) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_menu_visible`
--

INSERT INTO `front_cms_menu_visible` (`id`, `name`, `menu_id`, `parent_id`, `ordering`, `invisible`, `branch_id`) VALUES
(2, NULL, 1, NULL, NULL, 0, 1),
(3, NULL, 3, NULL, NULL, 1, 1),
(4, NULL, 2, NULL, NULL, 1, 1),
(5, NULL, 4, NULL, NULL, 1, 1),
(6, NULL, 5, NULL, NULL, 1, 1),
(7, NULL, 12, NULL, NULL, 1, 1),
(8, NULL, 13, NULL, NULL, 1, 1),
(9, NULL, 8, NULL, NULL, 1, 1),
(10, NULL, 9, NULL, NULL, 1, 1),
(11, NULL, 11, NULL, NULL, 1, 1),
(12, NULL, 7, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_news`
--

CREATE TABLE `front_cms_news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_news`
--

INSERT INTO `front_cms_news` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, '', '<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.</p><p>Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.</p>', 'News', 'news1.jpg', 'Ramom - School Management System With CMS', 'Ramom News Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_news_list`
--

CREATE TABLE `front_cms_news_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `alias` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `show_web` tinyint(4) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` int(11) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services`
--

CREATE TABLE `front_cms_services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `parallax_image` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_services`
--

INSERT INTO `front_cms_services` (`id`, `title`, `subtitle`, `parallax_image`, `branch_id`) VALUES
(1, 'Get Well Soon', 'Our Best <span>Services</span>', 'service_parallax1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services_list`
--

CREATE TABLE `front_cms_services_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_setting`
--

CREATE TABLE `front_cms_setting` (
  `id` int(11) NOT NULL,
  `application_title` varchar(255) NOT NULL,
  `url_alias` varchar(255) DEFAULT NULL,
  `cms_active` tinyint(4) NOT NULL DEFAULT 0,
  `online_admission` tinyint(4) NOT NULL DEFAULT 0,
  `theme` varchar(255) NOT NULL,
  `captcha_status` varchar(20) NOT NULL,
  `recaptcha_site_key` varchar(255) NOT NULL,
  `recaptcha_secret_key` varchar(255) NOT NULL,
  `address` varchar(350) NOT NULL,
  `mobile_no` varchar(60) NOT NULL,
  `fax` varchar(60) NOT NULL,
  `receive_contact_email` varchar(255) NOT NULL,
  `email` varchar(60) NOT NULL,
  `copyright_text` varchar(255) NOT NULL,
  `fav_icon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `footer_about_text` varchar(300) NOT NULL,
  `working_hours` varchar(300) NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `primary_color` varchar(100) NOT NULL DEFAULT '#ff685c',
  `menu_color` varchar(100) NOT NULL DEFAULT '#fff',
  `hover_color` varchar(100) NOT NULL DEFAULT '#f04133',
  `text_color` varchar(100) NOT NULL DEFAULT '#232323',
  `text_secondary_color` varchar(100) NOT NULL DEFAULT '#383838',
  `footer_background_color` varchar(100) NOT NULL DEFAULT '#383838',
  `footer_text_color` varchar(100) NOT NULL DEFAULT '#8d8d8d',
  `copyright_bg_color` varchar(100) NOT NULL DEFAULT '#262626',
  `copyright_text_color` varchar(100) NOT NULL DEFAULT '#8d8d8d',
  `border_radius` varchar(100) NOT NULL DEFAULT '0',
  `facebook_url` varchar(100) NOT NULL,
  `twitter_url` varchar(100) NOT NULL,
  `youtube_url` varchar(100) NOT NULL,
  `google_plus` varchar(100) NOT NULL,
  `linkedin_url` varchar(100) NOT NULL,
  `pinterest_url` varchar(100) NOT NULL,
  `instagram_url` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_setting`
--

INSERT INTO `front_cms_setting` (`id`, `application_title`, `url_alias`, `cms_active`, `online_admission`, `theme`, `captcha_status`, `recaptcha_site_key`, `recaptcha_secret_key`, `address`, `mobile_no`, `fax`, `receive_contact_email`, `email`, `copyright_text`, `fav_icon`, `logo`, `footer_about_text`, `working_hours`, `google_analytics`, `primary_color`, `menu_color`, `hover_color`, `text_color`, `text_secondary_color`, `footer_background_color`, `footer_text_color`, `copyright_bg_color`, `copyright_text_color`, `border_radius`, `facebook_url`, `twitter_url`, `youtube_url`, `google_plus`, `linkedin_url`, `pinterest_url`, `instagram_url`, `branch_id`) VALUES
(1, 'Acamedium School', 'bgs', 1, 1, 'red', 'disable', '', '', 'Your Address', '+12345678', '12345678', 'info@example.com', 'info@demo.com', 'Copyright © 2025 <span>Codeindevelopers</span>. All Rights Reserved.', 'fav_icon1.png', 'logo1.png', 'If you are going to use a passage LorIsum, you anythirassing hidden in the middle of text. Lators on the Internet tend to.', '<span>Hours : </span>  Mon To Fri - 10AM - 04PM,  Sunday Closed', '', '#2c39fd', '#fff', 'rgba(44, 57, 253, 0.86)', '#232323', '#8d8d8d', '#383838', '#8d8d8d', '#262626', '#8d8d8d', '0', '', '', '', '', '', 'https://pinterest.com', 'https://instagram.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_teachers`
--

CREATE TABLE `front_cms_teachers` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_teachers`
--

INSERT INTO `front_cms_teachers` (`id`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`, `branch_id`) VALUES
(1, 'Teachers', 'teachers1.jpg', 'Ramom - School Management System With CMS', 'Ramom  Teachers Page', 1);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_testimonial`
--

CREATE TABLE `front_cms_testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(355) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rank` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `front_cms_testimonial`
--

INSERT INTO `front_cms_testimonial` (`id`, `name`, `surname`, `image`, `description`, `rank`, `branch_id`, `created_by`, `created_at`) VALUES
(4, 'Michel Jhon', 'CEO', 'defualt.png', '“Owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted always holds”.', 3, 2, 1, '2019-08-23 11:26:42'),
(5, 'Hilda Howard', 'Chicago City', 'defualt.png', '“Owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted always holds”.', 4, 2, 1, '2019-08-23 11:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(11) NOT NULL,
  `institute_name` varchar(255) NOT NULL,
  `institution_code` varchar(255) NOT NULL,
  `reg_prefix` varchar(255) NOT NULL,
  `institute_email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `currency_symbol` varchar(100) NOT NULL,
  `currency_formats` tinyint(4) NOT NULL DEFAULT 1,
  `symbol_position` tinyint(4) NOT NULL DEFAULT 1,
  `sms_service_provider` varchar(100) NOT NULL,
  `session_id` int(11) NOT NULL,
  `translation` varchar(100) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `animations` varchar(100) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `date_format` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `facebook_url` varchar(255) NOT NULL,
  `twitter_url` varchar(255) NOT NULL,
  `linkedin_url` varchar(255) NOT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `google_plus_url` varchar(255) DEFAULT NULL,
  `cron_secret_key` varchar(255) DEFAULT NULL,
  `preloader_backend` tinyint(1) NOT NULL DEFAULT 1,
  `footer_branch_switcher` tinyint(1) NOT NULL DEFAULT 1,
  `cms_default_branch` int(11) NOT NULL,
  `image_extension` text DEFAULT NULL,
  `image_size` float NOT NULL DEFAULT 1024,
  `file_extension` text DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `file_size` float DEFAULT 1024,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `institute_name`, `institution_code`, `reg_prefix`, `institute_email`, `address`, `mobileno`, `currency`, `currency_symbol`, `currency_formats`, `symbol_position`, `sms_service_provider`, `session_id`, `translation`, `footer_text`, `animations`, `timezone`, `date_format`, `facebook_url`, `twitter_url`, `linkedin_url`, `youtube_url`, `instagram_url`, `google_plus_url`, `cron_secret_key`, `preloader_backend`, `footer_branch_switcher`, `cms_default_branch`, `image_extension`, `image_size`, `file_extension`, `pid`, `file_size`, `created_at`, `updated_at`) VALUES
(1, 'Redeemers High School', 'ACm-', 'on', 'sch@example.com', '', '', 'NGN', '₦', 1, 1, 'disabled', 5, 'english', '© 2024 acamedium developed by codeindevelopers', 'fadeIn', 'Pacific/Midway', 'd.M.Y', '', '', '', '', '', '', '', 2, 0, 1, 'jpeg, jpg, bmp, png', 2048, 'txt, pdf, doc, xls, docx, xlsx, jpg, jpeg, png, gif, bmp, zip, mp4, 7z, wmv, rar', 'OTMyMTAxNDAtOTVkYS00MmU5LWI0MjItOGE0OTRkOGY1YjQw', 500000, '2024-05-27 01:58:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `grade_point` varchar(255) NOT NULL,
  `lower_mark` int(11) NOT NULL,
  `upper_mark` int(11) NOT NULL,
  `remark` text NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `name`, `grade_point`, `lower_mark`, `upper_mark`, `remark`, `branch_id`) VALUES
(1, 'A+', '4.0', 80, 100, 'Excellent', 1),
(2, 'A', '4.0', 70, 79, 'Very Good', 1),
(3, 'A-', '3.5', 60, 69, 'Good', 1),
(4, 'B', '3.0', 50, 59, 'Average', 1),
(5, 'C', '2.5', 40, 49, 'Adequate', 1),
(6, 'D', '2.0', 33, 39, 'Poor', 1),
(7, 'F', '0', 20, 29, 'Fail', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hall_allocation`
--

CREATE TABLE `hall_allocation` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `hall_no` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date_of_homework` date NOT NULL,
  `date_of_submission` date NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `sms_notification` tinyint(4) NOT NULL,
  `schedule_date` date DEFAULT NULL,
  `document` varchar(255) NOT NULL,
  `evaluation_date` date DEFAULT NULL,
  `evaluated_by` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`id`, `class_id`, `section_id`, `session_id`, `subject_id`, `date_of_homework`, `date_of_submission`, `description`, `created_by`, `create_date`, `status`, `sms_notification`, `schedule_date`, `document`, `evaluation_date`, `evaluated_by`, `branch_id`) VALUES
(1, 10, 1, 5, 1, '2025-02-12', '2025-02-13', '<p>WFWERGERGERGGEGERGERGEGGERGRGERGGEEGERGGEGG</p>', 1, '2025-02-12', '0', 0, NULL, 'PXL_20250206_143906459.jpg', '2025-02-12', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `homework_evaluation`
--

CREATE TABLE `homework_evaluation` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `remark` text NOT NULL,
  `rank` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `homework_evaluation`
--

INSERT INTO `homework_evaluation` (`id`, `homework_id`, `student_id`, `remark`, `rank`, `date`, `status`) VALUES
(1, 1, 1, 'REAKGTRGRGKKGRKGKKGTTKGOG', 5, '2025-02-12', 'c'),
(2, 1, 2, '', 1, '2025-02-12', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `homework_submit`
--

CREATE TABLE `homework_submit` (
  `id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `message` varchar(355) NOT NULL,
  `enc_name` varchar(355) DEFAULT NULL,
  `file_name` varchar(355) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `category_id` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `watchman` longtext NOT NULL,
  `remarks` longtext DEFAULT NULL,
  `branch_id` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_category`
--

CREATE TABLE `hostel_category` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `description` longtext DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hostel_room`
--

CREATE TABLE `hostel_room` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `hostel_id` int(11) NOT NULL,
  `no_beds` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `bed_fee` decimal(18,2) NOT NULL,
  `remarks` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `word` varchar(255) NOT NULL,
  `english` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `word`, `english`) VALUES
(1, 'language', 'Language'),
(2, 'attendance_overview', 'Attendance Overview'),
(3, 'annual_fee_summary', 'Annual Fee Summary'),
(4, 'my_annual_attendance_overview', 'My Annual Attendance Overview'),
(5, 'schedule', 'Time Table'),
(6, 'student_admission', 'Student Admission'),
(7, 'returned', 'Returned'),
(8, 'user_name', 'User Name'),
(9, 'rejected', 'Rejected'),
(10, 'route_name', 'Route Name'),
(11, 'route_fare', 'Route Fare'),
(12, 'edit_route', 'Edit Route'),
(13, 'this_value_is_required', 'This value is required.'),
(14, 'vehicle_no', 'Vehicle No'),
(15, 'insurance_renewal_date', 'Insurance Renewal Date'),
(16, 'driver_name', 'Driver Name'),
(17, 'driver_license', 'Driver License'),
(18, 'select_route', 'Select Route'),
(19, 'edit_vehicle', 'Edit Vehicle'),
(20, 'add_students', 'Add Students'),
(21, 'vehicle_number', 'Vehicle Number'),
(22, 'select_route_first', 'Select Route First'),
(23, 'transport_fee', 'Transport Fee'),
(24, 'control', 'Control'),
(25, 'set_students', 'Set Students'),
(26, 'hostel_list', 'Hostel List'),
(27, 'watchman_name', 'Watchman Name'),
(28, 'hostel_address', 'Hostel Address'),
(29, 'edit_hostel', 'Edit Hostel'),
(30, 'room_name', 'Room Name'),
(31, 'no_of_beds', 'No Of Beds'),
(32, 'select_hostel_first', 'Select Hostel First'),
(33, 'remaining', 'Remaining'),
(34, 'hostel_fee', 'Hostel Fee'),
(35, 'accountant_list', 'Accountant List'),
(36, 'students_fees', 'Students Fees'),
(37, 'fees_status', 'Fees Status'),
(38, 'books', 'Books'),
(39, 'home_page', 'Home Page'),
(40, 'collected', 'Collected'),
(41, 'student_mark', 'Student Mark'),
(42, 'select_exam_first', 'Select Exam First'),
(43, 'transport_details', 'Transport Details'),
(44, 'no_of_teacher', 'No of Teacher'),
(45, 'basic_details', 'Basic Details'),
(46, 'fee_progress', 'Fee Progress'),
(47, 'word', 'Word'),
(48, 'book_category', 'Book Category'),
(49, 'driver_phone', 'Driver Phone'),
(50, 'invalid_csv_file', 'Invalid / Corrupted CSV File'),
(51, 'requested_book_list', 'Requested Book List'),
(52, 'request_status', 'Request Status'),
(53, 'book_request', 'Book Request'),
(54, 'logout', 'Logout'),
(55, 'select_payment_method', 'Select Payment Method'),
(56, 'select_method', 'Select Method'),
(57, 'payment', 'Payment'),
(58, 'filter', 'Filter'),
(59, 'status', 'Status'),
(60, 'paid', 'Paid'),
(61, 'unpaid', 'Unpaid'),
(62, 'method', 'Method'),
(63, 'cash', 'Cash'),
(64, 'check', 'Check'),
(65, 'card', 'Card'),
(66, 'payment_history', 'Payment History'),
(67, 'category', 'Category'),
(68, 'book_list', 'Book List'),
(69, 'author', 'Author'),
(70, 'price', 'Price'),
(71, 'available', 'Available'),
(72, 'unavailable', 'Unavailable'),
(73, 'transport_list', 'Transport List'),
(74, 'edit_transport', 'Edit Transport'),
(75, 'hostel_name', 'Hostel Name'),
(76, 'number_of_room', 'Hostel Of Room'),
(77, 'yes', 'Yes'),
(78, 'no', 'No'),
(79, 'messages', 'Messages'),
(80, 'compose', 'Compose'),
(81, 'recipient', 'Recipient'),
(82, 'select_a_user', 'Select A User'),
(83, 'send', 'Send'),
(84, 'global_settings', 'Global Settings'),
(85, 'currency', 'Currency'),
(86, 'system_email', 'System Email'),
(87, 'create', 'Create'),
(88, 'save', 'Save'),
(89, 'file', 'File'),
(90, 'theme_settings', 'Theme Settings'),
(91, 'default', 'Default'),
(92, 'select_theme', 'Select Theme'),
(93, 'upload_logo', 'Upload Logo'),
(94, 'upload', 'Upload'),
(95, 'remember', 'Remember'),
(96, 'not_selected', 'Not Selected'),
(97, 'disabled', 'Disabled'),
(98, 'inactive_account', 'Inactive Account'),
(99, 'update_translations', 'Update Translations'),
(100, 'language_list', 'Language List'),
(101, 'option', 'Option'),
(102, 'edit_word', 'Edit Word'),
(103, 'update_profile', 'Update Profile'),
(104, 'current_password', 'Current Password'),
(105, 'new_password', 'New Password'),
(106, 'login', 'Login'),
(107, 'reset_password', 'Reset Password'),
(108, 'present', 'Present'),
(109, 'absent', 'Absent'),
(110, 'update_attendance', 'Update Attendance'),
(111, 'undefined', 'Undefined'),
(112, 'back', 'Back'),
(113, 'save_changes', 'Save Changes'),
(114, 'uploader', 'Uploader'),
(115, 'download', 'Download'),
(116, 'remove', 'Remove'),
(117, 'print', 'Print'),
(118, 'select_file_type', 'Select File Type'),
(119, 'excel', 'Excel'),
(120, 'other', 'Other'),
(121, 'students_of_class', 'Students Of Class'),
(122, 'marks_obtained', 'Marks Obtained'),
(123, 'attendance_for_class', 'Attendance For Class'),
(124, 'receiver', 'Receiver'),
(125, 'please_select_receiver', 'Please Select Receiver'),
(126, 'session_changed', 'Session Changed'),
(127, 'exam_marks', 'Exam Marks'),
(128, 'total_mark', 'Total Mark'),
(129, 'mark_obtained', 'Mark Obtained'),
(130, 'invoice/payment_list', 'Invoice / Payment List'),
(131, 'obtained_marks', 'Obtained Marks'),
(132, 'highest_mark', 'Highest Mark'),
(133, 'grade', 'Grade (GPA)'),
(134, 'dashboard', 'Dashboard'),
(135, 'student', 'Student'),
(136, 'rename', 'Rename'),
(137, 'class', 'Class'),
(138, 'teacher', 'Teacher'),
(139, 'parents', 'Parents'),
(140, 'subject', 'Subject'),
(141, 'student_attendance', 'Student Attendance'),
(142, 'exam_list', 'Exam List'),
(143, 'grades_range', 'Grades Range'),
(144, 'loading', 'Loading'),
(145, 'library', 'Library'),
(146, 'hostel', 'Hostel'),
(147, 'events', 'Event'),
(148, 'message', 'Message'),
(149, 'translations', 'Translations'),
(150, 'account', 'Account'),
(151, 'selected_session', 'Selected Session'),
(152, 'change_password', 'Change Password'),
(153, 'section', 'Section'),
(154, 'edit', 'Edit'),
(155, 'delete', 'Delete'),
(156, 'cancel', 'Cancel'),
(157, 'parent', 'Parent'),
(158, 'attendance', 'Attendance'),
(159, 'addmission_form', 'Admission Form'),
(160, 'name', 'Name'),
(161, 'select', 'Select'),
(162, 'roll', 'Roll'),
(163, 'birthday', 'Date Of Birth'),
(164, 'gender', 'Gender'),
(165, 'male', 'Male'),
(166, 'female', 'Female'),
(167, 'address', 'Address'),
(168, 'phone', 'Phone'),
(169, 'email', 'Email'),
(170, 'password', 'Password'),
(171, 'transport_route', 'Transport Route'),
(172, 'photo', 'Photo'),
(173, 'select_class', 'Select Class'),
(174, 'username_password_incorrect', 'Username Or Password Is Incorrect'),
(175, 'select_section', 'Select Section'),
(176, 'options', 'Options'),
(177, 'mark_sheet', 'Report Card'),
(178, 'profile', 'Profile'),
(179, 'select_all', 'Select All'),
(180, 'select_none', 'Select None'),
(181, 'average', 'Average'),
(182, 'transfer', 'Transfer'),
(183, 'edit_teacher', 'Edit Teacher'),
(184, 'sex', 'Sex'),
(185, 'marksheet_for', 'Report Card For'),
(186, 'total_marks', 'Total Marks'),
(187, 'parent_phone', 'Parent Phone'),
(188, 'subject_author', 'Subject Author'),
(189, 'update', 'Update'),
(190, 'class_list', 'Class List'),
(191, 'class_name', 'Class Name'),
(192, 'name_numeric', 'Name Numeric'),
(193, 'select_teacher', 'Select Teacher'),
(194, 'edit_class', 'Edit Class'),
(195, 'section_name', 'Section Name'),
(196, 'add_section', 'Add Section'),
(197, 'subject_list', 'Subject List'),
(198, 'subject_name', 'Subject Name'),
(199, 'edit_subject', 'Edit Subject'),
(200, 'day', 'Day'),
(201, 'starting_time', 'Starting Time'),
(202, 'hour', 'Hour'),
(203, 'minutes', 'Minutes'),
(204, 'ending_time', 'Ending Time'),
(205, 'select_subject', 'Select Subject'),
(206, 'select_date', 'Select Date'),
(207, 'select_month', 'Select Month'),
(208, 'select_year', 'Select Year'),
(209, 'add_language', 'Add Language'),
(210, 'exam_name', 'Exam Name'),
(211, 'date', 'Date'),
(212, 'comment', 'Comment'),
(213, 'edit_exam', 'Edit Exam'),
(214, 'grade_list', 'Grade List'),
(215, 'grade_name', 'Grade Name'),
(216, 'grade_point', 'Grade Point'),
(217, 'select_exam', 'Select Exam'),
(218, 'students', 'Students'),
(219, 'subjects', 'Subjects'),
(220, 'total', 'Total'),
(221, 'select_academic_session', 'Select Academic Session'),
(222, 'invoice_informations', 'Invoice Informations'),
(223, 'title', 'Title'),
(224, 'description', 'Description'),
(225, 'payment_informations', 'Payment Informations'),
(226, 'view_invoice', 'View Invoice'),
(227, 'payment_to', 'Payment To'),
(228, 'bill_to', 'Bill To'),
(229, 'total_amount', 'Total Amount'),
(230, 'paid_amount', 'Paid Amount'),
(231, 'due', 'Due'),
(232, 'amount_paid', 'Amount Paid'),
(233, 'payment_successfull', 'Payment has been successful'),
(234, 'add_invoice/payment', 'Add Invoice/payment'),
(235, 'invoices', 'Invoices'),
(236, 'action', 'Action'),
(237, 'required', 'Required'),
(238, 'info', 'Info'),
(239, 'month', 'Month'),
(240, 'details', 'Details'),
(241, 'new', 'New'),
(242, 'reply_message', 'Reply Message'),
(243, 'message_sent', 'Message Sent'),
(244, 'search', 'Search'),
(245, 'religion', 'Religion'),
(246, 'blood_group', 'Blood group'),
(247, 'database_backup', 'Database Backup'),
(248, 'search', 'Search'),
(249, 'payments_history', 'Fees Pay / Invoice'),
(250, 'message_restore', 'Message Restore'),
(251, 'write_new_message', 'Write New Message'),
(252, 'attendance_sheet', 'Attendance Sheet'),
(253, 'holiday', 'Holiday'),
(254, 'exam', 'Exam'),
(255, 'successfully', 'Successfully'),
(256, 'admin', 'Admin'),
(257, 'inbox', 'Inbox'),
(258, 'sent', 'Sent'),
(259, 'important', 'Important'),
(260, 'trash', 'Trash'),
(261, 'error', 'Unsuccessful'),
(262, 'sessions_list', 'Sessions List'),
(263, 'session_settings', 'Session Settings'),
(264, 'add_designation', 'Add Designation'),
(265, 'users', 'Users'),
(266, 'librarian', 'Librarian'),
(267, 'accountant', 'Accountant'),
(268, 'academics', 'Academics'),
(269, 'employees_attendance', 'Employees Attendance'),
(270, 'set_exam_term', 'Set Exam Term'),
(271, 'set_attendance', 'Set Attendance'),
(272, 'marks', 'Marks'),
(273, 'books_category', 'Books Category'),
(274, 'transport', 'Transport'),
(275, 'fees', 'Fees'),
(276, 'fees_allocation', 'Fees Allocation'),
(277, 'fee_category', 'Fee Category'),
(278, 'report', 'Report'),
(279, 'employee', 'Employee'),
(280, 'invoice', 'Invoice'),
(281, 'event_catalogue', 'Event Catalogue'),
(282, 'total_paid', 'Total Paid'),
(283, 'total_due', 'Total Due'),
(284, 'fees_collect', 'Fees Collect'),
(285, 'total_school_students_attendance', 'Total School Students Attendance'),
(286, 'overview', 'Overview'),
(287, 'currency_symbol', 'Currency Symbol'),
(288, 'enable', 'Enable'),
(289, 'disable', 'Disable'),
(290, 'payment_settings', 'Payment Settings'),
(291, 'student_attendance_report', 'Student Attendance Report'),
(292, 'attendance_type', 'Attendance Type'),
(293, 'late', 'Late'),
(294, 'employees_attendance_report', 'Employees Attendance Report'),
(295, 'attendance_report_of', 'Attendance Report Of'),
(296, 'fee_paid_report', 'Fee Paid Report'),
(297, 'invoice_no', 'Invoice No'),
(298, 'payment_mode', 'Payment Mode'),
(299, 'payment_type', 'Payment Type'),
(300, 'done', 'Done'),
(301, 'select_fee_category', 'Select Fee Category'),
(302, 'discount', 'Discount'),
(303, 'enter_discount_amount', 'Enter Discount Amount'),
(304, 'online_payment', 'Online Payment'),
(305, 'student_name', 'Student Name'),
(306, 'invoice_history', 'Invoice History'),
(307, 'discount_amount', 'Discount Amount'),
(308, 'invoice_list', 'Invoice List'),
(309, 'partly_paid', 'Partly Paid'),
(310, 'fees_list', 'Fees List'),
(311, 'voucher_id', 'Voucher ID'),
(312, 'transaction_date', 'Transaction Date'),
(313, 'admission_date', 'Admission Date'),
(314, 'user_status', 'User Status'),
(315, 'nationality', 'Nationality'),
(316, 'register_no', 'Admission No'),
(317, 'first_name', 'First Name'),
(318, 'last_name', 'Last Name'),
(319, 'state', 'State'),
(320, 'transport_vehicle_no', 'Transport Vehicle No'),
(321, 'percent', 'Percent'),
(322, 'average_result', 'Average Result'),
(323, 'student_category', 'Student Category'),
(324, 'category_name', 'Category Name'),
(325, 'category_list', 'Category List'),
(326, 'please_select_student_first', 'Please Select Students First'),
(327, 'designation', 'Designation'),
(328, 'qualification', 'Qualification'),
(329, 'account_deactivated', 'Account Deactivated'),
(330, 'account_activated', 'Account Activated'),
(331, 'designation_list', 'Designation List'),
(332, 'joining_date', 'Joining Date'),
(333, 'relation', 'Relation'),
(334, 'father_name', 'Father Name'),
(335, 'librarian_list', 'Librarian List'),
(336, 'class_numeric', 'Class Numeric'),
(337, 'maximum_students', 'Maximum Students'),
(338, 'class_room', 'Class Room'),
(339, 'pass_mark', 'Pass Mark'),
(340, 'exam_time', 'Exam Time (Min)'),
(341, 'time', 'Time'),
(342, 'subject_code', 'Subject Code'),
(343, 'full_mark', 'Full Mark'),
(344, 'subject_type', 'Subject Type'),
(345, 'date_of_publish', 'Date Of Publish'),
(346, 'file_name', 'File Name'),
(347, 'students_list', 'Students List'),
(348, 'start_date', 'Start Date'),
(349, 'end_date', 'End Date'),
(350, 'term_name', 'Term Name'),
(351, 'grand_total', 'Grand Total'),
(352, 'result', 'Result'),
(353, 'books_list', 'Books List'),
(354, 'book_isbn_no', 'Book ISBN No'),
(355, 'total_stock', 'Total Stock'),
(356, 'issued_copies', 'Issued Copies'),
(357, 'publisher', 'Publisher'),
(358, 'books_issue', 'Books Issue'),
(359, 'user', 'User'),
(360, 'fine', 'Fine'),
(361, 'pending', 'Pending'),
(362, 'return_date', 'Return Date'),
(363, 'accept', 'Accept'),
(364, 'reject', 'Reject'),
(365, 'issued', 'Issued'),
(366, 'return', 'Return'),
(367, 'renewal', 'Renewal'),
(368, 'fine_amount', 'Fine Amount'),
(369, 'password_mismatch', 'Password Mismatch'),
(370, 'settings_updated', 'Settings Update'),
(371, 'pass', 'Pass'),
(372, 'event_to', 'Event To'),
(373, 'all_users', 'All Users'),
(374, 'employees_list', 'Employees List'),
(375, 'on', 'On'),
(376, 'timezone', 'Timezone'),
(377, 'get_result', 'Get Result'),
(378, 'apply', 'Apply'),
(379, 'hrm', 'Human Resource'),
(380, 'payroll', 'Payroll'),
(381, 'salary_assign', 'Salary Assign'),
(382, 'employee_salary', 'Payment Salary'),
(383, 'application', 'Application'),
(384, 'award', 'Appraisal'),
(385, 'basic_salary', 'Basic Salary'),
(386, 'employee_name', 'Employee Name'),
(387, 'name_of_allowance', 'Name Of Allowance'),
(388, 'name_of_deductions', 'Name Of Deductions'),
(389, 'all_employees', 'All Employees'),
(390, 'total_allowance', 'Total Allowance'),
(391, 'total_deduction', 'Total Deductions'),
(392, 'net_salary', 'Net Salary'),
(393, 'payslip', 'Payslip'),
(394, 'days', 'Days'),
(395, 'category_name_already_used', 'Category Name Already Used'),
(396, 'leave_list', 'Leave List'),
(397, 'leave_category', 'Leave Category'),
(398, 'applied_on', 'Applied On'),
(399, 'accepted', 'Accepted'),
(400, 'leave_statistics', 'Leave Statistics'),
(401, 'leave_type', 'Leave Type'),
(402, 'reason', 'Reason'),
(403, 'close', 'Close'),
(404, 'give_award', 'Give Appraisal'),
(405, 'list', 'List'),
(406, 'award_name', 'Appraisal Name'),
(407, 'gift_item', 'Gift Item'),
(408, 'cash_price', 'Cash Price'),
(409, 'award_reason', 'Appraisal Reason'),
(410, 'given_date', 'Given Date'),
(411, 'apply_leave', 'Apply Leave'),
(412, 'leave_application', 'Leave Application'),
(413, 'allowances', 'Allowances'),
(414, 'add_more', 'Add More'),
(415, 'deductions', 'Deductions'),
(416, 'salary_details', 'Salary Details'),
(417, 'salary_month', 'Salary Month'),
(418, 'leave_data_update_successfully', 'Leave Data Updated Successfully'),
(419, 'fees_history', 'Fees History'),
(420, 'bank_name', 'Bank Name'),
(421, 'branch', 'Branch'),
(422, 'bank_address', 'Bank Address'),
(423, 'ifsc_code', 'IFSC Code'),
(424, 'account_no', 'Account No'),
(425, 'add_bank', 'Add Bank'),
(426, 'account_name', 'Account Holder'),
(427, 'database_backup_completed', 'Database Backup Completed'),
(428, 'restore_database', 'Restore Database'),
(429, 'template', 'Template'),
(430, 'time_and_date', 'Time And Date'),
(431, 'everyone', 'Everyone'),
(432, 'invalid_amount', 'Invalid Amount'),
(433, 'leaving_date_is_not_available_for_you', 'Leaving Date Is Not Available For You'),
(434, 'animations', 'Animations'),
(435, 'email_settings', 'Email Settings'),
(436, 'deduct_month', 'Deduct Month'),
(437, 'no_employee_available', 'No Employee Available'),
(438, 'advance_salary_application_submitted', 'Salary Advance Application Submitted'),
(439, 'date_format', 'Date Format'),
(440, 'id_card_generate', 'ID Card Generate'),
(441, 'issue_salary', 'Issue Salary'),
(442, 'advance_salary', 'Salary Advance '),
(443, 'logo', 'Logo'),
(444, 'book_request', 'Book Request'),
(445, 'reporting', 'Reporting'),
(446, 'paid_salary', 'Paid Salary'),
(447, 'due_salary', 'Due Salary'),
(448, 'route', 'Route'),
(449, 'academic_details', 'Academic Details'),
(450, 'guardian_details', 'Guardian Details'),
(451, 'due_amount', 'Due Amount'),
(452, 'fee_due_report', 'Fee Due Report'),
(453, 'other_details', 'Other Details'),
(454, 'last_exam_report', 'Last Exam Report'),
(455, 'book_issued', 'Book Issued'),
(456, 'interval_month', 'Interval 30 Days'),
(457, 'attachments', 'Attachments'),
(458, 'fees_payment', 'Fees Payment'),
(459, 'fees_summary', 'Fees Summary'),
(460, 'total_fees', 'Total Fees'),
(461, 'weekend_attendance_inspection', 'Weekend Attendance Inspection'),
(462, 'book_issued_list', 'Book Issued List'),
(463, 'lose_your_password', 'Lose Your Password?'),
(464, 'all_branch_dashboard', 'All Branch Dashboard'),
(465, 'academic_session', 'Academic Session'),
(466, 'all_branches', 'All Branches'),
(467, 'admission', 'Admission'),
(468, 'create_admission', 'Register New Student'),
(469, 'multiple_import', 'Multiple Import'),
(470, 'student_details', 'Student Details'),
(471, 'student_list', 'Student List'),
(472, 'login_deactivate', 'Account Reactivation'),
(473, 'parents_list', 'Parents List'),
(474, 'add_parent', 'Add Parent'),
(475, 'employee_list', 'Employee List'),
(476, 'add_department', 'Add Department'),
(477, 'add_employee', 'Add Employee'),
(478, 'salary_template', 'Salary Template'),
(479, 'salary_payment', 'Salary Payment'),
(480, 'payroll_summary', 'Payroll Summary'),
(481, 'academic', 'Academics'),
(482, 'control_classes', 'Control Classes'),
(483, 'assign_class_teacher', 'Assign Class Teacher'),
(484, 'class_assign', 'Assign Class'),
(485, 'assign', 'Assign'),
(486, 'promotion', 'Promote Students'),
(487, 'attachments_book', 'Attachments'),
(488, 'upload_content', 'Upload Content'),
(489, 'attachment_type', 'Attachment Type'),
(490, 'exam_master', 'Exam Master'),
(491, 'exam_hall', 'Exam Hall'),
(492, 'mark_entries', 'Mark Entries'),
(493, 'tabulation_sheet', 'Broad Sheet'),
(494, 'supervision', 'Supervision'),
(495, 'hostel_master', 'Hostel Master'),
(496, 'hostel_room', 'Hostel Room'),
(497, 'allocation_report', 'Allocation Report'),
(498, 'route_master', 'Route Master'),
(499, 'vehicle_master', 'Vehicle Master'),
(500, 'stoppage', 'Stoppage'),
(501, 'assign_vehicle', 'Assign Vehicle'),
(502, 'reports', 'Reports'),
(503, 'books_entry', 'Books Entry'),
(504, 'event_type', 'Event Type'),
(505, 'add_events', 'Add Events'),
(506, 'student_accounting', 'Student Accounting'),
(507, 'create_single_invoice', 'Create Single Invoice'),
(508, 'create_multi_invoice', 'Create Multi Invoice'),
(509, 'summary_report', 'Summary Report'),
(510, 'office_accounting', 'Office Accounting'),
(511, 'under_group', 'Under Group'),
(512, 'bank_account', 'Bank Account'),
(513, 'ledger_account', 'Ledger Account'),
(514, 'create_voucher', 'Create Voucher'),
(515, 'day_book', 'Day Book'),
(516, 'cash_book', 'Cash Book'),
(517, 'bank_book', 'Bank Book'),
(518, 'ledger_book', 'Ledger Book'),
(519, 'trial_balance', 'Trial Balance'),
(520, 'settings', 'Settings'),
(521, 'sms_settings', 'Sms Settings'),
(522, 'cash_book_of', 'Cash Book Of'),
(523, 'by_cash', 'By Cash'),
(524, 'by_bank', 'By Bank'),
(525, 'total_strength', 'Total Strength'),
(526, 'teachers', 'Teachers'),
(527, 'student_quantity', 'Student Quantity'),
(528, 'voucher', 'Voucher'),
(529, 'total_number', 'Total Number'),
(530, 'total_route', 'Total Route'),
(531, 'total_room', 'Total Room'),
(532, 'amount', 'Amount'),
(533, 'branch_dashboard', 'Dashboard'),
(534, 'branch_list', 'Branch List'),
(535, 'create_branch', 'Create Branch'),
(536, 'branch_name', 'Branch Name'),
(537, 'school_name', 'School Name'),
(538, 'mobile_no', 'Mobile No'),
(539, 'symbol', 'Symbol'),
(540, 'city', 'City'),
(541, 'academic_year', 'Academic Year'),
(542, 'select_branch_first', 'First Select The Branch'),
(543, 'select_class_first', 'Select Class First'),
(544, 'select_country', 'Select Country'),
(545, 'mother_tongue', 'Mother Tongue'),
(546, 'caste', 'Caste'),
(547, 'present_address', 'Present Address'),
(548, 'permanent_address', 'Permanent Address'),
(549, 'profile_picture', 'Profile Picture'),
(550, 'login_details', 'Login Details'),
(551, 'retype_password', 'Retype Password'),
(552, 'occupation', 'Occupation'),
(553, 'income', 'Income'),
(554, 'education', 'Education'),
(555, 'first_select_the_route', 'First Select The Route'),
(556, 'hostel_details', 'Hostel Details'),
(557, 'first_select_the_hostel', 'First Select The Hostel'),
(558, 'previous_school_details', 'Previous School Details'),
(559, 'book_name', 'Book Name'),
(560, 'select_ground', 'Select Ground'),
(561, 'import', 'Import'),
(562, 'add_student_category', 'Add Student Category'),
(563, 'id', 'Id'),
(564, 'edit_category', 'Edit Category'),
(565, 'deactivate_account', 'Deactivate Account'),
(566, 'all_sections', 'All Sections'),
(567, 'authentication_activate', 'Activate Account'),
(568, 'department', 'Department'),
(569, 'salary_grades', 'Salary Grades'),
(570, 'overtime', 'Overtime Rate (Per Hour)'),
(571, 'salary_grade', 'Salary Grade'),
(572, 'payable_type', 'Payable Type'),
(573, 'edit_type', 'Edit Type'),
(574, 'role', 'Role'),
(575, 'remuneration_info_for', 'Remuneration Info For'),
(576, 'salary_paid', 'Salary Paid'),
(577, 'salary_unpaid', 'Salary Unpaid'),
(578, 'pay_now', 'Pay Now'),
(579, 'employee_role', 'Employee Role'),
(580, 'create_at', 'Create At'),
(581, 'select_employee', 'Select Employee'),
(582, 'review', 'Review'),
(583, 'reviewed_by', 'Reviewed By'),
(584, 'submitted_by', 'Submitted By'),
(585, 'employee_type', 'Employee Type'),
(586, 'approved', 'Approved'),
(587, 'unreviewed', 'Unreviewed'),
(588, 'creation_date', 'Creation Date'),
(589, 'no_information_available', 'No Information Available'),
(590, 'continue_to_payment', 'Continue To Payment'),
(591, 'overtime_total_hour', 'Overtime Total Hour'),
(592, 'overtime_amount', 'Overtime Amount'),
(593, 'remarks', 'Remarks'),
(594, 'view', 'View'),
(595, 'leave_appeal', 'Leave Appeal'),
(596, 'create_leave', 'Create Leave'),
(597, 'user_role', 'User Role'),
(598, 'date_of_start', 'Date Of Start'),
(599, 'date_of_end', 'Date Of End'),
(600, 'winner', 'Winner'),
(601, 'select_user', 'Select User'),
(602, 'create_class', 'Create Class'),
(603, 'class_teacher_allocation', 'Class Teacher Allocation'),
(604, 'class_teacher', 'Class Teacher'),
(605, 'create_subject', 'Create Subject'),
(606, 'select_multiple_subject', 'Select Multiple Subject'),
(607, 'teacher_assign', 'Teacher Assign'),
(608, 'teacher_assign_list', 'Teacher Assign List'),
(609, 'select_department_first', 'Select Department First'),
(610, 'create_book', 'Create Book'),
(611, 'book_title', 'Book Title'),
(612, 'cover', 'Cover'),
(613, 'edition', 'Edition'),
(614, 'isbn_no', 'ISBN No'),
(615, 'purchase_date', 'Purchase Date'),
(616, 'cover_image', 'Cover Image'),
(617, 'book_issue', 'Book Issue'),
(618, 'date_of_issue', 'Date Of Issue'),
(619, 'date_of_expiry', 'Date Of Expiry'),
(620, 'select_category_first', 'Select Category First'),
(621, 'type_name', 'Type Name'),
(622, 'type_list', 'Type List'),
(623, 'icon', 'Icon'),
(624, 'event_list', 'Event List'),
(625, 'create_event', 'Create Event'),
(626, 'type', 'Type'),
(627, 'audience', 'Audience'),
(628, 'created_by', 'Created By'),
(629, 'publish', 'Publish'),
(630, 'everybody', 'Everybody'),
(631, 'selected_class', 'Selected Class'),
(632, 'selected_section', 'Selected Section'),
(633, 'information_has_been_updated_successfully', 'Information Has Been Updated Successfully'),
(634, 'create_invoice', 'Create Invoice'),
(635, 'invoice_entry', 'Invoice Entry'),
(636, 'quick_payment', 'Quick Payment'),
(637, 'write_your_remarks', 'Write Your Remarks'),
(638, 'reset', 'Reset'),
(639, 'fees_payment_history', 'Fees Payment History'),
(640, 'fees_summary_report', 'Fees Summary Report'),
(641, 'add_account_group', 'Add Account Group'),
(642, 'account_group', 'Account Group'),
(643, 'account_group_list', 'Account Group List'),
(644, 'mailbox', 'Mailbox'),
(645, 'refresh_mail', 'Refresh Mail'),
(646, 'sender', 'Sender'),
(647, 'general_settings', 'General Settings'),
(648, 'institute_name', 'Institute Name'),
(649, 'institution_code', 'Institution Code'),
(650, 'sms_service_provider', 'Sms Service Provider'),
(651, 'footer_text', 'Footer Text'),
(652, 'payment_control', 'Payment Control'),
(653, 'sms_config', 'Sms Config'),
(654, 'sms_triggers', 'Sms Triggers'),
(655, 'authentication_token', 'Authentication Token'),
(656, 'sender_number', 'Sender Number'),
(657, 'username', 'Username'),
(658, 'api_key', 'Api Key'),
(659, 'authkey', 'Authkey'),
(660, 'sender_id', 'Sender Id'),
(661, 'sender_name', 'Sender Name'),
(662, 'hash_key', 'Hash Key'),
(663, 'notify_enable', 'Notify Enable'),
(664, 'exam_attendance', 'Exam Attendance'),
(665, 'exam_results', 'Exam Results'),
(666, 'email_config', 'Email Config'),
(667, 'email_triggers', 'Email Triggers'),
(668, 'account_registered', 'Account Registered'),
(669, 'forgot_password', 'Forgot Password'),
(670, 'new_message_received', 'New Message Received'),
(671, 'payslip_generated', 'Payslip Generated'),
(672, 'leave_approve', 'Leave Approve'),
(673, 'leave_reject', 'Leave Reject'),
(674, 'advance_salary_approve', 'Reject Leave '),
(675, 'advance_salary_reject', 'Salary Advance Reject'),
(676, 'add_session', 'Add Session'),
(677, 'session', 'Session'),
(678, 'created_at', 'Created At'),
(679, 'sessions', 'Sessions'),
(680, 'flag', 'Flag'),
(681, 'stats', 'Stats'),
(682, 'updated_at', 'Updated At'),
(683, 'flag_icon', 'Flag Icon'),
(684, 'password_restoration', 'Password Restoration'),
(685, 'forgot', 'Forgot'),
(686, 'back_to_login', 'Back To Login'),
(687, 'database_list', 'Database List'),
(688, 'create_backup', 'Create Backup'),
(689, 'backup', 'Backup'),
(690, 'backup_size', 'Backup Size'),
(691, 'file_upload', 'File Upload'),
(692, 'parents_details', 'Parents Details'),
(693, 'social_links', 'Social Links'),
(694, 'create_hostel', 'Create Hostel'),
(695, 'allocation_list', 'Allocation List'),
(696, 'payslip_history', 'Payslip History'),
(697, 'my_attendance_overview', 'My Attendance Overview'),
(698, 'total_present', 'Total Present'),
(699, 'total_absent', 'Total Absent'),
(700, 'total_late', 'Total Late'),
(701, 'class_teacher_list', 'Class Teacher List'),
(702, 'section_control', 'Section Control'),
(703, 'capacity ', 'Capacity'),
(704, 'request', 'Request'),
(705, 'salary_year', 'Salary Year'),
(706, 'create_attachments', 'Create Attachments'),
(707, 'publish_date', 'Publish Date'),
(708, 'attachment_file', 'Attachment File'),
(709, 'age', 'Age'),
(710, 'student_profile', 'Student Profile'),
(711, 'authentication', 'Authentication'),
(712, 'parent_information', 'Parent Information'),
(713, 'full_marks', 'Full Marks'),
(714, 'passing_marks', 'Passing Marks'),
(715, 'highest_marks', 'Highest Marks'),
(716, 'unknown', 'Unknown'),
(717, 'unpublish', 'Unpublish'),
(718, 'login_authentication_deactivate', 'Account Deactivation'),
(719, 'employee_profile', 'Employee Profile'),
(720, 'employee_details', 'Employee Details'),
(721, 'salary_transaction', 'Salary Transaction'),
(722, 'documents', 'Documents'),
(723, 'actions', 'Actions'),
(724, 'activity', 'Activity'),
(725, 'department_list', 'Department List'),
(726, 'manage_employee_salary', 'Manage Employee Salary'),
(727, 'the_configuration_has_been_updated', 'The Configuration Has Been Updated'),
(728, 'add', 'Add'),
(729, 'create_exam', 'Create Exam'),
(730, 'term', 'Term'),
(731, 'add_term', 'Add Term'),
(732, 'create_grade', 'Create Grade'),
(733, 'mark_starting', 'Mark Starting'),
(734, 'mark_until', 'Mark Until'),
(735, 'room_list', 'Room List'),
(736, 'room', 'Room'),
(737, 'route_list', 'Route List'),
(738, 'create_route', 'Create Route'),
(739, 'vehicle_list', 'Vehicle List'),
(740, 'create_vehicle', 'Create Vehicle'),
(741, 'stoppage_list', 'Stoppage List'),
(742, 'create_stoppage', 'Create Stoppage'),
(743, 'stop_time', 'Stop Time'),
(744, 'employee_attendance', 'Employee Attendance'),
(745, 'attendance_report', 'Attendance Report'),
(746, 'opening_balance', 'Opening Balance'),
(747, 'add_opening_balance', 'Add Opening Balance'),
(748, 'credit', 'Credit'),
(749, 'debit', 'Debit'),
(750, 'opening_balance_list', 'Opening Balance List'),
(751, 'voucher_list', 'Voucher List'),
(752, 'voucher_head', 'Voucher Head'),
(753, 'payment_method', 'Payment Method'),
(754, 'credit_ledger_account', 'Credit Ledger Account'),
(755, 'debit_ledger_account', 'Debit Ledger Account'),
(756, 'voucher_no', 'Voucher No'),
(757, 'balance', 'Balance'),
(758, 'event_details', 'Event Details'),
(759, 'welcome_to', 'Welcome To'),
(760, 'report_card', 'Report Card'),
(761, 'online_pay', 'Online Pay'),
(762, 'annual_fees_summary', 'Annual Fees Summary'),
(763, 'my_children', 'My Children'),
(764, 'assigned', 'Assigned'),
(765, 'confirm_password', 'Confirm Password'),
(766, 'searching_results', 'Searching Results'),
(767, 'information_has_been_saved_successfully', 'Information Has Been Saved Successfully'),
(768, 'information_deleted', 'The information has been successfully deleted'),
(769, 'deleted_note', '*Note : This data will be permanently deleted'),
(770, 'are_you_sure', 'Are You Sure?'),
(771, 'delete_this_information', 'Do You Want To Delete This Information?'),
(772, 'yes_continue', 'Yes, Continue'),
(773, 'deleted', 'Deleted'),
(774, 'collect', 'Collect'),
(775, 'school_setting', 'School Setting'),
(776, 'set', 'Set'),
(777, 'quick_view', 'Quick View'),
(778, 'due_fees_invoice', 'Due Fees Invoice'),
(779, 'my_application', 'My Application'),
(780, 'manage_application', 'Manage Application'),
(781, 'leave', 'Leave'),
(782, 'live_class_rooms', 'Live Class Rooms'),
(783, 'homework', 'Homework'),
(784, 'evaluation_report', 'Evaluation Report'),
(785, 'exam_term', 'Exam Term'),
(786, 'distribution', 'Distribution'),
(787, 'exam_setup', 'Exam Setup'),
(788, 'sms', 'Sms'),
(789, 'fees_type', 'Fees Type'),
(790, 'fees_group', 'Fees Group'),
(791, 'fine_setup', 'Fine Setup'),
(792, 'fees_reminder', 'Fees Reminder'),
(793, 'new_deposit', 'New Deposit'),
(794, 'new_expense', 'New Expense'),
(795, 'all_transactions', 'All Transactions'),
(796, 'head', 'Head'),
(797, 'fees_reports', 'Fees Reports'),
(798, 'fees_report', 'Fees Report'),
(799, 'receipts_report', 'Receipts Report'),
(800, 'due_fees_report', 'Due Fees Report'),
(801, 'fine_report', 'Fine Report'),
(802, 'financial_reports', 'Financial Reports'),
(803, 'statement', 'Statement'),
(804, 'repots', 'Repots'),
(805, 'expense', 'Expense'),
(806, 'transitions', 'Transitions'),
(807, 'sheet', 'Sheet'),
(808, 'income_vs_expense', 'Income Vs Expense'),
(809, 'attendance_reports', 'Attendance Reports'),
(810, 'examination', 'Examination'),
(811, 'school_settings', 'School Settings'),
(812, 'role_permission', 'Role Permission'),
(813, 'cron_job', 'Cron Job'),
(814, 'custom_field', 'Custom Field'),
(815, 'enter_valid_email', 'Enter Valid Email'),
(816, 'lessons', 'Lessons'),
(817, 'live_class', 'Live Class'),
(818, 'sl', 'Sl'),
(819, 'meeting_id', 'Meeting ID'),
(820, 'start_time', 'Start Time'),
(821, 'end_time', 'End Time'),
(822, 'zoom_meeting_id', 'Zoom Meeting Id'),
(823, 'zoom_meeting_password', 'Zoom Meeting Password'),
(824, 'time_slot', 'Time Slot'),
(825, 'send_notification_sms', 'Send Notification Sms'),
(826, 'host', 'Host'),
(827, 'school', 'School'),
(828, 'accounting_links', 'Accounting Links'),
(829, 'applicant', 'Applicant'),
(830, 'apply_date', 'Apply Date'),
(831, 'add_leave', 'Add Leave'),
(832, 'leave_date', 'Leave Date'),
(833, 'attachment', 'Attachment'),
(834, 'comments', 'Comments'),
(835, 'staff_id', 'Staff Id'),
(836, 'income_vs_expense_of', 'Income Vs Expense Of'),
(837, 'designation_name', 'Designation Name'),
(838, 'already_taken', 'This %s already exists.'),
(839, 'department_name', 'Department Name'),
(840, 'date_of_birth', 'Date Of Birth'),
(841, 'bulk_delete', 'Bulk Delete'),
(842, 'guardian_name', 'Guardian Name'),
(843, 'fees_progress', 'Fees Progress'),
(844, 'evaluate', 'Evaluate'),
(845, 'date_of_homework', 'Date Of Homework'),
(846, 'date_of_submission', 'Date Of Submission'),
(847, 'student_fees_report', 'Student Fees Report'),
(848, 'student_fees_reports', 'Student Fees Reports'),
(849, 'due_date', 'Due Date'),
(850, 'payment_date', 'Payment Date'),
(851, 'payment_via', 'Payment Via'),
(852, 'generate', 'Generate'),
(853, 'print_date', 'Print Date'),
(854, 'bulk_sms_and_email', 'Bulk Sms And Email'),
(855, 'campaign_type', 'Campaign Type'),
(856, 'both', 'Both'),
(857, 'regular', 'Regular'),
(858, 'Scheduled', 'Scheduled'),
(859, 'campaign', 'Campaign'),
(860, 'campaign_name', 'Campaign Name'),
(861, 'sms_gateway', 'Sms Gateway'),
(862, 'recipients_type', 'Recipients Type'),
(863, 'recipients_count', 'Recipients Count'),
(864, 'body', 'Body'),
(865, 'guardian_already_exist', 'Guardian Already Exist'),
(866, 'guardian', 'Guardian'),
(867, 'mother_name', 'Mother Name'),
(868, 'bank_details', 'Bank Details'),
(869, 'skipped_bank_details', 'Skipped Bank Details'),
(870, 'bank', 'Bank'),
(871, 'holder_name', 'Holder Name'),
(872, 'bank_branch', 'Bank Branch'),
(873, 'custom_field_for', 'Custom Field For'),
(874, 'label', 'Label'),
(875, 'order', 'Order'),
(876, 'online_admission', 'Online Admission'),
(877, 'field_label', 'Field Label'),
(878, 'field_type', 'Field Label'),
(879, 'default_value', 'Default Value'),
(880, 'checked', 'Checked'),
(881, 'unchecked', 'Unchecked'),
(882, 'roll_number', 'Roll Number'),
(883, 'add_rows', 'Add Rows'),
(884, 'salary', 'Salary'),
(885, 'basic', 'Basic'),
(886, 'allowance', 'Allowance'),
(887, 'deduction', 'Deduction'),
(888, 'net', 'Net'),
(889, 'activated_sms_gateway', 'Activated Sms Gateway'),
(890, 'account_sid', 'Account Sid'),
(891, 'roles', 'Roles'),
(892, 'system_role', 'System Role'),
(893, 'permission', 'Permission'),
(894, 'edit_session', 'Edit Session'),
(895, 'transactions', 'Transactions'),
(896, 'default_account', 'Default Account'),
(897, 'deposit', 'Deposit'),
(898, 'acccount', 'Acccount'),
(899, 'role_permission_for', 'Role Permission For'),
(900, 'feature', 'Feature'),
(901, 'access_denied', 'Access Denied'),
(902, 'time_start', 'Time Start'),
(903, 'time_end', 'Time End'),
(904, 'month_of_salary', 'Month Of Salary'),
(905, 'add_documents', 'Add Documents'),
(906, 'document_type', 'Document Type'),
(907, 'document', 'Document'),
(908, 'document_title', 'Document Title'),
(909, 'document_category', 'Document Category'),
(910, 'exam_result', 'Exam Result'),
(911, 'my_annual_fee_summary', 'My Annual Fee Summary'),
(912, 'book_manage', 'Book Manage'),
(913, 'add_leave_category', 'Add Leave Category'),
(914, 'edit_leave_category', 'Edit Leave Category'),
(915, 'staff_role', 'Staff Role'),
(916, 'edit_assign', 'Edit Assign'),
(917, 'view_report', 'View Report'),
(918, 'rank_out_of_5', 'Rank Out Of 5'),
(919, 'hall_no', 'Hall No'),
(920, 'no_of_seats', 'No Of Seats'),
(921, 'mark_distribution', 'Mark Distribution'),
(922, 'exam_type', 'Exam Type'),
(923, 'marks_and_grade', 'Marks And Grade'),
(924, 'min_percentage', 'Min Percentage'),
(925, 'max_percentage', 'Max Percentage'),
(926, 'cost_per_bed', 'Cost Per Bed'),
(927, 'add_category', 'Add Category'),
(928, 'category_for', 'Category For'),
(929, 'start_place', 'Start Place'),
(930, 'stop_place', 'Stop Place'),
(931, 'vehicle', 'Vehicle'),
(932, 'select_multiple_vehicle', 'Select Multiple Vehicle'),
(933, 'book_details', 'Book Details'),
(934, 'issued_by', 'Issued By'),
(935, 'return_by', 'Return By'),
(936, 'group', 'Group'),
(937, 'individual', 'Individual'),
(938, 'recipients', 'Recipients'),
(939, 'group_name', 'Group Name'),
(940, 'fee_code', 'Fee Code'),
(941, 'fine_type', 'Fine Type'),
(942, 'fine_value', 'Fine Value'),
(943, 'late_fee_frequency', 'Late Fee Frequency'),
(944, 'fixed_amount', 'Fixed Amount'),
(945, 'fixed', 'Fixed'),
(946, 'daily', 'Daily'),
(947, 'weekly', 'Weekly'),
(948, 'monthly', 'Monthly'),
(949, 'annually', 'Annually'),
(950, 'first_select_the_group', 'First Select The Group'),
(951, 'percentage', 'Percentage'),
(952, 'value', 'Value'),
(953, 'fee_group', 'Fee Group'),
(954, 'due_invoice', 'Due Invoice'),
(955, 'reminder', 'Reminder'),
(956, 'frequency', 'Frequency'),
(957, 'notify', 'Notify'),
(958, 'before', 'Before'),
(959, 'after', 'After'),
(960, 'number', 'Number'),
(961, 'ref_no', 'Ref No'),
(962, 'pay_via', 'Pay Via'),
(963, 'ref', 'Ref'),
(964, 'dr', 'Dr'),
(965, 'cr', 'Cr'),
(966, 'edit_book', 'Edit Book'),
(967, 'leaves', 'Leaves'),
(968, 'leave_request', 'Leave Request'),
(969, 'this_file_type_is_not_allowed', 'This File Type Is Not Allowed'),
(970, 'error_reading_the_file', 'Error Reading The File'),
(971, 'staff', 'Staff'),
(972, 'waiting', 'Waiting'),
(973, 'live', 'Live'),
(974, 'by', 'By'),
(975, 'host_live_class', 'Host Live Class'),
(976, 'join_live_class', 'Join Live Class'),
(977, 'system_logo', 'System Logo'),
(978, 'text_logo', 'Text Logo'),
(979, 'printing_logo', 'Printing Logo'),
(980, 'expired', 'Expired'),
(981, 'collect_fees', 'Collect Fees'),
(982, 'fees_code', 'Fees Code'),
(983, 'collect_by', 'Collect By'),
(984, 'fee_payment', 'Fee Payment'),
(985, 'write_message', 'Write Message'),
(986, 'discard', 'Discard'),
(987, 'message_sent_successfully', 'Message Sent Successfully'),
(988, 'visit_home_page', 'Visit Home Page'),
(989, 'frontend', 'Frontend'),
(990, 'setting', 'Setting'),
(991, 'menu', 'Menu'),
(992, 'page', 'Page'),
(993, 'manage', 'Manage'),
(994, 'slider', 'Slider'),
(995, 'features', 'Features'),
(996, 'testimonial', 'Testimonial'),
(997, 'service', 'Service'),
(998, 'faq', 'Faq'),
(999, 'card_management', 'Card Management'),
(1000, 'id_card', 'Id Card'),
(1001, 'templete', 'Templete'),
(1002, 'admit_card', 'Admit Card'),
(1003, 'certificate', 'Certificate'),
(1004, 'system_update', 'System Update'),
(1005, 'url', 'Url'),
(1006, 'content', 'Content'),
(1007, 'banner_photo', 'Banner Photo'),
(1008, 'meta', 'Meta'),
(1009, 'keyword', 'Keyword'),
(1010, 'applicable_user', 'Applicable User'),
(1011, 'page_layout', 'Page Layout'),
(1012, 'background', 'Background'),
(1013, 'image', 'Image'),
(1014, 'width', 'Width'),
(1015, 'height', 'Height'),
(1016, 'signature', 'Signature'),
(1017, 'website', 'Website'),
(1018, 'cms', 'Cms'),
(1019, 'url_alias', 'Url Alias'),
(1020, 'cms_frontend', 'Cms Frontend'),
(1021, 'enabled', 'Enabled'),
(1022, 'receive_email_to', 'Receive Email To'),
(1023, 'captcha_status', 'Captcha Status'),
(1024, 'recaptcha_site_key', 'Recaptcha Site Key'),
(1025, 'recaptcha_secret_key', 'Recaptcha Secret Key'),
(1026, 'working_hours', 'Working Hours'),
(1027, 'fav_icon', 'Fav Icon'),
(1028, 'theme', 'Theme'),
(1029, 'fax', 'Fax'),
(1030, 'footer_about_text', 'Footer About Text'),
(1031, 'copyright_text', 'Copyright Text'),
(1032, 'facebook_url', 'Facebook Url'),
(1033, 'twitter_url', 'Twitter Url'),
(1034, 'youtube_url', 'Youtube Url'),
(1035, 'google_plus', 'Google Plus'),
(1036, 'linkedin_url', 'Linkedin Url'),
(1037, 'pinterest_url', 'Pinterest Url'),
(1038, 'instagram_url', 'Instagram Url'),
(1039, 'play', 'Play'),
(1040, 'video', 'Video'),
(1041, 'usename', 'Usename'),
(1042, 'experience_details', 'Experience Details'),
(1043, 'total_experience', 'Total Experience'),
(1044, 'class_schedule', 'Time Table'),
(1045, 'cms_default_branch', 'Cms Default Branch'),
(1046, 'website_page', 'Website Page'),
(1047, 'welcome', 'Welcome'),
(1048, 'services', 'Services'),
(1049, 'call_to_action_section', 'Call To Action Section'),
(1050, 'subtitle', 'Subtitle'),
(1051, 'cta', 'Cta'),
(1052, 'button_text', 'Button Text'),
(1053, 'button_url', 'Button Url'),
(1054, '_title', ' Title'),
(1055, 'contact', 'Contact'),
(1056, 'box_title', 'Box Title'),
(1057, 'box_description', 'Box Description'),
(1058, 'box_photo', 'Box Photo'),
(1059, 'form_title', 'Form Title'),
(1060, 'submit_button_text', 'Submit Button Text'),
(1061, 'map_iframe', 'Map Iframe'),
(1062, 'email_subject', 'Email Subject'),
(1063, 'prefix', 'Prefix'),
(1064, 'surname', 'Surname'),
(1065, 'rank', 'Rank'),
(1066, 'submit', 'Submit'),
(1067, 'certificate_name', 'Certificate Name'),
(1068, 'layout_width', 'Layout Width'),
(1069, 'layout_height', 'Layout Height'),
(1070, 'expiry_date', 'Expiry Date'),
(1071, 'position', 'Position'),
(1072, 'target_new_window', 'Target New Window'),
(1073, 'external_url', 'External Url'),
(1074, 'external_link', 'External Link'),
(1075, 'sms_notification', 'Sms Notification'),
(1076, 'scheduled_at', 'Scheduled At'),
(1077, 'published', 'Published'),
(1078, 'unpublished_on_website', 'Unpublished On Website'),
(1079, 'published_on_website', 'Published On Website'),
(1080, 'no_selection_available', 'No Selection Available'),
(1081, 'select_for_everyone', 'Select For Everyone'),
(1082, 'teacher_restricted', 'Teacher Restricted'),
(1083, 'guardian_relation', 'Guardian Relation'),
(1084, 'username_prefix', 'Username Prefix'),
(1085, 'default_password', 'Default Password'),
(1086, 'parents_profile', 'Parents Profile'),
(1087, 'childs', 'Ward(s)'),
(1088, 'page_title', 'Page Title'),
(1089, 'select_menu', 'Select Menu'),
(1090, 'meta_keyword', 'Meta Keyword'),
(1091, 'meta_description', 'Meta Description'),
(1092, 'evaluation_date', 'Evaluation Date'),
(1093, 'evaluated_by', 'Evaluated By'),
(1094, 'complete', 'Complete'),
(1095, 'incomplete', 'Incomplete'),
(1096, 'payment_details', 'Payment Details'),
(1097, 'edit_attachments', 'Edit Attachments'),
(1098, 'live_classes', 'Live Classes'),
(1099, 'duration', 'Duration'),
(1100, 'metting_id', 'Metting Id'),
(1101, 'set_record', 'Set Record'),
(1102, 'set_mute_on_start', 'Set Mute On Start'),
(1103, 'button_text_1', 'Button Text 1'),
(1104, 'button_url_1', 'Button Url 1'),
(1105, 'button_text_2', 'Button Text 2'),
(1106, 'button_url_2', 'Button Url 2'),
(1107, 'left', 'Left'),
(1108, 'center', 'Center'),
(1109, 'right', 'Right'),
(1110, 'about', 'About'),
(1111, 'about_photo', 'About Photo'),
(1112, 'parallax_photo', 'Parallax Photo'),
(1113, 'decline', 'Decline'),
(1114, 'edit_grade', 'Edit Grade'),
(1115, 'mark', 'Mark'),
(1116, 'hall_room', 'Hall Room'),
(1117, 'student_promotion', 'Student Promotion'),
(1118, 'username_has_already_been_used', 'Username Has Already Been Used'),
(1119, 'fee_collection', 'Fee Collection'),
(1120, 'not_found_anything', 'Not Found Anything'),
(1121, 'preloader_backend', 'Preloader Backend'),
(1122, 'ive_class_method', 'Ive Class Method'),
(1123, 'live_class_method', 'Live Class Method'),
(1124, 'api_credential', 'Api Credential'),
(1125, 'translation_update', 'Translation Update'),
(1126, ' live_class_reports', ' Live Class Reports'),
(1127, 'live_class_reports', 'Live Class Reports'),
(1128, 'all', 'All'),
(1129, 'student_participation_report', 'Student Participation Report'),
(1130, 'joining_time', 'Joining Time'),
(1131, 'inventory', 'Inventory'),
(1132, 'product', 'Product'),
(1133, 'store', 'Store'),
(1134, 'supplier', 'Supplier'),
(1135, 'unit', 'Unit'),
(1136, 'purchase', 'Purchase'),
(1137, 'sales', 'Sales'),
(1138, 'issue', 'Issue'),
(1139, 'gallery', 'Gallery'),
(1140, 'news', 'News'),
(1141, 'reception', 'Reception'),
(1142, 'admission_enquiry', 'Admission Enquiry'),
(1143, 'postal_record', 'Postal Record'),
(1144, 'call_log', 'Call Log'),
(1145, 'visitor_log', 'Visitor Log'),
(1146, 'complaint', 'Complaint'),
(1147, 'multi_class', 'Multi Class'),
(1148, 'deactivate_reason', 'Deactivate Reason'),
(1149, 'marksheet', 'Report Card'),
(1150, 'generate_position', 'Generate Position'),
(1151, 'online_exam', 'CBT Exam'),
(1152, 'question_bank', 'Question Bank'),
(1153, 'question_group', 'Question Group'),
(1154, 'subject_wise', 'Subject Wise'),
(1155, 'my_issued_book', 'My Issued Book'),
(1156, 'book_issue/return', 'Book Issue/return'),
(1157, 'offline_payments', 'Offline Payments'),
(1158, 'payments', 'Payments'),
(1159, ' offline_payments', ' Offline Payments'),
(1160, 'login_credential', 'Login Credential'),
(1161, 'admission_report', 'Admission Report'),
(1162, 'class_&_section_report', 'Class & Section Report'),
(1163, 'sibling_report', 'Sibling Report'),
(1164, 'daily_reports', 'Daily Reports'),
(1165, 'overview_reports', 'Overview Reports'),
(1166, 'subject_wise_reports', 'Subject Wise Reports'),
(1167, 'subject_wise_by', 'Subject Wise By'),
(1168, 'progress', 'Progress'),
(1169, 'stock', 'Stock'),
(1170, 'issues', 'Issues'),
(1171, 'alumni', 'Alumni'),
(1172, 'manage_alumni', 'Manage Alumni'),
(1173, 'addon_manager', 'Addon Manager'),
(1174, 'modules', 'Modules'),
(1175, 'system_student_field', 'System Student Field'),
(1176, 'user_login_log', 'User Login Log'),
(1177, 'may', 'May'),
(1178, 'today_birthday', 'Today Birthday'),
(1179, 'addon', 'Addon'),
(1180, 'install', 'Install'),
(1181, 'version', 'Version'),
(1182, 'installed', 'Installed'),
(1183, 'last_upgrade', 'Last Upgrade'),
(1184, 'addon_purchase_code', 'Addon Purchase Code'),
(1185, 'install_now', 'Install Now'),
(1186, 'purchase_code', 'Purchase Code'),
(1187, 'months', 'Months'),
(1188, 'years', 'Years'),
(1189, 'lifetime', 'Lifetime'),
(1190, 'home', 'Home'),
(1191, 'pricing', 'Pricing'),
(1192, 'school_subscription', 'School Subscription'),
(1193, 'subscription', 'Subscription'),
(1194, 'pending_request', 'Pending Request'),
(1195, 'custom_domain', 'Custom Domain'),
(1196, 'plan', 'Plan'),
(1197, 'general', 'General'),
(1198, 'automatic_subscription_approval', 'Automatic Subscription Approval'),
(1199, 'alert_setting', 'Alert Setting'),
(1200, 'expired_alert', 'Expired Alert'),
(1201, 'expired_alert_days', 'Expired Alert Days'),
(1202, 'expired_reminder_message', 'Expired Reminder Message'),
(1203, 'expired_message', 'Expired Message'),
(1204, 'seo', 'Seo'),
(1205, 'site', 'Site'),
(1206, 'google_analytics', 'Google Analytics'),
(1207, 'school_registered', 'School Registered'),
(1208, 'school_subscription_payment_confirmation', 'School Subscription Payment Confirmation'),
(1209, 'school_subscription_approval_confirmation', 'School Subscription Approval Confirmation'),
(1210, 'school_subscription_reject', 'School Subscription Reject'),
(1211, 'qr_code', 'Qr Code'),
(1212, 'february', 'February'),
(1213, 'currency_formats', 'Currency Formats'),
(1214, 'symbol_position', 'Symbol Position'),
(1215, 'enable_subscription', 'Enable Subscription'),
(1216, 'enabled_subscription', 'Enabled Subscription'),
(1217, 'addon_update', 'Addon Update'),
(1218, 'active', 'Active'),
(1219, 'clear_userlog', 'Clear Userlog'),
(1220, 'browser', 'Browser'),
(1221, 'login_date_time', 'Login Date Time'),
(1222, 'platform', 'Platform'),
(1223, 'whatsapp_settings', 'Whatsapp Settings'),
(1224, 'general_setting', 'General Setting'),
(1225, 'weekends', 'Weekends'),
(1226, 'sunday', 'Sunday'),
(1227, 'monday', 'Monday'),
(1228, 'tuesday', 'Tuesday'),
(1229, 'wednesday', 'Wednesday'),
(1230, 'thursday', 'Thursday'),
(1231, 'friday', 'Friday'),
(1232, 'saturday', 'Saturday'),
(1233, 'select_weekends', 'Select Weekends'),
(1234, 'unique_roll', 'Unique Roll'),
(1235, 'classes_wise', 'Classes Wise'),
(1236, 'section_wise', 'Section Wise'),
(1237, 'start_from', 'Start From'),
(1238, 'digit', 'Digit'),
(1239, 'fees_carry_forward_setting', 'Fees Carry Forward Setting'),
(1240, 'due_days', 'Due Days'),
(1241, 'due_fees_calculation_with_fine_', 'Due Fees Calculation With Fine '),
(1242, 'day_wise', 'Day Wise'),
(1243, 'header_title', 'Header Title'),
(1244, 'frontend_enable_chat', 'Frontend Enable Chat'),
(1245, 'backend_enable_chat', 'Backend Enable Chat'),
(1246, 'whatsapp_agent', 'Whatsapp Agent'),
(1247, 'agent', 'Agent'),
(1248, 'whataspp_number', 'Whataspp Number'),
(1249, 'weekend', 'Weekend'),
(1250, 'apply_online_admission', 'Apply Online Admission'),
(1251, 'email_pdf_exam_marksheet', 'Email Pdf Exam Marksheet'),
(1252, 'email_pdf_fee_invoice', 'Email Pdf Fee Invoice'),
(1253, 'zoom_credentials', 'Zoom Credentials'),
(1254, 'set_zoom_redirect_url', 'Set Zoom Redirect Url'),
(1255, 'student_parent_panel', 'Student Parent Panel'),
(1256, 'privacy', 'Privacy'),
(1257, 'website_settings', 'Website Settings'),
(1258, 'overly_image', 'Overly Image'),
(1259, 'receive_contact_email', 'Receive Contact Email'),
(1260, 'footer', 'Footer'),
(1261, 'footer_copyright_text', 'Footer Copyright Text'),
(1262, 'terms_and_conditions', 'Terms And Conditions'),
(1263, 'agree_checkbox', 'Agree Checkbox'),
(1264, 'text', 'Text'),
(1265, 'domain', 'Domain'),
(1266, 'instruction', 'Instruction'),
(1267, 'origin_url', 'Origin Url'),
(1268, 'domain_type', 'Domain Type'),
(1269, 'request_date', 'Request Date'),
(1270, 'approved_date', 'Approved Date'),
(1271, 'approve_the_domain_request', 'Approve The Domain Request'),
(1272, 'inactive', 'Inactive'),
(1273, 'yearly', 'Yearly'),
(1274, 'package', 'Package'),
(1275, 'preiod', 'Preiod'),
(1276, 'show_website', 'Show Website'),
(1277, 'recommended', 'Recommended'),
(1278, 'limit', 'Limit'),
(1279, 'period', 'Period'),
(1280, 'reference_no', 'Reference No'),
(1281, 'admin_name', 'Admin Name'),
(1282, 'contact_number', 'Contact Number'),
(1283, 'payment_status', 'Payment Status'),
(1284, 'subscribed', 'Subscribed'),
(1285, 'edit_branch', 'Edit Branch'),
(1286, 'statistics', 'Statistics'),
(1287, 'employees', 'Employees'),
(1288, 'classes', 'Classes'),
(1289, 'thumb_image', 'Thumb Image'),
(1290, 'uploaded', 'Uploaded'),
(1291, 'guardian_picture', 'Guardian Picture'),
(1292, 'fields', 'Fields'),
(1293, 'store_code', 'Store Code'),
(1294, 'passing_session', 'Passing Session'),
(1295, 'profession', 'Profession'),
(1296, 'create_section', 'Create Section'),
(1297, 'section_list', 'Section List'),
(1298, 'promotion_history', 'Promotion History'),
(1299, 'from_class', 'From Class'),
(1300, 'from_session', 'From Session'),
(1301, 'promoted_class', 'Promoted Class'),
(1302, 'promoted_session', 'Promoted Session'),
(1303, 'promoted_date', 'Promoted Date'),
(1304, 'teachers_list', 'Teachers List'),
(1305, 'questions_qty', 'Questions Qty'),
(1306, 'exam_status', 'Exam Status'),
(1307, 'no_fees_have_been_allocated', 'No Fees Have Been Allocated'),
(1308, 'my_child', 'My Child'),
(1309, 'hostels', 'Hostels'),
(1310, 'there_is_no_room_allocation', 'There Is No Room Allocation'),
(1311, 'room_category', 'Room Category'),
(1312, 'limits_of_participation', 'Number of Attempts'),
(1313, 'passing_mark', 'Passing Mark'),
(1314, 'free', 'Free'),
(1315, 'question', 'Question'),
(1316, 'random', 'Random'),
(1317, 'result_publish', 'Result Publish'),
(1318, 'negative_mark', 'Negative Mark'),
(1319, 'applicable', 'Applicable'),
(1320, 'marks_display', 'Marks Display'),
(1321, 'make', 'Make'),
(1322, 'level', 'Level'),
(1323, 'single_choice', 'Single Choice'),
(1324, 'multiple_choice', 'Multiple Choice'),
(1325, 'true/false', 'True/false'),
(1326, 'descriptive', 'Descriptive'),
(1327, 'easy', 'Easy'),
(1328, 'medium', 'Medium'),
(1329, 'hard', 'Hard'),
(1330, 'confidential', 'Confidential'),
(1331, 'dispatch', 'Dispatch'),
(1332, 'receive', 'Receive'),
(1333, 'note', 'Note'),
(1334, 'reference', 'Reference'),
(1335, 'response', 'Response'),
(1336, 'calling_purpose', 'Calling Purpose'),
(1337, 'visiting_purpose', 'Visiting Purpose'),
(1338, 'fields_setting', 'Fields Setting'),
(1339, 'terms_conditions', 'Terms Conditions'),
(1340, 'online_addmission', 'Online Addmission'),
(1341, 'fee', 'Fee'),
(1342, 'pay', 'Pay'),
(1343, 'under_review', 'Under Review'),
(1344, 'approved_and_enroll', 'Approved And Enroll'),
(1345, 'exploring', 'Exploring'),
(1346, 'add_class', 'Add Class'),
(1347, 'sibling_information', 'Sibling Information'),
(1348, 'disable_reason', 'Disable Reason'),
(1349, 'with_fine', 'With Fine'),
(1350, 'no_row_are_selected', 'No Row Are Selected'),
(1351, 'the_next_session_was_transferred_to_the_students', 'Promote Student(s)'),
(1352, 'promote_to_session', 'Promote To Session'),
(1353, 'promote_to_class', 'Promote To Class'),
(1354, 'promote_to_section', 'Promote To Section'),
(1355, 'mark_summary', 'Mark Summary'),
(1356, 'current_due_amount', 'Current Due Amount'),
(1357, 'running', 'Demote'),
(1358, 'promoted', 'Promote'),
(1359, 'middle', 'Middle'),
(1360, 'header', 'Header'),
(1361, 'grading_scale', 'Grading Scale'),
(1362, 'cumulative', 'Cumulative'),
(1363, 'remark', 'Remark'),
(1364, 'publish_result', 'Publish Result');
INSERT INTO `languages` (`id`, `word`, `english`) VALUES
(1365, 'half_day', 'Half Day'),
(1366, 'class_position', 'Class Position'),
(1367, 'advance_salary_request', 'Salary Advance Request'),
(1368, 'instructions', 'Instructions'),
(1369, 'suspended', 'Suspended'),
(1370, 'trx_id', 'Trx Id'),
(1371, 'submit_date', 'Submit Date'),
(1372, 'change', 'Change'),
(1373, 'admission_reports', 'Admission Reports'),
(1374, 'class_&_section', 'Class & Section'),
(1375, 'event', 'Event'),
(1376, 'send_confirmation_sms', 'Send Confirmation Sms'),
(1377, 'code', 'Code'),
(1378, 'purchase_unit', 'Purchase Unit'),
(1379, 'sale_unit', 'Sale Unit'),
(1380, 'unit_ratio', 'Unit Ratio'),
(1381, 'purchase_price', 'Purchase Price'),
(1382, 'sales_price', 'Sales Price'),
(1383, 'sales_unit', 'Sales Unit'),
(1384, 'company_name', 'Company Name'),
(1385, 'bill_no', 'Bill No'),
(1386, 'payable', 'Payable'),
(1387, 'ordered', 'Ordered'),
(1388, 'received', 'Received'),
(1389, 'add_products_to_stock_list', 'Add Products To Stock List'),
(1390, 'sale_to', 'Sale To'),
(1391, 'bill', 'Bill'),
(1392, 'summary', 'Summary'),
(1393, 'sub_total', 'Sub Total'),
(1394, 'enter_payment_amount', 'Enter Payment Amount'),
(1395, 'issue_to', 'Issue To'),
(1396, 'enquiry', 'Enquiry'),
(1397, 'next', 'Next'),
(1398, 'follow_up', 'Follow Up'),
(1399, 'previous_school', 'Previous School'),
(1400, 'no_of_child', 'No Of Child'),
(1401, 'class_applying_for', 'Class Applying For'),
(1402, 'call_type', 'Call Type'),
(1403, 'outgoing', 'Outgoing'),
(1404, 'incoming', 'Incoming'),
(1405, 'complainant', 'Complainant'),
(1406, 'date_of_solution', 'Date Of Solution'),
(1407, 'assign_to', 'Assign To'),
(1408, 'action_taken', 'Action Taken'),
(1409, 'visitor', 'Visitor'),
(1410, 'entry_time', 'Entry Time'),
(1411, 'exit_time', 'Exit Time'),
(1412, 'number_of_visitor', 'Number Of Visitor'),
(1413, 'token/pass', 'Token/pass'),
(1414, 'id_number', 'Id Number'),
(1415, 'password_has_been_changed', 'Password Has Been Changed'),
(1416, 'online_exam_publish', 'Online Exam Publish'),
(1417, 'student_birthday_wishes', 'Student Birthday Wishes'),
(1418, 'staff_birthday_wishes', 'Staff Birthday Wishes'),
(1419, 'alumni_event', 'Alumni Event'),
(1420, 'file_size_shoud_be_less_than', 'File Size Shoud Be Less Than'),
(1421, 'post_code', 'Post Code'),
(1422, 'restore', 'Restore'),
(1423, 'delete_forever', 'Delete Forever'),
(1424, 'recent', 'Recent'),
(1425, 'information', 'Information'),
(1426, 'audition', 'Audition'),
(1427, 'image_extension', 'Image Extension'),
(1428, 'image_size', 'Image Size'),
(1429, 'file_extension', 'File Extension'),
(1430, 'file_size', 'File Size'),
(1431, 'deactivated', 'Deactivated'),
(1432, 'history', 'History'),
(1433, 'question_level', 'Question Level'),
(1434, 'answer', 'Answer'),
(1435, 'true', 'True'),
(1436, 'false', 'False'),
(1437, 'assignments', 'Assignments'),
(1438, 'belongs_to', 'Belongs To'),
(1439, 'bs_column', 'Bs Column'),
(1440, 'field_order', 'Field Order'),
(1441, 'count', 'Count'),
(1442, 'progress_reports', 'Progress Reports'),
(1443, 'something_went_wrong', 'Something Went Wrong'),
(1444, 'selected_revert', 'Selected Revert'),
(1445, 'edit_event', 'Edit Event'),
(1446, 'fees_pay_now', 'Fees Pay Now'),
(1447, 'date_of_payment', 'Date Of Payment'),
(1448, 'total_payable', 'Total Payable'),
(1449, 'proof_of_payment', 'Proof Of Payment'),
(1450, 'quantity', 'Quantity'),
(1451, 'net_total', 'Net Total'),
(1452, 'first_select_the_category', 'First Select The Category'),
(1453, 'parent_menu', 'Parent Menu'),
(1454, 'no_sms_gateway_available', 'No Sms Gateway Available'),
(1455, 'assignment', 'Assignment'),
(1456, 'set_parameters_to_quickly_create_schedule', 'Set Parameters To Quickly Create Schedule'),
(1457, 'starting_date', 'Starting Date'),
(1458, 'interval', 'Interval'),
(1459, 'exam_rank', 'Exam Rank'),
(1460, 'principal_comments', 'Principal Comments'),
(1461, 'teacher_comments', 'Teacher Comments'),
(1462, 'background_file', 'Background File'),
(1463, 'invalid_marks', 'Invalid Marks'),
(1464, 'previous_position', 'Previous Position'),
(1465, 'mark_from', 'Mark From'),
(1466, 'mark_upto', 'Mark Upto'),
(1467, 'mark_type', 'Mark Type'),
(1468, 'question_type', 'Question Type'),
(1469, 'add_questions', 'Add Questions'),
(1470, 'total_attempt', 'Total Attempt'),
(1471, 'current_password_is_invalid', 'Current Password Is Invalid'),
(1472, 'closed', 'Closed'),
(1473, 'take_exam', 'Take Exam'),
(1474, 'your', 'Your'),
(1475, 'start_exam', 'Start Exam'),
(1476, 'remain_time', 'Remain Time'),
(1477, 'total_questions_map', 'Total Questions Map'),
(1478, 'your_exam_has_been_successfully_submitted', 'Your Exam Has Been Successfully Submitted'),
(1479, 'already_submitted', 'Already Submitted'),
(1480, 'no_questions_have_been_assigned', 'No Questions Have Been Assigned'),
(1481, 'score', 'Score'),
(1482, 'failed', 'Failed'),
(1483, 'not_generated', 'Not Generated'),
(1484, 'total_answered', 'Total Answered'),
(1485, 'total_obtain_mark', 'Total Obtain Mark'),
(1486, 'correct_answer', 'Correct Answer'),
(1487, 'incorrect_answer', 'Incorrect Answer'),
(1488, 'result_published', 'Result Published'),
(1489, 'student search', 'Student Search'),
(1490, 'admit_new_student', 'Admit New Student'),
(1491, 'staff_attendance', 'Staff Attendance'),
(1492, 'new_event', 'New Event'),
(1493, 'exam_schedule', 'Exam Schedule'),
(1494, 'promote_student', 'Promote Student'),
(1495, 'total_fees_allocated', 'Total Fees Allocated'),
(1496, 'total_fees_paid', 'Total Fees Paid'),
(1497, 'total_outstanding_fees', 'Total Outstanding Fees'),
(1498, 'payment_progress', 'Payment Progress'),
(1499, 'approve_payments', 'Approve Payments'),
(1500, 'record_payment', 'Record Payment'),
(1501, 'income_&_expense_for', 'Income & Expense For'),
(1502, 'march', 'March'),
(1503, 'expenses', 'Expenses'),
(1504, 'transaction_history', 'Transaction History'),
(1505, 'record_expense', 'Record Expense'),
(1506, 'view_profile', 'View Profile'),
(1507, 'switch_child', 'Switch Child'),
(1508, 'pay_fees', 'Pay Fees'),
(1509, 'attendance_summary', 'Attendance Summary'),
(1510, 'present_days', 'Present Days'),
(1511, 'absent_days', 'Absent Days'),
(1512, 'late_days', 'Late Days'),
(1513, 'view_attendance_details', 'View Attendance Details'),
(1514, 'total_students', 'Total Students'),
(1515, 'total_parents', 'Total Parents'),
(1516, 'total_employee', 'Total Employee'),
(1517, 'this_month', 'This Month'),
(1518, 'salary_advance', 'Salary Advance'),
(1519, '', ''),
(1520, 'send_wishes', 'Send Wishes'),
(1521, 'new_deposite', 'New Deposite'),
(1522, 'overdue_fees', 'Overdue Fees'),
(1523, 'balance_sheet', 'Balance Sheet'),
(1524, 'paid_via', 'Paid Via'),
(1525, 'sn', 'Sn'),
(1526, 'frontend_new', 'Frontend New'),
(1527, 'frontend_news', 'Frontend News'),
(1528, 'view_transaction_history', 'View Transaction History'),
(1529, 'record_income', 'Record Income'),
(1530, 'edit_profile', 'Edit Profile'),
(1531, 'recent_transactions', 'Recent Transactions'),
(1532, 'view_student_celebrants', 'View Student Celebrants'),
(1533, 'view_staff_celebrants', 'View Staff Celebrants'),
(1534, 'Admission Number', 'Admission Number'),
(1535, 'admission_no', 'Admission No'),
(1536, 'reg_no', 'Reg No'),
(1537, 'attendance_for', 'Attendance For'),
(1538, 'school_dashboard', 'School Dashboard'),
(1539, 'april', 'April'),
(1540, 'default_template', 'Default Template'),
(1541, 'Search by Reg. No., Name or Email', 'Search By Reg. No., Name Or Email'),
(1542, 'enroll_student', 'Enroll Student'),
(1543, 'population_by_class', 'Population By Class'),
(1544, 'weekly_attendance_chart', 'Weekly Attendance Chart'),
(1545, 'enroll_person', 'Enroll Person'),
(1546, 'take_attendance', 'Take Attendance'),
(1547, 'class_time_table', 'Class Time Table'),
(1548, 'my_schedule', 'My Schedule');

-- --------------------------------------------------------

--
-- Table structure for table `language_list`
--

CREATE TABLE `language_list` (
  `id` int(11) NOT NULL,
  `name` varchar(600) NOT NULL,
  `lang_field` varchar(600) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `language_list`
--

INSERT INTO `language_list` (`id`, `name`, `lang_field`, `status`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'english', 1, 0, '2018-11-15 10:36:31', '2025-02-15 22:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

CREATE TABLE `leave_application` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `reason` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `leave_days` varchar(20) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1=pending,2=accepted 3=rejected',
  `apply_date` date DEFAULT NULL,
  `approved_by` int(11) NOT NULL,
  `orig_file_name` varchar(255) NOT NULL,
  `enc_file_name` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_category`
--

CREATE TABLE `leave_category` (
  `id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `role_id` tinyint(1) NOT NULL,
  `days` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_class`
--

CREATE TABLE `live_class` (
  `id` int(11) NOT NULL,
  `live_class_method` tinyint(1) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `meeting_id` varchar(255) NOT NULL,
  `meeting_password` varchar(255) NOT NULL,
  `own_api_key` tinyint(1) NOT NULL DEFAULT 0,
  `duration` int(11) NOT NULL,
  `bbb` longtext NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` text NOT NULL,
  `remarks` text NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_by` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_class_config`
--

CREATE TABLE `live_class_config` (
  `id` int(11) NOT NULL,
  `zoom_api_key` varchar(255) DEFAULT NULL,
  `zoom_api_secret` varchar(255) DEFAULT NULL,
  `bbb_salt_key` varchar(355) DEFAULT NULL,
  `bbb_server_base_url` varchar(355) DEFAULT NULL,
  `staff_api_credential` tinyint(1) NOT NULL DEFAULT 0,
  `student_api_credential` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_class_reports`
--

CREATE TABLE `live_class_reports` (
  `id` int(11) NOT NULL,
  `live_class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_credential`
--

CREATE TABLE `login_credential` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` tinyint(4) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1(active) 0(deactivate)',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `login_credential`
--

INSERT INTO `login_credential` (`id`, `user_id`, `username`, `password`, `role`, `active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 1, 'sakingbe', '$2y$10$1bkU0I5hzxOSgNCKPkY8eeAaXfJhcInbljgSUNRiQs1LZIQ35tqua', 1, 1, '2025-05-19 15:42:32', '2024-05-27 01:58:46', NULL),
(2, 1, 'prt1', '$2y$10$g9iWY.RXAEUklYu9HkvvbesQdKINeHlaAxEIFYP3w2OgQssw8pY4C', 6, 1, '2025-02-07 07:24:53', '2025-02-07 18:19:35', NULL),
(3, 1, 'sman', '$2y$10$cWiy5uN4u1giOGt0.F2wCORWpZ1A0c.TAJuwa6HW1hyVQPxPTC7kq', 7, 1, '2025-02-07 07:24:32', '2025-02-07 18:21:36', NULL),
(4, 2, 'mrteacher', '$2y$10$y.SRNz.pp53yKP6G/nZNSOldLlphZeWZAJjLByHtTUzQftZv5F3WC', 3, 1, '2025-05-19 15:41:04', '2025-02-08 09:38:54', NULL),
(5, 2, 'PTR1', '$2y$10$0I55r7HtAl6rJKf6OYtd6e10AiJX19.8H4xnedMQvJUwsD.jWQJze', 6, 1, '2025-04-02 09:15:58', '2025-02-08 16:35:01', NULL),
(6, 2, 'ST1', '$2y$10$vY77aE/Mt2k1km2N6u86wOi2xsnruNQSWfu7kBnyaXLnWC/6VTr2i', 7, 1, '2025-04-02 09:56:41', '2025-02-08 16:35:01', NULL),
(7, 3, 'acc1', '$2y$10$PEx0tqsma7gdWVC2sUPNy.Mrv/UtUmGMjZkGhyYaAGgAEEQB/Pa/O', 4, 1, '2025-03-30 03:14:41', '2025-02-08 20:25:54', NULL),
(8, 4, 'admin1', '$2y$10$OeZsnv4x1ZztAFFd2dlGSuztbIrbwDd9HFMSHTBzfxnDH0H3h9I6a', 2, 1, '2025-04-02 10:21:26', '2025-02-09 05:32:45', NULL),
(9, 3, 'Std1', '$2y$10$zzk1vnjvH/Xw2KoGeD7Uc.RIr.qOBEiEgpyqp43HDPV571swwYt6S', 7, 1, '2025-02-15 00:27:06', '2025-02-13 12:23:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_log`
--

CREATE TABLE `login_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `login_log`
--

INSERT INTO `login_log` (`id`, `user_id`, `role`, `ip`, `browser`, `platform`, `timestamp`, `branch_id`) VALUES
(1, 1, 1, '73.235.191.99', 'Chrome 124.0.0.0', 'Mac OS X', '2024-05-26 14:58:57', NULL),
(2, 1, 1, '14.231.72.213', 'Chrome 124.0.0.0', 'Mac OS X', '2024-05-26 15:09:56', NULL),
(3, 1, 1, '116.96.44.166', 'Chrome 124.0.0.0', 'Mac OS X', '2024-05-29 13:57:07', NULL),
(4, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-02 10:11:04', NULL),
(5, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-02 10:16:02', NULL),
(6, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-02 10:23:51', NULL),
(7, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-02 10:52:16', NULL),
(8, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-03 07:08:42', NULL),
(9, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-03 07:25:14', NULL),
(10, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-03 07:44:29', NULL),
(11, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-03 07:51:24', NULL),
(12, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-03 08:12:45', NULL),
(13, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-03 08:13:43', NULL),
(14, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-03 08:41:37', NULL),
(15, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-04 05:25:33', NULL),
(16, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-04 05:34:42', NULL),
(17, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-04 18:06:13', NULL),
(18, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-04 18:40:36', NULL),
(19, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-05 07:24:26', NULL),
(20, 1, 1, '105.112.178.182', 'Chrome 132.0.0.0', 'Android', '2025-02-05 17:57:07', NULL),
(21, 1, 1, '105.112.184.254', 'Chrome 132.0.0.0', 'Android', '2025-02-06 05:43:52', NULL),
(22, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 01:54:34', NULL),
(23, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 02:00:27', NULL),
(24, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 02:35:03', NULL),
(25, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 03:22:56', NULL),
(26, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 03:33:49', NULL),
(27, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 03:45:42', NULL),
(28, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 03:51:33', NULL),
(29, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 03:54:46', NULL),
(30, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 03:59:11', NULL),
(31, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 06:17:30', NULL),
(32, 1, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 06:21:54', 1),
(33, 1, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 06:24:32', 1),
(34, 1, 6, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 06:24:53', 1),
(35, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 06:39:06', NULL),
(36, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 18:27:26', NULL),
(37, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 19:39:05', NULL),
(38, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-07 19:55:11', NULL),
(39, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 00:17:30', NULL),
(40, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 04:18:47', NULL),
(41, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 06:28:12', NULL),
(42, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 06:29:06', NULL),
(43, 3, 4, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 08:26:38', 1),
(44, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 08:31:09', NULL),
(45, 3, 4, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 08:41:43', 1),
(46, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 08:45:26', NULL),
(47, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 08:49:10', NULL),
(48, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-08 08:53:11', NULL),
(49, 1, 1, '105.113.57.10', 'Chrome 132.0.0.0', 'Android', '2025-02-08 10:00:28', NULL),
(50, 1, 1, '105.113.57.10', 'Chrome 132.0.0.0', 'Android', '2025-02-08 10:01:31', NULL),
(51, 1, 1, '93.190.138.195', 'Chrome 132.0.0.0', 'Android', '2025-02-08 10:03:44', NULL),
(52, 1, 1, '105.113.57.10', 'Chrome 132.0.0.0', 'Android', '2025-02-08 17:25:25', NULL),
(53, 1, 1, '105.113.57.10', 'Chrome 132.0.0.0', 'Android', '2025-02-08 17:30:07', NULL),
(54, 4, 2, '105.113.57.10', 'Chrome 132.0.0.0', 'Android', '2025-02-08 17:33:09', 1),
(55, 1, 1, '105.113.57.10', 'Chrome 132.0.0.0', 'Android', '2025-02-08 17:33:37', NULL),
(56, 4, 2, '105.113.57.10', 'Chrome 132.0.0.0', 'Android', '2025-02-08 17:56:02', 1),
(57, 1, 1, '105.113.57.10', 'Chrome 132.0.0.0', 'Android', '2025-02-08 18:03:06', NULL),
(58, 1, 1, '105.113.102.155', 'Chrome 132.0.0.0', 'Android', '2025-02-09 05:31:33', NULL),
(59, 1, 1, '105.113.111.5', 'Chrome 132.0.0.0', 'Android', '2025-02-09 16:52:50', NULL),
(60, 4, 2, '105.113.111.5', 'Chrome 132.0.0.0', 'Android', '2025-02-09 16:53:03', 1),
(61, 4, 2, '105.113.93.33', 'Chrome 132.0.0.0', 'Android', '2025-02-10 09:54:18', 1),
(62, 4, 2, '169.150.196.104', 'Chrome 132.0.0.0', 'Android', '2025-02-10 17:03:13', 1),
(63, 4, 2, '169.150.196.104', 'Chrome 132.0.0.0', 'Android', '2025-02-10 17:03:56', 1),
(64, 1, 1, '169.150.196.104', 'Chrome 132.0.0.0', 'Android', '2025-02-10 17:59:53', NULL),
(65, 1, 1, '105.112.18.199', 'Chrome 132.0.0.0', 'Android', '2025-02-11 01:07:29', NULL),
(66, 1, 1, '41.75.83.118', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-11 01:28:36', NULL),
(67, 4, 2, '105.112.176.161', 'Chrome 132.0.0.0', 'Android', '2025-02-11 01:34:23', 1),
(68, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-11 20:18:12', NULL),
(69, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-12 01:37:33', NULL),
(70, 4, 2, '105.112.17.33', 'Chrome 132.0.0.0', 'Android', '2025-02-12 02:24:30', 1),
(71, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-12 04:20:32', NULL),
(72, 4, 2, '105.112.193.90', 'Chrome 132.0.0.0', 'Android', '2025-02-12 07:19:03', 1),
(73, 4, 2, '105.112.193.90', 'Chrome 132.0.0.0', 'Android', '2025-02-12 10:28:31', 1),
(74, 4, 2, '105.112.193.90', 'Chrome 132.0.0.0', 'Android', '2025-02-12 18:02:18', 1),
(75, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-12 18:47:20', NULL),
(76, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-12 21:30:11', NULL),
(77, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-12 21:47:40', NULL),
(78, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-12 21:48:35', NULL),
(79, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-12 21:48:55', NULL),
(80, 4, 2, '105.115.2.184', 'Chrome 132.0.0.0', 'Android', '2025-02-12 23:54:43', 1),
(81, 2, 6, '105.115.2.184', 'Chrome 132.0.0.0', 'Android', '2025-02-12 23:55:25', 1),
(82, 2, 6, '105.115.2.184', 'Chrome 132.0.0.0', 'Android', '2025-02-12 23:57:05', 1),
(83, 1, 1, '105.115.2.184', 'Chrome 132.0.0.0', 'Android', '2025-02-12 23:57:23', NULL),
(84, 2, 6, '105.115.2.184', 'Chrome 132.0.0.0', 'Android', '2025-02-12 23:57:51', 1),
(85, 4, 2, '105.115.2.184', 'Chrome 132.0.0.0', 'Android', '2025-02-12 23:58:37', 1),
(86, 2, 6, '105.115.2.184', 'Chrome 132.0.0.0', 'Android', '2025-02-12 23:59:44', 1),
(87, 2, 6, '105.115.2.184', 'Chrome 132.0.0.0', 'Android', '2025-02-13 00:00:27', 1),
(88, 1, 1, '105.112.203.10', 'Chrome 132.0.0.0', 'Android', '2025-02-13 00:14:30', NULL),
(89, 2, 6, '105.112.203.10', 'Chrome 132.0.0.0', 'Android', '2025-02-13 00:20:06', 1),
(90, 1, 1, '105.112.203.10', 'Chrome 132.0.0.0', 'Android', '2025-02-13 00:20:47', NULL),
(91, 2, 6, '105.112.203.10', 'Chrome 132.0.0.0', 'Android', '2025-02-13 00:23:31', 1),
(92, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 20:43:43', NULL),
(93, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 20:44:20', NULL),
(94, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 20:44:52', NULL),
(95, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 20:45:01', NULL),
(96, 4, 2, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 20:45:36', 1),
(97, 4, 2, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 20:47:03', 1),
(98, 2, 3, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 20:48:04', 1),
(99, 4, 2, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 20:49:20', 1),
(100, 4, 2, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 23:01:03', 1),
(101, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 23:03:37', NULL),
(102, 4, 2, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 23:05:32', 1),
(103, 1, 1, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 23:11:41', NULL),
(104, 4, 2, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-13 23:15:45', 1),
(105, 2, 3, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-14 00:14:37', 1),
(106, 2, 3, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-14 02:41:27', 1),
(107, 4, 2, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-14 02:42:29', 1),
(108, 2, 3, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-14 02:42:53', 1),
(109, 4, 2, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-14 04:30:58', 1),
(110, 2, 3, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-14 04:31:31', 1),
(111, 4, 2, '41.75.83.118', 'Chrome 133.0.0.0', 'Windows 10 / 11', '2025-02-14 04:51:09', 1),
(112, 4, 2, '105.113.107.213', 'Chrome 132.0.0.0', 'Android', '2025-02-14 07:24:56', 1),
(113, 2, 3, '105.113.107.213', 'Chrome 132.0.0.0', 'Android', '2025-02-14 07:26:15', 1),
(114, 1, 1, '105.113.107.213', 'Chrome 132.0.0.0', 'Android', '2025-02-14 07:26:52', NULL),
(115, 2, 3, '105.113.107.213', 'Chrome 132.0.0.0', 'Android', '2025-02-14 07:30:19', 1),
(116, 1, 1, '105.113.81.39', 'Chrome 132.0.0.0', 'Android', '2025-02-14 23:28:24', NULL),
(117, 2, 3, '105.113.81.39', 'Chrome 132.0.0.0', 'Android', '2025-02-14 23:28:49', 1),
(118, 1, 1, '105.113.81.39', 'Chrome 132.0.0.0', 'Android', '2025-02-14 23:34:19', NULL),
(119, 2, 6, '105.113.57.84', 'Chrome 132.0.0.0', 'Android', '2025-02-14 23:46:30', 1),
(120, 3, 7, '105.113.64.48', 'Chrome 132.0.0.0', 'Android', '2025-02-15 00:27:06', 1),
(121, 1, 1, '105.113.117.92', 'Chrome 132.0.0.0', 'Android', '2025-02-15 03:36:37', NULL),
(122, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 02:49:11', NULL),
(123, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 07:10:51', NULL),
(124, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 08:04:09', NULL),
(125, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 19:49:35', NULL),
(126, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 21:26:35', NULL),
(127, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 21:34:42', 1),
(128, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 21:35:33', NULL),
(129, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 21:38:39', NULL),
(130, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 21:39:06', 1),
(131, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 21:40:37', NULL),
(132, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 21:41:14', 1),
(133, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 21:41:58', NULL),
(134, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 21:43:01', 1),
(135, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 22:13:10', 1),
(136, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 22:13:32', NULL),
(137, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 22:17:15', 1),
(138, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 22:17:57', NULL),
(139, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 22:19:10', 1),
(140, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-15 22:19:40', NULL),
(141, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-16 00:00:38', NULL),
(142, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-16 00:21:21', 1),
(143, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-16 00:21:47', 1),
(144, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-16 00:36:16', NULL),
(145, 2, 7, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-16 00:47:45', 1),
(146, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-16 00:48:57', NULL),
(147, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-16 01:24:44', NULL),
(148, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-16 04:53:18', NULL),
(149, 1, 1, '127.0.0.1', 'Chrome 132.0.0.0', 'Windows 10 / 11', '2025-02-16 05:45:24', NULL),
(150, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-12 07:52:23', NULL),
(151, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-12 08:04:33', NULL),
(152, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-12 08:17:08', NULL),
(153, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-13 08:32:05', NULL),
(154, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-14 22:40:33', NULL),
(155, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-14 23:06:33', NULL),
(156, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-15 01:03:06', NULL),
(157, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-15 09:42:58', NULL),
(158, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-18 07:15:11', NULL),
(159, 2, 6, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-18 08:07:46', 1),
(160, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-22 10:00:58', NULL),
(161, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-23 00:34:59', NULL),
(162, 2, 7, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-23 00:40:40', 1),
(163, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-24 07:55:27', NULL),
(164, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-26 04:37:50', NULL),
(165, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-26 07:56:27', NULL),
(166, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-26 08:44:30', NULL),
(167, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-26 09:11:28', NULL),
(168, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-27 08:08:05', NULL),
(169, 4, 2, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-27 08:10:25', 1),
(170, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 09:40:36', NULL),
(171, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 09:52:20', NULL),
(172, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 15:12:49', NULL),
(173, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 15:44:18', NULL),
(174, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 15:46:17', NULL),
(175, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 16:03:51', NULL),
(176, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 17:19:30', NULL),
(177, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 18:35:38', NULL),
(178, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 20:10:36', NULL),
(179, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-28 22:50:33', NULL),
(180, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-29 02:58:22', NULL),
(181, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-29 03:36:21', NULL),
(182, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-29 07:50:14', NULL),
(183, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-29 19:36:05', NULL),
(184, 3, 4, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-29 21:53:51', 1),
(185, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-29 22:07:46', NULL),
(186, 3, 4, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-29 22:08:49', 1),
(187, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 00:45:52', NULL),
(188, 3, 4, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 00:56:33', 1),
(189, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 00:58:14', NULL),
(190, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 01:11:57', NULL),
(191, 3, 4, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 01:12:12', 1),
(192, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 01:37:53', NULL),
(193, 3, 4, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 02:14:41', 1),
(194, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 02:15:39', NULL),
(195, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 04:26:12', NULL),
(196, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 05:26:53', NULL),
(197, 2, 6, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 07:47:52', 1),
(198, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 08:19:01', NULL),
(199, 2, 6, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 08:19:43', 1),
(200, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 09:26:09', NULL),
(201, 2, 6, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 09:27:49', 1),
(202, 4, 2, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-30 19:33:11', 1),
(203, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 02:38:31', NULL),
(204, 2, 7, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 02:43:42', 1),
(205, 2, 6, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 03:00:04', 1),
(206, 2, 7, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 03:10:06', 1),
(207, 2, 6, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 03:11:28', 1),
(208, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 05:48:56', NULL),
(209, 4, 2, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 05:49:20', 1),
(210, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 22:29:13', NULL),
(211, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 22:51:18', NULL),
(212, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-03-31 22:52:23', NULL),
(213, 2, 7, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-01 07:47:24', 1),
(214, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-01 07:53:21', NULL),
(215, 2, 7, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-01 07:54:50', 1),
(216, 2, 6, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-01 08:38:22', 1),
(217, 2, 7, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-01 08:43:31', 1),
(218, 2, 6, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-01 08:43:44', 1),
(219, 2, 7, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-01 08:46:36', 1),
(220, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 06:22:30', NULL),
(221, 2, 7, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 07:09:25', 1),
(222, 2, 6, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 08:15:58', 1),
(223, 2, 7, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 08:56:41', 1),
(224, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 08:58:48', NULL),
(225, 4, 2, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 09:09:51', 1),
(226, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 09:17:21', NULL),
(227, 4, 2, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 09:19:15', 1),
(228, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 09:20:02', NULL),
(229, 4, 2, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 09:21:26', 1),
(230, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-02 09:26:54', NULL),
(231, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-03 05:15:44', NULL),
(232, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-04 18:45:54', NULL),
(233, 1, 1, '127.0.0.1', 'Safari 604.1', 'iOS', '2025-04-11 23:53:36', NULL),
(234, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Android', '2025-04-12 23:55:43', NULL),
(235, 1, 1, '127.0.0.1', 'Chrome 134.0.0.0', 'Windows 10 / 11', '2025-04-13 03:59:04', NULL),
(236, 1, 1, '127.0.0.1', 'Chrome 135.0.0.0', 'Windows 10 / 11', '2025-04-17 22:22:53', NULL),
(237, 1, 1, '127.0.0.1', 'Chrome 135.0.0.0', 'Windows 10 / 11', '2025-04-20 07:29:44', NULL),
(238, 1, 1, '127.0.0.1', 'Chrome 135.0.0.0', 'Windows 10 / 11', '2025-05-02 22:39:48', NULL),
(239, 1, 1, '127.0.0.1', 'Chrome 135.0.0.0', 'Windows 10 / 11', '2025-05-03 08:20:34', NULL),
(240, 1, 1, '127.0.0.1', 'Chrome 135.0.0.0', 'Windows 10 / 11', '2025-05-06 04:37:32', NULL),
(241, 1, 1, '127.0.0.1', 'Chrome 136.0.0.0', 'Windows 10 / 11', '2025-05-19 13:30:26', NULL),
(242, 2, 3, '127.0.0.1', 'Chrome 136.0.0.0', 'Windows 10 / 11', '2025-05-19 13:31:20', 1),
(243, 2, 3, '127.0.0.1', 'Chrome 136.0.0.0', 'Windows 10 / 11', '2025-05-19 14:41:04', 1),
(244, 1, 1, '127.0.0.1', 'Chrome 136.0.0.0', 'Windows 10 / 11', '2025-05-19 14:42:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE `mark` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `mark` text DEFAULT NULL,
  `absent` varchar(4) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `mark`
--

INSERT INTO `mark` (`id`, `student_id`, `subject_id`, `class_id`, `section_id`, `exam_id`, `mark`, `absent`, `session_id`, `branch_id`) VALUES
(1, 1, 1, 10, 1, 1, '{\"1\":\"100\",\"2\":\"0\"}', '', 5, 1),
(2, 2, 1, 10, 1, 1, '{\"1\":\"56\",\"2\":\"8\"}', '', 5, 1),
(3, 2, 1, 17, 1, 1, '{\"1\":\"100\",\"2\":\"0\"}', '', 5, 1),
(4, 2, 1, 14, 5, 1, '{\"1\":\"95\",\"2\":\"88\",\"3\":\"18\"}', '', 5, 1),
(5, 2, 2, 14, 5, 1, '{\"1\":\"88\",\"2\":\"91\",\"3\":\"16\"}', '', 5, 1),
(6, 2, 37, 14, 5, 1, '{\"1\":\"87\",\"2\":\"90\",\"3\":\"10\"}', '', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `marksheet_template`
--

CREATE TABLE `marksheet_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `background` varchar(355) DEFAULT NULL,
  `logo` varchar(355) DEFAULT NULL,
  `left_signature` varchar(255) NOT NULL,
  `middle_signature` varchar(255) DEFAULT NULL,
  `right_signature` varchar(255) DEFAULT NULL,
  `attendance_percentage` tinyint(4) NOT NULL DEFAULT 1,
  `grading_scale` tinyint(4) NOT NULL DEFAULT 1,
  `position` tinyint(4) NOT NULL DEFAULT 1,
  `cumulative_average` tinyint(4) NOT NULL DEFAULT 1,
  `class_average` tinyint(4) NOT NULL DEFAULT 1,
  `result` tinyint(4) NOT NULL DEFAULT 1,
  `subject_position` tinyint(4) NOT NULL DEFAULT 1,
  `remark` tinyint(4) NOT NULL DEFAULT 1,
  `header_content` text DEFAULT NULL,
  `footer_content` text DEFAULT NULL,
  `page_layout` tinyint(1) NOT NULL,
  `photo_style` tinyint(1) NOT NULL,
  `photo_size` float NOT NULL DEFAULT 120,
  `top_space` varchar(25) NOT NULL DEFAULT '0',
  `bottom_space` varchar(25) NOT NULL DEFAULT '0',
  `right_space` varchar(25) NOT NULL DEFAULT '0',
  `left_space` varchar(25) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `marksheet_template`
--

INSERT INTO `marksheet_template` (`id`, `name`, `background`, `logo`, `left_signature`, `middle_signature`, `right_signature`, `attendance_percentage`, `grading_scale`, `position`, `cumulative_average`, `class_average`, `result`, `subject_position`, `remark`, `header_content`, `footer_content`, `page_layout`, `photo_style`, `photo_size`, `top_space`, `bottom_space`, `right_space`, `left_space`, `branch_id`, `created_at`) VALUES
(1, 'test', '', '', '', '', '', 1, 1, 1, 1, 1, 1, 1, 1, '<p> {name}  {gender}  {register_no}  {academic_session}  {admission_date}  {section}  {category}  {mobileno}  {permanent_address} <br></p>', '<p> {principal_comments}  {teacher_comments}  {print_date} <br></p>', 1, 2, 120, '10', '10', '10', '10', 1, '2025-02-15 17:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `body` longtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `file_name` text DEFAULT NULL,
  `enc_name` text DEFAULT NULL,
  `trash_sent` tinyint(1) NOT NULL,
  `trash_inbox` int(11) NOT NULL,
  `fav_inbox` tinyint(1) NOT NULL,
  `fav_sent` tinyint(1) NOT NULL,
  `reciever` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read',
  `reply_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 unread 1 read',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `body`, `subject`, `file_name`, `enc_name`, `trash_sent`, `trash_inbox`, `fav_inbox`, `fav_sent`, `reciever`, `sender`, `read_status`, `reply_status`, `created_at`, `updated_at`) VALUES
(1, '<p>ggaeesrhthrsergg</p>', 'feefefefwejy5rggtrgg', NULL, NULL, 0, 2, 0, 0, '2-4', '1-1', 1, 0, '2025-02-11 14:33:34', '2025-02-11 15:02:56'),
(2, '<p>GRGWGRG\\</p>', 'FIX VRJJJR', NULL, NULL, 0, 0, 1, 1, '2-4', '3-2', 1, 0, '2025-02-14 08:48:39', '2025-02-14 12:31:46');

-- --------------------------------------------------------

--
-- Table structure for table `message_reply`
--

CREATE TABLE `message_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `file_name` text NOT NULL,
  `enc_name` text NOT NULL,
  `identity` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `message_reply`
--

INSERT INTO `message_reply` (`id`, `message_id`, `body`, `file_name`, `enc_name`, `identity`, `created_at`) VALUES
(1, 1, '<p>Sjsjdjdnfndndnndn j I viibn</p>', '', '', 0, '2025-02-11 14:35:34'),
(2, 1, '<p>ok</p>', '', '', 1, '2025-02-11 02:36:10'),
(3, 2, '<p>DZKFKBFBD;L[ LLNLNNG</p>', '', '', 0, '2025-02-14 08:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(660);

-- --------------------------------------------------------

--
-- Table structure for table `modules_manage`
--

CREATE TABLE `modules_manage` (
  `id` int(11) NOT NULL,
  `modules_id` int(11) NOT NULL,
  `isEnabled` tinyint(1) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `modules_manage`
--

INSERT INTO `modules_manage` (`id`, `modules_id`, `isEnabled`, `branch_id`) VALUES
(1, 26, 1, 1),
(2, 8, 1, 1),
(3, 12, 1, 1),
(4, 15, 1, 1),
(5, 21, 1, 1),
(6, 20, 1, 1),
(7, 400, 0, 1),
(8, 14, 1, 1),
(9, 7, 1, 1),
(10, 10, 1, 1),
(11, 5, 1, 1),
(12, 25, 1, 1),
(13, 13, 0, 1),
(14, 19, 0, 1),
(15, 27, 0, 1),
(16, 17, 1, 1),
(17, 23, 1, 1),
(18, 500, 0, 1),
(19, 24, 0, 1),
(20, 16, 1, 1),
(21, 11, 1, 1),
(22, 22, 1, 1),
(23, 5, 1, 2),
(24, 7, 1, 2),
(25, 8, 1, 2),
(26, 10, 1, 2),
(27, 11, 1, 2),
(28, 12, 1, 2),
(29, 13, 1, 2),
(30, 14, 1, 2),
(31, 15, 1, 2),
(32, 16, 1, 2),
(33, 17, 1, 2),
(34, 19, 1, 2),
(35, 20, 1, 2),
(36, 21, 1, 2),
(37, 22, 1, 2),
(38, 23, 1, 2),
(39, 24, 1, 2),
(40, 25, 1, 2),
(41, 26, 1, 2),
(42, 27, 1, 2),
(43, 400, 1, 2),
(44, 500, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `offline_fees_payments`
--

CREATE TABLE `offline_fees_payments` (
  `id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `student_enroll_id` int(11) DEFAULT NULL,
  `fees_allocation_id` int(11) DEFAULT NULL,
  `fees_type_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `fine` float(10,2) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `orig_file_name` varchar(255) DEFAULT NULL,
  `enc_file_name` text DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_types`
--

CREATE TABLE `offline_payment_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_admission`
--

CREATE TABLE `online_admission` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `caste` varchar(100) DEFAULT NULL,
  `blood_group` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `mother_tongue` varchar(100) DEFAULT NULL,
  `present_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `admission_date` varchar(100) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `student_photo` varchar(255) DEFAULT NULL,
  `category_id` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `previous_school_details` text DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_relation` varchar(50) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `grd_occupation` varchar(255) DEFAULT NULL,
  `grd_income` varchar(25) DEFAULT NULL,
  `grd_education` varchar(255) DEFAULT NULL,
  `grd_email` varchar(255) DEFAULT NULL,
  `grd_mobile_no` varchar(50) DEFAULT NULL,
  `grd_address` text DEFAULT NULL,
  `grd_city` varchar(255) DEFAULT NULL,
  `grd_state` varchar(255) DEFAULT NULL,
  `grd_photo` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_amount` decimal(18,2) NOT NULL,
  `payment_details` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` varchar(11) DEFAULT NULL,
  `apply_date` datetime NOT NULL,
  `doc` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_admission`
--

INSERT INTO `online_admission` (`id`, `reference_no`, `first_name`, `last_name`, `gender`, `birthday`, `religion`, `caste`, `blood_group`, `mobile_no`, `mother_tongue`, `present_address`, `permanent_address`, `admission_date`, `city`, `state`, `student_photo`, `category_id`, `email`, `previous_school_details`, `guardian_name`, `guardian_relation`, `father_name`, `mother_name`, `grd_occupation`, `grd_income`, `grd_education`, `grd_email`, `grd_mobile_no`, `grd_address`, `grd_city`, `grd_state`, `grd_photo`, `status`, `payment_status`, `payment_amount`, `payment_details`, `branch_id`, `class_id`, `section_id`, `apply_date`, `doc`, `created_date`) VALUES
(4, '68143046', 'Adewuyi', 'Ayuba', 'male', '2025-02-11', '', NULL, 'B+', '', '', '', '', '2025-02-11', '', '', '', NULL, '', '', 'Adewuyi', 'Father', '', '', 'Bomber', '0', 'Hnd', 'samuelmayowa33@gmail.com', '07088277186', '4 bomber stere', '', '', '', 1, 0, 0.00, '', 1, 12, '3', '2025-02-11 06:49:17', '9b31391df815ff1612f55bdbf418a654.jpg', '2025-02-11 06:49:17'),
(6, '54159181', 'samuel', 'akingbe', 'female', '', '', NULL, '', '02355235353', '', 'grgrgr', '', '2025-02-12', '', 'lagos', '', NULL, 'superadmin@ramom.com', '', 'feeggr', 'gsgzrgr', '', '', 'ggeggerg', '32657', 'b dzfehr', 'arhetrhrht@ggr.com', '64576475445675465', 'grggrththrythrhttrhrh', '', '', '', 1, 0, 0.00, '', 1, 10, '1', '2025-02-12 22:58:12', '56b1bfbf20e1409620e69e8be62950cd.pdf', '2025-02-12 22:58:12'),
(7, '56040396', 'samuel', 'akingbe', 'male', '', '', NULL, '', '02355235353', '', '', '', '2025-02-12', '', 'lagos', '', NULL, 'superadmin@ramom.com', '', 'feeggr', 'gsgzrgr', '', '', 'ggeggerg', '32657', 'b dzfehr', 'arhetrhrht@feggbe.com', '25454353535', 'gzrgeggrg', '', '', '', 1, 0, 0.00, '', 1, 10, '1', '2025-02-12 23:01:39', '877ea5958428c321ac83ce1f065f06d5.pdf', '2025-02-12 23:01:39'),
(8, '84678378', 'samuel', 'akingbe', 'male', '', '', NULL, '', '02355235353', '', 'tfhhthtthtt', '', '2025-02-12', '', 'lagos', '', NULL, 'superadmin@ramom.com', '', 'aQq3dwqdwqdqdqwdq', 'QDQDWQWDW', '', '', 'wqdqWQd', '1434123', 'sggagdgf', 'zgag@vfgf.vb', '02355235353', 'tfhhthtthtt', '', 'lagos', '', 1, 0, 0.00, '', 1, 10, '1', '2025-02-12 23:13:51', '0ff8bf866dcb15379872ec1fa0ddede0.pdf', '2025-02-12 23:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `online_admission_fields`
--

CREATE TABLE `online_admission_fields` (
  `id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `system` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_admission_fields`
--

INSERT INTO `online_admission_fields` (`id`, `fields_id`, `status`, `required`, `system`, `branch_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 3, 1, 1, 1, 1),
(3, 4, 1, 0, 1, 1),
(4, 5, 1, 1, 1, 1),
(5, 6, 0, 0, 1, 1),
(6, 7, 1, 1, 1, 1),
(7, 8, 1, 0, 1, 1),
(8, 9, 0, 0, 1, 1),
(9, 10, 1, 0, 1, 1),
(10, 11, 1, 0, 1, 1),
(11, 12, 1, 0, 1, 1),
(12, 13, 1, 0, 1, 1),
(13, 14, 1, 0, 1, 1),
(14, 15, 1, 0, 1, 1),
(15, 16, 1, 0, 1, 1),
(16, 17, 1, 0, 1, 1),
(17, 18, 1, 0, 1, 1),
(18, 19, 1, 0, 1, 1),
(19, 20, 1, 1, 1, 1),
(20, 21, 1, 1, 1, 1),
(21, 22, 1, 0, 1, 1),
(22, 23, 1, 0, 1, 1),
(23, 24, 1, 1, 1, 1),
(24, 25, 1, 1, 1, 1),
(25, 26, 1, 1, 1, 1),
(26, 27, 1, 1, 1, 1),
(27, 28, 1, 1, 1, 1),
(28, 29, 1, 1, 1, 1),
(29, 30, 1, 0, 1, 1),
(30, 31, 1, 1, 1, 1),
(31, 32, 1, 0, 1, 1),
(32, 33, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `online_exam`
--

CREATE TABLE `online_exam` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` text NOT NULL,
  `subject_id` text NOT NULL,
  `limits_participation` int(11) NOT NULL,
  `exam_start` datetime DEFAULT NULL,
  `exam_end` datetime DEFAULT NULL,
  `duration` time NOT NULL,
  `mark_type` tinyint(1) NOT NULL DEFAULT 1,
  `passing_mark` float NOT NULL DEFAULT 0,
  `instruction` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `publish_result` tinyint(1) NOT NULL DEFAULT 0,
  `marks_display` tinyint(1) NOT NULL DEFAULT 1,
  `neg_mark` tinyint(1) NOT NULL DEFAULT 0,
  `question_type` tinyint(1) NOT NULL DEFAULT 0,
  `publish_status` tinyint(1) NOT NULL DEFAULT 0,
  `exam_type` tinyint(1) NOT NULL DEFAULT 0,
  `fee` float NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `position_generated` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_exam`
--

INSERT INTO `online_exam` (`id`, `title`, `class_id`, `section_id`, `subject_id`, `limits_participation`, `exam_start`, `exam_end`, `duration`, `mark_type`, `passing_mark`, `instruction`, `session_id`, `publish_result`, `marks_display`, `neg_mark`, `question_type`, `publish_status`, `exam_type`, `fee`, `created_by`, `position_generated`, `branch_id`, `created_at`, `updated_at`) VALUES
(2, 'test', 14, '[\"5\",\"6\",\"7\"]', '[\"1\",\"2\",\"37\"]', 90, '2025-02-16 11:15:00', '2025-07-04 23:15:00', '01:40:00', 0, 80, 'ewfrefefrefe', 5, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, '2025-03-23 12:35:52', '2025-03-23 13:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_answer`
--

CREATE TABLE `online_exam_answer` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `online_exam_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_exam_answer`
--

INSERT INTO `online_exam_answer` (`id`, `student_id`, `online_exam_id`, `question_id`, `answer`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 35, '1', '2025-02-16 12:00:05', NULL),
(3, 2, 2, 16, '1', '2025-02-16 12:00:05', NULL),
(4, 2, 2, 44, '1', '2025-02-16 12:00:05', NULL),
(5, 2, 2, 45, '1', '2025-02-16 12:00:05', NULL),
(6, 2, 2, 50, '1', '2025-02-16 12:00:05', NULL),
(7, 2, 2, 27, '1', '2025-02-16 12:00:05', NULL),
(8, 2, 2, 46, '1', '2025-02-16 12:00:05', NULL),
(9, 2, 2, 11, '1', '2025-02-16 12:00:05', NULL),
(10, 2, 2, 28, '1', '2025-02-16 12:00:05', NULL),
(11, 2, 2, 38, '1', '2025-02-16 12:00:05', NULL),
(12, 2, 2, 49, '1', '2025-02-16 12:00:05', NULL),
(13, 2, 2, 60, '1', '2025-02-16 12:00:05', NULL),
(14, 2, 2, 59, '1', '2025-02-16 12:00:05', NULL),
(15, 2, 2, 48, '1', '2025-02-16 12:00:05', NULL),
(16, 2, 2, 5, '1', '2025-02-16 12:00:05', NULL),
(17, 2, 2, 18, '1', '2025-02-16 12:00:05', NULL),
(18, 2, 2, 30, '1', '2025-02-16 12:00:05', NULL),
(19, 2, 2, 47, '1', '2025-02-16 12:00:05', NULL),
(20, 2, 2, 29, '1', '2025-02-16 12:00:05', NULL),
(21, 2, 2, 61, '1', '2025-02-16 12:00:05', NULL),
(22, 2, 2, 43, '1', '2025-02-16 12:00:05', NULL),
(23, 2, 2, 8, '1', '2025-02-16 12:00:05', NULL),
(24, 2, 2, 32, '1', '2025-02-16 12:00:05', NULL),
(25, 2, 2, 26, '1', '2025-02-16 12:00:05', NULL),
(26, 2, 2, 14, '1', '2025-02-16 12:00:05', NULL),
(27, 2, 2, 7, '1', '2025-02-16 12:00:05', NULL),
(28, 2, 2, 31, '1', '2025-02-16 12:00:05', NULL),
(29, 2, 2, 17, '1', '2025-02-16 12:00:05', NULL),
(30, 2, 2, 23, '1', '2025-02-16 12:00:05', NULL),
(31, 2, 2, 9, '1', '2025-02-16 12:00:05', NULL),
(32, 2, 2, 10, '1', '2025-02-16 12:00:05', NULL),
(33, 2, 2, 55, '1', '2025-02-16 12:00:05', NULL),
(34, 2, 2, 22, '1', '2025-02-16 12:00:05', NULL),
(35, 2, 2, 42, '1', '2025-02-16 12:00:05', NULL),
(36, 2, 2, 33, '1', '2025-02-16 12:00:05', NULL),
(37, 2, 2, 24, '1', '2025-02-16 12:00:05', NULL),
(38, 2, 2, 6, '1', '2025-02-16 12:00:05', NULL),
(39, 2, 2, 53, '1', '2025-02-16 12:00:05', NULL),
(40, 2, 2, 25, '1', '2025-02-16 12:00:05', NULL),
(41, 2, 2, 54, '1', '2025-02-16 12:00:05', NULL),
(42, 2, 2, 19, '1', '2025-02-16 12:00:05', NULL),
(43, 2, 2, 56, '1', '2025-02-16 12:00:05', NULL),
(44, 2, 2, 34, '1', '2025-02-16 12:00:05', NULL),
(45, 2, 2, 20, '1', '2025-02-16 12:00:05', NULL),
(46, 2, 2, 21, '1', '2025-02-16 12:00:05', NULL),
(47, 2, 2, 13, '1', '2025-02-16 12:00:05', NULL),
(48, 2, 2, 51, '1', '2025-02-16 12:00:05', NULL),
(49, 2, 2, 36, '1', '2025-02-16 12:00:05', NULL),
(50, 2, 2, 52, '1', '2025-02-16 12:00:05', NULL),
(51, 2, 2, 57, '1', '2025-02-16 12:00:05', NULL),
(52, 2, 2, 12, '1', '2025-02-16 12:00:05', NULL),
(53, 2, 2, 39, '1', '2025-02-16 12:00:05', NULL),
(54, 2, 2, 41, '1', '2025-02-16 12:00:05', NULL),
(55, 2, 2, 15, '1', '2025-02-16 12:00:05', NULL),
(56, 2, 2, 40, '1', '2025-02-16 12:00:05', NULL),
(57, 2, 2, 37, '1', '2025-02-16 12:00:05', NULL),
(58, 2, 2, 58, '1', '2025-02-16 12:00:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_attempts`
--

CREATE TABLE `online_exam_attempts` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `online_exam_id` int(11) NOT NULL,
  `count` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_exam_attempts`
--

INSERT INTO `online_exam_attempts` (`id`, `student_id`, `online_exam_id`, `count`) VALUES
(2, 2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_payment`
--

CREATE TABLE `online_exam_payment` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `transaction_id` varchar(500) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_submitted`
--

CREATE TABLE `online_exam_submitted` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `online_exam_id` int(11) NOT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `online_exam_submitted`
--

INSERT INTO `online_exam_submitted` (`id`, `student_id`, `online_exam_id`, `remark`, `position`, `created_at`) VALUES
(2, 2, 2, 'fuck you bro', 1, '2025-02-16 13:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `income` varchar(100) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0(active) 1(deactivate)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`id`, `name`, `relation`, `father_name`, `mother_name`, `occupation`, `income`, `education`, `email`, `mobileno`, `address`, `city`, `state`, `branch_id`, `photo`, `facebook_url`, `linkedin_url`, `twitter_url`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Mr Sumondere', 'father', '', '', 'bomber', '', '', '', '2345678986543', '', '', '', 1, 'defualt.png', NULL, NULL, NULL, '2025-02-07 18:19:35', NULL, 0),
(2, 'mrs Adewale', ';loiuytre', '', '', 'bomber', '', '', 'lkifireigi@frgfkr.com', '09876543', '[poiuytryulk;ytghujkljh', '', '', 1, 'defualt.png', NULL, NULL, NULL, '2025-02-08 16:35:01', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_config`
--

CREATE TABLE `payment_config` (
  `id` int(11) NOT NULL,
  `paypal_username` varchar(255) DEFAULT NULL,
  `paypal_password` varchar(255) DEFAULT NULL,
  `paypal_signature` varchar(255) DEFAULT NULL,
  `paypal_email` varchar(255) DEFAULT NULL,
  `paypal_sandbox` tinyint(4) DEFAULT NULL,
  `paypal_status` tinyint(4) DEFAULT NULL,
  `stripe_secret` varchar(255) DEFAULT NULL,
  `stripe_publishiable` varchar(255) NOT NULL,
  `stripe_demo` varchar(255) DEFAULT NULL,
  `stripe_status` tinyint(4) DEFAULT NULL,
  `payumoney_key` varchar(255) DEFAULT NULL,
  `payumoney_salt` varchar(255) DEFAULT NULL,
  `payumoney_demo` tinyint(4) DEFAULT NULL,
  `payumoney_status` tinyint(4) DEFAULT NULL,
  `paystack_secret_key` varchar(255) NOT NULL,
  `paystack_status` tinyint(4) NOT NULL,
  `razorpay_key_id` varchar(255) NOT NULL,
  `razorpay_key_secret` varchar(255) NOT NULL,
  `razorpay_demo` tinyint(4) NOT NULL,
  `razorpay_status` tinyint(4) NOT NULL,
  `sslcz_store_id` varchar(255) NOT NULL,
  `sslcz_store_passwd` varchar(255) NOT NULL,
  `sslcommerz_sandbox` tinyint(1) NOT NULL,
  `sslcommerz_status` tinyint(1) NOT NULL,
  `jazzcash_merchant_id` varchar(255) NOT NULL,
  `jazzcash_passwd` varchar(255) NOT NULL,
  `jazzcash_integerity_salt` varchar(255) NOT NULL,
  `jazzcash_sandbox` tinyint(1) NOT NULL,
  `jazzcash_status` tinyint(1) NOT NULL,
  `midtrans_client_key` varchar(255) NOT NULL,
  `midtrans_server_key` varchar(255) NOT NULL,
  `midtrans_sandbox` tinyint(1) NOT NULL,
  `midtrans_status` tinyint(1) NOT NULL,
  `flutterwave_public_key` varchar(255) DEFAULT NULL,
  `flutterwave_secret_key` varchar(255) DEFAULT NULL,
  `flutterwave_sandbox` tinyint(4) NOT NULL DEFAULT 0,
  `flutterwave_status` tinyint(4) NOT NULL DEFAULT 0,
  `paytm_merchantmid` varchar(255) DEFAULT NULL,
  `paytm_merchantkey` varchar(255) DEFAULT NULL,
  `paytm_merchant_website` varchar(255) DEFAULT NULL,
  `paytm_industry_type` varchar(255) DEFAULT NULL,
  `paytm_status` tinyint(1) NOT NULL DEFAULT 0,
  `toyyibpay_secretkey` varchar(255) DEFAULT NULL,
  `toyyibpay_categorycode` varchar(255) DEFAULT NULL,
  `toyyibpay_status` tinyint(1) NOT NULL DEFAULT 0,
  `payhere_merchant_id` varchar(255) DEFAULT NULL,
  `payhere_merchant_secret` varchar(255) DEFAULT NULL,
  `payhere_status` tinyint(1) NOT NULL DEFAULT 0,
  `nepalste_public_key` varchar(255) DEFAULT NULL,
  `nepalste_secret_key` varchar(255) DEFAULT NULL,
  `nepalste_status` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment_config`
--

INSERT INTO `payment_config` (`id`, `paypal_username`, `paypal_password`, `paypal_signature`, `paypal_email`, `paypal_sandbox`, `paypal_status`, `stripe_secret`, `stripe_publishiable`, `stripe_demo`, `stripe_status`, `payumoney_key`, `payumoney_salt`, `payumoney_demo`, `payumoney_status`, `paystack_secret_key`, `paystack_status`, `razorpay_key_id`, `razorpay_key_secret`, `razorpay_demo`, `razorpay_status`, `sslcz_store_id`, `sslcz_store_passwd`, `sslcommerz_sandbox`, `sslcommerz_status`, `jazzcash_merchant_id`, `jazzcash_passwd`, `jazzcash_integerity_salt`, `jazzcash_sandbox`, `jazzcash_status`, `midtrans_client_key`, `midtrans_server_key`, `midtrans_sandbox`, `midtrans_status`, `flutterwave_public_key`, `flutterwave_secret_key`, `flutterwave_sandbox`, `flutterwave_status`, `paytm_merchantmid`, `paytm_merchantkey`, `paytm_merchant_website`, `paytm_industry_type`, `paytm_status`, `toyyibpay_secretkey`, `toyyibpay_categorycode`, `toyyibpay_status`, `payhere_merchant_id`, `payhere_merchant_secret`, `payhere_status`, `nepalste_public_key`, `nepalste_secret_key`, `nepalste_status`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, 0, NULL, NULL, NULL, 0, 'sk_test_28410d32cc782bd6b86cd2f6cd8ce3c0fac6aef0', 1, '', '', 0, 0, '', '', 0, 0, '', '', '', 0, 0, '', '', 0, 0, 'FLWPUBK_TEST-30350a3d311d4ab25a224033c59191b9-X', 'FLWSECK_TEST-6eb1243f9ac1440d7fb9a0275d2acd35-X', 2, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 1, '2025-02-08 16:27:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_salary_stipend`
--

CREATE TABLE `payment_salary_stipend` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `amount` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `branch_id`, `timestamp`) VALUES
(1, 'Cash', 0, '2019-07-27 18:12:21'),
(2, 'Card', 0, '2019-07-27 18:12:31'),
(3, 'Cheque', 0, '2019-12-21 10:07:59'),
(4, 'Bank Transfer', 0, '2019-12-21 10:08:36'),
(5, 'Other', 0, '2019-12-21 10:08:45'),
(6, 'Paypal', 0, '2019-12-21 10:08:45'),
(7, 'Stripe', 0, '2019-12-21 10:08:45'),
(8, 'PayUmoney', 0, '2019-12-21 10:08:45'),
(9, 'Paystack', 0, '2019-12-21 10:08:45'),
(10, 'Razorpay', 0, '2019-12-21 10:08:45'),
(11, 'SSLcommerz', 0, '2022-05-21 10:08:45'),
(12, 'Jazzcash', 0, '2022-05-21 10:08:45'),
(13, 'Midtrans', 0, '2022-05-21 10:08:45'),
(14, 'Flutter Wave', 0, '2022-05-15 10:08:45'),
(15, 'Offline Payments', 0, '2022-05-15 10:08:45'),
(16, 'Paytm', 0, '2023-05-12 12:08:45'),
(17, 'toyyibPay', 0, '2023-05-12 12:08:45'),
(18, 'Payhere', 0, '2023-05-12 12:08:45'),
(19, 'Nepalste', 0, '2023-05-12 12:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `payslip`
--

CREATE TABLE `payslip` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `month` varchar(200) DEFAULT NULL,
  `year` varchar(20) NOT NULL,
  `basic_salary` decimal(18,2) NOT NULL,
  `total_allowance` decimal(18,2) NOT NULL,
  `total_deduction` decimal(18,2) NOT NULL,
  `net_salary` decimal(18,2) NOT NULL,
  `bill_no` varchar(25) NOT NULL,
  `remarks` text NOT NULL,
  `pay_via` tinyint(1) NOT NULL,
  `hash` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paid_by` varchar(200) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_details`
--

CREATE TABLE `payslip_details` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `prefix` varchar(100) NOT NULL,
  `show_view` tinyint(1) DEFAULT 1,
  `show_add` tinyint(1) DEFAULT 1,
  `show_edit` tinyint(1) DEFAULT 1,
  `show_delete` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `module_id`, `name`, `prefix`, `show_view`, `show_add`, `show_edit`, `show_delete`, `created_at`) VALUES
(1, 2, 'Student', 'student', 1, 1, 1, 1, '2020-01-22 10:45:47'),
(2, 2, 'Multiple Import', 'multiple_import', 0, 1, 0, 0, '2020-01-22 10:45:47'),
(3, 2, 'Student Category', 'student_category', 1, 1, 1, 1, '2020-01-22 10:45:47'),
(4, 2, 'Student Id Card', 'student_id_card', 1, 0, 0, 0, '2020-01-22 10:45:47'),
(5, 2, 'Disable Authentication', 'student_disable_authentication', 1, 1, 0, 0, '2020-01-22 10:45:47'),
(6, 4, 'Employee', 'employee', 1, 1, 1, 1, '2020-01-22 10:55:19'),
(7, 3, 'Parent', 'parent', 1, 1, 1, 1, '2020-01-22 12:24:05'),
(8, 3, 'Disable Authentication', 'parent_disable_authentication', 1, 1, 0, 0, '2020-01-22 13:22:21'),
(9, 4, 'Department', 'department', 1, 1, 1, 1, '2020-01-22 16:41:39'),
(10, 4, 'Designation', 'designation', 1, 1, 1, 1, '2020-01-22 16:41:39'),
(11, 4, 'Disable Authentication', 'employee_disable_authentication', 1, 1, 0, 0, '2020-01-22 16:41:39'),
(12, 5, 'Salary Template', 'salary_template', 1, 1, 1, 1, '2020-01-23 04:13:57'),
(13, 5, 'Salary Assign', 'salary_assign', 1, 1, 0, 0, '2020-01-23 04:14:05'),
(14, 5, 'Salary Payment', 'salary_payment', 1, 1, 0, 0, '2020-01-24 05:45:40'),
(15, 5, 'Salary Summary Report', 'salary_summary_report', 1, 0, 0, 0, '2020-03-14 16:09:17'),
(16, 5, 'Advance Salary', 'advance_salary', 1, 1, 1, 1, '2020-01-28 17:23:39'),
(17, 5, 'Advance Salary Manage', 'advance_salary_manage', 1, 1, 1, 1, '2020-01-25 03:57:12'),
(18, 5, 'Advance Salary Request', 'advance_salary_request', 1, 1, 0, 1, '2020-01-28 16:49:58'),
(19, 5, 'Leave Category', 'leave_category', 1, 1, 1, 1, '2020-01-29 01:46:23'),
(20, 5, 'Leave Request', 'leave_request', 1, 1, 1, 1, '2020-01-30 11:06:33'),
(21, 5, 'Leave Manage', 'leave_manage', 1, 1, 1, 1, '2020-01-29 06:27:15'),
(22, 5, 'Award', 'award', 1, 1, 1, 1, '2020-01-31 17:49:11'),
(23, 6, 'Classes', 'classes', 1, 1, 1, 1, '2020-02-01 17:10:00'),
(24, 6, 'Section', 'section', 1, 1, 1, 1, '2020-02-01 20:06:44'),
(25, 6, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2020-02-02 06:09:22'),
(26, 6, 'Subject', 'subject', 1, 1, 1, 1, '2020-02-03 03:32:39'),
(27, 6, 'Subject Class Assign ', 'subject_class_assign', 1, 1, 1, 1, '2020-02-03 16:43:19'),
(28, 6, 'Subject Teacher Assign', 'subject_teacher_assign', 1, 1, 0, 1, '2020-02-03 18:05:11'),
(29, 6, 'Class Timetable', 'class_timetable', 1, 1, 1, 1, '2020-02-04 04:50:37'),
(30, 2, 'Student Promotion', 'student_promotion', 1, 1, 0, 0, '2020-02-05 17:20:30'),
(31, 8, 'Attachments', 'attachments', 1, 1, 1, 1, '2020-02-06 16:59:43'),
(32, 7, 'Homework', 'homework', 1, 1, 1, 1, '2020-02-07 04:40:08'),
(33, 8, 'Attachment Type', 'attachment_type', 1, 1, 1, 1, '2020-02-07 06:16:28'),
(34, 9, 'Exam', 'exam', 1, 1, 1, 1, '2020-02-07 08:59:29'),
(35, 9, 'Exam Term', 'exam_term', 1, 1, 1, 1, '2020-02-07 11:09:28'),
(36, 9, 'Exam Hall', 'exam_hall', 1, 1, 1, 1, '2020-02-07 13:31:04'),
(37, 9, 'Exam Timetable', 'exam_timetable', 1, 1, 0, 1, '2020-02-08 16:04:31'),
(38, 9, 'Exam Mark', 'exam_mark', 1, 1, 1, 1, '2020-02-10 11:53:41'),
(39, 9, 'Exam Grade', 'exam_grade', 1, 1, 1, 1, '2020-02-10 16:29:16'),
(40, 10, 'Hostel', 'hostel', 1, 1, 1, 1, '2020-02-11 03:41:36'),
(41, 10, 'Hostel Category', 'hostel_category', 1, 1, 1, 1, '2020-02-11 06:52:31'),
(42, 10, 'Hostel Room', 'hostel_room', 1, 1, 1, 1, '2020-02-11 10:50:09'),
(43, 10, 'Hostel Allocation', 'hostel_allocation', 1, 0, 0, 1, '2020-02-11 12:06:15'),
(44, 11, 'Transport Route', 'transport_route', 1, 1, 1, 1, '2020-02-12 04:26:19'),
(45, 11, 'Transport Vehicle', 'transport_vehicle', 1, 1, 1, 1, '2020-02-12 04:57:30'),
(46, 11, 'Transport Stoppage', 'transport_stoppage', 1, 1, 1, 1, '2020-02-12 05:49:20'),
(47, 11, 'Transport Assign', 'transport_assign', 1, 1, 1, 1, '2020-02-12 08:55:21'),
(48, 11, 'Transport Allocation', 'transport_allocation', 1, 0, 0, 1, '2020-02-12 18:33:05'),
(49, 12, 'Student Attendance', 'student_attendance', 0, 1, 0, 0, '2020-02-13 04:25:53'),
(50, 12, 'Employee Attendance', 'employee_attendance', 0, 1, 0, 0, '2020-02-13 09:04:16'),
(51, 12, 'Exam Attendance', 'exam_attendance', 0, 1, 0, 0, '2020-02-13 10:08:14'),
(52, 12, 'Student Attendance Report', 'student_attendance_report', 1, 0, 0, 0, '2020-02-13 18:20:56'),
(53, 12, 'Employee Attendance Report', 'employee_attendance_report', 1, 0, 0, 0, '2020-02-14 05:08:53'),
(54, 12, 'Exam Attendance Report', 'exam_attendance_report', 1, 0, 0, 0, '2020-02-14 05:21:40'),
(55, 13, 'Book', 'book', 1, 1, 1, 1, '2020-02-14 05:40:42'),
(56, 13, 'Book Category', 'book_category', 1, 1, 1, 1, '2020-02-15 03:11:41'),
(57, 13, 'Book Manage', 'book_manage', 1, 1, 0, 1, '2020-02-15 10:13:24'),
(58, 13, 'Book Request', 'book_request', 1, 1, 0, 1, '2020-02-17 05:45:19'),
(59, 14, 'Event', 'event', 1, 1, 1, 1, '2020-02-17 17:02:15'),
(60, 14, 'Event Type', 'event_type', 1, 1, 1, 1, '2020-02-18 03:40:33'),
(61, 15, 'Sendsmsmail', 'sendsmsmail', 1, 1, 0, 1, '2020-02-22 06:19:57'),
(62, 15, 'Sendsmsmail Template', 'sendsmsmail_template', 1, 1, 1, 1, '2020-02-22 09:14:57'),
(63, 17, 'Account', 'account', 1, 1, 1, 1, '2020-02-25 08:34:43'),
(64, 17, 'Deposit', 'deposit', 1, 1, 1, 1, '2020-02-25 11:56:11'),
(65, 17, 'Expense', 'expense', 1, 1, 1, 1, '2020-02-26 05:35:57'),
(66, 17, 'All Transactions', 'all_transactions', 1, 0, 0, 0, '2020-02-26 12:35:05'),
(67, 17, 'Voucher Head', 'voucher_head', 1, 1, 1, 1, '2020-02-25 09:50:56'),
(68, 17, 'Accounting Reports', 'accounting_reports', 1, 1, 1, 1, '2020-02-25 12:36:24'),
(69, 16, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2020-02-27 09:11:03'),
(70, 16, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2020-02-26 04:49:09'),
(71, 16, 'Fees Fine Setup', 'fees_fine_setup', 1, 1, 1, 1, '2020-03-05 01:59:27'),
(72, 16, 'Fees Allocation', 'fees_allocation', 1, 1, 1, 1, '2020-03-01 12:47:43'),
(73, 16, 'Collect Fees', 'collect_fees', 0, 1, 0, 0, '2020-03-15 03:23:58'),
(74, 16, 'Fees Reminder', 'fees_reminder', 1, 1, 1, 1, '2020-03-15 03:29:58'),
(75, 16, 'Due Invoice', 'due_invoice', 1, 0, 0, 0, '2020-03-15 03:33:36'),
(76, 16, 'Invoice', 'invoice', 1, 0, 0, 1, '2020-03-15 03:38:06'),
(77, 9, 'Mark Distribution', 'mark_distribution', 1, 1, 1, 1, '2020-03-19 12:02:54'),
(78, 9, 'Report Card', 'report_card', 1, 0, 0, 0, '2020-03-20 11:20:28'),
(79, 9, 'Tabulation Sheet', 'tabulation_sheet', 1, 0, 0, 0, '2020-03-21 06:12:38'),
(80, 15, 'Sendsmsmail Reports', 'sendsmsmail_reports', 1, 0, 0, 0, '2020-03-21 16:02:02'),
(81, 18, 'Global Settings', 'global_settings', 1, 0, 1, 0, '2020-03-22 04:05:41'),
(82, 18, 'Payment Settings', 'payment_settings', 1, 1, 0, 0, '2020-03-22 04:08:57'),
(83, 18, 'Sms Settings', 'sms_settings', 1, 1, 1, 1, '2020-03-22 04:08:57'),
(84, 18, 'Email Settings', 'email_settings', 1, 1, 1, 1, '2020-03-22 04:10:39'),
(85, 18, 'Translations', 'translations', 1, 1, 1, 1, '2020-03-22 04:18:33'),
(86, 18, 'Backup', 'backup', 1, 1, 1, 1, '2020-03-22 06:09:33'),
(87, 18, 'Backup Restore', 'backup_restore', 0, 1, 0, 0, '2020-03-22 06:09:34'),
(88, 7, 'Homework Evaluate', 'homework_evaluate', 1, 1, 0, 0, '2020-03-28 03:20:29'),
(89, 7, 'Evaluation Report', 'evaluation_report', 1, 0, 0, 0, '2020-03-28 08:56:04'),
(90, 18, 'School Settings', 'school_settings', 1, 0, 1, 0, '2020-03-30 16:36:37'),
(91, 1, 'Monthly Income Vs Expense Pie Chart', 'monthly_income_vs_expense_chart', 1, 0, 0, 0, '2020-03-31 05:15:31'),
(92, 1, 'Annual Student Fees Summary Chart', 'annual_student_fees_summary_chart', 1, 0, 0, 0, '2020-03-31 05:15:31'),
(93, 1, 'Employee Count Widget', 'employee_count_widget', 1, 0, 0, 0, '2020-03-31 05:31:56'),
(94, 1, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2020-03-31 05:31:56'),
(95, 1, 'Parent Count Widget', 'parent_count_widget', 1, 0, 0, 0, '2020-03-31 05:31:56'),
(96, 1, 'Teacher Count Widget', 'teacher_count_widget', 1, 0, 0, 0, '2020-03-31 05:31:56'),
(97, 1, 'Student Quantity Pie Chart', 'student_quantity_pie_chart', 1, 0, 0, 0, '2020-03-31 06:14:07'),
(98, 1, 'Weekend Attendance Inspection Chart', 'weekend_attendance_inspection_chart', 1, 0, 0, 0, '2020-03-31 06:14:07'),
(99, 1, 'Admission Count Widget', 'admission_count_widget', 1, 0, 0, 0, '2020-03-31 06:22:05'),
(100, 1, 'Voucher Count Widget', 'voucher_count_widget', 1, 0, 0, 0, '2020-03-31 06:22:05'),
(101, 1, 'Transport Count Widget', 'transport_count_widget', 1, 0, 0, 0, '2020-03-31 06:22:05'),
(102, 1, 'Hostel Count Widget', 'hostel_count_widget', 1, 0, 0, 0, '2020-03-31 06:22:05'),
(103, 18, 'Accounting Links', 'accounting_links', 1, 0, 1, 0, '2020-03-31 08:46:30'),
(104, 16, 'Fees Reports', 'fees_reports', 1, 0, 0, 0, '2020-04-01 14:52:19'),
(105, 18, 'Cron Job', 'cron_job', 1, 0, 1, 0, '2020-03-31 08:46:30'),
(106, 18, 'Custom Field', 'custom_field', 1, 1, 1, 1, '2020-03-31 08:46:30'),
(107, 5, 'Leave Reports', 'leave_reports', 1, 0, 0, 0, '2020-03-31 08:46:30'),
(108, 18, 'Live Class Config', 'live_class_config', 1, 0, 1, 0, '2020-03-31 08:46:30'),
(109, 19, 'Live Class', 'live_class', 1, 1, 1, 1, '2020-03-31 08:46:30'),
(110, 20, 'Certificate Templete', 'certificate_templete', 1, 1, 1, 1, '2020-03-31 08:46:30'),
(111, 20, 'Generate Student Certificate', 'generate_student_certificate', 1, 0, 0, 0, '2020-03-31 08:46:30'),
(112, 20, 'Generate Employee Certificate', 'generate_employee_certificate', 1, 0, 0, 0, '2020-03-31 08:46:30'),
(113, 21, 'ID Card Templete', 'id_card_templete', 1, 1, 1, 1, '2020-03-31 08:46:30'),
(114, 21, 'Generate Student ID Card', 'generate_student_idcard', 1, 0, 0, 0, '2020-03-31 08:46:30'),
(115, 21, 'Generate Employee ID Card', 'generate_employee_idcard', 1, 0, 0, 0, '2020-03-31 08:46:30'),
(116, 21, 'Admit Card Templete', 'admit_card_templete', 1, 1, 1, 1, '2020-03-31 08:46:30'),
(117, 21, 'Generate Admit card', 'generate_admit_card', 1, 0, 0, 0, '2020-03-31 08:46:30'),
(118, 22, 'Frontend Setting', 'frontend_setting', 1, 1, 0, 0, '2019-09-11 02:24:07'),
(119, 22, 'Frontend Menu', 'frontend_menu', 1, 1, 1, 1, '2019-09-11 03:03:39'),
(120, 22, 'Frontend Section', 'frontend_section', 1, 1, 0, 0, '2019-09-11 03:26:11'),
(121, 22, 'Manage Page', 'manage_page', 1, 1, 1, 1, '2019-09-11 04:54:08'),
(122, 22, 'Frontend Slider', 'frontend_slider', 1, 1, 1, 1, '2019-09-11 05:12:31'),
(123, 22, 'Frontend Features', 'frontend_features', 1, 1, 1, 1, '2019-09-11 05:47:51'),
(124, 22, 'Frontend Testimonial', 'frontend_testimonial', 1, 1, 1, 1, '2019-09-11 05:54:30'),
(125, 22, 'Frontend Services', 'frontend_services', 1, 1, 1, 1, '2019-09-11 06:01:44'),
(126, 22, 'Frontend Faq', 'frontend_faq', 1, 1, 1, 1, '2019-09-11 06:06:16'),
(127, 2, 'Online Admission', 'online_admission', 1, 1, 0, 1, '2019-09-11 06:06:16'),
(128, 18, 'System Update', 'system_update', 0, 1, 0, 0, '2019-09-11 06:06:16'),
(129, 19, 'Live Class Reports', 'live_class_reports', 1, 0, 0, 0, '2020-03-31 08:46:30'),
(130, 16, 'Fees Revert', 'fees_revert', 0, 0, 0, 1, '2020-03-31 08:46:30'),
(131, 22, 'Frontend Gallery', 'frontend_gallery', 1, 1, 1, 1, '2019-09-11 06:06:16'),
(132, 22, 'Frontend Gallery Category', 'frontend_gallery_category', 1, 1, 1, 1, '2019-09-11 06:06:16'),
(133, 6, 'Teacher Timetable', 'teacher_timetable', 1, 0, 0, 0, '2021-03-31 08:46:30'),
(134, 18, 'Whatsapp Config', 'whatsapp_config', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(135, 18, 'System Student Field', 'system_student_field', 1, 0, 1, 0, '2021-03-31 08:46:30'),
(136, 23, 'Online Exam', 'online_exam', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(137, 23, 'Question Bank', 'question_bank', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(138, 23, 'Add Questions', 'add_questions', 0, 1, 0, 0, '2021-03-31 08:46:30'),
(139, 23, 'Question Group', 'question_group', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(140, 23, 'Exam Result', 'exam_result', 1, 0, 0, 0, '2021-03-31 08:46:30'),
(141, 23, 'Position Generate', 'position_generate', 1, 1, 0, 0, '2021-03-31 08:46:30'),
(142, 24, 'Postal Record', 'postal_record', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(143, 24, 'Call Log', 'call_log', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(144, 24, 'Visitor Log', 'visitor_log', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(145, 24, 'Complaint', 'complaint', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(146, 24, 'Enquiry', 'enquiry', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(147, 24, 'Follow Up', 'follow_up', 1, 1, 0, 1, '2021-03-31 08:46:30'),
(148, 24, 'Config Reception', 'config_reception', 1, 1, 1, 1, '2021-03-31 08:46:30'),
(149, 15, 'Student Birthday Wishes', 'student_birthday_wishes', 1, 0, 0, 0, '2021-03-31 08:46:30'),
(150, 15, 'Staff Birthday Wishes', 'staff_birthday_wishes', 1, 0, 0, 0, '2021-03-31 08:46:30'),
(151, 1, 'Student Birthday Wishes Widget', 'student_birthday_widget', 1, 0, 0, 0, '2021-03-31 06:22:05'),
(152, 1, 'Staff Birthday Wishes Widget', 'staff_birthday_widget', 1, 0, 0, 0, '2021-03-31 06:22:05'),
(153, 9, 'Progress Reports', 'progress_reports', 1, 0, 0, 0, '2021-03-21 06:12:38'),
(154, 2, 'Disable Reason', 'disable_reason', 1, 1, 1, 1, '2021-03-21 06:12:38'),
(155, 16, 'Offline Payments', 'offline_payments', 1, 0, 0, 0, '2023-03-23 06:12:38'),
(156, 16, 'Offline Payments Type', 'offline_payments_type', 1, 1, 1, 1, '2023-03-23 06:12:38'),
(157, 25, 'Product', 'product', 1, 1, 1, 1, '2023-06-13 18:21:42'),
(158, 25, 'Product Category', 'product_category', 1, 1, 1, 1, '2023-06-13 18:21:42'),
(159, 25, 'Product Supplier', 'product_supplier', 1, 1, 1, 1, '2023-06-13 18:21:42'),
(160, 25, 'Product Unit', 'product_unit', 1, 1, 1, 1, '2023-06-13 18:21:42'),
(161, 25, 'Product Purchase', 'product_purchase', 1, 1, 1, 1, '2023-06-13 18:21:42'),
(162, 25, 'Purchase Payment', 'purchase_payment', 1, 1, 0, 0, '2023-06-13 18:21:42'),
(163, 25, 'Product Store', 'product_store', 1, 1, 1, 1, '2023-06-13 18:21:42'),
(164, 25, 'Product Sales', 'product_sales', 1, 1, 0, 1, '2023-06-13 18:21:42'),
(165, 25, 'Sales Payment', 'sales_payment', 1, 0, 0, 0, '2023-06-21 06:05:10'),
(166, 25, 'Product Issue', 'product_issue', 1, 1, 0, 1, '2023-06-13 18:21:42'),
(167, 25, 'Inventory Report', 'inventory_report', 1, 0, 0, 0, '2023-06-27 02:56:45'),
(168, 9, 'Generate Position', 'generate_position', 1, 0, 0, 0, '2023-08-10 14:08:29'),
(169, 18, 'User Login Log', 'user_login_log', 1, 0, 0, 1, '2024-04-08 08:01:26'),
(170, 26, 'Manage Alumni', 'manage_alumni', 1, 1, 1, 1, '2024-04-08 08:01:26'),
(171, 26, 'Alumni Events', 'alumni_events', 1, 1, 1, 1, '2024-04-08 08:01:26'),
(172, 27, 'Multi Class Student', 'multi_class', 1, 1, 0, 0, '2024-05-02 07:28:04'),
(173, 22, 'Frontend News', 'frontend_news', 1, 1, 1, 1, '2024-05-05 07:45:48'),
(174, 9, 'Marksheet Template', 'marksheet_template', 1, 1, 1, 1, '2024-05-10 04:59:53'),
(401, 400, 'Domain Request', 'domain_request', 1, 1, 1, 1, '2023-05-30 12:44:34'),
(402, 500, 'QR Code Settings', 'qr_code_settings', 1, 1, 0, 0, '2023-05-08 22:14:07'),
(403, 500, 'QR Code Student Attendance', 'qr_code_student_attendance', 0, 1, 0, 0, '2023-05-08 22:14:07'),
(404, 500, 'QR Code Employee Attendance', 'qr_code_employee_attendance', 0, 1, 0, 0, '2023-05-08 22:14:07'),
(405, 500, 'QR Code Student Report', 'qr_code_student_attendance_report', 1, 0, 0, 0, '2023-05-08 22:14:07'),
(406, 500, 'QR Code Employee Report', 'qr_code_employee_attendance_report', 1, 0, 0, 0, '2023-05-08 22:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `permission_modules`
--

CREATE TABLE `permission_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `system` tinyint(1) NOT NULL,
  `sorted` tinyint(4) NOT NULL,
  `in_module` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permission_modules`
--

INSERT INTO `permission_modules` (`id`, `name`, `prefix`, `system`, `sorted`, `in_module`, `created_at`) VALUES
(1, 'Dashboard', 'dashboard', 1, 1, 0, '2019-05-26 21:23:00'),
(2, 'Student', 'student', 1, 4, 0, '2019-05-26 21:23:00'),
(3, 'Parents', 'parents', 1, 5, 0, '2019-05-26 21:23:00'),
(4, 'Employee', 'employee', 1, 6, 0, '2019-05-26 21:23:00'),
(5, 'Human Resource', 'human_resource', 1, 9, 1, '2019-05-26 21:23:00'),
(6, 'Academic', 'academic', 1, 10, 0, '2019-05-26 21:23:00'),
(7, 'Homework', 'homework', 1, 13, 1, '2019-05-26 21:23:00'),
(8, 'Attachments Book', 'attachments_book', 1, 12, 1, '2019-05-26 21:23:00'),
(9, 'Exam Master', 'exam_master', 1, 14, 0, '2019-05-26 21:23:00'),
(10, 'Hostel', 'hostel', 1, 16, 1, '2019-05-26 21:23:00'),
(11, 'Transport', 'transport', 1, 17, 1, '2019-05-26 21:23:00'),
(12, 'Attendance', 'attendance', 1, 18, 1, '2019-05-26 21:23:00'),
(13, 'Library', 'library', 1, 19, 1, '2019-05-26 21:23:00'),
(14, 'Events', 'events', 1, 20, 1, '2019-05-26 21:23:00'),
(15, 'Bulk Sms And Email', 'bulk_sms_and_email', 1, 21, 1, '2019-05-26 21:23:00'),
(16, 'Student Accounting', 'student_accounting', 1, 22, 1, '2019-05-26 21:23:00'),
(17, 'Office Accounting', 'office_accounting', 1, 23, 1, '2019-05-26 21:23:00'),
(18, 'Settings', 'settings', 1, 24, 0, '2019-05-26 21:23:00'),
(19, 'Live Class', 'live_class', 1, 11, 1, '2019-05-26 21:23:00'),
(20, 'Certificate', 'certificate', 1, 8, 1, '2019-05-26 21:23:00'),
(21, 'Card Management', 'card_management', 1, 7, 1, '2019-05-26 21:23:00'),
(22, 'Website', 'website', 1, 2, 1, '2019-05-26 21:23:00'),
(23, 'Online Exam', 'online_exam', 1, 15, 1, '2019-05-26 21:23:00'),
(24, 'Reception', 'reception', 1, 3, 1, '2019-05-26 21:23:00'),
(25, 'Inventory', 'inventory', 1, 3, 1, '2023-06-13 18:16:49'),
(26, 'Alumni', 'alumni', 1, 24, 1, '2024-05-13 18:16:49'),
(27, 'Multi Class', 'multi_class', 1, 25, 1, '2024-05-02 07:32:01'),
(400, 'Custom Domain', 'custom_domain', 1, 23, 1, '2023-05-30 12:37:32'),
(500, 'Qr Code Attendance', 'qr_code_attendance', 1, 23, 1, '2023-05-15 15:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `postal_record`
--

CREATE TABLE `postal_record` (
  `id` int(11) NOT NULL,
  `sender_title` varchar(255) DEFAULT NULL,
  `receiver_title` varchar(255) DEFAULT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(250) NOT NULL,
  `confidential` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sales_unit_id` int(11) NOT NULL,
  `unit_ratio` varchar(20) DEFAULT '1',
  `purchase_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `sales_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `available_stock` varchar(11) NOT NULL DEFAULT '0',
  `photo` varchar(100) DEFAULT NULL,
  `remarks` text NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_issues`
--

CREATE TABLE `product_issues` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_issue` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `remarks` text NOT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_issues_details`
--

CREATE TABLE `product_issues_details` (
  `id` int(11) NOT NULL,
  `issues_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_store`
--

CREATE TABLE `product_store` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `mobileno` varchar(255) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE `product_supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `product_list` mediumtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_unit`
--

CREATE TABLE `product_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_history`
--

CREATE TABLE `promotion_history` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `pre_class` int(11) NOT NULL,
  `pre_section` int(11) NOT NULL,
  `pre_session` int(11) NOT NULL,
  `pro_class` int(11) NOT NULL,
  `pro_section` int(11) NOT NULL,
  `pro_session` int(11) NOT NULL,
  `prev_due` float NOT NULL DEFAULT 0,
  `is_leave` tinyint(4) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill`
--

CREATE TABLE `purchase_bill` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `paid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `due` decimal(18,2) NOT NULL DEFAULT 0.00,
  `payment_status` int(11) NOT NULL,
  `purchase_status` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill_details`
--

CREATE TABLE `purchase_bill_details` (
  `id` int(11) NOT NULL,
  `purchase_bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `quantity` varchar(20) NOT NULL,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payment_history`
--

CREATE TABLE `purchase_payment_history` (
  `id` int(11) NOT NULL,
  `purchase_bill_id` varchar(11) NOT NULL,
  `payment_by` int(11) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `pay_via` varchar(25) NOT NULL,
  `remarks` text NOT NULL,
  `attach_orig_name` varchar(255) DEFAULT NULL,
  `attach_file_name` varchar(255) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `coll_type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qr_code_settings`
--

CREATE TABLE `qr_code_settings` (
  `id` int(11) NOT NULL,
  `confirmation_popup` tinyint(1) NOT NULL COMMENT 'no-0 | yes-1',
  `auto_late_detect` tinyint(1) NOT NULL COMMENT 'no-0 | yes-1',
  `camera` varchar(20) NOT NULL DEFAULT 'environment' COMMENT 'environment-rear | user-front',
  `staff_in_time` time DEFAULT NULL,
  `staff_out_time` time DEFAULT NULL,
  `student_in_time` time DEFAULT NULL,
  `student_out_time` time DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT 0,
  `subject_id` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL,
  `question` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_1` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_2` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_3` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `opt_4` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mark` float(10,2) NOT NULL DEFAULT 0.00,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `type`, `level`, `class_id`, `section_id`, `subject_id`, `group_id`, `question`, `opt_1`, `opt_2`, `opt_3`, `opt_4`, `answer`, `mark`, `branch_id`, `created_by`, `created_at`, `updated_at`) VALUES
(5, 1, 1, 14, 5, 1, 1, 'When did Nigeria attain independence?', '1st October 1963', '1st October 1960', '29th may 1999', '12th June 1992', '29th May 1960', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(6, 1, 2, 14, 5, 1, 1, 'The eagle on the Nigerian coat of arm stands for __________', 'dignity', 'strength', 'peace', 'progress', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(7, 1, 3, 14, 5, 1, 1, 'How many local government areas are in Nigeria', '20', '360', '109', '774', '780', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(8, 1, 1, 14, 5, 1, 1, 'Which of these is referred to as the confluence town?', 'Abuja', 'Lokoja', 'Lagos', 'Port Harcourt', 'Kabba', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(9, 1, 1, 14, 5, 1, 1, 'How many geo-political zones are in Nigeria?', '774', '36', '6', '20', '667', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(10, 1, 1, 14, 5, 1, 1, 'Who was the first executive president of Nigeria', 'Alhaji Shewu Shagari', 'Dr Nnamidi Azikiwe', 'Mohammadu Buhari', 'Yakubu Gowon', 'Tafawa Balewa', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(11, 1, 1, 14, 5, 1, 1, 'Which of these is not a crude oil producing state in Nigeria?', 'Bayelsa', 'Rivers', 'Osun', 'Delta', 'cross river', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(12, 1, 1, 14, 5, 1, 1, 'Which of these is a state in the northern part of Nigeria?', 'Bayelsa', 'Ekiti', 'Imo', 'Gombe', 'Osun', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(13, 1, 1, 14, 5, 1, 1, 'Which of these is not a metal', 'silver', 'iron', 'gold', 'oxygen', 'sodium', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(14, 1, 1, 14, 5, 1, 1, 'Which of these two elements form water?', 'hydrogen and carbon', 'hydrogen and nitrogen', 'carbon and oxygen', 'hydrogen and oxygen', 'sodium and hydrogen', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(15, 1, 1, 14, 5, 1, 1, 'Izal and Dettol can be called __________', 'oil', 'chemicals', 'disinfectant', '', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(16, 1, 1, 14, 5, 1, 1, 'Which of these is rich in vitamins', 'bread', 'beef', 'green vegetable', 'fuel', 'gas', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(17, 1, 1, 14, 5, 1, 1, '________ is the biggest continent in the world', 'Asia', 'Antarctica', 'Africa', 'Europe', 'North America', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(18, 1, 1, 14, 5, 1, 1, 'In which geopolitical zone is ogun state?', 'south east', 'south south', 'south west', 'south noth', 'north west', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(19, 1, 1, 14, 5, 1, 1, 'The population of Nigeria can be known through', 'calculation', 'census', 'numbering', 'measurement', 'sampling', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(20, 1, 1, 14, 5, 1, 1, 'The green colouring in the Nigerian flag represent', 'agriculture', 'peace', 'strength', 'unity', 'faith', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(21, 1, 1, 14, 5, 1, 1, 'The houses in the Nigerian coat of arms represent', 'agriculture', 'peace', 'strength', 'unity', 'dignity', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(22, 1, 1, 14, 5, 1, 1, 'Nigeria became a republic in the year', '1960', '1963', '1964', '1970', 'dignity', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(23, 1, 1, 14, 5, 1, 1, 'The ?y? shape in the Nigerian coat of arms represent', 'dignity', 'river Niger and river Benue', 'Peace and unity', 'young people', 'youth service', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(24, 1, 1, 14, 5, 1, 1, 'Nigeria is divided into _________ states', '28', '30', '37', '40', 'Sagamu', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(25, 1, 1, 14, 5, 1, 1, 'The existence of Nigeria as a county started in', '1914', '1916', '1918', '1963', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(26, 1, 1, 14, 5, 1, 1, 'How many local governments do we have in Nigeria?', '747', '750', '767', '774', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(27, 1, 1, 14, 5, 1, 1, 'Which of these national symbols must a Nigerian travelling to another county hold?', 'national identity', 'voters card', 'national passport', 'national constitution', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(28, 1, 1, 14, 5, 1, 1, 'Where can limestone be found in the following towns?', 'Ibadan', 'Ilaro', 'Ibese', 'ota', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(29, 1, 1, 14, 5, 1, 1, 'The two rivers in Nigeria are river ______________ and _______________', 'osun and oyo', 'Niger and benue', 'cross river and Benue', '', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(30, 1, 1, 14, 5, 1, 1, 'Nigeria became a republic in __________', '1960', '1967', '1963', '1957', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(31, 1, 1, 14, 5, 1, 1, 'National currency is the medium of _________ which the people of the county generally accepted for the country transaction', 'money', 'exchange', 'transfer', 'argument', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(32, 1, 1, 14, 5, 1, 1, 'The national __________ is the official patriotic song of a nation', 'anthem', 'pledge', 'oaths', 'rhymes', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(33, 1, 1, 14, 5, 1, 1, 'The colour of the Nigerian flag is', 'Blue, white, blue', 'green, white, green', 'green white yellow', 'blue yellow red', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(34, 1, 1, 14, 5, 1, 1, 'Nigeria flag is divided into', '2', '4', '3', '1', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(35, 1, 1, 14, 5, 1, 1, 'S.A.N means', 'senior assembly of Nigeria', 'senior advocate national', 'senior advocate of Nigeria', 'self-alliance nation', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(36, 1, 1, 14, 5, 1, 1, 'One of the following has no cure at the moment', 'malaria', 'ganorrhea', 'cholera', 'hiv/aids', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(37, 1, 1, 14, 5, 1, 1, 'How many are the aims of government?', '1', '2', '4', '3', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(38, 1, 1, 14, 5, 1, 1, 'The arm of government responsible for implementing laws is the', 'judiciary', 'executive', 'legislative', 'all of the above', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(39, 1, 1, 14, 5, 1, 1, 'One of these is not a national symbol', 'national', 'Nigerian vehicle', 'Nigerian flag', 'coat of arm', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(40, 1, 1, 14, 5, 1, 1, '___________ to be faithful loyal and honest, to serve Nigeria with all my', 'might', 'strength', 'power', 'humility', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(41, 1, 1, 14, 5, 1, 1, 'After indolence the Nigerian governor general was ___________', 'aguyl ironsi', 'Mohammdu Buhari', 'Yukubu Gowon', 'Tafawa balwa', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(42, 1, 1, 14, 5, 1, 1, 'Cement factory is to Ewekoro as coal mining is to', 'Oyo', 'Osun', 'Enugu', 'Ondo', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(43, 1, 1, 14, 5, 1, 1, '__________ govern with the use of force', 'civilian rule', 'military rule', 'Democratic rule', 'all of the above', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(44, 1, 1, 14, 5, 1, 1, 'The first coup in Nigerian occur in __________', '1966', '1975', '1979', '1983', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(45, 1, 1, 14, 5, 1, 1, 'The coup staged in 1983 was led by _________', 'Gen sani Abacha', 'Gen. Olushegun obnasojo', 'Gen Muritala Mohammed', 'Gen. Muhammed Buhari', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(46, 1, 1, 14, 5, 1, 1, 'General sani Abacha died in __________', '1997', '1998', '1999', '2000', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(47, 1, 1, 14, 5, 1, 1, 'military leader usually come to power through___________', 'election', 'party system', 'coup d? tat', 'voting', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(48, 1, 1, 14, 5, 1, 1, '___________ overthrew the government of president shehu shagari on 31st December 1983', 'Gen gbadamosi', 'Gen Mohammadu', 'Gen Sani Abacha', 'Gen Olushegun Obansajo', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(49, 1, 1, 14, 5, 1, 1, 'Chife Olushegun was born (cieca) in __________', '1948', '1929', '1938', '1951', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(50, 1, 1, 14, 5, 1, 1, 'The popular national youth service corps programme was Initial by ____________', 'gen yakubu gowon', 'chife ladoke', 'Almadu Bello', 'Olushgun Obasojo', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(51, 1, 1, 14, 5, 1, 1, 'When we overthrown by general muritala Muhammed through a coup?', 'Gen Mammadu', 'Gen. Sani Abacha', 'Gen. Abdulsalam', 'Gen. Yakubu Gowon', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(52, 1, 1, 14, 5, 1, 1, 'The British Journalist who gave Nigeria her name was _________________', 'queen Elizabeth', 'Flora Shaw', 'Mary Slessor', 'Mary Anderson', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(53, 1, 1, 14, 5, 1, 1, 'The unification of north and south protectortes of Nigeria was done by ______', 'Arthur Richard', 'Donald Cameroon', 'lord lugard', 'James Robertson', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(54, 1, 1, 14, 5, 1, 1, 'The southern and Northern protects of Nigeria were merged in_______', '1940', '1914', '1940', '1944', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(55, 1, 1, 14, 5, 1, 1, 'Which country flag is called the union jack?', 'Nigerian', 'united', 'United States', 'Great Britain', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(56, 1, 1, 14, 5, 1, 1, 'The first Europeans to Nigeria were the ________', 'British', 'Portuguese', 'polish', 'Sir Fredric Lugard', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(57, 1, 1, 14, 5, 1, 1, 'Indirect rule was introduced in Nigerian by ________', 'chief olushegun', 'Dr. Nnamdi Azikwe', 'sir Ahmedu Bello', 'Sir Fredrick Lugard', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(58, 1, 1, 14, 5, 1, 1, 'The librian ? born America who brought Ebola to Nigerian in 2014 was _________', 'George weah', 'Charles', 'Patrick sawyer', 'Stella Adadevoh', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(59, 1, 1, 14, 5, 1, 1, 'The final movement date of the federal capital of Nigeria from lagos to Abuja was ___________', 'September 1991', 'December 1991', 'November 1992', 'October 1992', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(60, 1, 1, 14, 5, 1, 1, 'The presidential election annulled by general Babagida in 1993 was held on ________', 'October 1', 'June 12', 'December 12', 'July 10', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL),
(61, 1, 1, 14, 5, 1, 1, 'The official title of the head of the central Bank of Nigeria is ___________', 'accountant', 'chairman', 'president', 'Governor', '', 1.00, 1, 0, '2025-02-16 09:19:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `questions_manage`
--

CREATE TABLE `questions_manage` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `neg_marks` float(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `questions_manage`
--

INSERT INTO `questions_manage` (`id`, `question_id`, `onlineexam_id`, `marks`, `neg_marks`, `created_at`, `updated_at`) VALUES
(58, 5, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(59, 6, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(60, 7, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(61, 8, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(62, 9, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(63, 10, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(64, 11, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(65, 12, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(66, 13, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(67, 14, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(68, 15, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(69, 16, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(70, 17, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(71, 18, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(72, 19, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(73, 20, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(74, 21, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(75, 22, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(76, 23, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(77, 24, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(78, 25, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(79, 26, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(80, 27, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(81, 28, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(82, 29, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(83, 30, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(84, 31, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(85, 32, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(86, 33, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(87, 34, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(88, 35, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(89, 36, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(90, 37, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(91, 38, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(92, 39, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(93, 40, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(94, 41, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(95, 42, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(96, 43, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(97, 44, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(98, 45, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(99, 46, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(100, 47, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(101, 48, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(102, 49, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(103, 50, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(104, 51, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(105, 52, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(106, 53, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(107, 54, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(108, 55, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(109, 56, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(110, 57, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(111, 58, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(112, 59, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(113, 60, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL),
(114, 61, 2, 1.00, 0.00, '2025-02-16 10:18:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `question_group`
--

CREATE TABLE `question_group` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `key` longtext NOT NULL,
  `username` varchar(100) NOT NULL,
  `login_credential_id` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rm_sessions`
--

CREATE TABLE `rm_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rm_sessions`
--

INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0adde0kpd8sg19431nd9ot5d28mqkf58', '::1', 1744972150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343937323135303b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('0e9n5jlla9vsmkgj871gfcpemr0ip17h', '::1', 1743622968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632323936383b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('0ee4bmnqncvvbp0u3qp61tgimaqkfquh', '::1', 1744559974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343535393932333b72656469726563745f75726c7c733a35313a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f617474656e64616e63652f73747564656e745f656e747279223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('0iuh35o0ivfb3o5ati6ff9vs7pe1b3ci', '::1', 1743535456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533353435363b),
('0jprih51kj0a3tprbs37m637vubk3966', '::1', 1743800363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333830303335393b),
('0raq327886j1ugipd5dnbtppgt1ke6fn', '::1', 1744461138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343436313030303b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('101tr9071vg2jhmtsv1464voi15df6rb', '::1', 1743629682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632393633373b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('127sagfg4ms36e4pk4j7ulpobn1fpucl', '::1', 1743510424, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333531303432343b),
('1b01desp4b70udtit6vu2rih9m3up0qa', '::1', 1743348921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334383932313b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('1disa07u9d6drsc1gqlech4fnjq47r5i', '::1', 1743623915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632333931353b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('1fki1slcgu8j47nctfdgljh0e24paft3', '::1', 1743320457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333332303435373b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('1nmogm3ga4a0fvst0opcaufbjlui2d7b', '::1', 1743443753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333434333735333b6e616d657c733a31343a2241646477616c652047656f726765223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2238223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2232223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('1u6vd4u8hulla1hlslllpfdbn65ftkog', '::1', 1743620789, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632303738393b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('265lr1ks7df53058ns5128hq2npctfu4', '::1', 1743354495, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335343439353b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('2ccbmluojvnfmfvk1lb7rt94vos1vie9', '::1', 1743501476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530313437363b),
('2mhnssd05pmd0sfs9dhk3gs5rg4rgi6p', '::1', 1744461000, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343436313030303b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('2oqudh1cit46q3toio8lolipi161c3g1', '::1', 1743619571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333631393537313b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('32kjnpt47rn6u99oidds6006heg14dk6', '::1', 1743624230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632343233303b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('337pd7qt3kuif1cl6dadkf5p9uvu6gih', '::1', 1743432979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333433323937393b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6c6173745f706167657c733a34363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f706172656e74732f6d795f6368696c6472656e223b),
('33n9l6oq3sreihv1lnivobn8l4qj51v8', '::1', 1743281009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333238313030393b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('39emvutemf9vj4vqigdlfi8hgg1ar9c2', '::1', 1743364001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336343030313b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('39f96v47vlakees2ep0js33lmspuke87', '::1', 1743337307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333333373330373b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('3ap7j5a1o1cgr9esa63qk45p745eg09d', '::1', 1743279865, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333237393836353b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('3kpukdvn9di0i06irf6q5i0e6l7g02rr', '::1', 1743407469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333430373436393b6e616d657c733a31343a2241646477616c652047656f726765223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2238223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2232223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33343a2254686520436f6e66696775726174696f6e20486173204265656e2055706461746564223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('3ltktmab1qvtkbgelb4viqm9ekl12t3g', '::1', 1743629637, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632393633373b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('3ta4ebt26da8nsdv7mara51r901tn9tq', '::1', 1743363065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336333036353b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('441gat3o56hmdn9vdq1tpavn5gck0dt4', '::1', 1744546141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343534363134313b72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f6172642f696e646578223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('44b6ckt6khf3g2d305rl3vjrpm628hh0', '::1', 1743625741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632353734313b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('46v0ucum11d8u8q311kdftrdvrmjs9d2', '::1', 1743328409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333332383430393b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('47ovv35okdqpbmspfcdcevl3irbh2pq2', '::1', 1743370415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337303431353b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('4932hnbe1482vq4inbu13ppiphrevu32', '::1', 1743967837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333936373833373b),
('4dtpj333p7vgtjvsgol77niag5i5j9vt', '::1', 1743374002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337343030323b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('4hl6ast1a5ed7l6vbpqqql7i6abchiui', '::1', 1743433510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333433333531303b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('4k5g6ll7tffrb8v301vjqkubud2365km', '::1', 1743344504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334343530343b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('4oll9ihqapn39t1livd8d1k6ar13g8ap', '::1', 1743510818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333531303738383b),
('4v27bmiil00gq9miu4c6j933atio9rf2', '::1', 1744545317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343534353331363b72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f6172642f696e646578223b),
('501v62tvnkr3voh5n59uv62g6ttudq8o', '::1', 1743537047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533373034373b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('573brf50jqj975q2cjp0b02u9lpkc91i', '::1', 1743625248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632353234383b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('5pgi3i5akic54hjef7nqs1fa4j4ls9po', '::1', 1743505754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530353735343b),
('5qab2n0uit92n6pv2oijm6sqm16qhn48', '::1', 1743370883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337303838333b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('5tn3164a3pili0b6aleop7ler2vvfbhq', '::1', 1743372487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337323438373b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('5uvs8cg54p5tkthm9tcelkert2coptb0', '::1', 1744972541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343937323534313b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('6253rl2f8kjkvoiivmj40flo6tkc5qrp', '::1', 1743281764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333238313736343b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('65lsavsha77i83bdbbu05cbumsnk2li7', '::1', 1743463788, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333436333738383b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b),
('675iplsn1irf1roi72r70vv3baih32pm', '::1', 1743342240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334323234303b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('680v6c4efqf6tr2ku10j3isj2q4q30ja', '::1', 1743835558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333833353533343b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('68a7e6g4dgch2rm624ubpq4sinjcnq70', '::1', 1744459578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343435393537383b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('6d1kjtq395rv6pon7tit8n405685h8k4', '::1', 1743628031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632383033313b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('6epg1i3glrfjb04477gkpeaauch45hvc', '::1', 1743536420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533363432303b),
('6m3rple9dq7b81lth1o8a90ljrho6g3n', '::1', 1743373181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337333138313b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('76pk2mlacvc9v85br42ui1p5h94fr4hj', '::1', 1745177386, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734353137373336343b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('79mg0sgnt5rmuhlld85p6385mpfnk34a', '::1', 1743339937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333333393933373b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('7fom1oa4dlck7viq3f9pe329oj81q2uf', '::1', 1744459140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343435393134303b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('7gujisv23vdbr24vuqdul38fs8a6jl2k', '::1', 1743344062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334343036323b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('7iepp7e4ngi555em8s23hetukj2231t6', '::1', 1743624943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632343934333b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('7in8h69pp9jupnfjutjt4kapr6prhium', '::1', 1743510654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333531303432343b),
('7inss6dhoca2lrr0dt6mb1gfodfpm6h4', '::1', 1743363671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336333637313b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('7jem9fh24dv47jfvkhhvf7npsaluj2p2', '::1', 1743337005, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333333373030353b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('7kdd0hbk4gkmq49ofd2ttcgq617lnigb', '::1', 1744546452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343534363435323b72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f6172642f696e646578223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('7u8q2ac1pog6n7qdqb4s8mhiudbj92mr', '::1', 1743367245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336373234353b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('7uoehmjmd98hcdu40rt7t3g3pg0e6hmr', '::1', 1743620395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632303339353b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('841mb5tgcdb9340ina207org1ko79sdd', '::1', 1743444163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333434343136333b6e616d657c733a31343a2241646477616c652047656f726765223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2238223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2232223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('89atdf1a7o6ehiducbn7de258dai3gks', '::1', 1743336110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333333363131303b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('8ddb7t0mpj8qhvah83mba2tjqavb3v3q', '::1', 1743537895, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533373839353b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('8fuclcekaat80j6335qp2hormseutddv', '::1', 1743629196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632393139363b6e616d657c733a31343a2241646477616c652047656f726765223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2238223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2232223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('8mccv1ks829rpmsrpqbb0o8lmm230beg', '::1', 1743626043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632363034333b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('8q3m0o3ocu7ki2vu4njnuton8256m1au', '::1', 1743369802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336393830323b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('8rsaf0pi9qbd40hcg87hrrbpjsh6saq6', '::1', 1744548280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343534383136383b72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f6172642f696e646578223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('95ph1mpn47igai02ofg85p0c6delfjut', '::1', 1743341224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334313232343b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('98ufpqnpc1j54hi941haf5ekcrbsit13', '::1', 1743351765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335313736353b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('99or54t6a9j60n4utkp2vn8mf3asksop', '::1', 1743504548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530343534383b),
('9mv3ifn45tm0ti7632n8mc42nhq3oha3', '::1', 1746268926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363236383736343b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('9nq7sk5rbj8ikvf48n08k8i83mrvfgm7', '::1', 1744547856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343534373835363b72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f6172642f696e646578223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('9pv1oiopl23sbr6qke1m8g3ouii8gmlr', '::1', 1743361784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336313738343b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('a34cealuc1ffeova0pdfgn88o256857o', '::1', 1743353633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335333633333b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('a56ipnbo2btbv1vkqu1pvcfk5vtpqqhc', '::1', 1743374706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337343730363b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('aed6ecouulmmsivsscpuv332d10l60g8', '::1', 1743538928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533383932373b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ajm4sd5u9fkqs62308kchj45am2ms69s', '::1', 1743506395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530363339353b),
('ao555l6fomjflj17g16mv7lmk8mjcr5k', '::1', 1743375270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337353237303b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('at3eir77hjthf76v4m9l2duo1sbb74id', '::1', 1743354939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335343933393b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('avqt1g3tb4cu2ghqb0ic6l6j8vbhfgi0', '::1', 1743328813, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333332383831333b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('b0c3cculi3q7nofvaivdhi6ph2vjk80v', '::1', 1743455838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333435353833383b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b),
('bc89ui0ba003ik90nsj9i61eqv4njpbe', '::1', 1743621247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632313234373b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('bcaf8inpeomi40sv9g2gl9kuu5j5dttb', '::1', 1743342601, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334323630313b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('bcuphbjk1saclemq9dnj1t3ue602c9lk', '::1', 1743321284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333332313238343b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('beuees6643tea8as9a3snca2opujvd0n', '::1', 1744547219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343534373231393b72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f6172642f696e646578223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('bf1h03mh6skls7tc7c9rfgjh4tdiodi9', '::1', 1743444170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333434343136333b6e616d657c733a31343a2241646477616c652047656f726765223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2238223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2232223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('bg28lhth5k5chf4g9st3maeqga6ghjq6', '::1', 1743368707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336383730373b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('bj49r6aqce5aldtiljp8bnrq6q4r9kpa', '::1', 1746303635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363330333631373b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('c0eca5o2op6hqpl8fuptkgi97pl6vj66', '::1', 1743534790, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533343739303b),
('c3hdnf1hnnh98nibfpd2ug3hobh7f411', '::1', 1743327955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333332373935353b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('c703ntlponpsvuj7j83brsotr8nkd58b', '::1', 1743619265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333631393236353b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('c8mgk16ihg6ic3n1clm6b11jbeavee6k', '::1', 1743282112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333238323131323b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('cautu5vm5gupbhjin13m33inn0bis48c', '::1', 1743329248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333332393234383b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ci2bji7qht8qr0540kv1atem30e8vjn7', '::1', 1743359918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335393931383b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('cn6v068e19n96tjpmt26t3qh4afmdrbi', '::1', 1744548168, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343534383136383b72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f6172642f696e646578223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('cq7u6k05j7vtq3u1jbt55erubnaus686', '::1', 1743618952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333631383935323b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('d03cvlqecemfhtrtne3u39mmus10s496', '::1', 1743371805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337313830353b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('da41ad7af2stbqfct2effvonatmmlkgs', '::1', 1743366294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336363239343b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('devtmvgh4csg1qns461kv9j9bcb7lnnp', '::1', 1743339371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333333393337313b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('dme1mohdb2usifof3ufui68r0ob7d0p2', '::1', 1746549461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363534393432303b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('do3ncu8q3h8cup5tv7gdhguru0csonb8', '::1', 1743505176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530353137363b),
('dq5q89qdu7sc122rt6nkb81grsivm47q', '::1', 1743508567, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530383536373b),
('dru8vi6jmk2fga174t0pk92i7pas7fmo', '::1', 1743506890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530363839303b),
('dsi1uh8g3n2e005dj5rgokc4kauud4k1', '::1', 1743410677, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333431303637373b6e616d657c733a31343a2241646477616c652047656f726765223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2238223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2232223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('e5ho3qotk38gljqmn8bmb3l08jcvqa8p', '::1', 1743348588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334383538383b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('e5shevv11qgf7i7ota83mner5gc09kjg', '::1', 1743536746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533363734363b),
('edr9sb6ckutk7pigqmn9jfijtelnsfrn', '::1', 1743539575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533393537353b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ehubn6f16shslu4fotts03ttqc46clso', '::1', 1743538927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533383932373b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('eiumm4oli52i0uvtjmjqka2l01sqt69v', '::1', 1743363369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336333336393b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('f92ltcuk4hjnl9psrh0u129tdskuk1k4', '::1', 1743366928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336363932383b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('frk4ui1ubno3j0o66fatec6l6o88ett6', '::1', 1743283155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333238333135353b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ftvdaa7090hehecnflpkuup0c22t16vj', '::1', 1744972985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343937323837393b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('fupr1jgihus5kuecg3vsne7017j7vhom', '::1', 1747710706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373731303730323b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('fv7jo7vptl2o9lihkk8im9u3gj9c6anm', '::1', 1743537590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533373539303b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('g5rnei5oebjduk11g5virfjiplvqgdoo', '::1', 1743283420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333238333135353b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('g8ap20acj9bs8mohk1d4noldvolphi39', '::1', 1744972879, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343937323837393b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('g8pe1tn04gh0lh5boqotijf6d35ju01p', '::1', 1743627366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632373336363b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('gdj24nlm2r39jkufp616e7e3cokmrs7g', '::1', 1743372162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337323136323b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('gikq0jbks4fjnbv8h2in4o1lr5bjhccb', '::1', 1743352840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335323834303b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('gktflde5vc4oc897ovn0brrr6uirkmgm', '::1', 1743353281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335333238313b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('gldpnv4cr1dj8jmu5b57vjll2sd8vb61', '::1', 1743320855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333332303835353b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('hcigvongc6dl5l8l8k28c2nai6c3lagi', '::1', 1743369019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336393031393b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('honnc6duu92agbvesh9oin9qkeghf06o', '::1', 1743340286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334303238363b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ia6ponpjneqajfk64c5o2ui9ofvvbppj', '::1', 1744058712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343035383731323b),
('idf9s2fqeq48fvamn8vdd2fkf7cr6od4', '::1', 1743622608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632323630383b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ieh6s8b3omp1hlbldinm2kkab496bs5r', '::1', 1743373588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337333538383b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('iflqt08339spuv9vsr1kt3dcmq9ftb26', '::1', 1743502336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530323333363b),
('ike4fcq7j1qtetjloe40u1rj0hsvkf20', '::1', 1743330029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333333303032393b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('j3om717ba8d9laugq75esfbuagvqn746', '::1', 1743621549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632313534393b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('j685hme9417ncctnsq1qevejucg7dbjm', '::1', 1743340914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334303931343b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('jt4hlqrqnotsugjou0am63vqatdha7eg', '::1', 1743538471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533383437313b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('k76rf5j4l1ds3lcidme73dmp501p0ae8', '::1', 1743342908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334323930383b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('k7n92ekm1ab1b39a202vphcvflihgvgu', '::1', 1743338731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333333383733313b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('kbghilsp5vu90gt7rcc94i167g9i4loa', '::1', 1743354150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335343135303b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('kf1aq0in3t394vlfh2b3j86u90q4gf3c', '::1', 1743539878, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533393837383b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('kfn4nshh1hi4cvtd9avo76s9hb7llt67', '::1', 1743371303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337313330333b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('kp7tj5bgfri4n5c3ocnbsh9nv83leaaf', '::1', 1743338238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333333383233383b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('l5lughr9b1r5gvdo40bqla4qnil8krug', '::1', 1743628455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632383435353b6e616d657c733a31343a2241646477616c652047656f726765223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2238223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2232223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('l866rbunq33ut0u28u8orbn6k658erhc', '::1', 1743503319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530333331393b),
('l8h5269k4vg1nl4o6f5esv82qr2k49ev', '::1', 1743460585, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333436303538353b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b),
('l922noocrqatob108ai04didbct72m3s', '::1', 1743618457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333631383435373b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ld7g7m0k06penc6sek9pfc0l3vqi64dq', '::1', 1743503004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530333030343b),
('ldlbck7c3m7quappkg90unuke8mui163', '::1', 1743623312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632333331323b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ll3u5gd4el9radcvile62460qi7u8o1u', '::1', 1743281406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333238313430363b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('lofg9vbkuth5e3tkipif6df823g603fo', '::1', 1746300257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363330303235363b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b),
('m2k3545ram6jq9mddjrk8m71dcjvk8pq', '::1', 1747822122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373832323131363b),
('m7mmihibkq520tjb5r609tru9bpetlno', '::1', 1743282436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333238323433363b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('m9kgppc79nham2g0706sitqb6aa79jr7', '::1', 1744224156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343232343135353b),
('mbddir68r3o70fgaa81lrqjdgl5v5srl', '::1', 1743507899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530373839393b),
('mbn4m9fei5jv7ev7j296i42b2b6fqbrv', '::1', 1743365110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336353131303b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('mc64kca6p0tpioi7g01ul8ocf71if9l8', '::1', 1743709897, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333730393839363b),
('mm758umh1q40f512qsn5o5fsus5vp546', '::1', 1747710702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373731303730323b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('mvcl7klko08f5mi96a8bcpqu69h31q21', '::1', 1743433974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333433333837303b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('n1qh69ioorhmnk3j6f99t99cgghgk73u', '::1', 1743505993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530353939333b),
('n6jafntqg2m340lcbff54k05r93egd4r', '::1', 1743368404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336383430343b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('n7qqcsln506ve6f2gta15b2m68u3uh00', '::1', 1743885961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333838353936313b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b),
('nbh1h7vsqhg0s0ttrknfgu58h7as95be', '::1', 1743505978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530353735343b),
('nddorgvtfevut3f23urrk2g55c6o8j1m', '::1', 1743355286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335353238363b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('nv3gm1qv1686e2l1oqfc4ceurmk7tjhq', '::1', 1743376003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337363030333b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('o5u1ubi4d9hvlttjjabhrfv6a16fra2n', '::1', 1743374306, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337343330363b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('oc3cvjdl1hmqerm64sj6elq39jijfg2s', '::1', 1743539258, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533393235383b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ocnhqg4gik4kjhtb5g6s8jqvgq7k9uv1', '::1', 1743355595, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335353539353b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('omv0d97i5hgaai4ttmijkvaqhvt35b2a', '::1', 1743538933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533383933333b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('pda8fusin2dt9iavdhffodet4qgftumo', '::1', 1743367716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336373731363b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('pg06vpb7kljl617g448rrmtomup16hbk', '::1', 1743341619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334313631393b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ph5rg8pv8seu2cvksf36o82jlr7ssnai', '::1', 1743618276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333631383237353b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b),
('pj2g0dn5b7vju87bsqfatgdm8up97akp', '::1', 1747704682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373730343636383b6e616d657c733a373a2274656163686572223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2234223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2233223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('plh8cod51c496jslenntm477a7g9nvc7', '::1', 1743323489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333332333438393b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('pn4c43mdl2fff7tfkobqa0ma5su845k2', '::1', 1743360452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336303435323b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('prf9hoav4b2lj4n9tvaktuojhhiifir6', '::1', 1743343759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334333735393b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('q67jjugc9m1m772o9luaeodt5qod61h4', '::1', 1743700546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333730303533373b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('q6ipe2ufu7cuvca6jmnu155thnojchji', '::1', 1743375626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337353632363b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('qf0m7uddf72ssocdqk5o03mrmcr3phmv', '::1', 1743372867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337323836373b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a303a22223b656e726f6c6c49447c733a313a2232223b),
('qj2dcmnnimdupe3o9pcaglgb0c080cfq', '::1', 1743368065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336383036353b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('qmsbeupuntp8tibg959oojqbmij50vlm', '::1', 1743410110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333431303131303b6e616d657c733a31343a2241646477616c652047656f726765223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2238223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2232223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33343a2254686520436f6e66696775726174696f6e20486173204265656e2055706461746564223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d);
INSERT INTO `rm_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('r5flrpekk5abo2gjg5nb0901tq032tl2', '::1', 1743278787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333237383738373b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('r7370s88ndvcg5bobrnrscvhqp4m99gv', '::1', 1746339660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363333393636303b),
('r823d35as9nuk5gsmvp6veq807qb1q7s', '::1', 1743364451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336343435313b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('rgdo5r02ajnsbele4424tqlqnnujpaqf', '::1', 1743502005, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530323030353b),
('rgjb9mesdg90nn2n6g4t0dagl866k9q5', '::1', 1743362415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336323431353b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('rh07sr517aejeifso30gva3viq47th2g', '::1', 1744546820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343534363832303b72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f6172642f696e646578223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('rjjabivlh2o7965qr4gsmvlspst96st1', '::1', 1744547531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343534373533313b72656469726563745f75726c7c733a34323a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f6172642f696e646578223b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('rkf164d2g7aujkess0vehcfrrbdsm0ff', '::1', 1743535761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533353736313b),
('rril8qjo0c0mgflhklidg4tg0mo2vmnp', '::1', 1743501104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530313130343b),
('s0ecum8r4kpik7lrocuhpk2mv1q35giv', '::1', 1743337671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333333373637313b6e616d657c733a353a226163636331223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2237223b6c6f67676564696e5f7573657269647c733a313a2233223b6c6f67676564696e5f726f6c655f69647c733a313a2234223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('s440jdcl59oobesdirbjoet983113bcn', '::1', 1743540399, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333534303337363b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('sg9th6l5okpdaemaf1ohbeq60oldu124', '::1', 1743626352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333632363335323b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('shupo4kj933mrehdhottclr5htljlegr', '::1', 1743376408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337363333383b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('sslu4kja5aq24k10e0c1cp8fklg2e0os', '::1', 1743365917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336353931373b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('t92kqe2fnp1paif4nqnjrqudbnh4v3ej', '::1', 1743352079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335323037393b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('tae6a7lupp8f99th5tkgsctisrfifafg', '::1', 1743356384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335363338343b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('tdn86umg4ov09c1tge1lo7upngdd4eoo', '::1', 1743365566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336353536363b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('toqks9d16lb5rvvnet7fr4gc3qpbs8qk', '::1', 1743366622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333336363632323b6e616d657c733a393a22705b6f697574726577223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('ttpqt7ftsaaoiunmpl7o8ghd1akn0f06', '::1', 1743432666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333433323636363b656e726f6c6c49447c733a313a2232223b6e616d657c733a31323a22544553542053545544454e54223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2236223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2237223b6c6f67676564696e5f747970657c733a373a2273747564656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('u44tbijmdo453mu6vtodurd9esma0vk6', '::1', 1743967837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333936373833373b),
('u7atrghav5pcs117gmdo4iu6ef7fc9lj', '::1', 1743282737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333238323733373b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('u9ot7a500sk7q1uu4ih5i9u2jrs6pht9', '::1', 1743463789, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333436333738383b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b),
('ubp7bojrq8if6bj0a3g5145o23nvl6du', '::1', 1743410709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333431303637373b6e616d657c733a31343a2241646477616c652047656f726765223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2238223b6c6f67676564696e5f7573657269647c733a313a2234223b6c6f67676564696e5f726f6c655f69647c733a313a2232223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b616c6572742d6d6573736167652d737563636573737c733a33343a2254686520436f6e66696775726174696f6e20486173204265656e2055706461746564223b5f5f63695f766172737c613a313a7b733a32313a22616c6572742d6d6573736167652d73756363657373223b733a333a226f6c64223b7d),
('uflq05a5u37i2h4uolsar7bmtse3u1te', '::1', 1743280464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333238303436343b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ug4dagagn5m9anpjsitgq9lsphvq2buq', '::1', 1743356741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333335363734313b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('uh4ajni58u18099186u6enm0i0sutgls', '::1', 1743506888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530363838383b),
('uin1f1261n111ofunhhobacgd2hkp0u5', '127.0.0.1', 1745786375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734353738363337343b),
('urme7nsjagc7548mtecr3no78na2vnej', '::1', 1743343436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333334333433363b6e616d657c733a31343a2253616d75656c20416b696e676265223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('v2bhj1uq470o93vdjfv97pul71javtic', '::1', 1743376338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333337363333383b6e616d657c733a31313a226d72732041646577616c65223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c733a313a2231223b6c6f67676564696e5f69647c733a313a2235223b6c6f67676564696e5f7573657269647c733a313a2232223b6c6f67676564696e5f726f6c655f69647c733a313a2236223b6c6f67676564696e5f747970657c733a363a22706172656e74223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b6d794368696c6472656e5f69647c733a313a2232223b656e726f6c6c49447c733a313a2232223b),
('v352ug8es96lg3cskk4r6fior5cfhmn8', '::1', 1743619976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333631393937363b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('ve7ks9ai9pr66fg08oo0fnhj48249fv7', '::1', 1743503632, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333530333633323b6e616d657c733a31373a2253616d75656c20416b696e676265206a72223b6c6f676765725f70686f746f7c733a31313a2264656675616c742e706e67223b6c6f67676564696e5f6272616e63687c4e3b6c6f67676564696e5f69647c733a313a2231223b6c6f67676564696e5f7573657269647c733a313a2231223b6c6f67676564696e5f726f6c655f69647c733a313a2231223b6c6f67676564696e5f747970657c733a353a227374616666223b7365745f6c616e677c733a373a22656e676c697368223b69735f72746c7c623a303b7365745f73657373696f6e5f69647c733a313a2235223b6c6f67676564696e7c623a313b),
('vpn9m45esrugho5lgqngvkj33ieeq7c5', '::1', 1743534957, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533343739303b),
('vrj6k18j9h8fe6qqve5hk47hnclpolic', '127.0.0.1', 1743885961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333838353936313b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b),
('vrjigdgn35pq7soors3v9j98qihnmado', '::1', 1743457418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333435373431383b72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f5363686f6f6c6d67742f64617368626f617264223b);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `is_system` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `prefix`, `is_system`) VALUES
(1, 'Super Admin', 'superadmin', '1'),
(2, 'Admin', 'admin', '1'),
(3, 'Teacher', 'teacher', '1'),
(4, 'Accountant', 'accountant', '1'),
(5, 'Librarian', 'librarian', '1'),
(6, 'Parent', 'parent', '1'),
(7, 'Student', 'student', '1'),
(8, 'Receptionist', 'receptionist', '1');

-- --------------------------------------------------------

--
-- Table structure for table `saas_cms_faq_list`
--

CREATE TABLE `saas_cms_faq_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saas_cms_features`
--

CREATE TABLE `saas_cms_features` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `saas_cms_features`
--

INSERT INTO `saas_cms_features` (`id`, `title`, `description`, `icon`, `created_at`) VALUES
(1, 'Online Course Facilities', 'It is a long established fact that a reader will be distracted by the readable content of a page at its layout.', 'fas fa-headphones', '2023-03-14 19:17:42'),
(2, 'QR Attendance', 'It is a long established fact that a reader will be distracted by the readable content of a page at its layout.', 'fas fa-qrcode', '2023-03-14 19:17:42'),
(3, 'School Subscription (Saas)', 'It is a long established fact that a reader will be distracted by the readable content of a page at its layout.', 'fas fa-sitemap', '2023-03-14 19:17:42'),
(4, 'Powerfull Fees Management', 'It is a long established fact that a reader will be distracted by the readable content of a page at its layout.', 'fas fa-credit-card', '2023-03-14 19:17:42'),
(5, 'ID Card Generator', 'It is a long established fact that a reader will be distracted by the readable content of a page at its layout.', 'fas fa-id-card-alt', '2023-03-14 19:17:42'),
(6, 'Online Payment Gateway', 'It is a long established fact that a reader will be distracted by the readable content of a page at its layout.', 'fas fa-headphones', '2023-03-14 19:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `saas_email_templates`
--

CREATE TABLE `saas_email_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `template_body` text DEFAULT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT 0,
  `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `saas_email_templates`
--

INSERT INTO `saas_email_templates` (`id`, `name`, `subject`, `template_body`, `notified`, `tags`) VALUES
(1, 'school_registered', 'Submit School Registered Form', NULL, 0, '{institute_name}, {admin_name}, {login_username}, {password}, {school_name}, {plan_name}, {invoice_url}, {payment_url}, {reference_no}, {date}, {fees_amount}'),
(2, 'school_subscription_payment_confirmation', 'School Subscription Payment Confirmation', NULL, 0, '{institute_name}, {admin_name},  {school_name}, {plan_name}, {invoice_url}, {reference_no}, {date}, {paid_amount}'),
(3, 'school_subscription_approval_confirmation', 'School Subscription Approval Confirmation', NULL, 0, '{institute_name}, {admin_name}, {login_username}, {password}, {school_name}, {plan_name}, {invoice_url}, {reference_no}, {subscription_start_date}, {subscription_expiry_date}, {paid_amount}'),
(4, 'school_subscription_reject', 'School Subscription Reject', NULL, 0, '{institute_name}, {admin_name}, {school_name}, {reject_reason}');

-- --------------------------------------------------------

--
-- Table structure for table `saas_offline_payments`
--

CREATE TABLE `saas_offline_payments` (
  `id` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `school_register_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `submit_date` datetime DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `orig_file_name` varchar(255) DEFAULT NULL,
  `enc_file_name` text DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saas_offline_payment_types`
--

CREATE TABLE `saas_offline_payment_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saas_package`
--

CREATE TABLE `saas_package` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(20) NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `student_limit` float NOT NULL,
  `staff_limit` float NOT NULL,
  `teacher_limit` float NOT NULL,
  `parents_limit` float NOT NULL,
  `status` tinyint(1) NOT NULL,
  `show_onwebsite` tinyint(1) NOT NULL DEFAULT 1,
  `period_type` tinyint(1) NOT NULL,
  `period_value` int(11) NOT NULL DEFAULT 0,
  `free_trial` tinyint(4) NOT NULL DEFAULT 0,
  `permission` longtext DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `saas_package`
--

INSERT INTO `saas_package` (`id`, `name`, `price`, `discount`, `student_limit`, `staff_limit`, `teacher_limit`, `parents_limit`, `status`, `show_onwebsite`, `period_type`, `period_value`, `free_trial`, `permission`, `recommended`, `created_at`, `updated_at`) VALUES
(1, 'forever', '0', 0, 1e36, 1e38, 3.40282e38, 1e36, 1, 0, 1, 0, 0, '[\"26\",\"8\",\"12\",\"15\",\"21\",\"20\",\"400\",\"14\",\"7\",\"10\",\"5\",\"25\",\"13\",\"19\",\"27\",\"17\",\"23\",\"500\",\"24\",\"16\",\"11\",\"22\"]', 0, '2025-02-03 08:21:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `saas_school_register`
--

CREATE TABLE `saas_school_register` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `package_id` int(11) NOT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_amount` double(18,2) NOT NULL DEFAULT 0.00,
  `payment_data` text DEFAULT NULL,
  `date_of_approval` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saas_settings`
--

CREATE TABLE `saas_settings` (
  `id` int(11) NOT NULL,
  `expired_alert` tinyint(1) NOT NULL DEFAULT 0,
  `expired_alert_days` int(11) NOT NULL DEFAULT 7,
  `expired_alert_message` varchar(500) DEFAULT NULL,
  `expired_message` varchar(500) DEFAULT NULL,
  `slider_title` varchar(255) DEFAULT NULL,
  `slider_description` varchar(900) DEFAULT NULL,
  `slider_bg_image` varchar(255) DEFAULT NULL,
  `slider_image` varchar(255) DEFAULT NULL,
  `terms_status` tinyint(1) NOT NULL DEFAULT 0,
  `agree_checkbox_text` varchar(255) DEFAULT NULL,
  `terms_and_conditions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `overly_image_status` tinyint(1) NOT NULL DEFAULT 1,
  `overly_image` varchar(255) DEFAULT NULL,
  `automatic_approval` tinyint(1) NOT NULL DEFAULT 0,
  `captcha_status` tinyint(1) NOT NULL DEFAULT 0,
  `recaptcha_site_key` varchar(255) DEFAULT NULL,
  `recaptcha_secret_key` varchar(255) DEFAULT NULL,
  `offline_payments` tinyint(1) NOT NULL DEFAULT 0,
  `pwa_enable` tinyint(1) NOT NULL DEFAULT 0,
  `button_text_1` varchar(255) DEFAULT NULL,
  `button_url_1` varchar(255) DEFAULT NULL,
  `button_text_2` varchar(255) DEFAULT NULL,
  `button_url_2` varchar(255) DEFAULT NULL,
  `feature_title` varchar(255) DEFAULT NULL,
  `feature_description` varchar(900) DEFAULT NULL,
  `price_plan_title` varchar(255) DEFAULT NULL,
  `price_plan_description` varchar(900) DEFAULT NULL,
  `price_plan_button` varchar(255) DEFAULT NULL,
  `faq_title` varchar(255) DEFAULT NULL,
  `faq_description` varchar(900) DEFAULT NULL,
  `contact_title` varchar(255) NOT NULL,
  `receive_contact_email` varchar(255) DEFAULT NULL,
  `contact_description` varchar(255) NOT NULL,
  `contact_button` varchar(255) NOT NULL,
  `footer_about` varchar(500) DEFAULT NULL,
  `payment_logo` varchar(255) DEFAULT NULL,
  `primary_color` varchar(255) NOT NULL DEFAULT '#ff6b81',
  `menu_bg_color` varchar(255) NOT NULL DEFAULT '#ff6b81',
  `menu_text_color` varchar(255) DEFAULT '#fff',
  `heading_text_color` varchar(255) NOT NULL DEFAULT '#081828',
  `footer_bg_color` varchar(255) NOT NULL DEFAULT '#081828',
  `footer_text_color` varchar(255) NOT NULL DEFAULT '#D2D6DC',
  `copyright_bg_color` varchar(255) NOT NULL DEFAULT '#1e1e1e',
  `copyright_text_color` varchar(255) NOT NULL DEFAULT '#888',
  `text_color` varchar(255) NOT NULL DEFAULT '#888',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keyword` varchar(500) DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `google_analytics` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `saas_settings`
--

INSERT INTO `saas_settings` (`id`, `expired_alert`, `expired_alert_days`, `expired_alert_message`, `expired_message`, `slider_title`, `slider_description`, `slider_bg_image`, `slider_image`, `terms_status`, `agree_checkbox_text`, `terms_and_conditions`, `overly_image_status`, `overly_image`, `automatic_approval`, `captcha_status`, `recaptcha_site_key`, `recaptcha_secret_key`, `offline_payments`, `pwa_enable`, `button_text_1`, `button_url_1`, `button_text_2`, `button_url_2`, `feature_title`, `feature_description`, `price_plan_title`, `price_plan_description`, `price_plan_button`, `faq_title`, `faq_description`, `contact_title`, `receive_contact_email`, `contact_description`, `contact_button`, `footer_about`, `payment_logo`, `primary_color`, `menu_bg_color`, `menu_text_color`, `heading_text_color`, `footer_bg_color`, `footer_text_color`, `copyright_bg_color`, `copyright_text_color`, `text_color`, `seo_title`, `seo_keyword`, `seo_description`, `google_analytics`, `created_at`) VALUES
(1, 0, 7, 'Your school subscription will expire in {days} days.', 'Your school subscription has already expired, Please <a href=\"subscription/index\">Renew</a> the subscription.', 'Choose smart be smart for your school.', 'From open source to pro services, Piqes helps you to build, deploy, test, and monitor apps.', 'slider_bg.jpg', 'slider.png', 0, 'I agree to <a href=\"javascript:void(0)\" class=\"terms\">Terms & Conditions.</a>', 'Your terms and conditions here...', 1, 'slider_over.png', 0, 0, '', '', 0, 1, '<i class=\'fas fa-globe\'></i> School Web', '#', '<i class=\'fas fa-coins\'></i> Plan Price', '#pricing', 'Your Experience Gets Better And Better Over Time.', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.', 'Pricing Plan', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.', 'Choose Plan', 'Frequently Asked Questions', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.', 'Contact Us', 'example@admin.com', 'Need Any Urgent Help? Call us Anytime!', 'Send Message', 'Making the world a better place through constructing elegant hierarchies.', 'payment_icon.png', '#ff6b81', 'transparent', '#fff', '#081828', '#081828', '#D2D6DC', '#1e1e1e', '#888', '#888', 'bgs', '', '', '', '2022-11-28 06:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `saas_subscriptions`
--

CREATE TABLE `saas_subscriptions` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `expire_date` varchar(100) DEFAULT NULL,
  `upgrade_lasttime` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `saas_subscriptions`
--

INSERT INTO `saas_subscriptions` (`id`, `package_id`, `school_id`, `expire_date`, `upgrade_lasttime`, `created_at`) VALUES
(1, 1, 2, '', NULL, '2025-02-03 19:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `saas_subscriptions_transactions`
--

CREATE TABLE `saas_subscriptions_transactions` (
  `id` int(11) NOT NULL,
  `subscriptions_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `payment_method` tinyint(4) NOT NULL,
  `renew` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_date` date NOT NULL,
  `expire_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `saas_subscriptions_transactions`
--

INSERT INTO `saas_subscriptions_transactions` (`id`, `subscriptions_id`, `package_id`, `payment_id`, `amount`, `discount`, `payment_method`, `renew`, `purchase_date`, `expire_date`, `created_at`) VALUES
(1, 1, 1, '40e77985', 0.00, 0.00, 1, 0, '2025-02-03', '0000-00-00', '2025-02-03 20:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `salary_template`
--

CREATE TABLE `salary_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `basic_salary` decimal(18,2) NOT NULL,
  `overtime_salary` varchar(100) NOT NULL DEFAULT '0',
  `branch_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_template_details`
--

CREATE TABLE `salary_template_details` (
  `id` int(11) NOT NULL,
  `salary_template_id` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_bill`
--

CREATE TABLE `sales_bill` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `paid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `due` decimal(18,2) NOT NULL DEFAULT 0.00,
  `payment_status` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_bill_details`
--

CREATE TABLE `sales_bill_details` (
  `id` int(11) NOT NULL,
  `sales_bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `quantity` varchar(20) NOT NULL,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_payment_history`
--

CREATE TABLE `sales_payment_history` (
  `id` int(11) NOT NULL,
  `sales_bill_id` varchar(11) NOT NULL,
  `payment_by` int(11) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `pay_via` varchar(25) NOT NULL,
  `remarks` text NOT NULL,
  `attach_orig_name` varchar(255) DEFAULT NULL,
  `attach_file_name` varchar(255) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `coll_type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schoolyear`
--

CREATE TABLE `schoolyear` (
  `id` int(11) NOT NULL,
  `school_year` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `schoolyear`
--

INSERT INTO `schoolyear` (`id`, `school_year`, `created_by`, `created_at`, `updated_at`) VALUES
(4, '2023-2024', 1, '2020-02-25 18:35:41', '2023-08-18 01:35:41'),
(5, '2024-2025', 1, '2020-02-25 18:35:41', '2023-08-18 01:35:41'),
(6, '2025-2026', 1, '2020-02-25 18:35:41', '2023-08-18 01:35:41'),
(7, '2026-2027', 1, '2020-02-25 18:35:41', '2023-08-18 01:20:04'),
(9, '2027-2028', 1, '2020-02-26 06:00:10', '2023-08-18 13:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `capacity` varchar(20) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`, `capacity`, `branch_id`) VALUES
(1, 'Primary', '', 1),
(2, 'Nursery', '', 1),
(3, 'Junior Secondary', '', 1),
(5, 'Science', '', 1),
(6, 'Commercial', '', 1),
(7, 'Art', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections_allocation`
--

CREATE TABLE `sections_allocation` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sections_allocation`
--

INSERT INTO `sections_allocation` (`id`, `class_id`, `section_id`) VALUES
(2, 1, 2),
(3, 2, 2),
(4, 3, 2),
(5, 4, 2),
(6, 5, 1),
(7, 6, 1),
(8, 7, 1),
(9, 8, 1),
(10, 9, 1),
(11, 10, 1),
(12, 11, 3),
(13, 12, 3),
(14, 13, 3),
(18, 14, 5),
(19, 14, 6),
(20, 14, 7),
(21, 15, 5),
(22, 15, 6),
(23, 15, 7),
(24, 16, 5),
(25, 16, 6),
(26, 16, 7),
(27, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_api`
--

CREATE TABLE `sms_api` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sms_api`
--

INSERT INTO `sms_api` (`id`, `name`) VALUES
(1, 'twilio'),
(2, 'clickatell'),
(3, 'msg91'),
(4, 'bulksms'),
(5, 'textlocal'),
(6, 'smscountry'),
(7, 'bulksmsbd'),
(8, 'customsms');

-- --------------------------------------------------------

--
-- Table structure for table `sms_credential`
--

CREATE TABLE `sms_credential` (
  `id` int(11) NOT NULL,
  `sms_api_id` int(11) NOT NULL,
  `field_one` varchar(300) NOT NULL,
  `field_two` varchar(300) NOT NULL,
  `field_three` varchar(300) NOT NULL,
  `field_four` varchar(300) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

CREATE TABLE `sms_template` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tags` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sms_template`
--

INSERT INTO `sms_template` (`id`, `name`, `tags`) VALUES
(1, 'admission', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}'),
(2, 'fee_collection', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {paid_amount}, {paid_date} '),
(3, 'attendance', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}'),
(4, 'exam_attendance', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_name}, {term_name}, {subject}'),
(5, 'exam_results', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_name}, {term_name}, {subject}, {marks}'),
(6, 'homework', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {subject}, {date_of_homework}, {date_of_submission}'),
(7, 'live_class', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {date_of_live_class}, {start_time}, {end_time}, {host_by}'),
(8, 'online_exam_publish', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {exam_title}, {start_time}, {end_time}, {time_duration}, {attempt}, {passing_mark}, {exam_fee}'),
(9, 'student_birthday_wishes', '{name}, {class}, {section}, {admission_date}, {roll}, {register_no}, {birthday}'),
(10, 'staff_birthday_wishes', '{name}, {birthday}, {joining_date}'),
(11, 'alumni_event', '{student_name}, {event_title}, {start_date}, {end_date}');

-- --------------------------------------------------------

--
-- Table structure for table `sms_template_details`
--

CREATE TABLE `sms_template_details` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `dlt_template_id` varchar(255) DEFAULT NULL,
  `notify_student` tinyint(4) NOT NULL DEFAULT 1,
  `notify_parent` tinyint(4) NOT NULL DEFAULT 1,
  `template_body` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` int(11) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `experience_details` varchar(255) DEFAULT NULL,
  `total_experience` varchar(255) DEFAULT NULL,
  `designation` int(11) NOT NULL,
  `joining_date` varchar(100) NOT NULL,
  `birthday` varchar(100) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `religion` varchar(100) NOT NULL,
  `blood_group` varchar(20) NOT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text NOT NULL,
  `mobileno` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `salary_template_id` int(11) DEFAULT 0,
  `branch_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff_id`, `name`, `department`, `qualification`, `experience_details`, `total_experience`, `designation`, `joining_date`, `birthday`, `sex`, `religion`, `blood_group`, `present_address`, `permanent_address`, `mobileno`, `email`, `salary_template_id`, `branch_id`, `photo`, `facebook_url`, `linkedin_url`, `twitter_url`, `created_at`, `updated_at`) VALUES
(1, 'bd5f25b', 'Samuel Akingbe jr', 0, '', NULL, NULL, 0, '2024-05-27', '', '', '', '', 'cdcdcdc', '', '93494300433', 'samulemayowa33@gmail.com', 0, NULL, 'defualt.png', NULL, NULL, NULL, '2024-05-27 01:58:46', NULL),
(2, 'b9609c4', 'teacher', 1, 'hnd', '', '5', 1, '2025-02-08', '', '', '', '', 'efregrgrgrgr', '', '435645657897', '4trrgt5t@kuk.no', 0, 1, 'defualt.png', NULL, NULL, NULL, '2025-02-08 09:38:54', NULL),
(3, '6bf3778', 'accc1', 1, 'cswdswsw', '', '', 2, '2025-02-08', '', '', '', '', 'efrfrfrfrrfrfr', '', '424242424', 'fweae@fr.com', 0, 1, 'defualt.png', NULL, NULL, NULL, '2025-02-08 20:25:54', NULL),
(4, '806de9a', 'Addwale George', 1, 'Hnd', '', '', 2, '2025-02-09', '', 'male', '', 'A-', '4 wale aloman street ifako ijaye', '', '07088476285', 'thechroniclemusic@gmail.com', 0, 1, 'defualt.png', NULL, NULL, NULL, '2025-02-09 05:32:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `status` varchar(11) DEFAULT NULL COMMENT 'P=Present, A=Absent, H=Holiday, L=Late',
  `remark` varchar(255) NOT NULL,
  `qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff_attendance`
--

INSERT INTO `staff_attendance` (`id`, `staff_id`, `status`, `remark`, `qr_code`, `in_time`, `out_time`, `date`, `branch_id`) VALUES
(1, 4, 'P', '', 0, NULL, NULL, '2025-03-14', 1),
(2, 4, 'P', '', 0, NULL, NULL, '2025-03-29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_bank_account`
--

CREATE TABLE `staff_bank_account` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `holder_name` varchar(255) NOT NULL,
  `bank_branch` varchar(255) NOT NULL,
  `bank_address` varchar(255) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_department`
--

CREATE TABLE `staff_department` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff_department`
--

INSERT INTO `staff_department` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, '2025-02-07 18:18:17', NULL),
(2, 'Primary', 1, '2025-02-12 09:02:21', NULL),
(3, 'Secondary', 1, '2025-02-12 09:02:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`id`, `name`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Teaching Staff', 1, '2025-02-08 09:36:16', NULL),
(2, 'Non Teaching Staff', 1, '2025-02-08 09:36:29', NULL),
(3, 'Accountant', 1, '2025-02-12 09:02:58', NULL),
(4, 'Head Teacher', 1, '2025-02-12 09:03:10', NULL),
(5, 'HOD', 1, '2025-02-12 09:03:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_documents`
--

CREATE TABLE `staff_documents` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` varchar(20) NOT NULL,
  `remarks` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_privileges`
--

CREATE TABLE `staff_privileges` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_view` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `staff_privileges`
--

INSERT INTO `staff_privileges` (`id`, `role_id`, `permission_id`, `is_add`, `is_edit`, `is_view`, `is_delete`) VALUES
(1, 3, 1, 1, 1, 1, 1),
(2, 3, 2, 0, 0, 0, 0),
(3, 3, 3, 1, 1, 1, 1),
(4, 3, 4, 0, 0, 0, 0),
(5, 3, 5, 0, 0, 0, 0),
(6, 3, 30, 0, 0, 0, 0),
(7, 3, 7, 0, 0, 0, 0),
(8, 3, 8, 0, 0, 0, 0),
(9, 3, 6, 0, 0, 1, 0),
(10, 3, 9, 0, 0, 0, 0),
(11, 3, 10, 0, 0, 0, 0),
(12, 3, 11, 0, 0, 0, 0),
(13, 3, 12, 0, 0, 0, 0),
(14, 3, 13, 0, 0, 0, 0),
(15, 3, 14, 0, 0, 1, 0),
(16, 3, 15, 0, 0, 1, 0),
(17, 3, 16, 0, 0, 0, 0),
(18, 3, 17, 0, 0, 0, 0),
(20, 3, 19, 0, 0, 0, 0),
(21, 3, 20, 1, 1, 1, 1),
(22, 3, 21, 0, 0, 0, 0),
(23, 3, 22, 0, 0, 1, 0),
(24, 3, 23, 0, 0, 1, 0),
(25, 3, 24, 0, 0, 1, 0),
(26, 3, 25, 0, 0, 1, 0),
(27, 3, 26, 0, 0, 1, 0),
(28, 3, 27, 0, 0, 1, 0),
(29, 3, 28, 0, 0, 1, 0),
(30, 3, 29, 0, 0, 1, 0),
(31, 3, 32, 1, 1, 1, 1),
(32, 3, 31, 1, 1, 1, 1),
(33, 3, 33, 1, 1, 1, 1),
(34, 3, 34, 1, 1, 1, 1),
(35, 3, 35, 1, 1, 1, 1),
(36, 3, 36, 1, 1, 1, 1),
(37, 3, 37, 0, 0, 0, 0),
(38, 3, 38, 1, 1, 1, 1),
(39, 3, 39, 1, 1, 1, 1),
(40, 3, 77, 1, 1, 1, 1),
(41, 3, 78, 0, 0, 1, 0),
(42, 3, 79, 0, 0, 0, 0),
(43, 3, 40, 0, 0, 0, 0),
(44, 3, 41, 0, 0, 0, 0),
(45, 3, 42, 0, 0, 0, 0),
(46, 3, 43, 0, 0, 0, 0),
(47, 3, 44, 0, 0, 0, 0),
(48, 3, 45, 0, 0, 0, 0),
(49, 3, 46, 0, 0, 0, 0),
(50, 3, 47, 0, 0, 0, 0),
(51, 3, 48, 0, 0, 0, 0),
(52, 3, 49, 1, 0, 0, 0),
(53, 3, 50, 0, 0, 0, 0),
(54, 3, 51, 0, 0, 0, 0),
(55, 3, 52, 0, 0, 0, 0),
(56, 3, 53, 0, 0, 0, 0),
(57, 3, 54, 0, 0, 0, 0),
(58, 3, 55, 0, 0, 1, 0),
(59, 3, 56, 0, 0, 0, 0),
(60, 3, 57, 0, 0, 0, 0),
(61, 3, 58, 1, 0, 1, 1),
(62, 3, 59, 0, 0, 1, 0),
(63, 3, 60, 0, 0, 0, 0),
(64, 3, 61, 0, 0, 0, 0),
(65, 3, 62, 0, 0, 0, 0),
(66, 3, 80, 0, 0, 0, 0),
(67, 3, 69, 0, 0, 0, 0),
(68, 3, 70, 0, 0, 0, 0),
(69, 3, 71, 0, 0, 0, 0),
(70, 3, 72, 0, 0, 0, 0),
(71, 3, 73, 0, 0, 0, 0),
(72, 3, 74, 0, 0, 0, 0),
(73, 3, 75, 0, 0, 0, 0),
(74, 3, 76, 0, 0, 0, 0),
(75, 3, 63, 0, 0, 0, 0),
(76, 3, 64, 0, 0, 0, 0),
(77, 3, 65, 0, 0, 0, 0),
(78, 3, 66, 0, 0, 0, 0),
(79, 3, 67, 0, 0, 0, 0),
(80, 3, 68, 0, 0, 0, 0),
(81, 3, 81, 0, 0, 0, 0),
(82, 3, 82, 0, 0, 0, 0),
(83, 3, 83, 0, 0, 0, 0),
(84, 3, 84, 0, 0, 0, 0),
(85, 3, 85, 0, 0, 0, 0),
(86, 3, 86, 0, 0, 0, 0),
(87, 3, 87, 0, 0, 0, 0),
(88, 2, 1, 1, 1, 1, 1),
(89, 2, 2, 1, 0, 0, 0),
(90, 2, 3, 1, 1, 1, 1),
(91, 2, 4, 0, 0, 1, 0),
(92, 2, 5, 1, 0, 1, 0),
(93, 2, 30, 1, 0, 1, 0),
(94, 2, 7, 1, 1, 1, 1),
(95, 2, 8, 1, 0, 1, 0),
(96, 2, 6, 1, 1, 1, 1),
(97, 2, 9, 1, 1, 1, 1),
(98, 2, 10, 1, 1, 1, 1),
(99, 2, 11, 1, 0, 1, 0),
(100, 2, 12, 1, 1, 1, 1),
(101, 2, 13, 1, 0, 1, 0),
(102, 2, 14, 1, 0, 1, 0),
(103, 2, 15, 0, 0, 1, 0),
(104, 2, 16, 1, 1, 1, 1),
(105, 2, 17, 1, 1, 1, 1),
(107, 2, 19, 1, 1, 1, 1),
(108, 2, 20, 1, 1, 1, 1),
(109, 2, 21, 1, 1, 1, 1),
(110, 2, 22, 1, 1, 1, 1),
(111, 2, 23, 1, 1, 1, 1),
(112, 2, 24, 1, 1, 1, 1),
(113, 2, 25, 1, 1, 1, 1),
(114, 2, 26, 1, 1, 1, 1),
(115, 2, 27, 1, 1, 1, 1),
(116, 2, 28, 1, 0, 1, 1),
(117, 2, 29, 1, 1, 1, 1),
(118, 2, 32, 1, 1, 1, 1),
(119, 2, 31, 1, 1, 1, 1),
(120, 2, 33, 1, 1, 1, 1),
(121, 2, 34, 1, 1, 1, 1),
(122, 2, 35, 1, 1, 1, 1),
(123, 2, 36, 1, 1, 1, 1),
(124, 2, 37, 1, 0, 1, 1),
(125, 2, 38, 1, 1, 1, 1),
(126, 2, 39, 1, 1, 1, 1),
(127, 2, 77, 1, 1, 1, 1),
(128, 2, 78, 0, 0, 1, 0),
(129, 2, 79, 0, 0, 1, 0),
(130, 2, 40, 1, 1, 1, 1),
(131, 2, 41, 1, 1, 1, 1),
(132, 2, 42, 1, 1, 1, 1),
(133, 2, 43, 0, 0, 1, 1),
(134, 2, 44, 1, 1, 1, 1),
(135, 2, 45, 1, 1, 1, 1),
(136, 2, 46, 1, 1, 1, 1),
(137, 2, 47, 1, 1, 1, 1),
(138, 2, 48, 0, 0, 1, 1),
(139, 2, 49, 1, 0, 0, 0),
(140, 2, 50, 1, 0, 0, 0),
(141, 2, 51, 1, 0, 0, 0),
(142, 2, 52, 0, 0, 1, 0),
(143, 2, 53, 0, 0, 1, 0),
(144, 2, 54, 0, 0, 1, 0),
(145, 2, 55, 1, 1, 1, 1),
(146, 2, 56, 1, 1, 1, 1),
(147, 2, 57, 1, 0, 1, 1),
(148, 2, 58, 1, 0, 1, 1),
(149, 2, 59, 1, 1, 1, 1),
(150, 2, 60, 1, 1, 1, 1),
(151, 2, 61, 1, 0, 1, 1),
(152, 2, 62, 1, 1, 1, 1),
(153, 2, 80, 0, 0, 1, 0),
(154, 2, 69, 1, 1, 1, 1),
(155, 2, 70, 1, 1, 1, 1),
(156, 2, 71, 1, 1, 1, 1),
(157, 2, 72, 1, 1, 1, 1),
(158, 2, 73, 1, 0, 0, 0),
(159, 2, 74, 1, 1, 1, 1),
(160, 2, 75, 0, 0, 1, 0),
(161, 2, 76, 0, 0, 1, 1),
(162, 2, 63, 1, 1, 1, 1),
(163, 2, 64, 1, 1, 1, 1),
(164, 2, 65, 1, 1, 1, 1),
(165, 2, 66, 0, 0, 1, 0),
(166, 2, 67, 1, 1, 1, 1),
(167, 2, 68, 1, 1, 1, 1),
(168, 2, 81, 0, 0, 0, 0),
(169, 2, 82, 1, 0, 1, 0),
(170, 2, 83, 1, 1, 1, 1),
(171, 2, 84, 1, 1, 1, 1),
(172, 2, 85, 1, 1, 1, 1),
(173, 2, 86, 0, 0, 0, 0),
(174, 2, 87, 0, 0, 0, 0),
(175, 7, 1, 0, 0, 0, 0),
(176, 7, 2, 0, 0, 0, 0),
(177, 7, 3, 0, 0, 0, 0),
(178, 7, 4, 0, 0, 0, 0),
(179, 7, 5, 0, 0, 0, 0),
(180, 7, 30, 0, 0, 0, 0),
(181, 7, 7, 0, 0, 0, 0),
(182, 7, 8, 0, 0, 0, 0),
(183, 7, 6, 0, 0, 0, 0),
(184, 7, 9, 0, 0, 0, 0),
(185, 7, 10, 0, 0, 0, 0),
(186, 7, 11, 0, 0, 0, 0),
(187, 7, 12, 0, 0, 0, 0),
(188, 7, 13, 0, 0, 0, 0),
(189, 7, 14, 0, 0, 0, 0),
(190, 7, 15, 0, 0, 0, 0),
(191, 7, 16, 0, 0, 0, 0),
(192, 7, 17, 0, 0, 0, 0),
(194, 7, 19, 0, 0, 0, 0),
(195, 7, 20, 0, 0, 0, 0),
(196, 7, 21, 0, 0, 0, 0),
(197, 7, 22, 0, 0, 0, 0),
(198, 7, 23, 0, 0, 0, 0),
(199, 7, 24, 0, 0, 0, 0),
(200, 7, 25, 0, 0, 0, 0),
(201, 7, 26, 0, 0, 1, 0),
(202, 7, 27, 0, 0, 0, 0),
(203, 7, 28, 0, 0, 0, 0),
(204, 7, 29, 0, 0, 1, 0),
(205, 7, 32, 0, 0, 0, 0),
(206, 7, 31, 0, 0, 0, 0),
(207, 7, 33, 0, 0, 0, 0),
(208, 7, 34, 0, 0, 0, 0),
(209, 7, 35, 0, 0, 0, 0),
(210, 7, 36, 0, 0, 0, 0),
(211, 7, 37, 0, 0, 0, 0),
(212, 7, 38, 0, 0, 0, 0),
(213, 7, 39, 0, 0, 0, 0),
(214, 7, 77, 0, 0, 0, 0),
(215, 7, 78, 0, 0, 0, 0),
(216, 7, 79, 0, 0, 0, 0),
(217, 7, 40, 0, 0, 0, 0),
(218, 7, 41, 0, 0, 0, 0),
(219, 7, 42, 0, 0, 0, 0),
(220, 7, 43, 0, 0, 0, 0),
(221, 7, 44, 0, 0, 0, 0),
(222, 7, 45, 0, 0, 0, 0),
(223, 7, 46, 0, 0, 0, 0),
(224, 7, 47, 0, 0, 0, 0),
(225, 7, 48, 0, 0, 0, 0),
(226, 7, 49, 0, 0, 0, 0),
(227, 7, 50, 0, 0, 0, 0),
(228, 7, 51, 0, 0, 0, 0),
(229, 7, 52, 0, 0, 0, 0),
(230, 7, 53, 0, 0, 0, 0),
(231, 7, 54, 0, 0, 0, 0),
(232, 7, 55, 0, 0, 0, 0),
(233, 7, 56, 0, 0, 0, 0),
(234, 7, 57, 0, 0, 0, 0),
(235, 7, 58, 0, 0, 0, 0),
(236, 7, 59, 0, 0, 0, 0),
(237, 7, 60, 0, 0, 0, 0),
(238, 7, 61, 0, 0, 0, 0),
(239, 7, 62, 0, 0, 0, 0),
(240, 7, 80, 0, 0, 0, 0),
(241, 7, 69, 0, 0, 0, 0),
(242, 7, 70, 0, 0, 0, 0),
(243, 7, 71, 0, 0, 0, 0),
(244, 7, 72, 0, 0, 0, 0),
(245, 7, 73, 0, 0, 0, 0),
(246, 7, 74, 0, 0, 0, 0),
(247, 7, 75, 0, 0, 0, 0),
(248, 7, 76, 0, 0, 0, 0),
(249, 7, 63, 0, 0, 0, 0),
(250, 7, 64, 0, 0, 0, 0),
(251, 7, 65, 0, 0, 0, 0),
(252, 7, 66, 0, 0, 0, 0),
(253, 7, 67, 0, 0, 0, 0),
(254, 7, 68, 0, 0, 0, 0),
(255, 7, 81, 0, 0, 0, 0),
(256, 7, 82, 0, 0, 0, 0),
(257, 7, 83, 0, 0, 0, 0),
(258, 7, 84, 0, 0, 0, 0),
(259, 7, 85, 0, 0, 0, 0),
(260, 7, 86, 0, 0, 0, 0),
(261, 7, 87, 0, 0, 0, 0),
(262, 88, 88, 1, 1, 1, 1),
(263, 88, 88, 1, 1, 1, 1),
(264, 89, 89, 1, 1, 1, 1),
(265, 90, 90, 1, 1, 1, 1),
(266, 2, 88, 1, 0, 1, 0),
(267, 2, 89, 0, 0, 1, 0),
(268, 90, 90, 1, 1, 1, 1),
(269, 2, 90, 0, 1, 1, 0),
(270, 91, 91, 1, 1, 1, 1),
(271, 92, 92, 1, 1, 1, 1),
(272, 2, 91, 0, 0, 1, 0),
(273, 2, 92, 0, 0, 1, 0),
(274, 93, 93, 1, 1, 1, 1),
(275, 94, 94, 1, 1, 1, 1),
(276, 95, 95, 1, 1, 1, 1),
(277, 96, 96, 1, 1, 1, 1),
(278, 2, 93, 0, 0, 1, 0),
(279, 2, 94, 0, 0, 1, 0),
(280, 2, 95, 0, 0, 1, 0),
(281, 2, 96, 0, 0, 1, 0),
(282, 97, 97, 1, 1, 1, 1),
(283, 98, 98, 1, 1, 1, 1),
(284, 2, 97, 0, 0, 1, 0),
(285, 2, 98, 0, 0, 1, 0),
(286, 99, 99, 1, 1, 1, 1),
(287, 100, 100, 1, 1, 1, 1),
(288, 101, 101, 1, 1, 1, 1),
(289, 102, 102, 1, 1, 1, 1),
(290, 2, 99, 0, 0, 1, 0),
(291, 2, 100, 0, 0, 1, 0),
(292, 2, 101, 0, 0, 1, 0),
(293, 2, 102, 0, 0, 1, 0),
(294, 103, 103, 1, 1, 1, 1),
(295, 2, 103, 0, 1, 1, 0),
(296, 3, 91, 0, 0, 0, 0),
(297, 3, 92, 0, 0, 0, 0),
(298, 3, 93, 0, 0, 1, 0),
(299, 3, 94, 0, 0, 1, 0),
(300, 3, 95, 0, 0, 1, 0),
(301, 3, 96, 0, 0, 1, 0),
(302, 3, 97, 0, 0, 1, 0),
(303, 3, 98, 0, 0, 1, 0),
(304, 3, 99, 0, 0, 0, 0),
(305, 3, 100, 0, 0, 0, 0),
(306, 3, 101, 0, 0, 0, 0),
(307, 3, 102, 0, 0, 0, 0),
(308, 3, 88, 1, 0, 1, 0),
(309, 3, 89, 0, 0, 1, 0),
(310, 3, 90, 0, 0, 0, 0),
(311, 3, 103, 0, 0, 0, 0),
(312, 4, 91, 0, 0, 1, 0),
(313, 4, 92, 0, 0, 1, 0),
(314, 4, 93, 0, 0, 0, 0),
(315, 4, 94, 0, 0, 0, 0),
(316, 4, 95, 0, 0, 0, 0),
(317, 4, 96, 0, 0, 0, 0),
(318, 4, 97, 0, 0, 0, 0),
(319, 4, 98, 0, 0, 0, 0),
(320, 4, 99, 0, 0, 0, 0),
(321, 4, 100, 0, 0, 0, 0),
(322, 4, 101, 0, 0, 0, 0),
(323, 4, 102, 0, 0, 0, 0),
(324, 4, 1, 0, 0, 0, 0),
(325, 4, 2, 0, 0, 0, 0),
(326, 4, 3, 0, 0, 0, 0),
(327, 4, 4, 0, 0, 0, 0),
(328, 4, 5, 0, 0, 0, 0),
(329, 4, 30, 0, 0, 0, 0),
(330, 4, 7, 0, 0, 0, 0),
(331, 4, 8, 0, 0, 0, 0),
(332, 4, 6, 0, 0, 0, 0),
(333, 4, 9, 0, 0, 0, 0),
(334, 4, 10, 0, 0, 0, 0),
(335, 4, 11, 0, 0, 0, 0),
(336, 4, 12, 1, 1, 1, 1),
(337, 4, 13, 1, 0, 1, 0),
(338, 4, 14, 1, 0, 1, 0),
(339, 4, 15, 0, 0, 1, 0),
(340, 4, 16, 1, 1, 1, 1),
(341, 4, 17, 1, 1, 1, 1),
(343, 4, 19, 1, 1, 1, 1),
(344, 4, 20, 1, 1, 1, 1),
(345, 4, 21, 1, 1, 1, 1),
(346, 4, 22, 1, 1, 1, 1),
(347, 4, 23, 0, 0, 0, 0),
(348, 4, 24, 0, 0, 0, 0),
(349, 4, 25, 0, 0, 0, 0),
(350, 4, 26, 0, 0, 0, 0),
(351, 4, 27, 0, 0, 0, 0),
(352, 4, 28, 0, 0, 0, 0),
(353, 4, 29, 0, 0, 0, 0),
(354, 4, 32, 0, 0, 0, 0),
(355, 4, 88, 0, 0, 0, 0),
(356, 4, 89, 0, 0, 0, 0),
(357, 4, 31, 0, 0, 0, 0),
(358, 4, 33, 0, 0, 0, 0),
(359, 4, 34, 0, 0, 0, 0),
(360, 4, 35, 0, 0, 0, 0),
(361, 4, 36, 0, 0, 0, 0),
(362, 4, 37, 0, 0, 0, 0),
(363, 4, 38, 0, 0, 0, 0),
(364, 4, 39, 0, 0, 0, 0),
(365, 4, 77, 0, 0, 0, 0),
(366, 4, 78, 0, 0, 0, 0),
(367, 4, 79, 0, 0, 0, 0),
(368, 4, 40, 0, 0, 0, 0),
(369, 4, 41, 0, 0, 0, 0),
(370, 4, 42, 0, 0, 0, 0),
(371, 4, 43, 0, 0, 0, 0),
(372, 4, 44, 0, 0, 0, 0),
(373, 4, 45, 0, 0, 0, 0),
(374, 4, 46, 0, 0, 0, 0),
(375, 4, 47, 0, 0, 0, 0),
(376, 4, 48, 0, 0, 0, 0),
(377, 4, 49, 0, 0, 0, 0),
(378, 4, 50, 0, 0, 0, 0),
(379, 4, 51, 0, 0, 0, 0),
(380, 4, 52, 0, 0, 0, 0),
(381, 4, 53, 0, 0, 0, 0),
(382, 4, 54, 0, 0, 0, 0),
(383, 4, 55, 0, 0, 1, 0),
(384, 4, 56, 0, 0, 0, 0),
(385, 4, 57, 0, 0, 0, 0),
(386, 4, 58, 1, 0, 1, 0),
(387, 4, 59, 0, 0, 0, 0),
(388, 4, 60, 0, 0, 0, 0),
(389, 4, 61, 0, 0, 0, 0),
(390, 4, 62, 0, 0, 0, 0),
(391, 4, 80, 0, 0, 0, 0),
(392, 4, 69, 1, 1, 1, 1),
(393, 4, 70, 1, 1, 1, 1),
(394, 4, 71, 1, 1, 1, 1),
(395, 4, 72, 1, 1, 1, 1),
(396, 4, 73, 1, 0, 0, 0),
(397, 4, 74, 1, 1, 1, 1),
(398, 4, 75, 0, 0, 1, 0),
(399, 4, 76, 0, 0, 1, 0),
(400, 4, 63, 1, 1, 1, 1),
(401, 4, 64, 1, 1, 1, 1),
(402, 4, 65, 1, 1, 1, 1),
(403, 4, 66, 0, 0, 1, 0),
(404, 4, 67, 1, 1, 1, 1),
(405, 4, 68, 1, 1, 1, 1),
(406, 4, 81, 0, 0, 0, 0),
(407, 4, 82, 0, 0, 0, 0),
(408, 4, 83, 0, 0, 0, 0),
(409, 4, 84, 0, 0, 0, 0),
(410, 4, 85, 0, 0, 0, 0),
(411, 4, 86, 0, 0, 0, 0),
(412, 4, 87, 0, 0, 0, 0),
(413, 4, 90, 0, 0, 0, 0),
(414, 4, 103, 0, 0, 0, 0),
(415, 5, 91, 0, 0, 0, 0),
(416, 5, 92, 0, 0, 0, 0),
(417, 5, 93, 0, 0, 1, 0),
(418, 5, 94, 0, 0, 1, 0),
(419, 5, 95, 0, 0, 0, 0),
(420, 5, 96, 0, 0, 0, 0),
(421, 5, 97, 0, 0, 0, 0),
(422, 5, 98, 0, 0, 0, 0),
(423, 5, 99, 0, 0, 0, 0),
(424, 5, 100, 0, 0, 0, 0),
(425, 5, 101, 0, 0, 0, 0),
(426, 5, 102, 0, 0, 0, 0),
(427, 5, 1, 0, 0, 1, 0),
(428, 5, 2, 0, 0, 0, 0),
(429, 5, 3, 0, 0, 0, 0),
(430, 5, 4, 0, 0, 0, 0),
(431, 5, 5, 0, 0, 0, 0),
(432, 5, 30, 0, 0, 0, 0),
(433, 5, 7, 0, 0, 0, 0),
(434, 5, 8, 0, 0, 0, 0),
(435, 5, 6, 0, 0, 1, 0),
(436, 5, 9, 0, 0, 0, 0),
(437, 5, 10, 0, 0, 0, 0),
(438, 5, 11, 0, 0, 0, 0),
(439, 5, 12, 0, 0, 0, 0),
(440, 5, 13, 0, 0, 0, 0),
(441, 5, 14, 0, 0, 0, 0),
(442, 5, 15, 0, 0, 0, 0),
(443, 5, 16, 0, 0, 0, 0),
(444, 5, 17, 0, 0, 0, 0),
(446, 5, 19, 0, 0, 0, 0),
(447, 5, 20, 1, 1, 1, 1),
(448, 5, 21, 0, 0, 0, 0),
(449, 5, 22, 0, 0, 0, 0),
(450, 5, 23, 0, 0, 0, 0),
(451, 5, 24, 0, 0, 0, 0),
(452, 5, 25, 0, 0, 0, 0),
(453, 5, 26, 0, 0, 0, 0),
(454, 5, 27, 0, 0, 0, 0),
(455, 5, 28, 0, 0, 0, 0),
(456, 5, 29, 0, 0, 0, 0),
(457, 5, 32, 0, 0, 0, 0),
(458, 5, 88, 0, 0, 0, 0),
(459, 5, 89, 0, 0, 0, 0),
(460, 5, 31, 0, 0, 0, 0),
(461, 5, 33, 0, 0, 0, 0),
(462, 5, 34, 0, 0, 0, 0),
(463, 5, 35, 0, 0, 0, 0),
(464, 5, 36, 0, 0, 0, 0),
(465, 5, 37, 0, 0, 0, 0),
(466, 5, 38, 0, 0, 0, 0),
(467, 5, 39, 0, 0, 0, 0),
(468, 5, 77, 0, 0, 0, 0),
(469, 5, 78, 0, 0, 0, 0),
(470, 5, 79, 0, 0, 0, 0),
(471, 5, 40, 0, 0, 0, 0),
(472, 5, 41, 0, 0, 0, 0),
(473, 5, 42, 0, 0, 0, 0),
(474, 5, 43, 0, 0, 0, 0),
(475, 5, 44, 0, 0, 0, 0),
(476, 5, 45, 0, 0, 0, 0),
(477, 5, 46, 0, 0, 0, 0),
(478, 5, 47, 0, 0, 0, 0),
(479, 5, 48, 0, 0, 0, 0),
(480, 5, 49, 0, 0, 0, 0),
(481, 5, 50, 0, 0, 0, 0),
(482, 5, 51, 0, 0, 0, 0),
(483, 5, 52, 0, 0, 0, 0),
(484, 5, 53, 0, 0, 0, 0),
(485, 5, 54, 0, 0, 0, 0),
(486, 5, 55, 1, 1, 1, 1),
(487, 5, 56, 1, 1, 1, 1),
(488, 5, 57, 1, 0, 1, 1),
(489, 5, 58, 1, 0, 1, 1),
(490, 5, 59, 0, 0, 0, 0),
(491, 5, 60, 0, 0, 0, 0),
(492, 5, 61, 0, 0, 0, 0),
(493, 5, 62, 0, 0, 0, 0),
(494, 5, 80, 0, 0, 0, 0),
(495, 5, 69, 0, 0, 0, 0),
(496, 5, 70, 0, 0, 0, 0),
(497, 5, 71, 0, 0, 0, 0),
(498, 5, 72, 0, 0, 0, 0),
(499, 5, 73, 0, 0, 0, 0),
(500, 5, 74, 0, 0, 0, 0),
(501, 5, 75, 0, 0, 0, 0),
(502, 5, 76, 0, 0, 0, 0),
(503, 5, 63, 0, 0, 0, 0),
(504, 5, 64, 0, 0, 0, 0),
(505, 5, 65, 0, 0, 0, 0),
(506, 5, 66, 0, 0, 0, 0),
(507, 5, 67, 0, 0, 0, 0),
(508, 5, 68, 0, 0, 0, 0),
(509, 5, 81, 0, 0, 0, 0),
(510, 5, 82, 0, 0, 0, 0),
(511, 5, 83, 0, 0, 0, 0),
(512, 5, 84, 0, 0, 0, 0),
(513, 5, 85, 0, 0, 0, 0),
(514, 5, 86, 0, 0, 0, 0),
(515, 5, 87, 0, 0, 0, 0),
(516, 5, 90, 0, 0, 0, 0),
(517, 5, 103, 0, 0, 0, 0),
(518, 104, 104, 1, 1, 1, 1),
(519, 2, 104, 0, 0, 1, 0),
(520, 4, 104, 0, 0, 1, 0),
(521, 2, 18, 1, 0, 1, 0),
(522, 2, 105, 0, 1, 1, 0),
(523, 2, 106, 1, 1, 1, 1),
(524, 2, 107, 0, 0, 1, 0),
(525, 2, 109, 1, 1, 1, 1),
(526, 2, 108, 0, 1, 1, 0),
(527, 3, 18, 0, 0, 0, 0),
(528, 3, 107, 0, 0, 0, 0),
(529, 3, 109, 1, 1, 1, 1),
(530, 3, 104, 0, 0, 0, 0),
(531, 3, 105, 0, 0, 0, 0),
(532, 3, 106, 0, 0, 0, 0),
(533, 3, 108, 0, 0, 0, 0),
(534, 2, 110, 1, 1, 1, 1),
(535, 2, 111, 0, 0, 1, 0),
(536, 2, 112, 0, 0, 1, 0),
(537, 2, 113, 1, 1, 1, 1),
(538, 2, 114, 0, 0, 1, 0),
(539, 2, 115, 0, 0, 1, 0),
(540, 2, 116, 1, 1, 1, 1),
(541, 2, 117, 0, 0, 1, 0),
(542, 3, 110, 1, 1, 1, 1),
(543, 3, 111, 0, 0, 1, 0),
(544, 3, 112, 0, 0, 0, 0),
(545, 3, 113, 1, 1, 1, 1),
(546, 3, 114, 0, 0, 1, 0),
(547, 3, 115, 0, 0, 0, 0),
(548, 3, 116, 1, 1, 1, 1),
(549, 3, 117, 0, 0, 1, 0),
(550, 2, 127, 1, 0, 1, 1),
(551, 2, 118, 1, 0, 1, 0),
(552, 2, 119, 0, 0, 0, 0),
(553, 2, 120, 1, 0, 1, 0),
(554, 2, 121, 0, 0, 0, 0),
(555, 2, 122, 0, 0, 0, 0),
(556, 2, 123, 0, 0, 0, 0),
(557, 2, 124, 0, 0, 0, 0),
(558, 2, 125, 0, 0, 0, 0),
(559, 2, 126, 0, 0, 0, 0),
(560, 3, 118, 0, 0, 0, 0),
(561, 3, 119, 0, 0, 0, 0),
(562, 3, 120, 0, 0, 0, 0),
(563, 3, 121, 0, 0, 0, 0),
(564, 3, 122, 0, 0, 0, 0),
(565, 3, 123, 0, 0, 0, 0),
(566, 3, 124, 0, 0, 0, 0),
(567, 3, 125, 0, 0, 0, 0),
(568, 3, 126, 0, 0, 0, 0),
(569, 3, 127, 0, 0, 0, 0),
(570, 3, 128, 0, 0, 0, 0),
(571, 2, 129, 0, 0, 1, 0),
(572, 2, 128, 0, 0, 0, 0),
(573, 2, 131, 0, 0, 0, 0),
(574, 2, 132, 0, 0, 0, 0),
(575, 2, 130, 0, 0, 0, 1),
(576, 4, 118, 0, 0, 0, 0),
(577, 4, 119, 0, 0, 0, 0),
(578, 4, 120, 0, 0, 0, 0),
(579, 4, 121, 0, 0, 0, 0),
(580, 4, 122, 0, 0, 0, 0),
(581, 4, 123, 0, 0, 0, 0),
(582, 4, 124, 0, 0, 0, 0),
(583, 4, 125, 0, 0, 0, 0),
(584, 4, 126, 0, 0, 0, 0),
(585, 4, 131, 0, 0, 0, 0),
(586, 4, 132, 0, 0, 0, 0),
(587, 4, 127, 0, 0, 0, 0),
(588, 4, 113, 0, 0, 0, 0),
(589, 4, 114, 0, 0, 0, 0),
(590, 4, 115, 0, 0, 0, 0),
(591, 4, 116, 0, 0, 0, 0),
(592, 4, 117, 0, 0, 0, 0),
(593, 4, 110, 0, 0, 0, 0),
(594, 4, 111, 0, 0, 0, 0),
(595, 4, 112, 0, 0, 0, 0),
(596, 4, 18, 0, 0, 0, 0),
(597, 4, 107, 0, 0, 0, 0),
(598, 4, 109, 0, 0, 0, 0),
(599, 4, 129, 0, 0, 0, 0),
(600, 4, 130, 0, 0, 0, 1),
(601, 4, 105, 0, 0, 0, 0),
(602, 4, 106, 0, 0, 0, 0),
(603, 4, 108, 0, 0, 0, 0),
(604, 4, 128, 0, 0, 0, 0),
(605, 2, 131, 0, 0, 0, 0),
(606, 2, 132, 0, 0, 0, 0),
(607, 2, 133, 0, 0, 1, 0),
(608, 3, 133, 0, 0, 1, 0),
(609, 2, 134, 1, 1, 1, 1),
(610, 2, 136, 1, 1, 1, 1),
(611, 2, 137, 1, 1, 1, 1),
(612, 2, 138, 1, 0, 0, 0),
(613, 2, 139, 1, 1, 1, 1),
(614, 2, 140, 0, 0, 1, 0),
(615, 2, 135, 0, 1, 1, 0),
(616, 3, 131, 0, 0, 0, 0),
(617, 3, 132, 0, 0, 0, 0),
(618, 3, 129, 0, 0, 0, 0),
(619, 3, 130, 0, 0, 0, 0),
(620, 3, 136, 1, 1, 1, 1),
(621, 3, 137, 1, 1, 1, 1),
(622, 3, 138, 1, 0, 0, 0),
(623, 3, 139, 1, 1, 1, 1),
(624, 3, 140, 0, 0, 1, 0),
(625, 3, 134, 0, 0, 0, 0),
(626, 3, 135, 0, 0, 0, 0),
(627, 2, 141, 1, 0, 1, 0),
(628, 2, 142, 1, 1, 1, 1),
(629, 2, 143, 1, 1, 1, 1),
(630, 2, 144, 1, 1, 1, 1),
(631, 2, 145, 1, 1, 1, 1),
(632, 2, 146, 1, 1, 1, 1),
(633, 2, 147, 1, 0, 1, 1),
(634, 2, 148, 1, 1, 1, 1),
(635, 2, 149, 0, 0, 1, 0),
(636, 2, 150, 0, 0, 1, 0),
(637, 2, 151, 0, 0, 1, 0),
(638, 2, 152, 0, 0, 1, 0),
(639, 2, 153, 0, 0, 1, 0),
(640, 8, 91, 0, 0, 0, 0),
(641, 8, 92, 0, 0, 0, 0),
(642, 8, 93, 0, 0, 1, 0),
(643, 8, 94, 0, 0, 1, 0),
(644, 8, 95, 0, 0, 1, 0),
(645, 8, 96, 0, 0, 1, 0),
(646, 8, 97, 0, 0, 0, 0),
(647, 8, 98, 0, 0, 0, 0),
(648, 8, 99, 0, 0, 0, 0),
(649, 8, 100, 0, 0, 0, 0),
(650, 8, 101, 0, 0, 0, 0),
(651, 8, 102, 0, 0, 0, 0),
(652, 8, 151, 0, 0, 1, 0),
(653, 8, 152, 0, 0, 1, 0),
(654, 8, 118, 0, 0, 0, 0),
(655, 8, 119, 0, 0, 0, 0),
(656, 8, 120, 0, 0, 0, 0),
(657, 8, 121, 0, 0, 0, 0),
(658, 8, 122, 0, 0, 0, 0),
(659, 8, 123, 0, 0, 0, 0),
(660, 8, 124, 0, 0, 0, 0),
(661, 8, 125, 0, 0, 0, 0),
(662, 8, 126, 0, 0, 0, 0),
(663, 8, 131, 0, 0, 0, 0),
(664, 8, 132, 0, 0, 0, 0),
(665, 8, 1, 0, 0, 1, 0),
(666, 8, 2, 0, 0, 0, 0),
(667, 8, 3, 0, 0, 0, 0),
(668, 8, 4, 0, 0, 0, 0),
(669, 8, 5, 0, 0, 0, 0),
(670, 8, 30, 0, 0, 0, 0),
(671, 8, 127, 0, 0, 0, 0),
(672, 8, 7, 0, 0, 1, 0),
(673, 8, 8, 0, 0, 0, 0),
(674, 8, 6, 0, 0, 1, 0),
(675, 8, 9, 0, 0, 0, 0),
(676, 8, 10, 0, 0, 0, 0),
(677, 8, 11, 0, 0, 0, 0),
(678, 8, 113, 0, 0, 0, 0),
(679, 8, 114, 0, 0, 0, 0),
(680, 8, 115, 0, 0, 0, 0),
(681, 8, 116, 0, 0, 0, 0),
(682, 8, 117, 0, 0, 0, 0),
(683, 8, 110, 0, 0, 0, 0),
(684, 8, 111, 0, 0, 0, 0),
(685, 8, 112, 0, 0, 0, 0),
(686, 8, 12, 0, 0, 0, 0),
(687, 8, 13, 0, 0, 0, 0),
(688, 8, 14, 0, 0, 1, 0),
(689, 8, 15, 0, 0, 0, 0),
(690, 8, 16, 0, 0, 0, 0),
(691, 8, 17, 0, 0, 0, 0),
(692, 8, 18, 1, 0, 1, 1),
(693, 8, 19, 0, 0, 0, 0),
(694, 8, 20, 1, 1, 1, 1),
(695, 8, 21, 0, 0, 0, 0),
(696, 8, 22, 0, 0, 0, 0),
(697, 8, 107, 0, 0, 0, 0),
(698, 8, 23, 0, 0, 0, 0),
(699, 8, 24, 0, 0, 0, 0),
(700, 8, 25, 0, 0, 0, 0),
(701, 8, 26, 0, 0, 0, 0),
(702, 8, 27, 0, 0, 0, 0),
(703, 8, 28, 0, 0, 0, 0),
(704, 8, 29, 0, 0, 0, 0),
(705, 8, 133, 0, 0, 0, 0),
(706, 8, 109, 0, 0, 0, 0),
(707, 8, 129, 0, 0, 0, 0),
(708, 8, 31, 0, 0, 0, 0),
(709, 8, 33, 0, 0, 0, 0),
(710, 8, 32, 0, 0, 0, 0),
(711, 8, 88, 0, 0, 0, 0),
(712, 8, 89, 0, 0, 0, 0),
(713, 8, 34, 0, 0, 0, 0),
(714, 8, 35, 0, 0, 0, 0),
(715, 8, 36, 0, 0, 0, 0),
(716, 8, 37, 0, 0, 0, 0),
(717, 8, 38, 0, 0, 0, 0),
(718, 8, 39, 0, 0, 0, 0),
(719, 8, 77, 0, 0, 0, 0),
(720, 8, 78, 0, 0, 0, 0),
(721, 8, 79, 0, 0, 0, 0),
(722, 8, 153, 0, 0, 0, 0),
(723, 8, 40, 0, 0, 0, 0),
(724, 8, 41, 0, 0, 0, 0),
(725, 8, 42, 0, 0, 0, 0),
(726, 8, 43, 0, 0, 0, 0),
(727, 8, 44, 0, 0, 0, 0),
(728, 8, 45, 0, 0, 0, 0),
(729, 8, 46, 0, 0, 0, 0),
(730, 8, 47, 0, 0, 0, 0),
(731, 8, 48, 0, 0, 0, 0),
(732, 8, 49, 0, 0, 0, 0),
(733, 8, 50, 0, 0, 0, 0),
(734, 8, 51, 0, 0, 0, 0),
(735, 8, 52, 0, 0, 0, 0),
(736, 8, 53, 0, 0, 0, 0),
(737, 8, 54, 0, 0, 0, 0),
(738, 8, 55, 0, 0, 0, 0),
(739, 8, 56, 0, 0, 0, 0),
(740, 8, 57, 0, 0, 0, 0),
(741, 8, 58, 0, 0, 0, 0),
(742, 8, 59, 0, 0, 0, 0),
(743, 8, 60, 0, 0, 0, 0),
(744, 8, 61, 0, 0, 0, 0),
(745, 8, 62, 0, 0, 0, 0),
(746, 8, 80, 0, 0, 0, 0),
(747, 8, 149, 0, 0, 0, 0),
(748, 8, 150, 0, 0, 0, 0),
(749, 8, 69, 0, 0, 0, 0),
(750, 8, 70, 0, 0, 0, 0),
(751, 8, 71, 0, 0, 0, 0),
(752, 8, 72, 0, 0, 0, 0),
(753, 8, 73, 0, 0, 0, 0),
(754, 8, 74, 0, 0, 0, 0),
(755, 8, 75, 0, 0, 0, 0),
(756, 8, 76, 0, 0, 0, 0),
(757, 8, 104, 0, 0, 0, 0),
(758, 8, 130, 0, 0, 0, 0),
(759, 8, 63, 0, 0, 0, 0),
(760, 8, 64, 0, 0, 0, 0),
(761, 8, 65, 0, 0, 0, 0),
(762, 8, 66, 0, 0, 0, 0),
(763, 8, 67, 0, 0, 0, 0),
(764, 8, 68, 0, 0, 0, 0),
(765, 8, 136, 0, 0, 0, 0),
(766, 8, 137, 0, 0, 0, 0),
(767, 8, 138, 0, 0, 0, 0),
(768, 8, 139, 0, 0, 0, 0),
(769, 8, 140, 0, 0, 0, 0),
(770, 8, 141, 0, 0, 0, 0),
(771, 8, 142, 1, 1, 1, 1),
(772, 8, 143, 1, 1, 1, 1),
(773, 8, 144, 1, 1, 1, 1),
(774, 8, 145, 1, 1, 1, 1),
(775, 8, 146, 1, 1, 1, 1),
(776, 8, 147, 1, 0, 1, 1),
(777, 8, 148, 1, 1, 1, 1),
(778, 8, 81, 0, 0, 0, 0),
(779, 8, 82, 0, 0, 0, 0),
(780, 8, 83, 0, 0, 0, 0),
(781, 8, 84, 0, 0, 0, 0),
(782, 8, 85, 0, 0, 0, 0),
(783, 8, 86, 0, 0, 0, 0),
(784, 8, 87, 0, 0, 0, 0),
(785, 8, 90, 0, 0, 0, 0),
(786, 8, 103, 0, 0, 0, 0),
(787, 8, 105, 0, 0, 0, 0),
(788, 8, 106, 0, 0, 0, 0),
(789, 8, 108, 0, 0, 0, 0),
(790, 8, 128, 0, 0, 0, 0),
(791, 8, 134, 0, 0, 0, 0),
(792, 8, 135, 0, 0, 0, 0),
(793, 2, 157, 1, 1, 1, 1),
(794, 2, 158, 1, 1, 1, 1),
(795, 2, 159, 1, 1, 1, 0),
(796, 2, 160, 1, 1, 1, 1),
(797, 2, 161, 1, 1, 1, 1),
(798, 2, 162, 0, 0, 1, 0),
(799, 2, 163, 1, 1, 1, 1),
(800, 2, 164, 1, 0, 1, 1),
(801, 2, 165, 0, 0, 1, 0),
(802, 2, 166, 1, 0, 1, 1),
(803, 2, 167, 0, 0, 1, 0),
(804, 2, 168, 0, 0, 1, 0),
(805, 2, 173, 0, 0, 0, 0),
(806, 2, 154, 0, 0, 0, 0),
(807, 2, 174, 1, 1, 1, 1),
(808, 2, 155, 0, 0, 0, 0),
(809, 2, 156, 1, 1, 1, 1),
(810, 2, 401, 1, 1, 1, 1),
(811, 2, 501, 0, 0, 0, 0),
(812, 2, 502, 0, 0, 0, 0),
(813, 2, 503, 0, 0, 0, 0),
(814, 2, 504, 0, 0, 0, 0),
(815, 2, 518, 0, 0, 0, 0),
(816, 2, 169, 0, 0, 1, 1),
(817, 2, 170, 1, 1, 1, 1),
(818, 2, 171, 1, 1, 1, 1),
(819, 2, 172, 0, 0, 0, 0),
(820, 2, 401, 1, 1, 1, 1),
(821, 2, 402, 0, 0, 0, 0),
(822, 2, 403, 0, 0, 0, 0),
(823, 2, 404, 0, 0, 0, 0),
(824, 2, 405, 0, 0, 0, 0),
(825, 2, 406, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `register_no` varchar(100) DEFAULT NULL,
  `admission_date` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `caste` varchar(100) DEFAULT NULL,
  `blood_group` varchar(100) DEFAULT NULL,
  `mother_tongue` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL DEFAULT 0,
  `vehicle_id` int(11) NOT NULL DEFAULT 0,
  `hostel_id` int(11) NOT NULL DEFAULT 0,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `previous_details` text DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `register_no`, `admission_date`, `first_name`, `last_name`, `gender`, `birthday`, `religion`, `caste`, `blood_group`, `mother_tongue`, `current_address`, `permanent_address`, `city`, `state`, `mobileno`, `category_id`, `email`, `parent_id`, `route_id`, `vehicle_id`, `hostel_id`, `room_id`, `previous_details`, `photo`, `created_at`, `updated_at`) VALUES
(1, '435535353', '2025-02-07', 'samuel', 'man', 'male', '', '', NULL, NULL, NULL, NULL, '', NULL, '', NULL, 0, NULL, 1, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-02-07 18:21:36', NULL),
(2, '0987654', '2025-02-08', 'TEST', 'STUDENT', 'male', '2025-02-15', '', NULL, NULL, NULL, NULL, '', NULL, '', NULL, 0, 'thechroniclemusic@gmail.com', 2, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-02-08 16:35:01', NULL),
(3, '678848484', '2025-02-13', 'Djdjdj', 'Eyeye', 'female', '2025-07-17', 'Whshsh', NULL, NULL, NULL, NULL, '', NULL, '', NULL, 0, 'samuelmayowa33@gmail.com', 2, 0, 0, 0, 0, '{\"school_name\":\"\",\"qualification\":\"\",\"remarks\":\"\"}', 'defualt.png', '2025-02-13 12:23:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_admission_fields`
--

CREATE TABLE `student_admission_fields` (
  `id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student_admission_fields`
--

INSERT INTO `student_admission_fields` (`id`, `fields_id`, `status`, `required`, `branch_id`) VALUES
(1, 1, 0, 0, 1),
(2, 2, 1, 1, 1),
(3, 3, 1, 0, 1),
(4, 4, 1, 0, 1),
(5, 5, 1, 1, 1),
(6, 6, 0, 0, 1),
(7, 8, 1, 0, 1),
(8, 9, 0, 0, 1),
(9, 10, 0, 0, 1),
(10, 11, 0, 0, 1),
(11, 12, 0, 0, 1),
(12, 13, 1, 0, 1),
(13, 14, 0, 0, 1),
(14, 15, 1, 0, 1),
(15, 16, 1, 1, 1),
(16, 17, 0, 0, 1),
(17, 18, 1, 0, 1),
(18, 19, 1, 0, 1),
(19, 20, 1, 1, 1),
(20, 21, 1, 1, 1),
(21, 22, 1, 0, 1),
(22, 23, 1, 0, 1),
(23, 24, 0, 0, 1),
(24, 25, 0, 0, 1),
(25, 26, 0, 0, 1),
(26, 27, 1, 1, 1),
(27, 28, 1, 1, 1),
(28, 29, 1, 1, 1),
(29, 30, 1, 0, 1),
(30, 32, 0, 0, 1),
(31, 33, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE `student_attendance` (
  `id` int(11) NOT NULL,
  `enroll_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(4) DEFAULT NULL COMMENT 'P=Present, A=Absent, H=Holiday, L=Late',
  `qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`id`, `enroll_id`, `date`, `status`, `qr_code`, `remark`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2025-03-28', 'P', 0, '', 1, '2025-03-29 17:26:47', NULL),
(2, 2, '2025-03-29', 'P', 0, '', 1, '2025-03-29 17:27:51', NULL),
(3, 3, '2025-03-29', 'P', 0, '', 1, '2025-03-29 21:04:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_category`
--

CREATE TABLE `student_category` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_documents`
--

CREATE TABLE `student_documents` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `remarks` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_fields`
--

CREATE TABLE `student_fields` (
  `id` int(11) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `default_status` tinyint(1) NOT NULL DEFAULT 1,
  `default_required` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student_fields`
--

INSERT INTO `student_fields` (`id`, `prefix`, `default_status`, `default_required`, `created_at`) VALUES
(1, 'roll', 1, 0, '2022-04-25 20:27:04'),
(2, 'last_name', 1, 1, '2022-04-25 20:27:04'),
(3, 'gender', 1, 0, '2022-04-25 20:27:04'),
(4, 'birthday', 1, 0, '2022-04-25 20:27:04'),
(5, 'admission_date', 1, 1, '2022-04-25 20:27:04'),
(6, 'category', 1, 1, '2022-04-25 20:27:04'),
(7, 'section', 1, 1, '2022-04-25 20:27:04'),
(8, 'religion', 1, 0, '2022-04-25 20:27:04'),
(9, 'caste', 1, 0, '2022-04-25 20:27:04'),
(10, 'blood_group', 1, 0, '2022-04-25 20:27:04'),
(11, 'mother_tongue', 1, 0, '2022-04-25 20:27:04'),
(12, 'present_address', 1, 0, '2022-04-25 20:27:04'),
(13, 'permanent_address', 1, 0, '2022-04-25 20:27:04'),
(14, 'city', 1, 0, '2022-04-25 20:27:04'),
(15, 'state', 1, 0, '2022-04-25 20:27:04'),
(16, 'student_email', 1, 0, '2022-04-25 20:27:04'),
(17, 'student_mobile_no', 1, 0, '2022-04-25 20:27:04'),
(18, 'student_photo', 1, 0, '2022-04-25 20:27:04'),
(19, 'previous_school_details', 1, 0, '2022-04-25 20:27:04'),
(20, 'guardian_name', 1, 1, '2022-04-25 20:27:04'),
(21, 'guardian_relation', 1, 1, '2022-04-25 20:27:04'),
(22, 'father_name', 1, 0, '2022-04-25 20:27:04'),
(23, 'mother_name', 1, 0, '2022-04-25 20:27:04'),
(24, 'guardian_occupation', 1, 1, '2022-04-25 20:27:04'),
(25, 'guardian_income', 1, 1, '2022-04-25 20:27:04'),
(26, 'guardian_education', 1, 1, '2022-04-25 20:27:04'),
(27, 'guardian_email', 1, 1, '2022-04-25 20:27:04'),
(28, 'guardian_mobile_no', 1, 1, '2022-04-25 20:27:04'),
(29, 'guardian_address', 1, 1, '2022-04-25 20:27:04'),
(30, 'guardian_photo', 1, 0, '2022-04-25 20:27:04'),
(31, 'upload_documents', 1, 1, '2022-04-25 20:27:04'),
(32, 'guardian_city', 1, 0, '2022-04-25 20:27:04'),
(33, 'guardian_state', 1, 0, '2022-04-25 20:27:04'),
(34, 'first_name', 1, 1, '2022-04-25 20:27:04');

-- --------------------------------------------------------

--
-- Table structure for table `student_profile_fields`
--

CREATE TABLE `student_profile_fields` (
  `id` int(11) NOT NULL,
  `fields_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student_profile_fields`
--

INSERT INTO `student_profile_fields` (`id`, `fields_id`, `status`, `required`, `branch_id`) VALUES
(1, 2, 1, 1, 1),
(2, 3, 1, 0, 1),
(3, 4, 1, 0, 1),
(4, 5, 1, 1, 1),
(5, 6, 0, 0, 1),
(6, 8, 1, 0, 1),
(7, 9, 0, 0, 1),
(8, 10, 1, 0, 1),
(9, 11, 0, 0, 1),
(10, 12, 0, 0, 1),
(11, 13, 1, 0, 1),
(12, 14, 1, 0, 1),
(13, 15, 1, 0, 1),
(14, 16, 0, 0, 1),
(15, 17, 0, 0, 1),
(16, 18, 1, 0, 1),
(17, 19, 1, 0, 1),
(18, 34, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_subject_attendance`
--

CREATE TABLE `student_subject_attendance` (
  `id` int(11) NOT NULL,
  `enroll_id` int(11) DEFAULT NULL,
  `subject_timetable_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject_code` varchar(200) NOT NULL,
  `subject_type` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `subject_author` varchar(255) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `subject_code`, `subject_type`, `subject_author`, `branch_id`) VALUES
(1, 'English Language', 'Bgs1', 'Mandatory', '', 1),
(2, 'Mathematics', 'Bgs2', 'Mandatory', '', 1),
(3, 'Integrated Science', 'Bgs45', 'Theory', '', 1),
(4, 'Civic and Social Studies', 'Bgs', 'Theory', '', 1),
(5, 'Religious and Value Education', 'Bgs466', 'Theory', '', 1),
(6, 'Physical and Health Education', 'Bhs29386', 'Theory', '', 1),
(7, 'Creative and Performing Arts', 'Bgs3949', 'Theory', '', 1),
(8, 'Computer Studies', 'Bgs2057', 'Theory', '', 1),
(9, 'French', 'Bgs3994', 'Optional', '', 1),
(10, 'Social Studies', 'Bgs2939', 'Theory', '', 1),
(11, 'Civic Education', 'Bgs2939', 'Theory', '', 1),
(13, 'Home Economics', 'Bgs395', 'Practical', '', 1),
(14, 'Business Studies', 'Bgs2949', 'Theory', '', 1),
(15, 'Basic Technology', 'Bgs935', 'Theory', '', 1),
(16, 'Physics', 'Bgs295', 'Optional', '', 1),
(17, 'Chemistry', 'Bgs9569', 'Optional', '', 1),
(18, 'Biology', 'Bgs8856', 'Optional', '', 1),
(19, 'Further Mathematics', 'Bgs885', 'Optional', '', 1),
(20, 'Agricultural Science', 'Bgs855', 'Optional', '', 1),
(21, 'Health Science', 'Bgs8579', 'Optional', '', 1),
(22, 'Food and Nutrition', 'Bgs9954', 'Optional', '', 1),
(23, 'Literature in English', 'Bgs95580', 'Optional', '', 1),
(24, 'History', 'Bgs5788', 'Optional', '', 1),
(25, 'Geography', '4563', 'Optional', '', 1),
(26, 'Government', '3468', 'Optional', '', 1),
(28, 'Economics', '88656', 'Optional', '', 1),
(29, 'Fine Art', '8769', 'Optional', '', 1),
(30, 'Music', '98755', 'Optional', '', 1),
(31, 'Technical Drawing', '98866', 'Optional', '', 1),
(32, 'Arabic', '9865', 'Optional', '', 1),
(33, 'Accounting', '88655', 'Optional', '', 1),
(34, 'Commerce', '87589', 'Optional', '', 1),
(35, 'Business Studies', '885490', 'Optional', '', 1),
(36, 'Economics', '95890', 'Optional', '', 1),
(37, 'Office Practice', '9975', 'Optional', '', 1),
(38, 'Marketing', '99765', 'Optional', '', 1),
(39, 'Textile Studies', '99643', 'Practical', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subject_assign`
--

CREATE TABLE `subject_assign` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subject_assign`
--

INSERT INTO `subject_assign` (`id`, `class_id`, `section_id`, `subject_id`, `teacher_id`, `branch_id`, `session_id`, `created_at`, `updated_at`) VALUES
(63, 10, 1, 1, 0, 1, 5, '2025-02-12 09:41:43', NULL),
(64, 10, 1, 2, 0, 1, 5, '2025-02-12 09:41:43', NULL),
(65, 10, 1, 4, 2, 1, 5, '2025-02-15 14:54:26', NULL),
(66, 10, 1, 5, 2, 1, 5, '2025-02-15 14:54:26', NULL),
(67, 10, 1, 6, 2, 1, 5, '2025-02-15 14:54:26', NULL),
(68, 10, 1, 8, 2, 1, 5, '2025-02-15 14:54:26', NULL),
(69, 10, 1, 9, 2, 1, 5, '2025-02-15 14:54:26', NULL),
(70, 17, 1, 1, 2, 1, 5, '2025-02-15 18:18:11', NULL),
(71, 17, 1, 2, 2, 1, 5, '2025-02-15 18:18:11', NULL),
(72, 17, 1, 3, 2, 1, 5, '2025-02-15 18:18:11', NULL),
(73, 17, 1, 4, 2, 1, 5, '2025-02-15 18:18:11', NULL),
(74, 17, 1, 5, 2, 1, 5, '2025-02-15 18:18:11', NULL),
(75, 14, 5, 1, 0, 1, 5, '2025-02-16 09:12:46', NULL),
(76, 14, 5, 2, 0, 1, 5, '2025-02-16 09:12:46', NULL),
(77, 14, 5, 37, 0, 1, 5, '2025-02-16 09:12:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_allocation`
--

CREATE TABLE `teacher_allocation` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `teacher_allocation`
--

INSERT INTO `teacher_allocation` (`id`, `class_id`, `section_id`, `teacher_id`, `session_id`, `branch_id`) VALUES
(1, 10, 1, 2, 5, 1),
(2, 17, 1, 2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_note`
--

CREATE TABLE `teacher_note` (
  `id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `description` longtext NOT NULL,
  `file_name` longtext NOT NULL,
  `enc_name` longtext NOT NULL,
  `type_id` int(11) NOT NULL,
  `class_id` longtext NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` int(11) NOT NULL,
  `border_mode` varchar(200) NOT NULL,
  `dark_skin` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `border_mode`, `dark_skin`, `created_at`, `updated_at`) VALUES
(1, 'true', 'false', '2018-10-23 15:59:38', '2020-05-10 14:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_class`
--

CREATE TABLE `timetable_class` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `break` varchar(11) DEFAULT 'false',
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `class_room` varchar(100) DEFAULT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `day` varchar(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `timetable_class`
--

INSERT INTO `timetable_class` (`id`, `class_id`, `section_id`, `break`, `subject_id`, `teacher_id`, `class_room`, `time_start`, `time_end`, `day`, `session_id`, `branch_id`) VALUES
(25, 10, 1, '0', 1, 2, '', '08:00:00', '08:45:00', 'monday', 5, 1),
(26, 10, 1, '0', 2, 2, '', '08:45:00', '09:30:00', 'monday', 5, 1),
(27, 10, 1, '0', 5, 2, '', '09:30:00', '10:15:00', 'monday', 5, 1),
(28, 10, 1, '0', 6, 2, '', '10:15:00', '11:00:00', 'monday', 5, 1),
(29, 10, 1, '0', 8, 2, '', '11:00:00', '11:45:00', 'monday', 5, 1),
(30, 10, 1, '0', 8, 2, '', '11:45:00', '12:30:00', 'monday', 5, 1),
(31, 10, 1, '1', 0, 0, '', '12:30:00', '13:15:00', 'monday', 5, 1),
(32, 10, 1, '0', 8, 2, '', '13:15:00', '14:00:00', 'monday', 5, 1),
(33, 10, 1, '0', 9, 2, '', '14:00:00', '14:45:00', 'monday', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `timetable_exam`
--

CREATE TABLE `timetable_exam` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `time_start` varchar(20) NOT NULL,
  `time_end` varchar(20) NOT NULL,
  `mark_distribution` text NOT NULL,
  `hall_id` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `branch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `timetable_exam`
--

INSERT INTO `timetable_exam` (`id`, `exam_id`, `class_id`, `section_id`, `subject_id`, `time_start`, `time_end`, `mark_distribution`, `hall_id`, `exam_date`, `branch_id`, `session_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 1, 1, '9:20 AM', '10:20 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"100\",\"pass_mark\":\"0\"}}', 1, '2025-02-15', 1, 5, '2025-02-15 15:20:46', NULL),
(2, 1, 10, 1, 2, '9:20 AM', '10:20 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"100\",\"pass_mark\":\"0\"}}', 1, '2025-02-16', 1, 5, '2025-02-15 15:20:46', NULL),
(3, 1, 10, 1, 4, '9:20 AM', '10:20 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"100\",\"pass_mark\":\"0\"}}', 1, '2025-02-17', 1, 5, '2025-02-15 15:20:46', NULL),
(4, 1, 10, 1, 5, '9:20 AM', '10:20 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"100\",\"pass_mark\":\"0\"}}', 1, '2025-02-18', 1, 5, '2025-02-15 15:20:46', NULL),
(5, 1, 10, 1, 6, '9:20 AM', '10:20 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"100\",\"pass_mark\":\"0\"}}', 1, '2025-02-19', 1, 5, '2025-02-15 15:20:46', NULL),
(6, 1, 10, 1, 8, '9:20 AM', '10:20 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"100\",\"pass_mark\":\"0\"}}', 1, '2025-02-20', 1, 5, '2025-02-15 15:20:46', NULL),
(7, 1, 10, 1, 9, '9:20 AM', '10:20 AM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"100\",\"pass_mark\":\"0\"}}', 1, '2025-02-21', 1, 5, '2025-02-15 15:20:46', NULL),
(8, 1, 17, 1, 1, '7:20 PM', '8:05 PM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"0\",\"pass_mark\":\"50\"}}', 1, '2025-02-15', 1, 5, '2025-02-15 18:20:21', NULL),
(9, 1, 17, 1, 2, '7:20 PM', '8:05 PM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"0\",\"pass_mark\":\"50\"}}', 1, '2025-02-16', 1, 5, '2025-02-15 18:20:21', NULL),
(10, 1, 17, 1, 3, '7:20 PM', '8:05 PM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"0\",\"pass_mark\":\"50\"}}', 1, '2025-02-17', 1, 5, '2025-02-15 18:20:21', NULL),
(11, 1, 17, 1, 4, '7:20 PM', '8:05 PM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"0\",\"pass_mark\":\"50\"}}', 1, '2025-02-18', 1, 5, '2025-02-15 18:20:21', NULL),
(12, 1, 17, 1, 5, '7:20 PM', '8:05 PM', '{\"1\":{\"full_mark\":\"100\",\"pass_mark\":\"50\"},\"2\":{\"full_mark\":\"0\",\"pass_mark\":\"50\"}}', 1, '2025-02-19', 1, 5, '2025-02-15 18:20:21', NULL),
(13, 1, 14, 5, 1, '10:40 PM', '11:40 PM', '{\"4\":{\"full_mark\":\"100\",\"pass_mark\":\"90\"},\"5\":{\"full_mark\":\"100\",\"pass_mark\":\"90\"},\"6\":{\"full_mark\":\"100\",\"pass_mark\":\"90\"},\"7\":{\"full_mark\":\"100\",\"pass_mark\":\"80\"}}', 2, '2025-03-27', 1, 5, '2025-03-18 19:42:10', NULL),
(14, 1, 14, 5, 2, '10:40 PM', '11:40 PM', '{\"4\":{\"full_mark\":\"100\",\"pass_mark\":\"90\"},\"5\":{\"full_mark\":\"100\",\"pass_mark\":\"90\"},\"6\":{\"full_mark\":\"100\",\"pass_mark\":\"90\"},\"7\":{\"full_mark\":\"100\",\"pass_mark\":\"80\"}}', 2, '2025-03-28', 1, 5, '2025-03-18 19:42:10', NULL),
(15, 1, 14, 5, 37, '10:40 PM', '11:40 PM', '{\"4\":{\"full_mark\":\"100\",\"pass_mark\":\"90\"},\"5\":{\"full_mark\":\"100\",\"pass_mark\":\"90\"},\"6\":{\"full_mark\":\"100\",\"pass_mark\":\"90\"},\"7\":{\"full_mark\":\"100\",\"pass_mark\":\"80\"}}', 2, '2025-03-29', 1, 5, '2025-03-18 19:42:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `account_id` varchar(20) NOT NULL,
  `voucher_head_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `dr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `cr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `bal` decimal(18,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `pay_via` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `attachments` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `account_id`, `voucher_head_id`, `type`, `category`, `ref`, `amount`, `dr`, `cr`, `bal`, `date`, `pay_via`, `description`, `attachments`, `branch_id`, `system`, `created_at`, `updated_at`) VALUES
(1, '1', 0, 'deposit', '', '', 100000.00, 0.00, 100000.00, 100000.00, '2025-03-24', '', 'Opening Balance', '', 1, 0, '2025-03-24 20:05:30', NULL),
(2, '1', 1, 'expense', '', 'f355364', 20000.00, 20000.00, 0.00, 80000.00, '2025-03-24', '1', 'jftgftfdfd', '', 1, 0, '2025-03-24 20:06:12', NULL),
(3, '1', 1, 'expense', '', '2424242', 2442.00, 2442.00, 0.00, 77558.00, '2025-03-30', '1', 'wfewfwefwefwfew', '', 1, 0, '2025-03-30 12:28:06', NULL),
(4, '1', 1, 'expense', '', '2343424213', 244242.00, 244242.00, 0.00, -166684.00, '2025-03-30', '3', '', '', 1, 0, '2025-03-30 12:28:24', NULL),
(5, '1', 1, 'expense', '', '244324234', 12424.00, 12424.00, 0.00, -179108.00, '2025-03-30', '2', '', '', 1, 0, '2025-03-30 12:28:35', NULL),
(6, '1', 1, 'expense', '', '34124234', 2321.00, 2321.00, 0.00, -181429.00, '2025-03-30', '3', '', '', 1, 0, '2025-03-30 12:28:48', NULL),
(7, '1', 1, 'expense', '', '242343', 424.00, 424.00, 0.00, -181853.00, '2025-03-30', '4', '', '', 1, 0, '2025-03-30 12:29:02', NULL),
(8, '1', 2, 'deposit', '', '242', 100000.00, 0.00, 100000.00, -81853.00, '2025-03-30', '3', '', '', 1, 0, '2025-03-30 12:29:38', NULL),
(9, '1', 2, 'deposit', '', '2342', 211212.00, 0.00, 211212.00, 129359.00, '2025-03-30', '3', '', '', 1, 0, '2025-03-30 12:29:55', NULL),
(10, '1', 2, 'deposit', '', '2929292', 24232.00, 0.00, 24232.00, 153591.00, '2025-03-30', '2', '', '', 1, 0, '2025-03-30 12:30:10', NULL),
(11, '1', 1, 'expense', '', '214242423', 2321242.00, 2321242.00, 0.00, -2167651.00, '2025-03-30', '2', '', '', 1, 0, '2025-03-30 12:30:40', NULL),
(12, '1', 1, 'expense', '', 'ijd8838r3', 3238832.00, 3238832.00, 0.00, -5406483.00, '2025-03-30', '3', '', '', 1, 0, '2025-03-30 12:30:54', NULL),
(13, '1', 2, 'deposit', '', '5346465', 194545.00, 0.00, 194545.00, -5211938.00, '2025-03-31', '3', '', '', 1, 0, '2025-03-31 17:56:13', NULL),
(14, '1', 2, 'deposit', '', '64656', 354355345.00, 0.00, 354355345.00, 349143407.00, '2025-03-31', '2', '', '', 1, 0, '2025-03-31 17:56:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions_links`
--

CREATE TABLE `transactions_links` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `deposit` tinyint(4) DEFAULT NULL,
  `expense` tinyint(4) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions_links_details`
--

CREATE TABLE `transactions_links_details` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transactions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_assign`
--

CREATE TABLE `transport_assign` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `stoppage_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE `transport_route` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `start_place` longtext NOT NULL,
  `remarks` longtext NOT NULL,
  `stop_place` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_stoppage`
--

CREATE TABLE `transport_stoppage` (
  `id` int(11) NOT NULL,
  `stop_position` varchar(255) NOT NULL,
  `stop_time` time NOT NULL,
  `route_fare` decimal(18,2) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_vehicle`
--

CREATE TABLE `transport_vehicle` (
  `id` int(11) NOT NULL,
  `vehicle_no` longtext NOT NULL,
  `capacity` longtext NOT NULL,
  `insurance_renewal` longtext NOT NULL,
  `driver_name` longtext NOT NULL,
  `driver_phone` longtext NOT NULL,
  `driver_license` longtext NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_log`
--

CREATE TABLE `visitor_log` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `purpose_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `entry_time` time DEFAULT NULL,
  `exit_time` time DEFAULT NULL,
  `number_of_visitor` float DEFAULT NULL,
  `id_number` varchar(255) DEFAULT NULL,
  `token_pass` varchar(255) DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_purpose`
--

CREATE TABLE `visitor_purpose` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_head`
--

CREATE TABLE `voucher_head` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `system` tinyint(1) DEFAULT 0,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `voucher_head`
--

INSERT INTO `voucher_head` (`id`, `name`, `type`, `system`, `branch_id`) VALUES
(1, 'ffsefeff', 'expense', 0, 1),
(2, 'efwefewf', 'income', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_agent`
--

CREATE TABLE `whatsapp_agent` (
  `id` int(11) NOT NULL,
  `agent_name` varchar(255) NOT NULL,
  `agent_image` varchar(255) NOT NULL,
  `agent_designation` varchar(255) NOT NULL,
  `whataspp_number` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `weekend` varchar(20) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 1,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_chat`
--

CREATE TABLE `whatsapp_chat` (
  `id` int(11) NOT NULL,
  `header_title` varchar(255) NOT NULL,
  `subtitle` varchar(355) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `popup_message` varchar(255) DEFAULT NULL,
  `frontend_enable_chat` tinyint(1) NOT NULL DEFAULT 0,
  `backend_enable_chat` tinyint(1) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `whatsapp_chat`
--

INSERT INTO `whatsapp_chat` (`id`, `header_title`, `subtitle`, `footer_text`, `popup_message`, `frontend_enable_chat`, `backend_enable_chat`, `branch_id`, `created_at`) VALUES
(1, 'Start a Conversation', 'Start a Conversation', 'Use this feature to chat with our agent.', NULL, 0, 0, 1, '2022-02-16 13:49:13'),
(2, 'Conversation', 'Hi! Click one of our members below to chat on WhatsApp ;)', 'Use this feature to chat with our agent.', NULL, 1, 1, 2, '2022-02-16 13:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `zoom_own_api`
--

CREATE TABLE `zoom_own_api` (
  `id` int(11) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `zoom_api_key` varchar(255) NOT NULL,
  `zoom_api_secret` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_rms_1` (`branch_id`);

--
-- Indexes for table `addon`
--
ALTER TABLE `addon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advance_salary`
--
ALTER TABLE `advance_salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advance_salary_rms_1` (`branch_id`),
  ADD KEY `advance_salary_rms_2` (`staff_id`);

--
-- Indexes for table `alumni_events`
--
ALTER TABLE `alumni_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `alumni_events_rms_1` (`branch_id`);

--
-- Indexes for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumni_students_rms_1` (`enroll_id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_rms_1` (`session_id`),
  ADD KEY `attachments_rms_2` (`branch_id`);

--
-- Indexes for table `attachments_type`
--
ALTER TABLE `attachments_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_type_rms_1` (`branch_id`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `award_rms_1` (`branch_id`),
  ADD KEY `award_rms_2` (`session_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_rms_1` (`branch_id`);

--
-- Indexes for table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_category_rms_1` (`branch_id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_issues_rms1` (`branch_id`),
  ADD KEY `book_issues_rms2` (`book_id`),
  ADD KEY `book_issues_rms3` (`session_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bulk_msg_category_rms_1` (`branch_id`);

--
-- Indexes for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bulk_sms_email_rms_1` (`branch_id`);

--
-- Indexes for table `call_log`
--
ALTER TABLE `call_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `call_log_rms_1` (`branch_id`);

--
-- Indexes for table `call_purpose`
--
ALTER TABLE `call_purpose`
  ADD PRIMARY KEY (`id`),
  ADD KEY `call_purpose_rms_1` (`branch_id`);

--
-- Indexes for table `card_templete`
--
ALTER TABLE `card_templete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_templete_rms_1` (`branch_id`);

--
-- Indexes for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificates_templete_rms_1` (`branch_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_rms_1` (`branch_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_rms_1` (`branch_id`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_type_rms_1` (`branch_id`);

--
-- Indexes for table `custom_domain`
--
ALTER TABLE `custom_domain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_domain_instruction`
--
ALTER TABLE `custom_domain_instruction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field`
--
ALTER TABLE `custom_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields_online_values`
--
ALTER TABLE `custom_fields_online_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relid` (`relid`),
  ADD KEY `fieldid` (`field_id`);

--
-- Indexes for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relid` (`relid`),
  ADD KEY `fieldid` (`field_id`);

--
-- Indexes for table `disable_reason`
--
ALTER TABLE `disable_reason`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disable_reason_rms_1` (`branch_id`);

--
-- Indexes for table `disable_reason_details`
--
ALTER TABLE `disable_reason_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates_details`
--
ALTER TABLE `email_templates_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiry_rms_1` (`branch_id`);

--
-- Indexes for table `enquiry_follow_up`
--
ALTER TABLE `enquiry_follow_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiry_follow_up_rms_1` (`enquiry_id`);

--
-- Indexes for table `enquiry_reference`
--
ALTER TABLE `enquiry_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiry_reference_rms_1` (`branch_id`);

--
-- Indexes for table `enquiry_response`
--
ALTER TABLE `enquiry_response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiry_response_rms_1` (`branch_id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enroll_rms_1` (`student_id`),
  ADD KEY `enroll_rms_2` (`session_id`),
  ADD KEY `enroll_rms_3` (`class_id`),
  ADD KEY `enroll_rms_4` (`section_id`),
  ADD KEY `enroll_rms_5` (`branch_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_rms_1` (`branch_id`),
  ADD KEY `event_rms_2` (`session_id`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_types_rms_1` (`branch_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_rms_1` (`branch_id`),
  ADD KEY `exam_rms_2` (`session_id`);

--
-- Indexes for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_attendance_rms_1` (`branch_id`),
  ADD KEY `exam_attendance_rms_2` (`exam_id`),
  ADD KEY `exam_attendance_rms_3` (`student_id`);

--
-- Indexes for table `exam_hall`
--
ALTER TABLE `exam_hall`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_hall_rms_1` (`branch_id`);

--
-- Indexes for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_mark_distribution_rms_1` (`branch_id`);

--
-- Indexes for table `exam_rank`
--
ALTER TABLE `exam_rank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_group_class_batch_exam_id` (`exam_id`),
  ADD KEY `student_id` (`enroll_id`);

--
-- Indexes for table `exam_term`
--
ALTER TABLE `exam_term`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_reminder_rms_1` (`branch_id`);

--
-- Indexes for table `fees_type`
--
ALTER TABLE `fees_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_allocation_rsm_1` (`student_id`),
  ADD KEY `fee_allocation_rsm_2` (`branch_id`),
  ADD KEY `fee_allocation_rsm_3` (`session_id`);

--
-- Indexes for table `fee_fine`
--
ALTER TABLE `fee_fine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_fine_rms_2` (`group_id`),
  ADD KEY `fee_fine_rms_3` (`session_id`),
  ADD KEY `fee_fine_rms_4` (`branch_id`);

--
-- Indexes for table `fee_groups`
--
ALTER TABLE `fee_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_groups_rms_1` (`branch_id`),
  ADD KEY `fee_groups_rms_2` (`session_id`);

--
-- Indexes for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_groups_details_rms_1` (`fee_groups_id`),
  ADD KEY `fee_groups_details_rms_2` (`fee_type_id`);

--
-- Indexes for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_payment_history_rms_1` (`allocation_id`),
  ADD KEY `fee_payment_history_rms_2` (`type_id`);

--
-- Indexes for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_admission`
--
ALTER TABLE `front_cms_admission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_admitcard`
--
ALTER TABLE `front_cms_admitcard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_certificates`
--
ALTER TABLE `front_cms_certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_events`
--
ALTER TABLE `front_cms_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_exam_results`
--
ALTER TABLE `front_cms_exam_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_gallery`
--
ALTER TABLE `front_cms_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_gallery_category`
--
ALTER TABLE `front_cms_gallery_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_gallery_content`
--
ALTER TABLE `front_cms_gallery_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu_visible`
--
ALTER TABLE `front_cms_menu_visible`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_news`
--
ALTER TABLE `front_cms_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_news_list`
--
ALTER TABLE `front_cms_news_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_cms_news_list_rms_1` (`branch_id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_teachers`
--
ALTER TABLE `front_cms_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grade_rms_1` (`branch_id`);

--
-- Indexes for table `hall_allocation`
--
ALTER TABLE `hall_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homework_rms_1` (`branch_id`),
  ADD KEY `homework_rms_2` (`class_id`),
  ADD KEY `homework_rms_3` (`section_id`),
  ADD KEY `homework_rms_4` (`session_id`),
  ADD KEY `homework_rms_5` (`subject_id`);

--
-- Indexes for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homework_evaluation_rms_1` (`homework_id`);

--
-- Indexes for table `homework_submit`
--
ALTER TABLE `homework_submit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homework_submit_rms_1` (`homework_id`),
  ADD KEY `homework_submit_rms_2` (`student_id`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostel_rms_1` (`branch_id`);

--
-- Indexes for table `hostel_category`
--
ALTER TABLE `hostel_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hostel_room`
--
ALTER TABLE `hostel_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_list`
--
ALTER TABLE `language_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application`
--
ALTER TABLE `leave_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_category`
--
ALTER TABLE `leave_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class`
--
ALTER TABLE `live_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class_config`
--
ALTER TABLE `live_class_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class_reports`
--
ALTER TABLE `live_class_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_credential`
--
ALTER TABLE `login_credential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_log`
--
ALTER TABLE `login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_log_rms_1` (`branch_id`);

--
-- Indexes for table `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marksheet_template`
--
ALTER TABLE `marksheet_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificates_templete_rms_1` (`branch_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_reply`
--
ALTER TABLE `message_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules_manage`
--
ALTER TABLE `modules_manage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `offline_fees_payments`
--
ALTER TABLE `offline_fees_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_master_id` (`fees_allocation_id`),
  ADD KEY `fee_groups_feetype_id` (`fees_type_id`),
  ADD KEY `offline_fees_payments_ibfk_4` (`approved_by`),
  ADD KEY `student_session_id` (`student_enroll_id`);

--
-- Indexes for table `offline_payment_types`
--
ALTER TABLE `offline_payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_admission`
--
ALTER TABLE `online_admission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_admission_rms_1` (`branch_id`);

--
-- Indexes for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam`
--
ALTER TABLE `online_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `online_exam_answer`
--
ALTER TABLE `online_exam_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_attempts`
--
ALTER TABLE `online_exam_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_payment`
--
ALTER TABLE `online_exam_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online_exam_submitted`
--
ALTER TABLE `online_exam_submitted`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_config`
--
ALTER TABLE `payment_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_salary_stipend`
--
ALTER TABLE `payment_salary_stipend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip`
--
ALTER TABLE `payslip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_details`
--
ALTER TABLE `payslip_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_modules`
--
ALTER TABLE `permission_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `postal_record`
--
ALTER TABLE `postal_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_rms_1` (`branch_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_rms_1` (`branch_id`);

--
-- Indexes for table `product_issues`
--
ALTER TABLE `product_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_issues_rms_1` (`branch_id`);

--
-- Indexes for table `product_issues_details`
--
ALTER TABLE `product_issues_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_issues_details_rms_1` (`product_id`);

--
-- Indexes for table `product_store`
--
ALTER TABLE `product_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_supplier_rms_1` (`branch_id`);

--
-- Indexes for table `product_unit`
--
ALTER TABLE `product_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion_history`
--
ALTER TABLE `promotion_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion_history_rms_1` (`student_id`);

--
-- Indexes for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_bill_rms_1` (`branch_id`);

--
-- Indexes for table `purchase_bill_details`
--
ALTER TABLE `purchase_bill_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_bill_details_rms_1` (`product_id`);

--
-- Indexes for table `purchase_payment_history`
--
ALTER TABLE `purchase_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qr_code_settings`
--
ALTER TABLE `qr_code_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions_manage`
--
ALTER TABLE `questions_manage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onlineexam_id` (`onlineexam_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `question_group`
--
ALTER TABLE `question_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rm_sessions`
--
ALTER TABLE `rm_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_cms_faq_list`
--
ALTER TABLE `saas_cms_faq_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_cms_features`
--
ALTER TABLE `saas_cms_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_email_templates`
--
ALTER TABLE `saas_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_offline_payments`
--
ALTER TABLE `saas_offline_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_offline_payment_types`
--
ALTER TABLE `saas_offline_payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_package`
--
ALTER TABLE `saas_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_school_register`
--
ALTER TABLE `saas_school_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_settings`
--
ALTER TABLE `saas_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_subscriptions`
--
ALTER TABLE `saas_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saas_subscriptions_transactions`
--
ALTER TABLE `saas_subscriptions_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template`
--
ALTER TABLE `salary_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_bill`
--
ALTER TABLE `sales_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_bill_rms_1` (`branch_id`);

--
-- Indexes for table `sales_bill_details`
--
ALTER TABLE `sales_bill_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_bill_details_rms_1` (`product_id`);

--
-- Indexes for table `sales_payment_history`
--
ALTER TABLE `sales_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schoolyear`
--
ALTER TABLE `schoolyear`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_allocation_rms_1` (`class_id`),
  ADD KEY `sections_allocation_rms_2` (`section_id`);

--
-- Indexes for table `sms_api`
--
ALTER TABLE `sms_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_credential`
--
ALTER TABLE `sms_credential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template`
--
ALTER TABLE `sms_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_template_details`
--
ALTER TABLE `sms_template_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_attendance_rms_1` (`branch_id`),
  ADD KEY `staff_attendance_rms_2` (`staff_id`);

--
-- Indexes for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_department`
--
ALTER TABLE `staff_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_documents`
--
ALTER TABLE `staff_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_admission_fields`
--
ALTER TABLE `student_admission_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_attendance_rms_1` (`branch_id`),
  ADD KEY `student_attendance_rms_2` (`enroll_id`);

--
-- Indexes for table `student_category`
--
ALTER TABLE `student_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fields`
--
ALTER TABLE `student_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_profile_fields`
--
ALTER TABLE `student_profile_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subject_attendance`
--
ALTER TABLE `student_subject_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendence_type_id` (`status`),
  ADD KEY `student_session_id` (`enroll_id`),
  ADD KEY `subject_timetable_id` (`subject_timetable_id`),
  ADD KEY `student_subject_attendance_rms_1` (`branch_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_assign`
--
ALTER TABLE `subject_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_assign_rms_1` (`branch_id`),
  ADD KEY `subject_assign_rms_2` (`session_id`),
  ADD KEY `subject_assign_rms_3` (`class_id`),
  ADD KEY `subject_assign_rms_4` (`section_id`),
  ADD KEY `subject_assign_rms_5` (`subject_id`);

--
-- Indexes for table `teacher_allocation`
--
ALTER TABLE `teacher_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_note`
--
ALTER TABLE `teacher_note`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable_class`
--
ALTER TABLE `timetable_class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetable_class_rms_1` (`branch_id`),
  ADD KEY `timetable_class_rms_2` (`class_id`),
  ADD KEY `timetable_class_rms_3` (`section_id`),
  ADD KEY `timetable_class_rms_4` (`session_id`);

--
-- Indexes for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetable_exam_rms_1` (`branch_id`),
  ADD KEY `timetable_exam_rms_2` (`exam_id`),
  ADD KEY `timetable_exam_rms_3` (`class_id`),
  ADD KEY `timetable_exam_rms_4` (`section_id`),
  ADD KEY `timetable_exam_rms_5` (`session_id`),
  ADD KEY `timetable_exam_rms_6` (`subject_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_rms_1` (`branch_id`);

--
-- Indexes for table `transactions_links`
--
ALTER TABLE `transactions_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_links_rms_1` (`branch_id`);

--
-- Indexes for table `transactions_links_details`
--
ALTER TABLE `transactions_links_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_assign`
--
ALTER TABLE `transport_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_assign_rms_1` (`branch_id`);

--
-- Indexes for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_route_rms_1` (`branch_id`);

--
-- Indexes for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_stoppage_rms_1` (`branch_id`);

--
-- Indexes for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_vehicle_rms_1` (`branch_id`);

--
-- Indexes for table `visitor_log`
--
ALTER TABLE `visitor_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_log_rms_1` (`branch_id`);

--
-- Indexes for table `visitor_purpose`
--
ALTER TABLE `visitor_purpose`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_purpose_rms_1` (`branch_id`);

--
-- Indexes for table `voucher_head`
--
ALTER TABLE `voucher_head`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_head_rms_1` (`branch_id`);

--
-- Indexes for table `whatsapp_agent`
--
ALTER TABLE `whatsapp_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whatsapp_chat`
--
ALTER TABLE `whatsapp_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zoom_own_api`
--
ALTER TABLE `zoom_own_api`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `addon`
--
ALTER TABLE `addon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `advance_salary`
--
ALTER TABLE `advance_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alumni_events`
--
ALTER TABLE `alumni_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alumni_students`
--
ALTER TABLE `alumni_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachments_type`
--
ALTER TABLE `attachments_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_category`
--
ALTER TABLE `book_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_log`
--
ALTER TABLE `call_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_purpose`
--
ALTER TABLE `call_purpose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `card_templete`
--
ALTER TABLE `card_templete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_domain`
--
ALTER TABLE `custom_domain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_domain_instruction`
--
ALTER TABLE `custom_domain_instruction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `custom_field`
--
ALTER TABLE `custom_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_fields_online_values`
--
ALTER TABLE `custom_fields_online_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `custom_fields_values`
--
ALTER TABLE `custom_fields_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `disable_reason`
--
ALTER TABLE `disable_reason`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `disable_reason_details`
--
ALTER TABLE `disable_reason_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `email_templates_details`
--
ALTER TABLE `email_templates_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_follow_up`
--
ALTER TABLE `enquiry_follow_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_reference`
--
ALTER TABLE `enquiry_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_response`
--
ALTER TABLE `enquiry_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_hall`
--
ALTER TABLE `exam_hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exam_rank`
--
ALTER TABLE `exam_rank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_term`
--
ALTER TABLE `exam_term`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_type`
--
ALTER TABLE `fees_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fee_fine`
--
ALTER TABLE `fee_fine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_groups`
--
ALTER TABLE `fee_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_admission`
--
ALTER TABLE `front_cms_admission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_admitcard`
--
ALTER TABLE `front_cms_admitcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_certificates`
--
ALTER TABLE `front_cms_certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_events`
--
ALTER TABLE `front_cms_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_exam_results`
--
ALTER TABLE `front_cms_exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `front_cms_gallery`
--
ALTER TABLE `front_cms_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_gallery_category`
--
ALTER TABLE `front_cms_gallery_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_gallery_content`
--
ALTER TABLE `front_cms_gallery_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `front_cms_menu_visible`
--
ALTER TABLE `front_cms_menu_visible`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `front_cms_news`
--
ALTER TABLE `front_cms_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_news_list`
--
ALTER TABLE `front_cms_news_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_teachers`
--
ALTER TABLE `front_cms_teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hall_allocation`
--
ALTER TABLE `hall_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `homework_submit`
--
ALTER TABLE `homework_submit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_category`
--
ALTER TABLE `hostel_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hostel_room`
--
ALTER TABLE `hostel_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1549;

--
-- AUTO_INCREMENT for table `language_list`
--
ALTER TABLE `language_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_category`
--
ALTER TABLE `leave_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_class`
--
ALTER TABLE `live_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_class_config`
--
ALTER TABLE `live_class_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_class_reports`
--
ALTER TABLE `live_class_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_credential`
--
ALTER TABLE `login_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `login_log`
--
ALTER TABLE `login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `mark`
--
ALTER TABLE `mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `marksheet_template`
--
ALTER TABLE `marksheet_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message_reply`
--
ALTER TABLE `message_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modules_manage`
--
ALTER TABLE `modules_manage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `offline_fees_payments`
--
ALTER TABLE `offline_fees_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_payment_types`
--
ALTER TABLE `offline_payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_admission`
--
ALTER TABLE `online_admission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `online_admission_fields`
--
ALTER TABLE `online_admission_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `online_exam`
--
ALTER TABLE `online_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `online_exam_answer`
--
ALTER TABLE `online_exam_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `online_exam_attempts`
--
ALTER TABLE `online_exam_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `online_exam_payment`
--
ALTER TABLE `online_exam_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_submitted`
--
ALTER TABLE `online_exam_submitted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_config`
--
ALTER TABLE `payment_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_salary_stipend`
--
ALTER TABLE `payment_salary_stipend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `payslip`
--
ALTER TABLE `payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_details`
--
ALTER TABLE `payslip_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;

--
-- AUTO_INCREMENT for table `permission_modules`
--
ALTER TABLE `permission_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `postal_record`
--
ALTER TABLE `postal_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_issues`
--
ALTER TABLE `product_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_issues_details`
--
ALTER TABLE `product_issues_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_store`
--
ALTER TABLE `product_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_supplier`
--
ALTER TABLE `product_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_unit`
--
ALTER TABLE `product_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_history`
--
ALTER TABLE `promotion_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_bill_details`
--
ALTER TABLE `purchase_bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_payment_history`
--
ALTER TABLE `purchase_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qr_code_settings`
--
ALTER TABLE `qr_code_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `questions_manage`
--
ALTER TABLE `questions_manage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `question_group`
--
ALTER TABLE `question_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `saas_cms_faq_list`
--
ALTER TABLE `saas_cms_faq_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saas_cms_features`
--
ALTER TABLE `saas_cms_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `saas_email_templates`
--
ALTER TABLE `saas_email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `saas_offline_payments`
--
ALTER TABLE `saas_offline_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saas_offline_payment_types`
--
ALTER TABLE `saas_offline_payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saas_package`
--
ALTER TABLE `saas_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saas_school_register`
--
ALTER TABLE `saas_school_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saas_settings`
--
ALTER TABLE `saas_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saas_subscriptions`
--
ALTER TABLE `saas_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saas_subscriptions_transactions`
--
ALTER TABLE `saas_subscriptions_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salary_template`
--
ALTER TABLE `salary_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_bill`
--
ALTER TABLE `sales_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_bill_details`
--
ALTER TABLE `sales_bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_payment_history`
--
ALTER TABLE `sales_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schoolyear`
--
ALTER TABLE `schoolyear`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sms_api`
--
ALTER TABLE `sms_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sms_credential`
--
ALTER TABLE `sms_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_template`
--
ALTER TABLE `sms_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sms_template_details`
--
ALTER TABLE `sms_template_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_department`
--
ALTER TABLE `staff_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff_documents`
--
ALTER TABLE `staff_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=826;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_admission_fields`
--
ALTER TABLE `student_admission_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_category`
--
ALTER TABLE `student_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_documents`
--
ALTER TABLE `student_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_fields`
--
ALTER TABLE `student_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `student_profile_fields`
--
ALTER TABLE `student_profile_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `student_subject_attendance`
--
ALTER TABLE `student_subject_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `subject_assign`
--
ALTER TABLE `subject_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `teacher_allocation`
--
ALTER TABLE `teacher_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teacher_note`
--
ALTER TABLE `teacher_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timetable_class`
--
ALTER TABLE `timetable_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transactions_links`
--
ALTER TABLE `transactions_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_links_details`
--
ALTER TABLE `transactions_links_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_assign`
--
ALTER TABLE `transport_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_route`
--
ALTER TABLE `transport_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_log`
--
ALTER TABLE `visitor_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitor_purpose`
--
ALTER TABLE `visitor_purpose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_head`
--
ALTER TABLE `voucher_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `whatsapp_agent`
--
ALTER TABLE `whatsapp_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatsapp_chat`
--
ALTER TABLE `whatsapp_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zoom_own_api`
--
ALTER TABLE `zoom_own_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advance_salary`
--
ALTER TABLE `advance_salary`
  ADD CONSTRAINT `advance_salary_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `advance_salary_rms_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `alumni_events`
--
ALTER TABLE `alumni_events`
  ADD CONSTRAINT `alumni_events_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `alumni_students`
--
ALTER TABLE `alumni_students`
  ADD CONSTRAINT `alumni_students_rms_1` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_rms_1` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attachments_rms_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attachments_type`
--
ALTER TABLE `attachments_type`
  ADD CONSTRAINT `attachments_type_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `award_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `award_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `book_category_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD CONSTRAINT `book_issues_rms1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_issues_rms2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_issues_rms3` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bulk_msg_category`
--
ALTER TABLE `bulk_msg_category`
  ADD CONSTRAINT `bulk_msg_category_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bulk_sms_email`
--
ALTER TABLE `bulk_sms_email`
  ADD CONSTRAINT `bulk_sms_email_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `call_log`
--
ALTER TABLE `call_log`
  ADD CONSTRAINT `call_log_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `call_purpose`
--
ALTER TABLE `call_purpose`
  ADD CONSTRAINT `call_purpose_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `card_templete`
--
ALTER TABLE `card_templete`
  ADD CONSTRAINT `card_templete_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificates_templete`
--
ALTER TABLE `certificates_templete`
  ADD CONSTRAINT `certificates_templete_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD CONSTRAINT `complaint_type_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disable_reason`
--
ALTER TABLE `disable_reason`
  ADD CONSTRAINT `disable_reason_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD CONSTRAINT `enquiry_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enquiry_follow_up`
--
ALTER TABLE `enquiry_follow_up`
  ADD CONSTRAINT `enquiry_follow_up_rms_1` FOREIGN KEY (`enquiry_id`) REFERENCES `enquiry` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enquiry_reference`
--
ALTER TABLE `enquiry_reference`
  ADD CONSTRAINT `enquiry_reference_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enquiry_response`
--
ALTER TABLE `enquiry_response`
  ADD CONSTRAINT `enquiry_response_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_rms_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_rms_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_rms_4` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_rms_5` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_types`
--
ALTER TABLE `event_types`
  ADD CONSTRAINT `event_types_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_attendance`
--
ALTER TABLE `exam_attendance`
  ADD CONSTRAINT `exam_attendance_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_attendance_rms_2` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_attendance_rms_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_hall`
--
ALTER TABLE `exam_hall`
  ADD CONSTRAINT `exam_hall_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_mark_distribution`
--
ALTER TABLE `exam_mark_distribution`
  ADD CONSTRAINT `exam_mark_distribution_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_rank`
--
ALTER TABLE `exam_rank`
  ADD CONSTRAINT `exam_rank_rms_1` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_rank_rms_2` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_reminder`
--
ALTER TABLE `fees_reminder`
  ADD CONSTRAINT `fees_reminder_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_allocation`
--
ALTER TABLE `fee_allocation`
  ADD CONSTRAINT `fee_allocation_rsm_1` FOREIGN KEY (`student_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_allocation_rsm_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_allocation_rsm_3` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_fine`
--
ALTER TABLE `fee_fine`
  ADD CONSTRAINT `fee_fine_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_fine_rms_2` FOREIGN KEY (`group_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_fine_rms_3` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_fine_rms_4` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_groups`
--
ALTER TABLE `fee_groups`
  ADD CONSTRAINT `fee_groups_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_groups_details`
--
ALTER TABLE `fee_groups_details`
  ADD CONSTRAINT `fee_groups_details_rms_1` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_groups_details_rms_2` FOREIGN KEY (`fee_type_id`) REFERENCES `fees_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_payment_history`
--
ALTER TABLE `fee_payment_history`
  ADD CONSTRAINT `fee_payment_history_rms_1` FOREIGN KEY (`allocation_id`) REFERENCES `fee_allocation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_payment_history_rms_2` FOREIGN KEY (`type_id`) REFERENCES `fees_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_news_list`
--
ALTER TABLE `front_cms_news_list`
  ADD CONSTRAINT `front_cms_news_list_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homework`
--
ALTER TABLE `homework`
  ADD CONSTRAINT `homework_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_rms_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_rms_3` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_rms_4` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_rms_5` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homework_evaluation`
--
ALTER TABLE `homework_evaluation`
  ADD CONSTRAINT `homework_evaluation_rms_1` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homework_submit`
--
ALTER TABLE `homework_submit`
  ADD CONSTRAINT `homework_submit_rms_1` FOREIGN KEY (`homework_id`) REFERENCES `homework` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homework_submit_rms_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hostel`
--
ALTER TABLE `hostel`
  ADD CONSTRAINT `hostel_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `login_log`
--
ALTER TABLE `login_log`
  ADD CONSTRAINT `login_log_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marksheet_template`
--
ALTER TABLE `marksheet_template`
  ADD CONSTRAINT `marksheet_template_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_admission`
--
ALTER TABLE `online_admission`
  ADD CONSTRAINT `online_admission_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_issues`
--
ALTER TABLE `product_issues`
  ADD CONSTRAINT `product_issues_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_issues_details`
--
ALTER TABLE `product_issues_details`
  ADD CONSTRAINT `product_issues_details_rms_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD CONSTRAINT `product_supplier_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_history`
--
ALTER TABLE `promotion_history`
  ADD CONSTRAINT `promotion_history_rms_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  ADD CONSTRAINT `purchase_bill_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_bill_details`
--
ALTER TABLE `purchase_bill_details`
  ADD CONSTRAINT `purchase_bill_details_rms_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_bill`
--
ALTER TABLE `sales_bill`
  ADD CONSTRAINT `sales_bill_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_bill_details`
--
ALTER TABLE `sales_bill_details`
  ADD CONSTRAINT `sales_bill_details_rms_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections_allocation`
--
ALTER TABLE `sections_allocation`
  ADD CONSTRAINT `sections_allocation_rms_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_allocation_rms_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD CONSTRAINT `staff_attendance_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_attendance_rms_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD CONSTRAINT `student_attendance_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_attendance_rms_2` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_subject_attendance`
--
ALTER TABLE `student_subject_attendance`
  ADD CONSTRAINT `student_subject_attendance_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_subject_attendance_rms_2` FOREIGN KEY (`enroll_id`) REFERENCES `enroll` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_assign`
--
ALTER TABLE `subject_assign`
  ADD CONSTRAINT `subject_assign_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_assign_rms_2` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_assign_rms_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_assign_rms_4` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_assign_rms_5` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timetable_class`
--
ALTER TABLE `timetable_class`
  ADD CONSTRAINT `timetable_class_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_class_rms_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_class_rms_3` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_class_rms_4` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timetable_exam`
--
ALTER TABLE `timetable_exam`
  ADD CONSTRAINT `timetable_exam_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_2` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_4` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_5` FOREIGN KEY (`session_id`) REFERENCES `schoolyear` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetable_exam_rms_6` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions_links`
--
ALTER TABLE `transactions_links`
  ADD CONSTRAINT `transactions_links_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_assign`
--
ALTER TABLE `transport_assign`
  ADD CONSTRAINT `transport_assign_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_route`
--
ALTER TABLE `transport_route`
  ADD CONSTRAINT `transport_route_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_stoppage`
--
ALTER TABLE `transport_stoppage`
  ADD CONSTRAINT `transport_stoppage_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_vehicle`
--
ALTER TABLE `transport_vehicle`
  ADD CONSTRAINT `transport_vehicle_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visitor_log`
--
ALTER TABLE `visitor_log`
  ADD CONSTRAINT `visitor_log_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visitor_purpose`
--
ALTER TABLE `visitor_purpose`
  ADD CONSTRAINT `visitor_purpose_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `voucher_head`
--
ALTER TABLE `voucher_head`
  ADD CONSTRAINT `voucher_head_rms_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

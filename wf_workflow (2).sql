-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 09, 2025 at 06:02 AM
-- Server version: 5.7.44
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wf_workflow`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requests`
--

CREATE TABLE `tbl_requests` (
  `request_number` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  `license_id` int(11) DEFAULT NULL,
  `extension_period` int(11) DEFAULT '0',
  `payment_verified` tinyint(1) DEFAULT '0',
  `national_gate_tracking_code` varchar(100) DEFAULT NULL,
  `has_network_permit` tinyint(1) DEFAULT '0',
  `has_environment_permit` tinyint(1) DEFAULT '0',
  `has_land_document` tinyint(1) DEFAULT '0',
  `has_contract` tinyint(1) DEFAULT '0',
  `app_number` varchar(50) DEFAULT NULL,
  `documents_acquired_date` datetime DEFAULT NULL,
  `dat_organization_register_date` datetime DEFAULT NULL,
  `dat_user_confirm_documents` datetime DEFAULT NULL,
  `current_step` varchar(50) DEFAULT NULL,
  `previous_step` varchar(50) DEFAULT NULL,
  `is_in_national_gate` tinyint(1) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `sys_status_id` int(11) DEFAULT NULL,
  `has_modification` tinyint(1) DEFAULT '0',
  `modification_comment` text,
  `responsible_expert_id` int(11) DEFAULT NULL,
  `original_license_expert_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expert_assigned_at` datetime DEFAULT NULL,
  `technical_review_at` datetime DEFAULT NULL,
  `financial_review_at` datetime DEFAULT NULL,
  `final_approval_at` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `rejection_reason` text,
  `rejected_by` int(11) DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_requests`
--

INSERT INTO `tbl_requests` (`request_number`, `created_at`, `user_id`, `license_id`, `extension_period`, `payment_verified`, `national_gate_tracking_code`, `has_network_permit`, `has_environment_permit`, `has_land_document`, `has_contract`, `app_number`, `documents_acquired_date`, `dat_organization_register_date`, `dat_user_confirm_documents`, `current_step`, `previous_step`, `is_in_national_gate`, `status_id`, `sys_status_id`, `has_modification`, `modification_comment`, `responsible_expert_id`, `original_license_expert_id`, `updated_at`, `expert_assigned_at`, `technical_review_at`, `financial_review_at`, `final_approval_at`, `ip_address`, `user_agent`, `rejection_reason`, `rejected_by`, `rejected_at`) VALUES
('0000000000', '2025-07-06 19:00:15', 1, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, '2025-07-06 19:09:53', '2025-07-06 19:09:53', '2025-07-06 19:09:53', NULL, NULL, NULL, 6, 11, 0, NULL, NULL, NULL, '2025-07-06 19:09:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('0123456789', '2025-07-08 09:38:31', 1, 7, 0, 0, '123456789', 0, 0, 0, 0, 'APP-2025-001', NULL, NULL, NULL, 'تایید درخواست', 'درحال پرداخت', 0, 9, 15, 0, NULL, NULL, 2, '2025-07-08 12:42:22', NULL, NULL, NULL, NULL, NULL, NULL, 'رد اتوماتیک بدلیل عدم تکمیل 24 ساعته', NULL, NULL),
('11223344', '2025-07-05 09:10:59', 3, NULL, 0, 0, NULL, 0, 0, 0, 0, 'APP445566', '2024-11-25 09:15:00', '2024-11-25 09:15:00', '2024-11-25 09:15:00', NULL, NULL, 0, 2, 6, 0, NULL, NULL, NULL, '2024-11-25 09:15:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('13654437', '2025-07-05 09:10:59', 1, NULL, 0, 0, NULL, 0, 0, 0, 0, 'APP123456', '2025-07-06 18:50:55', '2025-07-06 18:50:55', '2025-07-06 18:50:55', NULL, NULL, 1, 5, 10, 0, NULL, NULL, NULL, '2025-07-06 18:50:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('4444444444', '2025-07-07 12:27:57', 1, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, '2025-07-07 12:28:54', '2025-07-07 12:35:58', '2025-07-07 12:28:54', NULL, NULL, NULL, 6, 11, 0, NULL, NULL, NULL, '2025-07-07 12:35:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('44556677', '2025-07-06 10:00:00', 1, 4, 1, 1, 'NG-2025-4455', 1, 1, 1, 1, 'APP-2025-004', '2025-07-05 09:00:00', '2025-07-05 09:30:00', '2025-07-05 10:00:00', 'final-approval', 'financial-review', 1, 6, 15, 0, NULL, 2, 2, '2025-07-06 11:00:00', '2025-07-06 10:30:00', '2025-07-06 10:45:00', '2025-07-06 11:00:00', NULL, '192.168.1.100', 'Mozilla/5.0', NULL, NULL, NULL),
('55667788', '2025-07-06 11:30:00', 2, 5, 0, 0, NULL, 0, 1, 1, 0, 'APP-2025-005', '2025-07-06 11:00:00', NULL, NULL, 'technical-review', 'expert-assigned', 0, 5, NULL, 1, 'نیاز به اصلاح اطلاعات فنی پروژه', 3, 1, '2025-07-06 12:00:00', '2025-07-06 11:45:00', NULL, NULL, NULL, '192.168.1.101', 'PostmanRuntime/7.26.8', NULL, NULL, NULL),
('66778899', '2025-07-06 13:00:00', 3, NULL, 0, 0, NULL, 0, 0, 0, 0, 'APP-2025-006', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, '2025-07-06 13:00:00', NULL, NULL, NULL, NULL, '192.168.1.102', 'Apache-HttpClient/4.5.13', NULL, NULL, NULL),
('98765432', '2025-07-05 09:10:59', 1, NULL, 0, 0, NULL, 0, 0, 0, 0, 'APP789012', '2025-07-06 18:52:30', '2025-07-06 18:52:30', '2025-07-06 18:52:30', NULL, NULL, 0, 3, 7, 0, NULL, NULL, NULL, '2025-07-06 18:52:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('9999999999', '2025-07-06 19:10:32', 1, NULL, 0, 0, NULL, 0, 0, 0, 0, NULL, '2025-07-06 19:11:06', '2025-07-06 19:11:44', '2025-07-06 19:11:06', NULL, NULL, NULL, 6, 11, 0, NULL, NULL, NULL, '2025-07-06 19:11:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request_logs`
--

CREATE TABLE `tbl_request_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `request_number` varchar(50) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `changed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_request_logs`
--

INSERT INTO `tbl_request_logs` (`log_id`, `user_id`, `request_number`, `status_id`, `changed_at`) VALUES
(7, 1, '13654437', 5, '2024-11-27 16:58:01'),
(8, 1, '13654437', 10, '2024-11-27 16:58:01'),
(9, 2, '98765432', 3, '2024-11-26 10:30:00'),
(10, 2, '98765432', 7, '2024-11-26 10:30:00'),
(11, 3, '11223344', 2, '2024-11-25 09:15:00'),
(12, 3, '11223344', 6, '2024-11-25 09:15:00'),
(13, 1, '13654437', 5, '2025-07-04 16:26:04'),
(14, 1, '13654437', 10, '2025-07-04 16:26:04'),
(15, 1, '13654437', 5, '2025-07-04 16:27:16'),
(16, 1, '13654437', 10, '2025-07-04 16:27:16'),
(17, 1, '13654437', 5, '2025-07-04 16:30:22'),
(18, 1, '13654437', 10, '2025-07-04 16:30:22'),
(19, 1, '13654437', 5, '2025-07-04 16:41:05'),
(20, 1, '13654437', 10, '2025-07-04 16:41:05'),
(21, 1, '13654437', 5, '2025-07-04 16:45:15'),
(22, 1, '13654437', 10, '2025-07-04 16:45:16'),
(23, 1, '13654437', 6, '2025-07-04 16:45:16'),
(24, 1, '13654437', 11, '2025-07-04 16:45:16'),
(25, 1, '13654437', 5, '2025-07-04 16:47:37'),
(26, 1, '13654437', 10, '2025-07-04 16:47:37'),
(27, 1, '13654437', 6, '2025-07-04 16:47:37'),
(28, 1, '13654437', 11, '2025-07-04 16:47:37'),
(29, 1, '13654437', 5, '2025-07-04 16:49:21'),
(30, 1, '13654437', 10, '2025-07-04 16:49:21'),
(31, 1, '13654437', 6, '2025-07-04 16:49:21'),
(32, 1, '13654437', 11, '2025-07-04 16:49:21'),
(33, 1, '44556677', 1, '2025-07-06 10:00:00'),
(34, 1, '44556677', 5, '2025-07-06 10:30:00'),
(35, 2, '44556677', 6, '2025-07-06 11:00:00'),
(36, 2, '55667788', 1, '2025-07-06 11:30:00'),
(37, 3, '55667788', 5, '2025-07-06 12:00:00'),
(38, 3, '66778899', 1, '2025-07-06 13:00:00'),
(39, 1, '0123456789', 1, '2025-07-05 09:40:45'),
(40, 1, '13654437', 5, '2025-07-06 18:49:39'),
(41, 1, '13654437', 10, '2025-07-06 18:49:39'),
(42, 1, '13654437', 6, '2025-07-06 18:49:39'),
(43, 1, '13654437', 11, '2025-07-06 18:49:39'),
(44, 1, '13654437', 5, '2025-07-06 18:50:03'),
(45, 1, '13654437', 10, '2025-07-06 18:50:03'),
(46, 1, '13654437', 6, '2025-07-06 18:50:03'),
(47, 1, '13654437', 11, '2025-07-06 18:50:03'),
(48, 1, '13654437', 5, '2025-07-06 18:50:55'),
(49, 1, '13654437', 10, '2025-07-06 18:50:55'),
(50, 1, '13654437', 6, '2025-07-06 18:50:55'),
(51, 1, '13654437', 11, '2025-07-06 18:50:55'),
(52, 1, '98765432', 5, '2025-07-06 18:52:30'),
(53, 1, '98765432', 10, '2025-07-06 18:52:30'),
(54, 1, '98765432', 6, '2025-07-06 18:52:30'),
(55, 1, '98765432', 11, '2025-07-06 18:52:30'),
(56, 1, '0000000000', 5, '2025-07-06 19:01:24'),
(57, 1, '0000000000', 10, '2025-07-06 19:01:24'),
(58, 1, '0000000000', 6, '2025-07-06 19:01:24'),
(59, 1, '0000000000', 11, '2025-07-06 19:01:24'),
(60, 1, '0000000000', 5, '2025-07-06 19:09:53'),
(61, 1, '0000000000', 10, '2025-07-06 19:09:53'),
(62, 1, '0000000000', 6, '2025-07-06 19:09:53'),
(63, 1, '0000000000', 11, '2025-07-06 19:09:53'),
(64, 1, '9999999999', 5, '2025-07-06 19:11:06'),
(65, 1, '9999999999', 10, '2025-07-06 19:11:06'),
(66, 1, '9999999999', 6, '2025-07-06 19:11:44'),
(67, 1, '9999999999', 11, '2025-07-06 19:11:44'),
(68, 1, '4444444444', 5, '2025-07-07 12:28:54'),
(69, 1, '4444444444', 10, '2025-07-07 12:28:54'),
(70, 1, '4444444444', 6, '2025-07-07 12:35:58'),
(71, 1, '4444444444', 11, '2025-07-07 12:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_statuses`
--

CREATE TABLE `tbl_statuses` (
  `status_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `status_group` varchar(50) DEFAULT NULL,
  `national_gate_code` varchar(50) DEFAULT NULL,
  `is_system_status` tinyint(1) DEFAULT '0',
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_statuses`
--

INSERT INTO `tbl_statuses` (`status_id`, `title`, `status_group`, `national_gate_code`, `is_system_status`, `description`) VALUES
(1, 'ثبت اولیه', 'درخواست', 'request-submitted', 0, 'درخواست توسط متقاضی ثبت شده است'),
(2, 'در حال بررسی', 'درخواست', 'in-progress', 0, 'درخواست در حال بررسی توسط کارشناس است'),
(3, 'مدارک ناقص', 'مدارک', 'missing-documents', 0, 'مدارک ارسالی ناقص یا نادرست است'),
(4, 'مدارک ارسال شد', 'مدارک', 'documents-sent', 0, 'مدارک به درگاه ملی ارسال شده'),
(5, 'مدارک دریافت شد', 'مدارک', 'documents-acquired', 0, 'مدارک توسط سیستم دریافت شده'),
(6, 'مدارک تایید شد', 'مدارک', 'documents-approved', 0, 'مدارک توسط کارشناس تایید شده'),
(7, 'درخواست لغو شد', 'درخواست', 'request-canceled', 0, 'درخواست توسط متقاضی لغو شده'),
(8, 'درخواست رد شد', 'درخواست', 'request-rejected', 0, 'درخواست توسط کارشناس رد شده'),
(9, 'درخواست تکمیل شد', 'درخواست', 'request-completed', 0, 'فرآیند درخواست با موفقیت تکمیل شد'),
(10, 'در انتظار اقدام کاربر', 'درخواست', 'awaiting-user-action', 0, 'نیاز به اقدام از طرف متقاضی'),
(11, 'ارسال به درگاه ملی', 'سیستم', 'sent-to-national-gate', 1, 'درخواست به درگاه ملی ارسال شد'),
(12, 'دریافت از درگاه ملی', 'سیستم', 'received-from-national-gate', 1, 'پاسخ از درگاه ملی دریافت شد'),
(13, 'توکن PGSB دریافت شد', 'سیستم', 'token-received-pgsb', 1, 'توکن ارتباطی با PGSB دریافت شد'),
(14, 'توکن PGSB منقضی شد', 'سیستم', 'token-expired-pgsb', 1, 'توکن PGSB منقضی شده است'),
(15, 'پروانه فعال', 'پروانه', 'license-active', 1, 'پروانه در وضعیت فعال قرار دارد'),
(16, 'پروانه غیرفعال', 'پروانه', 'license-inactive', 1, 'پروانه در وضعیت غیرفعال قرار دارد'),
(17, 'پروانه در حال بررسی', 'پروانه', 'license-under-approval', 1, 'پروانه در حال بررسی است'),
(18, 'پروانه رد شد', 'پروانه', 'license-rejected', 1, 'پروانه توسط کارشناس رد شده'),
(19, 'پروانه لغو شد', 'پروانه', 'license-canceled', 1, 'پروانه لغو شده است'),
(20, 'ارسال به سامانه BI', 'سیستم', 'sent-to-bi', 1, 'اطلاعات به سامانه BI ارسال شد'),
(21, 'درحال پرداخت', NULL, NULL, 0, NULL),
(22, 'در انتظار پرداخت کاربر', NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `national_code` varchar(11) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `username`, `national_code`, `mobile`, `email`, `created_at`, `updated_at`) VALUES
(1, 'ali123', '7418529630', '09123456789', 'ali@example.com', '2025-07-04 15:15:42', '2025-07-05 09:41:56'),
(2, 'reza_gh', '0987654321', '09369876543', 'reza@example.com', '2025-07-04 15:15:42', '2025-07-04 15:15:42'),
(3, 'sara_user', '1357924680', '09101234567', 'sara@example.com', '2025-07-04 15:15:42', '2025-07-04 15:15:42'),
(4, 'user1', '12345678901', '09123456789', 'user1@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09'),
(5, 'user2', '12345678902', '09123456780', 'user2@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09'),
(6, 'user3', '12345678903', '09123456781', 'user3@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09'),
(7, 'user4', '12345678904', '09123456782', 'user4@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09'),
(8, 'user5', '12345678905', '09123456783', 'user5@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09'),
(9, 'user6', '12345678906', '09123456784', 'user6@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09'),
(10, 'user7', '12345678907', '09123456785', 'user7@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09'),
(11, 'user8', '12345678908', '09123456786', 'user8@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09'),
(12, 'user9', '12345678909', '09123456787', 'user9@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09'),
(13, 'user10', '12345678910', '09123456788', 'user10@example.com', '2025-07-06 13:22:09', '2025-07-06 13:22:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  ADD PRIMARY KEY (`request_number`),
  ADD KEY `fk_requests_responsible_expert` (`responsible_expert_id`),
  ADD KEY `fk_requests_original_expert` (`original_license_expert_id`),
  ADD KEY `idx_requests_license` (`license_id`),
  ADD KEY `idx_requests_status` (`status_id`),
  ADD KEY `idx_requests_user` (`user_id`),
  ADD KEY `idx_requests_national_gate` (`is_in_national_gate`),
  ADD KEY `idx_requests_extension` (`extension_period`),
  ADD KEY `fk_requests_rejected_by` (`rejected_by`);

--
-- Indexes for table `tbl_request_logs`
--
ALTER TABLE `tbl_request_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `request_number` (`request_number`),
  ADD KEY `fk_log_user` (`user_id`);

--
-- Indexes for table `tbl_statuses`
--
ALTER TABLE `tbl_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `national_code` (`national_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_request_logs`
--
ALTER TABLE `tbl_request_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tbl_statuses`
--
ALTER TABLE `tbl_statuses`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  ADD CONSTRAINT `fk_requests_license` FOREIGN KEY (`license_id`) REFERENCES `tbl_licenses` (`license_id`),
  ADD CONSTRAINT `fk_requests_original_expert` FOREIGN KEY (`original_license_expert_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `fk_requests_rejected_by` FOREIGN KEY (`rejected_by`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `fk_requests_responsible_expert` FOREIGN KEY (`responsible_expert_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tbl_request_logs`
--
ALTER TABLE `tbl_request_logs`
  ADD CONSTRAINT `fk_log_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_request_logs_ibfk_1` FOREIGN KEY (`request_number`) REFERENCES `tbl_requests` (`request_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

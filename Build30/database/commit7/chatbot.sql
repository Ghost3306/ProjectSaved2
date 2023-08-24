-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2023 at 05:55 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-15 14:36:51.863464'),
(2, 'auth', '0001_initial', '2023-07-15 14:36:52.223743'),
(3, 'admin', '0001_initial', '2023-07-15 14:36:52.318117'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-15 14:36:52.325109'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-15 14:36:52.332376'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-15 14:36:52.387336'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-15 14:36:52.430247'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-15 14:36:52.449197'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-15 14:36:52.458177'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-15 14:36:52.500017'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-15 14:36:52.503012'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-15 14:36:52.511986'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-15 14:36:52.532930'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-15 14:36:52.557634'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-15 14:36:52.579892'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-15 14:36:52.586875'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-15 14:36:52.607820'),
(18, 'sessions', '0001_initial', '2023-07-15 14:36:52.640731');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feestr`
--

CREATE TABLE `feestr` (
  `faculty` varchar(13) CHARACTER SET utf8 DEFAULT NULL,
  `course` varchar(15) DEFAULT NULL,
  `lab` varchar(11) DEFAULT NULL,
  `library` varchar(11) DEFAULT NULL,
  `event` varchar(11) DEFAULT NULL,
  `total` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feestr`
--

INSERT INTO `feestr` (`faculty`, `course`, `lab`, `library`, `event`, `total`) VALUES
('11th commerce', '2000', '100', '100', '50', '2250'),
('11th arts', '2000', '0', '200', '50', '2250'),
('11th science', '2000', '1000', '100', '50', '3150'),
('12th commerce', '1500', '100', '100', '50', '1750'),
('12th arts', '1500', '0', '200', '50', '1750'),
('12th science', '1500', '1000', '100', '50', '2650'),
('fy bcom', '3000', '0', '100', '100', '3200'),
('sy bcom', '3000', '0', '100', '100', '3200'),
('ty bcom', '3000', '0', '100', '100', '3200'),
('fy ba', '2000', '0', '100', '100', '2200'),
('sy ba', '2000', '0', '100', '100', '2200'),
('ty ba ', '2000', '0', '100', '100', '2200'),
('fy bsc', '3000', '100', '100', '100', '3300'),
('sy bsc', '3000', '100', '100', '100', '3300'),
('ty bsc', '3000', '100', '100', '100', '3300'),
(' fy cs', '16000', '16000', '16000', '16000', '16000'),
('sy cs ', '16000', '16000', '16000', '16000', '16000'),
('ty cs ', '16000', '16000', '16000', '16000', '16000');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `Date` varchar(10) DEFAULT NULL,
  `Holiday` varchar(35) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`Date`, `Holiday`) VALUES
('2022-01-26', 'Republic Day'),
('2022-02-19', 'Chhatrapati Shivaji Maharaj Jayanti'),
('2022-03-01', 'Maha Shivratri'),
('2022-03-19', 'Holi'),
('2022-04-02', 'Gudi Padava'),
('2022-04-14', 'Mahavir Jayanti'),
('2022-04-14', 'Dr. Ambedkar Jayanti'),
('2022-04-15', 'Good Friday'),
('2022-05-09', 'Guru Rabindranath’s Birthday'),
('2022-05-16', 'Buddha Purnima'),
('2022-08-09', 'Muharram'),
('2022-08-15', 'Independence day'),
('2022-08-16', 'Parsi New Year’s Day'),
('2022-08-31', 'Ganesh Chaturthi'),
('2022-10-05', 'Vijaya Dashami'),
('2022-10-25', 'Diwali'),
('2022-10-26', 'Deepavali Holiday'),
('2022-11-08', 'Guru Nanak Jayanti');

-- --------------------------------------------------------

--
-- Table structure for table `newadd`
--

CREATE TABLE `newadd` (
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `dob` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `newadd`
--

INSERT INTO `newadd` (`name`, `email`, `phone`, `dob`, `address`, `gender`) VALUES
('om rajan rawool', 'om@gmail.com', '7845785474', '02-05-2003', 'kankavli', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `res`
--

CREATE TABLE `res` (
  `roll` varchar(11) DEFAULT NULL,
  `name` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  `class` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `sub1` varchar(11) DEFAULT NULL,
  `sub2` varchar(11) DEFAULT NULL,
  `sub3` varchar(11) DEFAULT NULL,
  `total` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `res`
--

INSERT INTO `res` (`roll`, `name`, `class`, `sub1`, `sub2`, `sub3`, `total`) VALUES
('1', 'abc', 'ty', '54', '85', '36', '150'),
('2', 'abc', 'ty', '55', '86', '37', '151'),
('3', 'abc', 'ty', '56', '87', '38', '152'),
('4', 'abc', 'ty', '57', '88', '54', '153'),
('5', 'abc', 'ty', '58', '89', '55', '180'),
('6', 'abc', 'ty', '59', '75', '56', '181'),
('7', 'abc', 'ty', '60', '76', '57', '182'),
('8', 'abc', 'ty', '61', '77', '58', '183'),
('9', 'abc', 'ty', '62', '78', '59', '184'),
('10', 'abc', 'ty', '63', '79', '60', '185'),
('10', 'om rajan r', 'Ty', '85', '74', '65', '154'),
('11', 'om rajan r', 'Ty', '85', '74', '45', '154'),
('12', 'om rajan rawool', 'Ty', '45', '85', '85', '145'),
('13', 'lalit rajan rawool', 'Ty', '87', '90', '87', '200');

-- --------------------------------------------------------

--
-- Table structure for table `schapply`
--

CREATE TABLE `schapply` (
  `email` varchar(40) NOT NULL,
  `namesc` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schapply`
--

INSERT INTO `schapply` (`email`, `namesc`) VALUES
('om@gmail.com', 'om rajan rawool'),
('om@gmail.com', 'abc'),
('om@gmail.com', 'abc'),
('om@gmail.com', ' Post-Matric Scholar');

-- --------------------------------------------------------

--
-- Table structure for table `schoolarship`
--

CREATE TABLE `schoolarship` (
  `name` varchar(30) NOT NULL,
  `elibility` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schoolarship`
--

INSERT INTO `schoolarship` (`name`, `elibility`) VALUES
('Post-Matric Scholarship to SBC', 'Fy'),
('Tuition Fees and Examination F', 'Sy'),
('Eklavya Scholarship.', '12'),
('Merit Scholarships for Economi', 'Ty'),
('Open Merit Scholarship in Juni', '11'),
('Government Vidyaniketan Schola', '10');

-- --------------------------------------------------------

--
-- Table structure for table `schoolarshipres`
--

CREATE TABLE `schoolarshipres` (
  `name` varchar(30) NOT NULL,
  `schoolar` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schoolarshipres`
--

INSERT INTO `schoolarshipres` (`name`, `schoolar`) VALUES
('lalit rajan rawool', 'Post-Matric Scholarship to SBC'),
('om rajan rawool', 'Eklavya Scholarship');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `address` varchar(25) NOT NULL,
  `password` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL DEFAULT 'male'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `email`, `phone`, `dob`, `address`, `password`, `gender`) VALUES
('lalit rajan rawool', 'lrrawool2503@gmail.com', '9604449928', '2/5/2003', 'at post halwal,kanakavli', 'root', 'male'),
('lalit rajan rawool', 'lrrawool2503@gmail.com', '9604449928', '2/5/2003', 'at post halwal,kanakavli', 'root', 'male'),
('om rajan rawool', 'om@gmail.com', '7845785474', '02-05-2003', 'kankavli', 'admin', 'male'),
('Lalit  Rawool', 'lrrawool2503@gmail.com', '', '', 'Halwal', 'root', 'male'),
('Lalit  Rawool', 'lrrawool2503@gmail.com', '', '', 'Halwal', 'root', 'male'),
('LalitA RajanB Rawool', 'lrrawool2503@gmail.com', '0880507703', '08/27/1999', 'Halwal', 'root', 'male'),
('LalitA RajanB Rawool', 'lrrawool2503@gmail.com', '0880507703', '08/27/1999', 'Halwal', 'root', 'male'),
('Lalita Rajan Rawool', 'ads@gmail.com', '0880507703', '08/27/1999', 'Halwal', 'root', 'male'),
('lalit rajan rawool', 'lrrawool2503@gmail.com', '9604449928', '2/5/2003', 'at post halwal,kanakavli', 'root', 'male'),
('lalit rajan rawool', 'lrrawool2503@gmail.com', '9604449928', '2/5/2003', 'at post halwal,kanakavli', 'root', 'male'),
('om rajan rawool', 'om@gmail.com', '7845785474', '02-05-2003', 'kankavli', 'admin', 'male'),
('Lalit  Rawool', 'lrrawool2503@gmail.com', '', '', 'Halwal', 'root', 'male'),
('Lalit  Rawool', 'lrrawool2503@gmail.com', '', '', 'Halwal', 'root', 'male'),
('LalitA RajanB Rawool', 'lrrawool2503@gmail.com', '0880507703', '08/27/1999', 'Halwal', 'root', 'male'),
('LalitA RajanB Rawool', 'lrrawool2503@gmail.com', '0880507703', '08/27/1999', 'Halwal', 'root', 'male'),
('Lalita Rajan Rawool', 'ads@gmail.com', '0880507703', '08/27/1999', 'Halwal', 'root', 'male'),
('  ', '', '', '', '', '', 'male'),
('  ', '', '', '', '', '', 'male'),
('  ', '', '', '', '', 'a', 'male'),
('Lalit Rajan Rawool', 'lrrawool2503@gmail.com', '0880507703', '2023-06-27', 'Halwal', 'root', 'male'),
('abc', 'lrrawool2503@gmail.com', '9604449928', '2/5/2003', 'Kankavli', 'root', 'male'),
('Lalit Rajan Rawool', 'lalitrawool25@gmail.com', '9604449928', '2003-05-02', 'At post Halwal Kankavli, ', 'root', 'male'),
('Jessica Robert Pinto', 'jess@gmail.com', '9878477885', '2003-11-05', 'at post Kanedi', 'root', 'female');

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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

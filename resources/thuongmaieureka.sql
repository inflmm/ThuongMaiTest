-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 14, 2026 at 08:50 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thuongmaieureka`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `contentPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `summary` text COLLATE utf8mb4_vi_0900_as_cs,
  `thumbnail` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `publishTime` datetime(6) DEFAULT NULL,
  `isPublished` bit(1) NOT NULL,
  `isFeatured` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKpl5w1yw2c5lligoeb9a393fr3` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `slug`, `contentPath`, `summary`, `thumbnail`, `title`, `created_time`, `updated_time`, `deleted`, `publishTime`, `isPublished`, `isFeatured`) VALUES
(1, 'huong-dan-tich-hop-toc', 'Tin tức/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Hướng dẫn tích hợp Table of Contents cho Website', '2026-04-27 10:17:27.597996', '2026-05-23 16:32:20.925680', b'0', '2026-04-27 22:18:00.000000', b'1', NULL),
(2, 'may-tinh-xach-tay', NULL, 'Tìm hiểu sâu các phần cứng cấu thành máy tính xách tay. Nguồn từ Wikipedia.', '/images/ava_d4425b2bbd314fb09c178ed716c36c37_grande.png', 'Giải thích các phần cứng của máy tính xách tay', '2026-04-29 10:17:27.597996', '2026-05-11 11:40:55.792396', b'0', '2026-04-27 12:18:40.000000', b'1', NULL),
(3, 'bai-viet-dau-tien-tu-trang-admin', 'abc/', 'Mô tả bài viết', '/images/af4lhmww5i_ecf7eb9ba8e9454897cbd78a0549e09a_grande.png', 'Bài viết đầu tiên từ trang admin', '2026-05-12 08:43:08.098004', '2026-05-12 19:26:56.528721', b'0', '2026-05-11 18:43:00.000000', b'1', b'0'),
(4, 'bai-viet-thu-2', 'abc/', 'Mô tả bài viết', '/images/acer-nitro-v-15-anv15-41-r2up-r5_78b7e62a30114f29a634d61b151c4974_grande.png', 'Bài viết thứ 2', '2026-05-12 11:20:34.088930', '2026-05-22 11:11:42.102898', b'0', '2026-05-07 19:51:00.000000', b'1', b'0'),
(5, 'bai-viet-thu-3', 'abc/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Bài viết thứ 3', '2026-05-12 14:07:13.669578', '2026-05-12 14:07:13.669578', b'0', NULL, b'0', b'0'),
(6, 'bai-viet-thu-4', 'abc/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Bài viết thứ 4', '2026-05-12 14:08:02.489972', '2026-05-12 14:08:02.489972', b'0', NULL, b'0', b'0'),
(7, 'bai-viet-thu-5', 'abc/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Bài viết thứ 5', '2026-05-12 14:08:13.843558', '2026-05-12 14:08:13.843558', b'0', NULL, b'0', b'0'),
(8, 'bai-viet-thu-6', 'abc/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Bài viết thứ 6', '2026-05-12 14:08:27.611679', '2026-05-12 14:08:27.611679', b'0', NULL, b'0', b'0'),
(9, 'bai-viet-thu-7', 'abc/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Bài viết thứ 7', '2026-05-12 14:08:40.897513', '2026-05-12 14:08:40.897513', b'0', NULL, b'0', b'0'),
(10, 'bai-viet-thu-8', 'abc/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Bài viết thứ 8', '2026-05-12 14:08:53.227483', '2026-05-12 14:08:53.227483', b'0', NULL, b'0', b'0'),
(11, 'bai-viet-thu-9', 'abc/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Bài viết thứ 9', '2026-05-12 14:09:15.861846', '2026-05-12 14:09:15.861846', b'0', NULL, b'0', b'0'),
(12, 'bai-viet-thu-10', 'abc/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Bài viết thứ 10', '2026-05-12 14:09:25.767082', '2026-05-12 14:09:25.767082', b'0', NULL, b'0', b'0'),
(13, 'bai-viet-thu-11', 'abc/', 'Mô tả bài viết', '/images/blog-thumb-1.jpg', 'Bài viết thứ 11', '2026-05-12 14:09:34.605209', '2026-05-12 14:09:34.605209', b'0', NULL, b'0', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE IF NOT EXISTS `cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `productId` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `userId` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfm2xpv0aksxnpoucoywb41f86` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `cartitem`
--

INSERT INTO `cartitem` (`id`, `deleted`, `productId`, `quantity`, `userId`, `created_time`, `updated_time`) VALUES
(1, b'1', 1, 5, 'guest_001', NULL, NULL),
(2, b'1', 1, 8, 'guest_001', NULL, NULL),
(3, b'1', 3, 2, 'guest_001', NULL, NULL),
(4, b'1', 4, 1, 'guest_001', NULL, NULL),
(5, b'1', 1, 2, 'guest_001', NULL, NULL),
(6, b'1', 3, 3, 'guest_001', NULL, NULL),
(7, b'1', 5, 2, 'guest_001', NULL, NULL),
(8, b'1', 10, 1, 'guest_001', NULL, NULL),
(9, b'1', 9, 1, 'guest_001', NULL, NULL),
(10, b'1', 4, 1, 'guest_001', NULL, NULL),
(11, b'1', 1, 1, 'guest_001', NULL, NULL),
(12, b'1', 2, 3, 'guest_001', NULL, NULL),
(13, b'1', 4, 4, 'guest_001', NULL, NULL),
(14, b'1', 3, 1, 'guest_001', NULL, NULL),
(15, b'0', 2, 1, 'guest_001', NULL, NULL),
(16, b'0', 7, 1, 'guest_001', NULL, NULL),
(17, b'0', 9, 1, 'guest_001', NULL, NULL),
(18, b'1', 4, 2, 'USER_20260403_6411F', NULL, NULL),
(19, b'1', 3, 2, 'USER_20260403_6411F', NULL, NULL),
(20, b'1', 6, 1, 'USER_20260403_6411F', NULL, NULL),
(21, b'1', 2, 1, 'USER_20260403_6411F', NULL, NULL),
(22, b'1', 5, 3, 'USER_20260403_6411F', NULL, NULL),
(23, b'1', 4, 2, 'USER_20260403_81759', NULL, NULL),
(24, b'1', 2, 1, 'USER_20260403_81759', '2026-04-03 12:09:53.507400', '2026-04-03 12:09:56.662353'),
(25, b'1', 3, 1, 'USER_20260403_81759', '2026-04-03 13:01:22.328138', '2026-04-03 13:01:26.900972'),
(26, b'1', 2, 13, 'USER_20260403_81759', '2026-04-03 13:01:22.358462', '2026-04-13 11:01:26.376568'),
(27, b'1', 4, 2, 'USER_20260403_6411F', '2026-04-03 16:15:25.831719', '2026-04-03 16:48:17.503471'),
(28, b'1', 2, 2, 'USER_20260403_6411F', '2026-04-03 16:52:25.552635', '2026-04-03 17:17:53.474621'),
(29, b'1', 4, 2, 'USER_20260403_6411F', '2026-04-03 16:52:29.496701', '2026-04-03 17:17:53.476870'),
(30, b'1', 7, 1, 'USER_20260403_6411F', '2026-04-03 17:17:35.247799', '2026-04-03 17:17:53.476870'),
(31, b'1', 6, 2, 'USER_20260403_6411F', '2026-04-03 17:18:11.746904', '2026-07-14 13:17:14.590414'),
(32, b'1', 3, 3, 'USER_20260403_6411F', '2026-04-03 17:18:17.007492', '2026-07-14 13:17:14.590414'),
(33, b'0', 7, 5, 'USER_20260403_81759', '2026-04-03 21:08:13.059493', '2026-04-27 09:01:17.884703'),
(34, b'1', 8, 2, 'USER_20260403_81759', '2026-04-03 21:08:14.881993', '2026-04-12 10:15:20.549404'),
(35, b'1', 10, 1, 'USER_20260403_6411F', '2026-04-04 10:37:55.641819', '2026-07-14 13:17:14.590414'),
(36, b'0', 3, 1, 'USER_20260407_8DA53', '2026-04-07 21:54:19.701176', '2026-04-07 21:54:19.701176'),
(37, b'0', 4, 1, 'USER_20260407_8DA53', '2026-04-07 21:54:19.704174', '2026-04-07 21:54:19.704174'),
(38, b'1', 3, 2, 'USER_20260403_81759', '2026-04-09 15:46:19.321182', '2026-04-12 10:16:24.671144'),
(39, b'1', 1, 11, 'USER_20260403_81759', '2026-04-13 11:02:23.061748', '2026-04-13 12:05:58.329975'),
(40, b'1', 2, 6, 'USER_20260403_81759', '2026-04-13 11:27:02.186125', '2026-04-13 12:06:45.948602'),
(41, b'1', 4, 8, 'USER_20260403_81759', '2026-04-13 11:41:05.200505', '2026-04-13 15:20:22.948807'),
(42, b'1', 3, 5, 'USER_20260403_81759', '2026-04-13 12:07:21.086933', '2026-04-13 15:08:50.729288'),
(43, b'1', 1, 3, 'USER_20260403_81759', '2026-04-13 13:51:01.141899', '2026-04-13 15:32:04.382382'),
(44, b'0', 2, 6, 'USER_20260403_81759', '2026-04-13 13:55:40.242949', '2026-04-25 11:39:18.966032'),
(45, b'0', 5, 2, 'USER_20260403_81759', '2026-04-13 14:47:32.494123', '2026-04-13 14:48:20.704585'),
(46, b'1', 2, 1, 'USER_20260507_44033', '2026-05-14 16:12:56.085005', '2026-07-14 13:13:43.022486'),
(47, b'1', 3, 1, 'USER_20260507_44033', '2026-07-14 13:13:37.981764', '2026-07-14 13:13:43.025872'),
(48, b'1', 5, 1, 'USER_20260507_44033', '2026-07-14 13:13:39.728416', '2026-07-14 13:13:43.025872'),
(49, b'1', 1, 2, 'USER_20260507_44033', '2026-07-14 13:13:55.775174', '2026-07-14 13:29:09.842658'),
(50, b'1', 2, 2, 'USER_20260507_44033', '2026-07-14 13:18:53.572213', '2026-07-14 13:29:09.843157'),
(51, b'1', 3, 1, 'USER_20260403_6411F', '2026-07-14 13:19:15.704431', '2026-07-14 13:31:36.927271'),
(52, b'1', 4, 1, 'USER_20260507_44033', '2026-07-14 13:28:50.069689', '2026-07-14 13:29:09.843157'),
(53, b'1', 3, 1, 'USER_20260507_44033', '2026-07-14 13:29:30.041015', '2026-07-14 13:29:35.468043'),
(54, b'1', 2, 1, 'USER_20260507_44033', '2026-07-14 13:29:37.989665', '2026-07-14 13:38:44.783772'),
(55, b'1', 4, 1, 'USER_20260507_44033', '2026-07-14 13:29:41.802579', '2026-07-14 13:38:44.783772'),
(56, b'1', 2, 1, 'USER_20260403_6411F', '2026-07-14 13:31:13.105145', '2026-07-14 13:31:36.927271'),
(57, b'1', 3, 1, 'USER_20260403_6411F', '2026-07-14 13:31:42.370025', '2026-07-14 13:35:31.608090'),
(58, b'1', 2, 1, 'USER_20260403_6411F', '2026-07-14 13:35:43.133950', '2026-07-14 13:35:51.971171'),
(59, b'1', 4, 3, 'USER_20260403_6411F', '2026-07-14 13:35:48.752291', '2026-07-14 13:35:51.971171'),
(60, b'1', 1, 1, 'USER_20260403_6411F', '2026-07-14 13:36:15.626863', '2026-07-14 13:36:20.565199'),
(61, b'1', 3, 3, 'USER_20260403_6411F', '2026-07-14 13:36:18.510129', '2026-07-14 13:36:20.565199'),
(62, b'1', 2, 1, 'USER_20260507_44033', '2026-07-14 13:40:45.926691', '2026-07-14 13:40:49.662561'),
(63, b'1', 3, 1, 'USER_20260507_44033', '2026-07-14 13:40:47.179738', '2026-07-14 13:40:49.664723'),
(64, b'1', 3, 1, 'USER_20260507_44033', '2026-07-14 13:40:59.526604', '2026-07-14 13:41:01.595459'),
(65, b'1', 4, 1, 'USER_20260507_44033', '2026-07-14 13:41:04.600016', '2026-07-14 13:42:01.021204'),
(66, b'1', 2, 1, 'USER_20260403_6411F', '2026-07-14 13:41:15.244141', '2026-07-14 13:41:20.183199'),
(67, b'1', 3, 2, 'USER_20260403_6411F', '2026-07-14 13:41:16.552752', '2026-07-14 13:41:20.183199'),
(68, b'1', 2, 4, 'USER_20260403_6411F', '2026-07-14 13:41:23.280103', '2026-07-14 13:42:13.778255'),
(69, b'1', 4, 2, 'USER_20260507_44033', '2026-07-14 13:42:04.388100', '2026-07-14 13:42:28.795783'),
(70, b'0', 2, 1, 'USER_20260403_6411F', '2026-07-14 13:42:16.314426', '2026-07-14 13:42:16.314426'),
(71, b'1', 3, 2, 'USER_20260507_44033', '2026-07-14 13:42:38.763464', '2026-07-14 13:42:42.567551'),
(72, b'1', 2, 3, 'USER_20260507_44033', '2026-07-14 13:42:44.617850', '2026-07-14 13:42:49.198927'),
(73, b'1', 1, 3, 'USER_20260507_44033', '2026-07-14 13:42:50.927021', '2026-07-14 13:42:55.131290'),
(74, b'1', 3, 4, 'USER_20260507_44033', '2026-07-14 13:43:23.569265', '2026-07-14 13:45:44.889571'),
(75, b'1', 4, 1, 'USER_20260507_44033', '2026-07-14 13:45:50.009552', '2026-07-14 13:47:18.992532'),
(76, b'1', 3, 1, 'USER_20260507_44033', '2026-07-14 13:47:15.136482', '2026-07-14 13:47:18.992532'),
(77, b'1', 3, 1, 'USER_20260507_44033', '2026-07-14 13:49:20.374261', '2026-07-14 13:49:22.989641'),
(78, b'1', 3, 1, 'USER_20260507_44033', '2026-07-14 13:50:58.968469', '2026-07-14 13:51:03.363897'),
(79, b'1', 2, 1, 'USER_20260507_44033', '2026-07-14 13:51:05.603613', '2026-07-14 13:51:19.854550'),
(80, b'1', 3, 1, 'USER_20260507_44033', '2026-07-14 13:51:45.098652', '2026-07-14 13:51:47.974927');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
CREATE TABLE IF NOT EXISTS `collections` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKf5d7hxjge10f628bpt8444641` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `collection_product`
--

DROP TABLE IF EXISTS `collection_product`;
CREATE TABLE IF NOT EXISTS `collection_product` (
  `collection_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  KEY `FKqmtvviudfrqwn5r6lpmi9sosr` (`product_id`),
  KEY `FK9bi3dl9lx2efv8nxlvd4c9437` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE IF NOT EXISTS `orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderId` bigint DEFAULT NULL,
  `productId` bigint DEFAULT NULL,
  `productName` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unitPrice` double DEFAULT NULL,
  `productSlug` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl8avcrunmvqdcldoec2duhdiq` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `orderId`, `productId`, `productName`, `quantity`, `unitPrice`, `productSlug`, `created_time`, `updated_time`) VALUES
(1, 1, 1, 'PC GVN x MSI PROJECT ZERO WHITE (Intel i5-14400F/ VGA RTX 5060)', 8, 36990000, NULL, NULL, NULL),
(2, 1, 3, 'PC GVN Intel i5-12400F/ VGA RTX 3050', 2, 15690000, NULL, NULL, NULL),
(3, 2, NULL, 'PC GVN x Corsair iCUE (Intel i5-14400F/ VGA RTX 5060)', 2, 34690000, 'pc-gvn-corsair-icue-intel-i5-14400f-vga-rtx5060', NULL, NULL),
(4, 2, NULL, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 3, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', NULL, NULL),
(5, 2, NULL, 'PC GVN Intel i5-12400F/ VGA RTX 3050', 2, 15690000, 'pc-gvn-intel-i5-12400f-vga-rtx3050', NULL, NULL),
(6, 2, NULL, 'PC GVN X ASUS ROG HATSUNE MIKU EDITION (AMD Ryzen 7 9800X3D/VGA RTX 5080)', 1, 128490000, 'pc-gvn-x-asus-rog-hatsune-miku-edition-amd-ryzen7-9800x3d-vga-rtx5080', NULL, NULL),
(7, 2, NULL, 'PC GVN x MSI PROJECT ZERO WHITE (Intel i5-14400F/ VGA RTX 5060)', 1, 36990000, 'pc-gvn-msi-project-zero-white-intel-i5-14400f-vga-rtx5060', NULL, NULL),
(8, 2, NULL, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', NULL, NULL),
(9, 3, NULL, 'PC GVN x Corsair iCUE (Intel i5-14400F/ VGA RTX 5060)', 1, 34690000, 'pc-gvn-corsair-icue-intel-i5-14400f-vga-rtx5060', NULL, NULL),
(10, 3, NULL, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 3, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', NULL, NULL),
(11, 3, NULL, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 4, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', NULL, NULL),
(12, 4, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 1, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', NULL, NULL),
(13, 5, 4, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 2, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', NULL, NULL),
(14, 6, 4, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 2, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', NULL, NULL),
(15, 6, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 2, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', NULL, NULL),
(16, 6, 6, 'PC GVN Intel i5-12400F/ VGA RTX 3060', 1, 19190000, 'pc-gvn-intel-i5-12400f-vga-rtx3060', NULL, NULL),
(17, 6, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', NULL, NULL),
(18, 6, 5, 'PC GVN Intel i5-12400F/ VGA RTX 3050', 3, 15690000, 'pc-gvn-intel-i5-12400f-vga-rtx3050', NULL, NULL),
(19, 7, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 2, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-04-03 17:17:53.464031', '2026-04-03 17:17:53.464031'),
(20, 7, 4, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 2, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', '2026-04-03 17:17:53.470596', '2026-04-03 17:17:53.470596'),
(21, 7, 7, 'PC GVN Intel i7-14700F/ VGA RTX 5060', 1, 32190000, 'pc-gvn-intel-i7-14700f-vga-rtx5060', '2026-04-03 17:17:53.472108', '2026-04-03 17:17:53.472108'),
(22, 8, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:13:42.998881', '2026-07-14 13:13:42.998881'),
(23, 8, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 1, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:13:43.017457', '2026-07-14 13:13:43.017457'),
(24, 8, 5, 'PC GVN Intel i5-12400F/ VGA RTX 3050', 1, 15690000, 'pc-gvn-intel-i5-12400f-vga-rtx3050', '2026-07-14 13:13:43.019972', '2026-07-14 13:13:43.019972'),
(25, 9, 6, 'PC GVN Intel i5-12400F/ VGA RTX 3060', 2, 19190000, 'pc-gvn-intel-i5-12400f-vga-rtx3060', '2026-07-14 13:17:14.581775', '2026-07-14 13:17:14.581775'),
(26, 9, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 3, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:17:14.584310', '2026-07-14 13:17:14.584310'),
(27, 9, 10, 'PC GVN X ASUS ROG HATSUNE MIKU EDITION (AMD Ryzen 7 9800X3D/VGA RTX 5080)', 1, 128490000, 'pc-gvn-x-asus-rog-hatsune-miku-edition-amd-ryzen7-9800x3d-vga-rtx5080', '2026-07-14 13:17:14.588386', '2026-07-14 13:17:14.588386'),
(28, 10, 1, 'PC GVN x Corsair iCUE (Intel i5-14400F/ VGA RTX 5060)', 2, 34690000, 'pc-gvn-corsair-icue-intel-i5-14400f-vga-rtx5060', '2026-07-14 13:29:09.836442', '2026-07-14 13:29:09.836442'),
(29, 10, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 2, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:29:09.838479', '2026-07-14 13:29:09.838479'),
(30, 10, 4, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:29:09.840002', '2026-07-14 13:29:09.840002'),
(31, 11, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 1, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:31:36.923401', '2026-07-14 13:31:36.923401'),
(32, 11, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:31:36.925438', '2026-07-14 13:31:36.925438'),
(33, 12, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 1, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:35:31.605888', '2026-07-14 13:35:31.605888'),
(34, 13, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:35:51.966855', '2026-07-14 13:35:51.966855'),
(35, 13, 4, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 3, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:35:51.969120', '2026-07-14 13:35:51.969120'),
(36, 14, 1, 'PC GVN x Corsair iCUE (Intel i5-14400F/ VGA RTX 5060)', 1, 34690000, 'pc-gvn-corsair-icue-intel-i5-14400f-vga-rtx5060', '2026-07-14 13:36:20.560568', '2026-07-14 13:36:20.560568'),
(37, 14, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 3, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:36:20.563173', '2026-07-14 13:36:20.563173'),
(38, 15, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:38:44.779600', '2026-07-14 13:38:44.779600'),
(39, 15, 4, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:38:44.780599', '2026-07-14 13:38:44.780599'),
(40, 16, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:40:49.653852', '2026-07-14 13:40:49.653852'),
(41, 16, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 1, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:40:49.659496', '2026-07-14 13:40:49.659496'),
(42, 17, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 1, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:41:01.592906', '2026-07-14 13:41:01.592906'),
(43, 18, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:41:20.178858', '2026-07-14 13:41:20.178858'),
(44, 18, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 2, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:41:20.180921', '2026-07-14 13:41:20.180921'),
(45, 19, 4, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:42:01.017992', '2026-07-14 13:42:01.017992'),
(46, 20, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 4, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:42:13.775738', '2026-07-14 13:42:13.775738'),
(47, 21, 4, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 2, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:42:28.793265', '2026-07-14 13:42:28.793265'),
(48, 22, 1, 'PC GVN x Corsair iCUE (Intel i5-14400F/ VGA RTX 5060)', 3, 34690000, 'pc-gvn-corsair-icue-intel-i5-14400f-vga-rtx5060', '2026-07-14 13:42:55.129765', '2026-07-14 13:42:55.129765'),
(49, 23, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 4, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:45:44.887439', '2026-07-14 13:45:44.887439'),
(50, 24, 4, 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 169990000, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:47:18.988334', '2026-07-14 13:47:18.988334'),
(51, 24, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 1, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:47:18.989340', '2026-07-14 13:47:18.989340'),
(52, 25, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 1, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:49:22.987358', '2026-07-14 13:49:22.987358'),
(53, 26, 2, 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 1, 196290000, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', '2026-07-14 13:51:19.851412', '2026-07-14 13:51:19.851412'),
(54, 27, 3, 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 1, 188880000, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', '2026-07-14 13:51:47.973289', '2026-07-14 13:51:47.973289');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderDate` datetime(6) DEFAULT NULL,
  `status` enum('CANCELLED','PENDING','SHIPPED','SUCCESS') COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  `userId` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderDate`, `status`, `totalAmount`, `userId`, `created_time`, `updated_time`) VALUES
(1, '2026-01-05 16:47:43.991982', 'SUCCESS', 327300000, 'guest_001', NULL, NULL),
(2, '2026-03-30 15:18:33.252208', 'PENDING', 1002870000, 'guest_001', NULL, NULL),
(3, '2026-03-30 16:11:55.143800', 'PENDING', 1303520000, 'guest_001', NULL, NULL),
(4, '2026-03-30 16:27:28.247152', 'PENDING', 188880000, 'guest_001', NULL, NULL),
(5, '2026-04-03 11:58:15.926294', 'PENDING', 339980000, 'USER_20260403_81759', NULL, NULL),
(6, '2026-04-03 12:01:48.263799', 'PENDING', 980290000, 'USER_20260403_6411F', NULL, NULL),
(7, '2026-04-03 17:17:53.456612', 'PENDING', 764750000, 'USER_20260403_6411F', '2026-04-03 17:17:53.457619', '2026-04-03 17:17:53.477371'),
(8, '2026-07-14 13:13:42.991809', 'PENDING', 400860000, 'USER_20260507_44033', '2026-07-14 13:13:42.993775', '2026-07-14 13:13:43.025872'),
(9, '2026-07-14 13:17:14.577994', 'PENDING', 733510000, 'USER_20260403_6411F', '2026-07-14 13:17:14.579231', '2026-07-14 13:17:14.590414'),
(10, '2026-07-14 13:29:09.832925', 'PENDING', 631950000, 'USER_20260507_44033', '2026-07-14 13:29:09.833425', '2026-07-14 13:29:09.843157'),
(11, '2026-07-14 13:31:36.921373', 'PENDING', 385170000, 'USER_20260403_6411F', '2026-07-14 13:31:36.921884', '2026-07-14 13:31:36.927271'),
(12, '2026-07-14 13:35:31.604365', 'PENDING', 188880000, 'USER_20260403_6411F', '2026-07-14 13:35:31.604365', '2026-07-14 13:35:31.608090'),
(13, '2026-07-14 13:35:51.964955', 'PENDING', 706260000, 'USER_20260403_6411F', '2026-07-14 13:35:51.965462', '2026-07-14 13:35:51.971171'),
(14, '2026-07-14 13:36:20.559563', 'PENDING', 601330000, 'USER_20260403_6411F', '2026-07-14 13:36:20.559563', '2026-07-14 13:36:20.565199'),
(15, '2026-07-14 13:38:44.776574', 'PENDING', 366280000, 'USER_20260507_44033', '2026-07-14 13:38:44.776574', '2026-07-14 13:38:44.783772'),
(16, '2026-07-14 13:40:49.646150', 'PENDING', 385170000, 'USER_20260507_44033', '2026-07-14 13:40:49.647886', '2026-07-14 13:40:49.664723'),
(17, '2026-07-14 13:41:01.589353', 'PENDING', 188880000, 'USER_20260507_44033', '2026-07-14 13:41:01.589858', '2026-07-14 13:41:01.595985'),
(18, '2026-07-14 13:41:20.176833', 'PENDING', 574050000, 'USER_20260403_6411F', '2026-07-14 13:41:20.177335', '2026-07-14 13:41:20.183199'),
(19, '2026-07-14 13:42:01.015472', 'PENDING', 169990000, 'USER_20260507_44033', '2026-07-14 13:42:01.015972', '2026-07-14 13:42:01.021204'),
(20, '2026-07-14 13:42:13.773732', 'PENDING', 785160000, 'USER_20260403_6411F', '2026-07-14 13:42:13.774237', '2026-07-14 13:42:13.778754'),
(21, '2026-07-14 13:42:28.790748', 'PENDING', 339980000, 'USER_20260507_44033', '2026-07-14 13:42:28.791256', '2026-07-14 13:42:28.795783'),
(22, '2026-07-14 13:42:55.127757', 'PENDING', 104070000, 'USER_20260507_44033', '2026-07-14 13:42:55.127757', '2026-07-14 13:42:55.132402'),
(23, '2026-07-14 13:45:44.884272', 'PENDING', 755520000, 'USER_20260507_44033', '2026-07-14 13:45:44.884272', '2026-07-14 13:45:44.889571'),
(24, '2026-07-14 13:47:18.985619', 'PENDING', 358870000, 'USER_20260507_44033', '2026-07-14 13:47:18.986118', '2026-07-14 13:47:18.992532'),
(25, '2026-07-14 13:49:22.985304', 'PENDING', 188880000, 'USER_20260507_44033', '2026-07-14 13:49:22.985807', '2026-07-14 13:49:22.990150'),
(26, '2026-07-14 13:51:19.848890', 'PENDING', 196290000, 'USER_20260507_44033', '2026-07-14 13:51:19.848890', '2026-07-14 13:51:19.854550'),
(27, '2026-07-14 13:51:47.970214', 'PENDING', 188880000, 'USER_20260507_44033', '2026-07-14 13:51:47.971245', '2026-07-14 13:51:47.976000');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  `longDescription` longtext COLLATE utf8mb4_vi_0900_as_cs,
  `image_folder_path` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `slug`, `deleted`, `description`, `imageUrl`, `name`, `price`, `created_time`, `updated_time`, `longDescription`, `image_folder_path`) VALUES
(1, 'pc-gvn-corsair-icue-intel-i5-14400f-vga-rtx5060', b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/post-01_124b26a798054613a82353313947f827_grande.jpg', 'PC GVN x Corsair iCUE (Intel i5-14400F/ VGA RTX 5060)', 34690000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090'),
(2, 'pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090', b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế', '/images/pc_khach_rtx_5090_msi-02261_03cddd72f4164a5d8a0b3b9d717715fc_grande.jpg', 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 196290000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090'),
(3, 'pc-gvn-int-x-asus-blackwell-intel-core-ultra-9-285kvga-rtx5090', b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/web__3_of_134__6d505eb467094a50bcf3a5b3a8edfe46_grande.jpg', 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 188880000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090'),
(4, 'pc-gvn-int-x-msi-dragon-ace-intel-core-ultra-9-285k-vga-rtx5090', b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/post-02_18ef7c4ccf6242b08693b1c6e8528567_grande.jpg', 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 169990000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090'),
(5, 'pc-gvn-intel-i5-12400f-vga-rtx3050', b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/PCGVN/pc-gvn-intel-i5-12400f-vga-rtx3050/grande/d_i_di_n_af47907dba164a95b13f999c94f82324_grande.jpg', 'PC GVN Intel i5-12400F/ VGA RTX 3050', 15690000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090'),
(6, 'pc-gvn-intel-i5-12400f-vga-rtx3060', b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/PCGVN/pc-gvn-intel-i5-12400f-vga-rtx3050/grande/d_i_di_n_af47907dba164a95b13f999c94f82324_grande.jpg', 'PC GVN Intel i5-12400F/ VGA RTX 3060', 19190000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090'),
(7, 'pc-gvn-intel-i7-14700f-vga-rtx5060', b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/pc_rtx_5060__2_of_84__ffd3259e58c044a1bffc75b70711b86f_grande.jpg', 'PC GVN Intel i7-14700F/ VGA RTX 5060', 32190000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090'),
(8, 'pc-gvn-intel-i9-14900k-vga-rtx5080', b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/post-09_737fb5c8e2394417a37d875e71fb1603_grande.jpg', 'PC GVN INTEL I9-14900K/VGA RTX 5080', 109990000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090'),
(9, 'pc-gvn-msi-project-zero-white-intel-i5-14400f-vga-rtx5060', b'0', 'Để có một dàn PC chuẩn chỉnh và có một thiết kế cực đẹp PC GVN x MSI PROJECT ZERO WHITE được ưu tiên lựa chọn những linh kiện máy tính tốt nhất trong tầm giá được cung cấp bởi MSI nên cho ra trải nghiệm ấn tượng. Ngoài ra, với sự đồng bộ trong linh kiện m', '/images/pc_khach_msi_project_zero-01358_ec44feb9588946b6b6f4c5278766285a_grande.jpg', 'PC GVN x MSI PROJECT ZERO WHITE (Intel i5-14400F/ VGA RTX 5060)', 36990000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090'),
(10, 'pc-gvn-x-asus-rog-hatsune-miku-edition-amd-ryzen7-9800x3d-vga-rtx5080', b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/pc_hatsune_miku_asus_rtx_5080_astral__2_of_119__24287ce5cc0c492aa9bd6fdb83be56f4_grande.png', 'PC GVN X ASUS ROG HATSUNE MIKU EDITION (AMD Ryzen 7 9800X3D/VGA RTX 5080)', 128490000, NULL, NULL, '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', 'images/PCGVN/pc-gvn-int-msi-dragon-godlike-intel-core-ultra-9-285k-vga-rtx5090');

-- --------------------------------------------------------

--
-- Table structure for table `productspecification`
--

DROP TABLE IF EXISTS `productspecification`;
CREATE TABLE IF NOT EXISTS `productspecification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `specKey` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `specValue` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgk904f1fgcf66pevmgp6saple` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `userId` varchar(255) COLLATE utf8mb4_vi_0900_as_cs NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `updated_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKkwds03ohobcd8p6eowkw0f5bm` (`phoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `fullName`, `password`, `phoneNumber`, `role`, `username`, `userId`, `created_time`, `updated_time`) VALUES
(1, NULL, NULL, '$2a$10$GfmzwHnfhs/czd66oi9apeb.2JdPauFknF.LkwtBGKuRz7TNrAfji', '01', 'ROLE_USER', '01', '1', NULL, NULL),
(2, NULL, NULL, '$2a$10$GfmzwHnfhs/czd66oi9apeb.2JdPauFknF.LkwtBGKuRz7TNrAfji', '02', 'ROLE_USER', '02', '2', NULL, NULL),
(3, NULL, NULL, '$2a$10$GfmzwHnfhs/czd66oi9apeb.2JdPauFknF.LkwtBGKuRz7TNrAfji', '0123', 'ROLE_USER', '0123', '3', NULL, NULL),
(4, NULL, NULL, '$2a$10$8tL4w7TEUf44guS.qZQgkum0Ak/k5ZVnfg81fvyac8xtFv5awhlgO', NULL, 'ROLE_USER', '0123123', 'USER_20260403_6411F', NULL, NULL),
(5, NULL, NULL, '$2a$10$vuepKiSnf.mx6pU0MEFzMODG5yH65cdv9KYWVyFzQGig5.7iaAfYS', NULL, 'ROLE_USER', '0121212', 'USER_20260403_81759', NULL, NULL),
(6, NULL, NULL, '$2a$10$tCz.FBiKt/8GshYl/m.JsO7hC1sQjGN.OtQ.lyXm50jgf/ODBVOtS', NULL, 'ROLE_USER', 'bmnbmn', 'USER_20260407_8DA53', '2026-04-07 21:54:02.932642', '2026-04-07 21:54:02.932642'),
(7, 'admin@example.com', 'System Administrator', '$2a$10$MHPJ2o5UEWKNCt39aWkVzuUIPc4bvirEvncA7.MBmcjFBsiw1Niqm', NULL, 'ROLE_ADMIN', 'admin', 'USER_20260507_44033', '2026-05-07 16:03:32.539632', '2026-05-07 16:03:32.605286'),
(8, 'user@example.com', 'Regular User', '$2a$10$zyvUs.7VaKGv/l2bZ5.c.OI918FuB2o1Ltfi5Oa.dEnmr5L/mPKm2', NULL, 'ROLE_USER', '0123456', 'USER_20260507_0C37E', '2026-05-07 16:38:18.505233', '2026-05-07 16:38:18.505233');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `FKfm2xpv0aksxnpoucoywb41f86` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `collection_product`
--
ALTER TABLE `collection_product`
  ADD CONSTRAINT `FK9bi3dl9lx2efv8nxlvd4c9437` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`),
  ADD CONSTRAINT `FKqmtvviudfrqwn5r6lpmi9sosr` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `FKl8avcrunmvqdcldoec2duhdiq` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `productspecification`
--
ALTER TABLE `productspecification`
  ADD CONSTRAINT `FKgk904f1fgcf66pevmgp6saple` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

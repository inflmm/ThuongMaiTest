-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 12, 2026 at 09:34 AM
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
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE IF NOT EXISTS `cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `productId` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `userId` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `cartitem`
--

INSERT INTO `cartitem` (`id`, `deleted`, `productId`, `quantity`, `userId`) VALUES
(1, b'1', 1, 5, 'guest_001'),
(2, b'1', 1, 8, 'guest_001'),
(3, b'1', 3, 2, 'guest_001'),
(4, b'1', 4, 1, 'guest_001'),
(5, b'0', 1, 2, 'guest_001'),
(6, b'0', 3, 3, 'guest_001'),
(7, b'0', 5, 2, 'guest_001'),
(8, b'0', 10, 1, 'guest_001'),
(9, b'0', 9, 1, 'guest_001'),
(10, b'0', 4, 1, 'guest_001');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `orderId`, `productId`, `productName`, `quantity`, `unitPrice`) VALUES
(1, 1, 1, 'PC GVN x MSI PROJECT ZERO WHITE (Intel i5-14400F/ VGA RTX 5060)', 8, 36990000),
(2, 1, 3, 'PC GVN Intel i5-12400F/ VGA RTX 3050', 2, 15690000);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderDate`, `status`, `totalAmount`, `userId`) VALUES
(1, '2026-01-05 16:47:43.991982', 'SUCCESS', 327300000, 'guest_001');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_vi_0900_as_cs DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_as_cs;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `deleted`, `description`, `imageUrl`, `name`, `price`) VALUES
(1, b'0', 'Để có một dàn PC chuẩn chỉnh và có một thiết kế cực đẹp PC GVN x MSI PROJECT ZERO WHITE được ưu tiên lựa chọn những linh kiện máy tính tốt nhất trong tầm giá được cung cấp bởi MSI nên cho ra trải nghiệm ấn tượng. Ngoài ra, với sự đồng bộ trong linh kiện m', '/images/pc_khach_msi_project_zero-01358_ec44feb9588946b6b6f4c5278766285a_grande.jpg', 'PC GVN x MSI PROJECT ZERO WHITE (Intel i5-14400F/ VGA RTX 5060)', 36990000),
(2, b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/d_i_di_n_af47907dba164a95b13f999c94f82324_grande.jpg', 'PC GVN Intel i5-12400F/ VGA RTX 3060', 19190000),
(3, b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/d_i_di_n_af47907dba164a95b13f999c94f82324_grande.jpg', 'PC GVN Intel i5-12400F/ VGA RTX 3050', 15690000),
(4, b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/post-01_124b26a798054613a82353313947f827_grande.jpg', 'PC GVN x Corsair iCUE (Intel i5-14400F/ VGA RTX 5060)', 34690000),
(5, b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/pc_rtx_5060__2_of_84__ffd3259e58c044a1bffc75b70711b86f_grande.jpg', 'PC GVN Intel i7-14700F/ VGA RTX 5060', 32190000),
(6, b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/post-02_18ef7c4ccf6242b08693b1c6e8528567_grande.jpg', 'PC GVN INT x MSI Dragon ACE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 169990000),
(7, b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế', '/images/pc_khach_rtx_5090_msi-02261_03cddd72f4164a5d8a0b3b9d717715fc_grande.jpg', 'PC GVN INT x MSI Dragon GODLIKE (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by MSI)', 196290000),
(8, b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/web__3_of_134__6d505eb467094a50bcf3a5b3a8edfe46_grande.jpg', 'PC GVN INT x ASUS Blackwell (Intel Core Ultra 9 285K/ VGA RTX 5090) (Powered by ASUS)', 188880000),
(9, b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/pc_hatsune_miku_asus_rtx_5080_astral__2_of_119__24287ce5cc0c492aa9bd6fdb83be56f4_grande.png', 'PC GVN X ASUS ROG HATSUNE MIKU EDITION (AMD Ryzen 7 9800X3D/VGA RTX 5080)', 128490000),
(10, b'0', '*Hình ảnh minh hoạ có thể khác với cấu hình thực tế ', '/images/post-09_737fb5c8e2394417a37d875e71fb1603_grande.jpg', 'PC GVN INTEL I9-14900K/VGA RTX 5080', 109990000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 10, 2014 at 09:02 AM
-- Server version: 5.1.73
-- PHP Version: 5.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scriptphp87_bittrex`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE IF NOT EXISTS `balance` (
`id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`id`, `user_id`, `amount`, `wallet_id`) VALUES
(1, 6, 1994.3509609247, 1),
(2, 6, 2000, 2),
(3, 6, 0.004, 23),
(4, 6, 820.172201, 24),
(7, 11, 259.78373353, 24),
(8, 11, 95.3439805334, 1),
(9, 42, 351, 8),
(10, 11, 100, 8),
(11, 42, 0.01383039375, 1),
(12, 42, 1940, 20),
(13, 11, 45, 20),
(14, 42, 1.40026469, 24),
(15, 42, 0, 19),
(16, 42, 2.9, 22),
(17, 42, 2, 11),
(18, 42, 2.9, 13),
(19, 42, 0.9, 21),
(20, 6, 100.1, 20),
(21, 6, 541.1, 8),
(22, 42, 499.9, 10),
(23, 6, 200.8, 10),
(24, 6, 0.01, 16),
(25, 11, 5, 9),
(26, 42, 3.96, 16),
(27, 42, 1.9, 15),
(30, 42, 1, 14),
(31, 11, 2.5, 11),
(32, 42, 0.99, 17),
(33, 6, 991.5, 11),
(34, 11, 0.99, 14),
(35, 11, 1.9, 19),
(36, 42, 0.15, 18),
(37, 6, 6.4, 18),
(38, 6, 4.7063653474, 25),
(39, 9, 8.85e-09, 25),
(40, 11, 12.061633792, 25),
(41, 42, 2.15e-07, 25),
(42, 11, 2, 21);

-- --------------------------------------------------------

--
-- Table structure for table `coin_votes`
--

CREATE TABLE IF NOT EXISTS `coin_votes` (
`id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `btc_address` varchar(255) NOT NULL,
  `label_address` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `coin_votes`
--

INSERT INTO `coin_votes` (`id`, `code`, `name`, `btc_address`, `label_address`) VALUES
(1, 'FAC', 'Faircoin', '1KBU9ewFehSzXrA3SRH5qbVLTGiW8b6wwy', ''),
(2, 'IXC', 'iXcoin', '1DzLHKtVdFZo5vdwzpSCc64HB1nRiz16dK', ''),
(3, 'CAGE', 'Cage Coin', '1B4QzvDeznfcx4pJLeQCFGcHEBzm5wFpKj', ''),
(4, 'MRO', 'Monero Coin', '1BT2Kvvi6ZQjNh4rGLx8eASbwypSJJroff', '');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE IF NOT EXISTS `deposits` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL,
  `transaction_id` text,
  `amount` double DEFAULT NULL,
  `paid` int(4) DEFAULT NULL,
  `confirmations` int(11) DEFAULT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=505 ;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `wallet_id`, `transaction_id`, `amount`, `paid`, `confirmations`, `address`, `created_at`, `updated_at`) VALUES
(1, 6, 23, 'eae8ac706d39579aa1f962404f564079cfaf786eaeae2b4ed15174e02e891652', 0.001, 1, 1, 'mivLYTQ22aqsxGzAiNCzjpyfBhw8gMmtPz', '2014-05-01 11:42:00', '0000-00-00 00:00:00'),
(2, 6, 23, 'db7567c64895127da695ee0737a21e95ada19c0eb436827efeb13f1f9c7a1749', 0.001, 1, 1, 'mivLYTQ22aqsxGzAiNCzjpyfBhw8gMmtPz', '2014-05-01 11:42:58', '2014-05-01 11:46:41'),
(4, 6, 23, '381f96a82a3f0f62edf30d76388b51fe2f97dbc4d3292379f51ca5a81eef81bb', 0.001, 1, 1, 'mxm39cRZtMETpkkxPNSDdqud9Z7LiQvFm5', '2014-05-06 12:06:12', '2014-05-06 12:08:03'),
(5, 6, 23, '0a17ef050e7d58876f2024b7e7b2de02342856d0501d20a67290204ef83eb487', 0.001, 1, 1, 'mpJDTu3irmR2XQhaxvs8FRS8PYCC4PtRnL', '2014-05-06 12:08:22', '2014-05-06 12:14:54'),
(6, 6, 23, '43c66e76ce5431e8b47912132b82c5205eebeaa0f9da2581794725904574be8f', 0.001, 1, 1, 'mzPoHw6fV1Ky7YEPvUWDjx93urgJYFCTEL', '2014-05-06 12:12:50', '2014-05-06 12:14:54'),
(7, 6, 23, '6087de1364b9f070dd179e2b9f22105c407d280e7f2222fb56c51738862e6eee', 0.001, 1, 1, 'n4dzMUNcksKQmqYf7xPTG74CJaG668BYSn', '2014-05-14 03:39:31', '2014-05-14 03:46:32'),
(8, 42, 8, '26edf40627622d77d071890a1c155de544fca0a9701160ac0fe2d464ca8b5268', 499, 1, 22552, 'DR8HzkQP92yjS4AcnYRUu9qH6DKgc1bdd3', '2014-05-18 03:54:08', '2014-06-05 03:03:44'),
(9, 42, 19, 'd2fedc8edd8059de02803f960eed54b6466df04bd29ea9a2f5422dcf0bba3502', 1.9, 1, 50026, 'mKoMGqRxdvCzPi1WnfRepw7JnjuVnSSMG4', '2014-05-18 15:04:20', '2014-06-05 03:03:52'),
(10, 42, 22, 'c6b4d15da0ce5551b195cecbc76fe946b2ce9990b1b956e5c7204a04357187e1', 2.9, 1, 33236, 'EJwUdLDjsyLuDB12sLUca6PF41CA6ZXt2x', '2014-05-18 15:12:04', '2014-06-05 03:03:25'),
(11, 42, 11, '7a4801bec2fa37c2da54adcf5812a7a4c30ba51fde70997605836a46e420b159', 1.5, 1, 17935, 'BA1KXHZYJKXjjp7sN35jGYdXxh6ryibbTo', '2014-05-18 16:02:07', '2014-05-27 01:18:32'),
(12, 42, 13, '965b4b94899e484d8b4995415c0250a2b40d6e04b3c8c33db826a2bed59691d5', 2.9, 1, 10946, '6qKS2Z1xepHozgGrsXMwqdzXnSPYJmzfPx', '2014-05-18 16:04:10', '2014-05-27 02:06:47'),
(13, 42, 21, 'c4fa64b6179e4c26ef74ae6aaa198006475f86c886680c5beef0f78d96475f55', 2.9, 1, 50951, 'QVQjtYpAHByGPbDvQk2s8KR2YzKhFR1MC4', '2014-05-18 16:38:19', '2014-06-05 03:03:45'),
(14, 42, 20, '0e0beb8bfb10f7d8207b217ecd5d50a11b3f3f33580fb71282a8acac4a3653d9', 499, 1, 50209, 'iAzC1rT6nVwANvw2Lg75fn85vVjf584haY', '2014-05-19 01:40:40', '2014-06-05 03:02:32'),
(18, 6, 20, 'e56f47046c51c2a79c06b32578b82625b57727c2c5a00c3d876ed125476ccc74', 100, 1, 45255, 'iGyLeNxQhu3Da4GYD76r7KCtkcfrtKcL3Q', '2014-05-20 09:19:43', '2014-06-05 03:02:32'),
(19, 6, 1, '782535fae845e3e9efb05307254b51bc9fe59c4ce3b7b666db02e47c77dd6a22', 0.0001, 1, 2587, '1PGw11DiZ96wmLRxu9DMTrcrpvXRsQ7Adv', '2014-05-20 09:22:00', '2014-06-05 02:37:17'),
(20, 6, 8, '3efb1415081d0aa6c2aafc1aa048787e565adf91aa044c60a9204260f54492b6', 0.1, 1, 19705, 'DBu3w9UJ8t5SyoDaDANX2dfpW2P1ipbxAu', '2014-05-20 09:37:49', '2014-06-05 03:03:44'),
(21, 6, 1, 'dc78ffd93cad9093f8dda81ab7f3a9e82eb4122c6d2297404bb1ef65de37708e', 0.0001, 1, 2632, '1E25uLzqAHCurh4ZHJagLKQayqsaFyPz8X', '2014-05-21 03:16:01', '2014-06-05 02:37:17'),
(22, 42, 10, 'ea57260dca36b3660bbcf53659971cf4f8d0366ccbb67e6d8b36a2ea28749844', 499.9, 1, 17992, 'RGenNsKguoE15qHd3WJD2LHPS3cpNJTb2o', '2014-05-21 03:20:09', '2014-05-27 02:06:56'),
(23, 6, 10, '8e6abb2b0504ad92e5818898bb84750f708ce59171af8a78e38bb723888ffeea', 199.9, 1, 17125, 'REzyaeFNKy3jNgbxT27xdEkA91SkVt95tC', '2014-05-21 03:20:09', '2014-05-27 02:06:56'),
(24, 6, 16, 'c856d26ef33535d4274248ca307933515df019b7f63a1e2149ca6bcedc39bc2d', 0.01, 1, 3658, 'P8vXYVDBKwa3tH7pjduRTymXCFpqPd1fcp', '2014-05-21 03:26:24', '2014-06-05 03:03:08'),
(25, 42, 20, '7b8871f67c32211238dd335eb4f742286b88012672d40d18e64b1bff739fa464', 999, 1, 51700, 'iAzC1rT6nVwANvw2Lg75fn85vVjf584haY', '2014-05-21 03:33:24', '2014-06-05 03:02:31'),
(26, 11, 9, 'c18e4829ac2fa3febbf88c6d5c081b36475f1b1de89df980d41384cd0dc15f97', 5, 1, 15940, 'oKwmLSh53iwk5xGs21nbvd2jGBB2YAfaPB', '2014-05-21 03:33:27', '2014-05-27 02:05:18'),
(27, 6, 20, '638166f57cd2c914849df78d917e13d06e14269b31c10f1f0857585f1767a7c4', 0.1, 1, 46112, 'iGyLeNxQhu3Da4GYD76r7KCtkcfrtKcL3Q', '2014-05-21 03:33:34', '2014-06-05 03:02:32'),
(28, 6, 10, '55ac21c6fcf0af6ad33ed339b4c395ecd6c6b1ba2e3b396b36966e3cb4f9ae5f', 0.9, 1, 14941, 'REzyaeFNKy3jNgbxT27xdEkA91SkVt95tC', '2014-05-21 04:19:05', '2014-05-27 02:06:56'),
(29, 42, 16, '139be35a6f3f15bdbe6c64de5514b45afeaa3cd9184b2bce8e79473c3d37c675', 1.98, 1, 2085, 'PFSg6JjHvfQpHC5TdxP4YJMRTi8vgdTBv1', '2014-05-23 09:18:22', '2014-06-05 03:03:08'),
(30, 42, 16, '139be35a6f3f15bdbe6c64de5514b45afeaa3cd9184b2bce8e79473c3d37c675', 1.98, 1, 36, 'PFSg6JjHvfQpHC5TdxP4YJMRTi8vgdTBv1', '2014-05-23 09:18:22', '2014-05-23 09:18:22'),
(31, 42, 15, 'a63b32fabf25d4f7127f68eb599dcf224b53f6e8644b3c778677853041b0a099', 1.9, 1, 7387, 'Vn5FYduzPrzuKYzVCWYN9BR79YC8aN2vcM', '2014-05-23 10:11:38', '2014-06-05 02:56:45'),
(36, 42, 14, '246933efc11d0c6bac1a8bc92a898f4d3c74e3a298d6b30c30722657c0d54d82', 1.99, 1, 18940, 'AUnr3m2UQMHArbb7RBn1Sk2wa98imre7kg', '2014-05-24 04:51:57', '2014-06-05 03:03:18'),
(37, 6, 1, '5e767728fe9ab2ff7ee97b2b020520a9caeb1b003e03433430020d6e68e18a93', 0.0001, 1, 1634, '18XQRuGexBLccDh71Zkx2mGGG3HSgwWWZ3', '2014-05-26 03:42:07', '2014-06-05 02:37:17'),
(38, 6, 24, '3d34ddf4cb5981d2b3a13f467cf4fc2a209b48fd5f6178a251a469398ad362f7', 0.001, 1, 6152, 'LStjEQQttqSrSiQCaf1n3GeLB8zSc2wB5b', '2014-05-26 03:53:38', '2014-06-05 03:03:32'),
(39, 42, 17, '81f20611498712af8cc39887bf2c973f6e30617e5e768f8cf3a0fb461f936fae', 0.99, 1, 456, 'Xe7cChwW15TZ2Scbb8qdj26SUZU2mZbyJ8', '2014-05-26 04:07:24', '2014-05-27 02:04:53'),
(40, 6, 8, 'a58ae074123259f50683bba8014a675b75c579a52995b50dd122636208c33b5c', 546, 1, 12217, 'D7GsF8kJJuQEVAriVMupK6xRNxHqq4DyZF', '2014-05-26 09:01:24', '2014-06-05 03:03:44'),
(41, 42, 18, '275e7bdc06336852bf8f78c399eeae53748970437b38aaa68db48ff7765a8abf', 2.85, 1, 34984, 'WUwHkoKzhSqbXFKkoGaqN9oJo5CKHVMUXX', '2014-05-28 19:57:59', '2014-06-05 03:03:12'),
(42, 42, 18, '412ed213d81fe3b666bbb7dd7a288a7ca0b663942eeab5dce129c04942564d19', 1.85, 1, 27748, 'WUwHkoKzhSqbXFKkoGaqN9oJo5CKHVMUXX', '2014-05-28 19:57:59', '2014-06-05 03:03:12'),
(43, 42, 18, '22f0dc81dea39d552984271e318b9c7f99f9c81f6ac4720ab1ea9881e17aced5', 1.85, 1, 20390, 'WUwHkoKzhSqbXFKkoGaqN9oJo5CKHVMUXX', '2014-05-28 19:58:00', '2014-06-05 03:03:13'),
(46, 6, 25, 'Points earned from trade 212', 5e-11, 1, NULL, NULL, '2014-06-02 03:44:02', '2014-06-02 03:44:02'),
(47, 6, 25, 'Points earned from trade 212', 5e-11, 1, NULL, NULL, '2014-06-02 03:44:02', '2014-06-02 03:44:02'),
(48, 6, 25, 'Points earned from trade 213', 5e-11, 1, NULL, NULL, '2014-06-02 04:01:39', '2014-06-02 04:01:39'),
(49, 9, 25, 'Points earned from User thuythuy( Trade: 213)', 1.25e-11, 1, NULL, NULL, '2014-06-02 04:01:40', '2014-06-02 04:01:40'),
(50, 6, 25, 'Points earned from trade 213', 5e-11, 1, NULL, NULL, '2014-06-02 04:01:40', '2014-06-02 04:01:40'),
(51, 9, 25, 'Points earned from User thuythuy( Trade: 213)', 1.25e-11, 1, NULL, NULL, '2014-06-02 04:01:40', '2014-06-02 04:01:40'),
(52, 42, 25, 'Points earned from trade 214', 0, 1, NULL, NULL, '2014-06-02 18:57:53', '2014-06-02 18:57:53'),
(53, 42, 25, 'Points earned from trade 214', 0, 1, NULL, NULL, '2014-06-02 18:57:54', '2014-06-02 18:57:54'),
(54, 11, 25, 'Points earned from trade 215', 0, 1, NULL, NULL, '2014-06-02 18:58:15', '2014-06-02 18:58:15'),
(55, 42, 25, 'Points earned from trade 215', 0, 1, NULL, NULL, '2014-06-02 18:58:16', '2014-06-02 18:58:16'),
(56, 42, 25, 'Points earned from trade 216', 1e-07, 1, NULL, NULL, '2014-06-03 03:28:24', '2014-06-03 03:28:24'),
(57, 42, 25, 'Points earned from trade 216', 1e-07, 1, NULL, NULL, '2014-06-03 03:28:24', '2014-06-03 03:28:24'),
(58, 42, 25, 'Points earned from trade 217', 0, 1, NULL, NULL, '2014-06-03 22:39:21', '2014-06-03 22:39:21'),
(59, 42, 25, 'Points earned from trade 217', 0, 1, NULL, NULL, '2014-06-03 22:39:21', '2014-06-03 22:39:21'),
(60, 42, 25, 'Points earned from trade 218', 0, 1, NULL, NULL, '2014-06-03 22:40:19', '2014-06-03 22:40:19'),
(61, 42, 25, 'Points earned from trade 218', 0, 1, NULL, NULL, '2014-06-03 22:40:19', '2014-06-03 22:40:19'),
(62, 42, 25, 'Points earned from trade 219', 0, 1, NULL, NULL, '2014-06-03 22:42:20', '2014-06-03 22:42:20'),
(63, 42, 25, 'Points earned from trade 219', 0, 1, NULL, NULL, '2014-06-03 22:42:20', '2014-06-03 22:42:20'),
(64, 42, 25, 'Points earned from trade 220', 0, 1, NULL, NULL, '2014-06-03 22:43:07', '2014-06-03 22:43:07'),
(65, 42, 25, 'Points earned from trade 220', 0, 1, NULL, NULL, '2014-06-03 22:43:07', '2014-06-03 22:43:07'),
(66, 42, 25, 'Points earned from trade 221', 0, 1, NULL, NULL, '2014-06-03 22:46:26', '2014-06-03 22:46:26'),
(67, 42, 25, 'Points earned from trade 221', 0, 1, NULL, NULL, '2014-06-03 22:46:26', '2014-06-03 22:46:26'),
(68, 42, 25, 'Points earned from trade 222', 0, 1, NULL, NULL, '2014-06-03 22:47:21', '2014-06-03 22:47:21'),
(69, 42, 25, 'Points earned from trade 222', 0, 1, NULL, NULL, '2014-06-03 22:47:21', '2014-06-03 22:47:21'),
(70, 42, 25, 'Points earned from trade 223', 0, 1, NULL, NULL, '2014-06-03 22:48:24', '2014-06-03 22:48:24'),
(71, 42, 25, 'Points earned from trade 223', 0, 1, NULL, NULL, '2014-06-03 22:48:24', '2014-06-03 22:48:24'),
(72, 42, 25, 'Points earned from trade 224', 0, 1, NULL, NULL, '2014-06-03 22:50:43', '2014-06-03 22:50:43'),
(73, 42, 25, 'Points earned from trade 224', 0, 1, NULL, NULL, '2014-06-03 22:50:43', '2014-06-03 22:50:43'),
(74, 42, 25, 'Points earned from trade 225', 0, 1, NULL, NULL, '2014-06-03 22:52:58', '2014-06-03 22:52:58'),
(75, 42, 25, 'Points earned from trade 225', 0, 1, NULL, NULL, '2014-06-03 22:52:58', '2014-06-03 22:52:58'),
(76, 11, 25, 'Points earned from trade 226', 0, 1, NULL, NULL, '2014-06-03 22:55:31', '2014-06-03 22:55:31'),
(77, 42, 25, 'Points earned from trade 226', 0, 1, NULL, NULL, '2014-06-03 22:55:31', '2014-06-03 22:55:31'),
(78, 42, 25, 'Points earned from trade 227', 0, 1, NULL, NULL, '2014-06-05 13:30:27', '2014-06-05 13:30:27'),
(79, 42, 25, 'Points earned from trade 227', 0, 1, NULL, NULL, '2014-06-05 13:30:27', '2014-06-05 13:30:27'),
(80, 42, 25, 'Points earned from trade 228', 5e-09, 1, NULL, NULL, '2014-06-05 13:32:22', '2014-06-05 13:32:22'),
(81, 42, 25, 'Points earned from trade 228', 5e-09, 1, NULL, NULL, '2014-06-05 13:32:22', '2014-06-05 13:32:22'),
(82, 11, 25, 'Points earned from trade 229', 0, 1, NULL, NULL, '2014-06-05 19:08:17', '2014-06-05 19:08:17'),
(83, 42, 25, 'Points earned from trade 229', 0, 1, NULL, NULL, '2014-06-05 19:08:17', '2014-06-05 19:08:17'),
(84, 42, 25, 'Points earned from trade 230', 0, 1, NULL, NULL, '2014-06-05 19:10:34', '2014-06-05 19:10:34'),
(85, 42, 25, 'Points earned from trade 230', 0, 1, NULL, NULL, '2014-06-05 19:10:39', '2014-06-05 19:10:39'),
(86, 42, 25, 'Points earned from trade 231', 0, 1, NULL, NULL, '2014-06-05 19:22:03', '2014-06-05 19:22:03'),
(87, 42, 25, 'Points earned from trade 231', 0, 1, NULL, NULL, '2014-06-05 19:22:03', '2014-06-05 19:22:03'),
(88, 42, 25, 'Points earned from trade 232', 0, 1, NULL, NULL, '2014-06-05 19:24:52', '2014-06-05 19:24:52'),
(89, 42, 25, 'Points earned from trade 232', 0, 1, NULL, NULL, '2014-06-05 19:24:52', '2014-06-05 19:24:52'),
(90, 42, 25, 'Points earned from trade 233', 0, 1, NULL, NULL, '2014-06-05 19:29:22', '2014-06-05 19:29:22'),
(91, 42, 25, 'Points earned from trade 233', 0, 1, NULL, NULL, '2014-06-05 19:29:22', '2014-06-05 19:29:22'),
(92, 42, 25, 'Points earned from trade 234', 5e-09, 1, NULL, NULL, '2014-06-06 04:03:09', '2014-06-06 04:03:09'),
(93, 6, 25, 'Points earned from trade 234', 5e-09, 1, NULL, NULL, '2014-06-06 04:03:09', '2014-06-06 04:03:09'),
(94, 9, 25, 'Points earned from User thuythuy( Trade: 234)', 1.25e-09, 1, NULL, NULL, '2014-06-06 04:03:09', '2014-06-06 04:03:09'),
(95, 6, 25, 'Points earned from trade 235', 5e-09, 1, NULL, NULL, '2014-06-06 04:03:10', '2014-06-06 04:03:10'),
(96, 9, 25, 'Points earned from User thuythuy( Trade: 235)', 1.25e-09, 1, NULL, NULL, '2014-06-06 04:03:10', '2014-06-06 04:03:10'),
(97, 6, 25, 'Points earned from trade 235', 5e-09, 1, NULL, NULL, '2014-06-06 04:03:10', '2014-06-06 04:03:10'),
(98, 9, 25, 'Points earned from User thuythuy( Trade: 235)', 1.25e-09, 1, NULL, NULL, '2014-06-06 04:03:10', '2014-06-06 04:03:10'),
(99, 6, 25, 'Points earned from trade 236', 1e-08, 1, NULL, NULL, '2014-06-06 07:41:07', '2014-06-06 07:41:07'),
(100, 9, 25, 'Points earned from User thuythuy( Trade: 236)', 2.5e-09, 1, NULL, NULL, '2014-06-06 07:41:08', '2014-06-06 07:41:08'),
(101, 6, 25, 'Points earned from trade 236', 1e-08, 1, NULL, NULL, '2014-06-06 07:41:08', '2014-06-06 07:41:08'),
(102, 9, 25, 'Points earned from User thuythuy( Trade: 236)', 2.5e-09, 1, NULL, NULL, '2014-06-06 07:41:08', '2014-06-06 07:41:08'),
(103, 42, 25, 'Points earned from trade 237', 0, 1, NULL, NULL, '2014-06-06 17:21:40', '2014-06-06 17:21:40'),
(104, 42, 25, 'Points earned from trade 237', 0, 1, NULL, NULL, '2014-06-06 17:21:40', '2014-06-06 17:21:40'),
(105, 42, 25, 'Points earned from trade 238', 0, 1, NULL, NULL, '2014-06-06 17:22:11', '2014-06-06 17:22:11'),
(106, 42, 25, 'Points earned from trade 238', 0, 1, NULL, NULL, '2014-06-06 17:22:11', '2014-06-06 17:22:11'),
(107, 42, 25, 'Points earned from trade 239', 0, 1, NULL, NULL, '2014-06-06 17:22:12', '2014-06-06 17:22:12'),
(108, 42, 25, 'Points earned from trade 239', 0, 1, NULL, NULL, '2014-06-06 17:22:12', '2014-06-06 17:22:12'),
(109, 42, 25, 'Points earned from trade 240', 0, 1, NULL, NULL, '2014-06-06 17:23:08', '2014-06-06 17:23:08'),
(110, 42, 25, 'Points earned from trade 240', 0, 1, NULL, NULL, '2014-06-06 17:23:08', '2014-06-06 17:23:08'),
(111, 42, 25, 'Points earned from trade 241', 0, 1, NULL, NULL, '2014-06-06 17:39:45', '2014-06-06 17:39:45'),
(112, 42, 25, 'Points earned from trade 241', 0, 1, NULL, NULL, '2014-06-06 17:39:45', '2014-06-06 17:39:45'),
(113, 42, 25, 'Points earned from trade 242', 0, 1, NULL, NULL, '2014-06-06 17:42:07', '2014-06-06 17:42:07'),
(114, 42, 25, 'Points earned from trade 242', 0, 1, NULL, NULL, '2014-06-06 17:42:07', '2014-06-06 17:42:07'),
(115, 6, 25, 'Points earned from trade 243', 0, 1, NULL, NULL, '2014-06-06 17:48:06', '2014-06-06 17:48:06'),
(116, 9, 25, 'Points earned from User thuythuy( Trade: 243)', 0, 1, NULL, NULL, '2014-06-06 17:48:06', '2014-06-06 17:48:06'),
(117, 42, 25, 'Points earned from trade 243', 0, 1, NULL, NULL, '2014-06-06 17:48:06', '2014-06-06 17:48:06'),
(118, 42, 25, 'Points earned from trade 244', 0, 1, NULL, NULL, '2014-06-06 17:52:58', '2014-06-06 17:52:58'),
(119, 42, 25, 'Points earned from trade 244', 0, 1, NULL, NULL, '2014-06-06 17:52:58', '2014-06-06 17:52:58'),
(120, 42, 25, 'Points earned from trade 245', 0, 1, NULL, NULL, '2014-06-06 17:57:06', '2014-06-06 17:57:06'),
(121, 42, 25, 'Points earned from trade 245', 0, 1, NULL, NULL, '2014-06-06 17:57:06', '2014-06-06 17:57:06'),
(122, 42, 25, 'Points earned from trade 246', 0, 1, NULL, NULL, '2014-06-06 18:01:46', '2014-06-06 18:01:46'),
(123, 42, 25, 'Points earned from trade 246', 0, 1, NULL, NULL, '2014-06-06 18:01:47', '2014-06-06 18:01:47'),
(124, 42, 25, 'Points earned from trade 247', 0, 1, NULL, NULL, '2014-06-06 18:47:35', '2014-06-06 18:47:35'),
(125, 42, 25, 'Points earned from trade 247', 0, 1, NULL, NULL, '2014-06-06 18:47:35', '2014-06-06 18:47:35'),
(126, 42, 25, 'Points earned from trade 248', 0, 1, NULL, NULL, '2014-06-06 18:48:39', '2014-06-06 18:48:39'),
(127, 42, 25, 'Points earned from trade 248', 0, 1, NULL, NULL, '2014-06-06 18:48:40', '2014-06-06 18:48:40'),
(128, 42, 25, 'Points earned from trade 249', 0, 1, NULL, NULL, '2014-06-07 09:03:14', '2014-06-07 09:03:14'),
(129, 42, 25, 'Points earned from trade 249', 0, 1, NULL, NULL, '2014-06-07 09:03:14', '2014-06-07 09:03:14'),
(130, 42, 25, 'Points earned from trade 250', 0, 1, NULL, NULL, '2014-06-07 09:03:15', '2014-06-07 09:03:15'),
(131, 42, 25, 'Points earned from trade 250', 0, 1, NULL, NULL, '2014-06-07 09:03:15', '2014-06-07 09:03:15'),
(132, 42, 25, 'Points earned from trade 251', 0, 1, NULL, NULL, '2014-06-07 17:56:23', '2014-06-07 17:56:23'),
(133, 42, 25, 'Points earned from trade 251', 0, 1, NULL, NULL, '2014-06-07 17:56:23', '2014-06-07 17:56:23'),
(134, 42, 25, 'Points earned from trade 252', 0, 1, NULL, NULL, '2014-06-07 17:59:55', '2014-06-07 17:59:55'),
(135, 42, 25, 'Points earned from trade 252', 0, 1, NULL, NULL, '2014-06-07 17:59:55', '2014-06-07 17:59:55'),
(136, 42, 25, 'Points earned from trade 253', 0, 1, NULL, NULL, '2014-06-07 18:09:09', '2014-06-07 18:09:09'),
(137, 42, 25, 'Points earned from trade 253', 0, 1, NULL, NULL, '2014-06-07 18:09:09', '2014-06-07 18:09:09'),
(138, 42, 25, 'Points earned from trade 254', 0, 1, NULL, NULL, '2014-06-07 18:10:33', '2014-06-07 18:10:33'),
(139, 42, 25, 'Points earned from trade 254', 0, 1, NULL, NULL, '2014-06-07 18:10:33', '2014-06-07 18:10:33'),
(140, 42, 25, 'Points earned from trade 255', 0, 1, NULL, NULL, '2014-06-07 18:12:05', '2014-06-07 18:12:05'),
(141, 42, 25, 'Points earned from trade 255', 0, 1, NULL, NULL, '2014-06-07 18:12:05', '2014-06-07 18:12:05'),
(142, 42, 25, 'Points earned from trade 256', 0, 1, NULL, NULL, '2014-06-07 18:25:40', '2014-06-07 18:25:40'),
(143, 42, 25, 'Points earned from trade 256', 0, 1, NULL, NULL, '2014-06-07 18:25:40', '2014-06-07 18:25:40'),
(144, 42, 25, 'Points earned from trade 257', 0, 1, NULL, NULL, '2014-06-09 12:50:29', '2014-06-09 12:50:29'),
(145, 42, 25, 'Points earned from trade 257', 0, 1, NULL, NULL, '2014-06-09 12:50:29', '2014-06-09 12:50:29'),
(146, 42, 25, 'Points earned from trade 258', 0, 1, NULL, NULL, '2014-06-09 13:41:16', '2014-06-09 13:41:16'),
(147, 42, 25, 'Points earned from trade 258', 0, 1, NULL, NULL, '2014-06-09 13:41:16', '2014-06-09 13:41:16'),
(148, 42, 25, 'Points earned from trade 259', 0, 1, NULL, NULL, '2014-06-09 13:42:08', '2014-06-09 13:42:08'),
(149, 42, 25, 'Points earned from trade 259', 0, 1, NULL, NULL, '2014-06-09 13:42:08', '2014-06-09 13:42:08'),
(150, 42, 25, 'Points earned from trade 260', 0, 1, NULL, NULL, '2014-06-09 13:43:18', '2014-06-09 13:43:18'),
(151, 42, 25, 'Points earned from trade 260', 0, 1, NULL, NULL, '2014-06-09 13:43:18', '2014-06-09 13:43:18'),
(152, 11, 25, 'Points earned from trade 261', 0, 1, NULL, NULL, '2014-06-09 13:44:22', '2014-06-09 13:44:22'),
(153, 42, 25, 'Points earned from trade 261', 0, 1, NULL, NULL, '2014-06-09 13:44:22', '2014-06-09 13:44:22'),
(154, 11, 25, 'Points earned from trade 262', 0, 1, NULL, NULL, '2014-06-09 13:45:44', '2014-06-09 13:45:44'),
(155, 42, 25, 'Points earned from trade 262', 0, 1, NULL, NULL, '2014-06-09 13:45:44', '2014-06-09 13:45:44'),
(156, 42, 25, 'Points earned from trade 263', 0, 1, NULL, NULL, '2014-06-10 23:27:29', '2014-06-10 23:27:29'),
(157, 42, 25, 'Points earned from trade 263', 0, 1, NULL, NULL, '2014-06-10 23:27:29', '2014-06-10 23:27:29'),
(158, 42, 25, 'Points earned from trade 264', 0, 1, NULL, NULL, '2014-06-10 23:28:19', '2014-06-10 23:28:19'),
(159, 42, 25, 'Points earned from trade 264', 0, 1, NULL, NULL, '2014-06-10 23:28:19', '2014-06-10 23:28:19'),
(160, 42, 25, 'Points earned from trade 265', 0, 1, NULL, NULL, '2014-06-10 23:29:49', '2014-06-10 23:29:49'),
(161, 42, 25, 'Points earned from trade 265', 0, 1, NULL, NULL, '2014-06-10 23:29:49', '2014-06-10 23:29:49'),
(162, 42, 25, 'Points earned from trade 266', 0, 1, NULL, NULL, '2014-06-10 23:32:02', '2014-06-10 23:32:02'),
(163, 42, 25, 'Points earned from trade 266', 0, 1, NULL, NULL, '2014-06-10 23:32:02', '2014-06-10 23:32:02'),
(164, 42, 25, 'Points earned from trade 267', 0, 1, NULL, NULL, '2014-06-10 23:33:03', '2014-06-10 23:33:03'),
(165, 42, 25, 'Points earned from trade 267', 0, 1, NULL, NULL, '2014-06-10 23:33:03', '2014-06-10 23:33:03'),
(166, 42, 25, 'Points earned from trade 268', 0, 1, NULL, NULL, '2014-06-10 23:34:05', '2014-06-10 23:34:05'),
(167, 42, 25, 'Points earned from trade 268', 0, 1, NULL, NULL, '2014-06-10 23:34:05', '2014-06-10 23:34:05'),
(168, 42, 25, 'Points earned from trade 269', 0, 1, NULL, NULL, '2014-06-10 23:52:01', '2014-06-10 23:52:01'),
(169, 42, 25, 'Points earned from trade 269', 0, 1, NULL, NULL, '2014-06-10 23:52:02', '2014-06-10 23:52:02'),
(171, 6, 25, 'Points earned from trade 1', 2e-08, 1, NULL, NULL, '2014-06-17 00:33:49', '2014-06-17 00:33:49'),
(173, 6, 25, 'Points earned from trade 2', 2e-05, 1, NULL, NULL, '2014-06-17 00:58:52', '2014-06-17 00:58:52'),
(175, 6, 25, 'Points earned from trade 2', 2e-05, 1, NULL, NULL, '2014-06-17 00:58:52', '2014-06-17 00:58:52'),
(178, 6, 25, 'Points earned from trade 3', 0.0003, 1, NULL, NULL, '2014-06-17 01:00:03', '2014-06-17 01:00:03'),
(181, 6, 25, 'Points earned from trade 4', 2e-05, 1, NULL, NULL, '2014-06-17 01:02:23', '2014-06-17 01:02:23'),
(183, 6, 25, 'Points earned from trade 5', 3e-08, 1, NULL, NULL, '2014-06-17 20:34:19', '2014-06-17 20:34:19'),
(185, 6, 25, 'Points earned from trade 5', 3e-08, 1, NULL, NULL, '2014-06-17 20:34:19', '2014-06-17 20:34:19'),
(187, 6, 25, 'Points earned from trade 6', 3e-08, 1, NULL, NULL, '2014-06-17 20:36:03', '2014-06-17 20:36:03'),
(189, 6, 25, 'Points earned from trade 6', 3e-08, 1, NULL, NULL, '2014-06-17 20:36:03', '2014-06-17 20:36:03'),
(191, 6, 25, 'Points earned from trade 7', 3e-08, 1, NULL, NULL, '2014-06-17 20:50:25', '2014-06-17 20:50:25'),
(193, 6, 25, 'Points earned from trade 7', 3e-08, 1, NULL, NULL, '2014-06-17 20:50:25', '2014-06-17 20:50:25'),
(195, 6, 25, 'Points earned from trade 8', 1e-06, 1, NULL, NULL, '2014-06-17 20:56:22', '2014-06-17 20:56:22'),
(197, 6, 25, 'Points earned from trade 8', 1e-06, 1, NULL, NULL, '2014-06-17 20:56:22', '2014-06-17 20:56:22'),
(199, 6, 25, 'Points earned from trade 9', 5.988e-05, 1, NULL, NULL, '2014-06-17 20:56:23', '2014-06-17 20:56:23'),
(201, 6, 25, 'Points earned from trade 9', 5.688e-05, 1, NULL, NULL, '2014-06-17 20:56:23', '2014-06-17 20:56:23'),
(203, 6, 25, 'Points earned from trade 10', 3e-08, 1, NULL, NULL, '2014-06-17 21:01:18', '2014-06-17 21:01:18'),
(205, 6, 25, 'Points earned from trade 10', 3e-08, 1, NULL, NULL, '2014-06-17 21:01:18', '2014-06-17 21:01:18'),
(207, 6, 25, 'Points earned from trade 11', 3e-08, 1, NULL, NULL, '2014-06-17 21:07:02', '2014-06-17 21:07:02'),
(209, 6, 25, 'Points earned from trade 11', 3e-08, 1, NULL, NULL, '2014-06-17 21:07:02', '2014-06-17 21:07:02'),
(211, 6, 25, 'Points earned from trade 12', 3e-08, 1, NULL, NULL, '2014-06-17 23:02:40', '2014-06-17 23:02:40'),
(213, 6, 25, 'Points earned from trade 12', 3e-08, 1, NULL, NULL, '2014-06-17 23:02:40', '2014-06-17 23:02:40'),
(215, 6, 25, 'Points earned from trade 13', 2.94e-06, 1, NULL, NULL, '2014-06-17 23:07:18', '2014-06-17 23:07:18'),
(217, 6, 25, 'Points earned from trade 13', 2.94e-06, 1, NULL, NULL, '2014-06-17 23:07:18', '2014-06-17 23:07:18'),
(219, 6, 25, 'Points earned from trade 14', 4e-08, 1, NULL, NULL, '2014-06-17 23:08:20', '2014-06-17 23:08:20'),
(221, 6, 25, 'Points earned from trade 14', 4e-08, 1, NULL, NULL, '2014-06-17 23:08:20', '2014-06-17 23:08:20'),
(223, 6, 25, 'Points earned from trade 15', 4e-08, 1, NULL, NULL, '2014-06-17 23:10:52', '2014-06-17 23:10:52'),
(225, 6, 25, 'Points earned from trade 15', 4e-08, 1, NULL, NULL, '2014-06-17 23:10:52', '2014-06-17 23:10:52'),
(227, 6, 25, 'Points earned from trade 16', 3e-08, 1, NULL, NULL, '2014-06-17 23:14:33', '2014-06-17 23:14:33'),
(229, 6, 25, 'Points earned from trade 16', 3e-08, 1, NULL, NULL, '2014-06-17 23:14:33', '2014-06-17 23:14:33'),
(231, 6, 25, 'Points earned from trade 17', 1.192e-05, 1, NULL, NULL, '2014-06-17 23:19:36', '2014-06-17 23:19:36'),
(233, 6, 25, 'Points earned from trade 17', 1.192e-05, 1, NULL, NULL, '2014-06-17 23:19:36', '2014-06-17 23:19:36'),
(235, 6, 25, 'Points earned from trade 18', 9e-06, 1, NULL, NULL, '2014-06-17 23:25:11', '2014-06-17 23:25:11'),
(237, 6, 25, 'Points earned from trade 18', 9e-06, 1, NULL, NULL, '2014-06-17 23:25:11', '2014-06-17 23:25:11'),
(239, 6, 25, 'Points earned from trade 19', 3e-05, 1, NULL, NULL, '2014-06-17 23:25:12', '2014-06-17 23:25:12'),
(241, 6, 25, 'Points earned from trade 19', 3e-05, 1, NULL, NULL, '2014-06-17 23:25:12', '2014-06-17 23:25:12'),
(243, 6, 25, 'Points earned from trade 20', 4e-06, 1, NULL, NULL, '2014-06-17 23:28:01', '2014-06-17 23:28:01'),
(245, 6, 25, 'Points earned from trade 20', 4e-06, 1, NULL, NULL, '2014-06-17 23:28:01', '2014-06-17 23:28:01'),
(247, 6, 25, 'Points earned from trade 21', 4e-06, 1, NULL, NULL, '2014-06-17 23:28:02', '2014-06-17 23:28:02'),
(249, 6, 25, 'Points earned from trade 21', 4e-06, 1, NULL, NULL, '2014-06-17 23:28:02', '2014-06-17 23:28:02'),
(251, 6, 25, 'Points earned from trade 22', 0.0001, 1, NULL, NULL, '2014-06-17 23:36:21', '2014-06-17 23:36:21'),
(253, 6, 25, 'Points earned from trade 22', 0.0001, 1, NULL, NULL, '2014-06-17 23:36:21', '2014-06-17 23:36:21'),
(255, 6, 25, 'Points earned from trade 23', 2e-05, 1, NULL, NULL, '2014-06-17 23:37:39', '2014-06-17 23:37:39'),
(257, 6, 25, 'Points earned from trade 23', 2e-05, 1, NULL, NULL, '2014-06-17 23:37:39', '2014-06-17 23:37:39'),
(259, 6, 25, 'Points earned from trade 24', 0.0001, 1, NULL, NULL, '2014-06-17 23:39:38', '2014-06-17 23:39:38'),
(261, 6, 25, 'Points earned from trade 24', 0.0001, 1, NULL, NULL, '2014-06-17 23:39:38', '2014-06-17 23:39:38'),
(263, 6, 25, 'Points earned from trade 25', 2e-05, 1, NULL, NULL, '2014-06-17 23:39:39', '2014-06-17 23:39:39'),
(265, 6, 25, 'Points earned from trade 25', 2e-05, 1, NULL, NULL, '2014-06-17 23:39:39', '2014-06-17 23:39:39'),
(267, 6, 25, 'Points earned from trade 26', 6e-05, 1, NULL, NULL, '2014-06-17 23:53:25', '2014-06-17 23:53:25'),
(269, 6, 25, 'Points earned from trade 26', 6e-05, 1, NULL, NULL, '2014-06-17 23:53:25', '2014-06-17 23:53:25'),
(271, 6, 25, 'Points earned from trade 27', 3e-05, 1, NULL, NULL, '2014-06-17 23:59:54', '2014-06-17 23:59:54'),
(273, 6, 25, 'Points earned from trade 27', 3e-05, 1, NULL, NULL, '2014-06-17 23:59:54', '2014-06-17 23:59:54'),
(275, 6, 25, 'Points earned from trade 28', 0.00015, 1, NULL, NULL, '2014-06-18 00:00:16', '2014-06-18 00:00:16'),
(277, 6, 25, 'Points earned from trade 28', 0.00015, 1, NULL, NULL, '2014-06-18 00:00:16', '2014-06-18 00:00:16'),
(279, 6, 25, 'Points earned from trade 29', 1.5e-05, 1, NULL, NULL, '2014-06-18 00:00:31', '2014-06-18 00:00:31'),
(281, 6, 25, 'Points earned from trade 29', 1.5e-05, 1, NULL, NULL, '2014-06-18 00:00:31', '2014-06-18 00:00:31'),
(283, 6, 25, 'Points earned from trade 30', 0.00012, 1, NULL, NULL, '2014-06-18 00:01:10', '2014-06-18 00:01:10'),
(285, 6, 25, 'Points earned from trade 30', 0.00012, 1, NULL, NULL, '2014-06-18 00:01:10', '2014-06-18 00:01:10'),
(287, 6, 25, 'Points earned from trade 31', 0.00012, 1, NULL, NULL, '2014-06-18 00:01:11', '2014-06-18 00:01:11'),
(289, 6, 25, 'Points earned from trade 31', 0.00012, 1, NULL, NULL, '2014-06-18 00:01:11', '2014-06-18 00:01:11'),
(291, 6, 25, 'Points earned from trade 32', 4e-05, 1, NULL, NULL, '2014-06-18 00:11:23', '2014-06-18 00:11:23'),
(293, 6, 25, 'Points earned from trade 32', 4e-05, 1, NULL, NULL, '2014-06-18 00:11:23', '2014-06-18 00:11:23'),
(295, 6, 25, 'Points earned from trade 33', 4e-05, 1, NULL, NULL, '2014-06-18 00:12:47', '2014-06-18 00:12:47'),
(297, 6, 25, 'Points earned from trade 33', 4e-05, 1, NULL, NULL, '2014-06-18 00:12:47', '2014-06-18 00:12:47'),
(299, 6, 25, 'Points earned from trade 34', 4e-05, 1, NULL, NULL, '2014-06-18 00:12:48', '2014-06-18 00:12:48'),
(301, 6, 25, 'Points earned from trade 34', 4e-05, 1, NULL, NULL, '2014-06-18 00:12:48', '2014-06-18 00:12:48'),
(303, 6, 25, 'Points earned from trade 35', 3e-05, 1, NULL, NULL, '2014-06-18 00:13:20', '2014-06-18 00:13:20'),
(305, 6, 25, 'Points earned from trade 35', 3e-05, 1, NULL, NULL, '2014-06-18 00:13:20', '2014-06-18 00:13:20'),
(307, 6, 25, 'Points earned from trade 36', 3e-05, 1, NULL, NULL, '2014-06-18 00:13:21', '2014-06-18 00:13:21'),
(309, 6, 25, 'Points earned from trade 36', 3e-05, 1, NULL, NULL, '2014-06-18 00:13:21', '2014-06-18 00:13:21'),
(311, 6, 25, 'Points earned from trade 37', 1e-05, 1, NULL, NULL, '2014-06-18 00:29:25', '2014-06-18 00:29:25'),
(313, 6, 25, 'Points earned from trade 37', 1e-05, 1, NULL, NULL, '2014-06-18 00:29:26', '2014-06-18 00:29:26'),
(315, 6, 25, 'Points earned from trade 38', 1e-05, 1, NULL, NULL, '2014-06-18 00:31:07', '2014-06-18 00:31:07'),
(317, 6, 25, 'Points earned from trade 38', 1e-05, 1, NULL, NULL, '2014-06-18 00:31:07', '2014-06-18 00:31:07'),
(319, 6, 25, 'Points earned from trade 39', 1e-05, 1, NULL, NULL, '2014-06-18 00:31:08', '2014-06-18 00:31:08'),
(321, 6, 25, 'Points earned from trade 39', 1e-05, 1, NULL, NULL, '2014-06-18 00:31:08', '2014-06-18 00:31:08'),
(323, 6, 25, 'Points earned from trade 40', 1e-05, 1, NULL, NULL, '2014-06-18 00:42:11', '2014-06-18 00:42:11'),
(325, 6, 25, 'Points earned from trade 40', 1e-05, 1, NULL, NULL, '2014-06-18 00:42:11', '2014-06-18 00:42:11'),
(327, 6, 25, 'Points earned from trade 41', 1e-05, 1, NULL, NULL, '2014-06-18 00:42:12', '2014-06-18 00:42:12'),
(329, 6, 25, 'Points earned from trade 41', 1e-05, 1, NULL, NULL, '2014-06-18 00:42:12', '2014-06-18 00:42:12'),
(331, 6, 25, 'Points earned from trade 42', 4.5e-05, 1, NULL, NULL, '2014-06-18 00:42:13', '2014-06-18 00:42:13'),
(333, 6, 25, 'Points earned from trade 42', 1.5e-05, 1, NULL, NULL, '2014-06-18 00:42:13', '2014-06-18 00:42:13'),
(335, 6, 25, 'Points earned from trade 43', 2e-05, 1, NULL, NULL, '2014-06-18 00:45:09', '2014-06-18 00:45:09'),
(337, 6, 25, 'Points earned from trade 43', 2e-05, 1, NULL, NULL, '2014-06-18 00:45:09', '2014-06-18 00:45:09'),
(339, 6, 25, 'Points earned from trade 44', 1.5e-05, 1, NULL, NULL, '2014-06-18 00:47:51', '2014-06-18 00:47:51'),
(341, 6, 25, 'Points earned from trade 44', 1.5e-05, 1, NULL, NULL, '2014-06-18 00:47:51', '2014-06-18 00:47:51'),
(343, 6, 25, 'Points earned from trade 45', 0.0003, 1, NULL, NULL, '2014-06-18 01:02:28', '2014-06-18 01:02:28'),
(345, 6, 25, 'Points earned from trade 45', 0.0003, 1, NULL, NULL, '2014-06-18 01:02:28', '2014-06-18 01:02:28'),
(347, 6, 25, 'Points earned from trade 46', 0.0003, 1, NULL, NULL, '2014-06-18 01:03:05', '2014-06-18 01:03:05'),
(349, 6, 25, 'Points earned from trade 46', 0.0003, 1, NULL, NULL, '2014-06-18 01:03:06', '2014-06-18 01:03:06'),
(351, 6, 25, 'Points earned from trade 47', 3e-06, 1, NULL, NULL, '2014-06-18 01:06:46', '2014-06-18 01:06:46'),
(353, 6, 25, 'Points earned from trade 47', 3e-06, 1, NULL, NULL, '2014-06-18 01:06:46', '2014-06-18 01:06:46'),
(355, 11, 25, 'Points earned from trade 48', 3e-08, 1, NULL, NULL, '2014-06-18 01:11:34', '2014-06-18 01:11:34'),
(356, 6, 25, 'Points earned from trade 48', 3e-08, 1, NULL, NULL, '2014-06-18 01:11:34', '2014-06-18 01:11:34'),
(358, 11, 25, 'Points earned from trade 49', 3e-08, 1, NULL, NULL, '2014-06-18 01:16:11', '2014-06-18 01:16:11'),
(359, 6, 25, 'Points earned from trade 49', 3e-08, 1, NULL, NULL, '2014-06-18 01:16:11', '2014-06-18 01:16:11'),
(361, 6, 25, 'Points earned from trade 50', 0.000897, 1, NULL, NULL, '2014-06-18 01:35:50', '2014-06-18 01:35:50'),
(363, 6, 25, 'Points earned from trade 50', 0.000897, 1, NULL, NULL, '2014-06-18 01:35:50', '2014-06-18 01:35:50'),
(365, 6, 25, 'Points earned from trade 51', 0.01, 1, NULL, NULL, '2014-06-18 01:36:19', '2014-06-18 01:36:19'),
(367, 11, 25, 'Points earned from trade 51', 0.01, 1, NULL, NULL, '2014-06-18 01:36:20', '2014-06-18 01:36:20'),
(370, 11, 25, 'Points earned from trade 53', 0.001, 1, NULL, NULL, '2014-06-24 18:16:45', '2014-06-24 18:16:45'),
(373, 11, 25, 'Points earned from trade 54', 2.994e-05, 1, NULL, NULL, '2014-06-26 02:39:04', '2014-06-26 02:39:04'),
(374, 6, 25, 'Points earned from trade 54', 2.994e-05, 1, NULL, NULL, '2014-06-26 02:39:04', '2014-06-26 02:39:04'),
(376, 6, 25, 'Points earned from trade 55', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:17', '2014-06-26 08:50:17'),
(378, 6, 25, 'Points earned from trade 55', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:17', '2014-06-26 08:50:17'),
(380, 6, 25, 'Points earned from trade 56', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:34', '2014-06-26 08:50:34'),
(382, 6, 25, 'Points earned from trade 56', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:34', '2014-06-26 08:50:34'),
(384, 6, 25, 'Points earned from trade 57', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:41', '2014-06-26 08:50:41'),
(386, 6, 25, 'Points earned from trade 57', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:42', '2014-06-26 08:50:42'),
(387, 6, 25, 'Points earned from trade 58', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:42', '2014-06-26 08:50:42'),
(390, 6, 25, 'Points earned from trade 58', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:42', '2014-06-26 08:50:42'),
(391, 6, 25, 'Points earned from trade 59', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:42', '2014-06-26 08:50:42'),
(394, 6, 25, 'Points earned from trade 60', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:43', '2014-06-26 08:50:43'),
(395, 6, 25, 'Points earned from trade 59', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:43', '2014-06-26 08:50:43'),
(398, 6, 25, 'Points earned from trade 60', 6e-08, 1, NULL, NULL, '2014-06-26 08:50:43', '2014-06-26 08:50:43'),
(400, 6, 25, 'Points earned from trade 61', 3e-08, 1, NULL, NULL, '2014-06-26 08:51:16', '2014-06-26 08:51:16'),
(402, 6, 25, 'Points earned from trade 61', 3e-08, 1, NULL, NULL, '2014-06-26 08:51:16', '2014-06-26 08:51:16'),
(404, 6, 25, 'Points earned from trade 62', 3e-08, 1, NULL, NULL, '2014-06-26 08:52:42', '2014-06-26 08:52:42'),
(406, 6, 25, 'Points earned from trade 62', 3e-08, 1, NULL, NULL, '2014-06-26 08:52:42', '2014-06-26 08:52:42'),
(408, 6, 25, 'Points earned from trade 63', 3e-08, 1, NULL, NULL, '2014-06-26 08:55:30', '2014-06-26 08:55:30'),
(410, 6, 25, 'Points earned from trade 63', 3e-08, 1, NULL, NULL, '2014-06-26 08:55:30', '2014-06-26 08:55:30'),
(412, 6, 25, 'Points earned from trade 64', 3e-08, 1, NULL, NULL, '2014-06-26 08:56:17', '2014-06-26 08:56:17'),
(414, 6, 25, 'Points earned from trade 64', 3e-08, 1, NULL, NULL, '2014-06-26 08:56:17', '2014-06-26 08:56:17'),
(416, 6, 25, 'Points earned from trade 65', 3e-08, 1, NULL, NULL, '2014-06-26 08:57:33', '2014-06-26 08:57:33'),
(418, 6, 25, 'Points earned from trade 65', 3e-08, 1, NULL, NULL, '2014-06-26 08:57:33', '2014-06-26 08:57:33'),
(420, 6, 25, 'Points earned from trade 66', 3e-08, 1, NULL, NULL, '2014-06-26 08:58:21', '2014-06-26 08:58:21'),
(422, 6, 25, 'Points earned from trade 66', 3e-08, 1, NULL, NULL, '2014-06-26 08:58:21', '2014-06-26 08:58:21'),
(424, 6, 25, 'Points earned from trade 67', 2e-08, 1, NULL, NULL, '2014-06-26 09:02:03', '2014-06-26 09:02:03'),
(426, 6, 25, 'Points earned from trade 67', 2e-08, 1, NULL, NULL, '2014-06-26 09:02:03', '2014-06-26 09:02:03'),
(429, 6, 25, 'Points earned from trade 68', 3e-08, 1, NULL, NULL, '2014-06-26 18:16:54', '2014-06-26 18:16:54'),
(431, 6, 25, 'Points earned from trade 68', 3e-08, 1, NULL, NULL, '2014-06-26 18:16:54', '2014-06-26 18:16:54'),
(434, 6, 25, 'Points earned from trade 71', 3e-06, 1, NULL, NULL, '2014-06-29 19:30:32', '2014-06-29 19:30:32'),
(436, 6, 25, 'Points earned from trade 71', 3e-06, 1, NULL, NULL, '2014-06-29 19:30:32', '2014-06-29 19:30:32'),
(438, 6, 25, 'Points earned from trade 72', 6e-07, 1, NULL, NULL, '2014-06-29 20:20:53', '2014-06-29 20:20:53'),
(440, 6, 25, 'Points earned from trade 72', 6e-07, 1, NULL, NULL, '2014-06-29 20:20:53', '2014-06-29 20:20:53'),
(442, 6, 25, 'Points earned from trade 73', 3e-08, 1, NULL, NULL, '2014-06-29 20:22:35', '2014-06-29 20:22:35'),
(444, 6, 25, 'Points earned from trade 73', 3e-08, 1, NULL, NULL, '2014-06-29 20:22:35', '2014-06-29 20:22:35'),
(445, 6, 25, 'Points earned from trade 74', 3e-05, 1, NULL, NULL, '2014-07-23 01:16:09', '2014-07-23 01:16:09'),
(446, 6, 25, 'Points earned from trade 75', 3e-05, 1, NULL, NULL, '2014-07-23 01:19:31', '2014-07-23 01:19:31'),
(447, 11, 25, 'Points earned from trade 77', 6.3e-05, 1, NULL, NULL, '2014-09-16 18:47:29', '2014-09-16 18:47:29'),
(448, 6, 25, 'Points earned from trade 77', 6.3e-05, 1, NULL, NULL, '2014-09-16 18:47:29', '2014-09-16 18:47:29'),
(449, 11, 25, 'Points earned from trade 78', 0.0370368, 1, NULL, NULL, '2014-10-07 23:06:43', '2014-10-07 23:06:43'),
(450, 6, 25, 'Points earned from trade 78', 0.0370368, 1, NULL, NULL, '2014-10-07 23:06:43', '2014-10-07 23:06:43'),
(451, 11, 25, 'Points earned from trade 79', 0.0036, 1, NULL, NULL, '2014-10-07 23:06:44', '2014-10-07 23:06:44'),
(452, 6, 25, 'Points earned from trade 79', 0.0036, 1, NULL, NULL, '2014-10-07 23:06:44', '2014-10-07 23:06:44'),
(453, 11, 25, 'Points earned from trade 80', 0.0048, 1, NULL, NULL, '2014-10-07 23:06:45', '2014-10-07 23:06:45'),
(454, 6, 25, 'Points earned from trade 80', 0.0048, 1, NULL, NULL, '2014-10-07 23:06:45', '2014-10-07 23:06:45'),
(455, 11, 25, 'Points earned from trade 81', 0.0108, 1, NULL, NULL, '2014-10-07 23:06:46', '2014-10-07 23:06:46'),
(456, 6, 25, 'Points earned from trade 81', 0.0108, 1, NULL, NULL, '2014-10-07 23:06:46', '2014-10-07 23:06:46'),
(457, 11, 25, 'Points earned from trade 82', 7.224e-06, 1, NULL, NULL, '2014-10-07 23:06:47', '2014-10-07 23:06:47'),
(458, 6, 25, 'Points earned from trade 82', 7.224e-06, 1, NULL, NULL, '2014-10-07 23:06:47', '2014-10-07 23:06:47'),
(459, 11, 25, 'Points earned from trade 83', 7.32e-06, 1, NULL, NULL, '2014-10-07 23:06:48', '2014-10-07 23:06:48'),
(460, 6, 25, 'Points earned from trade 83', 7.32e-06, 1, NULL, NULL, '2014-10-07 23:06:48', '2014-10-07 23:06:48'),
(461, 11, 25, 'Points earned from trade 84', 7.368e-06, 1, NULL, NULL, '2014-10-07 23:06:49', '2014-10-07 23:06:49'),
(462, 6, 25, 'Points earned from trade 84', 7.368e-06, 1, NULL, NULL, '2014-10-07 23:06:49', '2014-10-07 23:06:49'),
(463, 11, 25, 'Points earned from trade 85', 1.24e-05, 1, NULL, NULL, '2014-10-07 23:06:50', '2014-10-07 23:06:50'),
(464, 6, 25, 'Points earned from trade 85', 1.24e-05, 1, NULL, NULL, '2014-10-07 23:06:50', '2014-10-07 23:06:50'),
(465, 11, 25, 'Points earned from trade 86', 2.56e-05, 1, NULL, NULL, '2014-10-07 23:06:52', '2014-10-07 23:06:52'),
(466, 6, 25, 'Points earned from trade 86', 2.56e-05, 1, NULL, NULL, '2014-10-07 23:06:52', '2014-10-07 23:06:52'),
(467, 11, 25, 'Points earned from trade 87', 0.00064, 1, NULL, NULL, '2014-10-07 23:06:53', '2014-10-07 23:06:53'),
(468, 6, 25, 'Points earned from trade 87', 0.00064, 1, NULL, NULL, '2014-10-07 23:06:53', '2014-10-07 23:06:53'),
(469, 11, 25, 'Points earned from trade 88', 0.0006864, 1, NULL, NULL, '2014-10-07 23:06:54', '2014-10-07 23:06:54'),
(470, 6, 25, 'Points earned from trade 88', 0.0006864, 1, NULL, NULL, '2014-10-07 23:06:54', '2014-10-07 23:06:54'),
(471, 11, 25, 'Points earned from trade 89', 0.000728, 1, NULL, NULL, '2014-10-07 23:06:55', '2014-10-07 23:06:55'),
(472, 6, 25, 'Points earned from trade 89', 0.000728, 1, NULL, NULL, '2014-10-07 23:06:55', '2014-10-07 23:06:55'),
(473, 11, 25, 'Points earned from trade 90', 0.0001152, 1, NULL, NULL, '2014-10-07 23:06:57', '2014-10-07 23:06:57'),
(474, 6, 25, 'Points earned from trade 90', 0.0001152, 1, NULL, NULL, '2014-10-07 23:06:57', '2014-10-07 23:06:57'),
(475, 11, 25, 'Points earned from trade 91', 5.92e-05, 1, NULL, NULL, '2014-10-07 23:06:59', '2014-10-07 23:06:59'),
(476, 6, 25, 'Points earned from trade 91', 5.92e-05, 1, NULL, NULL, '2014-10-07 23:06:59', '2014-10-07 23:06:59'),
(477, 11, 25, 'Points earned from trade 92', 5.92e-06, 1, NULL, NULL, '2014-10-07 23:07:00', '2014-10-07 23:07:00'),
(478, 6, 25, 'Points earned from trade 92', 5.92e-06, 1, NULL, NULL, '2014-10-07 23:07:00', '2014-10-07 23:07:00'),
(479, 11, 25, 'Points earned from trade 93', 9.36e-06, 1, NULL, NULL, '2014-10-07 23:07:01', '2014-10-07 23:07:01'),
(480, 6, 25, 'Points earned from trade 93', 9.36e-06, 1, NULL, NULL, '2014-10-07 23:07:01', '2014-10-07 23:07:01'),
(481, 11, 25, 'Points earned from trade 94', 3.56, 1, NULL, NULL, '2014-10-07 23:07:02', '2014-10-07 23:07:02'),
(482, 11, 25, 'Points earned from trade 94', 3.56, 1, NULL, NULL, '2014-10-07 23:07:02', '2014-10-07 23:07:02'),
(483, 11, 25, 'Points earned from trade 95', 3.6, 1, NULL, NULL, '2014-10-07 23:07:03', '2014-10-07 23:07:03'),
(484, 6, 25, 'Points earned from trade 95', 3.6, 1, NULL, NULL, '2014-10-07 23:07:03', '2014-10-07 23:07:03'),
(485, 11, 25, 'Points earned from trade 96', 0.04, 1, NULL, NULL, '2014-10-07 23:07:04', '2014-10-07 23:07:04'),
(486, 6, 25, 'Points earned from trade 96', 0.04, 1, NULL, NULL, '2014-10-07 23:07:04', '2014-10-07 23:07:04'),
(487, 11, 25, 'Points earned from trade 97', 0.008, 1, NULL, NULL, '2014-10-08 03:00:51', '2014-10-08 03:00:51'),
(488, 6, 25, 'Points earned from trade 97', 0.008, 1, NULL, NULL, '2014-10-08 03:00:51', '2014-10-08 03:00:51'),
(489, 11, 25, 'Points earned from trade 98', 0.08, 1, NULL, NULL, '2014-10-08 03:01:29', '2014-10-08 03:01:29'),
(490, 6, 25, 'Points earned from trade 98', 0.08, 1, NULL, NULL, '2014-10-08 03:01:29', '2014-10-08 03:01:29'),
(491, 11, 25, 'Points earned from trade 99', 0.008, 1, NULL, NULL, '2014-10-08 03:04:16', '2014-10-08 03:04:16'),
(492, 6, 25, 'Points earned from trade 99', 0.008, 1, NULL, NULL, '2014-10-08 03:04:16', '2014-10-08 03:04:16'),
(493, 6, 25, 'Points earned from trade 100', 0.4, 1, NULL, NULL, '2014-10-08 19:31:07', '2014-10-08 19:31:07'),
(494, 11, 25, 'Points earned from trade 100', 0.4, 1, NULL, NULL, '2014-10-08 19:31:08', '2014-10-08 19:31:08'),
(495, 6, 25, 'Points earned from trade 101', 0.4, 1, NULL, NULL, '2014-10-08 19:31:08', '2014-10-08 19:31:08'),
(496, 11, 25, 'Points earned from trade 101', 0.4, 1, NULL, NULL, '2014-10-08 19:31:08', '2014-10-08 19:31:08'),
(497, 6, 25, 'Points earned from trade 102', 0.08, 1, NULL, NULL, '2014-10-08 19:31:09', '2014-10-08 19:31:09'),
(498, 11, 25, 'Points earned from trade 102', 0.08, 1, NULL, NULL, '2014-10-08 19:31:09', '2014-10-08 19:31:09'),
(499, 6, 25, 'Points earned from trade 103', 0.008, 1, NULL, NULL, '2014-10-08 19:31:10', '2014-10-08 19:31:10'),
(500, 11, 25, 'Points earned from trade 103', 0.008, 1, NULL, NULL, '2014-10-08 19:31:10', '2014-10-08 19:31:10'),
(501, 6, 25, 'Points earned from trade 104', 0.008, 1, NULL, NULL, '2014-10-08 19:31:11', '2014-10-08 19:31:11'),
(502, 11, 25, 'Points earned from trade 104', 0.008, 1, NULL, NULL, '2014-10-08 19:31:11', '2014-10-08 19:31:11'),
(503, 11, 25, 'Points earned from trade 105', 0.12, 1, NULL, NULL, '2014-10-08 19:31:12', '2014-10-08 19:31:12'),
(504, 11, 25, 'Points earned from trade 105', 0.12, 1, NULL, NULL, '2014-10-08 19:31:12', '2014-10-08 19:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `fee_trade`
--

CREATE TABLE IF NOT EXISTS `fee_trade` (
`id` int(11) NOT NULL,
  `fee_sell` double DEFAULT NULL,
  `fee_buy` double DEFAULT NULL,
  `market_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `fee_trade`
--

INSERT INTO `fee_trade` (`id`, `fee_sell`, `fee_buy`, `market_id`) VALUES
(16, 0, 0, 19),
(17, 0, 0, 20),
(18, 10, 10, 21),
(19, 0, 0, 22),
(20, 0, 0, 23),
(21, 0, 0, 24),
(22, 0, 0, 25),
(23, 0, 0, 26),
(24, 0, 0, 27),
(25, 0, 0, 28),
(26, 0, 0, 29),
(27, 0, 0, 30),
(28, 0, 0, 31),
(29, 0, 0, 32),
(30, 10, 10, 33),
(31, 4.9, 4.9, 34),
(32, 0, 0, 35),
(33, 0, 0, 36),
(34, 1, 1, 37),
(35, 0, 0, 38),
(36, 0, 0, 39),
(37, 0, 0, 40),
(38, 0, 0, 41),
(39, 0, 0, 42),
(40, 0, 0, 43),
(41, 0, 0, 44),
(42, 0, 0, 45),
(43, 0, 0, 46),
(44, 0, 0, 47),
(45, 0, 0, 48),
(51, 0, 0, 999999),
(52, 0, 0, 49),
(53, 0, 0, 50);

-- --------------------------------------------------------

--
-- Table structure for table `fee_withdraw`
--

CREATE TABLE IF NOT EXISTS `fee_withdraw` (
`id` int(11) NOT NULL,
  `percent_fee` double DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `fee_withdraw`
--

INSERT INTO `fee_withdraw` (`id`, `percent_fee`, `wallet_id`) VALUES
(1, 0.0002, 1),
(5, 0, 8),
(6, 0, 9),
(7, 0, 10),
(8, 0.5, 11),
(9, 0, 12),
(10, 0, 13),
(11, 0, 14),
(12, 0, 15),
(13, 0, 16),
(14, 0, 17),
(15, 0, 18),
(16, 0, 19),
(17, 0, 20),
(18, 0, 21),
(19, 0, 22),
(20, 0, 23),
(21, 0, 24),
(22, 0, 25),
(28, 0, 31),
(30, 0, 33),
(31, 0, 34);

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE IF NOT EXISTS `login_history` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=249 ;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`id`, `user_id`, `ip_address`, `date`) VALUES
(1, 6, '115.78.235.170', '2014-06-20 01:26:49'),
(3, 6, '115.78.235.170', '2014-06-20 01:55:58'),
(24, 11, '115.78.235.170', '2014-06-22 14:09:13'),
(25, 55, '115.78.235.170', '2014-06-22 14:10:10'),
(26, 55, '77.86.33.194', '2014-06-22 14:11:02'),
(27, 6, '115.78.235.170', '2014-06-22 20:28:48'),
(28, 55, '77.86.33.194', '2014-06-22 22:53:05'),
(29, 6, '115.78.235.170', '2014-06-23 00:29:44'),
(30, 6, '115.78.235.170', '2014-06-23 01:13:32'),
(37, 6, '113.163.124.180', '2014-06-23 07:40:52'),
(40, 6, '115.78.235.170', '2014-06-23 18:22:56'),
(41, 71, '115.78.235.170', '2014-06-23 18:24:48'),
(42, 72, '115.78.235.170', '2014-06-23 18:27:52'),
(46, 55, '123.218.148.104', '2014-06-24 02:10:36'),
(50, 55, '123.218.148.104', '2014-06-24 06:10:46'),
(54, 55, '123.218.148.104', '2014-06-24 09:15:45'),
(55, 55, '123.218.148.104', '2014-06-24 11:15:48'),
(56, 50, '123.218.148.104', '2014-06-24 11:18:15'),
(58, 6, '115.78.235.170', '2014-06-24 18:19:05'),
(59, 6, '115.78.235.170', '2014-06-24 18:40:15'),
(60, 6, '115.78.235.170', '2014-06-24 19:35:16'),
(61, 6, '115.78.235.170', '2014-06-24 19:35:53'),
(62, 6, '115.78.235.170', '2014-06-25 01:11:33'),
(63, 6, '115.78.235.170', '2014-06-25 17:35:20'),
(64, 6, '115.78.235.170', '2014-06-25 18:06:31'),
(65, 6, '115.78.235.170', '2014-06-25 19:23:01'),
(66, 6, '115.78.235.170', '2014-06-25 19:32:22'),
(67, 11, '115.78.235.170', '2014-06-26 02:35:22'),
(68, 6, '113.163.65.3', '2014-06-26 08:49:38'),
(69, 6, '115.78.235.170', '2014-06-26 17:40:19'),
(70, 6, '115.78.235.170', '2014-06-26 19:00:59'),
(71, 6, '115.78.235.170', '2014-06-26 23:19:27'),
(72, 6, '115.78.235.170', '2014-06-27 02:35:16'),
(73, 6, '115.78.235.170', '2014-06-29 17:47:46'),
(74, 6, '115.78.235.170', '2014-06-29 18:22:56'),
(75, 6, '115.78.235.170', '2014-06-30 02:25:00'),
(76, 6, '113.163.127.118', '2014-06-30 02:32:43'),
(77, 55, '115.78.235.170', '2014-06-30 16:06:10'),
(78, 55, '178.94.172.213', '2014-06-30 16:10:13'),
(79, 55, '178.94.172.213', '2014-06-30 16:29:24'),
(80, 6, '115.78.235.170', '2014-06-30 18:05:02'),
(81, 6, '115.78.235.170', '2014-06-30 18:09:13'),
(82, 6, '115.78.235.170', '2014-06-30 20:25:56'),
(83, 6, '115.78.235.170', '2014-06-30 23:04:17'),
(84, 11, '115.78.235.170', '2014-06-30 23:50:12'),
(85, 11, '115.78.235.170', '2014-07-01 02:22:50'),
(86, 55, '46.8.84.2', '2014-07-01 03:35:38'),
(87, 55, '46.8.84.2', '2014-07-01 03:35:39'),
(88, 55, '68.96.116.19', '2014-07-01 13:07:21'),
(89, 6, '115.78.235.170', '2014-07-01 19:47:06'),
(90, 6, '115.78.235.170', '2014-07-02 00:13:57'),
(91, 11, '115.78.235.170', '2014-07-02 00:42:01'),
(92, 55, '123.218.148.104', '2014-07-02 11:25:32'),
(93, 55, '123.218.148.104', '2014-07-02 11:31:20'),
(94, 55, '123.218.148.104', '2014-07-02 11:47:58'),
(95, 55, '123.218.148.104', '2014-07-02 11:54:39'),
(96, 55, '95.133.238.40', '2014-07-02 15:19:27'),
(97, 55, '95.133.238.40', '2014-07-02 15:19:28'),
(98, 55, '115.78.235.170', '2014-07-02 19:22:03'),
(99, 55, '174.102.112.160', '2014-07-02 19:22:15'),
(100, 55, '123.218.148.104', '2014-07-02 20:57:47'),
(101, 55, '123.218.148.104', '2014-07-02 22:27:49'),
(102, 11, '115.78.235.170', '2014-07-03 02:14:27'),
(103, 55, '77.86.33.194', '2014-07-03 12:21:54'),
(104, 55, '42.104.26.91', '2014-07-03 12:23:19'),
(105, 6, '115.78.235.170', '2014-07-04 00:57:18'),
(106, 11, '115.78.235.170', '2014-07-04 02:06:56'),
(107, 11, '115.78.235.170', '2014-07-04 03:04:26'),
(108, 55, '178.94.172.91', '2014-07-04 13:29:25'),
(109, 55, '64.246.111.124', '2014-07-04 18:45:13'),
(110, 55, '74.102.35.136', '2014-07-04 18:45:50'),
(111, 11, '115.78.235.170', '2014-07-08 20:48:57'),
(112, 55, '123.218.148.104', '2014-07-08 22:04:21'),
(113, 11, '115.78.235.170', '2014-07-08 23:57:32'),
(114, 55, '123.218.148.104', '2014-07-09 08:20:21'),
(115, 55, '123.218.148.104', '2014-07-09 08:22:17'),
(116, 55, '123.218.148.104', '2014-07-09 13:52:30'),
(117, 6, '115.78.235.170', '2014-07-09 20:22:10'),
(118, 55, '31.148.255.230', '2014-07-12 05:21:52'),
(119, 55, '31.148.255.230', '2014-07-12 06:10:51'),
(120, 55, '31.148.255.230', '2014-07-12 06:10:52'),
(121, 55, '115.78.235.170', '2014-07-12 22:39:07'),
(122, 55, '50.100.216.140', '2014-07-12 22:43:13'),
(123, 55, '50.100.216.140', '2014-07-12 22:54:26'),
(124, 55, '50.100.216.140', '2014-07-13 07:45:03'),
(125, 55, '50.100.216.140', '2014-07-13 10:00:35'),
(126, 55, '50.100.216.140', '2014-07-13 10:09:11'),
(127, 55, '115.78.235.170', '2014-07-13 13:42:24'),
(128, 55, '174.17.245.201', '2014-07-13 13:43:27'),
(129, 6, '115.78.235.170', '2014-07-13 20:06:23'),
(130, 6, '115.78.235.170', '2014-07-16 20:59:07'),
(131, 55, '123.218.148.104', '2014-07-17 05:00:33'),
(132, 55, '123.218.148.104', '2014-07-17 06:06:03'),
(133, 11, '115.78.235.170', '2014-07-18 20:32:30'),
(134, 55, '50.100.216.140', '2014-07-19 13:08:41'),
(135, 11, '115.78.235.170', '2014-07-20 00:22:36'),
(136, 6, '113.163.128.91', '2014-07-20 02:45:09'),
(137, 11, '115.78.235.170', '2014-07-20 18:34:34'),
(138, 55, '65.93.139.130', '2014-07-21 17:10:21'),
(139, 55, '115.78.235.170', '2014-07-21 20:53:50'),
(140, 55, '76.17.184.184', '2014-07-21 20:54:34'),
(141, 55, '115.78.235.170', '2014-07-22 01:50:24'),
(142, 55, '77.66.110.106', '2014-07-22 01:51:06'),
(143, 6, '115.78.235.170', '2014-07-22 01:51:47'),
(144, 6, '115.78.235.170', '2014-07-22 02:02:28'),
(145, 55, '77.66.110.106', '2014-07-22 03:11:30'),
(146, 81, '77.66.110.106', '2014-07-22 03:28:50'),
(147, 6, '115.78.235.170', '2014-07-22 19:12:39'),
(148, 6, '115.78.235.170', '2014-07-22 19:38:04'),
(149, 6, '115.78.235.170', '2014-07-22 23:35:42'),
(150, 6, '115.78.235.170', '2014-07-23 01:08:43'),
(151, 6, '115.78.235.170', '2014-07-23 23:20:19'),
(152, 55, '115.78.235.170', '2014-07-23 23:25:41'),
(153, 55, '123.218.148.104', '2014-07-24 02:11:57'),
(154, 55, '123.218.148.104', '2014-07-24 22:13:40'),
(155, 55, '184.101.195.104', '2014-07-29 18:29:02'),
(156, 11, '115.78.235.170', '2014-07-30 18:31:39'),
(157, 55, '31.148.255.230', '2014-08-01 03:52:21'),
(158, 55, '31.148.255.230', '2014-08-01 03:52:21'),
(159, 83, '31.148.255.230', '2014-08-01 03:54:20'),
(160, 83, '31.148.255.230', '2014-08-01 03:54:21'),
(161, 83, '31.148.255.230', '2014-08-01 04:16:36'),
(162, 83, '31.148.255.230', '2014-08-01 04:16:37'),
(163, 55, '92.112.251.57', '2014-08-02 13:33:29'),
(164, 55, '94.178.237.214', '2014-08-05 13:37:19'),
(165, 55, '184.101.107.33', '2014-08-06 18:56:30'),
(166, 55, '192.168.1.1', '2014-08-09 10:56:52'),
(167, 11, '83.172.65.211', '2014-08-09 11:41:10'),
(168, 55, '192.168.1.1', '2014-08-09 11:44:34'),
(169, 11, '83.172.65.211', '2014-08-09 11:50:26'),
(170, 11, '83.172.65.211', '2014-08-09 11:53:43'),
(171, 55, '70.115.181.31', '2014-08-09 16:52:22'),
(172, 55, '70.115.181.31', '2014-08-09 20:18:12'),
(173, 55, '70.115.181.31', '2014-08-09 23:26:18'),
(174, 55, '192.168.1.1', '2014-08-10 23:38:40'),
(175, 6, '192.168.1.1', '2014-08-10 23:49:01'),
(176, 6, '113.161.206.99', '2014-08-15 00:49:21'),
(177, 6, '113.161.206.99', '2014-08-17 19:24:00'),
(178, 6, '113.161.206.99', '2014-08-21 02:37:06'),
(179, 55, '94.178.87.253', '2014-08-25 00:48:26'),
(180, 55, '192.168.1.1', '2014-08-26 17:46:29'),
(181, 55, '70.208.8.36', '2014-08-26 17:47:29'),
(182, 55, '94.178.69.128', '2014-08-31 08:48:20'),
(183, 55, '92.112.250.161', '2014-08-31 10:42:26'),
(184, 55, '92.112.250.161', '2014-08-31 15:28:42'),
(185, 55, '92.112.250.161', '2014-08-31 16:00:00'),
(186, 55, '192.168.1.1', '2014-09-01 00:17:57'),
(187, 55, '192.168.1.1', '2014-09-01 03:30:08'),
(188, 55, '70.208.4.20', '2014-09-02 12:03:44'),
(189, 55, '77.86.33.194', '2014-09-02 12:28:23'),
(190, 55, '69.124.29.245', '2014-09-02 12:29:45'),
(191, 55, '69.124.29.245', '2014-09-02 13:23:43'),
(192, 55, '41.237.107.159', '2014-09-03 07:01:45'),
(193, 55, '92.112.231.228', '2014-09-06 14:27:38'),
(194, 6, '14.164.138.30', '2014-09-08 05:19:44'),
(195, 6, '113.161.206.99', '2014-09-10 20:14:13'),
(196, 55, '92.112.228.116', '2014-09-11 23:24:36'),
(197, 55, '192.168.1.1', '2014-09-15 13:37:05'),
(198, 55, '24.15.127.229', '2014-09-15 13:38:23'),
(199, 11, '83.172.65.211', '2014-09-15 16:44:05'),
(200, 6, '113.161.206.99', '2014-09-16 18:45:33'),
(201, 6, '113.161.206.99', '2014-09-17 00:45:37'),
(202, 55, '82.234.125.79', '2014-09-17 04:40:36'),
(203, 55, '195.154.15.246', '2014-09-17 23:31:52'),
(204, 55, '195.154.15.246', '2014-09-17 23:31:54'),
(205, 55, '69.124.29.245', '2014-09-22 22:57:42'),
(206, 55, '95.211.199.70', '2014-09-24 01:55:05'),
(207, 6, '192.168.1.1', '2014-09-24 02:14:39'),
(208, 55, '69.124.29.245', '2014-09-25 00:07:02'),
(209, 55, '103.5.142.53', '2014-09-25 01:25:27'),
(210, 55, '69.124.29.245', '2014-09-28 00:58:42'),
(211, 55, '12.47.173.130', '2014-09-29 09:12:50'),
(212, 55, '12.47.173.130', '2014-09-29 09:19:11'),
(213, 11, '83.172.65.211', '2014-09-29 18:48:52'),
(214, 55, '69.124.29.245', '2014-09-29 19:09:32'),
(215, 11, '83.172.65.211', '2014-09-29 20:17:04'),
(216, 11, '83.172.65.211', '2014-09-30 01:43:43'),
(217, 55, '148.167.132.244', '2014-09-30 11:35:04'),
(218, 55, '148.167.132.244', '2014-09-30 11:46:09'),
(219, 55, '148.167.132.244', '2014-09-30 11:48:14'),
(220, 55, '148.167.132.244', '2014-09-30 12:30:30'),
(221, 86, '148.167.132.244', '2014-09-30 12:33:31'),
(222, 55, '148.167.132.244', '2014-09-30 13:01:05'),
(223, 55, '148.167.132.244', '2014-09-30 14:10:47'),
(224, 55, '148.167.132.244', '2014-10-03 15:43:54'),
(225, 55, '12.47.173.130', '2014-10-04 12:24:00'),
(226, 55, '63.229.119.1', '2014-10-05 15:23:32'),
(227, 11, '192.168.1.1', '2014-10-06 18:53:53'),
(228, 11, '192.168.1.1', '2014-10-06 20:35:37'),
(229, 55, '192.168.1.1', '2014-10-07 01:12:38'),
(230, 55, '216.3.171.23', '2014-10-07 09:47:20'),
(231, 6, '192.168.1.1', '2014-10-07 19:04:22'),
(232, 11, '192.168.1.1', '2014-10-07 21:16:10'),
(233, 11, '192.168.1.1', '2014-10-07 23:05:29'),
(234, 6, '192.168.1.1', '2014-10-08 02:35:11'),
(235, 11, '192.168.1.1', '2014-10-08 03:07:25'),
(236, 55, '69.124.29.245', '2014-10-08 03:20:33'),
(237, 55, '118.100.110.220', '2014-10-08 03:23:19'),
(238, 55, '216.3.171.23', '2014-10-08 10:46:23'),
(239, 55, '216.3.171.23', '2014-10-08 10:58:52'),
(240, 6, '192.168.1.1', '2014-10-08 18:03:37'),
(241, 11, '192.168.1.1', '2014-10-08 18:18:03'),
(242, 11, '192.168.1.1', '2014-10-08 18:20:45'),
(243, 11, '192.168.1.1', '2014-10-08 19:07:51'),
(244, 11, '192.168.1.1', '2014-10-08 20:07:26'),
(245, 11, '192.168.1.1', '2014-10-08 20:56:41'),
(246, 55, '216.3.171.23', '2014-10-09 09:49:20'),
(247, 55, '216.3.171.23', '2014-10-09 13:25:19'),
(248, 55, '148.167.132.244', '2014-10-09 16:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE IF NOT EXISTS `market` (
`id` int(11) NOT NULL,
  `wallet_from` varchar(10) DEFAULT NULL COMMENT 'match to wallet type',
  `wallet_to` varchar(10) DEFAULT NULL COMMENT 'match to wallet type',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `market`
--

INSERT INTO `market` (`id`, `wallet_from`, `wallet_to`, `active`) VALUES
(19, '11', '1', 1),
(20, '10', '1', 1),
(21, '12', '1', 1),
(22, '13', '1', 1),
(23, '14', '1', 1),
(24, '15', '1', 1),
(25, '16', '1', 1),
(26, '17', '1', 1),
(27, '18', '1', 1),
(28, '19', '1', 1),
(29, '20', '1', 1),
(30, '21', '1', 1),
(31, '22', '1', 1),
(32, '8', '24', 1),
(33, '24', '1', 1),
(34, '9', '24', 1),
(35, '10', '24', 1),
(36, '11', '24', 1),
(37, '12', '24', 1),
(38, '13', '24', 1),
(39, '14', '24', 1),
(40, '15', '24', 1),
(41, '16', '24', 1),
(42, '17', '24', 1),
(43, '18', '24', 1),
(44, '19', '24', 1),
(45, '20', '24', 1),
(46, '21', '24', 1),
(47, '22', '24', 1),
(48, '25', '1', 1),
(49, '9', '1', 1),
(50, '34', '24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `method_deposit_currency`
--

CREATE TABLE IF NOT EXISTS `method_deposit_currency` (
`id` int(12) NOT NULL,
  `dname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dfee` float NOT NULL DEFAULT '0',
  `dmin` float NOT NULL DEFAULT '0',
  `ddes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dminfee` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `method_deposit_currency`
--

INSERT INTO `method_deposit_currency` (`id`, `dname`, `dfee`, `dmin`, `ddes`, `dminfee`) VALUES
(1, 'WIRE TRANSFER', 10, 10, 'Bank name:	<b>HSBC BANK USA</b>\r\nBank address:	cantho vietname\r\nBank swift:	MRMDUS33\r\nBank account:	000047490\r\nBank details:	ACC ID S505169E<br>\r\nBank name:	<b>HSBC BANK USA</b>\r\nBank address:	cantho vietname\r\nBank swift:	MRMDUS33\r\nBank account:	000047490', 1),
(3, 'PAYSAFE', 20, 0, 'Paysafe ID: 6578787798798', 0),
(4, 'EGOPAY', 1, 0, 'Egopay', 0);

-- --------------------------------------------------------

--
-- Table structure for table `method_withdraw_currency`
--

CREATE TABLE IF NOT EXISTS `method_withdraw_currency` (
`id` int(12) NOT NULL,
  `wname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wfee` float NOT NULL DEFAULT '0',
  `wmin` float NOT NULL DEFAULT '0',
  `wdes` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `wminfee` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `method_withdraw_currency`
--

INSERT INTO `method_withdraw_currency` (`id`, `wname`, `wfee`, `wmin`, `wdes`, `wminfee`) VALUES
(11, 'WIRE TRANSFER', 1.5, 10, 'International withdrawals will be charged with 1.5% fee, minimum fee is 150.\r\nBenificiary Name:\r\nAccount Number/IBAN:\r\nSWIFT/ABA:\r\nBenificiary Address:\r\nName Of Bank:\r\nBank address: \r\nwithdrawals wire transfer could take up to 5-7 day to process.\r\nFee is non refundable if we got refund of your transfer', 10),
(13, 'PAYPAL', 7, 10, 'fee paypal - paid by the beneficiary maximum amount per transaction - 2500\r\nsend weekdays only Paypal Withdrawal within 5 working days', 10),
(14, 'SKRILL', 0, 100, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_03_18_013822_confide_setup_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id` int(11) NOT NULL,
  `market_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `from_value` double DEFAULT NULL,
  `to_value` double DEFAULT NULL COMMENT 'price * from_value',
  `type` enum('sell','buy') DEFAULT NULL COMMENT 'sell or buy',
  `status` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=380 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `market_id`, `user_id`, `price`, `from_value`, `to_value`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 33, 6, 0.006, 0.39, 0.00234, 'buy', 'filled', '2014-05-05', '2014-05-05 15:12:51'),
(2, 33, 6, 0.005, 0.1, 0.0005, 'buy', 'filled', '2014-05-05', '2014-05-05 15:14:36'),
(3, 33, 6, 0.007, 0.01, 7e-05, 'buy', 'filled', '2014-05-05', '2014-05-05 11:58:44'),
(4, 33, 6, 0.006, 0.01, 6e-05, 'sell', 'filled', '2014-05-05', '2014-05-05 11:58:44'),
(5, 33, 6, 0.007, 0.1, 0.0007, 'sell', 'filled', '2014-05-05', '2014-05-05 12:23:31'),
(7, 33, 6, 0.008, 0.1, 0.0008, 'buy', 'filled', '2014-05-05', '2014-05-05 12:23:31'),
(8, 33, 6, 0.007, 0.05, 0.00035, 'sell', 'filled', '2014-05-05', '2014-05-05 13:38:45'),
(9, 33, 6, 0.007, 0.05, 0.00035, 'buy', 'filled', '2014-05-05', '2014-05-05 12:40:09'),
(11, 33, 6, 0.007, 0.05, 0.00035, 'buy', 'filled', '2014-05-05', '2014-05-05 13:38:45'),
(12, 33, 6, 0.007, 0.05, 0.00035, 'sell', 'filled', '2014-05-05', '2014-05-05 14:02:54'),
(13, 33, 6, 0.007, 0.05, 0.00035, 'buy', 'filled', '2014-05-05', '2014-05-05 13:44:33'),
(15, 33, 6, 0.007, 0.05, 0.00035, 'sell', 'filled', '2014-05-05', '2014-05-05 14:26:38'),
(16, 33, 6, 0.007, 0.09, 0.00063, 'sell', 'filled', '2014-05-05', '2014-05-05 15:05:23'),
(17, 33, 6, 0.007, 0.06, 0.00042, 'sell', 'filled', '2014-05-05', '2014-05-05 15:10:48'),
(19, 33, 6, 0.007, 0.07, 0.00049, 'sell', 'filled', '2014-05-05', '2014-05-05 15:21:57'),
(20, 33, 6, 0.006, 0.395, 0.00237, 'buy', 'filled', '2014-05-05', '2014-05-05 15:12:51'),
(21, 33, 6, 0.006, 0.005, 3e-05, 'sell', 'filled', '2014-05-05', '2014-05-05 15:21:57'),
(24, 33, 6, 0.004, 0.004, 1.6e-05, 'sell', 'filled', '2014-05-05', '2014-05-06 06:44:13'),
(25, 33, 6, 0.005, 0.096, 0.00048, 'buy', 'filled', '2014-05-06', '2014-05-06 06:49:37'),
(26, 33, 6, 0.004, 0.104, 0.000416, 'sell', 'filled', '2014-05-06', '2014-05-06 06:53:48'),
(27, 33, 6, 0.003, 0.001, 3e-06, 'buy', 'filled', '2014-05-06', '2014-05-06 06:55:37'),
(28, 33, 6, 0.005, 0.001, 5e-06, 'sell', 'filled', '2014-05-06', '2014-05-06 06:54:04'),
(29, 33, 6, 0.006, 0.1035, 0.000621, 'buy', 'filled', '2014-05-06', '2014-05-06 06:55:37'),
(31, 33, 6, 0.004, 0.0007, 2.8e-06, 'sell', 'filled', '2014-05-06', '2014-05-14 06:32:36'),
(32, 33, 6, 0.003, 0.01, 3e-05, 'sell', 'filled', '2014-05-06', '2014-05-06 07:15:04'),
(33, 33, 6, 0.003, 0.004, 1.2e-05, 'sell', 'filled', '2014-05-06', '2014-05-08 01:27:14'),
(35, 33, 6, 0.002, 0.004, 8e-06, 'buy', 'filled', '2014-05-06', '2014-05-23 10:02:21'),
(38, 33, 6, 0.003, 0.045, 0.000135, 'buy', 'filled', '2014-05-08', '2014-05-23 10:02:20'),
(41, 33, 11, 0.01, 0.9976, 0.009976, 'sell', 'filled', '2014-05-14', '2014-05-25 05:18:53'),
(42, 33, 11, 0.02, 2, 0.04, 'sell', 'filled', '2014-05-14', '2014-05-25 05:18:53'),
(48, 45, 11, 1.65e-06, 37, 6.105e-05, 'buy', 'filled', '2014-05-18', '2014-05-31 16:58:18'),
(49, 18, 42, 1e-08, 1, 1e-08, 'buy', 'active', '2014-05-18', '2014-05-18 13:55:10'),
(50, 19, 42, 1.1e-08, 1, 1.1e-08, 'buy', 'filled', '2014-05-18', '2014-05-26 07:17:15'),
(53, 46, 11, 3.723e-05, 8, 0.00029784, 'buy', 'partly filled', '2014-05-19', '2014-06-09 13:45:44'),
(54, 33, 6, 0.005, 0.1, 0.0005, 'buy', 'filled', '2014-05-23', '2014-05-23 10:00:50'),
(55, 33, 6, 0.0011, 0.05, 5.5e-05, 'sell', 'filled', '2014-05-23', '2014-05-25 03:23:43'),
(56, 33, 6, 0.001103, 0.95, 0.00104785, 'buy', 'filled', '2014-05-25', '2014-05-26 00:50:37'),
(58, 33, 6, 6e-05, 4, 0.00024, 'buy', 'filled', '2014-05-25', '2014-05-26 07:07:37'),
(60, 33, 11, 0.02089, 90.0024, 1.880150136, 'buy', 'filled', '2014-05-25', '2014-05-26 00:50:37'),
(61, 33, 11, 0.021, 9, 0.189, 'sell', 'filled', '2014-05-25', '2014-05-26 00:36:49'),
(62, 30, 42, 3.25e-05, 0.01, 3.25e-07, 'sell', 'filled', '2014-05-25', '2014-05-25 07:58:52'),
(63, 30, 42, 3.25e-05, 0.001, 3.25e-08, 'sell', 'filled', '2014-05-25', '2014-05-25 08:00:10'),
(64, 30, 42, 3.25e-05, 0.0001, 3.25e-09, 'sell', 'filled', '2014-05-25', '2014-05-25 08:00:52'),
(65, 30, 42, 3.22e-05, 0.1, 3.22e-06, 'sell', 'filled', '2014-05-25', '2014-05-25 08:02:45'),
(66, 30, 42, 2e-05, 0.1, 2e-06, 'sell', 'filled', '2014-05-25', '2014-05-25 08:04:03'),
(67, 30, 42, 3.35e-05, 0.1, 3.35e-06, 'sell', 'filled', '2014-05-25', '2014-05-25 08:04:45'),
(68, 30, 42, 3e-05, 0.1, 3e-06, 'buy', 'filled', '2014-05-25', '2014-05-25 08:06:25'),
(69, 30, 42, 3.5e-05, 0.2, 7e-06, 'sell', 'filled', '2014-05-25', '2014-05-25 08:11:51'),
(70, 30, 42, 3.5e-05, 0.2, 7e-06, 'sell', 'filled', '2014-05-25', '2014-05-25 08:12:27'),
(72, 19, 42, 0.00024, 0.03, 7.2e-06, 'buy', 'filled', '2014-05-25', '2014-05-25 08:24:16'),
(73, 19, 42, 0.00029, 0.025, 7.25e-06, 'sell', 'filled', '2014-05-25', '2014-05-25 08:25:52'),
(74, 19, 42, 0.0003, 0.025, 7.5e-06, 'sell', 'filled', '2014-05-25', '2014-05-25 08:32:54'),
(75, 19, 11, 1e-08, 1, 1e-08, 'buy', 'partly filled', '2014-05-25', '2014-05-26 08:00:05'),
(76, 33, 6, 0.03, 1, 0.03, 'sell', 'filled', '2014-05-26', '2014-05-26 00:54:51'),
(77, 33, 6, 0.03, 2, 0.06, 'sell', 'filled', '2014-05-26', '2014-05-26 00:54:52'),
(78, 33, 6, 0.001103, 0.047600000000006, 5.2502800000006e-05, 'sell', 'filled', '2014-05-26', '2014-05-26 00:54:51'),
(86, 29, 42, 8e-08, 7, 5.6e-07, 'sell', 'filled', '2014-05-26', '2014-05-29 16:39:03'),
(87, 36, 11, 1e-08, 100, 1e-06, 'buy', 'active', '2014-05-26', '2014-05-26 01:14:33'),
(88, 32, 11, 1e-06, 99, 9.9e-05, 'buy', 'filled', '2014-05-26', '2014-06-02 18:58:15'),
(91, 19, 42, 0.001, 0.5, 0.0005, 'sell', 'filled', '2014-05-26', '2014-05-26 02:21:37'),
(92, 33, 6, 3e-06, 1, 3e-06, 'buy', 'filled', '2014-05-26', '2014-05-27 07:37:45'),
(93, 19, 6, 1.1e-07, 1, 1.1e-07, 'sell', 'filled', '2014-05-26', '2014-05-26 07:55:58'),
(94, 19, 6, 2.1e-07, 1, 2.1e-07, 'buy', 'filled', '2014-05-26', '2014-05-26 07:56:16'),
(95, 19, 6, 0.02000001, 0.5, 0.01, 'sell', 'partly filled', '2014-05-26', '2014-05-26 07:57:01'),
(96, 19, 6, 1e-08, 1, 1e-08, 'buy', 'active', '2014-05-26', '2014-05-26 08:00:18'),
(98, 33, 42, 2.8e-06, 0.9, 2.52e-06, 'buy', 'filled', '2014-05-26', '2014-05-27 07:46:13'),
(99, 23, 42, 0.00025, 0.99, 0.0002475, 'sell', 'filled', '2014-05-26', '2014-05-26 08:27:08'),
(101, 23, 11, 0.0002, 0.99, 0.000198, 'buy', 'filled', '2014-05-26', '2014-05-26 08:11:04'),
(102, 23, 42, 0.00055, 0.01, 5.5e-06, 'sell', 'filled', '2014-05-26', '2014-05-26 08:27:09'),
(103, 29, 42, 7e-08, 3, 2.1e-07, 'sell', 'filled', '2014-05-27', '2014-05-29 16:31:36'),
(106, 22, 42, 6e-08, 0.1, 1e-08, 'sell', 'filled', '2014-05-27', '2014-05-29 13:30:42'),
(107, 27, 6, 0.002, 3.6, 0.0072, 'buy', 'partly filled', '2014-05-27', '2014-06-06 17:48:06'),
(108, 27, 11, 2.3e-07, 10, 2.3e-06, 'buy', 'active', '2014-05-27', '2014-05-27 09:21:21'),
(109, 44, 11, 2e-07, 9.1, 1.82e-06, 'buy', 'partly filled', '2014-05-27', '2014-06-05 19:08:17'),
(110, 43, 11, 1e-08, 12, 1.2e-07, 'buy', 'active', '2014-05-27', '2014-05-27 09:26:41'),
(111, 23, 11, 5.1e-05, 1, 5.1e-05, 'sell', 'filled', '2014-05-27', '2014-05-31 14:21:25'),
(112, 31, 42, 4e-05, 2, 8e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 03:00:24'),
(113, 31, 42, 3.6e-05, 2, 7.2e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 03:03:55'),
(114, 31, 42, 3.8e-05, 2, 7.6e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 03:18:42'),
(115, 31, 42, 3.8e-05, 2, 7.6e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 03:23:29'),
(118, 31, 42, 3.8e-05, 2, 7.6e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 04:15:27'),
(122, 31, 42, 3e-05, 2.5, 7.5e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 07:28:09'),
(123, 31, 42, 4.1e-05, 2, 8.2e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 07:29:14'),
(124, 31, 42, 2.8e-05, 2, 5.6e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 07:29:58'),
(125, 31, 42, 3.1e-05, 2, 6.2e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 07:30:32'),
(126, 31, 42, 2.7e-05, 2.9, 7.83e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 09:16:46'),
(127, 31, 42, 2.5e-05, 2, 5e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 09:17:28'),
(128, 31, 42, 2.7e-05, 2, 5.4e-05, 'sell', 'filled', '2014-05-28', '2014-05-28 09:17:52'),
(129, 32, 42, 3.627e-05, 1, 3.627e-05, 'buy', 'filled', '2014-05-28', '2014-05-28 15:50:50'),
(136, 33, 6, 5e-06, 0.9, 4.5e-06, 'buy', 'filled', '2014-05-29', '2014-05-30 10:08:21'),
(137, 22, 42, 0.00010881, 0.1, 1.088e-05, 'sell', 'filled', '2014-05-29', '2014-05-29 13:30:50'),
(140, 29, 42, 7e-08, 1, 7e-08, 'buy', 'filled', '2014-05-29', '2014-05-29 16:38:34'),
(141, 29, 42, 7e-08, 2, 1.4e-07, 'buy', 'filled', '2014-05-29', '2014-05-29 23:10:01'),
(142, 29, 42, 7e-08, 3, 2.1e-07, 'buy', 'filled', '2014-05-29', '2014-05-29 23:10:01'),
(143, 29, 42, 7e-08, 3, 2.1e-07, 'buy', 'filled', '2014-05-29', '2014-05-29 23:10:02'),
(152, 46, 42, 0.00149999, 1, 0.00149999, 'buy', 'filled', '2014-05-30', '2014-05-29 17:05:59'),
(153, 46, 42, 0.00149999, 1, 0.00149999, 'sell', 'filled', '2014-05-30', '2014-05-29 17:07:41'),
(154, 35, 42, 4e-08, 1, 4e-08, 'buy', 'filled', '2014-05-30', '2014-05-29 17:24:16'),
(155, 35, 42, 4e-08, 4, 1.6e-07, 'buy', 'filled', '2014-05-30', '2014-05-29 17:24:16'),
(156, 35, 42, 4e-08, 2, 8e-08, 'buy', 'filled', '2014-05-30', '2014-05-29 17:24:16'),
(157, 35, 42, 5e-08, 2, 1e-07, 'buy', 'filled', '2014-05-30', '2014-05-29 17:40:48'),
(158, 29, 42, 8e-08, 100, 8e-06, 'sell', 'filled', '2014-05-30', '2014-05-29 23:28:08'),
(159, 35, 42, 4e-08, 200, 8e-06, 'sell', 'filled', '2014-05-30', '2014-05-29 23:31:06'),
(160, 35, 42, 2e-08, 200, 4e-06, 'buy', 'filled', '2014-05-30', '2014-05-29 23:33:19'),
(163, 25, 42, 0.0035602, 1.2, 0.00427224, 'buy', 'filled', '2014-05-31', '2014-05-31 13:16:20'),
(164, 30, 42, 2.619e-05, 0.5, 1.31e-05, 'buy', 'filled', '2014-05-31', '2014-05-31 13:25:56'),
(166, 20, 42, 4e-08, 2, 8e-08, 'buy', 'filled', '2014-05-31', '2014-05-31 13:41:38'),
(167, 20, 42, 5e-08, 2.2, 1.1e-07, 'sell', 'filled', '2014-05-31', '2014-05-31 13:43:21'),
(170, 24, 42, 0.00151541, 1, 0.00151541, 'sell', 'filled', '2014-05-31', '2014-05-31 13:55:30'),
(171, 24, 42, 0.00151541, 0.5, 0.00075771, 'sell', 'filled', '2014-05-31', '2014-05-31 13:55:30'),
(174, 43, 42, 0.00225406, 0.2, 0.00045081, 'sell', 'filled', '2014-05-31', '2014-05-31 15:16:14'),
(175, 35, 42, 4e-08, 5, 2e-07, 'sell', 'filled', '2014-05-31', '2014-05-31 15:26:57'),
(176, 46, 42, 0.001465, 1, 0.001465, 'buy', 'filled', '2014-05-31', '2014-05-31 15:31:43'),
(177, 46, 42, 0.001464, 0.5, 0.000732, 'sell', 'filled', '2014-05-31', '2014-05-31 15:43:54'),
(178, 41, 42, 0.18574869, 0.2, 0.03714974, 'buy', 'filled', '2014-05-31', '2014-05-31 16:47:58'),
(180, 41, 42, 0.18574865, 0.5, 0.09287432, 'sell', 'filled', '2014-05-31', '2014-05-31 16:52:22'),
(182, 45, 42, 1.55e-06, 2, 3.1e-06, 'sell', 'filled', '2014-06-01', '2014-05-31 17:00:29'),
(183, 32, 42, 3.49e-05, 1, 3.49e-05, 'sell', 'filled', '2014-06-03', '2014-06-02 18:57:53'),
(188, 33, 42, 0.001, 0.001, 1e-06, 'buy', 'filled', '2014-06-03', '2014-06-03 03:28:24'),
(191, 29, 42, 5e-08, 2, 1e-07, 'buy', 'filled', '2014-06-04', '2014-06-03 22:39:20'),
(192, 29, 42, 7e-08, 3, 2.1e-07, 'sell', 'filled', '2014-06-04', '2014-06-03 22:40:18'),
(195, 31, 42, 2e-06, 2, 4e-06, 'buy', 'filled', '2014-06-04', '2014-06-03 22:46:26'),
(196, 31, 42, 1e-06, 2, 2e-06, 'sell', 'filled', '2014-06-04', '2014-06-03 22:47:21'),
(197, 31, 42, 1.2e-06, 2, 2.4e-06, 'buy', 'filled', '2014-06-04', '2014-06-03 22:48:24'),
(198, 32, 42, 1.5e-06, 1, 1.5e-06, 'sell', 'filled', '2014-06-04', '2014-06-03 22:50:43'),
(199, 43, 42, 5e-08, 0.2, 1e-08, 'buy', 'filled', '2014-06-04', '2014-06-03 22:52:58'),
(215, 22, 42, 8e-08, 2, 1.6e-07, 'buy', 'filled', '2014-06-05', '2014-06-05 13:30:27'),
(216, 33, 42, 1e-07, 0.5, 5e-08, 'buy', 'filled', '2014-06-05', '2014-06-06 04:03:09'),
(217, 45, 42, 1.9e-07, 2, 3.8e-07, 'sell', 'filled', '2014-06-06', '2014-06-05 19:10:33'),
(218, 41, 42, 1e-06, 1, 1e-06, 'sell', 'filled', '2014-06-06', '2014-06-05 19:22:03'),
(219, 32, 42, 1e-06, 1.2, 1.2e-06, 'sell', 'filled', '2014-06-06', '2014-06-05 19:24:52'),
(221, 47, 42, 7e-08, 2, 1.4e-07, 'sell', 'filled', '2014-06-06', '2014-06-05 19:29:22'),
(222, 33, 6, 1e-07, 0.5, 5e-08, 'buy', 'filled', '2014-06-06', '2014-06-06 04:03:10'),
(227, 29, 42, 8e-08, 2, 1.6e-07, 'sell', 'filled', '2014-06-07', '2014-06-06 17:21:40'),
(228, 29, 42, 8e-08, 2, 1.6e-07, 'buy', 'filled', '2014-06-07', '2014-06-06 17:22:11'),
(229, 29, 42, 8e-08, 2, 1.6e-07, 'buy', 'filled', '2014-06-07', '2014-06-06 17:22:11'),
(230, 29, 42, 8e-08, 4, 3.2e-07, 'sell', 'filled', '2014-06-07', '2014-06-06 17:23:08'),
(231, 45, 42, 1.8e-07, 3, 5.4e-07, 'sell', 'filled', '2014-06-07', '2014-06-06 17:39:45'),
(232, 41, 42, 1.2e-06, 1, 1.2e-06, 'buy', 'filled', '2014-06-07', '2014-06-06 17:42:07'),
(240, 40, 42, 1e-07, 1, 1e-07, 'sell', 'filled', '2014-06-07', '2014-06-06 18:47:35'),
(241, 40, 42, 8e-08, 1, 8e-08, 'buy', 'filled', '2014-06-07', '2014-06-06 18:48:39'),
(246, 38, 42, 1e-07, 2, 2e-07, 'sell', 'filled', '2014-06-08', '2014-06-07 17:56:23'),
(247, 45, 42, 8e-08, 2, 1.6e-07, 'sell', 'filled', '2014-06-08', '2014-06-07 17:59:55'),
(248, 40, 42, 9e-08, 1, 9e-08, 'sell', 'filled', '2014-06-08', '2014-06-07 18:09:08'),
(249, 32, 42, 8e-07, 1, 8e-07, 'sell', 'filled', '2014-06-08', '2014-06-07 18:10:33'),
(250, 22, 42, 1.1e-07, 2, 2.2e-07, 'sell', 'filled', '2014-06-08', '2014-06-07 18:12:05'),
(251, 45, 42, 1e-07, 2, 2e-07, 'sell', 'filled', '2014-06-08', '2014-06-07 18:25:40'),
(252, 31, 42, 8e-08, 2, 1.6e-07, 'sell', 'filled', '2014-06-09', '2014-06-09 12:50:29'),
(253, 32, 42, 1e-07, 1, 1e-07, 'sell', 'filled', '2014-06-09', '2014-06-09 13:41:16'),
(254, 32, 42, 1.5e-07, 1, 1.5e-07, 'buy', 'filled', '2014-06-09', '2014-06-09 13:42:08'),
(255, 23, 42, 1e-07, 1, 1e-07, 'buy', 'filled', '2014-06-09', '2014-06-09 13:43:18'),
(258, 29, 42, 1e-07, 2, 2e-07, 'sell', 'filled', '2014-06-10', '2014-06-22 14:03:02'),
(259, 45, 42, 9e-07, 2, 1.8e-06, 'buy', 'filled', '2014-06-11', '2014-06-10 23:27:29'),
(260, 47, 42, 1e-07, 2, 2e-07, 'buy', 'filled', '2014-06-11', '2014-06-10 23:28:19'),
(261, 25, 42, 1.5e-07, 1, 1.5e-07, 'sell', 'filled', '2014-06-11', '2014-06-10 23:29:49'),
(263, 38, 42, 1.5e-07, 2, 3e-07, 'buy', 'filled', '2014-06-11', '2014-06-10 23:32:02'),
(264, 38, 42, 1.6e-07, 2, 3.2e-07, 'sell', 'filled', '2014-06-11', '2014-06-10 23:33:02'),
(265, 31, 42, 1e-07, 2, 2e-07, 'buy', 'filled', '2014-06-11', '2014-06-10 23:34:04'),
(267, 43, 42, 1e-07, 0.1, 1e-08, 'buy', 'filled', '2014-06-11', '2014-06-10 23:52:01'),
(269, 33, 6, 0.0002, 15, 0.003, 'sell', 'filled', '2014-06-17', '2014-06-17 01:00:03'),
(271, 33, 6, 0.0003, 0.098, 2.94e-05, 'sell', 'filled', '2014-06-17', '2014-06-17 23:07:17'),
(273, 33, 6, 0.0001, 0.1, 1e-05, 'sell', 'filled', '2014-06-18', '2014-06-17 20:56:22'),
(274, 33, 6, 0.0004, 0.298, 0.0001192, 'sell', 'filled', '2014-06-18', '2014-06-17 23:19:36'),
(275, 33, 6, 0.0003, 0.3, 9e-05, 'buy', 'filled', '2014-06-18', '2014-06-17 23:25:10'),
(276, 33, 6, 0.0003, 1, 0.0003, 'buy', 'filled', '2014-06-18', '2014-06-17 23:25:11'),
(277, 33, 6, 0.0002, 0.2, 4e-05, 'buy', 'filled', '2014-06-18', '2014-06-17 23:28:01'),
(278, 33, 6, 0.0002, 0.2, 4e-05, 'buy', 'filled', '2014-06-18', '2014-06-17 23:28:02'),
(279, 33, 6, 0.003, 0.5, 0.0015, 'sell', 'filled', '2014-06-18', '2014-06-18 00:00:15'),
(280, 33, 6, 0.002, 0.5, 0.001, 'sell', 'filled', '2014-06-18', '2014-06-17 23:36:20'),
(281, 33, 6, 0.002, 0.3, 0.0006, 'buy', 'filled', '2014-06-18', '2014-06-17 23:53:24'),
(282, 33, 6, 0.0025, 0.4, 0.001, 'buy', 'filled', '2014-06-18', '2014-06-17 23:39:38'),
(283, 33, 6, 0.001, 0.3, 0.0003, 'sell', 'filled', '2014-06-18', '2014-06-17 23:59:53'),
(285, 33, 6, 0.0005, 0.3, 0.00015, 'buy', 'filled', '2014-06-18', '2014-06-18 00:00:31'),
(286, 33, 6, 0.004, 0.3, 0.0012, 'sell', 'filled', '2014-06-18', '2014-06-18 00:01:10'),
(287, 33, 6, 0.004, 0.3, 0.0012, 'sell', 'filled', '2014-06-18', '2014-06-18 00:01:11'),
(288, 33, 6, 0.004, 0.1, 0.0004, 'buy', 'filled', '2014-06-18', '2014-06-18 00:11:22'),
(289, 33, 6, 0.004, 0.1, 0.0004, 'sell', 'filled', '2014-06-18', '2014-06-18 00:12:46'),
(290, 33, 6, 0.004, 0.1, 0.0004, 'sell', 'filled', '2014-06-18', '2014-06-18 00:12:47'),
(291, 33, 6, 0.003, 0.1, 0.0003, 'buy', 'filled', '2014-06-18', '2014-06-18 00:13:19'),
(292, 33, 6, 0.003, 0.1, 0.0003, 'buy', 'filled', '2014-06-18', '2014-06-18 00:13:20'),
(293, 33, 6, 0.003, 0.05, 0.00015, 'sell', 'filled', '2014-06-18', '2014-06-18 00:47:50'),
(294, 33, 6, 0.002, 0.05, 0.0001, 'sell', 'filled', '2014-06-18', '2014-06-18 00:42:10'),
(295, 33, 6, 0.002, 0.05, 0.0001, 'sell', 'filled', '2014-06-18', '2014-06-18 00:42:11'),
(296, 33, 6, 0.001, 0.1, 0.0001, 'sell', 'filled', '2014-06-18', '2014-06-18 00:31:07'),
(297, 33, 6, 0.001, 0.1, 0.0001, 'sell', 'filled', '2014-06-18', '2014-06-18 00:31:08'),
(298, 33, 6, 0.001, 0.2, 0.0002, 'sell', 'filled', '2014-06-18', '2014-06-18 00:45:08'),
(299, 33, 6, 0.03, 0.299, 0.00897, 'sell', 'filled', '2014-06-18', '2014-06-18 01:35:50'),
(300, 33, 11, 0.0003, 0.998, 0.0002994, 'buy', 'filled', '2014-06-18', '2014-06-26 02:39:03'),
(301, 33, 11, 0.1, 8.9, 0.89, 'sell', 'filled', '2014-06-18', '2014-10-07 23:07:01'),
(302, 32, 11, 0.1, 48, 4.8, 'sell', 'active', '2014-06-18', '2014-06-18 01:10:39'),
(303, 32, 11, 0.01, 10, 0.1, 'buy', 'active', '2014-06-18', '2014-06-18 01:10:58'),
(304, 33, 6, 0.1, 9, 0.9, 'sell', 'filled', '2014-06-19', '2014-10-07 23:07:02'),
(305, 33, 6, 0.1, 0.1, 0.01, 'sell', 'filled', '2014-06-19', '2014-10-07 23:07:04'),
(318, 33, 6, 0.0003, 30.864, 0.0092592, 'sell', 'filled', '2014-06-26', '2014-10-07 23:06:41'),
(320, 33, 6, 0.0002, 0.999, 0.0001998, 'buy', 'partly filled', '2014-06-26', '2014-06-26 09:02:02'),
(321, 36, 6, 0.01, 5, 0.05, 'sell', 'partly filled', '2014-07-23', '2014-07-23 01:28:53'),
(322, 29, 6, 0.01, 2, 0.02, 'buy', 'active', '2014-07-23', '2014-07-23 01:39:26'),
(323, 29, 11, 0.016, 10, 0.16, 'sell', 'active', '2014-08-09', '2014-08-09 11:57:43'),
(324, 33, 11, 0.00021, 7, 0.00147, 'buy', 'partly filled', '2014-09-15', '2014-09-16 18:47:28'),
(325, 33, 6, 0.00021, 5, 0.00105, 'buy', 'active', '2014-09-17', '2014-09-16 18:46:18'),
(326, 33, 6, 0.0003, 3, 0.0009, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:43'),
(327, 33, 6, 0.00023, 3, 0.00069, 'buy', 'active', '2014-09-17', '2014-09-16 18:47:59'),
(328, 33, 6, 0.00023, 3, 0.00069, 'buy', 'active', '2014-09-17', '2014-09-16 18:48:06'),
(329, 33, 6, 0.00022, 3, 0.00066, 'buy', 'active', '2014-09-17', '2014-09-16 18:48:13'),
(330, 33, 6, 0.000202, 0.8, 0.0001616, 'buy', 'active', '2014-09-17', '2014-09-16 18:48:26'),
(331, 33, 6, 0.000201, 0.8, 0.0001608, 'buy', 'active', '2014-09-17', '2014-09-16 18:48:40'),
(332, 33, 6, 0.000208, 0.8, 0.0001664, 'buy', 'active', '2014-09-17', '2014-09-16 18:48:46'),
(333, 33, 6, 0.000209, 0.8, 0.0001672, 'buy', 'active', '2014-09-17', '2014-09-16 18:48:59'),
(334, 33, 6, 0.000211, 0.8, 0.0001688, 'buy', 'active', '2014-09-17', '2014-09-16 18:49:05'),
(335, 33, 6, 0.000211, 0.2, 4.22e-05, 'buy', 'active', '2014-09-17', '2014-09-16 18:49:20'),
(336, 33, 6, 0.000213, 0.01, 2.13e-06, 'buy', 'active', '2014-09-17', '2014-09-16 18:49:30'),
(337, 33, 6, 0.00031, 0.01, 3.1e-06, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:49'),
(338, 33, 6, 0.00032, 0.02, 6.4e-06, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:50'),
(339, 33, 6, 0.00032, 0.5, 0.00016, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:52'),
(340, 33, 6, 0.00033, 0.52, 0.0001716, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:53'),
(341, 33, 6, 0.00035, 0.52, 0.000182, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:54'),
(342, 33, 6, 0.00036, 0.08, 2.88e-05, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:55'),
(343, 33, 6, 0.00037, 0.04, 1.48e-05, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:57'),
(344, 33, 6, 0.00037, 0.004, 1.48e-06, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:59'),
(345, 33, 6, 0.00039, 0.006, 2.34e-06, 'sell', 'filled', '2014-09-17', '2014-10-07 23:07:00'),
(346, 33, 6, 0.000301, 0.006, 1.806e-06, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:46'),
(347, 33, 6, 0.000307, 0.006, 1.842e-06, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:48'),
(348, 33, 6, 0.000305, 0.006, 1.83e-06, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:47'),
(349, 33, 6, 0.0002, 1000, 0.2, 'buy', 'active', '2014-09-17', '2014-09-17 00:46:55'),
(350, 33, 6, 0.0002, 1000, 0.2, 'buy', 'active', '2014-09-17', '2014-09-17 00:47:01'),
(351, 33, 6, 0.000208, 0.8, 0.0001664, 'buy', 'active', '2014-09-17', '2014-09-17 00:47:17'),
(352, 33, 6, 0.000208, 1000, 0.208, 'buy', 'active', '2014-09-17', '2014-09-17 00:47:24'),
(353, 33, 6, 0.000208, 1000, 0.208, 'buy', 'active', '2014-09-17', '2014-09-17 00:47:29'),
(354, 33, 6, 0.000213, 700, 0.1491, 'buy', 'active', '2014-09-17', '2014-09-17 00:47:41'),
(355, 33, 6, 0.000213, 700, 0.1491, 'buy', 'active', '2014-09-17', '2014-09-17 00:47:45'),
(356, 33, 6, 0.0001, 700, 0.07, 'buy', 'active', '2014-09-17', '2014-09-17 00:48:03'),
(357, 33, 6, 0.0001, 700, 0.07, 'buy', 'active', '2014-09-17', '2014-09-17 00:48:08'),
(358, 33, 6, 0.0003, 4, 0.0012, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:44'),
(359, 33, 6, 0.0003, 9, 0.0027, 'sell', 'filled', '2014-09-17', '2014-10-07 23:06:45'),
(362, 33, 6, 1, 0.1, 0.1, 'buy', 'filled', '2014-10-08', '2014-10-08 19:31:06'),
(363, 33, 6, 1, 0.1, 0.1, 'buy', 'filled', '2014-10-08', '2014-10-08 19:31:08'),
(364, 33, 6, 1, 0.02, 0.02, 'buy', 'filled', '2014-10-08', '2014-10-08 19:31:09'),
(365, 33, 6, 1, 0.002, 0.002, 'buy', 'filled', '2014-10-08', '2014-10-08 19:31:09'),
(366, 33, 6, 1, 0.002, 0.002, 'buy', 'filled', '2014-10-08', '2014-10-08 19:31:10'),
(377, 33, 11, 1, 0.03, 0.03, 'buy', 'filled', '2014-10-09', '2014-10-08 19:31:11'),
(378, 33, 11, 0.12, 5, 0.6, 'buy', 'active', '2014-10-09', '2014-10-08 19:29:42'),
(379, 33, 11, 0.4, 0.546, 0.2184, 'sell', 'partly filled', '2014-10-09', '2014-10-08 19:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_reminders`
--

CREATE TABLE IF NOT EXISTS `password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_reminders`
--

INSERT INTO `password_reminders` (`email`, `token`, `created_at`) VALUES
('trinm1987@gmail.com', 'a729b743987f472a5c8d4d24ca80878e', '2014-05-13 05:54:26'),
('trinm1987@gmail.com', '55b14f3e56d1f642d47383dc7c025ee8', '2014-05-13 05:54:36'),
('trinm1987@gmail.com', 'fa15c89f0e6179cc73a3bc014f8b14bc', '2014-05-14 01:03:55'),
('ntngocthuy88@gmail.com', '15f7d8295a4cd8d0bc0930894e425132', '2014-05-14 01:09:28'),
('trinm1987@gmail.com', 'def64b1f0e1dd81943223763b51be5da', '2014-05-14 01:11:11'),
('trinm1987@gmail.com', '681bea963f94540bfd50e4846cb2174a', '2014-05-14 23:43:30'),
('jason87nguyen@gmail.com', '6fb00908a2333192c86ab801602a13c6', '2014-05-19 08:51:00'),
('ngoc88thuy@gmail.com', '12629092bbbf99707c9935777080e5d3', '2014-05-23 08:03:24'),
('thuynguyen0388@yahoo.com.vn', 'de49e49c5f3ed4b2ec85ef5c2659e33c', '2014-05-23 08:13:28'),
('ngoc88thuy@gmail.com', 'f90051c8ce348927bfbc6c73f3259951', '2014-05-23 08:14:22'),
('trinm1987@gmail.com', '5ad106f8bd46f8461e71f4e73f4c8ce6', '2014-05-24 14:22:11'),
('trinm1987@gmail.com', '7679e1c55df295e1eb1ce9d0b37629e2', '2014-05-24 14:40:13'),
('ngoc88thuy@gmail.com', '5be611fd5a9044830e82ed1e98da0abd', '2014-05-25 04:53:26'),
('trinm1987@gmail.com', '0d041d8244b3c96793468972aa5ec4d1', '2014-05-25 05:16:16'),
('trinm1987@gmail.com', 'a3d0899a246e0fdb20ff48eaf74b92f2', '2014-05-25 14:51:24'),
('trinm1987@gmail.com', '8f515a2fbad1d5cf79ac11afa80ba462', '2014-05-28 02:15:59'),
('cryptopumper@live.com', '2cb63646f2c2f527ed4bede4f84ff828', '2014-05-29 05:51:56'),
('thuy@songnguyen.com.vn', 'f37a745483404320cbd420eadbcc9fb1', '2014-06-04 09:18:40'),
('thuy@songnguyen.com.vn', '4bbaf2c795a635a4d55f7e083c0f8b1b', '2014-06-11 20:06:53'),
('thuy@songnguyen.com.vn', '919d451abd54e5012e68ed19683e9959', '2014-06-11 20:08:38'),
('ntngocthuy88@gmail.com', '76632d69a0d4b6c435845d4195307a20', '2014-06-12 19:50:33'),
('sample@email.tst', '4dfd6fcbfb3fb17a8e5bb91501d6ee1b', '2014-07-22 06:30:41'),
('sample@email.tst', '4013c579d5386dd370ec5510e169ab22', '2014-08-30 18:46:08'),
('sample@email.tst', '2ee44877c36359a48bb245c57ebcd3cc', '2014-08-30 18:50:54'),
('sample@email.tst', 'c8660decb049f4ec63a6728bad980d35', '2014-08-30 18:52:49'),
('sample@email.tst', '93f048de25cee457f0cf2a22d820c262', '2014-08-30 18:52:49'),
('sample@email.tst', '156aa24d8740604a16c405a7e4f1cbbe', '2014-08-30 18:52:50'),
('sample@email.tst', 'be4837266f3158bfe7792dfd556a608a', '2014-08-30 18:52:50'),
('sample@email.tst', '9ecc825b006986b8c954059aa05719cf', '2014-08-30 18:52:50'),
('sample@email.tst', '3e2d6c61d793165207f0e0f31565005f', '2014-08-30 18:52:51'),
('sample@email.tst', 'c48eb7eba4012b04865fd24cb6f090c5', '2014-08-30 18:52:51'),
('sample@email.tst', 'bd5c6eb789e451d969617660c3b638b9', '2014-08-30 18:52:51'),
('sample@email.tst', '265c265a7af7ce87b92ef1a4214d1650', '2014-08-30 18:52:52'),
('sample@email.tst', '62d86df74205de57b1499d71654a9b07', '2014-08-30 18:52:52'),
('sample@email.tst', '966bee41c405573093d4ba36c44bb73a', '2014-08-30 18:52:52'),
('sample@email.tst', '9cb29729add317c314be394c08baeff4', '2014-08-30 18:52:53'),
('sample@email.tst', '6b8afb900b5f39127c7ed08fe134a414', '2014-08-30 18:52:53'),
('sample@email.tst', '348fc33686b3a83ee8c589593e1f5224', '2014-08-30 18:52:53'),
('sample@email.tst', '911212b35432eeaa724df017fefe9b79', '2014-08-30 18:52:54'),
('sample@email.tst', '23becb0f614e6054f8d34bdc37ffc974', '2014-08-30 18:52:54'),
('sample@email.tst', '07ffae011a10300a3cfbba93ecb1b5f9', '2014-08-30 18:52:55'),
('sample@email.tst', '7954b248d7774f5b5e13fda56cb47e15', '2014-08-30 18:52:55'),
('sample@email.tst', 'f71234bc8e39345414a68b59d94b2b97', '2014-08-30 18:52:55'),
('sample@email.tst', '95fbbaefd32f9f97e7d2f34d70f95365', '2014-08-30 18:52:56'),
('sample@email.tst', 'bc2970cf9ffdb9c1fca03fda8ea77bd9', '2014-09-05 02:43:32'),
('eu.sou.chris@hotmail.com', '6cc3cd6a4bc0dd3a8739a123f44c81ff', '2014-09-30 12:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `phpmysqlautobackup`
--

CREATE TABLE IF NOT EXISTS `phpmysqlautobackup` (
  `id` int(11) NOT NULL,
  `version` varchar(6) DEFAULT NULL,
  `time_last_run` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phpmysqlautobackup_log`
--

CREATE TABLE IF NOT EXISTS `phpmysqlautobackup_log` (
  `date` int(11) NOT NULL,
  `bytes` int(11) NOT NULL,
  `lines` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL COMMENT 'post or page',
  `permalink` varchar(255) NOT NULL,
  `title` text,
  `body` longtext,
  `show_menu` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `type`, `permalink`, `title`, `body`, `show_menu`, `created_at`, `updated_at`) VALUES
(2, 'news', 'welcome-to--ecoinstradercom-2', 'Welcome to  Ecoinstrader.com', '<ol>\r\n	<li>This is the new exchange site! ghjghjgh</li>\r\n	<li>khjkhjkhjk</li>\r\n	<li>jhkhjkhj</li>\r\n</ol>\r\n\r\n<p><img alt="" src="/ckfinder/userfiles/images/boy_fly_1-300x240.jpg" style="height:240px; width:300px" /></p>\r\n', NULL, '2014-04-02 00:57:02', '2014-05-15 00:11:33'),
(3, 'news', 'hello-news-4', 'hello news', '<h1><strong>Test news</strong></h1>\r\n\r\n<ol>\r\n	<li>hot news</li>\r\n	<li>new news</li>\r\n</ol>\r\n\r\n<p><img alt="" src="/ckfinder/userfiles/images/art_crank-300x240.jpg" style="height:240px; width:300px" /></p>\r\n', NULL, '2014-04-02 00:57:19', '2014-04-02 02:49:46'),
(4, 'page', 'about-2', 'About', '<h2>about us</h2>\r\n', 1, '2014-04-02 01:17:59', '2014-05-27 09:07:07'),
(8, 'page', 'security', 'Security', '<h3><strong>Offline Funds Storage</strong></h3>\r\n\r\n<p>We store the majority of our customer&#39;s funds in a secure offline wallet, with only a portion available in a &#39;hot&#39; wallet for instant withdrawals. This method vastly improves security at a minor expense of large withdrawals requiring manual processing.</p>\r\n\r\n<h3><strong>DDoS Protection &amp; CDN Caching</strong></h3>\r\n\r\n<p>We utilize a leading DDoS provider for all public facing content and cache all static content on a CDN to provide the fastest possible load times.</p>\r\n\r\n<h3><strong>Logical &amp; Physical Security</strong></h3>\r\n\r\n<p>All website components are logically separated and protected by physical firewalls for increased security. All employees are required to connect to a secure VPN before gaining access to any systems.</p>\r\n\r\n<h3><strong>Secure Website</strong></h3>\r\n\r\n<p>All interaction with the website is required over HTTPS so all communication is encrypted via SSL.</p>\r\n\r\n<h3><strong>Two-Factor Authentication</strong></h3>\r\n\r\n<p>Customers can set up two-factor authentication for accounts with Google Authenticator to provide an extra layer of security.</p>\r\n\r\n<h3><strong>Server Scanning</strong></h3>\r\n\r\n<p>We use an industry recognised PCI (credit card provisioning compliance) scanning service to routinely scan the website to aid in locating any potential security issues.</p>\r\n\r\n<h3><strong>Application Security</strong></h3>\r\n\r\n<p>We use industry standard methods for preventing SQL Injection &amp; XSS attacks on our website. In additional, all passwords &amp; sensitive data are encrypted along with a static &amp; random salt.</p>\r\n', 1, '2014-04-02 02:09:10', '2014-04-02 02:09:10'),
(9, 'page', 'terms-2', 'Terms', '<p>terms</p>\r\n', 1, '2014-04-02 02:09:39', '2014-04-14 21:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Admin'),
(3, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `security_questions`
--

CREATE TABLE IF NOT EXISTS `security_questions` (
`id` int(5) NOT NULL,
  `questions` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `security_questions`
--

INSERT INTO `security_questions` (`id`, `questions`, `type`) VALUES
(1, 'What was the name of your first school?', 1),
(2, 'In what city or town was your first job?', 1),
(3, 'What is the name of your favorite childhood friend?', 1),
(4, 'Who was your childhood hero?', 1),
(5, 'Where were you when you had your first alcoholic drink or cigarette?', 1),
(6, 'Where were you when you had your first kiss?', 1),
(7, 'Where did you meet your significant other?', 1),
(8, 'What is the name of your first pet?', 2),
(9, 'What street did you grow up on?', 2),
(10, 'What was the name of the hospital where you were born?', 2),
(11, 'What was your dream job as a child?', 2),
(12, 'What country is your dream holiday destination?', 2),
(13, 'What was the make and model of your first car?', 2),
(14, 'What is your mother''s maiden name?', 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=63 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'datachart_market_1', 'a:14:{i:0;a:7:{s:4:"date";s:16:"2014-05-01 17:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:1;a:7:{s:4:"date";s:16:"2014-05-01 17:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:2;a:7:{s:4:"date";s:16:"2014-05-01 18:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:3;a:7:{s:4:"date";s:16:"2014-05-01 18:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:4;a:7:{s:4:"date";s:16:"2014-05-01 19:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:5;a:7:{s:4:"date";s:16:"2014-05-01 19:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:6;a:7:{s:4:"date";s:16:"2014-05-01 20:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:7;a:7:{s:4:"date";s:16:"2014-05-01 20:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:8;a:7:{s:4:"date";s:16:"2014-05-01 21:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:9;a:7:{s:4:"date";s:16:"2014-05-01 21:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:10;a:7:{s:4:"date";s:16:"2014-05-01 22:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:11;a:7:{s:4:"date";s:16:"2014-05-01 22:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:12;a:7:{s:4:"date";s:16:"2014-05-01 23:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:13;a:7:{s:4:"date";s:16:"2014-05-01 23:03";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-01 17:00:00\nend_date: 2014-05-01 23:03\n2014-05-01 17:00\n2014-05-01 17:30\n2014-05-01 18:00\n2014-05-01 18:30\n2014-05-01 19:00\n2014-05-01 19:30\n2014-05-01 20:00\n2014-05-01 20:30\n2014-05-01 21:00\n2014-05-01 21:30\n2014-05-01 22:00\n2014-05-01 22:30\n2014-05-01 23:00";}}'),
(2, 'price_open_start_chart', 'a:3:{s:4:"time";s:5:"19:00";s:13:"open_previous";s:10:"0.00003800";s:14:"close_previous";s:10:"0.00003800";}'),
(3, 'recaptcha_privatekey', '6LeltNgSAAAAAM8xyVodzjmDTNN744IyLuh9OfRh'),
(4, 'recaptcha_publickey', '6LeltNgSAAAAABa4YtZkbvCxkiUCrofZ5yO1P0uC'),
(5, 'datachart_market_13', 'a:14:{i:0;a:7:{s:4:"date";s:16:"2014-04-29 20:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:1;a:7:{s:4:"date";s:16:"2014-04-29 20:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:2;a:7:{s:4:"date";s:16:"2014-04-29 21:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:3;a:7:{s:4:"date";s:16:"2014-04-29 21:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:4;a:7:{s:4:"date";s:16:"2014-04-29 22:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:5;a:7:{s:4:"date";s:16:"2014-04-29 22:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:6;a:7:{s:4:"date";s:16:"2014-04-29 23:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:7;a:7:{s:4:"date";s:16:"2014-04-29 23:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:8;a:7:{s:4:"date";s:16:"2014-04-30 00:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:9;a:7:{s:4:"date";s:16:"2014-04-30 00:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:10;a:7:{s:4:"date";s:16:"2014-04-30 01:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:11;a:7:{s:4:"date";s:16:"2014-04-30 01:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:12;a:7:{s:4:"date";s:16:"2014-04-30 02:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:13;a:7:{s:4:"date";s:16:"2014-04-30 02:26";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-04-29 20:00:00\nend_date: 2014-04-30 02:26\n2014-04-29 20:00\n2014-04-29 20:30\n2014-04-29 21:00\n2014-04-29 21:30\n2014-04-29 22:00\n2014-04-29 22:30\n2014-04-29 23:00\n2014-04-29 23:30\n2014-04-30 00:00\n2014-04-30 00:30\n2014-04-30 01:00\n2014-04-30 01:30\n2014-04-30 02:00";}}'),
(6, 'datachart_market_14', 'a:14:{i:0;a:7:{s:4:"date";s:16:"2014-04-29 20:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:1;a:7:{s:4:"date";s:16:"2014-04-29 20:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:2;a:7:{s:4:"date";s:16:"2014-04-29 21:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:3;a:7:{s:4:"date";s:16:"2014-04-29 21:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:4;a:7:{s:4:"date";s:16:"2014-04-29 22:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:5;a:7:{s:4:"date";s:16:"2014-04-29 22:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:6;a:7:{s:4:"date";s:16:"2014-04-29 23:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:7;a:7:{s:4:"date";s:16:"2014-04-29 23:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:8;a:7:{s:4:"date";s:16:"2014-04-30 00:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:9;a:7:{s:4:"date";s:16:"2014-04-30 00:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:10;a:7:{s:4:"date";s:16:"2014-04-30 01:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:11;a:7:{s:4:"date";s:16:"2014-04-30 01:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:12;a:7:{s:4:"date";s:16:"2014-04-30 02:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:13;a:7:{s:4:"date";s:16:"2014-04-30 02:24";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-04-29 20:00:00\nend_date: 2014-04-30 02:24\n2014-04-29 20:00\n2014-04-29 20:30\n2014-04-29 21:00\n2014-04-29 21:30\n2014-04-29 22:00\n2014-04-29 22:30\n2014-04-29 23:00\n2014-04-29 23:30\n2014-04-30 00:00\n2014-04-30 00:30\n2014-04-30 01:00\n2014-04-30 01:30\n2014-04-30 02:00";}}'),
(7, 'disable_withdraw', NULL),
(8, 'amount_btc_per_vote', '0.0002'),
(9, 'site_mode', NULL),
(10, 'datachart_market_11', 'a:14:{i:0;a:7:{s:4:"date";s:16:"2014-04-29 20:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:1;a:7:{s:4:"date";s:16:"2014-04-29 20:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:2;a:7:{s:4:"date";s:16:"2014-04-29 21:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:3;a:7:{s:4:"date";s:16:"2014-04-29 21:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:4;a:7:{s:4:"date";s:16:"2014-04-29 22:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:5;a:7:{s:4:"date";s:16:"2014-04-29 22:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:6;a:7:{s:4:"date";s:16:"2014-04-29 23:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:7;a:7:{s:4:"date";s:16:"2014-04-29 23:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:8;a:7:{s:4:"date";s:16:"2014-04-30 00:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:9;a:7:{s:4:"date";s:16:"2014-04-30 00:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:10;a:7:{s:4:"date";s:16:"2014-04-30 01:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:11;a:7:{s:4:"date";s:16:"2014-04-30 01:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:12;a:7:{s:4:"date";s:16:"2014-04-30 02:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:13;a:7:{s:4:"date";s:16:"2014-04-30 02:24";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-04-29 20:00:00\nend_date: 2014-04-30 02:24\n2014-04-29 20:00\n2014-04-29 20:30\n2014-04-29 21:00\n2014-04-29 21:30\n2014-04-29 22:00\n2014-04-29 22:30\n2014-04-29 23:00\n2014-04-29 23:30\n2014-04-30 00:00\n2014-04-30 00:30\n2014-04-30 01:00\n2014-04-30 01:30\n2014-04-30 02:00";}}'),
(11, 'datachart_market_15', 'a:14:{i:0;a:7:{s:4:"date";s:16:"2014-04-29 20:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:1;a:7:{s:4:"date";s:16:"2014-04-29 20:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:2;a:7:{s:4:"date";s:16:"2014-04-29 21:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:3;a:7:{s:4:"date";s:16:"2014-04-29 21:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:4;a:7:{s:4:"date";s:16:"2014-04-29 22:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:5;a:7:{s:4:"date";s:16:"2014-04-29 22:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:6;a:7:{s:4:"date";s:16:"2014-04-29 23:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:7;a:7:{s:4:"date";s:16:"2014-04-29 23:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:8;a:7:{s:4:"date";s:16:"2014-04-30 00:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:9;a:7:{s:4:"date";s:16:"2014-04-30 00:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:10;a:7:{s:4:"date";s:16:"2014-04-30 01:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:11;a:7:{s:4:"date";s:16:"2014-04-30 01:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:12;a:7:{s:4:"date";s:16:"2014-04-30 02:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:13;a:7:{s:4:"date";s:16:"2014-04-30 02:24";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-04-29 20:00:00\nend_date: 2014-04-30 02:24\n2014-04-29 20:00\n2014-04-29 20:30\n2014-04-29 21:00\n2014-04-29 21:30\n2014-04-29 22:00\n2014-04-29 22:30\n2014-04-29 23:00\n2014-04-29 23:30\n2014-04-30 00:00\n2014-04-30 00:30\n2014-04-30 01:00\n2014-04-30 01:30\n2014-04-30 02:00";}}'),
(12, 'datachart_market_16', 'a:14:{i:0;a:7:{s:4:"date";s:16:"2014-04-29 20:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:1;a:7:{s:4:"date";s:16:"2014-04-29 20:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:2;a:7:{s:4:"date";s:16:"2014-04-29 21:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:3;a:7:{s:4:"date";s:16:"2014-04-29 21:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:4;a:7:{s:4:"date";s:16:"2014-04-29 22:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:5;a:7:{s:4:"date";s:16:"2014-04-29 22:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:6;a:7:{s:4:"date";s:16:"2014-04-29 23:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:7;a:7:{s:4:"date";s:16:"2014-04-29 23:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:8;a:7:{s:4:"date";s:16:"2014-04-30 00:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:9;a:7:{s:4:"date";s:16:"2014-04-30 00:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:10;a:7:{s:4:"date";s:16:"2014-04-30 01:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:11;a:7:{s:4:"date";s:16:"2014-04-30 01:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:12;a:7:{s:4:"date";s:16:"2014-04-30 02:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:13;a:7:{s:4:"date";s:16:"2014-04-30 02:26";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-04-29 20:00:00\nend_date: 2014-04-30 02:26\n2014-04-29 20:00\n2014-04-29 20:30\n2014-04-29 21:00\n2014-04-29 21:30\n2014-04-29 22:00\n2014-04-29 22:30\n2014-04-29 23:00\n2014-04-29 23:30\n2014-04-30 00:00\n2014-04-30 00:30\n2014-04-30 01:00\n2014-04-30 01:30\n2014-04-30 02:00";}}'),
(13, 'datachart_market_9', 'a:14:{i:0;a:7:{s:4:"date";s:16:"2014-04-29 20:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:1;a:7:{s:4:"date";s:16:"2014-04-29 20:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:2;a:7:{s:4:"date";s:16:"2014-04-29 21:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:3;a:7:{s:4:"date";s:16:"2014-04-29 21:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:4;a:7:{s:4:"date";s:16:"2014-04-29 22:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:5;a:7:{s:4:"date";s:16:"2014-04-29 22:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:6;a:7:{s:4:"date";s:16:"2014-04-29 23:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:7;a:7:{s:4:"date";s:16:"2014-04-29 23:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:8;a:7:{s:4:"date";s:16:"2014-04-30 00:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:9;a:7:{s:4:"date";s:16:"2014-04-30 00:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:10;a:7:{s:4:"date";s:16:"2014-04-30 01:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:11;a:7:{s:4:"date";s:16:"2014-04-30 01:30";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:12;a:7:{s:4:"date";s:16:"2014-04-30 02:00";s:3:"low";d:0;s:4:"open";d:0;s:5:"close";d:0;s:4:"high";d:0;s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";}i:13;a:7:{s:4:"date";s:16:"2014-04-30 02:26";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-04-29 20:00:00\nend_date: 2014-04-30 02:26\n2014-04-29 20:00\n2014-04-29 20:30\n2014-04-29 21:00\n2014-04-29 21:30\n2014-04-29 22:00\n2014-04-29 22:30\n2014-04-29 23:00\n2014-04-29 23:30\n2014-04-30 00:00\n2014-04-30 00:30\n2014-04-30 01:00\n2014-04-30 01:30\n2014-04-30 02:00";}}'),
(14, 'datachart_market_46', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00149999";s:4:"open";s:10:"0.00149999";s:5:"close";s:10:"0.00149999";s:4:"high";s:10:"0.00149999";s:15:"exchange_volume";d:4;s:4:"temp";s:0:"";s:14:"close_previous";d:0.0014999900000000000906130726008314013597555458545684814453125;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 17:08";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 11:00:00\nend_date: 2014-05-29 17:08\n2014-05-29 11:00\n2014-05-29 11:30\n2014-05-29 12:00\n2014-05-29 12:30\n2014-05-29 13:00\n2014-05-29 13:30\n2014-05-29 14:00\n2014-05-29 14:30\n2014-05-29 15:00\n2014-05-29 15:30\n2014-05-29 16:00\n2014-05-29 16:30\n2014-05-29 17:00";}}'),
(15, 'datachart_market_19', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:1.0000000000000000209225608301284726753266340892878361046314239501953125E-8;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000001";s:4:"open";s:10:"0.00000001";s:5:"close";s:10:"0.00000001";s:4:"high";s:10:"0.00000001";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000001";}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:14";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:14\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}');
INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(16, 'datachart_market_17', 'a:1181:{i:0;a:8:{s:4:"date";s:16:"2014-05-05 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-05 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-05 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-05 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-05 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-05 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-05 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-05 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-05 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-05 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-05 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-05 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-05 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:8:{s:4:"date";s:16:"2014-05-05 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:14;a:8:{s:4:"date";s:16:"2014-05-05 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:15;a:8:{s:4:"date";s:16:"2014-05-05 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:16;a:8:{s:4:"date";s:16:"2014-05-05 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:17;a:8:{s:4:"date";s:16:"2014-05-05 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:18;a:8:{s:4:"date";s:16:"2014-05-05 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:19;a:8:{s:4:"date";s:16:"2014-05-05 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:20;a:8:{s:4:"date";s:16:"2014-05-05 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:21;a:8:{s:4:"date";s:16:"2014-05-05 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:22;a:8:{s:4:"date";s:16:"2014-05-05 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:23;a:8:{s:4:"date";s:16:"2014-05-05 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:24;a:8:{s:4:"date";s:16:"2014-05-05 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:25;a:8:{s:4:"date";s:16:"2014-05-06 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:26;a:8:{s:4:"date";s:16:"2014-05-06 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:27;a:8:{s:4:"date";s:16:"2014-05-06 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:28;a:8:{s:4:"date";s:16:"2014-05-06 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:29;a:8:{s:4:"date";s:16:"2014-05-06 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:30;a:8:{s:4:"date";s:16:"2014-05-06 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:31;a:8:{s:4:"date";s:16:"2014-05-06 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:32;a:8:{s:4:"date";s:16:"2014-05-06 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:33;a:8:{s:4:"date";s:16:"2014-05-06 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:34;a:8:{s:4:"date";s:16:"2014-05-06 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:35;a:8:{s:4:"date";s:16:"2014-05-06 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:36;a:8:{s:4:"date";s:16:"2014-05-06 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:37;a:8:{s:4:"date";s:16:"2014-05-06 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:38;a:8:{s:4:"date";s:16:"2014-05-06 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:39;a:8:{s:4:"date";s:16:"2014-05-06 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:40;a:8:{s:4:"date";s:16:"2014-05-06 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:41;a:8:{s:4:"date";s:16:"2014-05-06 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:42;a:8:{s:4:"date";s:16:"2014-05-06 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:43;a:8:{s:4:"date";s:16:"2014-05-06 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:44;a:8:{s:4:"date";s:16:"2014-05-06 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:45;a:8:{s:4:"date";s:16:"2014-05-06 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:46;a:8:{s:4:"date";s:16:"2014-05-06 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:47;a:8:{s:4:"date";s:16:"2014-05-06 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:48;a:8:{s:4:"date";s:16:"2014-05-06 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:49;a:8:{s:4:"date";s:16:"2014-05-06 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:50;a:8:{s:4:"date";s:16:"2014-05-06 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:51;a:8:{s:4:"date";s:16:"2014-05-06 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:52;a:8:{s:4:"date";s:16:"2014-05-06 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:53;a:8:{s:4:"date";s:16:"2014-05-06 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:54;a:8:{s:4:"date";s:16:"2014-05-06 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:55;a:8:{s:4:"date";s:16:"2014-05-06 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:56;a:8:{s:4:"date";s:16:"2014-05-06 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:57;a:8:{s:4:"date";s:16:"2014-05-06 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:58;a:8:{s:4:"date";s:16:"2014-05-06 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:59;a:8:{s:4:"date";s:16:"2014-05-06 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:60;a:8:{s:4:"date";s:16:"2014-05-06 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:61;a:8:{s:4:"date";s:16:"2014-05-06 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:62;a:8:{s:4:"date";s:16:"2014-05-06 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:63;a:8:{s:4:"date";s:16:"2014-05-06 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:64;a:8:{s:4:"date";s:16:"2014-05-06 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:65;a:8:{s:4:"date";s:16:"2014-05-06 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:66;a:8:{s:4:"date";s:16:"2014-05-06 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:67;a:8:{s:4:"date";s:16:"2014-05-06 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:68;a:8:{s:4:"date";s:16:"2014-05-06 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:69;a:8:{s:4:"date";s:16:"2014-05-06 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:70;a:8:{s:4:"date";s:16:"2014-05-06 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:71;a:8:{s:4:"date";s:16:"2014-05-06 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:72;a:8:{s:4:"date";s:16:"2014-05-06 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:73;a:8:{s:4:"date";s:16:"2014-05-07 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:74;a:8:{s:4:"date";s:16:"2014-05-07 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:75;a:8:{s:4:"date";s:16:"2014-05-07 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:76;a:8:{s:4:"date";s:16:"2014-05-07 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:77;a:8:{s:4:"date";s:16:"2014-05-07 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:78;a:8:{s:4:"date";s:16:"2014-05-07 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:79;a:8:{s:4:"date";s:16:"2014-05-07 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:80;a:8:{s:4:"date";s:16:"2014-05-07 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:81;a:8:{s:4:"date";s:16:"2014-05-07 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:82;a:8:{s:4:"date";s:16:"2014-05-07 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:83;a:8:{s:4:"date";s:16:"2014-05-07 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:84;a:8:{s:4:"date";s:16:"2014-05-07 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:85;a:8:{s:4:"date";s:16:"2014-05-07 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:86;a:8:{s:4:"date";s:16:"2014-05-07 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:87;a:8:{s:4:"date";s:16:"2014-05-07 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:88;a:8:{s:4:"date";s:16:"2014-05-07 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:89;a:8:{s:4:"date";s:16:"2014-05-07 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:90;a:8:{s:4:"date";s:16:"2014-05-07 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:91;a:8:{s:4:"date";s:16:"2014-05-07 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:92;a:8:{s:4:"date";s:16:"2014-05-07 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:93;a:8:{s:4:"date";s:16:"2014-05-07 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:94;a:8:{s:4:"date";s:16:"2014-05-07 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:95;a:8:{s:4:"date";s:16:"2014-05-07 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:96;a:8:{s:4:"date";s:16:"2014-05-07 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:97;a:8:{s:4:"date";s:16:"2014-05-07 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:98;a:8:{s:4:"date";s:16:"2014-05-07 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:99;a:8:{s:4:"date";s:16:"2014-05-07 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:100;a:8:{s:4:"date";s:16:"2014-05-07 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:101;a:8:{s:4:"date";s:16:"2014-05-07 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:102;a:8:{s:4:"date";s:16:"2014-05-07 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:103;a:8:{s:4:"date";s:16:"2014-05-07 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:104;a:8:{s:4:"date";s:16:"2014-05-07 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:105;a:8:{s:4:"date";s:16:"2014-05-07 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:106;a:8:{s:4:"date";s:16:"2014-05-07 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:107;a:8:{s:4:"date";s:16:"2014-05-07 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:108;a:8:{s:4:"date";s:16:"2014-05-07 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:109;a:8:{s:4:"date";s:16:"2014-05-07 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:110;a:8:{s:4:"date";s:16:"2014-05-07 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:111;a:8:{s:4:"date";s:16:"2014-05-07 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:112;a:8:{s:4:"date";s:16:"2014-05-07 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:113;a:8:{s:4:"date";s:16:"2014-05-07 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:114;a:8:{s:4:"date";s:16:"2014-05-07 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:115;a:8:{s:4:"date";s:16:"2014-05-07 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:116;a:8:{s:4:"date";s:16:"2014-05-07 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:117;a:8:{s:4:"date";s:16:"2014-05-07 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:118;a:8:{s:4:"date";s:16:"2014-05-07 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:119;a:8:{s:4:"date";s:16:"2014-05-07 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:120;a:8:{s:4:"date";s:16:"2014-05-07 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:121;a:8:{s:4:"date";s:16:"2014-05-08 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:122;a:8:{s:4:"date";s:16:"2014-05-08 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:123;a:8:{s:4:"date";s:16:"2014-05-08 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:124;a:8:{s:4:"date";s:16:"2014-05-08 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:125;a:8:{s:4:"date";s:16:"2014-05-08 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:126;a:8:{s:4:"date";s:16:"2014-05-08 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:127;a:8:{s:4:"date";s:16:"2014-05-08 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:128;a:8:{s:4:"date";s:16:"2014-05-08 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:129;a:8:{s:4:"date";s:16:"2014-05-08 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:130;a:8:{s:4:"date";s:16:"2014-05-08 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:131;a:8:{s:4:"date";s:16:"2014-05-08 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:132;a:8:{s:4:"date";s:16:"2014-05-08 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:133;a:8:{s:4:"date";s:16:"2014-05-08 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:134;a:8:{s:4:"date";s:16:"2014-05-08 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:135;a:8:{s:4:"date";s:16:"2014-05-08 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:136;a:8:{s:4:"date";s:16:"2014-05-08 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:137;a:8:{s:4:"date";s:16:"2014-05-08 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:138;a:8:{s:4:"date";s:16:"2014-05-08 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:139;a:8:{s:4:"date";s:16:"2014-05-08 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:140;a:8:{s:4:"date";s:16:"2014-05-08 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:141;a:8:{s:4:"date";s:16:"2014-05-08 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:142;a:8:{s:4:"date";s:16:"2014-05-08 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:143;a:8:{s:4:"date";s:16:"2014-05-08 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:144;a:8:{s:4:"date";s:16:"2014-05-08 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:145;a:8:{s:4:"date";s:16:"2014-05-08 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:146;a:8:{s:4:"date";s:16:"2014-05-08 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:147;a:8:{s:4:"date";s:16:"2014-05-08 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:148;a:8:{s:4:"date";s:16:"2014-05-08 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:149;a:8:{s:4:"date";s:16:"2014-05-08 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:150;a:8:{s:4:"date";s:16:"2014-05-08 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:151;a:8:{s:4:"date";s:16:"2014-05-08 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:152;a:8:{s:4:"date";s:16:"2014-05-08 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:153;a:8:{s:4:"date";s:16:"2014-05-08 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:154;a:8:{s:4:"date";s:16:"2014-05-08 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:155;a:8:{s:4:"date";s:16:"2014-05-08 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:156;a:8:{s:4:"date";s:16:"2014-05-08 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:157;a:8:{s:4:"date";s:16:"2014-05-08 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:158;a:8:{s:4:"date";s:16:"2014-05-08 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:159;a:8:{s:4:"date";s:16:"2014-05-08 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:160;a:8:{s:4:"date";s:16:"2014-05-08 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:161;a:8:{s:4:"date";s:16:"2014-05-08 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:162;a:8:{s:4:"date";s:16:"2014-05-08 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:163;a:8:{s:4:"date";s:16:"2014-05-08 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:164;a:8:{s:4:"date";s:16:"2014-05-08 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:165;a:8:{s:4:"date";s:16:"2014-05-08 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:166;a:8:{s:4:"date";s:16:"2014-05-08 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:167;a:8:{s:4:"date";s:16:"2014-05-08 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:168;a:8:{s:4:"date";s:16:"2014-05-08 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:169;a:8:{s:4:"date";s:16:"2014-05-09 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:170;a:8:{s:4:"date";s:16:"2014-05-09 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:171;a:8:{s:4:"date";s:16:"2014-05-09 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:172;a:8:{s:4:"date";s:16:"2014-05-09 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:173;a:8:{s:4:"date";s:16:"2014-05-09 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:174;a:8:{s:4:"date";s:16:"2014-05-09 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:175;a:8:{s:4:"date";s:16:"2014-05-09 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:176;a:8:{s:4:"date";s:16:"2014-05-09 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:177;a:8:{s:4:"date";s:16:"2014-05-09 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:178;a:8:{s:4:"date";s:16:"2014-05-09 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:179;a:8:{s:4:"date";s:16:"2014-05-09 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:180;a:8:{s:4:"date";s:16:"2014-05-09 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:181;a:8:{s:4:"date";s:16:"2014-05-09 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:182;a:8:{s:4:"date";s:16:"2014-05-09 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:183;a:8:{s:4:"date";s:16:"2014-05-09 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:184;a:8:{s:4:"date";s:16:"2014-05-09 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:185;a:8:{s:4:"date";s:16:"2014-05-09 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:186;a:8:{s:4:"date";s:16:"2014-05-09 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:187;a:8:{s:4:"date";s:16:"2014-05-09 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:188;a:8:{s:4:"date";s:16:"2014-05-09 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:189;a:8:{s:4:"date";s:16:"2014-05-09 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:190;a:8:{s:4:"date";s:16:"2014-05-09 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:191;a:8:{s:4:"date";s:16:"2014-05-09 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:192;a:8:{s:4:"date";s:16:"2014-05-09 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:193;a:8:{s:4:"date";s:16:"2014-05-09 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:194;a:8:{s:4:"date";s:16:"2014-05-09 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:195;a:8:{s:4:"date";s:16:"2014-05-09 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:196;a:8:{s:4:"date";s:16:"2014-05-09 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:197;a:8:{s:4:"date";s:16:"2014-05-09 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:198;a:8:{s:4:"date";s:16:"2014-05-09 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:199;a:8:{s:4:"date";s:16:"2014-05-09 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:200;a:8:{s:4:"date";s:16:"2014-05-09 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:201;a:8:{s:4:"date";s:16:"2014-05-09 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:202;a:8:{s:4:"date";s:16:"2014-05-09 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:203;a:8:{s:4:"date";s:16:"2014-05-09 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:204;a:8:{s:4:"date";s:16:"2014-05-09 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:205;a:8:{s:4:"date";s:16:"2014-05-09 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:206;a:8:{s:4:"date";s:16:"2014-05-09 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:207;a:8:{s:4:"date";s:16:"2014-05-09 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:208;a:8:{s:4:"date";s:16:"2014-05-09 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:209;a:8:{s:4:"date";s:16:"2014-05-09 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:210;a:8:{s:4:"date";s:16:"2014-05-09 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:211;a:8:{s:4:"date";s:16:"2014-05-09 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:212;a:8:{s:4:"date";s:16:"2014-05-09 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:213;a:8:{s:4:"date";s:16:"2014-05-09 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:214;a:8:{s:4:"date";s:16:"2014-05-09 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:215;a:8:{s:4:"date";s:16:"2014-05-09 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:216;a:8:{s:4:"date";s:16:"2014-05-09 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:217;a:8:{s:4:"date";s:16:"2014-05-10 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:218;a:8:{s:4:"date";s:16:"2014-05-10 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:219;a:8:{s:4:"date";s:16:"2014-05-10 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:220;a:8:{s:4:"date";s:16:"2014-05-10 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:221;a:8:{s:4:"date";s:16:"2014-05-10 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:222;a:8:{s:4:"date";s:16:"2014-05-10 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:223;a:8:{s:4:"date";s:16:"2014-05-10 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:224;a:8:{s:4:"date";s:16:"2014-05-10 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:225;a:8:{s:4:"date";s:16:"2014-05-10 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:226;a:8:{s:4:"date";s:16:"2014-05-10 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:227;a:8:{s:4:"date";s:16:"2014-05-10 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:228;a:8:{s:4:"date";s:16:"2014-05-10 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:229;a:8:{s:4:"date";s:16:"2014-05-10 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:230;a:8:{s:4:"date";s:16:"2014-05-10 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:231;a:8:{s:4:"date";s:16:"2014-05-10 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:232;a:8:{s:4:"date";s:16:"2014-05-10 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:233;a:8:{s:4:"date";s:16:"2014-05-10 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:234;a:8:{s:4:"date";s:16:"2014-05-10 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:235;a:8:{s:4:"date";s:16:"2014-05-10 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:236;a:8:{s:4:"date";s:16:"2014-05-10 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:237;a:8:{s:4:"date";s:16:"2014-05-10 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:238;a:8:{s:4:"date";s:16:"2014-05-10 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:239;a:8:{s:4:"date";s:16:"2014-05-10 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:240;a:8:{s:4:"date";s:16:"2014-05-10 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:241;a:8:{s:4:"date";s:16:"2014-05-10 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:242;a:8:{s:4:"date";s:16:"2014-05-10 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:243;a:8:{s:4:"date";s:16:"2014-05-10 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:244;a:8:{s:4:"date";s:16:"2014-05-10 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:245;a:8:{s:4:"date";s:16:"2014-05-10 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:246;a:8:{s:4:"date";s:16:"2014-05-10 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:247;a:8:{s:4:"date";s:16:"2014-05-10 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:248;a:8:{s:4:"date";s:16:"2014-05-10 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:249;a:8:{s:4:"date";s:16:"2014-05-10 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:250;a:8:{s:4:"date";s:16:"2014-05-10 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:251;a:8:{s:4:"date";s:16:"2014-05-10 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:252;a:8:{s:4:"date";s:16:"2014-05-10 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:253;a:8:{s:4:"date";s:16:"2014-05-10 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:254;a:8:{s:4:"date";s:16:"2014-05-10 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:255;a:8:{s:4:"date";s:16:"2014-05-10 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:256;a:8:{s:4:"date";s:16:"2014-05-10 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:257;a:8:{s:4:"date";s:16:"2014-05-10 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:258;a:8:{s:4:"date";s:16:"2014-05-10 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:259;a:8:{s:4:"date";s:16:"2014-05-10 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:260;a:8:{s:4:"date";s:16:"2014-05-10 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:261;a:8:{s:4:"date";s:16:"2014-05-10 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:262;a:8:{s:4:"date";s:16:"2014-05-10 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:263;a:8:{s:4:"date";s:16:"2014-05-10 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:264;a:8:{s:4:"date";s:16:"2014-05-10 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:265;a:8:{s:4:"date";s:16:"2014-05-11 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:266;a:8:{s:4:"date";s:16:"2014-05-11 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:267;a:8:{s:4:"date";s:16:"2014-05-11 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:268;a:8:{s:4:"date";s:16:"2014-05-11 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:269;a:8:{s:4:"date";s:16:"2014-05-11 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:270;a:8:{s:4:"date";s:16:"2014-05-11 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:271;a:8:{s:4:"date";s:16:"2014-05-11 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:272;a:8:{s:4:"date";s:16:"2014-05-11 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:273;a:8:{s:4:"date";s:16:"2014-05-11 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:274;a:8:{s:4:"date";s:16:"2014-05-11 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:275;a:8:{s:4:"date";s:16:"2014-05-11 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:276;a:8:{s:4:"date";s:16:"2014-05-11 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:277;a:8:{s:4:"date";s:16:"2014-05-11 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:278;a:8:{s:4:"date";s:16:"2014-05-11 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:279;a:8:{s:4:"date";s:16:"2014-05-11 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:280;a:8:{s:4:"date";s:16:"2014-05-11 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:');
INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(17, 'datachart_market_33', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:4.999999999999999773740559129431293428069693618454039096832275390625E-7;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 23:30";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:11;a:8:{s:4:"date";s:16:"2014-05-30 00:00";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:12;a:8:{s:4:"date";s:16:"2014-05-30 00:30";s:3:"low";s:10:"0.00000050";s:4:"open";s:10:"0.00000050";s:5:"close";s:10:"0.00000050";s:4:"high";s:10:"0.00000050";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000050";}i:13;a:7:{s:4:"date";s:16:"2014-05-30 00:38";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 18:30:00\nend_date: 2014-05-30 00:38\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00\n2014-05-29 23:30\n2014-05-30 00:00\n2014-05-30 00:30";}}'),
(18, 'datachart_market_25', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:21";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:21\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(19, 'datachart_market_18', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 08:55";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 02:30:00\nend_date: 2014-05-29 08:55\n2014-05-29 02:30\n2014-05-29 03:00\n2014-05-29 03:30\n2014-05-29 04:00\n2014-05-29 04:30\n2014-05-29 05:00\n2014-05-29 05:30\n2014-05-29 06:00\n2014-05-29 06:30\n2014-05-29 07:00\n2014-05-29 07:30\n2014-05-29 08:00\n2014-05-29 08:30";}}'),
(20, 'datachart_market_20', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:34";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:30:00\nend_date: 2014-05-29 23:34\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00\n2014-05-29 23:30";}}'),
(21, 'datachart_market_21', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:15";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:15\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(22, 'datachart_market_22', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:0.000108809999999999996674916735717175697573111392557621002197265625;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00010881";s:4:"open";s:10:"0.00010881";s:5:"close";s:10:"0.00010881";s:4:"high";s:10:"0.00010881";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00010881";}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:17";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:17\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(23, 'datachart_market_23', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:0.000550000000000000033133218391157015503267757594585418701171875;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00055000";s:4:"open";s:10:"0.00055000";s:5:"close";s:10:"0.00055000";s:4:"high";s:10:"0.00055000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00055000";}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:22";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:22\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(24, 'datachart_market_24', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:22";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:22\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(25, 'datachart_market_26', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:16";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:16\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(26, 'datachart_market_27', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:0.00200000000000000004163336342344337026588618755340576171875;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00200000";s:4:"open";s:10:"0.00200000";s:5:"close";s:10:"0.00200000";s:4:"high";s:10:"0.00200000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00200000";}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:22";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:22\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(27, 'datachart_market_28', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:21";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:21\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(28, 'datachart_market_29', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:8.0000000000000001673804866410277814026130727143026888370513916015625E-8;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000008";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000007";s:4:"open";s:10:"0.00000008";s:5:"close";s:10:"0.00000008";s:4:"high";s:10:"0.00000008";s:15:"exchange_volume";d:108;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000008";}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:28";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:28\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(29, 'datachart_market_30', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:3.4999999999999996933876256210993460626923479139804840087890625E-5;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:11;a:8:{s:4:"date";s:16:"2014-05-29 23:30";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:12;a:8:{s:4:"date";s:16:"2014-05-30 00:00";s:3:"low";s:10:"0.00003500";s:4:"open";s:10:"0.00003500";s:5:"close";s:10:"0.00003500";s:4:"high";s:10:"0.00003500";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003500";}i:13;a:7:{s:4:"date";s:16:"2014-05-30 00:15";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 18:00:00\nend_date: 2014-05-30 00:15\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00\n2014-05-29 23:30\n2014-05-30 00:00";}}');
INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(30, 'datachart_market_31', 'a:338:{i:0;a:8:{s:4:"date";s:16:"2014-05-23 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-23 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-23 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-23 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-23 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-23 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-23 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-23 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-23 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-23 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-23 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-23 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-23 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:8:{s:4:"date";s:16:"2014-05-23 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:14;a:8:{s:4:"date";s:16:"2014-05-23 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:15;a:8:{s:4:"date";s:16:"2014-05-23 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:16;a:8:{s:4:"date";s:16:"2014-05-23 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:17;a:8:{s:4:"date";s:16:"2014-05-23 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:18;a:8:{s:4:"date";s:16:"2014-05-23 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:19;a:8:{s:4:"date";s:16:"2014-05-23 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:20;a:8:{s:4:"date";s:16:"2014-05-23 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:21;a:8:{s:4:"date";s:16:"2014-05-23 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:22;a:8:{s:4:"date";s:16:"2014-05-23 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:23;a:8:{s:4:"date";s:16:"2014-05-23 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:24;a:8:{s:4:"date";s:16:"2014-05-23 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:25;a:8:{s:4:"date";s:16:"2014-05-23 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:26;a:8:{s:4:"date";s:16:"2014-05-23 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:27;a:8:{s:4:"date";s:16:"2014-05-23 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:28;a:8:{s:4:"date";s:16:"2014-05-23 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:29;a:8:{s:4:"date";s:16:"2014-05-23 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:30;a:8:{s:4:"date";s:16:"2014-05-23 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:31;a:8:{s:4:"date";s:16:"2014-05-23 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:32;a:8:{s:4:"date";s:16:"2014-05-23 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:33;a:8:{s:4:"date";s:16:"2014-05-23 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:34;a:8:{s:4:"date";s:16:"2014-05-23 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:35;a:8:{s:4:"date";s:16:"2014-05-23 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:36;a:8:{s:4:"date";s:16:"2014-05-23 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:37;a:8:{s:4:"date";s:16:"2014-05-23 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:38;a:8:{s:4:"date";s:16:"2014-05-23 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:39;a:8:{s:4:"date";s:16:"2014-05-23 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:40;a:8:{s:4:"date";s:16:"2014-05-23 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:41;a:8:{s:4:"date";s:16:"2014-05-23 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:42;a:8:{s:4:"date";s:16:"2014-05-23 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:43;a:8:{s:4:"date";s:16:"2014-05-23 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:44;a:8:{s:4:"date";s:16:"2014-05-23 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:45;a:8:{s:4:"date";s:16:"2014-05-23 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:46;a:8:{s:4:"date";s:16:"2014-05-24 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:47;a:8:{s:4:"date";s:16:"2014-05-24 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:48;a:8:{s:4:"date";s:16:"2014-05-24 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:49;a:8:{s:4:"date";s:16:"2014-05-24 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:50;a:8:{s:4:"date";s:16:"2014-05-24 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:51;a:8:{s:4:"date";s:16:"2014-05-24 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:52;a:8:{s:4:"date";s:16:"2014-05-24 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:53;a:8:{s:4:"date";s:16:"2014-05-24 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:54;a:8:{s:4:"date";s:16:"2014-05-24 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:55;a:8:{s:4:"date";s:16:"2014-05-24 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:56;a:8:{s:4:"date";s:16:"2014-05-24 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:57;a:8:{s:4:"date";s:16:"2014-05-24 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:58;a:8:{s:4:"date";s:16:"2014-05-24 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:59;a:8:{s:4:"date";s:16:"2014-05-24 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:60;a:8:{s:4:"date";s:16:"2014-05-24 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:61;a:8:{s:4:"date";s:16:"2014-05-24 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:62;a:8:{s:4:"date";s:16:"2014-05-24 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:63;a:8:{s:4:"date";s:16:"2014-05-24 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:64;a:8:{s:4:"date";s:16:"2014-05-24 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:65;a:8:{s:4:"date";s:16:"2014-05-24 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:66;a:8:{s:4:"date";s:16:"2014-05-24 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:67;a:8:{s:4:"date";s:16:"2014-05-24 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:68;a:8:{s:4:"date";s:16:"2014-05-24 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:69;a:8:{s:4:"date";s:16:"2014-05-24 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:70;a:8:{s:4:"date";s:16:"2014-05-24 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:71;a:8:{s:4:"date";s:16:"2014-05-24 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:72;a:8:{s:4:"date";s:16:"2014-05-24 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:73;a:8:{s:4:"date";s:16:"2014-05-24 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:74;a:8:{s:4:"date";s:16:"2014-05-24 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:75;a:8:{s:4:"date";s:16:"2014-05-24 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:76;a:8:{s:4:"date";s:16:"2014-05-24 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:77;a:8:{s:4:"date";s:16:"2014-05-24 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:78;a:8:{s:4:"date";s:16:"2014-05-24 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:79;a:8:{s:4:"date";s:16:"2014-05-24 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:80;a:8:{s:4:"date";s:16:"2014-05-24 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:81;a:8:{s:4:"date";s:16:"2014-05-24 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:82;a:8:{s:4:"date";s:16:"2014-05-24 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:83;a:8:{s:4:"date";s:16:"2014-05-24 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:84;a:8:{s:4:"date";s:16:"2014-05-24 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:85;a:8:{s:4:"date";s:16:"2014-05-24 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:86;a:8:{s:4:"date";s:16:"2014-05-24 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:87;a:8:{s:4:"date";s:16:"2014-05-24 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:88;a:8:{s:4:"date";s:16:"2014-05-24 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:89;a:8:{s:4:"date";s:16:"2014-05-24 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:90;a:8:{s:4:"date";s:16:"2014-05-24 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:91;a:8:{s:4:"date";s:16:"2014-05-24 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:92;a:8:{s:4:"date";s:16:"2014-05-24 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:93;a:8:{s:4:"date";s:16:"2014-05-24 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:94;a:8:{s:4:"date";s:16:"2014-05-25 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:95;a:8:{s:4:"date";s:16:"2014-05-25 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:96;a:8:{s:4:"date";s:16:"2014-05-25 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:97;a:8:{s:4:"date";s:16:"2014-05-25 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:98;a:8:{s:4:"date";s:16:"2014-05-25 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:99;a:8:{s:4:"date";s:16:"2014-05-25 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:100;a:8:{s:4:"date";s:16:"2014-05-25 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:101;a:8:{s:4:"date";s:16:"2014-05-25 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:102;a:8:{s:4:"date";s:16:"2014-05-25 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:103;a:8:{s:4:"date";s:16:"2014-05-25 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:104;a:8:{s:4:"date";s:16:"2014-05-25 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:105;a:8:{s:4:"date";s:16:"2014-05-25 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:106;a:8:{s:4:"date";s:16:"2014-05-25 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:107;a:8:{s:4:"date";s:16:"2014-05-25 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:108;a:8:{s:4:"date";s:16:"2014-05-25 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:109;a:8:{s:4:"date";s:16:"2014-05-25 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:110;a:8:{s:4:"date";s:16:"2014-05-25 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:111;a:8:{s:4:"date";s:16:"2014-05-25 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:112;a:8:{s:4:"date";s:16:"2014-05-25 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:113;a:8:{s:4:"date";s:16:"2014-05-25 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:114;a:8:{s:4:"date";s:16:"2014-05-25 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:115;a:8:{s:4:"date";s:16:"2014-05-25 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:116;a:8:{s:4:"date";s:16:"2014-05-25 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:117;a:8:{s:4:"date";s:16:"2014-05-25 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:118;a:8:{s:4:"date";s:16:"2014-05-25 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:119;a:8:{s:4:"date";s:16:"2014-05-25 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:120;a:8:{s:4:"date";s:16:"2014-05-25 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:121;a:8:{s:4:"date";s:16:"2014-05-25 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:122;a:8:{s:4:"date";s:16:"2014-05-25 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:123;a:8:{s:4:"date";s:16:"2014-05-25 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:124;a:8:{s:4:"date";s:16:"2014-05-25 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:125;a:8:{s:4:"date";s:16:"2014-05-25 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:126;a:8:{s:4:"date";s:16:"2014-05-25 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:127;a:8:{s:4:"date";s:16:"2014-05-25 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:128;a:8:{s:4:"date";s:16:"2014-05-25 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:129;a:8:{s:4:"date";s:16:"2014-05-25 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:130;a:8:{s:4:"date";s:16:"2014-05-25 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:131;a:8:{s:4:"date";s:16:"2014-05-25 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:132;a:8:{s:4:"date";s:16:"2014-05-25 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:133;a:8:{s:4:"date";s:16:"2014-05-25 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:134;a:8:{s:4:"date";s:16:"2014-05-25 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:135;a:8:{s:4:"date";s:16:"2014-05-25 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:136;a:8:{s:4:"date";s:16:"2014-05-25 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:137;a:8:{s:4:"date";s:16:"2014-05-25 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:138;a:8:{s:4:"date";s:16:"2014-05-25 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:139;a:8:{s:4:"date";s:16:"2014-05-25 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:140;a:8:{s:4:"date";s:16:"2014-05-25 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:141;a:8:{s:4:"date";s:16:"2014-05-25 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:142;a:8:{s:4:"date";s:16:"2014-05-26 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:143;a:8:{s:4:"date";s:16:"2014-05-26 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:144;a:8:{s:4:"date";s:16:"2014-05-26 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:145;a:8:{s:4:"date";s:16:"2014-05-26 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:146;a:8:{s:4:"date";s:16:"2014-05-26 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:147;a:8:{s:4:"date";s:16:"2014-05-26 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:148;a:8:{s:4:"date";s:16:"2014-05-26 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:149;a:8:{s:4:"date";s:16:"2014-05-26 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:150;a:8:{s:4:"date";s:16:"2014-05-26 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:151;a:8:{s:4:"date";s:16:"2014-05-26 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:152;a:8:{s:4:"date";s:16:"2014-05-26 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:153;a:8:{s:4:"date";s:16:"2014-05-26 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:154;a:8:{s:4:"date";s:16:"2014-05-26 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:155;a:8:{s:4:"date";s:16:"2014-05-26 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:156;a:8:{s:4:"date";s:16:"2014-05-26 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:157;a:8:{s:4:"date";s:16:"2014-05-26 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:158;a:8:{s:4:"date";s:16:"2014-05-26 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:159;a:8:{s:4:"date";s:16:"2014-05-26 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:160;a:8:{s:4:"date";s:16:"2014-05-26 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:161;a:8:{s:4:"date";s:16:"2014-05-26 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:162;a:8:{s:4:"date";s:16:"2014-05-26 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:163;a:8:{s:4:"date";s:16:"2014-05-26 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:164;a:8:{s:4:"date";s:16:"2014-05-26 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:165;a:8:{s:4:"date";s:16:"2014-05-26 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:166;a:8:{s:4:"date";s:16:"2014-05-26 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:167;a:8:{s:4:"date";s:16:"2014-05-26 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:168;a:8:{s:4:"date";s:16:"2014-05-26 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:169;a:8:{s:4:"date";s:16:"2014-05-26 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:170;a:8:{s:4:"date";s:16:"2014-05-26 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:171;a:8:{s:4:"date";s:16:"2014-05-26 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:172;a:8:{s:4:"date";s:16:"2014-05-26 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:173;a:8:{s:4:"date";s:16:"2014-05-26 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:174;a:8:{s:4:"date";s:16:"2014-05-26 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:175;a:8:{s:4:"date";s:16:"2014-05-26 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:176;a:8:{s:4:"date";s:16:"2014-05-26 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:177;a:8:{s:4:"date";s:16:"2014-05-26 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:178;a:8:{s:4:"date";s:16:"2014-05-26 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:179;a:8:{s:4:"date";s:16:"2014-05-26 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:180;a:8:{s:4:"date";s:16:"2014-05-26 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:181;a:8:{s:4:"date";s:16:"2014-05-26 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:182;a:8:{s:4:"date";s:16:"2014-05-26 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:183;a:8:{s:4:"date";s:16:"2014-05-26 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:184;a:8:{s:4:"date";s:16:"2014-05-26 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:185;a:8:{s:4:"date";s:16:"2014-05-26 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:186;a:8:{s:4:"date";s:16:"2014-05-26 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:187;a:8:{s:4:"date";s:16:"2014-05-26 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:188;a:8:{s:4:"date";s:16:"2014-05-26 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:189;a:8:{s:4:"date";s:16:"2014-05-26 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:190;a:8:{s:4:"date";s:16:"2014-05-27 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:191;a:8:{s:4:"date";s:16:"2014-05-27 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:192;a:8:{s:4:"date";s:16:"2014-05-27 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:193;a:8:{s:4:"date";s:16:"2014-05-27 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:194;a:8:{s:4:"date";s:16:"2014-05-27 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:195;a:8:{s:4:"date";s:16:"2014-05-27 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:196;a:8:{s:4:"date";s:16:"2014-05-27 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:197;a:8:{s:4:"date";s:16:"2014-05-27 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:198;a:8:{s:4:"date";s:16:"2014-05-27 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:199;a:8:{s:4:"date";s:16:"2014-05-27 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:200;a:8:{s:4:"date";s:16:"2014-05-27 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:201;a:8:{s:4:"date";s:16:"2014-05-27 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:202;a:8:{s:4:"date";s:16:"2014-05-27 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:203;a:8:{s:4:"date";s:16:"2014-05-27 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:204;a:8:{s:4:"date";s:16:"2014-05-27 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:205;a:8:{s:4:"date";s:16:"2014-05-27 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:206;a:8:{s:4:"date";s:16:"2014-05-27 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:207;a:8:{s:4:"date";s:16:"2014-05-27 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:208;a:8:{s:4:"date";s:16:"2014-05-27 09:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:209;a:8:{s:4:"date";s:16:"2014-05-27 09:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:210;a:8:{s:4:"date";s:16:"2014-05-27 10:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:211;a:8:{s:4:"date";s:16:"2014-05-27 10:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:212;a:8:{s:4:"date";s:16:"2014-05-27 11:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:213;a:8:{s:4:"date";s:16:"2014-05-27 11:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:214;a:8:{s:4:"date";s:16:"2014-05-27 12:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:215;a:8:{s:4:"date";s:16:"2014-05-27 12:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:216;a:8:{s:4:"date";s:16:"2014-05-27 13:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:217;a:8:{s:4:"date";s:16:"2014-05-27 13:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:218;a:8:{s:4:"date";s:16:"2014-05-27 14:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:219;a:8:{s:4:"date";s:16:"2014-05-27 14:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:220;a:8:{s:4:"date";s:16:"2014-05-27 15:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:221;a:8:{s:4:"date";s:16:"2014-05-27 15:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:222;a:8:{s:4:"date";s:16:"2014-05-27 16:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:223;a:8:{s:4:"date";s:16:"2014-05-27 16:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:224;a:8:{s:4:"date";s:16:"2014-05-27 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:225;a:8:{s:4:"date";s:16:"2014-05-27 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:226;a:8:{s:4:"date";s:16:"2014-05-27 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:227;a:8:{s:4:"date";s:16:"2014-05-27 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:228;a:8:{s:4:"date";s:16:"2014-05-27 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:229;a:8:{s:4:"date";s:16:"2014-05-27 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:230;a:8:{s:4:"date";s:16:"2014-05-27 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:231;a:8:{s:4:"date";s:16:"2014-05-27 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:232;a:8:{s:4:"date";s:16:"2014-05-27 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:233;a:8:{s:4:"date";s:16:"2014-05-27 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:234;a:8:{s:4:"date";s:16:"2014-05-27 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:235;a:8:{s:4:"date";s:16:"2014-05-27 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:236;a:8:{s:4:"date";s:16:"2014-05-27 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:237;a:8:{s:4:"date";s:16:"2014-05-27 23:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:238;a:8:{s:4:"date";s:16:"2014-05-28 00:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:239;a:8:{s:4:"date";s:16:"2014-05-28 00:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:240;a:8:{s:4:"date";s:16:"2014-05-28 01:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:241;a:8:{s:4:"date";s:16:"2014-05-28 01:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:242;a:8:{s:4:"date";s:16:"2014-05-28 02:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:243;a:8:{s:4:"date";s:16:"2014-05-28 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:244;a:8:{s:4:"date";s:16:"2014-05-28 03:00";s:3:"low";s:10:"0.00003600";s:4:"open";s:10:"0.00003800";s:5:"close";s:10:"0.00003800";s:4:"high";s:10:"0.00004000";s:15:"exchange_volume";d:8;s:4:"temp";s:0:"";s:14:"close_previous";d:3.80000000000000020920765120280293558607809245586395263671875E-5;}i:245;a:8:{s:4:"date";s:16:"2014-05-28 03:30";s:3:"low";s:10:"0.00003800";s:4:"open";s:10:"0.00003800";s:5:"close";s:10:"0.00003800";s:4:"high";s:10:"0.00003800";s:15:"exchange_volume";d:2.20000000000000017763568394002504646778106689453125;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003800";}i:246;a:8:{s:4:"date";s:16:"2014-05-28 04:00";s:3:"low";s:10:"0.00003800";s:4:"open";s:10:"0.00003800";s:5:"close";s:10:"0.00003800";s:4:"high";s:10:"0.00003800";s:15:"exchange_volume";d:2;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003800";}i:247;a:8:{s:4:"date";s:16:"2014-05-28 04:30";s:3:"low";s:10:"0.00003800";s:4:"open";s:10:"0.00003800";s:5:"close";s:10:"0.00003800";s:4:"high";s:10:"0.00003800";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003800";}i:248;a:8:{s:4:"date";s:16:"2014-05-28 05:00";s:3:"low";s:10:"0.00003800";s:4:"open";s:10:"0.00003800";s:5:"close";s:10:"0.00003800";s:4:"high";s:10:"0.00003800";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003800";}i:249;a:8:{s:4:"date";s:16:"2014-05-28 05:30";s:3:"low";s:10:"0.00003800";s:4:"open";s:10:"0.00003800";s:5:"close";s:10:"0.00003800";s:4:"high";s:10:"0.00003800";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003800";}i:250;a:8:{s:4:"date";s:16:"2014-05-28 06:00";s:3:"low";s:10:"0.00003800";s:4:"open";s:10:"0.00003800";s:5:"close";s:10:"0.00003800";s:4:"high";s:10:"0.00003800";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003800";}i:251;a:8:{s:4:"date";s:16:"2014-05-28 06:30";s:3:"low";s:10:"0.00003800";s:4:"open";s:10:"0.00003800";s:5:"close";s:10:"0.00003800";s:4:"high";s:10:"0.00003800";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003800";}i:252;a:8:{s:4:"date";s:16:"2014-05-28 07:00";s:3:"low";s:10:"0.00002800";s:4:"open";s:10:"0.00003800";s:5:"close";s:10:"0.00002800";s:4:"high";s:10:"0.00004100";s:15:"exchange_volume";d:6.5;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003800";}i:253;a:8:{s:4:"date";s:16:"2014-05-28 07:30";s:3:"low";s:10:"0.00003100";s:4:"open";s:10:"0.00002800";s:5:"close";s:10:"0.00003100";s:4:"high";s:10:"0.00003100";s:15:"exchange_volume";d:2;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002800";}i:254;a:8:{s:4:"date";s:16:"2014-05-28 08:00";s:3:"low";s:10:"0.00003100";s:4:"open";s:10:"0.00003100";s:5:"close";s:10:"0.00003100";s:4:"high";s:10:"0.00003100";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003100";}i:255;a:8:{s:4:"date";s:16:"2014-05-28 08:30";s:3:"low";s:10:"0.00003100";s:4:"open";s:10:"0.00003100";s:5:"close";s:10:"0.00003100";s:4:"high";s:10:"0.00003100";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003100";}i:256;a:8:{s:4:"date";s:16:"2014-05-28 09:00";s:3:"low";s:10:"0.00002500";s:4:"open";s:10:"0.00003100";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";d:6.9000000000000003552713678800500929355621337890625;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003100";}i:257;a:8:{s:4:"date";s:16:"2014-05-28 09:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:258;a:8:{s:4:"date";s:16:"2014-05-28 10:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:259;a:8:{s:4:"date";s:16:"2014-05-28 10:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:260;a:8:{s:4:"date";s:16:"2014-05-28 11:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:261;a:8:{s:4:"date";s:16:"2014-05-28 11:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:262;a:8:{s:4:"date";s:16:"2014-05-28 12:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:263;a:8:{s:4:"date";s:16:"2014-05-28 12:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:264;a:8:{s:4:"date";s:16:"2014-05-28 13:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:265;a:8:{s:4:"date";s:16:"2014-05-28 13:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:266;a:8:{s:4:"date";s:16:"2014-05-28 14:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:267;a:8:{s:4:"date";s:16:"2014-05-28 14:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:268;a:8:{s:4:"date";s:16:"2014-05-28 15:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:269;a:8:{s:4:"date";s:16:"2014-05-28 15:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:270;a:8:{s:4:"date";s:16:"2014-05-28 16:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:271;a:8:{s:4:"date";s:16:"2014-05-28 16:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:272;a:8:{s:4:"date";s:16:"2014-05-28 17:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:273;a:8:{s:4:"date";s:16:"2014-05-28 17:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:274;a:8:{s:4:"date";s:16:"2014-05-28 18:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:275;a:8:{s:4:"date";s:16:"2014-05-28 18:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:276;a:8:{s:4:"date";s:16:"2014-05-28 19:00";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00002700";}i:277;a:8:{s:4:"date";s:16:"2014-05-28 19:30";s:3:"low";s:10:"0.00002700";s:4:"open";s:10:"0.00002700";s:5:"close";s:10:"0.00002700";s:4:"high";s:10:"0.00002700";s:15:"exchange_volume";i:0;s:4:"temp";s:0:""');
INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(31, 'datachart_market_32', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:3.62699999999999966328843858942576616755104623734951019287109375E-5;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:11;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:30";s:3:"low";s:10:"0.00003627";s:4:"open";s:10:"0.00003627";s:5:"close";s:10:"0.00003627";s:4:"high";s:10:"0.00003627";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00003627";}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:41";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:30:00\nend_date: 2014-05-29 23:41\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00\n2014-05-29 23:30";}}'),
(32, 'datachart_market_34', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:21";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:21\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(33, 'datachart_market_35', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000004";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";d:2;s:4:"temp";s:0:"";s:14:"close_previous";d:4.00000000000000008369024332051389070130653635715134441852569580078125E-8;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:11;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000005";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000005";s:4:"high";s:10:"0.00000005";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:30";s:3:"low";s:10:"0.00000002";s:4:"open";s:10:"0.00000005";s:5:"close";s:10:"0.00000002";s:4:"high";s:10:"0.00000004";s:15:"exchange_volume";d:400;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000005";}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:35";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:30:00\nend_date: 2014-05-29 23:35\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00\n2014-05-29 23:30";}}'),
(34, 'datachart_market_36', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 08:53";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 02:30:00\nend_date: 2014-05-29 08:53\n2014-05-29 02:30\n2014-05-29 03:00\n2014-05-29 03:30\n2014-05-29 04:00\n2014-05-29 04:30\n2014-05-29 05:00\n2014-05-29 05:30\n2014-05-29 06:00\n2014-05-29 06:30\n2014-05-29 07:00\n2014-05-29 07:30\n2014-05-29 08:00\n2014-05-29 08:30";}}'),
(35, 'datachart_market_37', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 08:56";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 02:30:00\nend_date: 2014-05-29 08:56\n2014-05-29 02:30\n2014-05-29 03:00\n2014-05-29 03:30\n2014-05-29 04:00\n2014-05-29 04:30\n2014-05-29 05:00\n2014-05-29 05:30\n2014-05-29 06:00\n2014-05-29 06:30\n2014-05-29 07:00\n2014-05-29 07:30\n2014-05-29 08:00\n2014-05-29 08:30";}}'),
(36, 'datachart_market_38', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 08:55";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 02:30:00\nend_date: 2014-05-29 08:55\n2014-05-29 02:30\n2014-05-29 03:00\n2014-05-29 03:30\n2014-05-29 04:00\n2014-05-29 04:30\n2014-05-29 05:00\n2014-05-29 05:30\n2014-05-29 06:00\n2014-05-29 06:30\n2014-05-29 07:00\n2014-05-29 07:30\n2014-05-29 08:00\n2014-05-29 08:30";}}'),
(37, 'datachart_market_39', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:14";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:14\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(38, 'datachart_market_40', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 08:58";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 02:30:00\nend_date: 2014-05-29 08:58\n2014-05-29 02:30\n2014-05-29 03:00\n2014-05-29 03:30\n2014-05-29 04:00\n2014-05-29 04:30\n2014-05-29 05:00\n2014-05-29 05:30\n2014-05-29 06:00\n2014-05-29 06:30\n2014-05-29 07:00\n2014-05-29 07:30\n2014-05-29 08:00\n2014-05-29 08:30";}}'),
(39, 'datachart_market_41', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 08:55";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 02:30:00\nend_date: 2014-05-29 08:55\n2014-05-29 02:30\n2014-05-29 03:00\n2014-05-29 03:30\n2014-05-29 04:00\n2014-05-29 04:30\n2014-05-29 05:00\n2014-05-29 05:30\n2014-05-29 06:00\n2014-05-29 06:30\n2014-05-29 07:00\n2014-05-29 07:30\n2014-05-29 08:00\n2014-05-29 08:30";}}'),
(40, 'datachart_market_42', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 17:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 17:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 18:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 18:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 23:16";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 17:00:00\nend_date: 2014-05-29 23:16\n2014-05-29 17:00\n2014-05-29 17:30\n2014-05-29 18:00\n2014-05-29 18:30\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00";}}'),
(41, 'datachart_market_43', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 08:56";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 02:30:00\nend_date: 2014-05-29 08:56\n2014-05-29 02:30\n2014-05-29 03:00\n2014-05-29 03:30\n2014-05-29 04:00\n2014-05-29 04:30\n2014-05-29 05:00\n2014-05-29 05:30\n2014-05-29 06:00\n2014-05-29 06:30\n2014-05-29 07:00\n2014-05-29 07:30\n2014-05-29 08:00\n2014-05-29 08:30";}}'),
(42, 'datachart_market_44', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 07:30";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:1.99999999999999990949622365177251737122787744738161563873291015625E-7;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 08:00";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 08:30";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 09:00";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 09:30";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 10:00";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 10:30";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 11:00";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 11:30";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 12:00";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:10;a:8:{s:4:"date";s:16:"2014-05-29 12:30";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:11;a:8:{s:4:"date";s:16:"2014-05-29 13:00";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:12;a:8:{s:4:"date";s:16:"2014-05-29 13:30";s:3:"low";s:10:"0.00000020";s:4:"open";s:10:"0.00000020";s:5:"close";s:10:"0.00000020";s:4:"high";s:10:"0.00000020";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000020";}i:13;a:7:{s:4:"date";s:16:"2014-05-29 13:36";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 07:30:00\nend_date: 2014-05-29 13:36\n2014-05-29 07:30\n2014-05-29 08:00\n2014-05-29 08:30\n2014-05-29 09:00\n2014-05-29 09:30\n2014-05-29 10:00\n2014-05-29 10:30\n2014-05-29 11:00\n2014-05-29 11:30\n2014-05-29 12:00\n2014-05-29 12:30\n2014-05-29 13:00\n2014-05-29 13:30";}}'),
(43, 'datachart_market_45', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 19:00";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";d:1.650000000000000084153062122893640406573467771522700786590576171875E-6;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 19:30";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:2;a:8:{s:4:"date";s:16:"2014-05-29 20:00";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:3;a:8:{s:4:"date";s:16:"2014-05-29 20:30";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:4;a:8:{s:4:"date";s:16:"2014-05-29 21:00";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:5;a:8:{s:4:"date";s:16:"2014-05-29 21:30";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:6;a:8:{s:4:"date";s:16:"2014-05-29 22:00";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:7;a:8:{s:4:"date";s:16:"2014-05-29 22:30";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:8;a:8:{s:4:"date";s:16:"2014-05-29 23:00";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:9;a:8:{s:4:"date";s:16:"2014-05-29 23:30";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:10;a:8:{s:4:"date";s:16:"2014-05-30 00:00";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:11;a:8:{s:4:"date";s:16:"2014-05-30 00:30";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:12;a:8:{s:4:"date";s:16:"2014-05-30 01:00";s:3:"low";s:10:"0.00000165";s:4:"open";s:10:"0.00000165";s:5:"close";s:10:"0.00000165";s:4:"high";s:10:"0.00000165";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";s:10:"0.00000165";}i:13;a:7:{s:4:"date";s:16:"2014-05-30 01:18";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 19:00:00\nend_date: 2014-05-30 01:18\n2014-05-29 19:00\n2014-05-29 19:30\n2014-05-29 20:00\n2014-05-29 20:30\n2014-05-29 21:00\n2014-05-29 21:30\n2014-05-29 22:00\n2014-05-29 22:30\n2014-05-29 23:00\n2014-05-29 23:30\n2014-05-30 00:00\n2014-05-30 00:30\n2014-05-30 01:00";}}');
INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(44, 'datachart_market_47', 'a:14:{i:0;a:8:{s:4:"date";s:16:"2014-05-29 02:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:1;a:8:{s:4:"date";s:16:"2014-05-29 03:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:2;a:8:{s:4:"date";s:16:"2014-05-29 03:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:3;a:8:{s:4:"date";s:16:"2014-05-29 04:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:4;a:8:{s:4:"date";s:16:"2014-05-29 04:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:5;a:8:{s:4:"date";s:16:"2014-05-29 05:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:6;a:8:{s:4:"date";s:16:"2014-05-29 05:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:7;a:8:{s:4:"date";s:16:"2014-05-29 06:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:8;a:8:{s:4:"date";s:16:"2014-05-29 06:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:9;a:8:{s:4:"date";s:16:"2014-05-29 07:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:10;a:8:{s:4:"date";s:16:"2014-05-29 07:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:11;a:8:{s:4:"date";s:16:"2014-05-29 08:00";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:12;a:8:{s:4:"date";s:16:"2014-05-29 08:30";s:3:"low";s:10:"0.00000000";s:4:"open";s:10:"0.00000000";s:5:"close";s:10:"0.00000000";s:4:"high";s:10:"0.00000000";s:15:"exchange_volume";i:0;s:4:"temp";s:0:"";s:14:"close_previous";i:0;}i:13;a:7:{s:4:"date";s:16:"2014-05-29 08:54";s:3:"low";i:0;s:4:"open";i:0;s:5:"close";i:0;s:4:"high";i:0;s:15:"exchange_volume";i:0;s:4:"temp";s:278:"\nnew_date: 2014-05-29 02:30:00\nend_date: 2014-05-29 08:54\n2014-05-29 02:30\n2014-05-29 03:00\n2014-05-29 03:30\n2014-05-29 04:00\n2014-05-29 04:30\n2014-05-29 05:00\n2014-05-29 05:30\n2014-05-29 06:00\n2014-05-29 06:30\n2014-05-29 07:00\n2014-05-29 07:30\n2014-05-29 08:00\n2014-05-29 08:30";}}'),
(45, 'default_market', '33'),
(52, 'pusher_app_secret', 'fb38676283a45a243b1e'),
(53, 'pusher_app_key', '9fb6abdd0c628d95ed0a'),
(54, 'pusher_app_id', '75097'),
(55, 'price_open_start_chart_19', 'a:3:{s:4:"time";s:5:"01:00";s:13:"open_previous";s:10:"0.00000000";s:14:"close_previous";s:10:"0.00000000";}'),
(56, 'price_open_start_chart_31', 'a:3:{s:4:"time";s:5:"20:00";s:13:"open_previous";s:10:"0.00000000";s:14:"close_previous";s:10:"0.00000000";}'),
(57, 'price_open_start_chart_33', 'a:3:{s:4:"time";s:5:"19:30";s:13:"open_previous";s:10:"0.00000000";s:14:"close_previous";s:10:"0.00000000";}'),
(58, 'disable_points', NULL),
(59, 'percent_point_reward_referred_trade', '1'),
(60, 'percent_point_reward_trade', '4'),
(61, 'point_per_btc', '0.001'),
(62, 'max_amount_funds', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `trade_history`
--

CREATE TABLE IF NOT EXISTS `trade_history` (
`id` int(11) NOT NULL,
  `market_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `type` enum('sell','buy') DEFAULT NULL COMMENT 'buy or sell',
  `amount` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `fee_sell` double DEFAULT NULL,
  `fee_buy` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=106 ;

--
-- Dumping data for table `trade_history`
--

INSERT INTO `trade_history` (`id`, `market_id`, `seller_id`, `buyer_id`, `type`, `amount`, `price`, `fee_sell`, `fee_buy`, `created_at`, `updated_at`) VALUES
(1, 33, 6, 30, 'buy', 2, 1e-07, 5e-10, 5e-10, '2014-06-17', '2014-06-17 00:33:48'),
(2, 33, 6, 6, 'buy', 1, 0.0002, 5e-07, 5e-07, '2014-06-17', '2014-06-17 00:58:51'),
(3, 33, 6, 30, 'buy', 15, 0.0002, 7.5e-06, 7.5e-06, '2014-06-17', '2014-06-17 01:00:03'),
(4, 33, 6, 30, 'sell', 1, 0.0002, 5e-07, 5e-07, '2014-06-17', '2014-06-17 01:02:22'),
(5, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-18', '2014-06-17 20:34:18'),
(6, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-18', '2014-06-17 20:36:02'),
(7, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-18', '2014-06-17 20:50:25'),
(8, 33, 6, 6, 'buy', 0.1, 0.0001, 2.5e-08, 2.5e-08, '2014-06-18', '2014-06-17 20:56:22'),
(9, 33, 6, 6, 'buy', 1.896, 0.0003, 1.422e-06, 1.497e-06, '2014-06-18', '2014-06-17 20:56:23'),
(10, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-18', '2014-06-17 21:01:18'),
(11, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-18', '2014-06-17 21:07:02'),
(12, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-18', '2014-06-17 23:02:40'),
(13, 33, 6, 6, 'buy', 0.098, 0.0003, 7.35e-08, 7.35e-08, '2014-06-18', '2014-06-17 23:07:17'),
(14, 33, 6, 6, 'buy', 0.001, 0.0004, 1e-09, 1e-09, '2014-06-18', '2014-06-17 23:08:20'),
(15, 33, 6, 6, 'buy', 0.001, 0.0004, 1e-09, 1e-09, '2014-06-18', '2014-06-17 23:10:51'),
(16, 33, 6, 6, 'sell', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-18', '2014-06-17 23:14:32'),
(17, 33, 6, 6, 'buy', 0.298, 0.0004, 2.98e-07, 2.98e-07, '2014-06-18', '2014-06-17 23:19:36'),
(18, 33, 6, 6, 'sell', 0.3, 0.0003, 2.25e-07, 2.25e-07, '2014-06-18', '2014-06-17 23:25:10'),
(19, 33, 6, 6, 'sell', 1, 0.0003, 7.5e-07, 7.5e-07, '2014-06-18', '2014-06-17 23:25:11'),
(20, 33, 6, 6, 'sell', 0.2, 0.0002, 1e-07, 1e-07, '2014-06-18', '2014-06-17 23:28:01'),
(21, 33, 6, 6, 'sell', 0.2, 0.0002, 1e-07, 1e-07, '2014-06-18', '2014-06-17 23:28:02'),
(22, 33, 6, 6, 'buy', 0.5, 0.002, 2.5e-06, 2.5e-06, '2014-06-18', '2014-06-17 23:36:20'),
(23, 33, 6, 6, 'sell', 0.1, 0.002, 5e-07, 5e-07, '2014-06-18', '2014-06-17 23:37:39'),
(24, 33, 6, 6, 'sell', 0.4, 0.0025, 2.5e-06, 2.5e-06, '2014-06-18', '2014-06-17 23:39:38'),
(25, 33, 6, 6, 'sell', 0.1, 0.002, 5e-07, 5e-07, '2014-06-18', '2014-06-17 23:39:38'),
(26, 33, 6, 6, 'sell', 0.3, 0.002, 1.5e-06, 1.5e-06, '2014-06-18', '2014-06-17 23:53:24'),
(27, 33, 6, 6, 'buy', 0.3, 0.001, 7.5e-07, 7.5e-07, '2014-06-18', '2014-06-17 23:59:53'),
(28, 33, 6, 6, 'buy', 0.5, 0.003, 3.75e-06, 3.75e-06, '2014-06-18', '2014-06-18 00:00:15'),
(29, 33, 6, 6, 'sell', 0.3, 0.0005, 3.75e-07, 3.75e-07, '2014-06-18', '2014-06-18 00:00:31'),
(30, 33, 6, 6, 'buy', 0.3, 0.004, 3e-06, 3e-06, '2014-06-18', '2014-06-18 00:01:10'),
(31, 33, 6, 6, 'buy', 0.3, 0.004, 3e-06, 3e-06, '2014-06-18', '2014-06-18 00:01:11'),
(32, 33, 6, 6, 'sell', 0.1, 0.004, 1e-06, 1e-06, '2014-06-18', '2014-06-18 00:11:22'),
(33, 33, 6, 6, 'buy', 0.1, 0.004, 1e-06, 1e-06, '2014-06-18', '2014-06-18 00:12:46'),
(34, 33, 6, 6, 'buy', 0.1, 0.004, 1e-06, 1e-06, '2014-06-18', '2014-06-18 00:12:47'),
(35, 33, 6, 6, 'sell', 0.1, 0.003, 7.5e-07, 7.5e-07, '2014-06-18', '2014-06-18 00:13:19'),
(36, 33, 6, 6, 'sell', 0.1, 0.003, 7.5e-07, 7.5e-07, '2014-06-18', '2014-06-18 00:13:20'),
(37, 33, 6, 6, 'buy', 0.05, 0.002, 2.5e-07, 2.5e-07, '2014-06-18', '2014-06-18 00:29:25'),
(38, 33, 6, 6, 'buy', 0.1, 0.001, 2.5e-07, 2.5e-07, '2014-06-18', '2014-06-18 00:31:07'),
(39, 33, 6, 6, 'buy', 0.1, 0.001, 2.5e-07, 2.5e-07, '2014-06-18', '2014-06-18 00:31:08'),
(40, 33, 6, 6, 'buy', 0.05, 0.002, 2.5e-07, 2.5e-07, '2014-06-18', '2014-06-18 00:42:10'),
(41, 33, 6, 6, 'buy', 0.05, 0.002, 2.5e-07, 2.5e-07, '2014-06-18', '2014-06-18 00:42:11'),
(42, 33, 6, 6, 'buy', 0.05, 0.003, 3.75e-07, 1.125e-06, '2014-06-18', '2014-06-18 00:42:12'),
(43, 33, 6, 6, 'buy', 0.2, 0.001, 5e-07, 5e-07, '2014-06-18', '2014-06-18 00:45:08'),
(44, 33, 6, 6, 'buy', 0.05, 0.003, 3.75e-07, 3.75e-07, '2014-06-18', '2014-06-18 00:47:50'),
(45, 33, 6, 6, 'buy', 0.1, 0.03, 7.5e-06, 7.5e-06, '2014-06-18', '2014-06-18 01:02:27'),
(46, 33, 6, 6, 'buy', 0.1, 0.03, 7.5e-06, 7.5e-06, '2014-06-18', '2014-06-18 01:03:05'),
(47, 33, 6, 6, 'buy', 0.001, 0.03, 7.5e-08, 7.5e-08, '2014-06-18', '2014-06-18 01:06:45'),
(48, 33, 6, 11, 'sell', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-18', '2014-06-18 01:11:33'),
(49, 33, 6, 11, 'sell', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-18', '2014-06-18 01:16:10'),
(50, 33, 6, 6, 'buy', 0.299, 0.03, 2.2425e-05, 2.2425e-05, '2014-06-18', '2014-06-18 01:35:50'),
(51, 33, 11, 6, 'buy', 1, 0.1, 0.00025, 0.00025, '2014-06-18', '2014-06-18 01:36:19'),
(52, 29, 42, 51, 'buy', 2, 1e-07, 0, 0, '2014-06-22', '2014-06-22 14:03:02'),
(53, 33, 11, 30, 'buy', 0.1, 0.1, 2.5e-05, 2.5e-05, '2014-06-25', '2014-06-24 18:16:45'),
(54, 33, 6, 11, 'sell', 0.998, 0.0003, 7.485e-07, 7.485e-07, '2014-06-26', '2014-06-26 02:39:03'),
(55, 33, 6, 6, 'buy', 0.002, 0.0003, 1.5e-09, 1.5e-09, '2014-06-26', '2014-06-26 08:50:16'),
(56, 33, 6, 6, 'buy', 0.002, 0.0003, 1.5e-09, 1.5e-09, '2014-06-26', '2014-06-26 08:50:33'),
(57, 33, 6, 6, 'buy', 0.002, 0.0003, 1.5e-09, 1.5e-09, '2014-06-26', '2014-06-26 08:50:41'),
(58, 33, 6, 6, 'buy', 0.002, 0.0003, 1.5e-09, 1.5e-09, '2014-06-26', '2014-06-26 08:50:41'),
(59, 33, 6, 6, 'buy', 0.002, 0.0003, 1.5e-09, 1.5e-09, '2014-06-26', '2014-06-26 08:50:42'),
(60, 33, 6, 6, 'buy', 0.002, 0.0003, 1.5e-09, 1.5e-09, '2014-06-26', '2014-06-26 08:50:42'),
(61, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-26', '2014-06-26 08:51:15'),
(62, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-26', '2014-06-26 08:52:41'),
(63, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-26', '2014-06-26 08:55:29'),
(64, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-26', '2014-06-26 08:56:16'),
(65, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-26', '2014-06-26 08:57:32'),
(66, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-26', '2014-06-26 08:58:20'),
(67, 33, 6, 6, 'sell', 0.001, 0.0002, 5e-10, 5e-10, '2014-06-26', '2014-06-26 09:02:02'),
(68, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-27', '2014-06-26 18:16:53'),
(71, 33, 6, 6, 'buy', 0.1, 0.0003, 7.5e-08, 7.5e-08, '2014-06-30', '2014-06-29 19:30:32'),
(72, 33, 6, 6, 'buy', 0.02, 0.0003, 1.5e-08, 1.5e-08, '2014-06-30', '2014-06-29 20:20:52'),
(73, 33, 6, 6, 'buy', 0.001, 0.0003, 7.5e-10, 7.5e-10, '2014-06-30', '2014-06-29 20:22:34'),
(74, 33, 6, 6, 'buy', 1, 0.0003, 7.5e-07, 7.5e-07, '2014-07-23', '2014-07-23 01:16:07'),
(75, 33, 6, 6, 'buy', 1, 0.0003, 7.5e-07, 7.5e-07, '2014-07-23', '2014-07-23 01:19:30'),
(76, 36, 6, 6, 'buy', 5, 0.01, 0, 0, '2014-07-23', '2014-07-23 01:28:53'),
(77, 33, 6, 11, 'sell', 3, 0.00021, 1.575e-06, 1.575e-06, '2014-09-17', '2014-09-16 18:47:28'),
(78, 33, 6, 11, 'buy', 30.864, 0.0003, 0.00092592, 0.00092592, '2014-10-08', '2014-10-07 23:06:41'),
(79, 33, 6, 11, 'buy', 3, 0.0003, 9e-05, 9e-05, '2014-10-08', '2014-10-07 23:06:43'),
(80, 33, 6, 11, 'buy', 4, 0.0003, 0.00012, 0.00012, '2014-10-08', '2014-10-07 23:06:44'),
(81, 33, 6, 11, 'buy', 9, 0.0003, 0.00027, 0.00027, '2014-10-08', '2014-10-07 23:06:45'),
(82, 33, 6, 11, 'buy', 0.006, 0.000301, 1.806e-07, 1.806e-07, '2014-10-08', '2014-10-07 23:06:46'),
(83, 33, 6, 11, 'buy', 0.006, 0.000305, 1.83e-07, 1.83e-07, '2014-10-08', '2014-10-07 23:06:47'),
(84, 33, 6, 11, 'buy', 0.006, 0.000307, 1.842e-07, 1.842e-07, '2014-10-08', '2014-10-07 23:06:48'),
(85, 33, 6, 11, 'buy', 0.01, 0.00031, 3.1e-07, 3.1e-07, '2014-10-08', '2014-10-07 23:06:49'),
(86, 33, 6, 11, 'buy', 0.02, 0.00032, 6.4e-07, 6.4e-07, '2014-10-08', '2014-10-07 23:06:50'),
(87, 33, 6, 11, 'buy', 0.5, 0.00032, 1.6e-05, 1.6e-05, '2014-10-08', '2014-10-07 23:06:52'),
(88, 33, 6, 11, 'buy', 0.52, 0.00033, 1.716e-05, 1.716e-05, '2014-10-08', '2014-10-07 23:06:53'),
(89, 33, 6, 11, 'buy', 0.52, 0.00035, 1.82e-05, 1.82e-05, '2014-10-08', '2014-10-07 23:06:54'),
(90, 33, 6, 11, 'buy', 0.08, 0.00036, 2.88e-06, 2.88e-06, '2014-10-08', '2014-10-07 23:06:55'),
(91, 33, 6, 11, 'buy', 0.04, 0.00037, 1.48e-06, 1.48e-06, '2014-10-08', '2014-10-07 23:06:57'),
(92, 33, 6, 11, 'buy', 0.004, 0.00037, 1.48e-07, 1.48e-07, '2014-10-08', '2014-10-07 23:06:59'),
(93, 33, 6, 11, 'buy', 0.006, 0.00039, 2.34e-07, 2.34e-07, '2014-10-08', '2014-10-07 23:07:00'),
(94, 33, 11, 11, 'buy', 8.9, 0.1, 0.089, 0.089, '2014-10-08', '2014-10-07 23:07:01'),
(95, 33, 6, 11, 'buy', 9, 0.1, 0.09, 0.09, '2014-10-08', '2014-10-07 23:07:02'),
(96, 33, 6, 6, 'buy', 0.1, 0.1, 0.001, 0.001, '2014-10-08', '2014-10-07 23:07:04'),
(97, 33, 6, 11, 'sell', 0.002, 1, 0.0002, 0.0002, '2014-10-08', '2014-10-08 03:00:50'),
(98, 33, 6, 11, 'sell', 0.02, 1, 0.002, 0.002, '2014-10-08', '2014-10-08 03:01:29'),
(99, 33, 6, 11, 'sell', 0.002, 1, 0.0002, 0.0002, '2014-10-08', '2014-10-08 03:04:15'),
(100, 33, 11, 6, 'sell', 0.1, 1, 0.01, 0.01, '2014-10-09', '2014-10-08 19:31:06'),
(101, 33, 11, 6, 'sell', 0.1, 1, 0.01, 0.01, '2014-10-09', '2014-10-08 19:31:08'),
(102, 33, 11, 6, 'sell', 0.02, 1, 0.002, 0.002, '2014-10-09', '2014-10-08 19:31:09'),
(103, 33, 11, 6, 'sell', 0.002, 1, 0.0002, 0.0002, '2014-10-09', '2014-10-08 19:31:09'),
(104, 33, 11, 6, 'sell', 0.002, 1, 0.0002, 0.0002, '2014-10-09', '2014-10-08 19:31:10'),
(105, 33, 11, 11, 'sell', 0.03, 1, 0.003, 0.003, '2014-10-09', '2014-10-08 19:31:11');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_history`
--

CREATE TABLE IF NOT EXISTS `transfer_history` (
`id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `transfer_history`
--

INSERT INTO `transfer_history` (`id`, `sender`, `receiver`, `wallet_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 6, 30, 1, 1, '2014-05-09 01:18:02', '2014-05-09 01:18:02'),
(2, 6, 30, 1, 1, '2014-05-09 01:19:25', '2014-05-09 01:19:25'),
(3, 6, 30, 1, 1, '2014-05-09 01:24:30', '2014-05-09 01:24:30'),
(4, 30, 6, 1, 1, '2014-05-09 01:30:05', '2014-05-09 01:30:05'),
(5, 6, 30, 1, 0.0001, '2014-05-11 17:53:48', '2014-05-11 17:53:48'),
(6, 6, 30, 1, 0.0001, '2014-05-11 17:54:27', '2014-05-11 17:54:27'),
(7, 6, 30, 1, 0.0001, '2014-05-11 17:55:07', '2014-05-11 17:55:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `authy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastest_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timeout` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `referral` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trade_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_lastlogin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `google_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=87 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `confirmation_code`, `verified`, `confirmed`, `banned`, `authy`, `created_at`, `updated_at`, `lastest_login`, `timeout`, `referral`, `trade_key`, `ip_lastlogin`, `facebook_id`, `google_id`, `remember_token`) VALUES
(6, 'thuy nguyen', '', 'thuythuy', 'thuy@songnguyen.com.vn', '$2y$10$I5C8KaOUzhPVcp55w758ZuEHG51yxsQh7Snly7rHeuMlxaZEUmmhe', '3be3276a334d86c0cb9b783216ac2f3a', 1, 1, 0, '', '2014-03-18 02:31:36', '2014-10-08 18:03:37', '2014-10-08 18:03:37', '24 hours', 'test', '7020a3166ad894ccfa41d91441044854', '192.168.1.1', '', '', NULL),
(9, 'nguyen', '', 'trinm1987', 'trinm1987@gmail.com', '$2y$10$X5Iw6mR1JO3nyAVXMhwKvulVO8JY9rv0CIpDH9tuUEAcLevrTmDgy', '68100e954e5ce1ee71f0e242e7a509bf', 0, 1, 0, '', '2014-03-26 21:18:39', '2014-07-12 23:06:11', '2014-05-14 06:45:54', '45 minutes', '', '8007cd48879e5979ae7df8df7f427e9f', '', '', '', NULL),
(11, 'nguyen', '', 'jason87nguyen', 'jason87nguyen@gmail.com', '$2y$10$XZo9ytkT2wD42rgNwpqMbuDv9yhSxVqoPKI3ciLMJN3iPjHpq6SGa', '949945fafed9f3dd951764341d0ba69f', 0, 1, 0, '', '2014-03-28 03:04:38', '2014-10-08 20:56:41', '2014-10-08 20:56:41', '45 minutes', '', '6ceceeabc545d880cc24209ff04a40f8', '192.168.1.1', '', '', NULL),
(24, 'them', '', 'hntloveit', 'them@songnguyen.com.vn', '$2y$10$I5C8KaOUzhPVcp55w758ZuEHG51yxsQh7Snly7rHeuMlxaZEUmmhe', '2facaa1e506cb54fbc8c0f023704aae7', 0, 1, 0, '', '2014-04-09 01:19:29', '2014-04-25 14:09:21', '2014-04-25 14:09:21', '', 'test', '', '', '', '', NULL),
(31, 'Neha', '', 'nhverma', 'nhverma7@gmail.com', '$2y$10$6ICbbRnOs78Ka1iBrPQ.MORO9YPR8ks3INxahmjwP8I1WtnfkbZ4u', '719fe8317b2ad0b553a5fe52dc1ab1be', 1, 1, 0, '', '2014-05-14 06:31:43', '2014-07-12 23:06:02', '2014-05-16 14:04:50', '', '', 'c1c0b2acd1bc27ea32ac39f43b1de134', '', '', '', NULL),
(32, 'Ashutosh Kumar', '', 'ashutosh1234', 'ashuhunk10@gmail.com', '$2y$10$j58Fd8IdY.ODCg.3ke4HuO7dCX/SF2Ymaa3M8fREZrtgdKD2V8kzu', '131dd9ca9ba197bd2ac252402c541c0d', 0, 1, 1, '', '2014-05-14 06:46:31', '2014-05-16 14:38:49', '2014-05-16 14:38:49', '', '', '8f2cb77904176e6b4a8150db0f1afe11', '', '', '', NULL),
(33, 'io', '', 'iotu', 'io@io.com', '$2y$10$8ArR2w7qBUHZBBYTs5Zf1eX/pJJMLQYYGTN1pL9C8bj9OEJVvIuq2', 'c4954b1d798dc9dc7ccfc6658915c3a0', 0, 0, 0, '', '2014-05-14 16:41:13', '2014-05-14 16:41:13', '0000-00-00 00:00:00', '', '', 'c4a1f833cceb6596febcac9a8027f2d9', '', '', '', NULL),
(34, 'jiguli', '', 'jiguli', 'a3676313@drdrb.net', '$2y$10$/8Zo6e2r7Wxdbbjffx3znuONBpkFi9oQs5ijSYzf6L8vNwxspjhw2', 'e27624f7220e1d768afadaa6fd3d3edb', 0, 0, 0, '', '2014-05-14 17:49:40', '2014-05-14 17:49:40', '0000-00-00 00:00:00', '', '', '826921dea4449d11f22c24e724b6d000', '', '', '', NULL),
(35, 'Rovs Aguilar', '', 'SmartRov', 'roves25@yahoo.com', '$2y$10$/MeomLI3E2kCyoYT4NCBOuDaeq8Fn5cX0rMbVN0GsJhdRuGF3l9CO', 'f6fdefa181d1a2fa4e38f063a5234e1a', 0, 1, 0, '', '2014-05-15 00:42:21', '2014-05-26 14:49:27', '2014-05-26 14:49:27', '', '', 'e120fcca88a0de1d8e2e667f3b64f33b', '', '', '', NULL),
(36, 'diemphuong', '', 'diemphuong', 'diemphuongcqtv1987@gmail.com', '$2y$10$jARtLa7CJLxr5cMJ8c55Xe.jYb5mr8Fno1v8rJrpeeKSlOE0VQyZK', '285fd09207effb007efa4fdf268b3266', 0, 1, 0, '', '2014-05-15 01:11:20', '2014-05-15 01:11:20', '0000-00-00 00:00:00', '', '', '7773e59bf24437d1fb66914838254b4e', '', '', '', NULL),
(37, 'Nguyen Tri', '', 'nguyenminhtri_mekong', 'nguyenminhtri_mekong@yahoo.com', '$2y$10$GisT3HpoY9o6WFRW0o7hxOw0VjgoCThNIboV/vVOSq9N7dXG1idA2', '237e3f72977f252b1d77923938e74ad3', 0, 0, 0, '', '2014-05-15 02:22:52', '2014-05-15 02:22:52', '0000-00-00 00:00:00', '', '', 'a499fa60587c0be8fa9f59496acf4327', '', '', '', NULL),
(39, 'Smart Rovie', '', 'SmartRovie', 'rovieaguis@gmail.com', '$2y$10$LJRPCXJxTt4hqRigy0IxBOlvifF4pzQtCHwuXgsbIhHCbZY35qVOK', '870a1562324db41f69087a0a18db72da', 0, 1, 0, '', '2014-05-16 05:11:01', '2014-05-17 15:16:06', '2014-05-17 15:16:06', '', '', '3d459e30444b9d00daf7c466e7b5aa04', '', '', '', NULL),
(42, 'marcus marcus', '', 'marcus', 'Monex247@yahoo.com', '$2y$10$GgbdRvwol/MO2ortTy2Bd.ywfJjlO2vIskvkCbID52jT2BEgbrvYi', 'f4dc43d24b4c2c529333baf93c63b75b', 0, 1, 0, '', '2014-05-18 01:26:20', '2014-06-10 23:25:22', '2014-06-10 23:25:22', '', '', '35c2cce2d70db29121e57806c090d995', '49.145.124.213', '', '', NULL),
(44, 'retuled', '', 'retuled', 'retuled@gmail.com', '$2y$10$B61CWJq7KZPHq19upJrYu..izohvhVzCPAFKwQl5eqQJIBj8bx9Oq', 'e39904996cab876808d270bcb3efadf1', 0, 1, 0, '', '2014-05-23 20:42:57', '2014-05-28 22:28:44', '2014-05-28 22:28:34', '24 hours', '', '2a6029d6110ceba3ac2c9dff1e77ca9e', '', '', '', NULL),
(45, 'Harry Potter', '', 'harrypotter', 'cryptosciminer@gmail.com', '$2y$10$qSBK9FlTAjFmLtKDdMtBfudQ.ulQPOdapcXPbFaElUfZHuhb86Xj.', 'e298337c3e87d103530320e6b91dbd28', 0, 1, 0, '', '2014-05-25 06:45:25', '2014-05-25 07:49:23', '2014-05-25 07:49:23', '', '', 'db3552faf1e2d44a51f09eedfbc0ad6c', '', '', '', NULL),
(46, 'Terence Poon', '', 'terencepoon', 'terencecwpoon@gmail.com', '$2y$10$qqdKgxhngO44N.jKqObfVuGcqBgm7a4q576n6AWbewrn36NMRbrTm', '1819f7d2ba5b8ab40b08bbe65bdd58f8', 0, 1, 0, '', '2014-05-28 23:05:33', '2014-05-28 23:06:42', '2014-05-28 23:06:42', '', '', 'eb3a778cc3367f9fe67bbefaf16928a1', '', '', '', NULL),
(47, 'BITCLICKS', '', 'Testing12', 'cryptopumper@live.com', '$2y$10$ZOIQS3bsge3b5wD44VnHBuDMQtGf96AmEjDZXyFA2l8HDFjiwPJWm', 'bca309a9b4b3663a80e833d8e94ee3a4', 0, 0, 0, '', '2014-05-29 05:32:14', '2014-05-29 05:32:14', '0000-00-00 00:00:00', '', '', 'd6b266585774d1234102fdf5eb180be3', '', '', '', NULL),
(48, 'BitClick', '', 'Testing', 'cryptopump@live.com', '$2y$10$FU6Yeswd9CPkmaT6Fzl/JOq3p.QQW6JSdxIN4tXefhaMkYt2FO9Ne', 'f6cda5f94df43f88df369116808d1ebf', 0, 1, 0, '', '2014-05-29 06:05:36', '2014-05-29 06:51:13', '2014-05-29 06:51:13', '', '', 'cef41307e32fbc7c583d7451658b5472', '', '', '', NULL),
(49, 'le thanh long', '', 'ltlong1709', 'libra.nguyen634@gmail.com', '$2y$10$8WOW9tDAQvmWR8hjxgVDNOP1/sNkt7dB9cAs6Nw/vHYFOpFCgqq8.', '4eef2ba8008f163b459e5cb7b3617028', 0, 1, 1, '', '2014-05-31 00:28:19', '2014-06-04 15:16:19', '2014-06-04 15:16:19', '1 hour', '', 'b89fc7aa7044a5d958e1745debf5835a', '27.73.87.49', '', '', NULL),
(50, 'hamasugu', '', 'hamasugu', 'suguri0603@hotmail.com', '$2y$10$yaMwNQTUctaltAJlq97TPuXjHLwFFbn6vNeeLch2ktoTSEPnmdqbK', 'b69b706f4f183e13f4f85ba36d8b2525', 1, 1, 0, '', '2014-06-04 04:35:43', '2014-06-24 11:18:15', '2014-06-24 11:18:15', '', '', 'db5ff271cc8da790ae2c28d941221fde', '123.218.148.104', '', '', NULL),
(55, 'demo', 'demo', 'demo', 'demo@scriptphp87.com', '$2y$10$OOXv7e9jbCbjE5D7xpzn2OsclPu5JfKYXPma8n87ovICfg9FZEeyW', '0f622fce045daebdc94fa82c9919f6cf', 0, 1, 0, '', '2014-06-22 14:09:46', '2014-10-09 16:35:41', '2014-10-09 16:35:41', '', NULL, '', '148.167.132.244', '', '', NULL),
(79, 'Thuy', 'Nguyen', '118348044297365377026', 'ngoc88thuy@gmail.com', '$2y$10$0GI.xbI7E2BN1YYw6tq/m.rTc1ZTTu9hfPvao4Xi3RbrAMNYdLhJG', '9da08146358729beb6b9852b7af8a695', 0, 1, 1, '', '2014-06-23 19:43:13', '2014-06-30 20:23:23', '2014-06-23 19:43:13', '', '', '81e89321f9597afe3f49dc604cf43556', '115.78.235.170', '', '118348044297365377026', NULL),
(80, 'Lorenzo', 'Walz', 'ncsupanda', 'ffapandaman@gmail.com', '$2y$10$t95B0T3FaBAZVe2LQFoQWesemOswbsl7QyeC3im/pgSCtskcNSSYe', 'db8b447cffafffa1ffe57b9729b69b0b', 0, 0, 0, '', '2014-07-11 16:19:45', '2014-07-11 16:19:45', '0000-00-00 00:00:00', '', '', '199fabed40e85877ff2610af55e2e1de', '152.7.70.66', '', '', NULL),
(81, 'test123''', 'test''', 'fuckyou123', 'hello@yopmail.com', '$2y$10$2g.m2EqN7mCyKes4twIJ.OWDLWU1qo.QoSiU.B7ut.6lTN2TX/WR6', 'a92e3eb31b1f62bfe02478218ce00f86', 0, 1, 0, '', '2014-07-22 03:27:35', '2014-07-22 03:33:44', '2014-07-22 03:28:50', '45 minutes', '', '18ef5bb82dc33c9fb7601ececc5a5464', '77.66.110.106', '', '', NULL),
(82, 'uabinfgc', 'pnnxwwhj', 'nhqbojpy', 'sample@email.tst', '$2y$10$nwNcjEX3tOeraAkdBHUdeugEMqD8H8ExD8BE6Bcmx86zT8h7aOaDe', 'b6d02a1044a30dd6add901aca93946c9', 0, 0, 0, '', '2014-07-22 06:30:14', '2014-07-22 06:30:14', '0000-00-00 00:00:00', '', '', 'ccdcf619df3f220b08e3e613fec0046b', '93.174.95.82', '', '', NULL),
(83, '1', '2', '12345678', '123456@ya.ru', '$2y$10$Z2WsitDmIwgfIASfNbynRe3f6FSE5POovYs9zqqjzVpASLuE8sISe', '49ff951dfad55c5178ea2854e2c23716', 0, 1, 0, '', '2014-08-01 03:53:36', '2014-08-01 04:16:37', '2014-08-01 04:16:37', '', NULL, '', '31.148.255.230', '', '', NULL),
(84, 'Carsen', 'Klock', '546334282', 'carsenk@gmail.com', '$2y$10$oVGNSbBawDweXRhaSs8l/OxSotJqQ8yA02vBz.xjY3v7hYBNUXqTW', 'e5d384d4a88093373730d512c815ff9d', 0, 1, 0, '', '2014-09-03 02:00:32', '2014-09-03 02:00:32', '2014-09-03 02:00:32', '', '', 'f10842b68ccd6462dca79748dc059da9', '70.208.4.20', '546334282', '', NULL),
(85, 'Uma', 'Devi', '100004965575626', 'umadevi@osiztechnologies.com', '$2y$10$bDqjzc4FKVy68affBFIEcOeN4PYyR.8kP8F3i8tnSIsJvlS.d0nBu', '976b6997f760aebad5604f88be42d424', 0, 1, 0, '', '2014-09-26 02:06:53', '2014-09-26 02:06:53', '2014-09-26 02:06:53', '', '', 'a405cc038ddbd087574f63f0208858f4', '59.97.112.46', '100004965575626', '', NULL),
(86, 'bill', 'smith', 'billsmith7', 'eu.sou.chris@hotmail.com', '$2y$10$813fvxolicBYF5EjDiSwauw3aTm9wyo4XJXH9uHJqRYXw8sxiosbe', '708cc28f7dde080439709851388dc539', 1, 1, 0, '', '2014-09-30 12:17:23', '2014-09-30 12:33:31', '2014-09-30 12:33:31', '', '', '8b97985b63c30aae42880292cdef7540', '148.167.132.244', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>';

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(0, 0),
(4, 3),
(5, 3),
(7, 3),
(11, 1),
(11, 3),
(8, 3),
(24, 1),
(31, 3),
(33, 3),
(34, 3),
(35, 3),
(31, 3),
(9, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(39, 3),
(44, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(6, 1),
(6, 3),
(42, 3),
(50, 3),
(55, 1),
(55, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(83, 1),
(84, 3),
(85, 3),
(86, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_address_deposit`
--

CREATE TABLE IF NOT EXISTS `user_address_deposit` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `addr_deposit` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `user_address_deposit`
--

INSERT INTO `user_address_deposit` (`id`, `user_id`, `wallet_id`, `addr_deposit`) VALUES
(1, 11, 12, 'BoLoJpXo3GqxEWPEuFACa37y52tiVQ4B5v'),
(2, 50, 12, 'Beds5BHKkxPdf278UUkutzaNVaXmHeusQU'),
(6, 6, 1, '12Mv2nnt9wUtfV8bt1LZLkcSEez76cCAYC'),
(7, 6, 12, 'BXn6KRp3nc296RE8i8PeVdp1w7kWy11qST'),
(8, 6, 24, 'LPsK8nLFZ51Z3w3HiYcLX6GxMbP1eR6xkA'),
(10, 6, 11, 'B73ZTotAMadqTtq3EX5xW9YSEvt9xH2exb'),
(11, 6, 17, 'XnXSWQ4E6iSV5q79QGpgS5mjQVUBYQrZFr'),
(12, 6, 22, 'EQJTWwcM27fB4iPViguvuTYpuHyTA7rm2S'),
(13, 6, 13, '6xuzM8eSuWRoXBuwCiXTWBSHhYMpnTWhh7'),
(16, 6, 20, 'i9r3gcFKrhLPZt3hPpszZQzqH2McrjhYg5'),
(17, 6, 19, 'mXtXPWvLCuviUqtYZgaG77vXkD2nerG3Qw'),
(19, 6, 9, 'oW5r215GFkS6JtRhTQabRcUB2RrHc4xts5'),
(20, 6, 16, 'PLejEUk1nNAPcuceP73Kiqm3Wq2hWqhTrn'),
(21, 6, 14, 'AcSbrzXGhcrwLiTgTm89yBZD9QVLPyy6zZ'),
(22, 6, 10, 'RUi54j3s7JG7DxpyyUsdUe6AuJPdcKc8tN'),
(23, 6, 15, 'VnprvXrpdqXvDEadGMKEGsQ1bBcHpFcSx3'),
(24, 6, 18, 'WUpp8ow8Dzvj4JBZT4A2T4NcBw5hnRvFEc'),
(25, 6, 21, 'QVko1Y4oVGUyCn3QcJ9Mhv8b6oWakxR1cd'),
(28, 11, 8, 'DBbp75iNbVz4aWPwAZFBzkDe6qxoqWHkDG');

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

CREATE TABLE IF NOT EXISTS `user_information` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_1` varchar(255) COLLATE utf8_bin NOT NULL,
  `address_2` varchar(255) COLLATE utf8_bin NOT NULL,
  `city` varchar(255) COLLATE utf8_bin NOT NULL,
  `postal_code` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8_bin NOT NULL,
  `state` varchar(255) COLLATE utf8_bin NOT NULL,
  `date_birth` date NOT NULL,
  `government_photo_1` varchar(255) COLLATE utf8_bin NOT NULL,
  `government_photo_2` varchar(255) COLLATE utf8_bin NOT NULL,
  `utility_bill` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`id`, `user_id`, `address_1`, `address_2`, `city`, `postal_code`, `country`, `state`, `date_birth`, `government_photo_1`, `government_photo_2`, `utility_bill`) VALUES
(1, 6, 'can tho', '', 'can tho', 92000, 'Việt Nam', 'can tho', '2014-06-19', 'upload/images/1403246914.jpg', 'upload/images/1403246914.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_security_questions`
--

CREATE TABLE IF NOT EXISTS `user_security_questions` (
`id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=95 ;

--
-- Dumping data for table `user_security_questions`
--

INSERT INTO `user_security_questions` (`id`, `question_id`, `answer`, `user_id`) VALUES
(1, 1, 'TanChau', 8),
(2, 8, 'cat', 8),
(3, 1, 'nguyen', 9),
(4, 8, 'nguyen', 9),
(5, 1, 'pokemon', 10),
(6, 8, 'pokemon123123', 10),
(7, 1, 'dsfsdf', 11),
(8, 9, 'dsfsd', 11),
(9, 1, 'st mary', 12),
(10, 8, 'kutta', 12),
(11, 2, 'dsfds', 17),
(12, 9, 'dsfd', 17),
(13, 1, 'ujjain', 18),
(14, 8, 'ujjain', 18),
(15, 4, 'punisher', 19),
(16, 8, 'pookie', 19),
(17, 1, 'hello', 20),
(18, 8, 'pokemon', 20),
(19, 1, 'aaa', 21),
(20, 8, 'aaaaa', 21),
(21, 1, 'Fuck', 22),
(22, 8, 'Fucker', 22),
(23, 1, 'abc', 23),
(24, 8, 'bcd', 23),
(25, 1, 'phuhuu', 24),
(26, 8, 'meo', 24),
(27, 1, 'BC', 25),
(28, 8, 'bird', 25),
(29, 1, 'Nonntal', 26),
(30, 8, 'gizmo', 26),
(31, 1, 'test', 28),
(32, 8, 'test', 28),
(33, 1, 'thuy', 29),
(34, 8, 'nguyen', 29),
(35, 1, 'nhaibau', 30),
(36, 8, 'cat', 30),
(37, 1, 'r?wer', 31),
(38, 8, '?werwe', 31),
(39, 2, '1111', 32),
(40, 9, '333333', 32),
(41, 1, 'gfgdsf', 33),
(42, 8, 'dfgdf', 33),
(43, 1, 'fgjf', 34),
(44, 8, 'gjfkf', 34),
(45, 1, 'gjghjgk', 35),
(46, 8, 'ghkghk', 35),
(47, 1, 'bbmb', 31),
(48, 8, 'jackie', 31),
(49, 1, 'carmel', 32),
(50, 12, 'scotland', 32),
(51, 1, 'www', 33),
(52, 8, 'rrrrr', 33),
(53, 2, 'bikari', 34),
(54, 8, 'alafi', 34),
(55, 2, 'Davao', 35),
(56, 11, 'Newscaster', 35),
(57, 1, 'abc', 36),
(58, 8, 'abc', 36),
(59, 1, 'nguyenminhtri_mekong', 37),
(60, 8, 'nguyenminhtri_mekong', 37),
(61, 1, 'bfgh', 38),
(62, 8, 'fhfghfgh', 38),
(63, 7, 'Davao', 39),
(64, 11, 'Newscaster', 39),
(65, 3, 'Seth', 40),
(66, 9, 'Rizal', 40),
(67, 1, 'ali', 41),
(68, 8, 'pali', 41),
(69, 7, 'test', 42),
(70, 8, 'test', 42),
(71, 1, 'gdfgdf', 43),
(72, 8, 'dhfhdfhd', 43),
(73, 1, 'mghkghk', 44),
(74, 8, 'ghkghkghk', 44),
(75, 1, 'goal montessori school', 43),
(76, 10, 'makati medical center', 43),
(77, 1, 'retuled', 44),
(78, 8, 'retuled', 44),
(79, 2, 'Shatin', 45),
(80, 8, 'Keroro', 45),
(81, 2, 'Shatin', 46),
(82, 8, 'Keroro', 46),
(83, 2, 'Fiji', 47),
(84, 8, 'Marley', 47),
(85, 3, 'William', 48),
(86, 8, 'Marley', 48),
(87, 1, 'thanhloi', 49),
(88, 10, 'binhminh', 49),
(89, 4, 'superman', 50),
(90, 8, 'ai', 50),
(91, 1, 'Doncaster', 51),
(92, 8, 'Dill', 51),
(93, 1, 'test', 52),
(94, 8, 'test', 52);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
`id` int(11) NOT NULL,
  `coinvote_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `coinvote_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2014-04-25 12:32:20', '2014-04-25 12:32:20'),
(2, 2, 6, '2014-04-25 12:32:31', '2014-04-25 12:32:31'),
(3, 1, 11, '2014-05-14 06:04:58', '2014-05-14 06:04:58'),
(4, 2, 11, '2014-05-14 06:05:12', '2014-05-14 06:05:12'),
(5, 1, 32, '2014-05-14 07:06:31', '2014-05-14 07:06:31'),
(6, 1, 41, '2014-05-16 15:52:41', '2014-05-16 15:52:41'),
(7, 4, 11, '2014-05-16 16:10:03', '2014-05-16 16:10:03'),
(8, 3, 11, '2014-05-16 16:10:19', '2014-05-16 16:10:19'),
(9, 1, 42, '2014-05-19 02:58:14', '2014-05-19 02:58:14'),
(10, 4, 6, '2014-05-19 07:57:15', '2014-05-19 07:57:15'),
(11, 1, 45, '2014-05-25 07:18:52', '2014-05-25 07:18:52'),
(12, 2, 45, '2014-05-25 07:19:11', '2014-05-25 07:19:11'),
(13, 1, 43, '2014-06-03 02:57:35', '2014-06-03 02:57:35'),
(14, 2, 43, '2014-06-03 02:59:45', '2014-06-03 02:59:45'),
(15, 1, 50, '2014-06-04 07:59:27', '2014-06-04 07:59:27'),
(16, 3, 6, '2014-06-11 03:12:55', '2014-06-11 03:12:55'),
(17, 1, 55, '2014-08-09 20:21:19', '2014-08-09 20:21:19'),
(18, 1, 85, '2014-09-26 02:09:24', '2014-09-26 02:09:24'),
(19, 2, 85, '2014-09-26 02:09:28', '2014-09-26 02:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE IF NOT EXISTS `wallets` (
`id` int(5) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `wallet_username` varchar(255) DEFAULT NULL,
  `wallet_password` varchar(255) DEFAULT NULL,
  `wallet_ip` varchar(45) DEFAULT NULL,
  `port` varchar(45) DEFAULT NULL,
  `download_wallet_client` text NOT NULL,
  `logo_coin` text NOT NULL,
  `is_moneypaper` tinyint(1) NOT NULL DEFAULT '0',
  `limit_confirmations` int(11) NOT NULL DEFAULT '3',
  `enable_deposit` tinyint(1) NOT NULL DEFAULT '1',
  `enable_withdraw` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `type`, `name`, `wallet_username`, `wallet_password`, `wallet_ip`, `port`, `download_wallet_client`, `logo_coin`, `is_moneypaper`, `limit_confirmations`, `enable_deposit`, `enable_withdraw`) VALUES
(1, 'BTC', 'Bitcoin', 'songnguyen', 'Songnguyen123', '115.78.235.170', '8332', 'https://bitcoin.org/en/download', '', 0, 3, 1, 0),
(8, 'DOGE', 'DogeCoin', 'Annacage', 'sdfds', 'dsfads', '8335', 'http://dogecoin.com/', '', 0, 3, 1, 1),
(9, 'OMC', 'Omnicoin', 'fdas', 'adfgdf', 'sdfsdaf', '43555', 'http://www.omnicoin.pw/download-omnicoin', '', 0, 3, 1, 1),
(10, 'RBBT', 'Rabbitcoin', 'rabbitcoin', 'fluffytail', '149.210.140.216', '9064', 'http://rabbitco.in/', 'upload/images/1401678257.png', 0, 3, 1, 1),
(11, 'BC', 'BlackCoin', 'sadfdsf', 'dsfds', 'dfds', '9051', 'http://www.blackcoin.co/', '', 0, 3, 1, 1),
(12, 'BIL', 'BillionCoin', 'dsfd', '3432', '3432', '9053', 'http://www.billioncoin.net/', '', 0, 3, 0, 0),
(13, 'FTC', 'FeatherCoin', 'dfdf', 'sadfds', 'sdfs', '9054', 'https://www.feathercoin.com/', '', 0, 3, 1, 1),
(14, 'XPM', 'PrimeCoin', 'xpmusercoin', 'xpmadmin1234', '149.210.140.216', '9055', 'http://primecoin.io/downloads.php', 'upload/images/1401678225.png', 0, 3, 1, 1),
(15, 'VTC', 'VertCoin', 'vtcfsdaf', 'vtfgdsfdsa', 'adsfdsa', '9056', 'https://github.com/vertcoin/vertcoin/releases', '', 0, 3, 1, 1),
(16, 'PPC', 'PeerCoin', 'ppcusercoin', 'ppcadmin1234', '149.210.140.216', '9057', 'http://www.peercoin.net/downloads', 'upload/images/1401678206.png', 0, 3, 1, 1),
(17, 'DRK', 'DarkCoin', 'drkdsfd', 'adf34', 'dsfads', '34', 'http://www.darkcoin.io/getstarted.html', '', 0, 3, 1, 1),
(18, 'WDC', 'WorldCoin', 'wdcusercoin', 'wdcadmin1234', '149.210.140.216', '9059', 'http://www.worldcoinalliance.net/worldcoin-wallets/', 'upload/images/1401678285.png', 0, 3, 1, 1),
(19, 'MAX', 'MaxCoin', 'adfgdasf', 'fsdfsda', 'adf', '9060', 'http://www.maxcoin.co.uk/', '', 0, 3, 1, 1),
(20, 'IFC', 'InfiniteCoin', 'ifcafdsfg', 'asdfds', 'adsfd', '9061', 'http://www.infinitecoin.com/ifc-wallet-download', '', 0, 3, 1, 1),
(21, 'QRK', 'QuarkCoin', 'qrkwalletusercoin', 'qrkwalletdmin1234', '149.210.140.216', '9066', 'http://www.quarkcoins.com/', 'upload/images/1401678241.png', 0, 3, 1, 1),
(22, 'EXE', 'ExeCoin', 'sadfds', 'edasfd', 'dafd', '9063', 'http://execoin.net/downloads.html', '', 0, 3, 1, 1),
(23, 'LTCT', 'LiteCoinTest', 'ltdas', 'dsfasd', 'dfda', '9050', 'https://litecoin.org/', '', 0, 3, 1, 1),
(24, 'LTC', 'LiteCoin', 'safas', 'ltcsfgasdf4', 'adsfdsa', '9050', 'https://litecoin.org/', '', 0, 3, 1, 1),
(25, 'POINTS', 'EcoinstraderPoints', 'nowalllet', 'nopass', '127.0.0.1', '2', '', '', 0, 3, 1, 1),
(31, 'KTK', 'kryptkoin', 'dsafd', 'adsfds', 'fds', '9058', '', '', 0, 3, 1, 1),
(33, '1212', '12423', 'sdsdk', 'sddas', '12.12.32.4', '54', '', '', 0, 3, 1, 1),
(34, 'XYZ', 'New Coin', 'wun', '12345678', '12345678', '57', '', '', 0, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_limittrade`
--

CREATE TABLE IF NOT EXISTS `wallet_limittrade` (
`id` int(11) NOT NULL,
  `wallet_id` int(11) NOT NULL,
  `min_amount` double NOT NULL,
  `max_amount` double NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `wallet_limittrade`
--

INSERT INTO `wallet_limittrade` (`id`, `wallet_id`, `min_amount`, `max_amount`) VALUES
(1, 1, 0.0002, 10),
(2, 8, 1, 1000),
(3, 9, 2, 1000),
(4, 10, 2, 1000),
(5, 11, 1.5, 22),
(6, 12, 2, 1000),
(7, 17, 2, 1000),
(8, 22, 2, 1000),
(9, 13, 2, 1000),
(10, 20, 2, 1000),
(11, 24, 0.001, 1000),
(12, 14, 1, 1000),
(13, 34, 5, 501);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_timelimittrade`
--

CREATE TABLE IF NOT EXISTS `wallet_timelimittrade` (
`id` int(10) NOT NULL,
  `wallet_id` int(10) NOT NULL,
  `limit_amount` int(12) NOT NULL,
  `time_limit` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wallet_timelimittrade`
--

INSERT INTO `wallet_timelimittrade` (`id`, `wallet_id`, `limit_amount`, `time_limit`) VALUES
(1, 1, 1, 'per week'),
(2, 33, 0, 'per week');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE IF NOT EXISTS `withdraws` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL,
  `to_address` text,
  `amount` double DEFAULT NULL,
  `fee_amount` double DEFAULT NULL,
  `receive_amount` double DEFAULT NULL COMMENT 'amount - fee_amount',
  `confirmation_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(4) DEFAULT NULL,
  `transaction_id` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `user_id`, `wallet_id`, `to_address`, `amount`, `fee_amount`, `receive_amount`, `confirmation_code`, `created_at`, `updated_at`, `status`, `transaction_id`) VALUES
(12, 11, 31, 'KTkfkmBonf4SwskP9jcqKqgofm9qzDiWs4', 50, 0.01, 49.99, '', '2014-07-02 00:43:41', '0000-00-00 00:00:00', 1, '7936e28e2d75259bd9313cd0f80cf706e677ef4d4ee0b502e4b8abc0e40b0563'),
(13, 11, 31, 'KCumh6kywysXisMs3sSPNmSXTJqZeYt3u2', 1, 0.01, 0.99, '', '2014-07-03 02:14:58', '0000-00-00 00:00:00', 1, 'ed8354b242284e0eb2a3aae478d3c7db338ae11f8d27fe2a6e2996d99a598de1'),
(14, 11, 8, 'DJms6xWZjcDKQ8BgBGZyDS3pPsmfUAQNJj', 10, 0, 10, '', '2014-07-08 20:50:47', '0000-00-00 00:00:00', 1, 'd2a674d486669d0c3643ece37c8c44d4b111ca8aee42c571dd8a80a52cc5c637');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coin_votes`
--
ALTER TABLE `coin_votes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_trade`
--
ALTER TABLE `fee_trade`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_withdraw`
--
ALTER TABLE `fee_withdraw`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `market`
--
ALTER TABLE `market`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `method_deposit_currency`
--
ALTER TABLE `method_deposit_currency`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `method_withdraw_currency`
--
ALTER TABLE `method_withdraw_currency`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phpmysqlautobackup`
--
ALTER TABLE `phpmysqlautobackup`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phpmysqlautobackup_log`
--
ALTER TABLE `phpmysqlautobackup_log`
 ADD PRIMARY KEY (`date`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `security_questions`
--
ALTER TABLE `security_questions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_history`
--
ALTER TABLE `trade_history`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_history`
--
ALTER TABLE `transfer_history`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_address_deposit`
--
ALTER TABLE `user_address_deposit`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_information`
--
ALTER TABLE `user_information`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_security_questions`
--
ALTER TABLE `user_security_questions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_limittrade`
--
ALTER TABLE `wallet_limittrade`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_timelimittrade`
--
ALTER TABLE `wallet_timelimittrade`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `coin_votes`
--
ALTER TABLE `coin_votes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=505;
--
-- AUTO_INCREMENT for table `fee_trade`
--
ALTER TABLE `fee_trade`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `fee_withdraw`
--
ALTER TABLE `fee_withdraw`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=249;
--
-- AUTO_INCREMENT for table `market`
--
ALTER TABLE `market`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `method_deposit_currency`
--
ALTER TABLE `method_deposit_currency`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `method_withdraw_currency`
--
ALTER TABLE `method_withdraw_currency`
MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=380;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `security_questions`
--
ALTER TABLE `security_questions`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `trade_history`
--
ALTER TABLE `trade_history`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `transfer_history`
--
ALTER TABLE `transfer_history`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `user_address_deposit`
--
ALTER TABLE `user_address_deposit`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `user_information`
--
ALTER TABLE `user_information`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_security_questions`
--
ALTER TABLE `user_security_questions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `wallet_limittrade`
--
ALTER TABLE `wallet_limittrade`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wallet_timelimittrade`
--
ALTER TABLE `wallet_timelimittrade`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

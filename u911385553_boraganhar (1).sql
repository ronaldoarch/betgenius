-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 12/09/2025 às 02:06
-- Versão do servidor: 10.11.10-MariaDB-log
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u911385553_boraganhar`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `inviter` int(10) UNSIGNED NOT NULL,
  `commission` decimal(20,2) NOT NULL DEFAULT 0.00,
  `commission_type` varchar(191) DEFAULT NULL,
  `deposited` tinyint(4) DEFAULT 0,
  `deposited_amount` decimal(10,2) DEFAULT 0.00,
  `losses` bigint(20) DEFAULT 0,
  `losses_amount` decimal(10,2) DEFAULT 0.00,
  `commission_paid` decimal(10,2) DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `affiliate_histories`
--

INSERT INTO `affiliate_histories` (`id`, `user_id`, `inviter`, `commission`, `commission_type`, `deposited`, `deposited_amount`, `losses`, `losses_amount`, `commission_paid`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 3, 5.00, 'cpa', 30, 0.00, 0, 0.00, 5.00, 1, '2025-04-21 14:38:55', '2025-04-21 21:06:21'),
(2, 6, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-21 19:34:01', '2025-04-21 19:34:01'),
(3, 7, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-22 02:19:48', '2025-04-22 02:19:48'),
(4, 8, 3, 5.00, 'cpa', 30, 0.00, 0, 0.00, 5.00, 1, '2025-04-22 02:23:08', '2025-04-22 02:24:58'),
(5, 9, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-22 04:31:50', '2025-04-22 04:31:50'),
(6, 10, 3, 5.00, 'cpa', 60, 0.00, 0, 0.00, 5.00, 1, '2025-04-22 09:58:46', '2025-04-22 10:02:34'),
(7, 11, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-22 10:34:37', '2025-04-22 10:34:37'),
(8, 12, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-22 12:30:44', '2025-04-22 12:30:44'),
(9, 13, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-22 14:19:59', '2025-04-22 14:19:59'),
(10, 14, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-22 18:44:50', '2025-04-22 18:44:50'),
(11, 15, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-22 19:14:11', '2025-04-22 19:14:11'),
(12, 17, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-23 05:03:03', '2025-04-23 05:03:03'),
(13, 18, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-04-23 09:19:41', '2025-04-23 09:19:41'),
(14, 90, 3, 5.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-06-29 00:17:27', '2025-06-29 00:17:27'),
(15, 122, 121, 10.00, 'cpa', 0, 0.00, 0, 0.00, 0.00, 0, '2025-06-30 13:13:45', '2025-06-30 13:13:45'),
(16, 184, 3, 5.00, 'cpa', 100, 0.00, 0, 0.00, 5.00, 1, '2025-07-04 09:34:36', '2025-07-04 09:39:01'),
(17, 193, 3, 5.00, 'cpa', 40, 0.00, 0, 0.00, 5.00, 1, '2025-07-05 07:08:36', '2025-07-05 07:24:16'),
(18, 397, 387, 10.00, 'cpa', 30, 0.00, 0, 0.00, 10.00, 1, '2025-07-30 12:47:19', '2025-07-30 12:48:14'),
(19, 414, 413, 10.00, 'cpa', 30, 0.00, 0, 0.00, 10.00, 1, '2025-08-01 12:45:46', '2025-08-01 12:47:47'),
(20, 416, 3, 5.00, 'cpa', 30, 0.00, 0, 0.00, 5.00, 1, '2025-08-01 19:34:57', '2025-08-01 19:36:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_logs`
--

CREATE TABLE `affiliate_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `commission_type` varchar(255) DEFAULT NULL,
  `commission` decimal(20,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_withdraws`
--

CREATE TABLE `affiliate_withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(191) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `bank_info` text DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cpf` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'home',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `banners`
--

INSERT INTO `banners` (`id`, `link`, `image`, `type`, `description`, `created_at`, `updated_at`) VALUES
(48, 'https://ativaplay.bet/register?code=UXS29WREYW', '01JRTG1YH5CNGD3XYW35SNXNP9.webp', 'carousel', NULL, '2025-03-09 03:21:22', '2025-04-21 02:55:53'),
(47, 'register?code=UXS29WREYW', '01JRTG0XG0FV5RTPC0F2TKY86B.webp', 'carousel', NULL, '2025-03-09 03:20:34', '2025-04-21 02:55:41'),
(46, '/games/play/1420/aviator', '01JRTGM385BDS7S00DRSGBQG52.webp', 'home', NULL, '2024-12-16 02:19:14', '2025-04-14 22:31:00'),
(45, '/games/play/1425/1543462', '01JRTGKNTBK5VK9AWV6AQW4KES.webp', 'home', NULL, '2024-12-16 02:18:52', '2025-04-14 22:31:21'),
(44, '/games/play/1428/1695365', '01JRTGJQJF0YN3NRJ89J9N6H52.webp', 'home', NULL, '2024-12-16 02:18:44', '2025-04-14 22:32:11'),
(49, 'https://ativaplay.bet/register?code=UXS29WREYW', '01JRTG2E3HRK4H21ZMHNSR8G3Q.webp', 'carousel', NULL, '2025-03-09 03:22:14', '2025-04-21 02:56:06');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bet_histories`
--

CREATE TABLE `bet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bet_amount` decimal(8,2) NOT NULL,
  `payout` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_win` tinyint(4) NOT NULL DEFAULT 0,
  `stars_revealed` int(11) NOT NULL DEFAULT 0,
  `bombs_count` int(11) NOT NULL DEFAULT 5,
  `game_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`game_data`)),
  `house_profit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `typeWallet` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `bs_pays`
--

CREATE TABLE `bs_pays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `withdrawal_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Favoritos ', 'Favoritos ', '01JF64KG5GMDH1W1EK4DQ2Q8RG.png', 'favoritos', NULL, '2023-11-13 14:59:07', '2025-03-09 03:39:20'),
(2, 'Slots', 'Slots', '01JF64H7AC4DR377BSTDNHJD8X.png', 'slots', NULL, '2023-12-24 12:06:46', '2025-03-09 03:40:15'),
(3, 'Crash', 'Crash', '01JF64DSMP0Q98HRK8FP9M1KX5.png', 'crash', NULL, '2023-12-24 12:12:36', '2025-03-09 03:40:24'),
(4, 'Ao vivo ', 'Ao vivo ', '01JF6496TYQ71595HRWE2JZBZ9.png', 'ao-vivo', NULL, '2024-04-16 11:26:47', '2025-03-09 03:40:42'),
(26, 'All games', 'All games', '01JF64PBWGJFGFYW5FFJJFH03J.png', 'all-games', NULL, '2024-12-15 22:36:31', '2025-03-09 03:41:07'),
(28, 'Aviator', 'Aviator', '01JF641Z4T3RKHBTXJ03BRANC0.png', 'aviator', '/games/play/1420/aviator', '2024-12-15 22:37:11', '2025-03-09 03:41:21'),
(30, 'Mines', 'Mines', '01JF642ZKB39CGAR1B62W06CC9.png', 'mines', '/games/play/1421/mines', '2024-12-15 22:37:44', '2025-04-14 22:11:05'),
(31, 'Provedores', 'Provedores', '01JF643AR0CTR1YZZ94HRA1FQ9.png', 'provedores', '/', '2024-12-15 22:37:55', '2025-03-09 03:42:19'),
(32, 'Roleta Ao vivo', 'Roletas Ao vivo', '01JF643RQ4GJ7P0FCEWJS82CV1.png', 'roleta-ao-vivo', NULL, '2024-12-15 22:38:10', '2025-04-14 22:08:47'),
(33, 'Spaceman', 'Spaceman', '01JF6443N2QKGAHGGGH8JT49E9.png', 'spaceman', '/games/play/1143/1301', '2024-12-15 22:38:21', '2025-03-09 03:43:38'),
(34, 'Fortune Tiger', 'Fortune Tiger', '01JF644D6A4XQXTZ7RQV9Q5BA9.png', 'Fortune Tiger', '/games/play/1422/126', '2024-12-15 22:38:31', '2024-12-15 22:38:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `category_game`
--

CREATE TABLE `category_game` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `category_game`
--

INSERT INTO `category_game` (`category_id`, `game_id`) VALUES
(4, 1189),
(4, 1072),
(4, 1073),
(4, 1074),
(4, 1075),
(4, 1076),
(4, 1077),
(4, 1078),
(4, 1079),
(4, 1080),
(3, 1082),
(4, 1083),
(4, 1084),
(4, 1085),
(4, 1086),
(4, 1087),
(4, 1088),
(4, 1089),
(4, 1090),
(4, 1091),
(4, 1092),
(4, 1093),
(4, 1094),
(4, 1095),
(4, 1096),
(4, 1097),
(4, 1098),
(4, 1099),
(4, 1100),
(4, 1101),
(4, 1102),
(4, 1103),
(4, 1104),
(4, 1105),
(4, 1106),
(4, 1107),
(4, 1108),
(4, 1109),
(4, 1110),
(4, 1111),
(4, 1112),
(4, 1113),
(4, 1114),
(4, 1115),
(4, 1116),
(4, 1117),
(3, 1118),
(4, 1119),
(4, 1120),
(4, 1121),
(4, 1122),
(4, 1123),
(4, 1124),
(4, 1125),
(4, 1126),
(4, 1127),
(4, 1128),
(4, 1129),
(4, 1130),
(4, 1131),
(4, 1132),
(4, 1133),
(4, 1134),
(4, 1135),
(4, 1136),
(4, 1137),
(4, 1138),
(4, 1139),
(4, 1140),
(4, 1141),
(4, 1142),
(3, 1143),
(4, 1144),
(4, 1145),
(4, 1146),
(4, 1147),
(4, 1148),
(4, 1149),
(4, 1150),
(4, 1151),
(4, 1152),
(4, 1153),
(4, 1154),
(4, 1155),
(4, 1156),
(4, 1157),
(4, 1158),
(4, 1159),
(4, 1160),
(4, 1161),
(4, 1162),
(4, 1163),
(4, 1178),
(4, 1179),
(4, 1180),
(4, 1181),
(4, 1182),
(4, 1183),
(4, 1184),
(4, 1185),
(4, 1186),
(4, 1187),
(4, 1188),
(4, 1189),
(4, 1190),
(4, 1191),
(4, 1192),
(4, 1193),
(4, 1194),
(4, 1195),
(4, 1196),
(4, 1197),
(4, 1198),
(4, 1199),
(4, 1200),
(4, 1201),
(4, 1202),
(4, 1203),
(4, 1204),
(4, 1205),
(4, 1206),
(4, 1207),
(4, 1208),
(4, 1209),
(4, 1210),
(4, 1211),
(4, 1212),
(4, 1213),
(4, 1214),
(4, 1215),
(4, 1216),
(4, 1217),
(4, 1218),
(4, 1219),
(4, 1220),
(4, 1221),
(4, 1222),
(4, 1223),
(4, 1224),
(4, 1225),
(4, 1226),
(4, 1227),
(4, 1228),
(4, 1229),
(4, 1230),
(4, 1231),
(4, 1232),
(4, 1233),
(4, 1234),
(4, 1235),
(4, 1236),
(4, 1237),
(4, 1238),
(4, 1239),
(4, 1240),
(4, 1241),
(4, 1242),
(4, 1243),
(4, 1244),
(4, 1245),
(4, 1246),
(4, 1247),
(4, 1248),
(4, 1249),
(4, 1250),
(4, 1251),
(4, 1252),
(4, 1253),
(4, 1254),
(4, 1255),
(4, 1256),
(4, 1257),
(4, 1258),
(4, 1259),
(4, 1260),
(4, 1261),
(4, 1262),
(4, 1263),
(4, 1264),
(4, 1265),
(4, 1266),
(4, 1267),
(4, 1268),
(4, 1269),
(4, 1270),
(4, 1271),
(4, 1272),
(4, 1273),
(4, 1274),
(4, 1275),
(4, 1276),
(4, 1277),
(4, 1278),
(4, 1279),
(4, 1280),
(4, 1281),
(4, 1282),
(4, 1283),
(4, 1284),
(4, 1285),
(4, 1286),
(4, 1287),
(4, 1288),
(4, 1289),
(4, 1290),
(4, 1291),
(4, 1292),
(4, 1293),
(4, 1294),
(4, 1295),
(4, 1296),
(4, 1297),
(4, 1298),
(4, 1299),
(4, 1300),
(4, 1301),
(4, 1302),
(4, 1303),
(4, 1304),
(4, 1305),
(4, 1306),
(4, 1307),
(4, 1308),
(4, 1309),
(4, 1310),
(4, 1311),
(4, 1312),
(4, 1313),
(4, 1314),
(4, 1315),
(4, 1316),
(4, 1317),
(4, 1318),
(4, 1319),
(4, 1320),
(4, 1321),
(4, 1322),
(4, 1323),
(4, 1324),
(4, 1325),
(4, 1326),
(4, 1327),
(4, 1328),
(4, 1329),
(4, 1330),
(4, 1331),
(4, 1332),
(4, 1333),
(4, 1334),
(4, 1335),
(4, 1336),
(4, 1337),
(4, 1338),
(4, 1339),
(4, 1340),
(4, 1341),
(4, 1342),
(4, 1343),
(4, 1344),
(4, 1345),
(4, 1346),
(4, 1347),
(4, 1348),
(4, 1349),
(4, 1350),
(4, 1351),
(4, 1352),
(4, 1353),
(4, 1354),
(4, 1355),
(4, 1356),
(4, 1357),
(4, 1358),
(4, 1359),
(4, 1360),
(4, 1361),
(4, 1362),
(4, 1363),
(4, 1364),
(4, 1365),
(4, 1366),
(4, 1367),
(4, 1368),
(4, 1369),
(4, 1370),
(4, 1371),
(4, 1372),
(4, 1373),
(4, 1374),
(4, 1375),
(4, 1376),
(4, 1377),
(4, 1378),
(4, 1379),
(4, 1380),
(4, 1381),
(4, 1382),
(4, 1383),
(4, 1384),
(4, 1385),
(4, 1386),
(4, 1387),
(4, 1388),
(4, 1389),
(4, 1390),
(4, 1391),
(4, 1392),
(4, 1393),
(4, 1394),
(4, 1395),
(4, 1396),
(4, 1397),
(4, 1398),
(4, 1399),
(4, 1400),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(2, 92),
(2, 93),
(2, 94),
(2, 95),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 117),
(2, 118),
(2, 119),
(2, 120),
(2, 121),
(2, 122),
(2, 123),
(2, 124),
(2, 125),
(2, 126),
(2, 127),
(2, 128),
(2, 129),
(2, 130),
(2, 131),
(2, 132),
(2, 133),
(2, 134),
(2, 135),
(2, 136),
(2, 137),
(2, 138),
(2, 139),
(2, 140),
(2, 141),
(2, 142),
(2, 143),
(2, 144),
(2, 145),
(2, 146),
(2, 147),
(2, 148),
(2, 149),
(2, 150),
(2, 151),
(2, 152),
(2, 153),
(2, 154),
(2, 155),
(2, 156),
(2, 157),
(2, 158),
(2, 159),
(2, 160),
(2, 161),
(2, 162),
(2, 163),
(2, 164),
(2, 165),
(2, 166),
(2, 167),
(2, 168),
(2, 169),
(2, 170),
(2, 171),
(2, 172),
(2, 173),
(2, 174),
(2, 175),
(2, 176),
(2, 177),
(2, 178),
(2, 179),
(2, 180),
(2, 181),
(2, 182),
(2, 183),
(2, 184),
(2, 185),
(2, 186),
(2, 187),
(2, 188),
(2, 189),
(2, 190),
(2, 191),
(2, 192),
(2, 193),
(2, 194),
(2, 195),
(2, 196),
(2, 197),
(2, 198),
(2, 199),
(2, 200),
(2, 201),
(2, 202),
(2, 203),
(2, 204),
(2, 205),
(2, 206),
(2, 207),
(2, 208),
(2, 209),
(2, 210),
(2, 211),
(2, 212),
(2, 213),
(2, 214),
(2, 215),
(2, 216),
(2, 217),
(2, 218),
(2, 219),
(2, 220),
(2, 221),
(2, 222),
(2, 223),
(2, 224),
(2, 225),
(2, 226),
(2, 227),
(2, 228),
(2, 229),
(2, 230),
(2, 231),
(2, 232),
(2, 233),
(2, 234),
(2, 235),
(2, 236),
(2, 237),
(2, 238),
(2, 239),
(2, 240),
(2, 241),
(2, 242),
(2, 243),
(2, 244),
(2, 245),
(2, 246),
(2, 247),
(2, 248),
(2, 249),
(2, 250),
(2, 251),
(2, 252),
(2, 253),
(2, 254),
(2, 255),
(2, 256),
(2, 257),
(2, 258),
(2, 259),
(2, 260),
(2, 261),
(2, 262),
(2, 263),
(2, 264),
(2, 265),
(2, 266),
(2, 267),
(2, 268),
(2, 269),
(2, 270),
(2, 271),
(2, 272),
(2, 273),
(2, 274),
(2, 275),
(2, 276),
(2, 277),
(2, 278),
(2, 279),
(2, 280),
(2, 281),
(2, 282),
(2, 283),
(2, 284),
(2, 285),
(2, 286),
(2, 287),
(2, 288),
(2, 289),
(2, 290),
(2, 291),
(2, 292),
(2, 293),
(2, 294),
(2, 295),
(2, 296),
(2, 297),
(2, 298),
(2, 299),
(2, 300),
(2, 301),
(2, 302),
(2, 303),
(2, 304),
(2, 305),
(2, 306),
(2, 307),
(2, 308),
(2, 309),
(2, 310),
(2, 311),
(2, 312),
(2, 313),
(2, 314),
(2, 315),
(2, 316),
(2, 317),
(2, 318),
(2, 319),
(2, 320),
(2, 321),
(2, 322),
(2, 323),
(2, 324),
(2, 325),
(2, 326),
(2, 327),
(2, 328),
(2, 329),
(2, 330),
(2, 331),
(2, 332),
(2, 333),
(2, 334),
(2, 335),
(2, 336),
(2, 337),
(2, 338),
(2, 339),
(2, 340),
(2, 341),
(2, 342),
(2, 343),
(2, 344),
(2, 345),
(2, 346),
(2, 347),
(2, 348),
(2, 349),
(2, 350),
(2, 351),
(2, 352),
(2, 353),
(2, 354),
(2, 355),
(2, 356),
(2, 357),
(2, 358),
(2, 359),
(2, 360),
(2, 361),
(2, 362),
(2, 363),
(2, 364),
(2, 365),
(2, 366),
(2, 367),
(2, 368),
(2, 369),
(2, 370),
(2, 371),
(2, 372),
(2, 373),
(2, 374),
(2, 375),
(2, 376),
(2, 377),
(2, 378),
(2, 379),
(2, 380),
(2, 381),
(2, 382),
(2, 383),
(2, 384),
(2, 385),
(2, 386),
(2, 387),
(2, 388),
(2, 389),
(2, 390),
(2, 391),
(2, 392),
(2, 393),
(2, 394),
(2, 395),
(2, 396),
(2, 397),
(2, 398),
(2, 399),
(2, 400),
(2, 401),
(2, 402),
(2, 403),
(2, 404),
(2, 405),
(2, 406),
(2, 407),
(2, 408),
(2, 409),
(2, 410),
(2, 411),
(2, 412),
(2, 413),
(2, 414),
(2, 415),
(2, 416),
(2, 417),
(2, 418),
(2, 419),
(2, 420),
(2, 421),
(2, 422),
(2, 423),
(2, 424),
(2, 425),
(2, 426),
(2, 427),
(2, 428),
(2, 429),
(2, 430),
(2, 431),
(2, 432),
(2, 433),
(2, 434),
(2, 435),
(2, 436),
(2, 437),
(2, 438),
(2, 439),
(2, 440),
(2, 441),
(2, 442),
(2, 443),
(2, 444),
(2, 445),
(2, 446),
(2, 447),
(2, 448),
(2, 449),
(2, 450),
(2, 451),
(2, 452),
(2, 453),
(2, 454),
(2, 455),
(2, 456),
(2, 457),
(2, 458),
(2, 459),
(2, 460),
(2, 461),
(2, 462),
(2, 463),
(2, 464),
(2, 465),
(2, 466),
(2, 467),
(2, 468),
(2, 469),
(2, 470),
(2, 471),
(2, 472),
(2, 473),
(2, 474),
(2, 475),
(2, 476),
(2, 477),
(2, 478),
(2, 479),
(2, 480),
(2, 481),
(2, 482),
(2, 483),
(2, 484),
(2, 485),
(2, 486),
(2, 487),
(2, 488),
(2, 489),
(2, 490),
(2, 491),
(2, 492),
(2, 493),
(2, 494),
(2, 495),
(2, 496),
(2, 497),
(2, 498),
(2, 499),
(2, 500),
(2, 501),
(2, 502),
(2, 503),
(2, 504),
(2, 505),
(2, 506),
(2, 507),
(2, 508),
(2, 509),
(2, 510),
(2, 511),
(2, 512),
(2, 513),
(2, 514),
(2, 515),
(2, 516),
(2, 517),
(2, 518),
(2, 519),
(2, 520),
(2, 521),
(2, 522),
(2, 523),
(2, 524),
(2, 525),
(2, 526),
(2, 527),
(2, 528),
(2, 529),
(2, 530),
(2, 531),
(2, 532),
(2, 533),
(2, 534),
(2, 535),
(2, 536),
(2, 537),
(2, 538),
(2, 539),
(2, 540),
(2, 541),
(2, 542),
(2, 543),
(2, 544),
(2, 545),
(2, 546),
(2, 547),
(2, 548),
(2, 549),
(2, 550),
(2, 551),
(2, 552),
(2, 553),
(2, 554),
(2, 555),
(2, 556),
(2, 557),
(2, 558),
(2, 559),
(2, 560),
(2, 561),
(2, 562),
(2, 563),
(2, 564),
(2, 565),
(2, 566),
(2, 567),
(2, 568),
(2, 569),
(2, 570),
(2, 571),
(2, 572),
(2, 573),
(2, 574),
(2, 575),
(2, 576),
(2, 577),
(2, 578),
(2, 579),
(2, 580),
(2, 581),
(2, 582),
(2, 583),
(2, 584),
(2, 585),
(2, 586),
(2, 587),
(2, 588),
(2, 589),
(2, 590),
(2, 591),
(2, 592),
(2, 593),
(2, 594),
(2, 595),
(2, 596),
(2, 597),
(2, 598),
(2, 599),
(2, 600),
(2, 601),
(2, 602),
(2, 603),
(2, 604),
(2, 605),
(2, 606),
(2, 607),
(2, 608),
(2, 609),
(2, 610),
(2, 611),
(2, 612),
(2, 613),
(2, 614),
(2, 615),
(2, 616),
(2, 617),
(2, 618),
(2, 619),
(2, 620),
(2, 621),
(2, 622),
(2, 623),
(2, 624),
(2, 625),
(2, 626),
(2, 627),
(2, 628),
(2, 629),
(2, 630),
(2, 631),
(2, 632),
(2, 633),
(2, 634),
(2, 635),
(2, 636),
(2, 637),
(2, 638),
(2, 639),
(2, 640),
(2, 641),
(2, 642),
(2, 643),
(2, 644),
(2, 645),
(2, 646),
(2, 647),
(2, 648),
(2, 649),
(2, 650),
(2, 651),
(2, 652),
(2, 653),
(2, 654),
(2, 655),
(2, 656),
(2, 657),
(2, 658),
(2, 659),
(2, 660),
(2, 661),
(2, 662),
(2, 663),
(2, 664),
(2, 665),
(2, 666),
(2, 667),
(2, 668),
(2, 669),
(2, 670),
(2, 671),
(2, 672),
(2, 673),
(2, 674),
(2, 675),
(2, 676),
(2, 677),
(2, 678),
(2, 679),
(2, 680),
(2, 681),
(2, 682),
(2, 683),
(2, 684),
(2, 685),
(2, 686),
(2, 687),
(2, 688),
(2, 689),
(2, 690),
(2, 691),
(2, 692),
(2, 693),
(2, 694),
(2, 695),
(2, 696),
(2, 697),
(2, 698),
(2, 699),
(2, 700),
(2, 701),
(2, 702),
(2, 703),
(2, 704),
(2, 705),
(2, 735),
(2, 736),
(2, 737),
(2, 738),
(2, 739),
(2, 740),
(2, 741),
(2, 742),
(2, 743),
(2, 744),
(2, 745),
(2, 746),
(2, 747),
(2, 748),
(2, 749),
(2, 750),
(2, 751),
(2, 752),
(2, 753),
(2, 754),
(2, 755),
(2, 756),
(2, 757),
(2, 758),
(2, 759),
(2, 760),
(2, 761),
(2, 762),
(2, 763),
(2, 764),
(2, 765),
(2, 766),
(2, 767),
(2, 768),
(2, 769),
(2, 770),
(2, 771),
(2, 772),
(2, 773),
(2, 774),
(2, 775),
(2, 776),
(2, 777),
(2, 778),
(2, 779),
(2, 780),
(2, 781),
(2, 782),
(2, 783),
(2, 784),
(2, 785),
(2, 786),
(2, 787),
(2, 788),
(2, 797),
(2, 798),
(2, 799),
(2, 800),
(2, 801),
(2, 802),
(2, 803),
(2, 804),
(2, 805),
(2, 806),
(2, 807),
(2, 808),
(2, 809),
(2, 810),
(2, 811),
(2, 812),
(2, 813),
(2, 814),
(2, 815),
(2, 816),
(2, 817),
(2, 818),
(2, 819),
(2, 820),
(2, 821),
(2, 822),
(2, 823),
(2, 824),
(2, 825),
(2, 826),
(2, 827),
(2, 828),
(2, 829),
(2, 830),
(2, 831),
(2, 832),
(2, 833),
(2, 834),
(2, 835),
(2, 836),
(2, 837),
(2, 838),
(2, 839),
(2, 840),
(2, 841),
(2, 842),
(2, 843),
(2, 844),
(2, 845),
(2, 846),
(2, 847),
(2, 848),
(2, 849),
(2, 850),
(2, 851),
(2, 852),
(2, 853),
(2, 854),
(2, 855),
(2, 856),
(2, 857),
(2, 858),
(2, 859),
(2, 860),
(2, 861),
(2, 862),
(2, 863),
(2, 864),
(2, 865),
(2, 866),
(2, 867),
(2, 868),
(2, 869),
(2, 870),
(2, 872),
(2, 873),
(2, 874),
(2, 875),
(2, 876),
(2, 904),
(2, 905),
(2, 906),
(2, 907),
(2, 908),
(2, 909),
(2, 910),
(2, 911),
(2, 912),
(2, 913),
(2, 914),
(2, 915),
(2, 916),
(2, 917),
(2, 918),
(2, 919),
(2, 920),
(2, 921),
(2, 922),
(2, 923),
(2, 924),
(2, 925),
(2, 926),
(2, 927),
(2, 928),
(2, 929),
(2, 930),
(2, 931),
(2, 932),
(2, 933),
(2, 934),
(2, 935),
(2, 936),
(2, 937),
(2, 938),
(2, 939),
(2, 940),
(2, 941),
(2, 942),
(2, 943),
(2, 944),
(2, 945),
(2, 946),
(2, 947),
(2, 948),
(2, 949),
(2, 950),
(2, 1444),
(2, 951),
(2, 952),
(2, 953),
(2, 954),
(2, 955),
(2, 956),
(2, 957),
(2, 958),
(2, 959),
(2, 960),
(2, 961),
(2, 962),
(2, 963),
(2, 1422),
(2, 964),
(2, 965),
(2, 966),
(2, 967),
(2, 968),
(2, 969),
(2, 970),
(2, 971),
(2, 972),
(2, 973),
(2, 974),
(2, 975),
(2, 976),
(2, 977),
(2, 978),
(2, 979),
(2, 980),
(2, 981),
(2, 982),
(2, 983),
(2, 984),
(2, 985),
(2, 986),
(2, 987),
(2, 988),
(2, 989),
(2, 990),
(2, 991),
(2, 992),
(2, 993),
(2, 994),
(2, 995),
(2, 996),
(2, 997),
(2, 998),
(2, 999),
(2, 1000),
(2, 1001),
(2, 1002),
(2, 1003),
(2, 1004),
(2, 1005),
(2, 1006),
(2, 1007),
(2, 1008),
(2, 1009),
(2, 1010),
(2, 1011),
(2, 1012),
(2, 1013),
(2, 1014),
(2, 1015),
(2, 1016),
(2, 1017),
(2, 1018),
(2, 1019),
(2, 1020),
(2, 1021),
(2, 1022),
(2, 1023),
(2, 1024),
(2, 1025),
(2, 1026),
(2, 1027),
(2, 1028),
(2, 1029),
(2, 1030),
(2, 1031),
(2, 1032),
(2, 1033),
(2, 1034),
(2, 1035),
(2, 1036),
(2, 1037),
(2, 1038),
(2, 1039),
(2, 1040),
(2, 1041),
(2, 1042),
(2, 1043),
(2, 1044),
(2, 1045),
(2, 1046),
(2, 1047),
(2, 1048),
(2, 1049),
(2, 1050),
(2, 1051),
(2, 1052),
(2, 1053),
(2, 1054),
(2, 1055),
(2, 1056),
(2, 1057),
(2, 1058),
(2, 1059),
(2, 1060),
(2, 1061),
(2, 1062),
(2, 1063),
(2, 1064),
(2, 1065),
(2, 1066),
(2, 1067),
(2, 1068),
(2, 1069),
(2, 1070),
(2, 1071),
(2, 1081),
(2, 1164),
(2, 1165),
(2, 1166),
(2, 1167),
(2, 1168),
(2, 1169),
(2, 1170),
(2, 1171),
(2, 1172),
(2, 1173),
(2, 1174),
(2, 1175),
(2, 1176),
(2, 1177),
(2, 1401),
(2, 1402),
(2, 1403),
(2, 1404),
(2, 1405),
(2, 1406),
(2, 1407),
(2, 1408),
(2, 1409),
(2, 1410),
(2, 1411),
(2, 1412),
(2, 1413),
(2, 1414),
(2, 1415),
(2, 1416),
(2, 1417),
(2, 1418),
(2, 1419),
(2, 1423),
(2, 1424),
(2, 1425),
(2, 1426),
(2, 1427),
(2, 1428),
(2, 1429),
(2, 1430),
(2, 1431),
(2, 1432),
(2, 1433),
(2, 1434),
(2, 1435),
(2, 1436),
(2, 1437),
(2, 1438),
(2, 1439),
(2, 1440),
(2, 1441),
(2, 1442),
(2, 1443),
(2, 1445),
(2, 1446),
(2, 1447),
(2, 1448),
(3, 1421),
(3, 1420),
(3, 708),
(3, 715),
(3, 716),
(3, 717),
(3, 706),
(3, 722),
(3, 725),
(3, 733),
(3, 789),
(3, 790),
(32, 714),
(32, 1074),
(32, 1075),
(32, 1120),
(32, 1377),
(32, 1390),
(32, 1388),
(32, 1376),
(32, 1375),
(32, 1372),
(32, 1370),
(32, 1367),
(32, 1366),
(32, 1354),
(32, 1350),
(32, 1314),
(32, 1313),
(32, 1303),
(32, 1234),
(32, 1233),
(32, 1232),
(32, 1206),
(32, 1205),
(32, 1203),
(32, 1198),
(32, 1197),
(32, 1194),
(32, 1189),
(32, 1188),
(32, 1184),
(32, 1183),
(32, 1182),
(32, 1178),
(32, 1175),
(32, 1162),
(32, 1144),
(32, 1139),
(32, 1138),
(32, 1137),
(32, 1128),
(32, 1121),
(1, 41),
(1, 18),
(1, 249),
(1, 220),
(1, 217),
(1, 908),
(1, 1081),
(1, 1423),
(1, 1424),
(1, 1422),
(1, 1421),
(1, 1440),
(1, 1442),
(1, 1443),
(1, 1444),
(1, 1445),
(1, 1447),
(1, 1448),
(1, 1425),
(1, 1420),
(1, 1435),
(1, 1429),
(1, 100),
(1, 224);

-- --------------------------------------------------------

--
-- Estrutura para tabela `configs_playfiver`
--

CREATE TABLE `configs_playfiver` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rtp` int(11) DEFAULT NULL,
  `limit_enable` tinyint(1) NOT NULL DEFAULT 0,
  `limit_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `limit_hours` int(11) NOT NULL DEFAULT 1,
  `bonus_enable` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `configs_playfiver`
--

INSERT INTO `configs_playfiver` (`id`, `rtp`, `limit_enable`, `limit_amount`, `limit_hours`, `bonus_enable`, `edit`, `created_at`, `updated_at`) VALUES
(45, 10, 0, 100.00, 1, 1, 0, '2025-04-15 03:40:21', '2025-04-15 03:40:21'),
(46, 10, 0, 100.00, 1, 1, 0, '2025-04-15 04:06:33', '2025-04-15 04:06:33'),
(47, 10, 0, 100.00, 1, 1, 0, '2025-04-21 03:07:46', '2025-04-21 03:07:46'),
(48, 10, 0, 100.00, 1, 1, 0, '2025-06-18 13:49:53', '2025-06-18 13:49:53'),
(49, 10, 0, 100.00, 1, 1, 0, '2025-06-26 01:36:49', '2025-06-26 01:36:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupons`
--

CREATE TABLE `cupons` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `valor_bonus` decimal(8,2) NOT NULL,
  `validade` date NOT NULL,
  `quantidade_uso` int(11) NOT NULL,
  `usos` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Leke', 'ALL', 'Lek', '2023-11-07 21:01:38', NULL),
(2, 'Dollars', 'USD', '$', '2023-11-07 21:01:38', NULL),
(3, 'Afghanis', 'AFN', '؋', '2023-11-07 21:01:38', NULL),
(4, 'Pesos', 'ARS', '$', '2023-11-07 21:01:38', NULL),
(5, 'Guilders', 'AWG', 'ƒ', '2023-11-07 21:01:38', NULL),
(6, 'Dollars', 'AUD', '$', '2023-11-07 21:01:38', NULL),
(7, 'New Manats', 'AZN', 'ман', '2023-11-07 21:01:38', NULL),
(8, 'Dollars', 'BSD', '$', '2023-11-07 21:01:38', NULL),
(9, 'Dollars', 'BBD', '$', '2023-11-07 21:01:38', NULL),
(10, 'Rubles', 'BYR', 'p.', '2023-11-07 21:01:38', NULL),
(11, 'Euro', 'EUR', '€', '2023-11-07 21:01:38', NULL),
(12, 'Dollars', 'BZD', 'BZ$', '2023-11-07 21:01:38', NULL),
(13, 'Dollars', 'BMD', '$', '2023-11-07 21:01:38', NULL),
(14, 'Bolivianos', 'BOB', '$b', '2023-11-07 21:01:38', NULL),
(15, 'Convertible Marka', 'BAM', 'KM', '2023-11-07 21:01:38', NULL),
(16, 'Pula', 'BWP', 'P', '2023-11-07 21:01:38', NULL),
(17, 'Leva', 'BGN', 'лв', '2023-11-07 21:01:38', NULL),
(18, 'Reais', 'BRL', 'R$', '2023-11-07 21:01:38', NULL),
(19, 'Pounds', 'GBP', '£', '2023-11-07 21:01:38', NULL),
(20, 'Dollars', 'BND', '$', '2023-11-07 21:01:38', NULL),
(21, 'Riels', 'KHR', '៛', '2023-11-07 21:01:38', NULL),
(22, 'Dollars', 'CAD', '$', '2023-11-07 21:01:38', NULL),
(23, 'Dollars', 'KYD', '$', '2023-11-07 21:01:38', NULL),
(24, 'Pesos', 'CLP', '$', '2023-11-07 21:01:38', NULL),
(25, 'Yuan Renminbi', 'CNY', '¥', '2023-11-07 21:01:38', NULL),
(26, 'Pesos', 'COP', '$', '2023-11-07 21:01:38', NULL),
(27, 'Colón', 'CRC', '₡', '2023-11-07 21:01:38', NULL),
(28, 'Kuna', 'HRK', 'kn', '2023-11-07 21:01:38', NULL),
(29, 'Pesos', 'CUP', '₱', '2023-11-07 21:01:38', NULL),
(30, 'Koruny', 'CZK', 'Kč', '2023-11-07 21:01:38', NULL),
(31, 'Kroner', 'DKK', 'kr', '2023-11-07 21:01:38', NULL),
(32, 'Pesos', 'DOP', 'RD$', '2023-11-07 21:01:38', NULL),
(33, 'Dollars', 'XCD', '$', '2023-11-07 21:01:38', NULL),
(34, 'Pounds', 'EGP', '£', '2023-11-07 21:01:38', NULL),
(35, 'Colones', 'SVC', '$', '2023-11-07 21:01:38', NULL),
(36, 'Pounds', 'FKP', '£', '2023-11-07 21:01:38', NULL),
(37, 'Dollars', 'FJD', '$', '2023-11-07 21:01:38', NULL),
(38, 'Cedis', 'GHC', '¢', '2023-11-07 21:01:38', NULL),
(39, 'Pounds', 'GIP', '£', '2023-11-07 21:01:38', NULL),
(40, 'Quetzales', 'GTQ', 'Q', '2023-11-07 21:01:38', NULL),
(41, 'Pounds', 'GGP', '£', '2023-11-07 21:01:38', NULL),
(42, 'Dollars', 'GYD', '$', '2023-11-07 21:01:38', NULL),
(43, 'Lempiras', 'HNL', 'L', '2023-11-07 21:01:38', NULL),
(44, 'Dollars', 'HKD', '$', '2023-11-07 21:01:38', NULL),
(45, 'Forint', 'HUF', 'Ft', '2023-11-07 21:01:38', NULL),
(46, 'Kronur', 'ISK', 'kr', '2023-11-07 21:01:38', NULL),
(47, 'Rupees', 'INR', 'Rp', '2023-11-07 21:01:38', NULL),
(48, 'Rupiahs', 'IDR', 'Rp', '2023-11-07 21:01:38', NULL),
(49, 'Rials', 'IRR', '﷼', '2023-11-07 21:01:38', NULL),
(50, 'Pounds', 'IMP', '£', '2023-11-07 21:01:38', NULL),
(51, 'New Shekels', 'ILS', '₪', '2023-11-07 21:01:38', NULL),
(52, 'Dollars', 'JMD', 'J$', '2023-11-07 21:01:38', NULL),
(53, 'Yen', 'JPY', '¥', '2023-11-07 21:01:38', NULL),
(54, 'Pounds', 'JEP', '£', '2023-11-07 21:01:38', NULL),
(55, 'Tenge', 'KZT', 'лв', '2023-11-07 21:01:38', NULL),
(56, 'Won', 'KPW', '₩', '2023-11-07 21:01:38', NULL),
(57, 'Won', 'KRW', '₩', '2023-11-07 21:01:38', NULL),
(58, 'Soms', 'KGS', 'лв', '2023-11-07 21:01:38', NULL),
(59, 'Kips', 'LAK', '₭', '2023-11-07 21:01:38', NULL),
(60, 'Lati', 'LVL', 'Ls', '2023-11-07 21:01:38', NULL),
(61, 'Pounds', 'LBP', '£', '2023-11-07 21:01:38', NULL),
(62, 'Dollars', 'LRD', '$', '2023-11-07 21:01:38', NULL),
(63, 'Switzerland Francs', 'CHF', 'CHF', '2023-11-07 21:01:38', NULL),
(64, 'Litai', 'LTL', 'Lt', '2023-11-07 21:01:38', NULL),
(65, 'Denars', 'MKD', 'ден', '2023-11-07 21:01:38', NULL),
(66, 'Ringgits', 'MYR', 'RM', '2023-11-07 21:01:38', NULL),
(67, 'Rupees', 'MUR', '₨', '2023-11-07 21:01:38', NULL),
(68, 'Pesos', 'MXN', '$', '2023-11-07 21:01:38', NULL),
(69, 'Tugriks', 'MNT', '₮', '2023-11-07 21:01:38', NULL),
(70, 'Meticais', 'MZN', 'MT', '2023-11-07 21:01:38', NULL),
(71, 'Dollars', 'NAD', '$', '2023-11-07 21:01:38', NULL),
(72, 'Rupees', 'NPR', '₨', '2023-11-07 21:01:38', NULL),
(73, 'Guilders', 'ANG', 'ƒ', '2023-11-07 21:01:38', NULL),
(74, 'Dollars', 'NZD', '$', '2023-11-07 21:01:38', NULL),
(75, 'Cordobas', 'NIO', 'C$', '2023-11-07 21:01:38', NULL),
(76, 'Nairas', 'NGN', '₦', '2023-11-07 21:01:38', NULL),
(77, 'Krone', 'NOK', 'kr', '2023-11-07 21:01:38', NULL),
(78, 'Rials', 'OMR', '﷼', '2023-11-07 21:01:38', NULL),
(79, 'Rupees', 'PKR', '₨', '2023-11-07 21:01:38', NULL),
(80, 'Balboa', 'PAB', 'B/.', '2023-11-07 21:01:38', NULL),
(81, 'Guarani', 'PYG', 'Gs', '2023-11-07 21:01:38', NULL),
(82, 'Nuevos Soles', 'PEN', 'S/.', '2023-11-07 21:01:38', NULL),
(83, 'Pesos', 'PHP', 'Php', '2023-11-07 21:01:38', NULL),
(84, 'Zlotych', 'PLN', 'zł', '2023-11-07 21:01:38', NULL),
(85, 'Rials', 'QAR', '﷼', '2023-11-07 21:01:38', NULL),
(86, 'New Lei', 'RON', 'lei', '2023-11-07 21:01:38', NULL),
(87, 'Rubles', 'RUB', 'руб', '2023-11-07 21:01:38', NULL),
(88, 'Pounds', 'SHP', '£', '2023-11-07 21:01:38', NULL),
(89, 'Riyals', 'SAR', '﷼', '2023-11-07 21:01:38', NULL),
(90, 'Dinars', 'RSD', 'Дин.', '2023-11-07 21:01:38', NULL),
(91, 'Rupees', 'SCR', '₨', '2023-11-07 21:01:38', NULL),
(92, 'Dollars', 'SGD', '$', '2023-11-07 21:01:38', NULL),
(93, 'Dollars', 'SBD', '$', '2023-11-07 21:01:38', NULL),
(94, 'Shillings', 'SOS', 'S', '2023-11-07 21:01:38', NULL),
(95, 'Rand', 'ZAR', 'R', '2023-11-07 21:01:38', NULL),
(96, 'Rupees', 'LKR', '₨', '2023-11-07 21:01:38', NULL),
(97, 'Kronor', 'SEK', 'kr', '2023-11-07 21:01:38', NULL),
(98, 'Dollars', 'SRD', '$', '2023-11-07 21:01:38', NULL),
(99, 'Pounds', 'SYP', '£', '2023-11-07 21:01:38', NULL),
(100, 'New Dollars', 'TWD', 'NT$', '2023-11-07 21:01:38', NULL),
(101, 'Baht', 'THB', '฿', '2023-11-07 21:01:38', NULL),
(102, 'Dollars', 'TTD', 'TT$', '2023-11-07 21:01:38', NULL),
(103, 'Lira', 'TRY', '₺', '2023-11-07 21:01:38', NULL),
(104, 'Liras', 'TRL', '£', '2023-11-07 21:01:38', NULL),
(105, 'Dollars', 'TVD', '$', '2023-11-07 21:01:38', NULL),
(106, 'Hryvnia', 'UAH', '₴', '2023-11-07 21:01:38', NULL),
(107, 'Pesos', 'UYU', '$U', '2023-11-07 21:01:38', NULL),
(108, 'Sums', 'UZS', 'лв', '2023-11-07 21:01:38', NULL),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', '2023-11-07 21:01:38', NULL),
(110, 'Dong', 'VND', '₫', '2023-11-07 21:01:38', NULL),
(111, 'Rials', 'YER', '﷼', '2023-11-07 21:01:38', NULL),
(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', '2023-11-07 21:01:38', NULL),
(113, 'Rupees', 'INR', '₹', '2023-11-07 21:01:38', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `currency_alloweds`
--

CREATE TABLE `currency_alloweds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `custom_layouts`
--

CREATE TABLE `custom_layouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `font_family_default` varchar(191) DEFAULT NULL,
  `primary_color` varchar(20) NOT NULL DEFAULT '#0073D2',
  `primary_opacity_color` varchar(20) DEFAULT NULL,
  `secundary_color` varchar(20) NOT NULL DEFAULT '#084375',
  `gray_dark_color` varchar(20) NOT NULL DEFAULT '#3b3b3b',
  `gray_light_color` varchar(20) NOT NULL DEFAULT '#c9c9c9',
  `gray_medium_color` varchar(20) NOT NULL DEFAULT '#676767',
  `gray_over_color` varchar(20) NOT NULL DEFAULT '#1A1C20',
  `title_color` varchar(20) NOT NULL DEFAULT '#ffffff',
  `text_color` varchar(20) NOT NULL DEFAULT '#98A7B5',
  `sub_text_color` varchar(20) NOT NULL DEFAULT '#656E78',
  `placeholder_color` varchar(20) NOT NULL DEFAULT '#4D565E',
  `background_color` varchar(20) NOT NULL DEFAULT '#24262B',
  `background_base` varchar(20) DEFAULT '#ECEFF1',
  `background_base_dark` varchar(20) DEFAULT '#24262B',
  `carousel_banners` varchar(20) DEFAULT '#1E2024',
  `carousel_banners_dark` varchar(20) DEFAULT '#1E2024',
  `sidebar_color` varchar(20) DEFAULT NULL,
  `sidebar_color_dark` varchar(20) DEFAULT NULL,
  `navtop_color` varchar(20) DEFAULT NULL,
  `navtop_color_dark` varchar(20) DEFAULT NULL,
  `side_menu` varchar(20) DEFAULT NULL,
  `side_menu_dark` varchar(20) DEFAULT NULL,
  `input_primary` varchar(20) DEFAULT NULL,
  `input_primary_dark` varchar(20) DEFAULT NULL,
  `footer_color` varchar(20) DEFAULT NULL,
  `footer_color_dark` varchar(20) DEFAULT NULL,
  `card_color` varchar(20) DEFAULT NULL,
  `card_color_dark` varchar(20) DEFAULT NULL,
  `border_radius` varchar(20) NOT NULL DEFAULT '.25rem',
  `custom_css` text DEFAULT NULL,
  `custom_js` text DEFAULT NULL,
  `custom_body` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_header` longtext DEFAULT NULL,
  `image_navbar` varchar(100) DEFAULT NULL,
  `popup_fluatuante` varchar(100) DEFAULT NULL,
  `link_fluatuante` varchar(100) DEFAULT NULL,
  `popup2_fluatuante` varchar(100) DEFAULT NULL,
  `link_fluatuante2` varchar(100) DEFAULT NULL,
  `idPixelFC` varchar(100) DEFAULT NULL,
  `idPixelGoogle` varchar(100) DEFAULT NULL,
  `link_suporte` varchar(100) DEFAULT NULL,
  `image_Jackpot` varchar(100) DEFAULT NULL,
  `background_tela` varchar(100) DEFAULT NULL,
  `background_botoes` varchar(100) DEFAULT NULL,
  `background_navbar` varchar(100) DEFAULT NULL,
  `background_sidebar` varchar(100) DEFAULT NULL,
  `image_hot1` varchar(100) DEFAULT NULL,
  `image_hot2` varchar(100) DEFAULT NULL,
  `image_hot3` varchar(100) DEFAULT NULL,
  `image_hot4` varchar(100) DEFAULT NULL,
  `image_hot5` varchar(100) DEFAULT NULL,
  `banner_deposito1` varchar(100) DEFAULT NULL,
  `banner_deposito2` varchar(100) DEFAULT NULL,
  `banner_registro` varchar(100) DEFAULT NULL,
  `banner_login` varchar(100) DEFAULT NULL,
  `link_app` varchar(100) DEFAULT NULL,
  `link_telegram` varchar(100) DEFAULT NULL,
  `link_facebook` varchar(100) DEFAULT NULL,
  `link_whatsapp` varchar(100) DEFAULT NULL,
  `link_instagram` varchar(100) DEFAULT NULL,
  `link_siderbar_1` varchar(100) DEFAULT NULL,
  `link_siderbar_2` varchar(100) DEFAULT NULL,
  `link_siderbar_3` varchar(100) DEFAULT NULL,
  `link_lincenca` varchar(100) DEFAULT NULL,
  `navbar_imglogin` varchar(100) DEFAULT NULL,
  `menucell_inicio` varchar(100) DEFAULT NULL,
  `menucell_carteira` varchar(100) DEFAULT NULL,
  `menucell_afiliado` varchar(100) DEFAULT NULL,
  `menucell_saque` varchar(100) DEFAULT NULL,
  `menucell_sair` varchar(100) DEFAULT NULL,
  `footer_imagen1` varchar(100) DEFAULT NULL,
  `footer_imagen2` varchar(100) DEFAULT NULL,
  `footer_imagen3` varchar(100) DEFAULT NULL,
  `footer_telegram` varchar(100) DEFAULT NULL,
  `footer_facebook` varchar(100) DEFAULT NULL,
  `footer_whatsapp` varchar(100) DEFAULT NULL,
  `footer_instagram` varchar(100) DEFAULT NULL,
  `footer_mais18` varchar(100) DEFAULT NULL,
  `mensagem_home` text DEFAULT NULL,
  `menucell_suporte` varchar(255) DEFAULT NULL,
  `custom_modal_pop` text DEFAULT NULL,
  `navebar_app` varchar(255) DEFAULT NULL,
  `footer_background` varchar(100) DEFAULT NULL,
  `footer_text_color` varchar(100) DEFAULT NULL,
  `footer_links` varchar(100) DEFAULT NULL,
  `footer_button_background` varchar(100) DEFAULT NULL,
  `footer_button_text` varchar(100) DEFAULT NULL,
  `footer_button_border` varchar(100) DEFAULT NULL,
  `footer_icons` varchar(100) DEFAULT NULL,
  `footer_titulos` varchar(100) DEFAULT NULL,
  `footer_button_hover_language` varchar(100) DEFAULT NULL,
  `footer_button_color_language` varchar(100) DEFAULT NULL,
  `footer_button_background_language` varchar(100) DEFAULT NULL,
  `footer_button_border_language` varchar(100) DEFAULT NULL,
  `footer_background_language` varchar(100) DEFAULT NULL,
  `sidebar_background` varchar(30) DEFAULT NULL,
  `sidebar_button_missoes_background` varchar(30) DEFAULT NULL,
  `sidebar_button_vip_background` varchar(30) DEFAULT NULL,
  `sidebar_button_ganhe_background` varchar(30) DEFAULT NULL,
  `sidebar_button_missoes_text` varchar(30) DEFAULT NULL,
  `sidebar_button_ganhe_text` varchar(30) DEFAULT NULL,
  `sidebar_button_vip_text` varchar(30) DEFAULT NULL,
  `sidebar_button_hover` varchar(30) DEFAULT NULL,
  `sidebar_text_hover` varchar(30) DEFAULT NULL,
  `sidebar_text_color` varchar(30) DEFAULT NULL,
  `sidebar_border` varchar(30) DEFAULT NULL,
  `sidebar_icons` varchar(30) DEFAULT NULL,
  `navbar_background` varchar(30) DEFAULT NULL,
  `navbar_text` varchar(30) DEFAULT NULL,
  `navbar_icon_menu` varchar(30) DEFAULT NULL,
  `navbar_icon_promocoes` varchar(30) DEFAULT NULL,
  `navbar_icon_casino` varchar(30) DEFAULT NULL,
  `navbar_icon_sport` varchar(30) DEFAULT NULL,
  `navbar_button_text_login` varchar(30) DEFAULT NULL,
  `navbar_button_text_registro` varchar(30) DEFAULT NULL,
  `navbar_button_background_login` varchar(30) DEFAULT NULL,
  `navbar_button_background_registro` varchar(30) DEFAULT NULL,
  `navbar_button_border_color` varchar(30) DEFAULT NULL,
  `navbar_button_text_superior` varchar(30) DEFAULT NULL,
  `navbar_button_background_superior` varchar(30) DEFAULT NULL,
  `navbar_text_superior` varchar(30) DEFAULT NULL,
  `navbar_button_deposito_background` varchar(20) DEFAULT NULL,
  `navbar_button_deposito_text_color` varchar(20) DEFAULT NULL,
  `navbar_button_deposito_border_color` varchar(20) DEFAULT NULL,
  `navbar_button_deposito_píx_color_text` varchar(20) DEFAULT NULL,
  `navbar_button_deposito_píx_background` varchar(20) DEFAULT NULL,
  `navbar_button_deposito_píx_icon` varchar(20) DEFAULT NULL,
  `navbar_button_carteira_background` varchar(20) DEFAULT NULL,
  `navbar_button_carteira_text_color` varchar(20) DEFAULT NULL,
  `navbar_button_carteira_border_color` varchar(20) DEFAULT NULL,
  `navbar_perfil_text_color` varchar(20) DEFAULT NULL,
  `navbar_perfil_background` varchar(20) DEFAULT NULL,
  `navbar_perfil_icon_color` varchar(20) DEFAULT NULL,
  `navbar_icon_promocoes_segunda_cor` varchar(20) DEFAULT NULL,
  `navbar_perfil_icon_color_border` varchar(20) DEFAULT NULL,
  `navbar_perfil_modal_icon_color` varchar(20) DEFAULT NULL,
  `navbar_perfil_modal_text_modal` varchar(20) DEFAULT NULL,
  `navbar_perfil_modal_background_modal` varchar(20) DEFAULT NULL,
  `navbar_perfil_modal_hover_modal` varchar(20) DEFAULT NULL,
  `sidebar_icons_background` varchar(30) DEFAULT NULL,
  `home_background_button_banner` varchar(20) DEFAULT NULL,
  `home_icon_color_button_banner` varchar(20) DEFAULT NULL,
  `home_background_categorias` varchar(20) DEFAULT NULL,
  `home_text_color_categorias` varchar(20) DEFAULT NULL,
  `home_background_pesquisa` varchar(20) DEFAULT NULL,
  `home_text_color_pesquisa` varchar(20) DEFAULT NULL,
  `home_background_pesquisa_aviso` varchar(20) DEFAULT NULL,
  `home_text_color_pesquisa_aviso` varchar(20) DEFAULT NULL,
  `home_background_button_pesquisa` varchar(20) DEFAULT NULL,
  `home_icon_color_button_pesquisa` varchar(20) DEFAULT NULL,
  `home_background_button_vertodos` varchar(20) DEFAULT NULL,
  `home_text_color_button_vertodos` varchar(20) DEFAULT NULL,
  `home_background_button_jogar` varchar(20) DEFAULT NULL,
  `home_text_color_button_jogar` varchar(20) DEFAULT NULL,
  `home_icon_color_button_jogar` varchar(20) DEFAULT NULL,
  `home_hover_jogar` varchar(20) DEFAULT NULL,
  `home_text_color` varchar(20) DEFAULT NULL,
  `home_background` varchar(20) DEFAULT NULL,
  `home_background_input_pesquisa` varchar(20) DEFAULT NULL,
  `home_border_color_input_pesquisa` varchar(20) DEFAULT NULL,
  `home_icon_color_input_pesquisa` varchar(20) DEFAULT NULL,
  `gamelist_background` varchar(20) DEFAULT NULL,
  `gamelist_input_background` varchar(20) DEFAULT NULL,
  `gamelist_input_text_color` varchar(20) DEFAULT NULL,
  `gamelist_input_border_color` varchar(20) DEFAULT NULL,
  `gamelist_text_color` varchar(20) DEFAULT NULL,
  `gamelist_button_background` varchar(20) DEFAULT NULL,
  `gamelist_button_text_color` varchar(20) DEFAULT NULL,
  `gamelist_button_border_color` varchar(20) DEFAULT NULL,
  `register_background` varchar(20) DEFAULT NULL,
  `register_text_color` varchar(20) DEFAULT NULL,
  `register_links_color` varchar(20) DEFAULT NULL,
  `register_input_background` varchar(20) DEFAULT NULL,
  `register_input_text_color` varchar(20) DEFAULT NULL,
  `register_input_border_color` varchar(20) DEFAULT NULL,
  `register_button_text_color` varchar(20) DEFAULT NULL,
  `register_button_background` varchar(20) DEFAULT NULL,
  `register_button_border_color` varchar(20) DEFAULT NULL,
  `login_background` varchar(20) DEFAULT NULL,
  `login_text_color` varchar(20) DEFAULT NULL,
  `login_links_color` varchar(20) DEFAULT NULL,
  `login_input_background` varchar(20) DEFAULT NULL,
  `login_input_text_color` varchar(20) DEFAULT NULL,
  `login_input_border_color` varchar(20) DEFAULT NULL,
  `login_button_text_color` varchar(20) DEFAULT NULL,
  `login_button_background` varchar(20) DEFAULT NULL,
  `login_button_border_color` varchar(20) DEFAULT NULL,
  `esqueci_background` varchar(20) DEFAULT NULL,
  `esqueci_text_color` varchar(20) DEFAULT NULL,
  `esqueci_input_background` varchar(20) DEFAULT NULL,
  `esqueci_input_text_color` varchar(20) DEFAULT NULL,
  `esqueci_input_border_color` varchar(20) DEFAULT NULL,
  `esqueci_button_text_color` varchar(20) DEFAULT NULL,
  `esqueci_button_background` varchar(20) DEFAULT NULL,
  `esqueci_button_border_color` varchar(20) DEFAULT NULL,
  `geral_icons_color` varchar(20) DEFAULT NULL,
  `register_security_color` varchar(20) DEFAULT NULL,
  `register_security_background` varchar(20) DEFAULT NULL,
  `register_security_border_color` varchar(20) DEFAULT NULL,
  `topo_icon_color` varchar(20) DEFAULT NULL,
  `topo_button_text_color` varchar(20) DEFAULT NULL,
  `topo_button_background` varchar(20) DEFAULT NULL,
  `topo_button_border_color` varchar(20) DEFAULT NULL,
  `affiliates_background` varchar(20) DEFAULT NULL,
  `affiliates_sub_background` varchar(20) DEFAULT NULL,
  `affiliates_text_color` varchar(20) DEFAULT NULL,
  `affiliates_numero_color` varchar(20) DEFAULT NULL,
  `affiliates_button_saque_background` varchar(20) DEFAULT NULL,
  `affiliates_button_saque_text` varchar(20) DEFAULT NULL,
  `affiliates_button_copie_background` varchar(20) DEFAULT NULL,
  `affiliates_button_copie_text` varchar(20) DEFAULT NULL,
  `affiliates_icom_color` varchar(20) DEFAULT NULL,
  `carteira_button_background` varchar(20) DEFAULT NULL,
  `carteira_button_text_color` varchar(20) DEFAULT NULL,
  `carteira_button_border_color` varchar(20) DEFAULT NULL,
  `carteira_icon_color` varchar(20) DEFAULT NULL,
  `carteira_text_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_background` varchar(20) DEFAULT NULL,
  `carteira_saldo_text_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_border_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_title_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_icon_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_number_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_button_deposito_background` varchar(20) DEFAULT NULL,
  `carteira_saldo_button_saque_background` varchar(20) DEFAULT NULL,
  `carteira_saldo_button_deposito_text_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_button_saque_text_color` varchar(20) DEFAULT NULL,
  `carteira_deposito_background` varchar(20) DEFAULT NULL,
  `carteira_deposito_contagem_background` varchar(20) DEFAULT NULL,
  `carteira_deposito_contagem_text_color` varchar(20) DEFAULT NULL,
  `carteira_deposito_contagem_number_color` varchar(20) DEFAULT NULL,
  `carteira_deposito_contagem_quadrado_background` varchar(20) DEFAULT NULL,
  `carteira_deposito_input_background` varchar(20) DEFAULT NULL,
  `carteira_deposito_input_text_color` varchar(20) DEFAULT NULL,
  `carteira_deposito_input_number_color` varchar(20) DEFAULT NULL,
  `carteira_deposito_input_border_color` varchar(20) DEFAULT NULL,
  `carteira_deposito_title_color` varchar(20) DEFAULT NULL,
  `carteira_deposito_number_color` varchar(20) DEFAULT NULL,
  `carteira_deposito_number_background` varchar(20) DEFAULT NULL,
  `carteira_deposito_button_background` varchar(20) DEFAULT NULL,
  `carteira_deposito_button_text_color` varchar(20) DEFAULT NULL,
  `carteira_saque_background` varchar(20) DEFAULT NULL,
  `carteira_saque_text_color` varchar(20) DEFAULT NULL,
  `carteira_saque_number_color` varchar(20) DEFAULT NULL,
  `carteira_saque_input_background` varchar(20) DEFAULT NULL,
  `carteira_saque_input_text_color` varchar(20) DEFAULT NULL,
  `carteira_saque_input_border_color` varchar(20) DEFAULT NULL,
  `carteira_saque_button_text_color` varchar(20) DEFAULT NULL,
  `carteira_saque_button_background` varchar(20) DEFAULT NULL,
  `carteira_saque_icon_color` varchar(20) DEFAULT NULL,
  `carteira_history_background` varchar(20) DEFAULT NULL,
  `carteira_history_title_color` varchar(20) DEFAULT NULL,
  `carteira_history_text_color` varchar(20) DEFAULT NULL,
  `carteira_history_number_color` varchar(20) DEFAULT NULL,
  `carteira_history_status_finalizado_color` varchar(20) DEFAULT NULL,
  `carteira_history_status_finalizado_background` varchar(20) DEFAULT NULL,
  `carteira_history_status_pedente_color` varchar(20) DEFAULT NULL,
  `carteira_history_status_pedente_background` varchar(20) DEFAULT NULL,
  `carteira_history_barra_color` varchar(20) DEFAULT NULL,
  `carteira_history_barra_text_color` varchar(20) DEFAULT NULL,
  `carteira_history_icon_color` varchar(20) DEFAULT NULL,
  `carteira_background` varchar(20) DEFAULT NULL,
  `carteira_saldo_pix_Texot_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_pix_sub_text_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_pix_button_background` varchar(20) DEFAULT NULL,
  `carteira_saldo_pix_button_text_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_pix_input_background` varchar(20) DEFAULT NULL,
  `carteira_saldo_pix_input_text_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_pix_border_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_pix_icon_color` varchar(20) DEFAULT NULL,
  `carteira_saldo_pix_background` varchar(20) DEFAULT NULL,
  `carteira_history_barra_background` varchar(20) DEFAULT NULL,
  `promocoes_background` varchar(20) DEFAULT NULL,
  `promocoes_title_color` varchar(20) DEFAULT NULL,
  `promocoes_text_color` varchar(20) DEFAULT NULL,
  `promocoes_sub_background` varchar(20) DEFAULT NULL,
  `promocoes_button_background` varchar(20) DEFAULT NULL,
  `promocoes_button_text_color` varchar(20) DEFAULT NULL,
  `promocoes_pupup_background` varchar(20) DEFAULT NULL,
  `promocoes_pupup_text_color` varchar(20) DEFAULT NULL,
  `promocoes_icon_color` varchar(20) DEFAULT NULL,
  `vips_background` varchar(20) DEFAULT NULL,
  `vips_title_color` varchar(20) DEFAULT NULL,
  `vips_text_color` varchar(20) DEFAULT NULL,
  `vips_description_color` varchar(20) DEFAULT NULL,
  `vips_button_background` varchar(20) DEFAULT NULL,
  `vips_button_text_color` varchar(20) DEFAULT NULL,
  `vips_progress_background` varchar(20) DEFAULT NULL,
  `vips_progress_text_color` varchar(20) DEFAULT NULL,
  `vips_progress_prenchimento_background` varchar(20) DEFAULT NULL,
  `vips_icons_text_color` varchar(20) DEFAULT NULL,
  `vips_icons_background` varchar(20) DEFAULT NULL,
  `vips_icons_sub_text_color` varchar(20) DEFAULT NULL,
  `vips_background_profile_vip` varchar(20) DEFAULT NULL,
  `vips_icon_mover_color` varchar(20) DEFAULT NULL,
  `vip_atual_background` varchar(20) DEFAULT NULL,
  `vip_atual_text_color` varchar(20) DEFAULT NULL,
  `vip_proximo_background` varchar(20) DEFAULT NULL,
  `vip_proximo_text_color` varchar(20) DEFAULT NULL,
  `missoes_background` varchar(20) DEFAULT NULL,
  `missoes_sub_background` varchar(20) DEFAULT NULL,
  `missoes_text_color` varchar(20) DEFAULT NULL,
  `missoes_title_color` varchar(20) DEFAULT NULL,
  `missoes_bonus_background` varchar(20) DEFAULT NULL,
  `missoes_bonus_text_color` varchar(20) DEFAULT NULL,
  `missoes_button_background` varchar(20) DEFAULT NULL,
  `missoes_button_text_color` varchar(20) DEFAULT NULL,
  `missoes_barraprogresso_background` varchar(20) DEFAULT NULL,
  `missoes_barraprogresso_prenchimento_background` varchar(20) DEFAULT NULL,
  `missoes_barraprogresso_text_color` varchar(20) DEFAULT NULL,
  `menu_cell_background` varchar(20) DEFAULT NULL,
  `menu_cell_text_color` varchar(20) DEFAULT NULL,
  `background_geral` varchar(20) DEFAULT NULL,
  `background_geral_text_color` varchar(20) DEFAULT NULL,
  `carregando_background` varchar(20) DEFAULT NULL,
  `carregando_text_color` varchar(20) DEFAULT NULL,
  `popup_cookies_background` text DEFAULT NULL,
  `popup_cookies_text_color` text DEFAULT NULL,
  `popup_cookies_button_background` text DEFAULT NULL,
  `popup_cookies_button_text_color` text DEFAULT NULL,
  `popup_cookies_button_border_color` text DEFAULT NULL,
  `homepage_jogos_em_destaque` varchar(220) DEFAULT NULL,
  `vip_titulo` varchar(220) DEFAULT NULL,
  `vip_descriçao` varchar(220) DEFAULT NULL,
  `vip_sub_texto` varchar(220) DEFAULT NULL,
  `vip_sub_titulo` varchar(220) DEFAULT NULL,
  `aviso_sport_background` varchar(20) DEFAULT NULL,
  `aviso_sport_text_color` varchar(20) DEFAULT NULL,
  `titulo_principal_termos` varchar(20) DEFAULT NULL,
  `titulo_segundario_termos` varchar(20) DEFAULT NULL,
  `descriçao_segundario_termos` varchar(20) DEFAULT NULL,
  `myconta_background` varchar(20) DEFAULT NULL,
  `myconta_text_color` varchar(20) DEFAULT NULL,
  `myconta_button_background` varchar(20) DEFAULT NULL,
  `myconta_button_icon_color` varchar(20) DEFAULT NULL,
  `myconta_sub_background` varchar(20) DEFAULT NULL,
  `central_suporte_background` varchar(20) DEFAULT NULL,
  `central_suporte_sub_background` varchar(20) DEFAULT NULL,
  `central_suporte_button_background_ao_vivo` varchar(20) DEFAULT NULL,
  `central_suporte_button_texto_ao_vivo` varchar(20) DEFAULT NULL,
  `central_suporte_button_icon_ao_vivo` varchar(20) DEFAULT NULL,
  `central_suporte_button_background_denuncia` varchar(20) DEFAULT NULL,
  `central_suporte_button_texto_denuncia` varchar(20) DEFAULT NULL,
  `central_suporte_button_icon_denuncia` varchar(20) DEFAULT NULL,
  `central_suporte_title_text_color` varchar(20) DEFAULT NULL,
  `central_suporte_icon_title_text_color` varchar(20) DEFAULT NULL,
  `central_suporte_info_text_color` varchar(20) DEFAULT NULL,
  `central_suporte_info_icon_color` varchar(20) DEFAULT NULL,
  `central_suporte_aviso_title_color` varchar(20) DEFAULT NULL,
  `central_suporte_aviso_text_color` varchar(20) DEFAULT NULL,
  `central_suporte_aviso_text_negrito_color` varchar(20) DEFAULT NULL,
  `central_suporte_aviso_icon_color` varchar(20) DEFAULT NULL,
  `bonus_diario_texto` varchar(20) DEFAULT NULL,
  `bonus_diario_texto_icon` varchar(20) DEFAULT NULL,
  `bonus_diario_texto_valor_bonus` varchar(20) DEFAULT NULL,
  `bonus_diario_aviso` varchar(20) DEFAULT NULL,
  `bonus_diario_botao_backgroud` varchar(20) DEFAULT NULL,
  `bonus_diario_botao_texto_color` varchar(20) DEFAULT NULL,
  `bonus_diario_regras_title` varchar(20) DEFAULT NULL,
  `bonus_diario_regras_titulo` varchar(20) DEFAULT NULL,
  `bonus_diario_bola_interna` varchar(20) DEFAULT NULL,
  `bonus_diario_bola_fora_` varchar(20) DEFAULT NULL,
  `bonus_diario_bola_carregamento` varchar(20) DEFAULT NULL,
  `bonus_diario_texto_bola` varchar(20) DEFAULT NULL,
  `bonus_diario_background` varchar(20) DEFAULT NULL,
  `bonus_diario_sub_background` varchar(20) DEFAULT NULL,
  `sidebar_button_bonus_background` varchar(20) DEFAULT NULL,
  `token_jivochat` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `custom_layouts`
--

INSERT INTO `custom_layouts` (`id`, `font_family_default`, `primary_color`, `primary_opacity_color`, `secundary_color`, `gray_dark_color`, `gray_light_color`, `gray_medium_color`, `gray_over_color`, `title_color`, `text_color`, `sub_text_color`, `placeholder_color`, `background_color`, `background_base`, `background_base_dark`, `carousel_banners`, `carousel_banners_dark`, `sidebar_color`, `sidebar_color_dark`, `navtop_color`, `navtop_color_dark`, `side_menu`, `side_menu_dark`, `input_primary`, `input_primary_dark`, `footer_color`, `footer_color_dark`, `card_color`, `card_color_dark`, `border_radius`, `custom_css`, `custom_js`, `custom_body`, `created_at`, `updated_at`, `custom_header`, `image_navbar`, `popup_fluatuante`, `link_fluatuante`, `popup2_fluatuante`, `link_fluatuante2`, `idPixelFC`, `idPixelGoogle`, `link_suporte`, `image_Jackpot`, `background_tela`, `background_botoes`, `background_navbar`, `background_sidebar`, `image_hot1`, `image_hot2`, `image_hot3`, `image_hot4`, `image_hot5`, `banner_deposito1`, `banner_deposito2`, `banner_registro`, `banner_login`, `link_app`, `link_telegram`, `link_facebook`, `link_whatsapp`, `link_instagram`, `link_siderbar_1`, `link_siderbar_2`, `link_siderbar_3`, `link_lincenca`, `navbar_imglogin`, `menucell_inicio`, `menucell_carteira`, `menucell_afiliado`, `menucell_saque`, `menucell_sair`, `footer_imagen1`, `footer_imagen2`, `footer_imagen3`, `footer_telegram`, `footer_facebook`, `footer_whatsapp`, `footer_instagram`, `footer_mais18`, `mensagem_home`, `menucell_suporte`, `custom_modal_pop`, `navebar_app`, `footer_background`, `footer_text_color`, `footer_links`, `footer_button_background`, `footer_button_text`, `footer_button_border`, `footer_icons`, `footer_titulos`, `footer_button_hover_language`, `footer_button_color_language`, `footer_button_background_language`, `footer_button_border_language`, `footer_background_language`, `sidebar_background`, `sidebar_button_missoes_background`, `sidebar_button_vip_background`, `sidebar_button_ganhe_background`, `sidebar_button_missoes_text`, `sidebar_button_ganhe_text`, `sidebar_button_vip_text`, `sidebar_button_hover`, `sidebar_text_hover`, `sidebar_text_color`, `sidebar_border`, `sidebar_icons`, `navbar_background`, `navbar_text`, `navbar_icon_menu`, `navbar_icon_promocoes`, `navbar_icon_casino`, `navbar_icon_sport`, `navbar_button_text_login`, `navbar_button_text_registro`, `navbar_button_background_login`, `navbar_button_background_registro`, `navbar_button_border_color`, `navbar_button_text_superior`, `navbar_button_background_superior`, `navbar_text_superior`, `navbar_button_deposito_background`, `navbar_button_deposito_text_color`, `navbar_button_deposito_border_color`, `navbar_button_deposito_píx_color_text`, `navbar_button_deposito_píx_background`, `navbar_button_deposito_píx_icon`, `navbar_button_carteira_background`, `navbar_button_carteira_text_color`, `navbar_button_carteira_border_color`, `navbar_perfil_text_color`, `navbar_perfil_background`, `navbar_perfil_icon_color`, `navbar_icon_promocoes_segunda_cor`, `navbar_perfil_icon_color_border`, `navbar_perfil_modal_icon_color`, `navbar_perfil_modal_text_modal`, `navbar_perfil_modal_background_modal`, `navbar_perfil_modal_hover_modal`, `sidebar_icons_background`, `home_background_button_banner`, `home_icon_color_button_banner`, `home_background_categorias`, `home_text_color_categorias`, `home_background_pesquisa`, `home_text_color_pesquisa`, `home_background_pesquisa_aviso`, `home_text_color_pesquisa_aviso`, `home_background_button_pesquisa`, `home_icon_color_button_pesquisa`, `home_background_button_vertodos`, `home_text_color_button_vertodos`, `home_background_button_jogar`, `home_text_color_button_jogar`, `home_icon_color_button_jogar`, `home_hover_jogar`, `home_text_color`, `home_background`, `home_background_input_pesquisa`, `home_border_color_input_pesquisa`, `home_icon_color_input_pesquisa`, `gamelist_background`, `gamelist_input_background`, `gamelist_input_text_color`, `gamelist_input_border_color`, `gamelist_text_color`, `gamelist_button_background`, `gamelist_button_text_color`, `gamelist_button_border_color`, `register_background`, `register_text_color`, `register_links_color`, `register_input_background`, `register_input_text_color`, `register_input_border_color`, `register_button_text_color`, `register_button_background`, `register_button_border_color`, `login_background`, `login_text_color`, `login_links_color`, `login_input_background`, `login_input_text_color`, `login_input_border_color`, `login_button_text_color`, `login_button_background`, `login_button_border_color`, `esqueci_background`, `esqueci_text_color`, `esqueci_input_background`, `esqueci_input_text_color`, `esqueci_input_border_color`, `esqueci_button_text_color`, `esqueci_button_background`, `esqueci_button_border_color`, `geral_icons_color`, `register_security_color`, `register_security_background`, `register_security_border_color`, `topo_icon_color`, `topo_button_text_color`, `topo_button_background`, `topo_button_border_color`, `affiliates_background`, `affiliates_sub_background`, `affiliates_text_color`, `affiliates_numero_color`, `affiliates_button_saque_background`, `affiliates_button_saque_text`, `affiliates_button_copie_background`, `affiliates_button_copie_text`, `affiliates_icom_color`, `carteira_button_background`, `carteira_button_text_color`, `carteira_button_border_color`, `carteira_icon_color`, `carteira_text_color`, `carteira_saldo_background`, `carteira_saldo_text_color`, `carteira_saldo_border_color`, `carteira_saldo_title_color`, `carteira_saldo_icon_color`, `carteira_saldo_number_color`, `carteira_saldo_button_deposito_background`, `carteira_saldo_button_saque_background`, `carteira_saldo_button_deposito_text_color`, `carteira_saldo_button_saque_text_color`, `carteira_deposito_background`, `carteira_deposito_contagem_background`, `carteira_deposito_contagem_text_color`, `carteira_deposito_contagem_number_color`, `carteira_deposito_contagem_quadrado_background`, `carteira_deposito_input_background`, `carteira_deposito_input_text_color`, `carteira_deposito_input_number_color`, `carteira_deposito_input_border_color`, `carteira_deposito_title_color`, `carteira_deposito_number_color`, `carteira_deposito_number_background`, `carteira_deposito_button_background`, `carteira_deposito_button_text_color`, `carteira_saque_background`, `carteira_saque_text_color`, `carteira_saque_number_color`, `carteira_saque_input_background`, `carteira_saque_input_text_color`, `carteira_saque_input_border_color`, `carteira_saque_button_text_color`, `carteira_saque_button_background`, `carteira_saque_icon_color`, `carteira_history_background`, `carteira_history_title_color`, `carteira_history_text_color`, `carteira_history_number_color`, `carteira_history_status_finalizado_color`, `carteira_history_status_finalizado_background`, `carteira_history_status_pedente_color`, `carteira_history_status_pedente_background`, `carteira_history_barra_color`, `carteira_history_barra_text_color`, `carteira_history_icon_color`, `carteira_background`, `carteira_saldo_pix_Texot_color`, `carteira_saldo_pix_sub_text_color`, `carteira_saldo_pix_button_background`, `carteira_saldo_pix_button_text_color`, `carteira_saldo_pix_input_background`, `carteira_saldo_pix_input_text_color`, `carteira_saldo_pix_border_color`, `carteira_saldo_pix_icon_color`, `carteira_saldo_pix_background`, `carteira_history_barra_background`, `promocoes_background`, `promocoes_title_color`, `promocoes_text_color`, `promocoes_sub_background`, `promocoes_button_background`, `promocoes_button_text_color`, `promocoes_pupup_background`, `promocoes_pupup_text_color`, `promocoes_icon_color`, `vips_background`, `vips_title_color`, `vips_text_color`, `vips_description_color`, `vips_button_background`, `vips_button_text_color`, `vips_progress_background`, `vips_progress_text_color`, `vips_progress_prenchimento_background`, `vips_icons_text_color`, `vips_icons_background`, `vips_icons_sub_text_color`, `vips_background_profile_vip`, `vips_icon_mover_color`, `vip_atual_background`, `vip_atual_text_color`, `vip_proximo_background`, `vip_proximo_text_color`, `missoes_background`, `missoes_sub_background`, `missoes_text_color`, `missoes_title_color`, `missoes_bonus_background`, `missoes_bonus_text_color`, `missoes_button_background`, `missoes_button_text_color`, `missoes_barraprogresso_background`, `missoes_barraprogresso_prenchimento_background`, `missoes_barraprogresso_text_color`, `menu_cell_background`, `menu_cell_text_color`, `background_geral`, `background_geral_text_color`, `carregando_background`, `carregando_text_color`, `popup_cookies_background`, `popup_cookies_text_color`, `popup_cookies_button_background`, `popup_cookies_button_text_color`, `popup_cookies_button_border_color`, `homepage_jogos_em_destaque`, `vip_titulo`, `vip_descriçao`, `vip_sub_texto`, `vip_sub_titulo`, `aviso_sport_background`, `aviso_sport_text_color`, `titulo_principal_termos`, `titulo_segundario_termos`, `descriçao_segundario_termos`, `myconta_background`, `myconta_text_color`, `myconta_button_background`, `myconta_button_icon_color`, `myconta_sub_background`, `central_suporte_background`, `central_suporte_sub_background`, `central_suporte_button_background_ao_vivo`, `central_suporte_button_texto_ao_vivo`, `central_suporte_button_icon_ao_vivo`, `central_suporte_button_background_denuncia`, `central_suporte_button_texto_denuncia`, `central_suporte_button_icon_denuncia`, `central_suporte_title_text_color`, `central_suporte_icon_title_text_color`, `central_suporte_info_text_color`, `central_suporte_info_icon_color`, `central_suporte_aviso_title_color`, `central_suporte_aviso_text_color`, `central_suporte_aviso_text_negrito_color`, `central_suporte_aviso_icon_color`, `bonus_diario_texto`, `bonus_diario_texto_icon`, `bonus_diario_texto_valor_bonus`, `bonus_diario_aviso`, `bonus_diario_botao_backgroud`, `bonus_diario_botao_texto_color`, `bonus_diario_regras_title`, `bonus_diario_regras_titulo`, `bonus_diario_bola_interna`, `bonus_diario_bola_fora_`, `bonus_diario_bola_carregamento`, `bonus_diario_texto_bola`, `bonus_diario_background`, `bonus_diario_sub_background`, `sidebar_button_bonus_background`, `token_jivochat`) VALUES
(1, '\'Roboto Condensed\', sans-serif', '#ffffff00', '#ffffff00', '#ffffff00', '#ffe500 ', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff', '#ff0000', '#dbdbdb', '#004014', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '.25rem', NULL, NULL, NULL, '2024-01-01 17:36:03', '2025-04-23 14:21:45', NULL, 'uploads/90GXnUGnOtl7E6nSVlsj4IKqS6y1W3jYEGItCSlW.png', '01J9ZAM4RPSKNQW3N695GZ1DB6.avif', 'https://bulls777.app', '01J9ZAM4RR2A4E3PQ5M1A2CYH8.avif', 'https://bulls777.app', NULL, NULL, 'https://ativaplay.bet/register?code=UXS29WREYW', '01JA29TEJEY3BC59165XT38RQ2.png', '#e0ca00', '#ff0000', '#ff0000', '#ff0000', '01J8BASMD491WBV0X9E8DZ2NXS.png', '01J8BASMD5RF135J7NNXA1PKA8.png', '01J9Z8HDEMMZNSNMVATZ41EZDQ.png', '01J9ZA6MYNHCFFF03A3FC2FZ32.png', '01J8BDN5EFR25JQY7E0CZDXKDM.png', '01JRTJSWTQ2MT3P0N5VYN4HZTP.webp', NULL, '01JRTJSWTS0T8H677J8WSRH1RS.webp', '01JRTJSWTS0T8H677J8WSRH1RT.webp', 'https://ativaplay.bet/register?code=UXS29WREYW', 'https://ativaplay.bet/register?code=UXS29WREYW', 'https://ativaplay.bet/register?code=UXS29WREYW', 'https://ativaplay.bet/register?code=UXS29WREYW', 'https://ativaplay.bet/register?code=UXS29WREYW', 'https://bulls777.app', 'https://bulls777.app', 'https://bulls777.app', 'https://ativaplay.bet/register?code=UXS29WREYW', '01JB0VP8GXSB4MHWHEABGGQF6V.png', '01JFH1BMSJR48G18RW2SSCDDFJ.png', '01JFH1BMSMEEP7W2ZVF8Y67HRA.png', '01JFH1BMSMEEP7W2ZVF8Y67HRB.png', '01JFH1BMSNXS5B5E2V3BP08A6X.png', '01JFH1BMSNXS5B5E2V3BP08A6Y.png', '01JHGVZZV876HAT30A85HY7226.png', '01JHGVZZVAWHV8XB9JP5B3DBSZ.svg', '01JHGXH3JN1J72RFCQZX5ZP1SG.png', '01JA3RZZ2ZT66YA0X4B74K4P93.webp', '01JA3RZZ2ZT66YA0X4B74K4P94.webp', '01JA3RZZ2ZT66YA0X4B74K4P95.webp', '01JA3RZZ2ZT66YA0X4B74K4P96.webp', '01JA3RXYJ9GJ7KP5E7J4MSFHKN.webp', '❤️Olá querido cliente! Para fornecer serviços de saque melhores e mais rápidos, certifique-se de vincular a conta PIX correta para evitar falhas de saque causadas pela incapacidade de processamento do seu sistema de informações de saque. Obrigado pela sua cooperação! ', '01JFH1BMSMEEP7W2ZVF8Y67HR9.png', '<div class=\"w-full relative\">\n    <div class=\"text-[var(--theme-text-color)] font-bold my-[20px] text-[22px] w-full min-h-[24px] text-center leading-[1.3]\">\n        <span class=\"w-full -mb-[2.58824px] pb-[-2.58824px] text-[22px] inline-block leading-[0] overflow-hidden\">\n            <span class=\"text-[14.9067px] sm:text-[22px] inline-block w-full\">\n                <span class=\"leading-[1.2] [overflow:initial] text-center overflow-ellipsis align-middle\" style=\"-webkit-line-clamp: 5;\">\n                    ? Seja bem-vindo a nossa plataforma ?\n                </span>\n            </span>\n        </span>\n    </div>\n    <div></div>\n    <div class=\"text-[var(--theme-text-color)] pb-[20px] sm:pb-0 sm:h-[405px] text-[14px] leading-[1.56] text-left w-full\">\n        <div class=\"w-full h-full px-[30px]\">\n            <div class=\"sm:h-full overflow-x-hidden overflow-y-scroll [scrollbar-width:none]\">\n                <div class=\"my-scrollbar-content\">\n                    <div class=\"D4IXpi08hh8lVGgzIBUz\">\n                        <div>\n                            <p class=\"mb-0\">\n                                ✈️Clique no canal:\n                                <a href=\"https://t.me/gerente_afiliadoschina\" target=\"_blank\" rel=\"noopener\">\n                                    <span style=\"color: #ffeb00;\">Telegram</span>\n                                </a>\n                                <br>?Baixe o app e ganhe R$100:\n                                <a href=\"https://bulls777.app/storage/app/Bulls777.apk target=\"_blank\" rel=\"noopener\">\n                                    <span style=\"color: #ffeb00;\">Baixar app<//span>\n                                </a>\n                                <br>❤️Convide amigos e ganhe até\n                                <span style=\"color: #ffeb00;\">mil</span>\n                                reais por dia.\n                                <br>?Seu Bônus em todos os depósito é\n                                <span style=\"color: #ffeb00;\">100%</span>\n                                <br>? CPA de convite:\n                                <span style=\"color: #ffeb00;\">R$ 10</span>\n                                por pessoa\n                                <br>? Convide amigos, compartilhe e ganhe dinheiro! Comissão\n                                <span style=\"color: #ffeb00;\"> até 50%</span>\n                            </p>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>\n', '01JA5NSFNS236BMBTJMZWZW29G.png', '#08173f ', '#ffffff', '#bfbfbf', '#0073d6', '#ffffff', '#01b7fc', '#ffffff', '#ffffff', '#3b82f680', '#ffffff', '#fdffff0d', '#ffffff', '#323637', '#00152f', '#b22e2e', '#df7800', '#7e14bb', '#ffffff', '#ffffff', '#fffafa', '#ff0000', '#ffffff', '#ffffff', '#050c12', '#ffffff', '#000f21', '#ffffff', '#ffffff', '#fff000', '#ffffff', '#a8a8a8', '#ffffff', '#ffffff', '#0c85d7ad', '#000f21', '#01b7fc', '#000000000', '#000000000', '#000000000', '#01b7fc', '#ffffff', '#01b7fc', '#000000', '#ffe800', '#32bcad', '#fdffff1a', '#03c6fc', '#03c6fc', '#000000000', '#ffffff', '#000000000', '#000000', '#ee00ff', '#01b7fc', '#ffffff', '#000000', '#00fdff3d', '#020e23', '#03c6fc4a', '#ffffff', '#001b49', '#ffffff', '#000c20', '#ffffff', '#001841', '#ffffff', '#1e2124', '#01b7fc', '#002841', '#01b7fc', '#01b7fc', '#030c16', '#030c16', '#000000000', '#ffffff', '#030c16', '#001c31', '#00ffcd00', '#ffffff', '#000c20', '#323637', '#ffffff', '#03c6fc', '#ffffff', '#03c6fc', '#000c20', '#03c6fc4a', '#030c16', '#ffffff', '#03c6fc', '#323637', '#ffffff', '#ffffff', '#ffffff', '#01b7fc', '#ffffff', '#030c16', '#ffffff', '#01b7fc', '#323637', '#01b7fc', '#01b7fc', '#ffffff', '#01b7fc', '#ffffff', '#030c16', '#ffffff', '#323637', '#ffffff', '#ffffff', '#ffffff', '#03c6fc', '#ffffff', '#01b7fc', '#01b7fc', '#ffffff', '#ffffff', '#03c6fc', '#ffffff', '#000c20', '#03c6fc', '#021c47', '#002769', '#ffffff', '#ffffff', '#01b7fc', '#ffffff', '#030c16', '#03c6fc', '#01b7fc', '#01b7fc', '#ffffff', '#ffffff', '#ffffff', '#01b7fc', '#002769 ', '#ffffff', '#01b7fc', '#ffffff', '#ffffff', '#01b7fc', '#01b7fc', '#01b7fc', '#ffffff', '#ffffff', '#002769 ', '#021c47', '#ffffff', '#ffffff', '#01b7fc', '#ffffff', '#030c16', '#030c16', '#01b7fc', '#01b7fc', '#ffffff', '#01b7fc', '#01b7fc', '#ffffff', '#002769 ', '#ffffff', '#01b7fc', '#ffffff', '#030c16', '#01b7fc', '#ffffff', '#01b7fc', '#a400ff', '#002769', '#ffffff', '#01b7fc', '#01b7fc', '#ffffff', '#01b7fc', '#ffffff', '#002769', '#01b7fc', '#ffffff', '#01b7fc', '#021c47', '#ffffff', '#03c6fc', '#01b7fc', '#ffffff', '#ffffff', '#030c16', '#01b7fc', '#03c6fc', '#030c16', '#002769', '#021c47', '#ffffff', '#ffffff', '#002769', '#01b7fc', '#ffffff', '#030c16', '#ffffff', '#ffffff', '#021c47', '#ffffff', '#ffffff', '#ffffff', '#01b7fc', '#ffffff', '#ffffff', '#ffffff', '#01b7fc', '#ffffff', '#002769', '#01b7fc', '#ffffff', '#01b7fc', '#0015f1', '#fcfcfc', '#e500cc', '#ffffff', '#021c47', '#000c20', '#ffffff', '#ffffff', '#00000000', '#ffffff', '#01b7fc', '#ffffff', '#353535ba', '#01b7fc', '#ffffff', '#021c47', '#ffffff', '#030c16', '#ffffff', NULL, NULL, '#030c16', '#ffffff', '#01b7fc', '#ffffff', '#030c16', ' 🔥 Jogados Da Semana', 'Bem vindo(a) à área de Níveis!', 'Junte-se ao nosso Clube e tenha acesso exclusivo a conquistas e benefícios personalizados!                             Experimente o privilégio de receber mais bônus de volta e recompensas que certamente', 'Progresso até o próximo nível:', 'Benefícios de cada nível', '#003993', '#ffffff', '#003993', '#003993', '#ffffff', '#030c16', '#ffffff', '#00c6ff', '#030c16', '#021c47', '#030c16', '#021c47', '#01b7fc', '#ffffff', '#ffffff', '#ff0000', '#fafafa', '#000000', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ff0606', '#ffffff', '#ff0000', '#ffffff', '#ffffff', '#03c6fc', '#ffffff', '#01b7fc', '#01b7fc', '#ffffff', '#ffffff', '#ffffff', '#01b7fc', '#383838', '#01b7fc', '#ffffff', '#030c16', '#021c47', '#ffffff00', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `daily_bonus_claims`
--

CREATE TABLE `daily_bonus_claims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `claimed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `daily_bonus_configs`
--

CREATE TABLE `daily_bonus_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bonus_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cycle_hours` int(11) NOT NULL DEFAULT 24,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `daily_bonus_configs`
--

INSERT INTO `daily_bonus_configs` (`id`, `bonus_value`, `cycle_hours`, `created_at`, `updated_at`) VALUES
(1, 5.00, 12, '2025-02-24 04:44:18', '2025-03-09 23:51:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `debug`
--

CREATE TABLE `debug` (
  `text` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) NOT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `deposits`
--

INSERT INTO `deposits` (`id`, `payment_id`, `user_id`, `amount`, `type`, `proof`, `status`, `currency`, `symbol`, `created_at`, `updated_at`) VALUES
(8, 'dadfa7cd5e79665fdd4emc2652jl5tdd', 21, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-18 13:30:45', '2025-06-18 13:30:45'),
(9, '271bbd19a93887dc24ffmc269tgl2hem', 21, 1.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-18 13:34:27', '2025-06-18 13:34:50'),
(10, '94cf9aca91be12c9d87dmc2xuevx1kmt', 24, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-19 02:26:17', '2025-06-19 02:27:00'),
(11, 'abb1f2dce5091503a12emccjbxnw2a8z', 36, 90.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-25 19:37:42', '2025-06-25 19:38:23'),
(12, '105d5c2e083177c654e8mcct4p1e40g9', 41, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-26 00:12:01', '2025-06-26 00:13:02'),
(13, 'c45a8790fc0bfc92765dmcdlxc4u5j3i', 46, 60.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-26 13:38:06', '2025-06-26 13:38:23'),
(14, 'fa0ce32facdf5e9be084mce2a3aw45te', 51, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-26 21:15:55', '2025-06-26 21:16:32'),
(15, '5f719c8bb3425db1be43mce2al4b10vl', 52, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-26 21:16:18', '2025-06-26 21:16:55'),
(16, '5313cb75861b945c2f5dmce9pkav4q4m', 54, 50.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-27 00:43:54', '2025-06-27 00:43:54'),
(17, 'ed4f418a4674a57e8e7dmce9q4sa2ub3', 54, 100.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-27 00:44:21', '2025-06-27 00:44:44'),
(18, '5e4f87b6f423b40ba1cemce9v96l11hh', 54, 100.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-27 00:48:20', '2025-06-27 00:48:37'),
(19, '4d4c96d2231cf2648baemcemxv533gf7', 54, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-27 06:54:16', '2025-06-27 06:54:16'),
(20, 'a483e79b98955cb132cbmcg51vmn508a', 44, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-28 08:09:03', '2025-06-28 08:09:54'),
(21, 'bf31ee782700a1e4a234mcgt25ny53k3', 85, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-28 19:21:07', '2025-06-28 19:21:48'),
(22, '338b002f84f608489070mcgtojf95euk', 86, 100.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-28 19:38:31', '2025-06-28 19:38:31'),
(23, 'ad63e263e2823463b953mch80fjt583m', 94, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-29 02:19:41', '2025-06-29 02:20:18'),
(24, '4b9727f6747e53b0fd9amchlv16a3w3o', 98, 40.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-29 08:47:23', '2025-06-29 08:48:18'),
(25, '85cf10469ea58da094f4mchn3pmf4jmn', 100, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-29 09:22:08', '2025-06-29 09:22:33'),
(26, '8fc0f5660254f3ea288bmchprspc4i4r', 101, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-29 10:36:50', '2025-06-29 10:37:48'),
(27, 'd9c43732a44513ba08acmci06uz318h2', 108, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-29 15:28:29', '2025-06-29 15:28:53'),
(28, 'b46d40a73edff812ecbbmci0d69t3igx', 109, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-29 15:33:24', '2025-06-29 15:33:45'),
(29, 'ef80f78bc392625ee506mcifkutbo7cw', 113, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-29 22:39:17', '2025-06-29 22:39:47'),
(30, '6a7568208a7a05c1f49amcin2z9o532e', 116, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-30 02:09:20', '2025-06-30 02:09:44'),
(31, 'f871a7ea965ed6e75166mciqc2xi5441', 117, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-06-30 03:40:23', '2025-06-30 03:40:23'),
(32, '1cf6dcea1ceea66d3e24mcjgmke71an7', 126, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-30 15:56:23', '2025-06-30 15:56:57'),
(33, '65f9ea7cda32da7e1fd3mcjo7rwq3rpo', 127, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-06-30 19:28:49', '2025-06-30 19:36:06'),
(34, '6fb175acaf124e22ca99mckyckl44v3h', 133, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-01 17:00:16', '2025-07-01 17:00:41'),
(35, '99494d440de8c77c6b30mcl4qi184g2h', 135, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-01 19:59:03', '2025-07-01 19:59:27'),
(36, '34c97b3828cb00ade48cmclbkt1241qy', 136, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-01 23:10:35', '2025-07-01 23:10:35'),
(37, '33c61694c55345d2861fmclbm8924hez', 136, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-01 23:11:41', '2025-07-01 23:11:58'),
(38, '121e7ec9cce084373e35mcliwy891aew', 139, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-02 02:35:59', '2025-07-02 02:36:32'),
(39, '68421378e554e7558410mclsfgtl4ft8', 143, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-02 07:02:19', '2025-07-02 07:02:44'),
(40, 'a824296116331abec701mcly5yeg3jw7', 144, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-02 09:42:53', '2025-07-02 09:43:20'),
(41, 'a6324475543f1e3fec39mcm5w36p1bfq', 145, 60.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-02 13:19:10', '2025-07-02 13:19:10'),
(42, 'b8d90f246706077b4f5bmcm5wv1j1hxo', 145, 60.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-02 13:19:46', '2025-07-02 13:20:22'),
(43, 'bbd22d989009d8c43711mcmhnno24t1h', 153, 500.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-02 18:48:32', '2025-07-02 18:48:51'),
(44, 'f2396321705a51a45c66mcmi42ew3hs6', 104, 50.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-02 19:01:18', '2025-07-02 19:01:18'),
(45, 'c4bc6f19b64aea7b5132mcmw3gf91z6y', 111, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-03 01:32:44', '2025-07-03 01:33:24'),
(46, 'c65b6b38ae3210334b24mcmxp7cq1ezi', 160, 100.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-03 02:17:38', '2025-07-03 02:18:01'),
(47, '1d1a0c88b02c96a34914mcmzvqik5tje', 161, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-03 03:18:43', '2025-07-03 03:19:11'),
(48, 'af9b11aff3244b9ec161mcn8sb9a37bd', 166, 200.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-03 07:27:59', '2025-07-03 07:29:17'),
(49, '7e27379c7672edd5cbeemco3s47z4mxy', 174, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-03 21:55:40', '2025-07-03 21:56:00'),
(50, 'b8239ff8bd635f5d89camco5n6hn1egh', 177, 100.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-03 22:47:48', '2025-07-03 22:48:15'),
(51, 'bad2e7b48afad6e4046dmco9k3kf5a5k', 179, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-04 00:37:22', '2025-07-04 00:38:34'),
(52, '4cafc4c96ded27e095aemcohkke22j6m', 182, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-04 04:21:43', '2025-07-04 04:22:37'),
(53, '6e1f6c075d8f23a635ebmcosvvm73c5b', 184, 100.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-04 09:38:26', '2025-07-04 09:39:01'),
(54, '74da42969757fa66dbeemcouzcqh2p8s', 185, 200.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-04 10:37:08', '2025-07-04 10:37:31'),
(55, '2847fb51c06e30a2f877mcovmvox22n8', 185, 500.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-04 10:55:24', '2025-07-04 10:55:24'),
(56, 'f644777f679c996089f7mcp28sky5lnh', 189, 50.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-04 14:00:24', '2025-07-04 14:00:24'),
(57, '5bf018bd708e1397d603mcp29f713v3s', 189, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-04 14:00:55', '2025-07-04 14:01:38'),
(58, '9cfd52f8e71a57b7a28fmcpc133p1fw6', 191, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-04 18:34:21', '2025-07-04 18:34:21'),
(59, 'a06e9d3c73611cc6e81fmcq3i4rr27qf', 193, 40.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-05 07:23:25', '2025-07-05 07:24:16'),
(60, 'e984af90445d052ce37fmcq3ulg1465l', 194, 60.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-05 07:33:08', '2025-07-05 07:34:07'),
(61, 'b3e2972ab8c30fbda860mcqk59991ee3', 196, 150.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-05 15:09:19', '2025-07-05 15:09:45'),
(62, '05177b939ca6de0a6668mcr6yrc413jd', 203, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-06 01:48:10', '2025-07-06 01:48:50'),
(63, '9d3c412ac12e6c9a3019mcr8bupzpdxa', 204, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-06 02:26:28', '2025-07-06 02:27:42'),
(64, 'afe36a5927437fff9e9bmcrae2c0p2u6', 205, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-06 03:24:00', '2025-07-06 03:24:27'),
(65, '2199cd6b7efbc8bdf2f8mcs2tuw91mbk', 207, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-06 16:40:07', '2025-07-06 16:41:00'),
(66, '9689893a7e5c43e4c30fmcs8drh749b6', 208, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-06 19:15:34', '2025-07-06 19:16:07'),
(67, '3b481e0da07cfb303218mcvkh69012f1', 211, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-09 03:17:25', '2025-07-09 03:21:27'),
(68, 'cdd5bcc1f8cbd3946a4bmcwqsuwa4684', 213, 100.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-09 23:02:14', '2025-07-09 23:02:14'),
(69, '94378367df0f7cfff374mcwzlea724g7', 216, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-10 03:08:23', '2025-07-10 03:08:23'),
(70, 'a01a24babba958b79bacmcxfei7549dc', 218, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-10 10:30:56', '2025-07-10 10:30:56'),
(71, '98b0ede762cb972e7099mcxw64su52ta', 219, 39.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-10 18:20:18', '2025-07-10 18:20:18'),
(72, '8120c124cf00efdc1b02mcxw6w823axp', 219, 41.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-10 18:20:54', '2025-07-10 18:22:55'),
(73, '013fa0604ecdbda3ff88mcy222n140sr', 220, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-10 21:05:07', '2025-07-10 21:06:11'),
(74, 'e558b6e25e18a63dced1mcy3hcxx5q94', 221, 40.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-10 21:44:59', '2025-07-10 21:45:54'),
(75, '05c877e48fa68a70f500mcy5n1m13ygp', 223, 40.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-10 22:45:23', '2025-07-10 22:45:57'),
(76, 'babb48b626dbe0f65752mcy5t62d3r06', 224, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-10 22:50:11', '2025-07-10 22:51:10'),
(77, 'b13ff85b3dbc9c37893emcy67d3u19or', 225, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-10 23:01:12', '2025-07-10 23:01:52'),
(78, '5a5d8e122f9b2968b232mcy6r90z43ze', 222, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-10 23:16:39', '2025-07-10 23:17:13'),
(79, '2b9bfc09710626c2fcf1mcy92x2b2auz', 227, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-11 00:21:43', '2025-07-11 00:22:57'),
(80, '30d7d1b40ad94baabe09mcy9gh5m10wo', 228, 60.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-11 00:32:16', '2025-07-11 00:32:16'),
(81, 'c2e0099c3020d63c5fb1mcye9rn85iv5', 233, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-11 02:47:01', '2025-07-11 02:48:59'),
(82, '121f8feac9924a989d8amcyhpjtb2w1l', 234, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-11 04:23:16', '2025-07-11 04:23:40'),
(83, '551643c101ddc23a6f2amcywwqhc5xb7', 236, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-11 11:28:46', '2025-07-11 11:29:16'),
(84, '2b884b385797bb47a523mcyydkrf23sh', 237, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-11 12:09:52', '2025-07-11 12:10:23'),
(85, '77cedc13384af6532f1dmcz0esiw2xae', 238, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-11 13:06:46', '2025-07-11 13:07:16'),
(86, '6c2ab093467d699b38d9mczf6jql5dzx', 239, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-11 20:00:16', '2025-07-11 20:04:03'),
(87, '0895c2ac03f2a00249c9mczh8a1j3ylr', 242, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-11 20:57:38', '2025-07-11 20:58:21'),
(88, '2f6c8a5d96719f0b034bmczjj7mn3gof', 244, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-11 22:02:06', '2025-07-11 22:02:06'),
(89, '6bc4b1120adaf7b4210bmczmfh653l13', 245, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-11 23:23:10', '2025-07-11 23:23:10'),
(90, '57cd5b4c4756731dae3emczoalyy52tw', 247, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 00:15:22', '2025-07-12 00:16:02'),
(91, '5f1bbb990c4a9b7235dfmd018eov1niy', 248, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 06:17:35', '2025-07-12 06:18:11'),
(92, '644a6b8d3b9a985b35f7md01c9sy3hmo', 249, 200.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 06:20:35', '2025-07-12 06:22:27'),
(93, 'cab78d246cb6b135be76md077bze4fn7', 250, 589.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 09:04:42', '2025-07-12 09:04:58'),
(94, '1328125fa9b4ef51a0a3md0bh0ul3q06', 243, 100.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 11:04:13', '2025-07-12 11:05:23'),
(95, 'b63fc49d1210726afac1md0fgybl5n45', 252, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-12 12:56:08', '2025-07-12 12:56:08'),
(96, 'ff4e263e8d511907ab50md0fqnni454f', 252, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-12 13:03:41', '2025-07-12 13:03:41'),
(97, 'fcd47862e0373682904emd0fvu011n0w', 253, 40.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 13:07:42', '2025-07-12 13:08:10'),
(98, '9821b589de1f6ebb51bfmd0m1ndt5wb7', 254, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 16:00:10', '2025-07-12 16:00:37'),
(99, 'e4187b88c48997d2e756md0n8r8t4ecd', 255, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 16:33:42', '2025-07-12 16:34:18'),
(100, '429889445437e2ded665md0ufm8i1n03', 256, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 19:55:03', '2025-07-12 19:55:17'),
(101, 'e6623c4b1501815f8d87md0x0cv71byr', 257, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-12 21:07:08', '2025-07-12 21:07:08'),
(102, '046f5035956ae1a010c9md0xx3lf46z1', 257, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-12 21:32:35', '2025-07-12 21:33:06'),
(103, 'fbf45c40d052fd20d221md1bo8792qtt', 262, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-13 03:57:35', '2025-07-13 03:57:55'),
(104, '1c0bc6a105fae53316fcmd1rwwlk1bvr', 263, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-13 11:32:13', '2025-07-13 11:33:07'),
(105, '471e5b9ab77aa7b49a3amd1yjh0kxvqh', 265, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-13 14:37:44', '2025-07-13 14:38:26'),
(106, 'a34c4c1732c6a803302emd2242ir511k', 264, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-13 16:17:45', '2025-07-13 16:19:42'),
(107, '0093baf187809d00a954md30smip3w4s', 272, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-14 08:28:36', '2025-07-14 08:29:51'),
(108, '9b7fa55d90bb8a626d41md38sa2g1w6b', 274, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-14 12:12:18', '2025-07-14 12:12:54'),
(109, 'e1873a7d69b38918a98cmd3bi72lm8pr', 275, 75.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-14 13:28:26', '2025-07-14 13:28:26'),
(110, '950412f59182bd3c5fbbmd3btle73lme', 275, 75.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-14 13:37:19', '2025-07-14 13:37:19'),
(111, '7f12b1f2aeb5b2b28ea9md3ceb742txc', 275, 75.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-14 13:53:24', '2025-07-14 13:53:24'),
(112, 'f4667881c0d2665a806cmd3ghklm5nbb', 277, 70.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-14 15:47:55', '2025-07-14 15:48:18'),
(113, '92707e6ff8d1efadd059md3upgts1qo3', 281, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-14 22:25:58', '2025-07-14 22:26:18'),
(114, 'a4cefb845442dba91f55md3vl9a84m0w', 277, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-14 22:50:40', '2025-07-14 22:51:06'),
(115, 'd42b43a13c079e55b039md51tbcz3dav', 285, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-15 18:32:41', '2025-07-15 18:33:39'),
(116, '67ace9da36c3bef3256dmd5270s51jc0', 286, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-15 18:43:20', '2025-07-15 18:43:20'),
(117, '898012aeff90d6be7f14md52kev45bkc', 286, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-15 18:53:45', '2025-07-15 18:54:05'),
(118, 'e51f4e459d321b895e28md5ckl4t2xbf', 288, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-15 23:33:50', '2025-07-15 23:34:10'),
(119, 'e5b6ce112ee0c5bd5fd3md5cyag73bg9', 289, 60.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-15 23:44:28', '2025-07-15 23:45:00'),
(120, 'fc48fc6eaf2dcaeb35fdmd5djaby4jiv', 289, 130.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-16 00:00:48', '2025-07-16 00:01:14'),
(121, '749b20dea48b2e7b143amd5fknuc3uf1', 283, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-16 00:57:52', '2025-07-16 00:57:52'),
(122, '3309a4309cbeafd97f06md5hnirb5g1w', 292, 5000.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-16 01:56:04', '2025-07-16 01:56:04'),
(123, 'a1d359477347868bd4cfmd5idw0z1xew', 293, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-16 02:16:35', '2025-07-16 02:16:55'),
(124, '1e04627af44803c4e5ebmd5m1m2f128z', 198, 100.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-16 03:59:00', '2025-07-16 03:59:00'),
(125, '3b8b28d077000d2bd555md63gkvj3q0k', 296, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-16 12:06:33', '2025-07-16 12:07:22'),
(126, '0bdc2c174f6a0ec68bfemd6462t351w3', 297, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-16 12:26:22', '2025-07-16 12:26:22'),
(127, '8691e154d8d61e5ff738md65tbeb2rrw', 298, 100.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-16 13:12:26', '2025-07-16 13:13:21'),
(128, 'f04624794756be068f50md6en58q5smz', 300, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-16 17:19:35', '2025-07-16 17:20:24'),
(129, 'cfde971e37c35a3d1e69md7npv9t1bzu', 311, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-17 14:21:24', '2025-07-17 14:21:24'),
(130, '4ab7757e2898b2058b46md7rl1z643rb', 269, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-17 16:09:38', '2025-07-17 16:09:38'),
(131, '6713fcac4526a9e6e3f8md7rlhgn32c9', 269, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-17 16:09:58', '2025-07-17 16:10:51'),
(132, '7b5898b290dd946b3860md909dkk5fqr', 323, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-18 13:00:15', '2025-07-18 13:00:57'),
(133, 'c18d6212ff1eb701708dmd9jpta71iys', 325, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-18 22:04:53', '2025-07-18 22:04:53'),
(134, 'd0a02153fb45ac408cb0md9phduq2m62', 326, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-19 00:46:17', '2025-07-19 00:46:46'),
(135, 'cf4e615c460aeee02a2cmd9uywd149lz', 327, 40.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-19 03:19:52', '2025-07-19 03:20:52'),
(136, 'de493a08a993f72e567dmda89inz5na9', 328, 60.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-19 09:32:03', '2025-07-19 09:32:53'),
(137, '95e0e64d6f931269d34amdais4t41xm3', 329, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-19 14:26:28', '2025-07-19 14:27:01'),
(138, 'bf75c320d8553d9764c5mdbz55ke2ixk', 341, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-20 14:52:15', '2025-07-20 14:53:27'),
(139, '948ad5a32ba8ff169f19mdcaqhb126yj', 343, 100.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-20 20:16:46', '2025-07-20 20:16:46'),
(140, 'e555645673b707a0cb12mdcj5jej4za9', 344, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-21 00:12:26', '2025-07-21 00:12:51'),
(141, 'a5a32458414424b92082mdclunxx2jfp', 347, 33.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-21 01:27:57', '2025-07-21 01:28:41'),
(142, '94f5044f048a94ecc5acmddgwf1r38ip', 349, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-21 15:57:07', '2025-07-21 15:57:35'),
(143, 'd9648d850fe639cee295mddm2fkd13d9', 350, 150.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-21 18:21:46', '2025-07-21 18:22:10'),
(144, '7ebd9e6eaaaac9684d12mde1a54r22oi', 352, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-22 01:27:39', '2025-07-22 01:28:18'),
(145, 'e7b05d433245be486cd8mde1td1h255j', 354, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-22 01:42:36', '2025-07-22 01:44:01'),
(146, 'd604e6af3e2ed6578ccemde25y7i5ols', 354, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-22 01:52:23', '2025-07-22 01:52:56'),
(147, 'c0d158c8355662a5a509mde35207zgaj', 355, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-22 02:19:41', '2025-07-22 02:20:06'),
(148, 'd791079763a6594b10edmde4hlvj2w9q', 356, 100.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-22 02:57:27', '2025-07-22 02:57:54'),
(149, '3a0475f1341c0948579emdf8pdie4o26', 361, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-22 21:43:14', '2025-07-22 21:44:44'),
(150, '48c71514a6e84db5bb21mdfjgy1vt9q7', 364, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-23 02:44:36', '2025-07-23 02:45:00'),
(151, 'c162fa3450a15df155ebmdfjo9ygyedd', 364, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-23 02:50:18', '2025-07-23 02:50:18'),
(152, 'd63572cd67798b7a418cmdflb24y51xk', 366, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-23 03:36:01', '2025-07-23 03:36:22'),
(153, '8595f6f1e3e6e4ad48bemdg2kw6c50ug', 367, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-23 11:39:33', '2025-07-23 11:40:50'),
(154, '0115c194ebd0317cd6camdg3tcq5484p', 368, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-23 12:14:07', '2025-07-23 12:14:49'),
(155, 'e00ac4b383e2767eab55mdgcjfhj2xrs', 369, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-23 16:18:21', '2025-07-23 16:18:57'),
(156, '9d3bfd2acf8b260d05dcmdgzptsc59s5', 370, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-24 03:07:11', '2025-07-24 03:07:26'),
(157, '3b95bffdb232da0c1230mdhgk0311vws', 371, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-24 10:58:32', '2025-07-24 10:59:16'),
(158, '6ee32a97f4d816e0c5ddmdi4y6ds1cyz', 374, 40.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-24 22:21:24', '2025-07-24 22:21:50'),
(159, '3c94da6e132022d6054amdi50wl31eld', 375, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-24 22:23:32', '2025-07-24 22:24:16'),
(160, 'b9769bd4ba86e655e9a3mdi5ebll2tf0', 371, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-24 22:33:58', '2025-07-24 22:33:58'),
(161, '83cdb5216b9f89e08878mdirk1lx3y1b', 378, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-25 08:54:16', '2025-07-25 08:54:35'),
(162, '637e32ce012fab29cb4bmdjbwj2211ah', 381, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-25 18:23:51', '2025-07-25 18:24:10'),
(163, '8efc3dcf633975f37ee2mdjnapcz2zor', 382, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-25 23:42:48', '2025-07-25 23:43:06'),
(164, '7e1f8e59f1e7fb9f1b5bmdne88x63j80', 386, 35.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-07-28 14:40:04', '2025-07-28 14:40:04'),
(165, '5566bd4c83846468d097mdne96jf1fj3', 386, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-28 14:40:45', '2025-07-28 14:41:01'),
(166, '26149f3fec4256ccb488mdpfuefl33dp', 391, 60.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-30 01:00:47', '2025-07-30 01:01:36'),
(167, '2a02f596c4bc59b6a992mdq53pja56n8', 397, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-30 12:47:52', '2025-07-30 12:48:14'),
(168, '475c45dccd4e3c0a8cd2mdqjgewf5sc9', 401, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-30 19:29:39', '2025-07-30 19:30:06'),
(169, '5a0a074795861f16013emdrgj1d537ah', 372, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-31 10:55:29', '2025-07-31 10:55:58'),
(170, '76ee1cb777a6746651e7mds81b8w42jh', 404, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-07-31 23:45:31', '2025-07-31 23:46:49'),
(171, '22c847ccde060a9d7210mdsa0ff35ljt', 406, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-01 00:40:49', '2025-08-01 00:41:05'),
(172, '9823c9ef5b2840e72f12mdskeq2kv7s1', 412, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-01 05:31:52', '2025-08-01 05:32:16'),
(173, '531a663ae2cacae70280mdszyh8r5nyt', 414, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-01 12:47:08', '2025-08-01 12:47:47'),
(174, '9e5ce7c875696279daf5mdtekaje2oci', 416, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-01 19:36:01', '2025-08-01 19:36:27'),
(175, '323ef43e4b85e7856a55mdtf339316l5', 417, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-01 19:50:38', '2025-08-01 19:50:59'),
(176, '7a7288dd3e0abfd162e1mdtl681s2tgm', 418, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-01 22:41:02', '2025-08-01 22:41:55'),
(177, 'b331fab900a611022933mdtob3jo24eb', 421, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-02 00:08:48', '2025-08-02 00:09:40'),
(178, 'b8634a78b71d011415c2mdtog3fw39o4', 422, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-02 00:12:41', '2025-08-02 00:13:15'),
(179, '1afaeffc16114562446dmdtqnhud4k3h', 424, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-02 01:14:25', '2025-08-02 01:14:50'),
(180, 'ec637f632ea02e673935mdtumegp5urf', 426, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-02 03:05:33', '2025-08-02 03:05:59'),
(181, '030faf051c27ae898fa6mdtumu0d53rm', 427, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-08-02 03:05:53', '2025-08-02 03:05:53'),
(182, '585b0d15b93375e00276mdtunjli338v', 427, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-02 03:06:26', '2025-08-02 03:06:50'),
(183, '0b323a8a8921ef8b880emdxd9srz1mdd', 429, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-04 14:10:56', '2025-08-04 14:15:01'),
(184, 'c0ad4be7198f3b57a5f4mdxdo8g42jv6', 429, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-04 14:22:10', '2025-08-04 14:23:05'),
(185, 'ac1f08f07e2d0c3f4a2bmdy073903ssm', 431, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-05 00:52:41', '2025-08-05 00:53:58'),
(186, '912ab306bbeeaa0b4190mdz3a2qm1w3k', 436, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-05 19:06:45', '2025-08-05 19:07:20'),
(187, '4235e77b3c262b6614a9mdzcmrho5xzu', 437, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-05 23:28:34', '2025-08-05 23:29:04'),
(188, '32a677fae27205c75640mdzhu1nr5qgg', 438, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-06 01:54:12', '2025-08-06 01:54:50'),
(189, 'c1a97c94225a84fa2647me00hugv3mcz', 442, 77.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-06 10:36:35', '2025-08-06 10:36:59'),
(190, '7e06e91736ab2c44b1aeme00rueg1v3a', 442, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-06 10:44:22', '2025-08-06 10:44:42'),
(191, 'dbad1714bdecd17615c9me111nuq2dxh', 446, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-07 03:39:46', '2025-08-07 03:40:16'),
(192, '0cafb7203eeea46deaccme1ihk301wym', 449, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-08-07 11:48:01', '2025-08-07 11:48:01'),
(193, '5b299b09f2cc763d8818me1t8bye589t', 452, 100.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-07 16:48:46', '2025-08-07 16:49:29'),
(194, '8cdf88a633f52d8cfcd8me2othdd1q0u', 457, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-08-08 07:33:01', '2025-08-08 07:33:01'),
(195, 'f486242dc4fc69607836me2v5fu112bo', 459, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-08 10:30:17', '2025-08-08 10:31:12'),
(196, 'e49464842dc5069452efme34n0501tss', 460, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-08 14:55:53', '2025-08-08 14:56:21'),
(197, 'f1b8cf1b51f1bac686e6me3k7x985o3q', 461, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-08 22:12:03', '2025-08-08 22:12:40'),
(198, '846e1adcb713404d5a97me4wkrj43cl4', 465, 40.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-09 20:45:44', '2025-08-09 20:46:19'),
(199, 'd41d307fbddb7e5535e2me50mik63krw', 467, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-09 22:39:04', '2025-08-09 22:41:44'),
(200, 'bfcf576140808b3543cbme58vbal2es1', 469, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-10 02:29:51', '2025-08-10 02:30:27'),
(201, '6871db6ee59788dcebbeme5bb0qr121o', 470, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-10 03:38:03', '2025-08-10 03:38:33'),
(202, 'f3c1fd8e6c6ec4a6951dme919rlr5ig8', 476, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-12 18:08:14', '2025-08-12 18:09:09'),
(203, '04af5d5edd1c59a34decmeavfbvw49gw', 477, 150.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-08-14 01:00:08', '2025-08-14 01:00:32'),
(204, '49f4916cde62b624e383merbydhc3awe', 381, 1000.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-08-25 13:27:10', '2025-08-25 13:27:10'),
(205, 'c9125a60000e7d11860bmf5rtj2122v7', 478, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-04 16:00:03', '2025-09-04 16:00:25'),
(206, '65c444f6688b266ab03dmf5xrtf1uyni', 481, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-04 18:46:41', '2025-09-04 18:47:11'),
(207, '52b3be404997f4fb613dmf676ivc2lbn', 482, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-04 23:10:04', '2025-09-04 23:11:21'),
(208, '22cc5fd94f80698863e6mf69zrxb3tfz', 484, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-05 00:28:48', '2025-09-05 00:29:29'),
(209, '810b208d2ba5f2900061mf6bcn925u28', 485, 200.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-05 01:06:48', '2025-09-05 01:07:27'),
(210, 'b7461c3343a14e915e67mf6dcc711w0m', 486, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-05 02:02:33', '2025-09-05 02:02:51'),
(211, '7e6fa663740c5c5df671mf6ztvziq4sx', 487, 300.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-09-05 12:32:03', '2025-09-05 12:32:03'),
(212, '239ae71a7d24b3a2835dmf6zx2jv4bwr', 487, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-09-05 12:34:31', '2025-09-05 12:34:31'),
(213, '24cbe1009b4d078b3861mf6zyqzs1bb3', 487, 30.00, 'pix', NULL, 0, 'BRL', 'R$', '2025-09-05 12:35:50', '2025-09-05 12:35:50'),
(214, '547d2543bc8ccefd49ffmf7doevh4get', 489, 120.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-05 18:59:43', '2025-09-05 19:00:15'),
(215, '3cd7867fcff00cdd185cmf7fbsp32c7i', 491, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-05 19:45:53', '2025-09-05 19:47:58'),
(216, 'dd60e11ed4404a32fc15mf7xv9mmmo59', 487, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-06 04:24:54', '2025-09-06 04:25:16'),
(217, '4652fd0925f726f4a795mf87m6svmw70', 492, 60.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-06 08:57:47', '2025-09-06 08:58:23'),
(218, 'dc3490fe46031ed5d5b1mfczkur417al', 494, 150.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-09 17:11:39', '2025-09-09 17:12:09'),
(219, 'e8ee12c2490493496e45mfd0ob0p3e89', 494, 150.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-09 17:42:19', '2025-09-09 17:42:59'),
(220, 'aa60a584a1cef83e104bmfd2fyst5mcl', 496, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-09 18:31:49', '2025-09-09 18:32:11'),
(221, '301b8645134c209b8b35mfd2qlvu5j57', 497, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-09 18:40:06', '2025-09-09 18:40:42'),
(222, '4fab5d62a108380a7361mfecvhty2zlo', 502, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-10 16:11:36', '2025-09-10 16:11:59'),
(223, '729ec23d2864dbed2e0fmfedytpy2dgo', 503, 50.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-10 16:42:11', '2025-09-10 16:42:43'),
(224, '68cdec267bf1e78dfab2mfegmq8331p8', 504, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-10 17:56:46', '2025-09-10 17:57:14'),
(225, '35d1d2f536e0d67df350mfeyi8jx16x5', 506, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-11 02:17:09', '2025-09-11 02:17:34'),
(226, 'f753f68d97d33c4bbb8dmff0bolz1odb', 507, 30.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-11 03:08:03', '2025-09-11 03:08:17'),
(227, '2b132424e83d83436f6bmffwgv1r12a5', 511, 120.00, 'pix', NULL, 1, 'BRL', 'R$', '2025-09-11 18:07:52', '2025-09-11 18:08:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `digito_pay`
--

CREATE TABLE `digito_pay` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `withdrawal_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `distribution_systems`
--

CREATE TABLE `distribution_systems` (
  `id` int(11) NOT NULL,
  `meta_arrecadacao` int(11) NOT NULL DEFAULT 0,
  `percentual_distribuicao` int(11) NOT NULL DEFAULT 0,
  `rtp_arrecadacao` int(11) NOT NULL DEFAULT 0,
  `rtp_distribuicao` int(11) NOT NULL DEFAULT 0,
  `total_arrecadado` decimal(12,2) DEFAULT 0.00,
  `total_distribuido` decimal(12,2) DEFAULT 0.00,
  `modo` enum('arrecadacao','distribuicao') DEFAULT 'arrecadacao',
  `ativo` tinyint(1) DEFAULT 0,
  `start_cycle_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `distribution_systems`
--

INSERT INTO `distribution_systems` (`id`, `meta_arrecadacao`, `percentual_distribuicao`, `rtp_arrecadacao`, `rtp_distribuicao`, `total_arrecadado`, `total_distribuido`, `modo`, `ativo`, `start_cycle_at`, `created_at`, `updated_at`) VALUES
(1, 100000, 30, 10, 95, 40.80, 0.00, 'arrecadacao', 1, '2025-04-14 20:17:21', '2025-02-17 22:08:07', '2025-04-21 21:11:41');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ezzepay`
--

CREATE TABLE `ezzepay` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `withdrawal_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL,
  `game_server_url` varchar(191) DEFAULT 'inativo',
  `game_id` varchar(191) NOT NULL,
  `game_name` varchar(191) NOT NULL,
  `game_code` varchar(191) NOT NULL,
  `game_type` varchar(191) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `cover` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT '0',
  `technology` varchar(191) DEFAULT 'html5',
  `has_lobby` tinyint(4) NOT NULL DEFAULT 0,
  `is_mobile` tinyint(4) NOT NULL DEFAULT 0,
  `has_freespins` tinyint(4) NOT NULL DEFAULT 0,
  `has_tables` tinyint(4) NOT NULL DEFAULT 0,
  `only_demo` tinyint(4) DEFAULT 0,
  `rtp` bigint(20) NOT NULL DEFAULT 0,
  `distribution` varchar(191) NOT NULL DEFAULT 'play_fiver',
  `views` bigint(20) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) DEFAULT 0,
  `show_home` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `original` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games`
--

INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `original`) VALUES
(1, 21, 'inativo', 'vswaysbook', 'Book of Golden Sands', 'vswaysbook', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysbook.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:54', '2025-04-14 18:57:48', 1),
(2, 21, 'inativo', 'vs20mparty', 'Wild Hop & Drop', 'vs20mparty', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mparty.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:54', '2025-04-14 18:58:02', 1),
(3, 21, 'inativo', 'vs10snakeeyes', 'Snakes & Ladders - Snake Eyes', 'vs10snakeeyes', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10snakeeyes.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:54', '2025-04-14 18:58:34', 1),
(4, 21, 'inativo', 'vs5strh', 'Striking Hot 5', 'vs5strh', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5strh.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:55', '2025-04-14 18:58:00', 1),
(5, 2, 'inativo', 'vswayslofhero', 'Legend of Heroes', 'vswayslofhero', 'Slots', NULL, 'Games/Pragmatic/vswayslofhero.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:55', '2025-04-14 18:55:55', 0),
(6, 21, 'inativo', 'vs20muertos', 'Muertos Multiplier Megaways', 'vs20muertos', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20muertos.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:55', '2025-04-14 18:57:44', 1),
(7, 21, 'inativo', 'vs10crownfire', 'Crown of Fire', 'vs10crownfire', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10crownfire.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:55', '2025-04-14 18:57:49', 1),
(8, 21, 'inativo', 'vswaysstrwild', 'Candy Stars', 'vswaysstrwild', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysstrwild.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:55', '2025-04-14 18:58:18', 1),
(9, 21, 'inativo', 'vs20trswild2', 'Black Bull', 'vs20trswild2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20trswild2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:55', '2025-04-14 18:57:48', 1),
(10, 21, 'inativo', 'vswaysfltdrg', 'Floating Dragon Hold & Spin Megaways', 'vswaysfltdrg', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysfltdrg.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:55', '2025-04-14 18:57:54', 1),
(11, 21, 'inativo', 'vs10mmm', 'Magic Money Maze', 'vs10mmm', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10mmm.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:56', '2025-04-14 18:58:04', 1),
(12, 21, 'inativo', 'vs20underground', 'Down the Rails', 'vs20underground', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20underground.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:56', '2025-04-14 18:58:00', 1),
(13, 21, 'inativo', 'vs20wolfie', 'Greedy Wolf', 'vs20wolfie', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20wolfie.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:56', '2025-04-14 18:57:51', 1),
(14, 21, 'inativo', 'vs5firehot', 'Fire Hot 5', 'vs5firehot', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5firehot.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:56', '2025-04-14 18:57:58', 1),
(15, 21, 'inativo', 'vs40firehot', 'Fire Hot 40', 'vs40firehot', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40firehot.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:56', '2025-04-14 18:58:10', 1),
(16, 21, 'inativo', 'vs20fh', 'Fire Hot 20', 'vs20fh', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20fh.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:56', '2025-04-14 18:58:07', 1),
(17, 21, 'inativo', 'vs100firehot', 'Fire Hot 100', 'vs100firehot', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs100firehot.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:56', '2025-04-14 18:58:03', 1),
(18, 2, 'inativo', 'vs10txbigbass', 'Big Bass Splash', 'vs10txbigbass', 'Slots', NULL, 'Games/Pragmatic/vs10txbigbass.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000023, 0, 1, '2025-04-14 18:55:57', '2025-09-10 16:21:57', 0),
(19, 21, 'inativo', 'vs20octobeer', 'Octobeer Fortunes', 'vs20octobeer', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20octobeer.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:57', '2025-04-14 18:57:49', 1),
(20, 21, 'inativo', 'vs40hotburnx', 'Hot To Burn Extreme', 'vs40hotburnx', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40hotburnx.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:57', '2025-04-14 18:58:15', 1),
(21, 2, 'inativo', 'vs243ckemp', 'Cheeky Emperor', 'vs243ckemp', 'Slots', NULL, 'Games/Pragmatic/vs243ckemp.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:57', '2025-04-14 18:55:57', 0),
(22, 21, 'inativo', 'vswaysjkrdrop', 'Tropical Tiki', 'vswaysjkrdrop', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysjkrdrop.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:57', '2025-04-14 18:58:08', 1),
(23, 21, 'inativo', 'vs5sh', 'Shining Hot 5', 'vs5sh', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5sh.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:57', '2025-04-14 18:58:23', 1),
(24, 21, 'inativo', 'vs40sh', 'Shining Hot 40', 'vs40sh', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40sh.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:57', '2025-04-14 18:58:25', 1),
(25, 21, 'inativo', 'vs20sh', 'Shining Hot 20', 'vs20sh', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20sh.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:57', '2025-04-14 18:58:27', 1),
(26, 2, 'inativo', 'vs10coffee', 'Coffee Wild', 'vs10coffee', 'Slots', NULL, 'Games/Pragmatic/vs10coffee.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:55:58', 0),
(27, 21, 'inativo', 'vs100sh', 'Shining Hot 100', 'vs100sh', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs100sh.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:18', 1),
(28, 21, 'inativo', 'vs10egrich', 'Queen of Gods', 'vs10egrich', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10egrich.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:03', 1),
(29, 2, 'inativo', 'vs243koipond', 'Koi Pond', 'vs243koipond', 'Slots', NULL, 'Games/Pragmatic/vs243koipond.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:55:58', 0),
(30, 2, 'inativo', 'vs40samurai3', 'Rise of Samurai 3', 'vs40samurai3', 'Slots', NULL, 'Games/Pragmatic/vs40samurai3.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:55:58', 0),
(31, 21, 'inativo', 'vs40cosmiccash', 'Cosmic Cash', 'vs40cosmiccash', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40cosmiccash.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:57:43', 1),
(32, 21, 'inativo', 'vs25bomb', 'Bomb Bonanza', 'vs25bomb', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25bomb.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:02', 1),
(33, 2, 'inativo', 'vs1024mahjpanda', 'Mahjong Panda', 'vs1024mahjpanda', 'Slots', NULL, 'Games/Pragmatic/vs1024mahjpanda.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:55:58', 0),
(34, 21, 'inativo', 'vs10spiritadv', 'Spirit of Adventure', 'vs10spiritadv', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10spiritadv.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:57:58', 1),
(35, 21, 'inativo', 'vs10firestrike2', 'Fire Strike 2', 'vs10firestrike2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10firestrike2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:57:52', 1),
(36, 21, 'inativo', 'vs40cleoeye', 'Eye of Cleopatra', 'vs40cleoeye', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40cleoeye.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:14', 1),
(37, 21, 'inativo', 'vs20gobnudge', 'Goblin Heist Powernudge', 'vs20gobnudge', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20gobnudge.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:17', 1),
(38, 21, 'inativo', 'vs20stickysymbol', 'The Great Stick-up', 'vs20stickysymbol', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20stickysymbol.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:20', 1),
(39, 21, 'inativo', 'vswayszombcarn', 'Zombie Carnival', 'vswayszombcarn', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayszombcarn.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:57:49', 1),
(40, 21, 'inativo', 'vs50northgard', 'North Guardians', 'vs50northgard', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50northgard.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:26', 1),
(41, 2, 'inativo', 'vs20sugarrush', 'Sugar Rush', 'vs20sugarrush', 'Slots', NULL, 'Games/Pragmatic/vs20sugarrush.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000016, 0, 1, '2025-04-14 18:55:58', '2025-09-05 19:01:38', 0),
(42, 21, 'inativo', 'vs20cleocatra', 'Cleocatra', 'vs20cleocatra', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20cleocatra.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:57:39', 1),
(43, 21, 'inativo', 'vs5littlegem', 'Little Gem Hold and Spin', 'vs5littlegem', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5littlegem.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:34', 1),
(44, 21, 'inativo', 'vs20drtgold', 'Drill That Gold', 'vs20drtgold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20drtgold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:06', 1),
(45, 21, 'inativo', 'vs20mustanggld2', 'Clover Gold', 'vs20mustanggld2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mustanggld2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:57:33', 1),
(46, 21, 'inativo', 'vs10chkchase', 'Chicken Chase', 'vs10chkchase', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10chkchase.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:58:35', 1),
(47, 21, 'inativo', 'vswayswildwest', 'Wild West Gold Megaways', 'vswayswildwest', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayswildwest.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:58', '2025-04-14 18:57:40', 1),
(48, 2, 'inativo', 'vs10bookazteck', 'Book of Aztec King', 'vs10bookazteck', 'Slots', NULL, 'Games/Pragmatic/vs10bookazteck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:59', '2025-04-14 18:55:59', 0),
(49, 21, 'inativo', 'vs50mightra', 'Might of Ra', 'vs50mightra', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50mightra.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:59', '2025-04-14 18:58:00', 1),
(50, 2, 'inativo', 'vs25bullfiesta', 'Bull Fiesta', 'vs25bullfiesta', 'Slots', NULL, 'Games/Pragmatic/vs25bullfiesta.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:59', '2025-04-14 18:55:59', 0),
(51, 21, 'inativo', 'vs20rainbowg', 'Rainbow Gold', 'vs20rainbowg', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20rainbowg.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:59', '2025-04-14 18:58:12', 1),
(52, 21, 'inativo', 'vs10tictac', 'Tic Tac Take', 'vs10tictac', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10tictac.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:59', '2025-04-14 18:58:28', 1),
(53, 2, 'inativo', 'vs243discolady', 'Disco Lady', 'vs243discolady', 'Slots', NULL, 'Games/Pragmatic/vs243discolady.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:59', '2025-04-14 18:55:59', 0),
(54, 21, 'inativo', 'vs243queenie', 'Queenie', 'vs243queenie', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243queenie.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:59', '2025-04-14 18:57:47', 1),
(55, 21, 'inativo', 'vs20farmfest', 'Barn Festival', 'vs20farmfest', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20farmfest.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:59', '2025-04-14 18:57:48', 1),
(56, 21, 'inativo', 'vs20bchprty', 'Wild Beach Party', 'vs20bchprty', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20bchprty.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:55:59', '2025-04-14 18:58:14', 1),
(57, 21, 'inativo', 'vs20ultim5', 'The Ultimate 5', 'vs20ultim5', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20ultim5.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:00', '2025-04-14 18:58:07', 1),
(58, 21, 'inativo', 'vs25copsrobbers', 'Cash Patrol', 'vs25copsrobbers', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25copsrobbers.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:00', '2025-04-14 18:57:45', 1),
(59, 21, 'inativo', 'vs20colcashzone', 'Colossal Cash Zone', 'vs20colcashzone', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20colcashzone.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:00', '2025-04-14 18:58:18', 1),
(60, 21, 'inativo', 'vs20rockvegas', 'Rock Vegas', 'vs20rockvegas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20rockvegas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:00', '2025-04-14 18:57:52', 1),
(61, 21, 'inativo', 'vs20superx', 'Super X', 'vs20superx', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20superx.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:00', '2025-04-14 18:57:56', 1),
(62, 21, 'inativo', 'vswayscryscav', 'Crystal Caverns Megaways', 'vswayscryscav', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayscryscav.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:00', '2025-04-14 18:57:57', 1),
(63, 21, 'inativo', 'vs20smugcove', 'Smugglers Cove', 'vs20smugcove', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20smugcove.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:58:30', 1),
(64, 21, 'inativo', 'vs4096magician', 'Magician\'s Secrets', 'vs4096magician', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs4096magician.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:57:57', 1),
(65, 21, 'inativo', 'vs40wanderw', 'Wild Depths', 'vs40wanderw', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40wanderw.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:58:27', 1),
(66, 21, 'inativo', 'vswaysxjuicy', 'Extra Juicy Megaways', 'vswaysxjuicy', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysxjuicy.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:57:41', 1),
(67, 21, 'inativo', 'vs25goldparty', 'Gold Party', 'vs25goldparty', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25goldparty.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:57:32', 1),
(68, 21, 'inativo', 'vs10runes', 'Gates of Valhalla', 'vs10runes', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10runes.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:58:08', 1),
(69, 21, 'inativo', 'vs20amuleteg', 'Fortune of Giza', 'vs20amuleteg', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20amuleteg.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:57:43', 1),
(70, 2, 'inativo', 'vs25tigeryear', 'New Year Tiger Treasures (tm)', 'vs25tigeryear', 'Slots', NULL, 'Games/Pragmatic/vs25tigeryear.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:56:01', 0),
(71, 2, 'inativo', 'vs243empcaishen', 'Emperor Caishen', 'vs243empcaishen', 'Slots', NULL, 'Games/Pragmatic/vs243empcaishen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:56:01', 0),
(72, 2, 'inativo', 'vs20pbonanza', 'Pyramid Bonanza', 'vs20pbonanza', 'Slots', NULL, 'Games/Pragmatic/vs20pbonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:56:01', 0),
(73, 21, 'inativo', 'vs20trsbox', 'Treasure Wild', 'vs20trsbox', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20trsbox.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:57:57', 1),
(74, 2, 'inativo', 'vs243chargebull', 'Raging Bull', 'vs243chargebull', 'Slots', NULL, 'Games/Pragmatic/vs243chargebull.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:56:01', 0),
(75, 21, 'inativo', 'vswaysbankbonz', 'Cash Bonanza', 'vswaysbankbonz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysbankbonz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:58:11', 1),
(76, 2, 'inativo', 'vs576hokkwolf', 'Hokkaido Wolf', 'vs576hokkwolf', 'Slots', NULL, 'Games/Pragmatic/vs576hokkwolf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:01', '2025-04-14 18:56:01', 0),
(77, 21, 'inativo', 'vs20phoenixf', 'Phoenix Forge', 'vs20phoenixf', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20phoenixf.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:02', '2025-04-14 18:57:58', 1),
(78, 2, 'inativo', 'vswaysaztecking', 'Aztec King Megaways', 'vswaysaztecking', 'Slots', NULL, 'Games/Pragmatic/vswaysaztecking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:02', '2025-04-14 18:56:02', 0),
(79, 21, 'inativo', 'vs10luckcharm', 'Lucky, Grace & Charm', 'vs10luckcharm', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10luckcharm.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:02', '2025-04-14 18:58:49', 1),
(80, 21, 'inativo', 'vswayselements', 'Elemental Gems Megaways', 'vswayselements', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayselements.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:02', '2025-04-14 18:57:58', 1),
(81, 21, 'inativo', 'vswayschilheat', 'Chilli Heat Megaways', 'vswayschilheat', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayschilheat.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:02', '2025-04-14 18:57:50', 1),
(82, 21, 'inativo', 'vs20magicpot', 'The Magic Cauldron', 'vs20magicpot', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20magicpot.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:02', '2025-04-14 18:58:49', 1),
(83, 21, 'inativo', 'vs10amm', 'Amazing Money Machine', 'vs10amm', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10amm.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:03', '2025-04-14 18:58:48', 1),
(84, 21, 'inativo', 'vs117649starz', 'Starz Megaways', 'vs117649starz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs117649starz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:03', '2025-04-14 18:57:59', 1),
(85, 21, 'inativo', 'vs10wildtut', 'Mysterious Egypt', 'vs10wildtut', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10wildtut.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:03', '2025-04-14 18:58:07', 1),
(86, 21, 'inativo', 'vs10eyestorm', 'Eye of the Storm', 'vs10eyestorm', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10eyestorm.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:03', '2025-04-14 18:58:07', 1),
(87, 2, 'inativo', 'vs25gldox', 'Golden Ox', 'vs25gldox', 'Slots', NULL, 'Games/Pragmatic/vs25gldox.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:03', '2025-04-14 18:56:03', 0),
(88, 21, 'inativo', 'vs40voodoo', 'Voodoo Magic', 'vs40voodoo', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40voodoo.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:03', '2025-04-14 18:58:04', 1),
(89, 2, 'inativo', 'vs20bonzgold', 'Bonanza Gold', 'vs20bonzgold', 'Slots', NULL, 'Games/Pragmatic/vs20bonzgold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:03', '2025-04-14 18:56:03', 0),
(90, 21, 'inativo', 'vs10mayangods', 'John Hunter And The Mayan Gods', 'vs10mayangods', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10mayangods.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:04', '2025-04-14 18:57:58', 1),
(91, 21, 'inativo', 'vs1024dtiger', 'The Dragon Tiger', 'vs1024dtiger', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1024dtiger.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:04', '2025-04-14 18:58:26', 1),
(92, 21, 'inativo', 'vs20xmascarol', 'Christmas Carol Megaways', 'vs20xmascarol', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20xmascarol.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:04', '2025-04-14 18:57:41', 1),
(93, 21, 'inativo', 'vs10goldfish', 'Fishin Reels', 'vs10goldfish', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10goldfish.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:04', '2025-04-14 18:58:49', 1),
(94, 21, 'inativo', 'vs25bkofkngdm', 'Book Of Kingdoms', 'vs25bkofkngdm', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25bkofkngdm.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:04', '2025-04-14 18:58:05', 1),
(95, 21, 'inativo', 'vs20goldfever', 'Gems Bonanza', 'vs20goldfever', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20goldfever.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:04', '2025-04-14 18:57:38', 1),
(96, 21, 'inativo', 'vs25walker', 'Wild Walker', 'vs25walker', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25walker.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:04', '2025-04-14 18:58:25', 1),
(97, 2, 'inativo', 'vs25samurai', 'Rise of Samurai', 'vs25samurai', 'Slots', NULL, 'Games/Pragmatic/vs25samurai.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:05', '2025-04-14 18:56:05', 0),
(98, 21, 'inativo', 'vswayshive', 'Star Bounty', 'vswayshive', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayshive.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:05', '2025-04-14 18:58:22', 1),
(99, 21, 'inativo', 'vswayswerewolf', 'Curse of the Werewolf Megaways', 'vswayswerewolf', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayswerewolf.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:05', '2025-04-14 18:57:56', 1),
(100, 2, 'inativo', 'vs9aztecgemsdx', 'Aztec Gems Deluxe', 'vs9aztecgemsdx', 'Slots', NULL, 'Games/Pragmatic/vs9aztecgemsdx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000001, 0, 0, '2025-04-14 18:56:05', '2025-07-04 18:17:37', 0),
(101, 21, 'inativo', 'vs20gorilla', 'Jungle Gorilla', 'vs20gorilla', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20gorilla.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:05', '2025-04-14 18:58:29', 1),
(102, 21, 'inativo', 'vs40streetracer', 'Street Racer', 'vs40streetracer', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40streetracer.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:05', '2025-04-14 18:58:29', 1),
(103, 2, 'inativo', 'vs1fufufu', 'Fu Fu Fu', 'vs1fufufu', 'Slots', NULL, 'Games/Pragmatic/vs1fufufu.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:05', '2025-04-14 18:56:05', 0),
(104, 21, 'inativo', 'vs1600drago', 'Drago - Jewels of Fortune', 'vs1600drago', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1600drago.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:06', '2025-04-14 18:58:03', 1),
(105, 2, 'inativo', 'vs1money', 'Money Money Money', 'vs1money', 'Slots', NULL, 'Games/Pragmatic/vs1money.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:06', '2025-04-14 18:56:06', 0),
(106, 2, 'inativo', 'vs20bl', 'Busy Bees', 'vs20bl', 'Slots', NULL, 'Games/Pragmatic/vs20bl.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:06', '2025-04-14 18:56:06', 0),
(107, 2, 'inativo', 'vs40beowulf', 'Beowulf', 'vs40beowulf', 'Slots', NULL, 'Games/Pragmatic/vs40beowulf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:06', '2025-04-14 18:56:06', 0),
(108, 21, 'inativo', 'vs4096jurassic', 'Jurassic Giants', 'vs4096jurassic', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs4096jurassic.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:06', '2025-04-14 18:58:29', 1),
(109, 21, 'inativo', 'vs3train', 'Gold Train', 'vs3train', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs3train.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:06', '2025-04-14 18:57:59', 1),
(110, 21, 'inativo', 'vs9hotroll', 'Hot Chilli', 'vs9hotroll', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs9hotroll.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:07', '2025-04-14 18:58:16', 1),
(111, 2, 'inativo', 'vs25queenofgold', 'Queen of Gold', 'vs25queenofgold', 'Slots', NULL, 'Games/Pragmatic/vs25queenofgold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:07', '2025-04-14 18:56:07', 0),
(112, 21, 'inativo', 'vs5spjoker', 'Super Joker', 'vs5spjoker', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5spjoker.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:07', '2025-04-14 18:57:58', 1),
(113, 21, 'inativo', 'vs20egypttrs', 'Egyptian Fortunes', 'vs20egypttrs', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20egypttrs.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:07', '2025-04-14 18:58:18', 1),
(114, 21, 'inativo', 'vs18mashang', 'Treasure Horse', 'vs18mashang', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs18mashang.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:07', '2025-04-14 18:58:26', 1),
(115, 21, 'inativo', 'vs50chinesecharms', 'Lucky Dragons', 'vs50chinesecharms', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50chinesecharms.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:07', '2025-04-14 18:58:26', 1),
(116, 21, 'inativo', 'vs7monkeys', '7 Monkeys', 'vs7monkeys', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs7monkeys.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:07', '2025-04-14 18:58:11', 1),
(117, 21, 'inativo', 'vs25sea', 'Great Reef', 'vs25sea', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25sea.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:07', '2025-04-14 18:58:30', 1),
(118, 21, 'inativo', 'vs20leprechaun', 'Leprechaun Song', 'vs20leprechaun', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20leprechaun.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:07', '2025-04-14 18:58:19', 1),
(119, 21, 'inativo', 'vs25dwarves_new', 'Dwarven Gold Deluxe', 'vs25dwarves_new', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25dwarves_new.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:08', '2025-04-14 18:58:28', 1),
(120, 21, 'inativo', 'vs5hotburn', 'Hot to Burn', 'vs5hotburn', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5hotburn.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:08', '2025-04-14 18:57:37', 1),
(121, 21, 'inativo', 'vs9chen', 'Master Chen\'s Fortune', 'vs9chen', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs9chen.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:08', '2025-04-14 18:58:13', 1),
(122, 21, 'inativo', 'vs1tigers', 'Triple Tigers', 'vs1tigers', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1tigers.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:08', '2025-04-14 18:57:53', 1),
(123, 21, 'inativo', 'vs20godiva', 'Lady Godiva', 'vs20godiva', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20godiva.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:08', '2025-04-14 18:58:22', 1),
(124, 21, 'inativo', 'vs9madmonkey', 'Monkey Madness', 'vs9madmonkey', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs9madmonkey.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:08', '2025-04-14 18:58:14', 1),
(125, 21, 'inativo', 'vs50kingkong', 'Mighty Kong', 'vs50kingkong', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50kingkong.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:08', '2025-04-14 18:58:20', 1),
(126, 21, 'inativo', 'vs40frrainbow', 'Fruit Rainbow', 'vs40frrainbow', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40frrainbow.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:09', '2025-04-14 18:58:25', 1),
(127, 21, 'inativo', 'vs25newyear', 'Lucky New Year', 'vs25newyear', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25newyear.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:09', '2025-04-14 18:58:02', 1),
(128, 21, 'inativo', 'vs40madwheel', 'The Wild Machine', 'vs40madwheel', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40madwheel.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:09', '2025-04-14 18:58:08', 1),
(129, 21, 'inativo', 'vs5trdragons', 'Triple Dragons', 'vs5trdragons', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5trdragons.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:09', '2025-04-14 18:58:27', 1),
(130, 21, 'inativo', 'vs7776aztec', 'Aztec Bonanza', 'vs7776aztec', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs7776aztec.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:09', '2025-04-14 18:57:56', 1),
(131, 21, 'inativo', 'vs50hercules', 'Hercules Son of Zeus', 'vs50hercules', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50hercules.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:09', '2025-04-14 18:58:26', 1),
(132, 21, 'inativo', 'vs25journey', 'Journey to the West', 'vs25journey', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25journey.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:22', 1),
(133, 21, 'inativo', 'vs20chicken', 'The Great Chicken Escape', 'vs20chicken', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20chicken.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:13', 1),
(134, 21, 'inativo', 'vs1fortunetree', 'Tree of Riches', 'vs1fortunetree', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1fortunetree.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:57:53', 1),
(135, 21, 'inativo', 'vs20wildpix', 'Wild Pixies', 'vs20wildpix', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20wildpix.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:18', 1),
(136, 21, 'inativo', 'vs15fairytale', 'Fairytale Fortune', 'vs15fairytale', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs15fairytale.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:16', 1),
(137, 21, 'inativo', 'vs20santa', 'Santa', 'vs20santa', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20santa.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:19', 1),
(138, 21, 'inativo', 'vs10vampwolf', 'Vampires vs Wolves', 'vs10vampwolf', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10vampwolf.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:21', 1),
(139, 21, 'inativo', 'vs50aladdin', '3 Genie Wishes', 'vs50aladdin', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50aladdin.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:09', 1),
(140, 21, 'inativo', 'vs25safari', 'Hot Safari', 'vs25safari', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25safari.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:18', 1),
(141, 21, 'inativo', 'vs20honey', 'Honey Honey Honey', 'vs20honey', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20honey.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:09', 1),
(142, 21, 'inativo', 'vs20hercpeg', 'Hercules and Pegasus', 'vs20hercpeg', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20hercpeg.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:10', '2025-04-14 18:58:23', 1),
(143, 21, 'inativo', 'vs7fire88', 'Fire 88', 'vs7fire88', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs7fire88.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:57:50', 1),
(144, 21, 'inativo', 'vs5aztecgems', 'Aztec Gems', 'vs5aztecgems', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5aztecgems.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:57:43', 1),
(145, 21, 'inativo', 'vs1dragon8', '888 Dragons', 'vs1dragon8', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1dragon8.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:57:46', 1),
(146, 21, 'inativo', 'vs25dragonkingdom', 'Dragon Kingdom', 'vs25dragonkingdom', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25dragonkingdom.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:58:04', 1),
(147, 21, 'inativo', 'vs25goldrush', 'Gold Rush', 'vs25goldrush', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25goldrush.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:58:01', 1),
(148, 2, 'inativo', 'vs25goldpig', 'Golden Pig', 'vs25goldpig', 'Slots', NULL, 'Games/Pragmatic/vs25goldpig.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:56:11', 0),
(149, 21, 'inativo', 'vs25gladiator', 'Wild Gladiator', 'vs25gladiator', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25gladiator.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:58:31', 1),
(150, 2, 'inativo', 'vs5joker', 'Joker s Jewels', 'vs5joker', 'Slots', NULL, 'Games/Pragmatic/vs5joker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000003, 0, 1, '2025-04-14 18:56:11', '2025-08-10 03:27:22', 0),
(151, 21, 'inativo', 'vs243caishien', 'Caishen\'s Cash', 'vs243caishien', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243caishien.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:58:10', 1),
(152, 21, 'inativo', 'vs7pigs', '7 Piggies', 'vs7pigs', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs7pigs.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:58:17', 1),
(153, 21, 'inativo', 'vs20leprexmas', 'Leprechaun Carol', 'vs20leprexmas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20leprexmas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:58:20', 1),
(154, 21, 'inativo', 'vs8magicjourn', 'Magic Journey', 'vs8magicjourn', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs8magicjourn.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:58:31', 1),
(155, 21, 'inativo', 'vs243fortseren', 'Greek Gods', 'vs243fortseren', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243fortseren.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:57:58', 1),
(156, 21, 'inativo', 'vs25chilli', 'Chilli Heat', 'vs25chilli', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25chilli.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:57:38', 1),
(157, 21, 'inativo', 'vs20aladdinsorc', 'Aladdin and the Sorcerer', 'vs20aladdinsorc', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20aladdinsorc.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:58:30', 1),
(158, 21, 'inativo', 'vs243fortune', 'Caishen\'s Gold', 'vs243fortune', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243fortune.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:58:51', 1),
(159, 21, 'inativo', 'vs10firestrike', 'Fire Strike', 'vs10firestrike', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10firestrike.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:57:39', 1),
(160, 21, 'inativo', 'vs20kraken', 'Release the Kraken', 'vs20kraken', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20kraken.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:57:47', 1),
(161, 2, 'inativo', 'vs1masterjoker', 'Master Joker', 'vs1masterjoker', 'Slots', NULL, 'Games/Pragmatic/vs1masterjoker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000000, 0, 0, '2025-04-14 18:56:11', '2025-04-14 18:59:08', 0),
(162, 21, 'inativo', 'vs5super7', 'Super 7s', 'vs5super7', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5super7.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:57:46', 1),
(163, 21, 'inativo', 'vs20wildboost', 'Wild Booster', 'vs20wildboost', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20wildboost.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:58:14', 1),
(164, 21, 'inativo', 'vswayshammthor', 'Power of Thor Megaways', 'vswayshammthor', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayshammthor.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:57:44', 1),
(165, 21, 'inativo', 'vs243lions', '5 Lions', 'vs243lions', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243lions.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:57:49', 1),
(166, 1, 'inativo', 'captains-bounty', 'Captain\'s Bounty', 'captains-bounty', 'Slots', NULL, 'Games/Pgsoft/captains-bounty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:56:12', 0),
(167, 1, 'inativo', 'vampires-charm', 'Vampire\'s Charm', 'vampires-charm', 'Slots', NULL, 'Games/Pgsoft/vampires-charm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:56:12', 0),
(168, 1, 'inativo', 'gem-saviour-conquest', 'Gem Saviour Conquest', 'gem-saviour-conquest', 'Slots', NULL, 'Games/Pgsoft/gem-saviour-conquest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:56:12', 0),
(169, 1, 'inativo', 'mahjong-ways', 'Mahjong Ways', 'mahjong-ways', 'Slots', NULL, 'Games/Pgsoft/mahjong-ways.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:56:12', 0),
(170, 1, 'inativo', 'candy-burst', 'Candy Burst', 'candy-burst', 'Slots', NULL, 'Games/Pgsoft/candy-burst.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:56:12', '2025-08-25 13:24:49', 0),
(171, 1, 'inativo', 'mahjong-ways2', 'Mahjong Ways 2', 'mahjong-ways2', 'Slots', NULL, 'Games/Pgsoft/mahjong-ways2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:56:12', 0),
(172, 1, 'inativo', 'ganesha-fortune', 'Ganesha Fortune', 'ganesha-fortune', 'Slots', NULL, 'Games/Pgsoft/ganesha-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:56:12', '2025-04-22 02:53:20', 0),
(173, 1, 'inativo', 'phoenix-rises', 'Phoenix Rises', 'phoenix-rises', 'Slots', NULL, 'Games/Pgsoft/phoenix-rises.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:56:12', 0),
(174, 1, 'inativo', 'wild-fireworks', 'Wild Fireworks', 'wild-fireworks', 'Slots', NULL, 'Games/Pgsoft/wild-fireworks.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:12', '2025-04-14 18:56:12', 0),
(175, 1, 'inativo', 'galactic-gems', 'Galactic Gems', 'galactic-gems', 'Slots', NULL, 'Games/Pgsoft/galactic-gems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:13', '2025-04-14 18:56:13', 0),
(176, 1, 'inativo', 'treasures-aztec', 'Treasures of Aztec', 'treasures-aztec', 'Slots', NULL, 'Games/Pgsoft/treasures-aztec.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:13', '2025-04-14 18:56:13', 0),
(177, 1, 'inativo', 'gdn-ice-fire', 'Guardians of Ice and Fire', 'gdn-ice-fire', 'Slots', NULL, 'Games/Pgsoft/gdn-ice-fire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:13', '2025-04-14 18:56:13', 0),
(178, 1, 'inativo', 'bali-vacation', 'Bali Vacation', 'bali-vacation', 'Slots', NULL, 'Games/Pgsoft/bali-vacation.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:13', '2025-04-14 18:56:13', 0),
(179, 1, 'inativo', 'majestic-ts', 'Majestic Treasures', 'majestic-ts', 'Slots', NULL, 'Games/Pgsoft/majestic-ts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:13', '2025-04-14 18:56:13', 0),
(180, 1, 'inativo', 'jack-frosts', 'Jack Frost\'s Winter', 'jack-frosts', 'Slots', NULL, 'Games/Pgsoft/jack-frosts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:13', '2025-04-14 18:56:13', 0),
(181, 1, 'inativo', 'candy-bonanza', 'Candy Bonanza', 'candy-bonanza', 'Slots', NULL, 'Games/Pgsoft/candy-bonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:14', '2025-04-14 18:56:14', 0),
(182, 1, 'inativo', 'heist-stakes', 'Heist Stakes', 'heist-stakes', 'Slots', NULL, 'Games/Pgsoft/heist-stakes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:14', '2025-04-14 18:56:14', 0),
(183, 1, 'inativo', 'lgd-monkey-kg', 'Legendary Monkey King', 'lgd-monkey-kg', 'Slots', NULL, 'Games/Pgsoft/lgd-monkey-kg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:14', '2025-04-14 18:56:14', 0),
(184, 1, 'inativo', 'buffalo-win', 'Buffalo Win', 'buffalo-win', 'Slots', NULL, 'Games/Pgsoft/buffalo-win.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:14', '2025-04-14 18:56:14', 0),
(185, 1, 'inativo', 'crypt-fortune', 'Raider Jane\'s Crypt of Fortune', 'crypt-fortune', 'Slots', NULL, 'Games/Pgsoft/crypt-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:14', '2025-04-14 18:56:14', 0),
(186, 1, 'inativo', 'emoji-riches', 'Emoji Riches', 'emoji-riches', 'Slots', NULL, 'Games/Pgsoft/emoji-riches.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:14', '2025-04-14 18:56:14', 0),
(187, 1, 'inativo', 'sprmkt-spree', 'Supermarket Spree', 'sprmkt-spree', 'Slots', NULL, 'Games/Pgsoft/sprmkt-spree.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:15', '2025-04-14 18:56:15', 0),
(188, 1, 'inativo', 'spirit-wonder', 'Spirited Wonders', 'spirit-wonder', 'Slots', NULL, 'Games/Pgsoft/spirit-wonder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:15', '2025-04-14 18:56:15', 0),
(189, 1, 'inativo', 'dest-sun-moon', 'Destiny of Sun & Moon', 'dest-sun-moon', 'Slots', NULL, 'Games/Pgsoft/dest-sun-moon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:15', '2025-04-14 18:56:15', 0),
(190, 1, 'inativo', 'garuda-gems', 'Garuda Gems', 'garuda-gems', 'Slots', NULL, 'Games/Pgsoft/garuda-gems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:15', '2025-04-14 18:56:15', 0),
(191, 1, 'inativo', 'rooster-rbl', 'Rooster Rumble', 'rooster-rbl', 'Slots', NULL, 'Games/Pgsoft/rooster-rbl.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:15', '2025-04-14 18:56:15', 0),
(192, 1, 'inativo', 'battleground', 'Battleground Royale', 'battleground', 'Slots', NULL, 'Games/Pgsoft/battleground.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:16', '2025-04-14 18:56:16', 0),
(193, 1, 'inativo', 'btrfly-blossom', 'Butterfly Blossom', 'btrfly-blossom', 'Slots', NULL, 'Games/Pgsoft/btrfly-blossom.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:16', '2025-04-14 18:56:16', 0),
(194, 1, 'inativo', 'prosper-ftree', 'Prosperity Fortune Tree', 'prosper-ftree', 'Slots', NULL, 'Games/Pgsoft/prosper-ftree.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:16', '2025-04-14 18:56:16', 0),
(195, 1, 'inativo', 'asgardian-rs', 'Asgardian Rising', 'asgardian-rs', 'Slots', NULL, 'Games/Pgsoft/asgardian-rs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:16', '2025-04-14 18:56:16', 0),
(196, 1, 'inativo', 'alchemy-gold', 'Alchemy Gold', 'alchemy-gold', 'Slots', NULL, 'Games/Pgsoft/alchemy-gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:17', '2025-04-14 18:56:17', 0),
(197, 1, 'inativo', 'diner-delights', 'Diner Delights', 'diner-delights', 'Slots', NULL, 'Games/Pgsoft/diner-delights.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:17', '2025-04-14 18:56:17', 0),
(198, 1, 'inativo', 'bakery-bonanza', 'Bakery Bonanza', 'bakery-bonanza', 'Slots', NULL, 'Games/Pgsoft/bakery-bonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:17', '2025-04-14 18:56:17', 0),
(199, 1, 'inativo', 'songkran-spl', 'Songkran Splash', 'songkran-spl', 'Slots', NULL, 'Games/Pgsoft/songkran-spl.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:17', '2025-04-14 18:56:17', 0),
(200, 1, 'inativo', 'cruise-royale', 'Cruise Royale', 'cruise-royale', 'Slots', NULL, 'Games/Pgsoft/cruise-royale.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:17', '2025-04-14 18:56:17', 0),
(201, 1, 'inativo', 'spr-golf-drive', 'Super Golf Drive', 'spr-golf-drive', 'Slots', NULL, 'Games/Pgsoft/spr-golf-drive.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:18', '2025-04-14 18:56:18', 0),
(202, 21, 'inativo', 'vs243mwarrior', 'Monkey Warrior', 'vs243mwarrior', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243mwarrior.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:18', '2025-04-14 18:58:17', 1),
(203, 21, 'inativo', 'vs20doghouse', 'The Dog House', 'vs20doghouse', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20doghouse.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:18', '2025-04-14 18:57:32', 1),
(204, 21, 'inativo', 'vs40pirate', 'Pirate Gold', 'vs40pirate', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40pirate.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:18', '2025-04-14 18:57:51', 1),
(205, 21, 'inativo', 'vs20rhino', 'Great Rhino', 'vs20rhino', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20rhino.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:18', '2025-04-14 18:57:49', 1),
(206, 21, 'inativo', 'vs25pandagold', 'Panda\'s Fortune', 'vs25pandagold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25pandagold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:18', '2025-04-14 18:58:09', 1),
(207, 21, 'inativo', 'vs4096bufking', 'Buffalo King', 'vs4096bufking', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs4096bufking.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:18', '2025-04-14 18:57:40', 1),
(208, 21, 'inativo', 'vs25pyramid', 'Pyramid King', 'vs25pyramid', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25pyramid.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:19', '2025-04-14 18:57:55', 1),
(209, 21, 'inativo', 'vs5ultrab', 'Ultra Burn', 'vs5ultrab', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5ultrab.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:19', '2025-04-14 18:57:53', 1),
(210, 21, 'inativo', 'vs5ultra', 'Ultra Hold and Spin', 'vs5ultra', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5ultra.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:19', '2025-04-14 18:57:44', 1),
(211, 21, 'inativo', 'vs25jokerking', 'Joker King', 'vs25jokerking', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25jokerking.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:19', '2025-04-14 18:58:24', 1),
(212, 21, 'inativo', 'vs10returndead', 'Return of the Dead', 'vs10returndead', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10returndead.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:19', '2025-04-14 18:58:12', 1),
(213, 21, 'inativo', 'vs10madame', 'Madame Destiny', 'vs10madame', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10madame.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:19', '2025-04-14 18:57:54', 1),
(214, 21, 'inativo', 'vs15diamond', 'Diamond Strike', 'vs15diamond', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs15diamond.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:19', '2025-04-14 18:57:42', 1),
(215, 2, 'inativo', 'vs25aztecking', 'Aztec King', 'vs25aztecking', 'Slots', NULL, 'Games/Pragmatic/vs25aztecking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:19', '2025-04-14 18:56:19', 0);
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `original`) VALUES
(216, 21, 'inativo', 'vs25wildspells', 'Wild Spells', 'vs25wildspells', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25wildspells.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:20', '2025-04-14 18:57:59', 1),
(217, 2, 'inativo', 'vs10bbbonanza', 'Big Bass Bonanza', 'vs10bbbonanza', 'Slots', NULL, 'Games/Pragmatic/vs10bbbonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000176, 1, 1, '2025-04-14 18:56:20', '2025-09-06 09:12:31', 0),
(218, 21, 'inativo', 'vs10cowgold', 'Cowboys Gold', 'vs10cowgold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10cowgold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:20', '2025-04-14 18:57:48', 1),
(219, 2, 'inativo', 'vs25tigerwar', 'The Tiger Warrior', 'vs25tigerwar', 'Slots', NULL, 'Games/Pragmatic/vs25tigerwar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:20', '2025-04-14 18:56:20', 0),
(220, 2, 'inativo', 'vs25mustang', 'Mustang Gold', 'vs25mustang', 'Slots', NULL, 'Games/Pragmatic/vs25mustang.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000000, 0, 1, '2025-04-14 18:56:20', '2025-04-14 22:22:43', 0),
(221, 21, 'inativo', 'vs25hotfiesta', 'Hot Fiesta', 'vs25hotfiesta', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25hotfiesta.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:20', '2025-04-14 18:57:40', 1),
(222, 21, 'inativo', 'vs243dancingpar', 'Dance Party', 'vs243dancingpar', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243dancingpar.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:20', '2025-04-14 18:58:13', 1),
(223, 21, 'inativo', 'vs576treasures', 'Wild Wild Riches', 'vs576treasures', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs576treasures.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:20', '2025-04-14 18:57:37', 1),
(224, 2, 'inativo', 'vs20hburnhs', 'Hot to Burn Hold and Spin', 'vs20hburnhs', 'Slots', NULL, 'Games/Pragmatic/vs20hburnhs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000000, 0, 0, '2025-04-14 18:56:20', '2025-04-14 22:29:54', 0),
(225, 21, 'inativo', 'vs20emptybank', 'Empty the Bank', 'vs20emptybank', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20emptybank.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:20', '2025-04-14 18:58:08', 1),
(226, 21, 'inativo', 'vs20midas', 'The Hand of Midas', 'vs20midas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20midas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:20', '2025-04-14 18:57:44', 1),
(227, 21, 'inativo', 'vswayslight', 'Lucky Lightning', 'vswayslight', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayslight.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:57:44', 1),
(228, 21, 'inativo', 'vs20vegasmagic', 'Vegas Magic', 'vs20vegasmagic', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20vegasmagic.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:58:22', 1),
(229, 21, 'inativo', 'vs20fruitparty', 'Fruit Party', 'vs20fruitparty', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20fruitparty.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:57:32', 1),
(230, 21, 'inativo', 'vs20fparty2', 'Fruit Party 2', 'vs20fparty2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20fparty2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:57:46', 1),
(231, 21, 'inativo', 'vswaysdogs', 'The Dog House Megaways', 'vswaysdogs', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysdogs.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:57:31', 1),
(232, 21, 'inativo', 'vs50juicyfr', 'Juicy Fruits', 'vs50juicyfr', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50juicyfr.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:57:42', 1),
(233, 21, 'inativo', 'vs25pandatemple', 'Panda Fortune 2', 'vs25pandatemple', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25pandatemple.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:58:09', 1),
(234, 21, 'inativo', 'vswaysbufking', 'Buffalo King Megaways', 'vswaysbufking', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysbufking.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:57:32', 1),
(235, 21, 'inativo', 'vs40wildwest', 'Wild West Gold', 'vs40wildwest', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40wildwest.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:57:35', 1),
(236, 21, 'inativo', 'vs20chickdrop', 'Chicken Drop', 'vs20chickdrop', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20chickdrop.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:58:01', 1),
(237, 21, 'inativo', 'vs40spartaking', 'Spartan King', 'vs40spartaking', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40spartaking.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:21', '2025-04-14 18:58:20', 1),
(238, 21, 'inativo', 'vswaysrhino', 'Great Rhino Megaways', 'vswaysrhino', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysrhino.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:22', '2025-04-14 18:57:36', 1),
(239, 21, 'inativo', 'vs20sbxmas', 'Sweet Bonanza Xmas', 'vs20sbxmas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20sbxmas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:22', '2025-04-14 18:58:33', 1),
(240, 21, 'inativo', 'vs10fruity2', 'Extra Juicy', 'vs10fruity2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10fruity2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:22', '2025-04-14 18:57:46', 1),
(241, 21, 'inativo', 'vs10egypt', 'Ancient Egypt', 'vs10egypt', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10egypt.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:22', '2025-04-14 18:58:24', 1),
(242, 21, 'inativo', 'vs5drhs', 'Dragon Hot Hold & Spin', 'vs5drhs', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5drhs.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:22', '2025-04-14 18:58:49', 1),
(243, 21, 'inativo', 'vs12bbb', 'Bigger Bass Bonanza', 'vs12bbb', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs12bbb.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:22', '2025-04-14 18:57:31', 1),
(244, 2, 'inativo', 'vs20tweethouse', 'The Tweety House', 'vs20tweethouse', 'Slots', NULL, 'Games/Pragmatic/vs20tweethouse.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:56:22', '2025-07-24 22:32:08', 0),
(245, 21, 'inativo', 'vswayslions', '5 Lions Megaways', 'vswayslions', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayslions.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:22', '2025-04-14 18:57:31', 1),
(246, 2, 'inativo', 'vswayssamurai', 'Rise of Samurai Megaways', 'vswayssamurai', 'Slots', NULL, 'Games/Pragmatic/vswayssamurai.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:22', '2025-04-14 18:56:22', 0),
(247, 21, 'inativo', 'vs50pixie', 'Pixie Wings', 'vs50pixie', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50pixie.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:23', '2025-04-14 18:58:13', 1),
(248, 21, 'inativo', 'vs10floatdrg', 'Floating Dragon', 'vs10floatdrg', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10floatdrg.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:23', '2025-04-14 18:57:38', 1),
(249, 2, 'inativo', 'vs20fruitsw', 'Sweet Bonanza', 'vs20fruitsw', 'Slots', NULL, 'Games/Pragmatic/vs20fruitsw.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000036, 0, 1, '2025-04-14 18:56:23', '2025-09-11 02:34:47', 0),
(250, 21, 'inativo', 'vs20rhinoluxe', 'Great Rhino Deluxe', 'vs20rhinoluxe', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20rhinoluxe.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:23', '2025-04-14 18:57:55', 1),
(251, 21, 'inativo', 'vswaysmadame', 'Madame Destiny Megaways', 'vswaysmadame', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmadame.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:23', '2025-04-14 18:57:31', 1),
(252, 21, 'inativo', 'vs1024temuj', 'Temujin Treasures', 'vs1024temuj', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1024temuj.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:23', '2025-04-14 18:58:15', 1),
(253, 21, 'inativo', 'vs40pirgold', 'Pirate Gold Deluxe', 'vs40pirgold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40pirgold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:23', '2025-04-14 18:58:16', 1),
(254, 21, 'inativo', 'vs25mmouse', 'Money Mouse', 'vs25mmouse', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25mmouse.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:23', '2025-04-14 18:58:02', 1),
(255, 21, 'inativo', 'vs10threestar', 'Three Star Fortune', 'vs10threestar', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10threestar.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:23', '2025-04-14 18:58:23', 1),
(256, 2, 'inativo', 'vs1ball', 'Lucky Dragon Ball', 'vs1ball', 'Slots', NULL, 'Games/Pragmatic/vs1ball.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:23', '2025-04-14 18:56:23', 0),
(257, 21, 'inativo', 'vs243lionsgold', '5 Lions Gold', 'vs243lionsgold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243lionsgold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:57:47', 1),
(258, 21, 'inativo', 'vs10egyptcls', 'Ancient Egypt Classic', 'vs10egyptcls', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10egyptcls.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:57:56', 1),
(259, 21, 'inativo', 'vs25davinci', 'Da Vinci\'s Treasure', 'vs25davinci', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25davinci.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:58:06', 1),
(260, 21, 'inativo', 'vs7776secrets', 'Aztec Treasure', 'vs7776secrets', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs7776secrets.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:58:49', 1),
(261, 21, 'inativo', 'vs25wolfgold', 'Wolf Gold', 'vs25wolfgold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25wolfgold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:57:35', 1),
(262, 21, 'inativo', 'vs50safariking', 'Safari King', 'vs50safariking', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50safariking.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:58:28', 1),
(263, 21, 'inativo', 'vs25peking', 'Peking Luck', 'vs25peking', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25peking.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:58:18', 1),
(264, 21, 'inativo', 'vs25asgard', 'Asgard', 'vs25asgard', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25asgard.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:57:58', 1),
(265, 21, 'inativo', 'vs25vegas', 'Vegas Nights', 'vs25vegas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25vegas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:58:24', 1),
(266, 21, 'inativo', 'vs25scarabqueen', 'John Hunter and the Tomb of the Scarab Queen', 'vs25scarabqueen', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25scarabqueen.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:57:36', 1),
(267, 21, 'inativo', 'vs20starlight', 'Starlight Princess', 'vs20starlight', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20starlight.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:24', '2025-04-14 18:57:31', 1),
(268, 21, 'inativo', 'vs10bookoftut', 'Book of Tut', 'vs10bookoftut', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bookoftut.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:58:34', 1),
(269, 21, 'inativo', 'vs9piggybank', 'Piggy Bank Bills', 'vs9piggybank', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs9piggybank.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:58:12', 1),
(270, 21, 'inativo', 'vs5drmystery', 'Dragon Kingdom - Eyes of Fire', 'vs5drmystery', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5drmystery.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:58:26', 1),
(271, 21, 'inativo', 'vs20eightdragons', '8 Dragons', 'vs20eightdragons', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20eightdragons.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:58:14', 1),
(272, 21, 'inativo', 'vs1024lionsd', '5 Lions Dance', 'vs1024lionsd', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1024lionsd.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:58:13', 1),
(273, 21, 'inativo', 'vs25rio', 'Heart of Rio', 'vs25rio', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25rio.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:57:47', 1),
(274, 21, 'inativo', 'vs10nudgeit', 'Rise of Giza PowerNudge', 'vs10nudgeit', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10nudgeit.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:57:57', 1),
(275, 2, 'inativo', 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', 'vs10bxmasbnza', 'Slots', NULL, 'Games/Pragmatic/vs10bxmasbnza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000000, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:59:09', 0),
(276, 21, 'inativo', 'vs20santawonder', 'Santa\'s Wonderland', 'vs20santawonder', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20santawonder.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:57:53', 1),
(277, 2, 'inativo', 'vs10bblpop', 'Bubble Pop', 'vs10bblpop', 'Slots', NULL, 'Games/Pragmatic/vs10bblpop.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(278, 21, 'inativo', 'vs25btygold', 'Bounty Gold', 'vs25btygold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25btygold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:57:59', 1),
(279, 2, 'inativo', 'vs88hockattack', 'Hockey Attack(tm)', 'vs88hockattack', 'Slots', NULL, 'Games/Pragmatic/vs88hockattack.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(280, 2, 'inativo', 'vswaysbbb', 'Big Bass Bonanza Megaways(tm)', 'vswaysbbb', 'Slots', NULL, 'Games/Pragmatic/vswaysbbb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000003, 0, 1, '2025-04-14 18:56:25', '2025-07-05 09:37:44', 0),
(281, 21, 'inativo', 'vs10bookfallen', 'Book of Fallen', 'vs10bookfallen', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bookfallen.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:57:34', 1),
(282, 21, 'inativo', 'vs40bigjuan', 'Big Juan', 'vs40bigjuan', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40bigjuan.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:57:53', 1),
(283, 21, 'inativo', 'vs20bermuda', 'Bermuda Riches', 'vs20bermuda', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20bermuda.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:58:49', 1),
(284, 21, 'inativo', 'vs10starpirate', 'Star Pirates Code', 'vs10starpirate', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10starpirate.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:58:30', 1),
(285, 21, 'inativo', 'vswayswest', 'Mystic Chief', 'vswayswest', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayswest.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:58:13', 1),
(286, 21, 'inativo', 'vs20daydead', 'Day of Dead', 'vs20daydead', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20daydead.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:58:22', 1),
(287, 2, 'inativo', 'vs20candvil', 'Candy Village', 'vs20candvil', 'Slots', NULL, 'Games/Pragmatic/vs20candvil.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(288, 7, 'inativo', 'SGReturnToTheFeature', 'Return to the Future', 'SGReturnToTheFeature', 'Slots', NULL, 'Games/Habanero/SGReturnToTheFeature.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(289, 7, 'inativo', 'SGTabernaDeLosMuertosUltra', 'Tevena de los Muirtos Ultra', 'SGTabernaDeLosMuertosUltra', 'Slots', NULL, 'Games/Habanero/SGTabernaDeLosMuertosUltra.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(290, 7, 'inativo', 'SGTotemTowers', 'Totem towers', 'SGTotemTowers', 'Slots', NULL, 'Games/Habanero/SGTotemTowers.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(291, 7, 'inativo', 'SGChristmasGiftRush', 'Christmas Kipoot Rush', 'SGChristmasGiftRush', 'Slots', NULL, 'Games/Habanero/SGChristmasGiftRush.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(292, 7, 'inativo', 'SGOrbsOfAtlantis', 'Overs of Atlantis', 'SGOrbsOfAtlantis', 'Slots', NULL, 'Games/Habanero/SGOrbsOfAtlantis.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(293, 7, 'inativo', 'SGBeforeTimeRunsOut', 'Before Time Runner Out', 'SGBeforeTimeRunsOut', 'Slots', NULL, 'Games/Habanero/SGBeforeTimeRunsOut.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(294, 7, 'inativo', 'SGTechnoTumble', 'Techno tumble', 'SGTechnoTumble', 'Slots', NULL, 'Games/Habanero/SGTechnoTumble.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(295, 7, 'inativo', 'SGHappyApe', 'Happy ape', 'SGHappyApe', 'Slots', NULL, 'Games/Habanero/SGHappyApe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(296, 7, 'inativo', 'SGTabernaDeLosMuertos', 'Tevena di los Muertos', 'SGTabernaDeLosMuertos', 'Slots', NULL, 'Games/Habanero/SGTabernaDeLosMuertos.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(297, 7, 'inativo', 'SGNaughtySanta', 'Notty Santa', 'SGNaughtySanta', 'Slots', NULL, 'Games/Habanero/SGNaughtySanta.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(298, 7, 'inativo', 'SGFaCaiShenDeluxe', 'Pakai Sen Deluxe', 'SGFaCaiShenDeluxe', 'Slots', NULL, 'Games/Habanero/SGFaCaiShenDeluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(299, 7, 'inativo', 'SGHeySushi', 'Hey sushi', 'SGHeySushi', 'Slots', NULL, 'Games/Habanero/SGHeySushi.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(300, 7, 'inativo', 'SGKnockoutFootballRush', 'Knockout football rush', 'SGKnockoutFootballRush', 'Slots', NULL, 'Games/Habanero/SGKnockoutFootballRush.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(301, 7, 'inativo', 'SGColossalGems', 'Closal Gems', 'SGColossalGems', 'Slots', NULL, 'Games/Habanero/SGColossalGems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:25', '2025-04-14 18:56:25', 0),
(302, 7, 'inativo', 'SGHotHotHalloween', 'hot hot halloween', 'SGHotHotHalloween', 'Slots', NULL, 'Games/Habanero/SGHotHotHalloween.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(303, 7, 'inativo', 'SGLuckyFortuneCat', 'Lucky fortune cat', 'SGLuckyFortuneCat', 'Slots', NULL, 'Games/Habanero/SGLuckyFortuneCat.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(304, 7, 'inativo', 'SGHotHotFruit', 'hot hot fruit', 'SGHotHotFruit', 'Slots', NULL, 'Games/Habanero/SGHotHotFruit.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(305, 7, 'inativo', 'SGMountMazuma', 'Mount Majuma', 'SGMountMazuma', 'Slots', NULL, 'Games/Habanero/SGMountMazuma.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(306, 7, 'inativo', 'SGWildTrucks', 'Wild Trucks', 'SGWildTrucks', 'Slots', NULL, 'Games/Habanero/SGWildTrucks.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(307, 7, 'inativo', 'SGLuckyLucky', 'Lucky Lucky', 'SGLuckyLucky', 'Slots', NULL, 'Games/Habanero/SGLuckyLucky.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(308, 7, 'inativo', 'SGKnockoutFootball', 'Knockout football', 'SGKnockoutFootball', 'Slots', NULL, 'Games/Habanero/SGKnockoutFootball.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(309, 7, 'inativo', 'SGJump', 'Jump!', 'SGJump', 'Slots', NULL, 'Games/Habanero/SGJump.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(310, 7, 'inativo', 'SGPumpkinPatch', 'Pumpkin patch', 'SGPumpkinPatch', 'Slots', NULL, 'Games/Habanero/SGPumpkinPatch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(311, 7, 'inativo', 'SGWaysOfFortune', 'Way of Fortune', 'SGWaysOfFortune', 'Slots', NULL, 'Games/Habanero/SGWaysOfFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(312, 7, 'inativo', 'SGFourDivineBeasts', 'For Devine Beasts', 'SGFourDivineBeasts', 'Slots', NULL, 'Games/Habanero/SGFourDivineBeasts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(313, 7, 'inativo', 'SGPandaPanda', 'Panda panda', 'SGPandaPanda', 'Slots', NULL, 'Games/Habanero/SGPandaPanda.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(314, 7, 'inativo', 'SGOceansCall', 'Ocean s Call', 'SGOceansCall', 'Slots', NULL, 'Games/Habanero/SGOceansCall.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(315, 7, 'inativo', 'SGScruffyScallywags', 'Scruffy Skellywex', 'SGScruffyScallywags', 'Slots', NULL, 'Games/Habanero/SGScruffyScallywags.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(316, 7, 'inativo', 'SGNuwa', 'Nuwa', 'SGNuwa', 'Slots', NULL, 'Games/Habanero/SGNuwa.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(317, 7, 'inativo', 'SGTheKoiGate', 'Koi gate', 'SGTheKoiGate', 'Slots', NULL, 'Games/Habanero/SGTheKoiGate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(318, 7, 'inativo', 'SGFaCaiShen', 'Pacaishen', 'SGFaCaiShen', 'Slots', NULL, 'Games/Habanero/SGFaCaiShen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(319, 7, 'inativo', 'SG12Zodiacs', '12 zodiacs', 'SG12Zodiacs', 'Slots', NULL, 'Games/Habanero/SG12Zodiacs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(320, 7, 'inativo', 'SGFireRooster', 'Fire rooster', 'SGFireRooster', 'Slots', NULL, 'Games/Habanero/SGFireRooster.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(321, 7, 'inativo', 'SGFenghuang', 'Phoenix', 'SGFenghuang', 'Slots', NULL, 'Games/Habanero/SGFenghuang.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(322, 7, 'inativo', 'SGBirdOfThunder', 'Bird of Thunder', 'SGBirdOfThunder', 'Slots', NULL, 'Games/Habanero/SGBirdOfThunder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(323, 7, 'inativo', 'SGTheDeadEscape', 'The Dead Escape', 'SGTheDeadEscape', 'Slots', NULL, 'Games/Habanero/SGTheDeadEscape.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(324, 7, 'inativo', 'SGBombsAway', 'Bombs Away', 'SGBombsAway', 'Slots', NULL, 'Games/Habanero/SGBombsAway.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(325, 7, 'inativo', 'SGGoldRush', 'Gold rush', 'SGGoldRush', 'Slots', NULL, 'Games/Habanero/SGGoldRush.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(326, 7, 'inativo', 'SGRuffledUp', 'Ruffled up', 'SGRuffledUp', 'Slots', NULL, 'Games/Habanero/SGRuffledUp.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(327, 7, 'inativo', 'SGRomanEmpire', 'Roman empire', 'SGRomanEmpire', 'Slots', NULL, 'Games/Habanero/SGRomanEmpire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(328, 7, 'inativo', 'SGCoyoteCrash', 'Coyote crash', 'SGCoyoteCrash', 'Slots', NULL, 'Games/Habanero/SGCoyoteCrash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:26', '2025-04-14 18:56:26', 0),
(329, 7, 'inativo', 'SGWickedWitch', 'Wickt Location', 'SGWickedWitch', 'Slots', NULL, 'Games/Habanero/SGWickedWitch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:27', '2025-04-14 18:56:27', 0),
(330, 7, 'inativo', 'SGDragonsThrone', 'Dragon s Throne', 'SGDragonsThrone', 'Slots', NULL, 'Games/Habanero/SGDragonsThrone.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:27', '2025-04-14 18:56:27', 0),
(331, 7, 'inativo', 'SGBuggyBonus', 'Buggy bonus', 'SGBuggyBonus', 'Slots', NULL, 'Games/Habanero/SGBuggyBonus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:27', '2025-04-14 18:56:27', 0),
(332, 7, 'inativo', 'SGGlamRock', 'Glam rock', 'SGGlamRock', 'Slots', NULL, 'Games/Habanero/SGGlamRock.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:27', '2025-04-14 18:56:27', 0),
(333, 7, 'inativo', 'SGSuperTwister', 'Super twister', 'SGSuperTwister', 'Slots', NULL, 'Games/Habanero/SGSuperTwister.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:27', '2025-04-14 18:56:27', 0),
(334, 7, 'inativo', 'SGTreasureTomb', 'Treasure Tomb', 'SGTreasureTomb', 'Slots', NULL, 'Games/Habanero/SGTreasureTomb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:27', '2025-04-14 18:56:27', 0),
(335, 7, 'inativo', 'SGJugglenaut', 'Jugglenut', 'SGJugglenaut', 'Slots', NULL, 'Games/Habanero/SGJugglenaut.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:28', '2025-04-14 18:56:28', 0),
(336, 7, 'inativo', 'SGGalacticCash', 'Glactic Cash', 'SGGalacticCash', 'Slots', NULL, 'Games/Habanero/SGGalacticCash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:28', '2025-04-14 18:56:28', 0),
(337, 7, 'inativo', 'SGZeus2', 'Zeus 2', 'SGZeus2', 'Slots', NULL, 'Games/Habanero/SGZeus2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:28', '2025-04-14 18:56:28', 0),
(338, 7, 'inativo', 'SGTheDragonCastle', 'Dragon castle', 'SGTheDragonCastle', 'Slots', NULL, 'Games/Habanero/SGTheDragonCastle.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:28', '2025-04-14 18:56:28', 0),
(339, 7, 'inativo', 'SGKingTutsTomb', 'King Teeth Tomb', 'SGKingTutsTomb', 'Slots', NULL, 'Games/Habanero/SGKingTutsTomb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:28', '2025-04-14 18:56:28', 0),
(340, 7, 'inativo', 'SGCarnivalCash', 'Carnival cash', 'SGCarnivalCash', 'Slots', NULL, 'Games/Habanero/SGCarnivalCash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:28', '2025-04-14 18:56:28', 0),
(341, 7, 'inativo', 'SGTreasureDiver', 'Treasure diver', 'SGTreasureDiver', 'Slots', NULL, 'Games/Habanero/SGTreasureDiver.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:28', '2025-04-14 18:56:28', 0),
(342, 7, 'inativo', 'SGLittleGreenMoney', 'Little Green Money', 'SGLittleGreenMoney', 'Slots', NULL, 'Games/Habanero/SGLittleGreenMoney.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:28', '2025-04-14 18:56:28', 0),
(343, 7, 'inativo', 'SGMonsterMashCash', 'Monster Mash Cash', 'SGMonsterMashCash', 'Slots', NULL, 'Games/Habanero/SGMonsterMashCash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:56:29', '2025-06-29 10:39:46', 0),
(344, 7, 'inativo', 'SGShaolinFortunes100', 'Xiaolin Fortune 100', 'SGShaolinFortunes100', 'Slots', NULL, 'Games/Habanero/SGShaolinFortunes100.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:29', '2025-04-14 18:56:29', 0),
(345, 7, 'inativo', 'SGShaolinFortunes243', 'Xiaolin Fortune', 'SGShaolinFortunes243', 'Slots', NULL, 'Games/Habanero/SGShaolinFortunes243.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:29', '2025-04-14 18:56:29', 0),
(346, 7, 'inativo', 'SGWeirdScience', 'Weird Science', 'SGWeirdScience', 'Slots', NULL, 'Games/Habanero/SGWeirdScience.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:29', '2025-04-14 18:56:29', 0),
(347, 7, 'inativo', 'SGBlackbeardsBounty', 'Blackbeards Bounty', 'SGBlackbeardsBounty', 'Slots', NULL, 'Games/Habanero/SGBlackbeardsBounty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:29', '2025-04-14 18:56:29', 0),
(348, 7, 'inativo', 'SGDrFeelgood', 'Dr. Feelgood', 'SGDrFeelgood', 'Slots', NULL, 'Games/Habanero/SGDrFeelgood.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:56:29', '2025-08-13 21:06:27', 0),
(349, 7, 'inativo', 'SGVikingsPlunder', 'Vikings plunder', 'SGVikingsPlunder', 'Slots', NULL, 'Games/Habanero/SGVikingsPlunder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:29', '2025-04-14 18:56:29', 0),
(350, 7, 'inativo', 'SGDoubleODollars', 'Double O Dollars', 'SGDoubleODollars', 'Slots', NULL, 'Games/Habanero/SGDoubleODollars.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:30', '2025-04-14 18:56:30', 0),
(351, 7, 'inativo', 'SGSpaceFortune', 'Space fortune', 'SGSpaceFortune', 'Slots', NULL, 'Games/Habanero/SGSpaceFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:30', '2025-04-14 18:56:30', 0),
(352, 7, 'inativo', 'SGPamperMe', 'Pamper me', 'SGPamperMe', 'Slots', NULL, 'Games/Habanero/SGPamperMe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:30', '2025-04-14 18:56:30', 0),
(353, 7, 'inativo', 'SGZeus', 'Zeus', 'SGZeus', 'Slots', NULL, 'Games/Habanero/SGZeus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2025-04-14 18:56:30', '2025-08-01 12:49:41', 0),
(354, 7, 'inativo', 'SGEgyptianDreams', 'Egyptian Dreams', 'SGEgyptianDreams', 'Slots', NULL, 'Games/Habanero/SGEgyptianDreams.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:30', '2025-04-14 18:56:30', 0),
(355, 7, 'inativo', 'SGBarnstormerBucks', 'Barnstormer Bucks', 'SGBarnstormerBucks', 'Slots', NULL, 'Games/Habanero/SGBarnstormerBucks.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:31', '2025-04-14 20:33:29', 0),
(356, 7, 'inativo', 'SGSuperStrike', 'Super strike', 'SGSuperStrike', 'Slots', NULL, 'Games/Habanero/SGSuperStrike.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:31', '2025-04-14 18:56:31', 0),
(357, 7, 'inativo', 'SGJungleRumble', 'Jungle rumble', 'SGJungleRumble', 'Slots', NULL, 'Games/Habanero/SGJungleRumble.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:31', '2025-04-14 18:56:31', 0),
(358, 7, 'inativo', 'SGArcticWonders', 'Arctic Wonders', 'SGArcticWonders', 'Slots', NULL, 'Games/Habanero/SGArcticWonders.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:31', '2025-04-14 18:56:31', 0),
(359, 7, 'inativo', 'SGTowerOfPizza', 'Tower of Pizza', 'SGTowerOfPizza', 'Slots', NULL, 'Games/Habanero/SGTowerOfPizza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:31', '2025-04-14 20:33:27', 0),
(360, 7, 'inativo', 'SGMummyMoney', 'Mummy money', 'SGMummyMoney', 'Slots', NULL, 'Games/Habanero/SGMummyMoney.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:56:31', '2025-08-01 22:51:38', 0),
(361, 7, 'inativo', 'SGBikiniIsland', 'bikini island', 'SGBikiniIsland', 'Slots', NULL, 'Games/Habanero/SGBikiniIsland.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:32', '2025-04-14 20:33:31', 0),
(362, 7, 'inativo', 'SGQueenOfQueens1024', 'Queen of Queens II', 'SGQueenOfQueens1024', 'Slots', NULL, 'Games/Habanero/SGQueenOfQueens1024.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:32', '2025-04-14 18:56:32', 0),
(363, 7, 'inativo', 'SGDragonsRealm', 'Dragon s Realm', 'SGDragonsRealm', 'Slots', NULL, 'Games/Habanero/SGDragonsRealm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:32', '2025-04-14 18:56:32', 0),
(364, 7, 'inativo', 'SGAllForOne', 'All for one', 'SGAllForOne', 'Slots', NULL, 'Games/Habanero/SGAllForOne.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:32', '2025-04-14 20:33:32', 0),
(365, 7, 'inativo', 'SGFlyingHigh', 'Flying high', 'SGFlyingHigh', 'Slots', NULL, 'Games/Habanero/SGFlyingHigh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:32', '2025-04-14 18:56:32', 0),
(366, 7, 'inativo', 'SGMrBling', 'Mr. Bling', 'SGMrBling', 'Slots', NULL, 'Games/Habanero/SGMrBling.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:32', '2025-04-14 20:33:34', 0),
(367, 7, 'inativo', 'SGMysticFortune', 'Mystic Fortune', 'SGMysticFortune', 'Slots', NULL, 'Games/Habanero/SGMysticFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:56:32', '2025-06-30 16:42:38', 0),
(368, 7, 'inativo', 'SGQueenOfQueens243', 'Queen of queens', 'SGQueenOfQueens243', 'Slots', NULL, 'Games/Habanero/SGQueenOfQueens243.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:33', '2025-04-14 18:56:33', 0),
(369, 7, 'inativo', 'SGGrapeEscape', 'The Graph Escape', 'SGGrapeEscape', 'Slots', NULL, 'Games/Habanero/SGGrapeEscape.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:33', '2025-04-14 18:56:33', 0),
(370, 7, 'inativo', 'SGGoldenUnicorn', 'Golden unicorn', 'SGGoldenUnicorn', 'Slots', NULL, 'Games/Habanero/SGGoldenUnicorn.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:33', '2025-04-14 20:33:36', 0),
(371, 7, 'inativo', 'SGFrontierFortunes', 'Frontier Fortune', 'SGFrontierFortunes', 'Slots', NULL, 'Games/Habanero/SGFrontierFortunes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:33', '2025-04-14 18:56:33', 0),
(372, 7, 'inativo', 'SGIndianCashCatcher', 'Indian Cash Catcher', 'SGIndianCashCatcher', 'Slots', NULL, 'Games/Habanero/SGIndianCashCatcher.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:33', '2025-04-14 18:56:33', 0),
(373, 7, 'inativo', 'SGSkysTheLimit', 'Skys the Limit', 'SGSkysTheLimit', 'Slots', NULL, 'Games/Habanero/SGSkysTheLimit.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:33', '2025-04-14 20:33:35', 0),
(374, 7, 'inativo', 'SGTheBigDeal', 'The Big Deal', 'SGTheBigDeal', 'Slots', NULL, 'Games/Habanero/SGTheBigDeal.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:34', '2025-04-14 18:56:34', 0),
(375, 7, 'inativo', 'SGCashosaurus', 'Cashosaurus', 'SGCashosaurus', 'Slots', NULL, 'Games/Habanero/SGCashosaurus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:34', '2025-04-14 18:56:34', 0),
(376, 7, 'inativo', 'SGDiscoFunk', 'Disco funk', 'SGDiscoFunk', 'Slots', NULL, 'Games/Habanero/SGDiscoFunk.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:34', '2025-04-14 18:56:34', 0),
(377, 7, 'inativo', 'SGCalaverasExplosivas', 'Calaveras Explociba', 'SGCalaverasExplosivas', 'Slots', NULL, 'Games/Habanero/SGCalaverasExplosivas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:34', '2025-04-14 18:56:34', 0),
(378, 7, 'inativo', 'SGNineTails', 'Nine Tales', 'SGNineTails', 'Slots', NULL, 'Games/Habanero/SGNineTails.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:34', '2025-04-14 18:56:34', 0),
(379, 7, 'inativo', 'SGMysticFortuneDeluxe', 'Mystic Fortune Deluxe', 'SGMysticFortuneDeluxe', 'Slots', NULL, 'Games/Habanero/SGMysticFortuneDeluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:34', '2025-04-14 18:56:34', 0),
(380, 7, 'inativo', 'SGLuckyDurian', 'Lucky durian', 'SGLuckyDurian', 'Slots', NULL, 'Games/Habanero/SGLuckyDurian.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:34', '2025-04-14 18:56:34', 0),
(381, 7, 'inativo', 'SGDiscoBeats', 'Disco beat', 'SGDiscoBeats', 'Slots', NULL, 'Games/Habanero/SGDiscoBeats.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:34', '2025-04-14 18:56:34', 0),
(382, 7, 'inativo', 'SGLanternLuck', 'Lantern lucky', 'SGLanternLuck', 'Slots', NULL, 'Games/Habanero/SGLanternLuck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:34', '2025-04-14 18:56:34', 0),
(383, 7, 'inativo', 'SGBombRunner', 'Boom runner', 'SGBombRunner', 'Slots', NULL, 'Games/Habanero/SGBombRunner.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(384, 13, 'inativo', 'sun_of_egypt', 'SUN OF EGYPT', 'sun_of_egypt', 'Slots', NULL, 'Games/Booongo/sun_of_egypt.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(385, 13, 'inativo', 'sun_of_egypt_2', 'SUN OF EGYPT 2', 'sun_of_egypt_2', 'Slots', NULL, 'Games/Booongo/sun_of_egypt_2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(386, 13, 'inativo', 'happy_fish', 'HAPPY FISH', 'happy_fish', 'Slots', NULL, 'Games/Booongo/happy_fish.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(387, 13, 'inativo', 'queen_of_the_sun', 'QUEEN OF THE SUN', 'queen_of_the_sun', 'Slots', NULL, 'Games/Booongo/queen_of_the_sun.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(388, 13, 'inativo', 'tiger_jungle', 'TIGER JUNGLE', 'tiger_jungle', 'Slots', NULL, 'Games/Booongo/tiger_jungle.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(389, 13, 'inativo', 'black_wolf', 'BLACK WOLF', 'black_wolf', 'Slots', NULL, 'Games/Booongo/black_wolf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(390, 13, 'inativo', 'hit_the_gold', 'HIT THE GOLD', 'hit_the_gold', 'Slots', NULL, 'Games/Booongo/hit_the_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(391, 13, 'inativo', 'candy_boom', 'CANDY BOOM', 'candy_boom', 'Slots', NULL, 'Games/Booongo/candy_boom.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(392, 13, 'inativo', 'scarab_riches', 'SCARAB RICHES', 'scarab_riches', 'Slots', NULL, 'Games/Booongo/scarab_riches.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(393, 13, 'inativo', 'golden_dancing_lion', 'GOLDEN DANCING LION', 'golden_dancing_lion', 'Slots', NULL, 'Games/Booongo/golden_dancing_lion.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(394, 13, 'inativo', 'dragon_pearls', 'DRAGON PEARLS', 'dragon_pearls', 'Slots', NULL, 'Games/Booongo/dragon_pearls.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(395, 13, 'inativo', '3_coins', '3 COINS', '3_coins', 'Slots', NULL, 'Games/Booongo/3_coins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:35', '2025-04-14 18:56:35', 0),
(396, 13, 'inativo', 'super_rich_god', 'SUPER RICH GOD', 'super_rich_god', 'Slots', NULL, 'Games/Booongo/super_rich_god.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(397, 13, 'inativo', '15_dragon_pearls', '15 DRAGON PEARLS', '15_dragon_pearls', 'Slots', NULL, 'Games/Booongo/15_dragon_pearls.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(398, 13, 'inativo', 'aztec_sun', 'AZTEC SUN', 'aztec_sun', 'Slots', NULL, 'Games/Booongo/aztec_sun.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:56:36', '2025-07-03 22:30:30', 0),
(399, 13, 'inativo', 'scarab_temple', 'SCARAB TEMPLE', 'scarab_temple', 'Slots', NULL, 'Games/Booongo/scarab_temple.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(400, 13, 'inativo', 'gods_temple_deluxe', 'GODS TEMPLE DELUXE', 'gods_temple_deluxe', 'Slots', NULL, 'Games/Booongo/gods_temple_deluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(401, 13, 'inativo', 'book_of_sun', 'BOOK OF SUN', 'book_of_sun', 'Slots', NULL, 'Games/Booongo/book_of_sun.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(402, 13, 'inativo', '777_gems', '777 GEMS', '777_gems', 'Slots', NULL, 'Games/Booongo/777_gems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(403, 13, 'inativo', 'book_of_sun_multichance', 'BOOK OF SUN MULTICHANCE', 'book_of_sun_multichance', 'Slots', NULL, 'Games/Booongo/book_of_sun_multichance.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(404, 13, 'inativo', 'olympian_gods', 'OLYMPIAN GODS', 'olympian_gods', 'Slots', NULL, 'Games/Booongo/olympian_gods.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(405, 13, 'inativo', '777_gems_respin', '777 GEMS RESPIN', '777_gems_respin', 'Slots', NULL, 'Games/Booongo/777_gems_respin.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(406, 13, 'inativo', 'tigers_gold', 'TIGERS GOLD', 'tigers_gold', 'Slots', NULL, 'Games/Booongo/tigers_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(407, 13, 'inativo', 'moon_sisters', 'MOON SISTERS', 'moon_sisters', 'Slots', NULL, 'Games/Booongo/moon_sisters.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(408, 13, 'inativo', 'book_of_sun_choice', 'BOOK OF SUN CHOICE', 'book_of_sun_choice', 'Slots', NULL, 'Games/Booongo/book_of_sun_choice.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(409, 13, 'inativo', 'super_marble', 'SUPER MARBLE', 'super_marble', 'Slots', NULL, 'Games/Booongo/super_marble.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:36', '2025-04-14 18:56:36', 0),
(410, 13, 'inativo', 'buddha_fortune', 'BUDDHA FORTUNE', 'buddha_fortune', 'Slots', NULL, 'Games/Booongo/buddha_fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:37', '2025-04-14 18:56:37', 0),
(411, 13, 'inativo', 'great_panda', 'GREAT PANDA', 'great_panda', 'Slots', NULL, 'Games/Booongo/great_panda.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:37', '2025-04-14 18:56:37', 0),
(412, 13, 'inativo', '15_golden_eggs', '15 GOLDEN EGGS', '15_golden_eggs', 'Slots', NULL, 'Games/Booongo/15_golden_eggs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:37', '2025-04-14 18:56:37', 0),
(413, 13, 'inativo', 'thunder_of_olympus', 'THUNDER OF OLYMPUS', 'thunder_of_olympus', 'Slots', NULL, 'Games/Booongo/thunder_of_olympus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:37', '2025-04-14 18:56:37', 0),
(414, 13, 'inativo', 'eye_of_gold', 'EYE OF GOLD', 'eye_of_gold', 'Slots', NULL, 'Games/Booongo/eye_of_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:37', '2025-04-14 18:56:37', 0),
(415, 13, 'inativo', 'tiger_stone', 'TIGER STONE', 'tiger_stone', 'Slots', NULL, 'Games/Booongo/tiger_stone.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:38', '2025-04-14 18:56:38', 0),
(416, 13, 'inativo', 'magic_apple', 'MAGIC APPLE', 'magic_apple', 'Slots', NULL, 'Games/Booongo/magic_apple.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:38', '2025-04-14 18:56:38', 0),
(417, 13, 'inativo', 'wolf_saga', 'WOLF SAGA', 'wolf_saga', 'Slots', NULL, 'Games/Booongo/wolf_saga.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:38', '2025-04-14 18:56:38', 0),
(418, 13, 'inativo', 'magic_ball', 'MAGIC BALL', 'magic_ball', 'Slots', NULL, 'Games/Booongo/magic_ball.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:38', '2025-04-14 18:56:38', 0),
(419, 13, 'inativo', 'scarab_boost', 'SCARAB BOOST', 'scarab_boost', 'Slots', NULL, 'Games/Booongo/scarab_boost.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:38', '2025-04-14 18:56:38', 0),
(420, 13, 'inativo', 'wukong', 'WUKONG', 'wukong', 'Slots', NULL, 'Games/Booongo/wukong.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:38', '2025-04-14 18:56:38', 0),
(421, 13, 'inativo', 'pearl_diver', 'PEARL DIVER', 'pearl_diver', 'Slots', NULL, 'Games/Booongo/pearl_diver.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2025-04-14 18:56:39', '2025-06-30 13:22:56', 0),
(422, 13, 'inativo', '3_coins_egypt', '3 COINS EGYPT', '3_coins_egypt', 'Slots', NULL, 'Games/Booongo/3_coins_egypt.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:56:39', '2025-07-23 23:05:54', 0),
(423, 13, 'inativo', 'ganesha_boost', 'GANESHA BOOST', 'ganesha_boost', 'Slots', NULL, 'Games/Booongo/ganesha_boost.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2025-04-14 18:56:39', '2025-08-02 10:41:32', 0),
(424, 13, 'inativo', 'wolf_night', 'WOLF NIGHT', 'wolf_night', 'Slots', NULL, 'Games/Booongo/wolf_night.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:56:39', '2025-07-24 17:49:02', 0),
(425, 13, 'inativo', 'book_of_wizard', 'BOOK OF WIZARD', 'book_of_wizard', 'Slots', NULL, 'Games/Booongo/book_of_wizard.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:39', '2025-04-14 20:19:03', 0),
(426, 13, 'inativo', 'lord_fortune_2', 'LORD FORTUNE 2', 'lord_fortune_2', 'Slots', NULL, 'Games/Booongo/lord_fortune_2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:56:39', '2025-07-03 03:57:37', 0),
(427, 13, 'inativo', 'gold_express', 'GOLD EXPRESS', 'gold_express', 'Slots', NULL, 'Games/Booongo/gold_express.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:39', '2025-04-14 18:56:39', 0),
(428, 13, 'inativo', 'book_of_wizard_crystal', 'BOOK OF WIZARD CRYSTAL', 'book_of_wizard_crystal', 'Slots', NULL, 'Games/Booongo/book_of_wizard_crystal.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:40', '2025-04-14 20:18:52', 0),
(429, 13, 'inativo', 'pearl_diver_2', 'PEARL DIVER 2', 'pearl_diver_2', 'Slots', NULL, 'Games/Booongo/pearl_diver_2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:40', '2025-04-14 18:56:40', 0),
(430, 13, 'inativo', 'sun_of_egypt_3', 'SUN OF EGYPT 3', 'sun_of_egypt_3', 'Slots', NULL, 'Games/Booongo/sun_of_egypt_3.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:40', '2025-04-14 20:18:50', 0);
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `original`) VALUES
(431, 13, 'inativo', 'caishen_wealth', 'CAISHEN WEALTH', 'caishen_wealth', 'Slots', NULL, 'Games/Booongo/caishen_wealth.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:40', '2025-04-14 20:18:49', 0),
(432, 13, 'inativo', 'aztec_fire', 'AZTEC FIRE', 'aztec_fire', 'Slots', NULL, 'Games/Booongo/aztec_fire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:40', '2025-04-14 20:18:46', 0),
(433, 14, 'inativo', '67', 'Golden eggs', '67', 'Slots', NULL, 'Games/Cq9/67.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:40', '2025-04-14 18:56:40', 0),
(434, 14, 'inativo', '161', 'Hercules', '161', 'Slots', NULL, 'Games/Cq9/161.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:40', '2025-04-14 18:56:40', 0),
(435, 14, 'inativo', '16', 'Super 5', '16', 'Slots', NULL, 'Games/Cq9/16.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:40', '2025-04-14 18:56:40', 0),
(436, 14, 'inativo', '72', 'Happy Rich Year', '72', 'Slots', NULL, 'Games/Cq9/72.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:40', '2025-04-14 18:56:40', 0),
(437, 14, 'inativo', '1', 'Fruit King', '1', 'Slots', NULL, 'Games/Cq9/1.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:41', '2025-04-14 18:56:41', 0),
(438, 14, 'inativo', '163', 'Neja Advent', '163', 'Slots', NULL, 'Games/Cq9/163.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:41', '2025-04-14 18:56:41', 0),
(439, 14, 'inativo', '26', '777', '26', 'Slots', NULL, 'Games/Cq9/26.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:41', '2025-04-14 18:56:41', 0),
(440, 14, 'inativo', '50', 'Good fortune', '50', 'Slots', NULL, 'Games/Cq9/50.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:41', '2025-04-14 18:56:41', 0),
(441, 14, 'inativo', '31', 'God of war', '31', 'Slots', NULL, 'Games/Cq9/31.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:42', '2025-04-14 18:56:42', 0),
(442, 14, 'inativo', '64', 'Zeus', '64', 'Slots', NULL, 'Games/Cq9/64.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:42', '2025-04-14 18:56:42', 0),
(443, 14, 'inativo', '89', 'Thor', '89', 'Slots', NULL, 'Games/Cq9/89.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:42', '2025-04-14 18:56:42', 0),
(444, 14, 'inativo', '46', 'Wolf moon', '46', 'Slots', NULL, 'Games/Cq9/46.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:42', '2025-04-14 18:56:42', 0),
(445, 14, 'inativo', '139', 'Fire chibi', '139', 'Slots', NULL, 'Games/Cq9/139.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:42', '2025-04-14 18:56:42', 0),
(446, 14, 'inativo', '15', 'Gu Gu Gu', '15', 'Slots', NULL, 'Games/Cq9/15.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:42', '2025-04-14 18:56:42', 0),
(447, 14, 'inativo', '140', 'Fire Chibi 2', '140', 'Slots', NULL, 'Games/Cq9/140.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:43', '2025-04-14 18:56:43', 0),
(448, 14, 'inativo', '8', 'So Sweet', '8', 'Slots', NULL, 'Games/Cq9/8.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:43', '2025-04-14 18:56:43', 0),
(449, 14, 'inativo', '147', 'Flower fortune', '147', 'Slots', NULL, 'Games/Cq9/147.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:43', '2025-04-14 18:56:43', 0),
(450, 14, 'inativo', '113', 'Flying Kai Shen', '113', 'Slots', NULL, 'Games/Cq9/113.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:43', '2025-04-14 18:56:43', 0),
(451, 14, 'inativo', '58', 'Gu Gu Gu 2', '58', 'Slots', NULL, 'Games/Cq9/58.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:43', '2025-04-14 18:56:43', 0),
(452, 14, 'inativo', '128', 'Wheel money', '128', 'Slots', NULL, 'Games/Cq9/128.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:43', '2025-04-14 18:56:43', 0),
(453, 14, 'inativo', '5', 'Mr Rich', '5', 'Slots', NULL, 'Games/Cq9/5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:43', '2025-04-14 18:56:43', 0),
(454, 14, 'inativo', '180', 'Gu Gu Gu 3', '180', 'Slots', NULL, 'Games/Cq9/180.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 8, 0, 1, '2025-04-14 18:56:44', '2025-08-12 18:12:40', 0),
(455, 14, 'inativo', '118', 'SkullSkull', '118', 'Slots', NULL, 'Games/Cq9/118.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:44', '2025-04-14 18:56:44', 0),
(456, 14, 'inativo', '148', 'Fortune totem', '148', 'Slots', NULL, 'Games/Cq9/148.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:44', '2025-04-14 18:56:44', 0),
(457, 14, 'inativo', '144', 'Diamond treasure', '144', 'Slots', NULL, 'Games/Cq9/144.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:44', '2025-04-14 20:19:28', 0),
(458, 14, 'inativo', '19', 'Hot spin', '19', 'Slots', NULL, 'Games/Cq9/19.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2025-04-14 18:56:44', '2025-07-23 16:27:04', 0),
(459, 14, 'inativo', '112', 'Pyramid radar', '112', 'Slots', NULL, 'Games/Cq9/112.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:45', '2025-04-14 18:56:45', 0),
(460, 14, 'inativo', '160', 'Pa Kai Shen2', '160', 'Slots', NULL, 'Games/Cq9/160.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:45', '2025-04-14 20:19:20', 0),
(461, 14, 'inativo', '47', 'Pharaoh gold', '47', 'Slots', NULL, 'Games/Cq9/47.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:45', '2025-04-14 18:56:45', 0),
(462, 14, 'inativo', '13', 'Sakura legend', '13', 'Slots', NULL, 'Games/Cq9/13.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:45', '2025-04-14 18:56:45', 0),
(463, 14, 'inativo', '34', 'Gopher s War', '34', 'Slots', NULL, 'Games/Cq9/34.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:45', '2025-04-14 20:19:22', 0),
(464, 14, 'inativo', '59', 'Summer mood', '59', 'Slots', NULL, 'Games/Cq9/59.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:45', '2025-04-14 18:56:45', 0),
(465, 5, 'inativo', '95', 'Secret Elixir', '95', 'Slots', NULL, 'Games/Novomatic/Secret-Elixir.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:56:45', '2025-07-30 22:38:19', 1),
(466, 14, 'inativo', '17', 'Great lion', '17', 'Slots', NULL, 'Games/Cq9/17.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:45', '2025-04-14 20:19:18', 0),
(467, 14, 'inativo', '20', '888', '20', 'Slots', NULL, 'Games/Cq9/20.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:45', '2025-04-14 20:19:23', 0),
(468, 14, 'inativo', '182', 'Thor 2', '182', 'Slots', NULL, 'Games/Cq9/182.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(469, 14, 'inativo', '66', 'Fire 777', '66', 'Slots', NULL, 'Games/Cq9/66.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(470, 14, 'inativo', '2', 'God of Chess', '2', 'Slots', NULL, 'Games/Cq9/2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:46', '2025-04-14 20:19:17', 0),
(471, 14, 'inativo', '21', 'Big wolf', '21', 'Slots', NULL, 'Games/Cq9/21.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(472, 14, 'inativo', '197', 'Dragon s Treasure', '197', 'Slots', NULL, 'Games/Cq9/197.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:46', '2025-04-14 20:19:16', 0),
(473, 14, 'inativo', '208', 'Money tree', '208', 'Slots', NULL, 'Games/Cq9/208.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(474, 14, 'inativo', '212', 'Burning Si-Yow', '212', 'Slots', NULL, 'Games/Cq9/212.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:56:46', '2025-07-11 21:09:34', 0),
(475, 14, 'inativo', '214', 'Ninja raccoon', '214', 'Slots', NULL, 'Games/Cq9/214.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:46', '2025-04-14 20:19:36', 0),
(476, 14, 'inativo', '218', 'Dollar night', '218', 'Slots', NULL, 'Games/Cq9/218.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(477, 12, 'inativo', 'greatwall', 'The Great Wall Treasure', 'greatwall', 'Slots', NULL, 'Games/Evoplay/greatwall.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(478, 12, 'inativo', 'chinesenewyear', 'Chinese New Year', 'chinesenewyear', 'Slots', NULL, 'Games/Evoplay/chinesenewyear.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(479, 12, 'inativo', 'jewellerystore', 'Jewelry store', 'jewellerystore', 'Slots', NULL, 'Games/Evoplay/jewellerystore.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(480, 12, 'inativo', 'redcliff', 'Red cliff', 'redcliff', 'Slots', NULL, 'Games/Evoplay/redcliff.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(481, 12, 'inativo', 'ElvenPrincesses', 'Elven Princess', 'ElvenPrincesses', 'Slots', NULL, 'Games/Evoplay/ElvenPrincesses.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:56:46', '2025-07-19 01:04:55', 0),
(482, 12, 'inativo', 'robinzon', 'Robinson', 'robinzon', 'Slots', NULL, 'Games/Evoplay/robinzon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(483, 12, 'inativo', 'aeronauts', 'Aeronauts', 'aeronauts', 'Slots', NULL, 'Games/Evoplay/aeronauts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:46', '2025-04-14 18:56:46', 0),
(484, 12, 'inativo', 'monsterlab', 'Monster rap', 'monsterlab', 'Slots', NULL, 'Games/Evoplay/monsterlab.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(485, 12, 'inativo', 'TriptotheFuture', 'Trip to the Future', 'TriptotheFuture', 'Slots', NULL, 'Games/Evoplay/TriptotheFuture.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(486, 12, 'inativo', 'NukeWorld', 'Nook World', 'NukeWorld', 'Slots', NULL, 'Games/Evoplay/NukeWorld.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:47', '2025-04-14 20:28:01', 0),
(487, 12, 'inativo', 'legendofkaan', 'Legend of Khan', 'legendofkaan', 'Slots', NULL, 'Games/Evoplay/legendofkaan.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(488, 12, 'inativo', 'LivingTales', 'Night of the Living Tales', 'LivingTales', 'Slots', NULL, 'Games/Evoplay/LivingTales.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(489, 12, 'inativo', 'IceMania', 'Ice mania', 'IceMania', 'Slots', NULL, 'Games/Evoplay/IceMania.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:56:47', '2025-08-01 20:46:40', 0),
(490, 12, 'inativo', 'ValleyOfDreams', 'Valley of Dreams', 'ValleyOfDreams', 'Slots', NULL, 'Games/Evoplay/ValleyOfDreams.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(491, 12, 'inativo', 'FruitNova', 'Fruit Nova', 'FruitNova', 'Slots', NULL, 'Games/Evoplay/FruitNova.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(492, 12, 'inativo', 'TreeOfLight', 'Tree of light', 'TreeOfLight', 'Slots', NULL, 'Games/Evoplay/TreeOfLight.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:47', '2025-04-14 20:28:05', 0),
(493, 12, 'inativo', 'TempleOfDead', 'Temple of the dead', 'TempleOfDead', 'Slots', NULL, 'Games/Evoplay/TempleOfDead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(494, 12, 'inativo', 'RunesOfDestiny', 'Runes of Destiny', 'RunesOfDestiny', 'Slots', NULL, 'Games/Evoplay/RunesOfDestiny.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(495, 12, 'inativo', 'EllensFortune', 'Ellen Fortune', 'EllensFortune', 'Slots', NULL, 'Games/Evoplay/EllensFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(496, 12, 'inativo', 'UnlimitedWishes', 'Unlimited Wishes', 'UnlimitedWishes', 'Slots', NULL, 'Games/Evoplay/UnlimitedWishes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(497, 12, 'inativo', 'FoodFeast', 'Food fist', 'FoodFeast', 'Slots', NULL, 'Games/Evoplay/FoodFeast.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(498, 12, 'inativo', 'EpicLegends', 'Epic legends', 'EpicLegends', 'Slots', NULL, 'Games/Evoplay/EpicLegends.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(499, 12, 'inativo', 'SweetSugar', 'Sweet sugar', 'SweetSugar', 'Slots', NULL, 'Games/Evoplay/SweetSugar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(500, 12, 'inativo', 'CycleofLuck', 'Cycle of Luck', 'CycleofLuck', 'Slots', NULL, 'Games/Evoplay/CycleofLuck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:47', '2025-04-14 20:28:09', 0),
(501, 12, 'inativo', 'GangsterNight', 'Gangster night', 'GangsterNight', 'Slots', NULL, 'Games/Evoplay/GangsterNight.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(502, 12, 'inativo', 'GoldOfSirens', 'Gold of sirens', 'GoldOfSirens', 'Slots', NULL, 'Games/Evoplay/GoldOfSirens.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(503, 12, 'inativo', 'BloodyBrilliant', 'Bloody brilliant', 'BloodyBrilliant', 'Slots', NULL, 'Games/Evoplay/BloodyBrilliant.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(504, 12, 'inativo', 'TempleOfDeadBonusBuy', 'Temple of the Dead BB', 'TempleOfDeadBonusBuy', 'Slots', NULL, 'Games/Evoplay/TempleOfDeadBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(505, 12, 'inativo', 'ShadowOfLuxor', 'Shadow of Luxor', 'ShadowOfLuxor', 'Slots', NULL, 'Games/Evoplay/ShadowOfLuxor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(506, 12, 'inativo', 'CycleofLuckBonusBuy', 'Cycle of Luck BB', 'CycleofLuckBonusBuy', 'Slots', NULL, 'Games/Evoplay/CycleofLuckBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(507, 12, 'inativo', 'AnubisMoon', 'Anubis moon', 'AnubisMoon', 'Slots', NULL, 'Games/Evoplay/AnubisMoon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(508, 12, 'inativo', 'FruitDisco', 'Fruit disco', 'FruitDisco', 'Slots', NULL, 'Games/Evoplay/FruitDisco.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(509, 12, 'inativo', 'FruitSuperNova30', 'Fruit Super Nova 30', 'FruitSuperNova30', 'Slots', NULL, 'Games/Evoplay/FruitSuperNova30.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(510, 12, 'inativo', 'CurseOfThePharaoh', 'Curse of the Pharaoh', 'CurseOfThePharaoh', 'Slots', NULL, 'Games/Evoplay/CurseOfThePharaoh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(511, 12, 'inativo', 'GoldOfSirensBonusBuy', 'Gold of Sirens BB', 'GoldOfSirensBonusBuy', 'Slots', NULL, 'Games/Evoplay/GoldOfSirensBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(512, 12, 'inativo', 'FruitSuperNova60', 'Fruit Super Nova 60', 'FruitSuperNova60', 'Slots', NULL, 'Games/Evoplay/FruitSuperNova60.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(513, 12, 'inativo', 'CurseofthePharaohBonusBuy', 'Curse of the Pharaoh BB', 'CurseofthePharaohBonusBuy', 'Slots', NULL, 'Games/Evoplay/CurseofthePharaohBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(514, 12, 'inativo', 'FruitSuperNova100', 'Fruit Super Nova 100', 'FruitSuperNova100', 'Slots', NULL, 'Games/Evoplay/FruitSuperNova100.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(515, 12, 'inativo', 'FruitSuperNova80', 'Whoft Super Nova 80', 'FruitSuperNova80', 'Slots', NULL, 'Games/Evoplay/FruitSuperNova80.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(516, 12, 'inativo', 'DragonsTavern', 'Dragons Tavern', 'DragonsTavern', 'Slots', NULL, 'Games/Evoplay/DragonsTavern.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(517, 12, 'inativo', 'ChristmasReachBonusBuy', 'Christmas Riti BB', 'ChristmasReachBonusBuy', 'Slots', NULL, 'Games/Evoplay/ChristmasReachBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:47', '2025-04-14 18:56:47', 0),
(518, 12, 'inativo', 'WildOverlords', 'Wild overlord', 'WildOverlords', 'Slots', NULL, 'Games/Evoplay/WildOverlords.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:48', '2025-04-14 20:27:45', 0),
(519, 12, 'inativo', 'DragonsTavernBonusBuy', 'Dragons Tavern BB', 'DragonsTavernBonusBuy', 'Slots', NULL, 'Games/Evoplay/DragonsTavernBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(520, 12, 'inativo', 'BudaiReels', 'Budai reels', 'BudaiReels', 'Slots', NULL, 'Games/Evoplay/BudaiReels.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:48', '2025-04-14 20:27:47', 0),
(521, 12, 'inativo', 'BudaiReelsBonusBuy', 'Budai Lils BB', 'BudaiReelsBonusBuy', 'Slots', NULL, 'Games/Evoplay/BudaiReelsBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(522, 12, 'inativo', 'MoneyMinter', 'Money minter', 'MoneyMinter', 'Slots', NULL, 'Games/Evoplay/MoneyMinter.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(523, 12, 'inativo', 'TheGreatestCatch', 'The Greatest Catch', 'TheGreatestCatch', 'Slots', NULL, 'Games/Evoplay/TheGreatestCatch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:48', '2025-04-14 20:27:49', 0),
(524, 12, 'inativo', 'TreeOfLightBB', 'Tree of Light BB', 'TreeOfLightBB', 'Slots', NULL, 'Games/Evoplay/TreeOfLightBB.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(525, 12, 'inativo', 'WolfHiding', 'Wolf Hiding', 'WolfHiding', 'Slots', NULL, 'Games/Evoplay/WolfHiding.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(526, 12, 'inativo', 'CaminoDeChili', 'Camino de Chili', 'CaminoDeChili', 'Slots', NULL, 'Games/Evoplay/CaminoDeChili.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:48', '2025-04-14 20:27:52', 0),
(527, 12, 'inativo', 'CandyDreamsSweetPlanet', 'candy dreams', 'CandyDreamsSweetPlanet', 'Slots', NULL, 'Games/Evoplay/CandyDreamsSweetPlanet.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:48', '2025-04-14 20:27:53', 0),
(528, 12, 'inativo', 'WildOverlordsBonusBuy', 'Wild Overlord BB', 'WildOverlordsBonusBuy', 'Slots', NULL, 'Games/Evoplay/WildOverlordsBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(529, 12, 'inativo', 'TempleOfThunder', 'Temple of Thunder', 'TempleOfThunder', 'Slots', NULL, 'Games/Evoplay/TempleOfThunder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(530, 10, 'inativo', 'WildTriads', 'WildTriads', 'WildTriads', 'Slots', NULL, 'Games/Toptrend/WildTriads.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(531, 10, 'inativo', 'GoldenDragon', 'Golden Dragon', 'GoldenDragon', 'Slots', NULL, 'Games/Toptrend/GoldenDragon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(532, 10, 'inativo', 'ReelsOfFortune', 'Reels Of Fortune', 'ReelsOfFortune', 'Slots', NULL, 'Games/Toptrend/ReelsOfFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(533, 10, 'inativo', 'GoldenAmazon', 'Golden Amazon', 'GoldenAmazon', 'Slots', NULL, 'Games/Toptrend/GoldenAmazon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(534, 10, 'inativo', 'MonkeyLuck', 'MonkeyLuck', 'MonkeyLuck', 'Slots', NULL, 'Games/Toptrend/MonkeyLuck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(535, 10, 'inativo', 'LeagueOfChampions', 'League Of Champions', 'LeagueOfChampions', 'Slots', NULL, 'Games/Toptrend/LeagueOfChampions.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(536, 10, 'inativo', 'MadMonkeyH5', 'MadMonkey', 'MadMonkeyH5', 'Slots', NULL, 'Games/Toptrend/MadMonkeyH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(537, 10, 'inativo', 'DynastyEmpire', 'Dynasty Empire', 'DynastyEmpire', 'Slots', NULL, 'Games/Toptrend/DynastyEmpire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(538, 10, 'inativo', 'SuperKids', 'SuperKids', 'SuperKids', 'Slots', NULL, 'Games/Toptrend/SuperKids.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:56:48', '2025-09-11 19:50:53', 0),
(539, 10, 'inativo', 'HotVolcanoH5', 'HotVolcano', 'HotVolcanoH5', 'Slots', NULL, 'Games/Toptrend/HotVolcanoH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(540, 10, 'inativo', 'Huluwa', 'Huluwa', 'Huluwa', 'Slots', NULL, 'Games/Toptrend/Huluwa.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(541, 10, 'inativo', 'LegendOfLinkH5', 'LegendOfLink', 'LegendOfLinkH5', 'Slots', NULL, 'Games/Toptrend/LegendOfLinkH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(542, 10, 'inativo', 'DetectiveBlackCat', 'DetectiveBlackCat', 'DetectiveBlackCat', 'Slots', NULL, 'Games/Toptrend/DetectiveBlackCat.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(543, 10, 'inativo', 'ChilliGoldH5', 'Chilli Gold', 'ChilliGoldH5', 'Slots', NULL, 'Games/Toptrend/ChilliGoldH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(544, 10, 'inativo', 'SilverLionH5', 'Silver Lion', 'SilverLionH5', 'Slots', NULL, 'Games/Toptrend/SilverLionH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(545, 10, 'inativo', 'ThunderingZeus', 'ThunderingZeus', 'ThunderingZeus', 'Slots', NULL, 'Games/Toptrend/ThunderingZeus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:56:48', '2025-07-11 22:39:14', 0),
(546, 10, 'inativo', 'DragonPalaceH5', 'Dragon Palace', 'DragonPalaceH5', 'Slots', NULL, 'Games/Toptrend/DragonPalaceH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(547, 10, 'inativo', 'MadMonkey2', 'MadMonkey', 'MadMonkey2', 'Slots', NULL, 'Games/Toptrend/MadMonkey2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(548, 10, 'inativo', 'MedusaCurse', 'Medusa Curse', 'MedusaCurse', 'Slots', NULL, 'Games/Toptrend/MedusaCurse.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(549, 10, 'inativo', 'BattleHeroes', 'Battle Heroes', 'BattleHeroes', 'Slots', NULL, 'Games/Toptrend/BattleHeroes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 16, 0, 1, '2025-04-14 18:56:48', '2025-08-06 11:12:57', 0),
(550, 10, 'inativo', 'NeptunesGoldH5', 'Neptunes Gold', 'NeptunesGoldH5', 'Slots', NULL, 'Games/Toptrend/NeptunesGoldH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(551, 10, 'inativo', 'HeroesNeverDie', 'Heroes Never Die', 'HeroesNeverDie', 'Slots', NULL, 'Games/Toptrend/HeroesNeverDie.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(552, 10, 'inativo', 'WildWildWitch', 'Wild Wild Witch', 'WildWildWitch', 'Slots', NULL, 'Games/Toptrend/WildWildWitch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(553, 10, 'inativo', 'WildKartRacers', 'Wild Kart Racers', 'WildKartRacers', 'Slots', NULL, 'Games/Toptrend/WildKartRacers.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:48', '2025-04-14 18:56:48', 0),
(554, 10, 'inativo', 'KingDinosaur', 'KingDinosaur', 'KingDinosaur', 'Slots', NULL, 'Games/Toptrend/KingDinosaur.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:56:48', '2025-08-12 18:15:36', 0),
(555, 10, 'inativo', 'GoldenGenie', 'GoldenGenie', 'GoldenGenie', 'Slots', NULL, 'Games/Toptrend/GoldenGenie.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(556, 10, 'inativo', 'UltimateFighter', 'UltimateFighter', 'UltimateFighter', 'Slots', NULL, 'Games/Toptrend/UltimateFighter.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 10, 0, 1, '2025-04-14 18:56:49', '2025-08-16 23:03:01', 0),
(557, 10, 'inativo', 'EverlastingSpins', 'EverlastingSpins', 'EverlastingSpins', 'Slots', NULL, 'Games/Toptrend/EverlastingSpins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:49', '2025-04-14 20:48:57', 0),
(558, 10, 'inativo', 'Zoomania', 'Zoomania', 'Zoomania', 'Slots', NULL, 'Games/Toptrend/Zoomania.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 54, 0, 1, '2025-04-14 18:56:49', '2025-08-25 13:22:54', 0),
(559, 10, 'inativo', 'LaserCats', 'Laser Cats', 'LaserCats', 'Slots', NULL, 'Games/Toptrend/LaserCats.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(560, 10, 'inativo', 'DiamondFortune', 'DiamondFortune', 'DiamondFortune', 'Slots', NULL, 'Games/Toptrend/DiamondFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(561, 10, 'inativo', 'GoldenClaw', 'GoldenClaw', 'GoldenClaw', 'Slots', NULL, 'Games/Toptrend/GoldenClaw.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 6, 0, 1, '2025-04-14 18:56:49', '2025-08-13 21:01:38', 0),
(562, 10, 'inativo', 'PandaWarrior', 'PandaWarrior', 'PandaWarrior', 'Slots', NULL, 'Games/Toptrend/PandaWarrior.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:56:49', '2025-07-30 15:49:29', 0),
(563, 10, 'inativo', 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'Slots', NULL, 'Games/Toptrend/RoyalGoldenDragon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 10, 0, 1, '2025-04-14 18:56:49', '2025-08-14 01:02:06', 0),
(564, 10, 'inativo', 'MegaMaya', 'MegaMaya', 'MegaMaya', 'Slots', NULL, 'Games/Toptrend/MegaMaya.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(565, 10, 'inativo', 'MegaPhoenix', 'MegaPhoenix', 'MegaPhoenix', 'Slots', NULL, 'Games/Toptrend/MegaPhoenix.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:56:49', '2025-08-14 01:04:31', 0),
(566, 10, 'inativo', 'DolphinGoldH5', 'DolphinGold', 'DolphinGoldH5', 'Slots', NULL, 'Games/Toptrend/DolphinGoldH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(567, 10, 'inativo', 'DragonKingH5', 'DragonKing', 'DragonKingH5', 'Slots', NULL, 'Games/Toptrend/DragonKingH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(568, 10, 'inativo', 'LuckyPandaH5', 'LuckyPanda', 'LuckyPandaH5', 'Slots', NULL, 'Games/Toptrend/LuckyPandaH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:56:49', '2025-08-13 21:04:26', 0),
(569, 11, 'inativo', 'btball5x20', 'Crazy Basketball', 'btball5x20', 'Slots', NULL, 'Games/Dreamtech/btball5x20.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(570, 11, 'inativo', 'dnp', 'DragonPhoenix Prosper', 'dnp', 'Slots', NULL, 'Games/Dreamtech/dnp.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(571, 11, 'inativo', 'crystal', 'Glory of Heroes', 'crystal', 'Slots', NULL, 'Games/Dreamtech/crystal.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(572, 11, 'inativo', 'fls', 'FULUSHOU', 'fls', 'Slots', NULL, 'Games/Dreamtech/fls.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(573, 11, 'inativo', 'fourss', 'Four Holy Beasts', 'fourss', 'Slots', NULL, 'Games/Dreamtech/fourss.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(574, 11, 'inativo', 'casino', '3D Slot', 'casino', 'Slots', NULL, 'Games/Dreamtech/casino.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(575, 11, 'inativo', 'crazy5x243', 'Crazy GO GO GO', 'crazy5x243', 'Slots', NULL, 'Games/Dreamtech/crazy5x243.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(576, 11, 'inativo', 'rocknight', 'RocknRoll Night', 'rocknight', 'Slots', NULL, 'Games/Dreamtech/rocknight.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(577, 11, 'inativo', 'bluesea', 'Blue Sea', 'bluesea', 'Slots', NULL, 'Games/Dreamtech/bluesea.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(578, 11, 'inativo', 'circus', 'Crazy Circus', 'circus', 'Slots', NULL, 'Games/Dreamtech/circus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(579, 11, 'inativo', 'bikini', 'Bikini Party', 'bikini', 'Slots', NULL, 'Games/Dreamtech/bikini.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(580, 11, 'inativo', 'foryouth5x25', 'SO YOUNG', 'foryouth5x25', 'Slots', NULL, 'Games/Dreamtech/foryouth5x25.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(581, 11, 'inativo', 'fourbeauty', 'Four Beauties', 'fourbeauty', 'Slots', NULL, 'Games/Dreamtech/fourbeauty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(582, 11, 'inativo', 'sweethouse', 'Candy House', 'sweethouse', 'Slots', NULL, 'Games/Dreamtech/sweethouse.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(583, 11, 'inativo', 'legend5x25', 'Legend of the King', 'legend5x25', 'Slots', NULL, 'Games/Dreamtech/legend5x25.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(584, 11, 'inativo', 'opera', 'Beijing opera', 'opera', 'Slots', NULL, 'Games/Dreamtech/opera.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(585, 11, 'inativo', 'bigred', 'Big Red', 'bigred', 'Slots', NULL, 'Games/Dreamtech/bigred.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(586, 11, 'inativo', 'wrathofthor', 'Wrath of Thor', 'wrathofthor', 'Slots', NULL, 'Games/Dreamtech/wrathofthor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(587, 11, 'inativo', 'boxingarena', 'Boxing Arena', 'boxingarena', 'Slots', NULL, 'Games/Dreamtech/boxingarena.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(588, 11, 'inativo', 'fantasyforest', 'Elf Kingdom', 'fantasyforest', 'Slots', NULL, 'Games/Dreamtech/fantasyforest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(589, 11, 'inativo', 'egyptian', 'Egyptian Empire', 'egyptian', 'Slots', NULL, 'Games/Dreamtech/egyptian.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(590, 11, 'inativo', 'hotpotfeast', 'Hotpot Feast', 'hotpotfeast', 'Slots', NULL, 'Games/Dreamtech/hotpotfeast.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(591, 11, 'inativo', 'magician', 'Magician', 'magician', 'Slots', NULL, 'Games/Dreamtech/magician.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:49', '2025-04-14 18:56:49', 0),
(592, 11, 'inativo', 'galaxywars', 'Galaxy Wars', 'galaxywars', 'Slots', NULL, 'Games/Dreamtech/galaxywars.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(593, 11, 'inativo', 'easyrider', 'Easy Rider', 'easyrider', 'Slots', NULL, 'Games/Dreamtech/easyrider.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(594, 11, 'inativo', 'goldjade5x50', 'Jin Yu Man Tang', 'goldjade5x50', 'Slots', NULL, 'Games/Dreamtech/goldjade5x50.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(595, 11, 'inativo', 'shokudo', 'shokudo', 'shokudo', 'Slots', NULL, 'Games/Dreamtech/shokudo.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(596, 11, 'inativo', 'train', 'Treasure Hunt Trip', 'train', 'Slots', NULL, 'Games/Dreamtech/train.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(597, 11, 'inativo', 'lovefighters', 'Love Fighters', 'lovefighters', 'Slots', NULL, 'Games/Dreamtech/lovefighters.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(598, 11, 'inativo', 'genie', 'Aladdin s Wish', 'genie', 'Slots', NULL, 'Games/Dreamtech/genie.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:50', '2025-04-14 20:19:57', 0),
(599, 11, 'inativo', 'garden', 'Little Big Garden', 'garden', 'Slots', NULL, 'Games/Dreamtech/garden.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:50', '2025-04-14 20:19:59', 0),
(600, 11, 'inativo', 'alchemist', 'Crazy Alchemist', 'alchemist', 'Slots', NULL, 'Games/Dreamtech/alchemist.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:50', '2025-04-14 20:20:00', 0),
(601, 11, 'inativo', 'dinosaur5x25', 'Dinosaur World', 'dinosaur5x25', 'Slots', NULL, 'Games/Dreamtech/dinosaur5x25.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:50', '2025-04-14 20:20:01', 0),
(602, 11, 'inativo', 'tombshadow', 'Tomb Shadow', 'tombshadow', 'Slots', NULL, 'Games/Dreamtech/tombshadow.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:50', '2025-04-14 20:20:02', 0),
(603, 11, 'inativo', 'clash', 'Clash of Three kingdoms', 'clash', 'Slots', NULL, 'Games/Dreamtech/clash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(604, 11, 'inativo', 'magicbean', 'Magic Bean Legend', 'magicbean', 'Slots', NULL, 'Games/Dreamtech/magicbean.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:50', '2025-04-14 20:20:04', 0),
(605, 11, 'inativo', 'secretdate', 'Secret Date', 'secretdate', 'Slots', NULL, 'Games/Dreamtech/secretdate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(606, 11, 'inativo', 'bacteria', 'Germ Lab', 'bacteria', 'Slots', NULL, 'Games/Dreamtech/bacteria.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:50', '2025-04-14 20:20:05', 0),
(607, 11, 'inativo', 'baseball', 'Baseball Frenzy', 'baseball', 'Slots', NULL, 'Games/Dreamtech/baseball.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(608, 11, 'inativo', 'mysticalstones', 'Mystical Stones', 'mysticalstones', 'Slots', NULL, 'Games/Dreamtech/mysticalstones.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:50', '2025-04-14 20:20:07', 0),
(609, 11, 'inativo', 'sincity', 'Sin City', 'sincity', 'Slots', NULL, 'Games/Dreamtech/sincity.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(610, 11, 'inativo', 'wheel', 'Secrets of The Pentagram', 'wheel', 'Slots', NULL, 'Games/Dreamtech/wheel.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(611, 11, 'inativo', 'westwild', 'West Wild', 'westwild', 'Slots', NULL, 'Games/Dreamtech/westwild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:50', '2025-04-14 20:20:08', 0),
(612, 11, 'inativo', 'halloween', 'Witch Winnings', 'halloween', 'Slots', NULL, 'Games/Dreamtech/halloween.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(613, 11, 'inativo', 'bloodmoon', 'Blood Wolf legend', 'bloodmoon', 'Slots', NULL, 'Games/Dreamtech/bloodmoon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(614, 11, 'inativo', 'dragonball2', 'Heroes of the East', 'dragonball2', 'Slots', NULL, 'Games/Dreamtech/dragonball2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(615, 11, 'inativo', 'muaythai', 'Muaythai', 'muaythai', 'Slots', NULL, 'Games/Dreamtech/muaythai.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(616, 11, 'inativo', 'sailor', 'Sailor Princess', 'sailor', 'Slots', NULL, 'Games/Dreamtech/sailor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(617, 11, 'inativo', 'nightclub', 'Infinity Club', 'nightclub', 'Slots', NULL, 'Games/Dreamtech/nightclub.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(618, 11, 'inativo', 'nezha', 'Nezha Legend', 'nezha', 'Slots', NULL, 'Games/Dreamtech/nezha.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(619, 11, 'inativo', 'bird', 'Bird Island', 'bird', 'Slots', NULL, 'Games/Dreamtech/bird.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(620, 11, 'inativo', 'honor', 'Field Of Honor', 'honor', 'Slots', NULL, 'Games/Dreamtech/honor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(621, 11, 'inativo', 'train2', 'Treasure Hunt Trip 2', 'train2', 'Slots', NULL, 'Games/Dreamtech/train2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(622, 11, 'inativo', 'shiningstars', 'ShiningStars', 'shiningstars', 'Slots', NULL, 'Games/Dreamtech/shiningstars.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:50', '2025-04-14 18:56:50', 0),
(623, 11, 'inativo', 'tgow2plus', 'Cai Shen Dao Plus', 'tgow2plus', 'Slots', NULL, 'Games/Dreamtech/tgow2plus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:51', '2025-04-14 18:56:51', 0),
(624, 11, 'inativo', 'peeping', 'Peeping', 'peeping', 'Slots', NULL, 'Games/Dreamtech/peeping.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:56:51', '2025-04-14 20:19:56', 0),
(625, 21, 'inativo', 'vswayswwhex', 'Wild Wild Bananas', 'vswayswwhex', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayswwhex.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:51', '2025-04-14 18:58:18', 1),
(626, 21, 'inativo', 'vs25spgldways', 'Secret City Gold', 'vs25spgldways', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25spgldways.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:51', '2025-04-14 18:58:21', 1),
(627, 21, 'inativo', 'vswaysincwnd', 'Gold Oasis', 'vswaysincwnd', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysincwnd.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:51', '2025-04-14 18:58:16', 1),
(628, 21, 'inativo', 'vswaysftropics', 'Frozen Tropics', 'vswaysftropics', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysftropics.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:51', '2025-04-14 18:58:14', 1),
(629, 21, 'inativo', 'vs20superlanche', 'Monster Superlanche', 'vs20superlanche', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20superlanche.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:51', '2025-04-14 18:57:45', 1),
(630, 21, 'inativo', 'vs10fisheye', 'Fish Eye', 'vs10fisheye', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10fisheye.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:52', '2025-04-14 18:57:46', 1),
(631, 21, 'inativo', 'vs20mochimon', 'Mochimon', 'vs20mochimon', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mochimon.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:52', '2025-04-14 18:57:51', 1),
(632, 2, 'inativo', 'vs20gatotfury', 'Gatot Kaca s Fury', 'vs20gatotfury', 'Slots', NULL, 'Games/Pragmatic/vs20gatotfury.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:52', '2025-04-14 18:56:52', 0),
(633, 21, 'inativo', 'vs25archer', 'Fire Archer', 'vs25archer', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25archer.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:52', '2025-04-14 18:58:08', 1),
(634, 21, 'inativo', 'vs12tropicana', 'Club Tropicana', 'vs12tropicana', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs12tropicana.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:52', '2025-04-14 18:57:38', 1),
(635, 21, 'inativo', 'vs10powerlines', 'Peak Power', 'vs10powerlines', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10powerlines.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:52', '2025-04-14 18:58:11', 1),
(636, 21, 'inativo', 'vswaysmorient', 'Mystery of the Orient', 'vswaysmorient', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmorient.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:53', '2025-04-14 18:58:19', 1),
(637, 21, 'inativo', 'vs20goldclust', 'Rabbit Garden', 'vs20goldclust', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20goldclust.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:53', '2025-04-14 18:57:46', 1),
(638, 21, 'inativo', 'vs20sknights', 'The Knight King', 'vs20sknights', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20sknights.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:53', '2025-04-14 18:58:21', 1),
(639, 2, 'inativo', 'vs20framazon', 'Fruits of the Amazon', 'vs20framazon', 'Slots', NULL, 'Games/Pragmatic/vs20framazon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:53', '2025-04-14 18:56:53', 0),
(640, 21, 'inativo', 'vswaysredqueen', 'The Red Queen', 'vswaysredqueen', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysredqueen.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:53', '2025-04-14 18:58:21', 1),
(641, 2, 'inativo', 'vs1024moonsh', 'Moonshot', 'vs1024moonsh', 'Slots', NULL, 'Games/Pragmatic/vs1024moonsh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:53', '2025-04-14 18:56:53', 0),
(642, 21, 'inativo', 'vs10bbhas', 'Big Bass - Hold & Spinner', 'vs10bbhas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbhas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:53', '2025-04-14 18:57:34', 1),
(643, 21, 'inativo', 'vs20hotzone', 'African Elephant', 'vs20hotzone', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20hotzone.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:53', '2025-04-14 18:58:27', 1),
(644, 21, 'inativo', 'vswaysmonkey', '3 Dancing Monkeys', 'vswaysmonkey', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmonkey.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:54', '2025-04-14 18:57:47', 1),
(645, 21, 'inativo', 'vswaysrsm', 'Wild Celebrity Bus Megaways', 'vswaysrsm', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysrsm.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:54', '2025-04-14 18:57:55', 1),
(646, 21, 'inativo', 'vs10gizagods', 'Gods of Giza', 'vs10gizagods', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10gizagods.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:54', '2025-04-14 18:58:10', 1),
(647, 21, 'inativo', 'vswaysultrcoin', 'Cowboy Coins', 'vswaysultrcoin', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysultrcoin.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:54', '2025-04-14 18:58:04', 1),
(648, 21, 'inativo', 'vs10kingofdth', 'Kingdom of the Dead', 'vs10kingofdth', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10kingofdth.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:54', '2025-04-14 18:58:18', 1),
(649, 21, 'inativo', 'vs20mvwild', 'Jasmine Dreams', 'vs20mvwild', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mvwild.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:54', '2025-04-14 18:58:25', 1),
(650, 2, 'inativo', 'vs25holiday', 'Holiday Ride', 'vs25holiday', 'Slots', NULL, 'Games/Pragmatic/vs25holiday.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:54', '2025-04-14 18:56:54', 0),
(651, 21, 'inativo', 'vs20stickywild', 'Wild Bison Charge', 'vs20stickywild', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20stickywild.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:54', '2025-04-14 18:57:52', 1),
(652, 21, 'inativo', 'vs20excalibur', 'Excalibur Unleashed', 'vs20excalibur', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20excalibur.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:55', '2025-04-14 18:58:07', 1),
(653, 21, 'inativo', 'vs25spotz', 'Knight Hot Spotz', 'vs25spotz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25spotz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:55', '2025-04-14 18:57:57', 1),
(654, 21, 'inativo', 'vs20clustwild', 'Sticky Bees', 'vs20clustwild', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20clustwild.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:55', '2025-04-14 18:57:58', 1),
(655, 21, 'inativo', 'vs10fdrasbf', 'Floating Dragon - Dragon Boat Festival', 'vs10fdrasbf', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10fdrasbf.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:55', '2025-04-14 18:57:47', 1),
(656, 2, 'inativo', 'vs4096robber', 'Robber Strike', 'vs4096robber', 'Slots', NULL, 'Games/Pragmatic/vs4096robber.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:55', '2025-04-14 18:56:55', 0),
(657, 21, 'inativo', 'vs20lampinf', 'Lamp Of Infinity', 'vs20lampinf', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20lampinf.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:55', '2025-04-14 18:57:57', 1),
(658, 2, 'inativo', 'vswaysfrbugs', 'Frogs e Bugs', 'vswaysfrbugs', 'Slots', NULL, 'Games/Pragmatic/vswaysfrbugs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:55', '2025-04-14 18:56:55', 0);
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `original`) VALUES
(659, 21, 'inativo', 'vs9outlaw', 'Pirates Pub', 'vs9outlaw', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs9outlaw.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:55', '2025-04-14 18:57:48', 1),
(660, 21, 'inativo', 'vs20jewelparty', 'Jewel Rush', 'vs20jewelparty', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20jewelparty.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:55', '2025-04-14 18:57:52', 1),
(661, 21, 'inativo', 'vs20beefed', 'Fat Panda', 'vs20beefed', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20beefed.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:56', '2025-04-14 18:58:08', 1),
(662, 21, 'inativo', 'vs20hstgldngt', 'Heist for the Golden Nuggets', 'vs20hstgldngt', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20hstgldngt.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:56', '2025-04-14 18:58:00', 1),
(663, 2, 'inativo', 'vs25jokrace', 'Joker Race', 'vs25jokrace', 'Slots', NULL, 'Games/Pragmatic/vs25jokrace.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:56', '2025-04-14 18:56:56', 0),
(664, 21, 'inativo', 'vs243nudge4gold', 'Hellvis Wild', 'vs243nudge4gold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243nudge4gold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:56', '2025-04-14 18:58:18', 1),
(665, 21, 'inativo', 'vs50jucier', 'Sky Bounty', 'vs50jucier', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50jucier.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:56', '2025-04-14 18:57:45', 1),
(666, 21, 'inativo', 'vs20cashmachine', 'Cash Box', 'vs20cashmachine', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20cashmachine.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:56', '2025-04-14 18:57:57', 1),
(667, 21, 'inativo', 'vs20splmystery', 'Spellbinding Mystery', 'vs20splmystery', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20splmystery.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:56', '2025-04-14 18:58:15', 1),
(668, 21, 'inativo', 'vs20doghousemh', 'The Dog House Multihold', 'vs20doghousemh', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20doghousemh.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:56', '2025-04-14 18:57:39', 1),
(669, 21, 'inativo', 'vs20wildparty', '3 Buzzing Wilds', 'vs20wildparty', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20wildparty.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:56', '2025-04-14 18:57:43', 1),
(670, 21, 'inativo', 'vs20lobcrab', 'Lobster Bob\'s Crazy Crab Shack', 'vs20lobcrab', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20lobcrab.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:57', '2025-04-14 18:58:26', 1),
(671, 2, 'inativo', 'vs20supermania', 'Supermania', 'vs20supermania', 'Slots', NULL, 'Games/Pragmatic/vs20supermania.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:57', '2025-04-14 18:56:57', 0),
(672, 21, 'inativo', 'vs10trail', 'Mustang Trail', 'vs10trail', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10trail.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:57', '2025-04-14 18:57:55', 1),
(673, 21, 'inativo', 'vs20lvlup', 'Pub Kings', 'vs20lvlup', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20lvlup.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:57', '2025-04-14 18:58:21', 1),
(674, 2, 'inativo', 'vs20saiman', 'Saiyan Mania', 'vs20saiman', 'Slots', NULL, 'Games/Pragmatic/vs20saiman.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:57', '2025-04-14 18:56:57', 0),
(675, 21, 'inativo', 'vs20earthquake', 'Cyclops Smash', 'vs20earthquake', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20earthquake.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:57', '2025-04-14 18:58:26', 1),
(676, 21, 'inativo', 'vswaysbbhas', 'Big Bass Hold & Spinner Megaways', 'vswaysbbhas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysbbhas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:58', '2025-04-14 18:57:43', 1),
(677, 21, 'inativo', 'vs20forge', 'Forge of Olympus', 'vs20forge', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20forge.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:58', '2025-04-14 18:57:43', 1),
(678, 21, 'inativo', 'vs20procount', 'Wisdom of Athena', 'vs20procount', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20procount.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:58', '2025-04-14 18:57:36', 1),
(679, 2, 'inativo', 'vs1024mahjwins', 'Mahjong Wins', 'vs1024mahjwins', 'Slots', NULL, 'Games/Pragmatic/vs1024mahjwins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:58', '2025-04-14 18:56:58', 0),
(680, 21, 'inativo', 'vs20maskgame', 'Cash Chips', 'vs20maskgame', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20maskgame.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:58', '2025-04-14 18:58:04', 1),
(681, 21, 'inativo', 'vswaysraghex', 'Tundra\'s Fortune', 'vswaysraghex', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysraghex.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:58', '2025-04-14 18:58:25', 1),
(682, 21, 'inativo', 'vs10bhallbnza', 'Big Bass Halloween', 'vs10bhallbnza', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bhallbnza.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:59', '2025-04-14 18:57:34', 1),
(683, 21, 'inativo', 'vs40rainbowr', 'Rainbow Reels', 'vs40rainbowr', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40rainbowr.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:59', '2025-04-14 18:58:02', 1),
(684, 21, 'inativo', 'vs20gravity', 'Gravity Bonanza', 'vs20gravity', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20gravity.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:59', '2025-04-14 18:58:18', 1),
(685, 21, 'inativo', 'vs40infwild', 'Infective Wild', 'vs40infwild', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40infwild.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:59', '2025-04-14 18:58:01', 1),
(686, 21, 'inativo', 'vs20swordofares', 'Sword of Ares', 'vs20swordofares', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20swordofares.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:59', '2025-04-14 18:57:59', 1),
(687, 21, 'inativo', 'vswaysfrywld', 'Spin & Score Megaways', 'vswaysfrywld', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysfrywld.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:59', '2025-04-14 18:58:14', 1),
(688, 21, 'inativo', 'vswaysconcoll', 'Firebird Spirit - Connect & Collect', 'vswaysconcoll', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysconcoll.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:59', '2025-04-14 18:58:34', 1),
(689, 21, 'inativo', 'vs20lcount', 'Gems of Serengeti', 'vs20lcount', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20lcount.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:59', '2025-04-14 18:58:29', 1),
(690, 21, 'inativo', 'vs20sparta', 'Shield Of Sparta', 'vs20sparta', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20sparta.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:56:59', '2025-04-14 18:57:59', 1),
(691, 21, 'inativo', 'vs10bbkir', 'Big Bass Bonanza - Keeping it Reel', 'vs10bbkir', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbkir.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:00', '2025-04-14 18:57:38', 1),
(692, 21, 'inativo', 'vswayspizza', 'PIZZA PIZZA PIZZA', 'vswayspizza', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayspizza.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:00', '2025-04-14 18:57:41', 1),
(693, 21, 'inativo', 'vs20dugems', 'Hot Pepper', 'vs20dugems', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20dugems.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:00', '2025-04-14 18:57:48', 1),
(694, 21, 'inativo', 'vs20clspwrndg', 'Sweet Powernudge', 'vs20clspwrndg', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20clspwrndg.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:00', '2025-04-14 18:57:57', 1),
(695, 21, 'inativo', 'vswaysfuryodin', 'Fury of Odin Megaways', 'vswaysfuryodin', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysfuryodin.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:00', '2025-04-14 18:57:58', 1),
(696, 21, 'inativo', 'vs20sugarcoins', 'Viking Forge', 'vs20sugarcoins', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20sugarcoins.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:00', '2025-04-14 18:57:50', 1),
(697, 2, 'inativo', 'vs20olympgrace', 'Grace of Ebisu', 'vs20olympgrace', 'Slots', NULL, 'Games/Pragmatic/vs20olympgrace.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:00', '2025-04-14 18:57:00', 0),
(698, 21, 'inativo', 'vs20starlightx', 'Starlight Princess 1000', 'vs20starlightx', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20starlightx.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:00', '2025-04-14 18:57:30', 1),
(699, 21, 'inativo', 'vswaysmoneyman', 'The Money Men Megaways', 'vswaysmoneyman', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmoneyman.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:01', '2025-04-14 18:57:58', 1),
(700, 21, 'inativo', 'vs40demonpots', 'Demon Pots', 'vs40demonpots', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40demonpots.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:01', '2025-04-14 18:58:16', 1),
(701, 21, 'inativo', 'vswaystut', 'Book of Tut Megaways', 'vswaystut', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaystut.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:01', '2025-04-14 18:57:48', 1),
(702, 21, 'inativo', 'vs10gdchalleng', '8 Golden Dragon Challenge', 'vs10gdchalleng', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10gdchalleng.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:01', '2025-04-14 18:58:11', 1),
(703, 2, 'inativo', 'vs20yisunshin', 'Yi Sun Shin', 'vs20yisunshin', 'Slots', NULL, 'Games/Pragmatic/vs20yisunshin.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:02', '2025-04-14 18:57:02', 0),
(704, 21, 'inativo', 'vs20candyblitz', 'Candy Blitz', 'vs20candyblitz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20candyblitz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:02', '2025-04-14 18:57:45', 1),
(705, 21, 'inativo', 'vswaysstrlght', 'Fortunes of Aztec', 'vswaysstrlght', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysstrlght.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:02', '2025-04-14 18:57:57', 1),
(706, 4, 'inativo', '12547', 'Atlantis', '12547', 'Crash', NULL, 'Games/Galaxsys/Atlantis.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:02', '2025-04-14 21:54:16', 1),
(707, 4, 'inativo', '12544', 'Bingo Star', '12544', 'Crash', NULL, 'Games/Galaxsys/Bingo-Star.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:02', '2025-04-14 18:57:02', 1),
(708, 4, 'inativo', '12542', 'Maestro', '12542', 'Crash', NULL, 'Games/Galaxsys/Maestro.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:02', '2025-04-14 21:54:05', 1),
(709, 4, 'inativo', '12540', 'Turbo Mines', '12540', 'Crash', NULL, 'Games/Galaxsys/Turbo-Mines.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:02', '2025-04-14 20:32:25', 1),
(710, 4, 'inativo', '12537', 'Totem', '12537', 'Crash', NULL, 'Games/Galaxsys/Totem.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:02', '2025-04-14 18:57:02', 1),
(711, 4, 'inativo', '12536', 'Magic Dice', '12536', 'Crash', NULL, 'Games/Galaxsys/Magic-Dice.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:02', '2025-04-14 18:57:02', 1),
(712, 4, 'inativo', '12533', 'Scratch Map', '12533', 'Crash', NULL, 'Games/Galaxsys/Scratch-Map.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:57:02', '2025-04-14 21:57:46', 1),
(713, 4, 'inativo', '12532', 'Coin Flip', '12532', 'Crash', NULL, 'Games/Galaxsys/Coin-Flip.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:02', '2025-04-14 20:32:57', 1),
(714, 4, 'inativo', '12530', 'Roulette X', '12530', 'Crash', NULL, 'Games/Galaxsys/Roulette-X.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:57:02', '2025-07-23 03:03:28', 1),
(715, 4, 'inativo', '12528', 'Plinkoman', '12528', 'Crash', NULL, 'Games/Galaxsys/Plinkoman.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:57:02', '2025-06-29 09:32:59', 1),
(716, 4, 'inativo', '12526', 'Ninja Crash', '12526', 'Crash', NULL, 'Games/Galaxsys/Ninja-Crash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:02', '2025-04-14 21:54:10', 1),
(717, 4, 'inativo', '12524', 'Mr.Thimble', '12524', 'Crash', NULL, 'Games/Galaxsys/Mr.Thimble.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2025-04-14 18:57:02', '2025-07-30 10:44:48', 1),
(718, 4, 'inativo', '12523', 'Jungle Wheel', '12523', 'Crash', NULL, 'Games/Galaxsys/Jungle-Wheel.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:03', '2025-04-14 18:57:03', 1),
(719, 4, 'inativo', '12522', 'Jungle Wheel', '12522', 'Crash', NULL, 'Games/Galaxsys/Jungle-Wheel.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:03', '2025-04-14 18:57:03', 1),
(720, 4, 'inativo', '12520', 'GoldenRA', '12520', 'Crash', NULL, 'Games/Galaxsys/GoldenRA.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:03', '2025-04-14 18:57:03', 1),
(721, 4, 'inativo', '12518', 'F Mines', '12518', 'Crash', NULL, 'Games/Galaxsys/F-Mines.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:03', '2025-04-14 20:32:53', 1),
(722, 4, 'inativo', '12516', 'Crasher', '12516', 'Crash', NULL, 'Games/Galaxsys/Crasher.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:57:03', '2025-07-25 10:26:56', 1),
(723, 4, 'inativo', '12515', 'Cash Show', '12515', 'Crash', NULL, 'Games/Galaxsys/Cash-Show.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:03', '2025-04-14 20:32:47', 1),
(724, 4, 'inativo', '12502', 'SicBo', '12502', 'Crash', NULL, 'Games/Galaxsys/SicBo.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:03', '2025-04-14 18:57:03', 1),
(725, 4, 'inativo', '12501', 'Rocketon', '12501', 'Crash', NULL, 'Games/Galaxsys/Rocketon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:57:04', '2025-06-30 16:46:15', 1),
(726, 4, 'inativo', '12500', 'Penalty', '12500', 'Crash', NULL, 'Games/Galaxsys/Penalty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:04', '2025-04-14 18:57:04', 1),
(727, 4, 'inativo', '12499', 'Keno Express', '12499', 'Crash', NULL, 'Games/Galaxsys/Keno-Express.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:04', '2025-04-14 18:57:04', 1),
(728, 4, 'inativo', '12510', 'Keno 8 (2 Minute)', '12510', 'Crash', NULL, 'Games/Galaxsys/Keno82Minute.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:04', '2025-04-14 18:57:04', 1),
(729, 4, 'inativo', '12509', 'Keno 8 (1 Minute)', '12509', 'Crash', NULL, 'Games/Galaxsys/Keno81Minute.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:04', '2025-04-14 18:57:04', 1),
(730, 4, 'inativo', '12508', 'Keno 10 (2 Minute)', '12508', 'Crash', NULL, 'Games/Galaxsys/Keno102Minute.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:04', '2025-04-14 18:57:04', 1),
(731, 4, 'inativo', '12507', 'Keno 10 (1 Minute)', '12507', 'Crash', NULL, 'Games/Galaxsys/Keno101Minute.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:05', '2025-04-14 18:57:05', 1),
(732, 4, 'inativo', '12494', 'Hilo', '12494', 'Crash', NULL, 'Games/Galaxsys/Hilo.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:05', '2025-04-14 20:32:39', 1),
(733, 4, 'inativo', '12493', 'Crash', '12493', 'Crash', NULL, 'Games/Galaxsys/Crash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:57:05', '2025-07-18 13:46:10', 1),
(734, 4, 'inativo', '12492', 'BlackJack', '12492', 'Crash', NULL, 'Games/Galaxsys/BlackJack.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:05', '2025-04-14 18:57:05', 1),
(735, 5, 'inativo', '30', 'Power Stars', '30', 'Slots', NULL, 'Games/Novomatic/Power-Stars.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:57:05', '2025-06-30 17:14:02', 1),
(736, 5, 'inativo', '3218', 'Queen of Hearts Deluxe', '3218', 'Slots', NULL, 'Games/Novomatic/Queen-of-Hearts-Deluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:05', '2025-04-14 20:43:27', 1),
(737, 5, 'inativo', '374', 'Red Lady', '374', 'Slots', NULL, 'Games/Novomatic/Red-Lady.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:06', '2025-04-14 18:57:06', 1),
(738, 5, 'inativo', '4571', 'River Queen', '4571', 'Slots', NULL, 'Games/Novomatic/River-Queen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:06', '2025-04-14 20:43:26', 1),
(739, 5, 'inativo', '3210', 'Roaring Forties', '3210', 'Slots', NULL, 'Games/Novomatic/Roaring-Forties.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:57:06', '2025-08-01 12:49:23', 1),
(740, 5, 'inativo', '3211', 'Roaring Wilds', '3211', 'Slots', NULL, 'Games/Novomatic/Roaring-Wilds.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:06', '2025-04-14 18:57:06', 1),
(741, 5, 'inativo', '6657', 'Royal Dynasty', '6657', 'Slots', NULL, 'Games/Novomatic/Royal-Dynasty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:06', '2025-04-14 20:43:21', 1),
(742, 5, 'inativo', '475', 'Royal Treasure', '475', 'Slots', NULL, 'Games/Novomatic/Royal-Treasure.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:06', '2025-04-14 18:57:06', 1),
(743, 5, 'inativo', '6878', 'Secret Treasure', '6878', 'Slots', NULL, 'Games/Novomatic/Secret-Treasure.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:07', '2025-04-14 18:57:07', 1),
(744, 5, 'inativo', '3149', 'Sizzling 6', '3149', 'Slots', NULL, 'Games/Novomatic/Sizzling-6.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:07', '2025-04-14 20:43:19', 1),
(745, 5, 'inativo', '3158', 'Supra Hot', '3158', 'Slots', NULL, 'Games/Novomatic/Supra-Hot.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:07', '2025-04-14 18:57:07', 1),
(746, 5, 'inativo', '547', 'The Money Game', '547', 'Slots', NULL, 'Games/Novomatic/The-Money-Game.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:07', '2025-04-14 20:43:16', 1),
(747, 5, 'inativo', '6872', 'Totally Wild', '6872', 'Slots', NULL, 'Games/Novomatic/Totally-Wild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:07', '2025-04-14 18:57:07', 1),
(748, 5, 'inativo', '6990', 'Ultra Hot Deluxe', '6990', 'Slots', NULL, 'Games/Novomatic/Ultra-Hot-Deluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:07', '2025-04-14 20:43:15', 1),
(749, 5, 'inativo', '549', 'Unicorn Magic', '549', 'Slots', NULL, 'Games/Novomatic/Unicorn-Magic.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:07', '2025-04-14 20:43:14', 1),
(750, 5, 'inativo', '4628', 'Wild Country', '4628', 'Slots', NULL, 'Games/Novomatic/Wild-Country.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:08', '2025-04-14 20:43:13', 1),
(751, 5, 'inativo', '90', 'Xtra Hot', '90', 'Slots', NULL, 'Games/Novomatic/Xtra-Hot.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:08', '2025-04-14 18:57:08', 1),
(752, 6, 'inativo', '3204', 'Silver Fang', '3204', 'Slots', NULL, 'Games/Microgaming/Silver-Fang.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:08', '2025-04-14 18:57:08', 1),
(753, 6, 'inativo', '3203', 'Thunder Struck', '3203', 'Slots', NULL, 'Games/Microgaming/Thunder-Struck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:08', '2025-04-14 18:57:08', 1),
(754, 6, 'inativo', '3202', 'Immortal Romance', '3202', 'Slots', NULL, 'Games/Microgaming/Immortal-Romance.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:08', '2025-04-14 18:57:08', 1),
(755, 6, 'inativo', '3201', 'Game Of Thrones', '3201', 'Slots', NULL, 'Games/Microgaming/Game-Of-Thrones.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:08', '2025-04-14 18:57:08', 1),
(756, 6, 'inativo', '4210', 'Burning Desire', '4210', 'Slots', NULL, 'Games/Microgaming/Burning-Desire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:08', '2025-04-14 18:57:08', 1),
(757, 6, 'inativo', '4209', 'Alaskan Fishing', '4209', 'Slots', NULL, 'Games/Microgaming/Alaskan-Fishing.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:08', '2025-04-14 18:57:08', 1),
(758, 6, 'inativo', '4208', 'Agent Jane Blonde', '4208', 'Slots', NULL, 'Games/Microgaming/Agent-Jane-Blonde.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:09', '2025-04-14 18:57:09', 1),
(759, 6, 'inativo', '4191', 'Tomb Raider', '4191', 'Slots', NULL, 'Games/Microgaming/Tomb-Raider.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:57:09', '2025-06-29 23:36:41', 1),
(760, 6, 'inativo', '4190', 'Deck the Halls', '4190', 'Slots', NULL, 'Games/Microgaming/Deck-the-Halls.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:09', '2025-04-14 18:57:09', 1),
(761, 6, 'inativo', '4240', 'Six Acrobats', '4240', 'Slots', NULL, 'Games/Microgaming/Six-Acrobats.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:09', '2025-04-14 18:57:09', 1),
(762, 6, 'inativo', '4239', 'Beautiful Bones', '4239', 'Slots', NULL, 'Games/Microgaming/Beautiful-Bones.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:09', '2025-04-14 18:57:09', 1),
(763, 6, 'inativo', '4218', 'Monster Wheels', '4218', 'Slots', NULL, 'Games/Microgaming/Monster-Wheels.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:10', '2025-04-14 20:35:08', 1),
(764, 6, 'inativo', '4260', 'Mermaids Millions', '4260', 'Slots', NULL, 'Games/Microgaming/Mermaids-Millions.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:10', '2025-04-14 18:57:10', 1),
(765, 6, 'inativo', '4264', 'King Tusk', '4264', 'Slots', NULL, 'Games/Microgaming/King-Tusk.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:10', '2025-04-14 18:57:10', 1),
(766, 6, 'inativo', '4263', 'Secret Romance', '4263', 'Slots', NULL, 'Games/Microgaming/Secret-Romance.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:10', '2025-04-14 20:35:07', 1),
(767, 6, 'inativo', '4275', 'High Lander', '4275', 'Slots', NULL, 'Games/Microgaming/High-Lander.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:10', '2025-04-14 18:57:10', 1),
(768, 6, 'inativo', '4273', 'Cool Wolf', '4273', 'Slots', NULL, 'Games/Microgaming/Cool-Wolf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:10', '2025-04-14 20:35:05', 1),
(769, 6, 'inativo', '6712', 'Break Away', '6712', 'Slots', NULL, 'Games/Microgaming/Break-Away.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:10', '2025-04-14 18:57:10', 1),
(770, 6, 'inativo', '6905', 'Ancient Fortunes Zeus', '6905', 'Slots', NULL, 'Games/Microgaming/Ancient-Fortunes-Zeus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 8, 0, 1, '2025-04-14 18:57:10', '2025-08-10 02:55:56', 1),
(771, 6, 'inativo', '6904', 'Tarzan Jewels of Opar', '6904', 'Slots', NULL, 'Games/Microgaming/Tarzan-Jewels-of-Opar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:11', '2025-04-14 20:35:01', 1),
(772, 6, 'inativo', '6903', 'Emperor of the Sea', '6903', 'Slots', NULL, 'Games/Microgaming/Emperor-of-the-Sea.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:11', '2025-04-14 20:35:00', 1),
(773, 6, 'inativo', '6937', 'Age Of Conquest', '6937', 'Slots', NULL, 'Games/Microgaming/Age-Of-Conquest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:11', '2025-04-14 18:57:11', 1),
(774, 6, 'inativo', '7000', 'Avalon', '7000', 'Slots', NULL, 'Games/Microgaming/Avalon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:11', '2025-04-14 20:34:59', 1),
(775, 6, 'inativo', '6999', 'Titans of the Sun Theia', '6999', 'Slots', NULL, 'Games/Microgaming/Titans-of-the-Sun-Theia.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:11', '2025-04-14 20:34:57', 1),
(776, 6, 'inativo', '7049', '9 Masks of Fire', '7049', 'Slots', NULL, 'Games/Microgaming/9-Masks-of-Fire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:12', '2025-04-14 18:57:12', 1),
(777, 6, 'inativo', '7057', '9 Pots of Gold', '7057', 'Slots', NULL, 'Games/Microgaming/9-Pots-of-Gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:12', '2025-04-14 18:57:12', 1),
(778, 6, 'inativo', '7708', 'Assassin Moon', '7708', 'Slots', NULL, 'Games/Microgaming/Assassin-Moon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:12', '2025-04-14 20:34:55', 1),
(779, 7, 'inativo', '6789', 'Hot Hot Fruit', '6789', 'Slots', NULL, 'Games/Habanero/Hot-Hot-Fruit.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:12', '2025-04-14 18:57:12', 1),
(780, 7, 'inativo', '6811', 'Nuwa', '6811', 'Slots', NULL, 'Games/Habanero/Nuwa.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:12', '2025-04-14 18:57:12', 1),
(781, 7, 'inativo', '6893', 'Hot Hot Halloween', '6893', 'Slots', NULL, 'Games/Habanero/Hot-Hot-Halloween.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:12', '2025-04-14 18:57:12', 1),
(782, 7, 'inativo', '6933', 'Happy Ape', '6933', 'Slots', NULL, 'Games/Habanero/Happy-Ape.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:13', '2025-04-14 18:57:13', 1),
(783, 7, 'inativo', '6932', 'Panda Panda', '6932', 'Slots', NULL, 'Games/Habanero/Panda-Panda.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:13', '2025-04-14 18:57:13', 1),
(784, 7, 'inativo', '6931', 'Lucky Fortune Cat', '6931', 'Slots', NULL, 'Games/Habanero/Lucky-Fortune-Cat.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:13', '2025-04-14 18:57:13', 1),
(785, 21, 'inativo', 'vs50dmdcascade', 'Diamond Cascade', 'vs50dmdcascade', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50dmdcascade.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:13', '2025-04-14 18:58:24', 1),
(786, 21, 'inativo', 'vs20piggybank', 'Piggy Bankers', 'vs20piggybank', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20piggybank.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:13', '2025-04-14 18:58:13', 1),
(787, 2, 'inativo', 'vs20bnnzdice', 'Sweet Bonanza Dice', 'vs20bnnzdice', 'Slots', NULL, 'Games/Pragmatic/vs20bnnzdice.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:13', '2025-04-14 18:57:13', 0),
(788, 2, 'inativo', 'vs5gemstone', 'Gemstone', 'vs5gemstone', 'Slots', NULL, 'Games/Pragmatic/vs5gemstone.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2025-04-14 18:57:14', '2025-08-04 14:41:42', 0),
(789, 17, 'inativo', '8891', 'JETX', '8891', 'Crash', NULL, 'Games/jetx/8891.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:14', '2025-04-14 21:54:49', 1),
(790, 17, 'inativo', '8892', 'JETX3', '8892', 'Crash', NULL, 'Games/jetx/8892.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:57:14', '2025-09-04 23:42:26', 1),
(791, 3, 'inativo', '11672', 'GOAL', '11672', 'Crash', NULL, 'Games/Spribe/11672.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 13, 0, 1, '2025-04-14 18:57:14', '2025-09-07 03:13:18', 1),
(792, 3, 'inativo', '11678', 'HOTLINE', '11678', 'Crash', NULL, 'Games/Spribe/11678.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:14', '2025-04-14 20:47:44', 1),
(793, 3, 'inativo', '11677', 'MINI ROULETTE', '11677', 'Crash', NULL, 'Games/Spribe/11677.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2025-04-14 18:57:14', '2025-08-06 12:48:50', 1),
(794, 3, 'inativo', '11671', 'DICE', '11671', 'Crash', NULL, 'Games/Spribe/11671.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2025-04-14 18:57:14', '2025-08-07 03:55:10', 1),
(795, 3, 'inativo', '11675', 'HILO', '11675', 'Crash', NULL, 'Games/Spribe/11675.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:14', '2025-04-14 20:47:46', 1),
(796, 3, 'inativo', '11673', 'PLINKO', '11673', 'Crash', NULL, 'Games/Spribe/11673.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:14', '2025-04-14 20:47:48', 1),
(797, 21, 'inativo', 'vs10dyndigd', 'Dynamite Diggin Doug', 'vs10dyndigd', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10dyndigd.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:14', '2025-04-14 18:58:10', 1),
(798, 21, 'inativo', 'vs10jokerhot', 'Joker\'s Jewels Hot', 'vs10jokerhot', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10jokerhot.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:15', '2025-04-14 18:57:40', 1),
(799, 21, 'inativo', 'vs20jhunter', 'Jackpot Hunter', 'vs20jhunter', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20jhunter.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:15', '2025-04-14 18:58:10', 1),
(800, 21, 'inativo', 'vs20gembondx', 'Bow of Artemis', 'vs20gembondx', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20gembondx.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:15', '2025-04-14 18:57:52', 1),
(801, 21, 'inativo', 'vs20bblitz', 'Money Stacks', 'vs20bblitz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20bblitz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:15', '2025-04-14 18:57:44', 1),
(802, 21, 'inativo', 'vs10bbsplxmas', 'Big Bass Christmas Bash', 'vs10bbsplxmas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbsplxmas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:15', '2025-04-14 18:57:36', 1),
(803, 21, 'inativo', 'vs10dgold88', 'Dragon Gold 88', 'vs10dgold88', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10dgold88.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:15', '2025-04-14 18:57:55', 1),
(804, 21, 'inativo', 'vswayscashconv', 'Running Sushi', 'vswayscashconv', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayscashconv.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:15', '2025-04-14 18:57:59', 1),
(805, 21, 'inativo', 'vs20mesmult', 'Yeti Quest', 'vs20mesmult', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mesmult.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:15', '2025-04-14 18:58:00', 1),
(806, 21, 'inativo', 'vs15godsofwar', 'Zeus vs Hades - Gods of War', 'vs15godsofwar', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs15godsofwar.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:15', '2025-04-14 18:57:31', 1),
(807, 21, 'inativo', 'vswaysjapan', 'Starlight Princess Pachi', 'vswaysjapan', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysjapan.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:16', '2025-04-14 18:57:53', 1),
(808, 2, 'inativo', 'vs20riverstx', 'River of Styx', 'vs20riverstx', 'Slots', NULL, 'Games/Pragmatic/vs20riverstx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:16', '2025-04-14 18:57:16', 0),
(809, 2, 'inativo', 'vs15thundunder', 'Thunder vs Underworld', 'vs15thundunder', 'Slots', NULL, 'Games/Pragmatic/vs15thundunder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:16', '2025-04-14 18:57:16', 0),
(810, 2, 'inativo', 'vswaysmahwblck', 'Mahjong Wins 3 - Black Scatter', 'vswaysmahwblck', 'Slots', NULL, 'Games/Pragmatic/vswaysmahwblck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:16', '2025-04-14 18:57:16', 0),
(811, 1, 'inativo', 'lucky-neko', 'Lucky Neko', 'lucky-neko', 'Slots', NULL, 'Games/Pgsoft/lucky-neko.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:57:16', '2025-07-05 02:54:50', 0),
(812, 1, 'inativo', 'wild-bounty-sd', 'Wild Bounty Showdown', 'wild-bounty-sd', 'Slots', NULL, 'Games/Pgsoft/wild-bounty-sd.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:16', '2025-04-14 18:57:16', 0),
(813, 21, 'inativo', 'vs10bbbnz', 'Big Bass Day at the Races', 'vs10bbbnz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbbnz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:16', '2025-04-14 18:57:40', 1),
(814, 21, 'inativo', 'vs10bbextreme', 'Big Bass Amazon Xtreme', 'vs10bbextreme', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbextreme.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:16', '2025-04-14 18:57:35', 1),
(815, 21, 'inativo', 'vs10ddcbells', 'Ding Dong Christmas Bells', 'vs10ddcbells', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10ddcbells.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:17', '2025-04-14 18:58:18', 1),
(816, 2, 'inativo', 'vs15pvss', 'Puffers vs Sharks', 'vs15pvss', 'Slots', NULL, 'Games/Pragmatic/vs15pvss.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:17', '2025-04-14 18:57:17', 0),
(817, 2, 'inativo', 'vs15samurai4', 'Rise of Samurai 4', 'vs15samurai4', 'Slots', NULL, 'Games/Pragmatic/vs15samurai4.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:17', '2025-04-14 18:57:17', 0),
(818, 2, 'inativo', 'vs15seoultrain', 'Train to Seoul', 'vs15seoultrain', 'Slots', NULL, 'Games/Pragmatic/vs15seoultrain.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:17', '2025-04-14 18:57:17', 0),
(819, 2, 'inativo', 'vs20cbrhst', 'Cyber Heist', 'vs20cbrhst', 'Slots', NULL, 'Games/Pragmatic/vs20cbrhst.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:17', '2025-04-14 18:57:17', 0),
(820, 21, 'inativo', 'vs20ekingrr', 'Emerald King Rainbow Road', 'vs20ekingrr', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20ekingrr.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:17', '2025-04-14 18:58:06', 1),
(821, 2, 'inativo', 'vs20fruitjpas', 'Jajanan Pasar', 'vs20fruitjpas', 'Slots', NULL, 'Games/Pragmatic/vs20fruitjpas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:17', '2025-04-14 18:57:17', 0),
(822, 2, 'inativo', 'vs20leogatex', 'Gates of LeoVegas 1000', 'vs20leogatex', 'Slots', NULL, 'Games/Pragmatic/vs20leogatex.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 15, 0, 0, '2025-04-14 18:57:18', '2025-07-12 13:16:39', 0),
(823, 2, 'inativo', 'vs20mahjxbnz', 'Mahjong X', 'vs20mahjxbnz', 'Slots', NULL, 'Games/Pragmatic/vs20mahjxbnz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:18', '2025-04-14 18:57:18', 0),
(824, 21, 'inativo', 'vs20mammoth', 'Mammoth Gold Megaways', 'vs20mammoth', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mammoth.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:18', '2025-04-14 18:57:50', 1),
(825, 2, 'inativo', 'vs20ninjapower', 'Power of Ninja', 'vs20ninjapower', 'Slots', NULL, 'Games/Pragmatic/vs20ninjapower.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:57:18', '2025-08-05 15:59:24', 0),
(826, 2, 'inativo', 'vs20olygames', 'Games in Olympus', 'vs20olygames', 'Slots', NULL, 'Games/Pragmatic/vs20olygames.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:18', '2025-04-14 18:57:18', 0),
(827, 2, 'inativo', 'vs20olympdice', 'Gates of Olympus Dice', 'vs20olympdice', 'Slots', NULL, 'Games/Pragmatic/vs20olympdice.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:57:18', '2025-07-12 21:47:41', 0),
(828, 2, 'inativo', 'vs20pquestx', 'Pirate Quest 1000', 'vs20pquestx', 'Slots', NULL, 'Games/Pragmatic/vs20pquestx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2025-04-14 18:57:18', '2025-08-14 18:06:31', 0),
(829, 21, 'inativo', 'vs20procountx', 'Wisdom of Athena 1000', 'vs20procountx', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20procountx.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:18', '2025-04-14 18:57:32', 1),
(830, 2, 'inativo', 'vs20rodegate', 'Devil Joker', 'vs20rodegate', 'Slots', NULL, 'Games/Pragmatic/vs20rodegate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:18', '2025-04-14 18:57:18', 0),
(831, 2, 'inativo', 'vs20rujakbnz', 'Rujak Bonanza', 'vs20rujakbnz', 'Slots', NULL, 'Games/Pragmatic/vs20rujakbnz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:19', '2025-04-14 18:57:19', 0),
(832, 21, 'inativo', 'vs20schristmas', 'Starlight Christmas', 'vs20schristmas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20schristmas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:19', '2025-04-14 18:57:42', 1),
(833, 2, 'inativo', 'vs20sungate', 'The Green Sun', 'vs20sungate', 'Slots', NULL, 'Games/Pragmatic/vs20sungate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:19', '2025-04-14 18:57:19', 0),
(834, 2, 'inativo', 'vswaysmahwin2', 'Mahjong Wins 2', 'vswaysmahwin2', 'Slots', NULL, 'Games/Pragmatic/vswaysmahwin2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:19', '2025-04-14 18:57:19', 0),
(835, 2, 'inativo', 'vswaysmherc', 'Mighty Hercules', 'vswaysmherc', 'Slots', NULL, 'Games/Pragmatic/vswaysmherc.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:19', '2025-04-14 18:57:19', 0),
(836, 21, 'inativo', 'vs25xmasparty', 'Penguins Christmas Party Time', 'vs25xmasparty', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25xmasparty.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:19', '2025-04-14 18:58:15', 1),
(837, 21, 'inativo', 'vs20olympxmas', 'Gates of Olympus Xmas 1000', 'vs20olympxmas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20olympxmas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:20', '2025-04-14 18:58:33', 1),
(838, 21, 'inativo', 'vs10bbxext', 'Big Bass Xmas Xtreme', 'vs10bbxext', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbxext.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:20', '2025-04-14 18:58:33', 1),
(839, 21, 'inativo', 'vs20rainbowrsh', 'Santa\'s Xmas Rush', 'vs20rainbowrsh', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20rainbowrsh.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:20', '2025-04-14 18:57:47', 1),
(840, 1, 'inativo', '9873', 'Hip Hop Panda', '9873', 'Slots', NULL, 'Games/Pgsoft/9873.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:20', '2025-04-14 18:57:20', 1),
(841, 1, 'inativo', '9875', 'Mr. Hallow-Win!', '9875', 'Slots', NULL, 'Games/Pgsoft/9875.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:20', '2025-04-14 18:57:20', 1),
(842, 1, 'inativo', '9872', 'Baccarat Deluxe', '9872', 'Slots', NULL, 'Games/Pgsoft/9872.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:20', '2025-04-14 18:57:20', 1),
(843, 1, 'inativo', '9947', 'Speed Winner', '9947', 'Slots', NULL, 'Games/Pgsoft/9947.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:20', '2025-04-14 18:57:20', 1),
(844, 1, 'inativo', '9862', 'Fortune Gods', '9862', 'Slots', NULL, 'Games/Pgsoft/9862.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:20', '2025-04-14 18:57:20', 1),
(845, 1, 'inativo', '13182', 'Pinata Wins', '13182', 'Slots', NULL, 'Games/Pgsoft/13182.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:57:21', '2025-09-05 19:00:29', 1),
(846, 1, 'inativo', '9877', 'Santas Gift Rush', '9877', 'Slots', NULL, 'Games/Pgsoft/9877.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:21', '2025-04-14 18:57:21', 1),
(847, 1, 'inativo', '9897', 'Shaolin Soccer', '9897', 'Slots', NULL, 'Games/Pgsoft/9897.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:21', '2025-04-14 18:57:21', 1),
(848, 1, 'inativo', '9892', 'Flirting Scholar', '9892', 'Slots', NULL, 'Games/Pgsoft/9892.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:21', '2025-04-14 18:57:21', 1),
(849, 1, 'inativo', '9883', 'Emperor\'s Favour', '9883', 'Slots', NULL, 'Games/Pgsoft/9883.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:21', '2025-04-14 18:57:21', 1),
(850, 1, 'inativo', '9871', 'Dragon Legend', '9871', 'Slots', NULL, 'Games/Pgsoft/9871.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:21', '2025-04-14 18:57:21', 1),
(851, 1, 'inativo', '9910', 'Genie\'s 3 Wishes', '9910', 'Slots', NULL, 'Games/Pgsoft/9910.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:21', '2025-04-14 18:57:21', 1),
(852, 1, 'inativo', '9881', 'Symbols of Egypt', '9881', 'Slots', NULL, 'Games/Pgsoft/9881.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:22', '2025-04-14 18:57:22', 1),
(853, 1, 'inativo', '9915', 'Secrets of Cleopatra', '9915', 'Slots', NULL, 'Games/Pgsoft/9915.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:22', '2025-04-14 18:57:22', 1),
(854, 1, 'inativo', '9890', 'Ninja vs Samurai', '9890', 'Slots', NULL, 'Games/Pgsoft/9890.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:22', '2025-04-14 18:57:22', 1),
(855, 1, 'inativo', '9885', 'Journey To The Wealth', '9885', 'Slots', NULL, 'Games/Pgsoft/9885.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:22', '2025-04-14 18:57:22', 1),
(856, 1, 'inativo', '9867', 'Win Win Won', '9867', 'Slots', NULL, 'Games/Pgsoft/9867.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:22', '2025-04-14 18:57:22', 1),
(857, 1, 'inativo', '9860', 'Honey Trap of Diao Chan', '9860', 'Slots', NULL, 'Games/Pgsoft/9860.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:22', '2025-04-14 18:57:22', 1),
(858, 1, 'inativo', '9864', 'Medusa 1: the Curse of Athena', '9864', 'Slots', NULL, 'Games/Pgsoft/9864.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:22', '2025-04-14 18:57:22', 1),
(859, 1, 'inativo', '9863', 'Medusa 2: the Quest of Perseus', '9863', 'Slots', NULL, 'Games/Pgsoft/9863.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:23', '2025-04-14 18:57:23', 1),
(860, 1, 'inativo', '9865', 'Hood vs Wolf', '9865', 'Slots', NULL, 'Games/Pgsoft/9865.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:23', '2025-04-14 18:57:23', 1),
(861, 1, 'inativo', '9895', 'Muay Thai Champion', '9895', 'Slots', NULL, 'Games/Pgsoft/9895.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:23', '2025-04-14 18:57:23', 1),
(862, 1, 'inativo', '9866', 'Reel Love', '9866', 'Slots', NULL, 'Games/Pgsoft/9866.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:23', '2025-04-14 18:57:23', 1),
(863, 1, 'inativo', '9906', 'Circus Delight', '9906', 'Slots', NULL, 'Games/Pgsoft/9906.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:23', '2025-04-14 18:57:23', 1),
(864, 1, 'inativo', '9878', 'Gem Saviour Sword', '9878', 'Slots', NULL, 'Games/Pgsoft/9878.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:23', '2025-04-14 18:57:23', 1),
(865, 1, 'inativo', '9874', 'Legend of Hou Yi', '9874', 'Slots', NULL, 'Games/Pgsoft/9874.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:23', '2025-04-14 18:57:23', 1),
(866, 1, 'inativo', '9876', 'Prosperity Lion', '9876', 'Slots', NULL, 'Games/Pgsoft/9876.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:23', '2025-04-14 18:57:23', 1),
(867, 1, 'inativo', '9868', 'Plushie Frenzy', '9868', 'Slots', NULL, 'Games/Pgsoft/9868.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:23', '2025-04-14 18:57:23', 1),
(868, 1, 'inativo', '9902', 'Egypts Book of Mystery', '9902', 'Slots', NULL, 'Games/Pgsoft/9902.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:24', '2025-04-14 18:57:24', 1),
(869, 1, 'inativo', '12567', 'Ultimate Striker', '12567', 'Slots', NULL, 'Games/Pgsoft/12567.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:24', '2025-04-14 18:57:24', 1),
(870, 1, 'inativo', '9954', 'Totem Wonders', '9954', 'Slots', NULL, 'Games/Pgsoft/9954.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:24', '2025-04-14 18:57:24', 1),
(871, 3, 'inativo', '12590', 'AVIATOR (Original)', '12590', 'Crash', NULL, 'Games/Spribe/Aviator.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:24', '2025-04-14 20:48:25', 1),
(872, 1, 'inativo', 'geisha-revenge', 'Geisha\'s Revenge', 'geisha-revenge', 'Slots', NULL, 'Games/Pgsoft/geisha-revenge.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:24', '2025-04-14 18:57:24', 0),
(873, 1, 'inativo', 'wings-iguazu', 'Wings of Iguazu', 'wings-iguazu', 'Slots', NULL, 'Games/Pgsoft/wings-iguazu.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:24', '2025-04-14 18:57:24', 0),
(874, 1, 'inativo', 'museum-mystery', 'Museum Mystery', 'museum-mystery', 'Slots', NULL, 'Games/Pgsoft/museum-mystery.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:24', '2025-04-14 18:57:24', 0),
(875, 1, 'inativo', 'yakuza-honor', 'Yakuza Honor', 'yakuza-honor', 'Slots', NULL, 'Games/Pgsoft/yakuza-honor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:25', '2025-04-14 18:57:25', 0),
(876, 1, 'inativo', 'oishi-delights', 'Oishi Delights', 'oishi-delights', 'Slots', NULL, 'Games/Pgsoft/oishi-delights.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:25', '2025-04-14 18:57:25', 0),
(878, 3, 'inativo', '11674', 'Mines (Original)', '11674', 'Crash', NULL, 'Games/Spribe/mines.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:25', '2025-04-14 20:48:09', 1),
(879, 20, 'inativo', '8367', 'Air Strike 3', '8367', 'pescaria', NULL, 'Games/Fish/8367.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:25', '2025-04-14 18:57:25', 1),
(880, 20, 'inativo', '8125', 'Arc of Templar', '8125', 'pescaria', NULL, 'Games/Fish/8125.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:25', '2025-04-14 18:57:25', 1),
(881, 20, 'inativo', '8117', 'Baby Octopus', '8117', 'pescaria', NULL, 'Games/Fish/8117.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:26', '2025-04-14 18:57:26', 1),
(882, 20, 'inativo', '8119', 'Circus Circus', '8119', 'pescaria', NULL, 'Games/Fish/8119.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:26', '2025-04-14 18:57:26', 1),
(883, 20, 'inativo', '8113', 'Crab King', '8113', 'pescaria', NULL, 'Games/Fish/8113.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:26', '2025-04-14 18:57:26', 1),
(884, 20, 'inativo', '8126', 'Crab King 2', '8126', 'pescaria', NULL, 'Games/Fish/8126.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:26', '2025-04-14 18:57:26', 1),
(885, 20, 'inativo', '8369', 'Crab King 3', '8369', 'pescaria', NULL, 'Games/Fish/8369.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:57:26', '2025-06-29 12:50:13', 1),
(886, 20, 'inativo', '8118', 'Crocodile Adventure', '8118', 'pescaria', NULL, 'Games/Fish/8118.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:57:26', '2025-07-23 15:17:54', 1),
(887, 20, 'inativo', '8364', 'Dancing Skeleton 3D', '8364', 'pescaria', NULL, 'Games/Fish/8364.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:26', '2025-04-14 20:29:02', 1);
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `original`) VALUES
(888, 20, 'inativo', '8111', 'Deepsea Volcamon', '8111', 'pescaria', NULL, 'Games/Fish/8111.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:26', '2025-04-14 20:29:00', 1),
(889, 20, 'inativo', '8372', 'Dragon Master', '8372', 'pescaria', NULL, 'Games/Fish/8372.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:27', '2025-04-14 20:28:57', 1),
(890, 20, 'inativo', '8122', 'Dragon vs Phoenix', '8122', 'pescaria', NULL, 'Games/Fish/8122.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:27', '2025-04-14 20:28:59', 1),
(891, 20, 'inativo', '8121', 'Eagle Eyes', '8121', 'pescaria', NULL, 'Games/Fish/8121.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:27', '2025-04-14 18:57:27', 1),
(892, 20, 'inativo', '8112', 'Fire Kirin', '8112', 'pescaria', NULL, 'Games/Fish/8112.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:27', '2025-04-14 18:57:27', 1),
(893, 20, 'inativo', '8363', 'Fire Kirin 3', '8363', 'pescaria', NULL, 'Games/Fish/8363.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:27', '2025-04-14 18:57:27', 1),
(894, 20, 'inativo', '8110', 'Golden Toad', '8110', 'pescaria', NULL, 'Games/Fish/8110.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:57:27', '2025-07-30 01:14:59', 1),
(895, 20, 'inativo', '8120', 'Magical Ship', '8120', 'pescaria', NULL, 'Games/Fish/8120.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:27', '2025-04-14 18:57:27', 1),
(896, 20, 'inativo', '8123', 'Meteor Shower', '8123', 'pescaria', NULL, 'Games/Fish/8123.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:27', '2025-04-14 20:28:49', 1),
(897, 20, 'inativo', '8115', 'Money Tree', '8115', 'pescaria', NULL, 'Games/Fish/8115.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:28', '2025-04-14 20:28:47', 1),
(898, 20, 'inativo', '8366', 'Ocean Monster 3', '8366', 'pescaria', NULL, 'Games/Fish/8366.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:28', '2025-04-14 18:57:28', 1),
(899, 20, 'inativo', '8365', 'Panda vs Alien', '8365', 'pescaria', NULL, 'Games/Fish/8365.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:28', '2025-04-14 18:57:28', 1),
(900, 20, 'inativo', '8370', 'Raging Kingdom 3D', '8370', 'pescaria', NULL, 'Games/Fish/8370.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:28', '2025-04-14 20:28:43', 1),
(901, 20, 'inativo', '8124', 'Spirit Stallion', '8124', 'pescaria', NULL, 'Games/Fish/8124.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:28', '2025-04-14 18:57:28', 1),
(902, 20, 'inativo', '8371', 'St Patriks Treasure 3D', '8371', 'pescaria', NULL, 'Games/Fish/8371.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:57:28', '2025-04-14 20:28:42', 1),
(904, 21, 'inativo', 'vswaysasiatrzn', 'Triple Pot Gold', 'vswaysasiatrzn', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysasiatrzn.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:29', '2025-04-14 18:57:29', 1),
(905, 21, 'inativo', 'vs20olympx', 'Gates of Olympus 1000', 'vs20olympx', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20olympx.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:29', '2025-04-14 18:57:29', 1),
(906, 21, 'inativo', 'vs20fruitswx', 'Sweet Bonanza 1000', 'vs20fruitswx', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20fruitswx.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:29', '2025-04-14 18:57:29', 1),
(907, 21, 'inativo', 'vs20dhsuper', 'The Dog House - Royal Hunt', 'vs20dhsuper', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20dhsuper.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:29', '2025-04-14 18:57:29', 1),
(908, 2, 'inativo', 'vs20olympgate', 'Gates of Olympus', 'vs20olympgate', 'Slots', NULL, 'Games/Pragmatic/vs20olympgate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000065, 0, 1, '2025-04-14 18:57:30', '2025-09-10 16:24:11', 0),
(909, 21, 'inativo', 'vs20sugarrushx', 'Sugar Rush 1000', 'vs20sugarrushx', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20sugarrushx.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:30', '2025-04-14 18:57:30', 1),
(910, 21, 'inativo', 'vs20fatbook', 'Book of Monsters', 'vs20fatbook', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20fatbook.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:30', '2025-04-14 18:57:30', 1),
(911, 21, 'inativo', 'vs10bbdoubled', 'Big Bass Vegas Double Down Deluxe', 'vs10bbdoubled', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbdoubled.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:31', '2025-04-14 18:57:31', 1),
(912, 21, 'inativo', 'vs20lightblitz', 'Blitz Super Wheel', 'vs20lightblitz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20lightblitz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:31', '2025-04-14 18:57:31', 1),
(913, 21, 'inativo', 'vs5luckytigly', 'Lucky Tiger', 'vs5luckytigly', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5luckytigly.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:31', '2025-04-14 18:57:31', 1),
(914, 21, 'inativo', 'vs10forwildly', 'Lucky Mouse', 'vs10forwildly', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10forwildly.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:31', '2025-04-14 18:57:31', 1),
(915, 21, 'inativo', 'vswayswwjoker', 'Wild Wild Joker', 'vswayswwjoker', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayswwjoker.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:31', '2025-04-14 18:57:31', 1),
(916, 21, 'inativo', 'vswaysvlcgds', 'Volcano Goddess', 'vswaysvlcgds', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysvlcgds.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:31', '2025-04-14 18:57:31', 1),
(917, 21, 'inativo', 'vs12bgrbspl', 'Bigger Bass Splash', 'vs12bgrbspl', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs12bgrbspl.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:31', '2025-04-14 18:57:31', 1),
(918, 21, 'inativo', 'vs10bblotgl', 'Big Bass - Secrets of the Golden Lake', 'vs10bblotgl', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bblotgl.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:32', '2025-04-14 18:57:32', 1),
(919, 21, 'inativo', 'vswaysstampede', 'Fire Stampede', 'vswaysstampede', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysstampede.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:32', '2025-04-14 18:57:32', 1),
(920, 21, 'inativo', 'vswaysbrickhos', 'Brick House Bonanza', 'vswaysbrickhos', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysbrickhos.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:33', '2025-04-14 18:57:33', 1),
(921, 21, 'inativo', 'vs10bbfloats', 'Big Bass Floats my Boat', 'vs10bbfloats', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbfloats.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:33', '2025-04-14 18:57:33', 1),
(922, 21, 'inativo', 'vs12bbbxmas', 'Bigger Bass Blizzard - Christmas Catch', 'vs12bbbxmas', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs12bbbxmas.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:33', '2025-04-14 18:57:33', 1),
(923, 21, 'inativo', 'vs25checaishen', 'Chests of Cai Shen', 'vs25checaishen', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25checaishen.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:34', '2025-04-14 18:57:34', 1),
(924, 21, 'inativo', 'vs10bbrttr', 'Big Bass Return to the Races', 'vs10bbrttr', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbrttr.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:34', '2025-04-14 18:57:34', 1),
(925, 21, 'inativo', 'vs10bbfmission', 'Big Bass Mission Fishin\'', 'vs10bbfmission', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbfmission.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:35', '2025-04-14 18:57:35', 1),
(926, 21, 'inativo', 'vsways5lions2', '5 Lions Megaways 2', 'vsways5lions2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vsways5lions2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:35', '2025-04-14 18:57:35', 1),
(927, 21, 'inativo', 'vswayswbounty', 'Vampy Party', 'vswayswbounty', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayswbounty.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:37', '2025-04-14 18:57:37', 1),
(928, 21, 'inativo', 'vswayssevenc', '7 Clovers of Fortune', 'vswayssevenc', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayssevenc.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:37', '2025-04-14 18:57:37', 1),
(929, 21, 'inativo', 'vs5bb3reeler', 'Big Bass Bonanza 3 Reeler', 'vs5bb3reeler', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5bb3reeler.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:38', '2025-04-14 18:57:38', 1),
(930, 21, 'inativo', 'vs5jjwild', 'Joker\'s Jewels Wild', 'vs5jjwild', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5jjwild.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:38', '2025-04-14 18:57:38', 1),
(931, 21, 'inativo', 'vs20sugarnudge', 'Sugar Supreme Powernudge', 'vs20sugarnudge', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20sugarnudge.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:38', '2025-04-14 18:57:38', 1),
(932, 21, 'inativo', 'vs25luckwildpb', 'Lucky\'s Wild Pub', 'vs25luckwildpb', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25luckwildpb.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:38', '2025-04-14 18:57:38', 1),
(933, 21, 'inativo', 'vs10bhallbnza2', 'Big Bass Halloween 2', 'vs10bhallbnza2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bhallbnza2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:38', '2025-04-14 18:57:38', 1),
(934, 21, 'inativo', 'vswayswwriches', 'Wild Wild Riches Megaways', 'vswayswwriches', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayswwriches.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:38', '2025-04-14 18:57:38', 1),
(935, 21, 'inativo', 'vs20dhcluster2', 'The Dog House - Muttley Crew', 'vs20dhcluster2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20dhcluster2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:38', '2025-04-14 18:57:38', 1),
(936, 21, 'inativo', 'vs20doghouse2', 'The Dog House - Dog or Alive', 'vs20doghouse2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20doghouse2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:38', '2025-04-14 18:57:38', 1),
(937, 21, 'inativo', 'vswaystonypzz', 'Peppe\'s Pepperoni Pizza Plaza', 'vswaystonypzz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaystonypzz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:39', '2025-04-14 18:57:39', 1),
(938, 21, 'inativo', 'vs20portals', 'Fire Portals', 'vs20portals', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20portals.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:39', '2025-04-14 18:57:39', 1),
(939, 21, 'inativo', 'vs10bbbrlact', 'Big Bass Bonanza - Reel Action', 'vs10bbbrlact', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bbbrlact.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:39', '2025-04-14 18:57:39', 1),
(940, 21, 'inativo', 'vs20candybltz2', 'Candy Blitz Bombs', 'vs20candybltz2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20candybltz2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:39', '2025-04-14 18:57:39', 1),
(941, 21, 'inativo', 'vs10fdsnake', 'Floating Dragon - Year of the Snake', 'vs10fdsnake', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10fdsnake.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:39', '2025-04-14 18:57:39', 1),
(942, 21, 'inativo', 'vs50fatfrogs', 'Tiny Toads', 'vs50fatfrogs', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50fatfrogs.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:40', '2025-04-14 18:57:40', 1),
(943, 21, 'inativo', 'vswaysbufstamp', 'Wild Wildebeest Wins', 'vswaysbufstamp', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysbufstamp.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:40', '2025-04-14 18:57:40', 1),
(944, 21, 'inativo', 'vs432congocash', 'Congo Cash', 'vs432congocash', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs432congocash.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:40', '2025-04-14 18:57:40', 1),
(945, 21, 'inativo', 'vs15fghtmultlv', 'Angel vs Sinner', 'vs15fghtmultlv', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs15fghtmultlv.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:40', '2025-04-14 18:57:40', 1),
(946, 21, 'inativo', 'vs10booklight', 'John Hunter and Galileo\'s Secrets', 'vs10booklight', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10booklight.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:41', '2025-04-14 18:57:41', 1),
(947, 21, 'inativo', 'vswaysmegareel', 'Pompeii Megareels Megaways', 'vswaysmegareel', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmegareel.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:41', '2025-04-14 18:57:41', 1),
(948, 21, 'inativo', 'vs20minerush', 'Mining Rush', 'vs20minerush', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20minerush.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:41', '2025-04-14 18:57:41', 1),
(949, 21, 'inativo', 'vs10tut', 'Book Of Tut Respin', 'vs10tut', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10tut.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:42', '2025-04-14 18:57:42', 1),
(950, 21, 'inativo', 'vs25ultwolgol', 'Wolf Gold Ultimate', 'vs25ultwolgol', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25ultwolgol.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:42', '2025-04-14 18:57:42', 1),
(1444, 2, 'inativo', 'vs5luckytig', 'Tigre Sortudo', 'vs5luckytig', 'Slots', NULL, 'Games/Pragmatic/vs5luckytig.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000582, 1, 1, '2025-04-14 18:59:10', '2025-09-11 20:28:27', 0),
(951, 21, 'inativo', 'vswaysaztec', 'Aztec Gems Megaways', 'vswaysaztec', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysaztec.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:43', '2025-04-14 18:57:43', 1),
(952, 21, 'inativo', 'vs5magicdoor', '6 Jokers', 'vs5magicdoor', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5magicdoor.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:43', '2025-04-14 18:57:43', 1),
(953, 21, 'inativo', 'vswayssavlgnd', 'Savannah Legend', 'vswayssavlgnd', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayssavlgnd.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:43', '2025-04-14 18:57:43', 1),
(954, 21, 'inativo', 'vs10fortnpig', 'Greedy Fortune Pig', 'vs10fortnpig', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10fortnpig.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:43', '2025-04-14 18:57:43', 1),
(955, 21, 'inativo', 'vswaysmltchmgw', 'Raging Waterfall Megaways', 'vswaysmltchmgw', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmltchmgw.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:43', '2025-04-14 18:57:43', 1),
(956, 21, 'inativo', 'vs20porbs', 'Santa\'s Great Gifts', 'vs20porbs', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20porbs.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:43', '2025-04-14 18:57:43', 1),
(957, 21, 'inativo', 'vswayspowzeus', 'Power of Merlin Megaways', 'vswayspowzeus', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayspowzeus.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:43', '2025-04-14 18:57:43', 1),
(958, 21, 'inativo', 'vs20pistols', 'Wild West Duels', 'vs20pistols', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20pistols.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:44', '2025-04-14 18:57:44', 1),
(959, 21, 'inativo', 'vswaysmodfr', 'Ancient Island Megaways', 'vswaysmodfr', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmodfr.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:44', '2025-04-14 18:57:44', 1),
(960, 21, 'inativo', 'vswaysbblitz', 'Money Stacks Megaways', 'vswaysbblitz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysbblitz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:44', '2025-04-14 18:57:44', 1),
(961, 21, 'inativo', 'vs10fireice', 'Escape the Pyramid - Fire & Ice', 'vs10fireice', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10fireice.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:44', '2025-04-14 18:57:44', 1),
(962, 21, 'inativo', 'vs20midas2', 'Hand of Midas 2', 'vs20midas2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20midas2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:45', '2025-04-14 18:57:45', 1),
(963, 21, 'inativo', 'vs20irishcrown', 'Irish Crown', 'vs20irishcrown', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20irishcrown.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:45', '2025-04-14 18:57:45', 1),
(1422, 1, 'inativo', '126', 'Fortune Tiger', '126', 'Slots', NULL, 'Games/Pgsoft/126.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1004601, 1, 1, '2025-04-14 18:59:08', '2025-09-11 20:29:45', 0),
(964, 21, 'inativo', 'vswayspearls', 'Wild Wild Pearls', 'vswayspearls', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayspearls.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:46', '2025-04-14 18:57:46', 1),
(965, 21, 'inativo', 'vswayskrakenmw', 'Release the Kraken Megaways', 'vswayskrakenmw', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayskrakenmw.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:46', '2025-04-14 18:57:46', 1),
(966, 21, 'inativo', 'vs20cjcluster', 'Candy Jar Clusters', 'vs20cjcluster', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20cjcluster.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:47', '2025-04-14 18:57:47', 1),
(967, 21, 'inativo', 'vswayswildgang', 'The Wild Gang', 'vswayswildgang', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayswildgang.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:47', '2025-04-14 18:57:47', 1),
(968, 21, 'inativo', 'vswaysbkingasc', 'Buffalo King Untamed Megaways', 'vswaysbkingasc', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysbkingasc.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:47', '2025-04-14 18:57:47', 1),
(969, 21, 'inativo', 'vs20dhcluster', 'Twilight Princess', 'vs20dhcluster', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20dhcluster.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:47', '2025-04-14 18:57:47', 1),
(970, 21, 'inativo', 'vs20fortbon', 'Fruity Treats', 'vs20fortbon', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20fortbon.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:47', '2025-04-14 18:57:47', 1),
(971, 21, 'inativo', 'vs20plsmcannon', 'Aztec Smash', 'vs20plsmcannon', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20plsmcannon.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:47', '2025-04-14 18:57:47', 1),
(972, 21, 'inativo', 'vswaysgoldcol', 'Mustang Gold Megaways', 'vswaysgoldcol', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysgoldcol.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:47', '2025-04-14 18:57:47', 1),
(973, 21, 'inativo', 'vs10dkinghp', 'Dragon King Hot Pots', 'vs10dkinghp', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10dkinghp.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:48', '2025-04-14 18:57:48', 1),
(974, 21, 'inativo', 'vs20kraken2', 'Release the Kraken 2', 'vs20kraken2', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20kraken2.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:48', '2025-04-14 18:57:48', 1),
(975, 21, 'inativo', 'vs20multiup', 'Wheel O\'Gold', 'vs20multiup', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20multiup.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:49', '2025-04-14 18:57:49', 1),
(976, 21, 'inativo', 'vs10fangfree', 'Fangtastic Freespins', 'vs10fangfree', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10fangfree.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:49', '2025-04-14 18:57:49', 1),
(977, 21, 'inativo', 'vswayscharms', '5 Frozen Charms Megaways', 'vswayscharms', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayscharms.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:49', '2025-04-14 18:57:49', 1),
(978, 21, 'inativo', 'vs20heartcleo', 'Heart of Cleopatra', 'vs20heartcleo', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20heartcleo.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:49', '2025-04-14 18:57:49', 1),
(979, 21, 'inativo', 'vs10fonzofff', 'Fonzo\'s Feline Fortunes', 'vs10fonzofff', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10fonzofff.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:51', '2025-04-14 18:57:51', 1),
(980, 21, 'inativo', 'vswaysmfreya', 'Might of Freya Megaways', 'vswaysmfreya', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmfreya.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:51', '2025-04-14 18:57:51', 1),
(981, 21, 'inativo', 'vs12scode', 'Samurai Code', 'vs12scode', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs12scode.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:51', '2025-04-14 18:57:51', 1),
(982, 21, 'inativo', 'vs20fourmc', 'Candy Corner', 'vs20fourmc', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20fourmc.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:52', '2025-04-14 18:57:52', 1),
(983, 21, 'inativo', 'vswaysmegahays', 'Barnyard Megahays Megaways', 'vswaysmegahays', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmegahays.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:53', '2025-04-14 18:57:53', 1),
(984, 21, 'inativo', 'vswaysfltdrgny', 'Floating Dragon New Year Festival Ultra Megaways Hold & Spin', 'vswaysfltdrgny', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysfltdrgny.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:54', '2025-04-14 18:57:54', 1),
(985, 21, 'inativo', 'vs25rlbank', 'Reel Banks', 'vs25rlbank', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25rlbank.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:54', '2025-04-14 18:57:54', 1),
(986, 21, 'inativo', 'vs25badge', 'Badge Blitz', 'vs25badge', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25badge.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:54', '2025-04-14 18:57:54', 1),
(987, 21, 'inativo', 'vswaysfreezet', 'Eternal Empress - Freeze Time', 'vswaysfreezet', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysfreezet.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:54', '2025-04-14 18:57:54', 1),
(988, 21, 'inativo', 'vs50jfmulthold', 'Juicy Fruits Multihold', 'vs50jfmulthold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50jfmulthold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:55', '2025-04-14 18:57:55', 1),
(989, 21, 'inativo', 'vs20clustcol', 'Sweet Kingdom', 'vs20clustcol', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20clustcol.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:55', '2025-04-14 18:57:55', 1),
(990, 21, 'inativo', 'vs20devilic', 'Devilicious', 'vs20devilic', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20devilic.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:56', '2025-04-14 18:57:56', 1),
(991, 21, 'inativo', 'vs5hotbmult', 'Hot To Burn Multiplier', 'vs5hotbmult', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5hotbmult.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:56', '2025-04-14 18:57:56', 1),
(992, 21, 'inativo', 'vswaysfirewmw', 'Blazing Wilds Megaways', 'vswaysfirewmw', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysfirewmw.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:57', '2025-04-14 18:57:57', 1),
(993, 21, 'inativo', 'vswaysbewaretd', 'Beware The Deep Megaways', 'vswaysbewaretd', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysbewaretd.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:57', '2025-04-14 18:57:57', 1),
(994, 21, 'inativo', 'vs20bigdawgs', 'The Big Dawgs', 'vs20bigdawgs', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20bigdawgs.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:57', '2025-04-14 18:57:57', 1),
(995, 21, 'inativo', 'vs25wildies', 'Wildies', 'vs25wildies', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25wildies.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:58', '2025-04-14 18:57:58', 1),
(996, 21, 'inativo', 'vs20drgbless', 'Dragon Hero', 'vs20drgbless', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20drgbless.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:58', '2025-04-14 18:57:58', 1),
(997, 21, 'inativo', 'vs20bison', 'Release the Bison', 'vs20bison', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20bison.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:58', '2025-04-14 18:57:58', 1),
(998, 21, 'inativo', 'vs10bookviking', 'Book of Vikings', 'vs10bookviking', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bookviking.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:58', '2025-04-14 18:57:58', 1),
(999, 21, 'inativo', 'vs1024gmayhem', 'Gorilla Mayhem', 'vs1024gmayhem', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1024gmayhem.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:58', '2025-04-14 18:57:58', 1),
(1000, 21, 'inativo', 'vs5himalaw', 'Himalayan Wild', 'vs5himalaw', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5himalaw.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:59', '2025-04-14 18:57:59', 1),
(1001, 21, 'inativo', 'vs20elevclust', 'Gem Elevator', 'vs20elevclust', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20elevclust.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:59', '2025-04-14 18:57:59', 1),
(1002, 21, 'inativo', 'vs20sbpnudge', 'Aztec Powernudge', 'vs20sbpnudge', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20sbpnudge.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:57:59', '2025-04-14 18:57:59', 1),
(1003, 21, 'inativo', 'vs20shootstars', 'Heroic Spins', 'vs20shootstars', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20shootstars.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:01', '2025-04-14 18:58:01', 1),
(1004, 21, 'inativo', 'vswaysmegwghts', 'Sumo Supreme Megaways', 'vswaysmegwghts', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysmegwghts.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:01', '2025-04-14 18:58:01', 1),
(1005, 21, 'inativo', 'vswaysrockblst', 'Rocket Blast Megaways', 'vswaysrockblst', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysrockblst.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:01', '2025-04-14 18:58:01', 1),
(1006, 21, 'inativo', 'vswayshexhaus', 'Rise of Pyramids', 'vswayshexhaus', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayshexhaus.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:02', '2025-04-14 18:58:02', 1),
(1007, 21, 'inativo', 'vs20crankit', 'Crank it Up', 'vs20crankit', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20crankit.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:03', '2025-04-14 18:58:03', 1),
(1008, 21, 'inativo', 'vs20mergedwndw', 'Blade & Fangs', 'vs20mergedwndw', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mergedwndw.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:03', '2025-04-14 18:58:03', 1),
(1009, 21, 'inativo', 'vswaysloki', 'Revenge of Loki Megaways', 'vswaysloki', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysloki.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:03', '2025-04-14 18:58:03', 1),
(1010, 21, 'inativo', 'vs20nilefort', 'Nile Fortune', 'vs20nilefort', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20nilefort.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:04', '2025-04-14 18:58:04', 1),
(1011, 21, 'inativo', 'vs20stckwldsc', 'Pot of Fortune', 'vs20stckwldsc', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20stckwldsc.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:05', '2025-04-14 18:58:05', 1),
(1012, 21, 'inativo', 'vs20medusast', 'Medusa\'s Stone', 'vs20medusast', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20medusast.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:05', '2025-04-14 18:58:05', 1),
(1013, 21, 'inativo', 'vswaysexpandng', 'Castle of Fire', 'vswaysexpandng', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysexpandng.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:05', '2025-04-14 18:58:05', 1),
(1014, 21, 'inativo', 'vswaysspltsym', 'Dwarf & Dragon', 'vswaysspltsym', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysspltsym.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:05', '2025-04-14 18:58:05', 1),
(1015, 21, 'inativo', 'vs20stickypos', 'Ice Lobster', 'vs20stickypos', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20stickypos.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:06', '2025-04-14 18:58:06', 1),
(1016, 21, 'inativo', 'vs10noodles', 'Oodles of Noodles', 'vs10noodles', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10noodles.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:06', '2025-04-14 18:58:06', 1),
(1017, 21, 'inativo', 'vs20trswild3', 'Aztec Treasure Hunt', 'vs20trswild3', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20trswild3.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:06', '2025-04-14 18:58:06', 1),
(1018, 21, 'inativo', 'vs25kingdoms', '3 Kingdoms - Battle of Red Cliffs', 'vs25kingdoms', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25kingdoms.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:07', '2025-04-14 18:58:07', 1),
(1019, 21, 'inativo', 'vs25kfruit', 'Aztec Blaze', 'vs25kfruit', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25kfruit.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:07', '2025-04-14 18:58:07', 1),
(1020, 21, 'inativo', 'vs20clreacts', 'Moleionaire', 'vs20clreacts', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20clreacts.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:08', '2025-04-14 18:58:08', 1),
(1021, 21, 'inativo', 'vs40wildrun', 'Fortune Hit\'n Roll', 'vs40wildrun', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40wildrun.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:09', '2025-04-14 18:58:09', 1),
(1022, 21, 'inativo', 'vs20powerwild', 'Mystery Mice', 'vs20powerwild', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20powerwild.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:10', '2025-04-14 18:58:10', 1),
(1023, 21, 'inativo', 'vs40stckwldlvl', 'Ripe Rewards', 'vs40stckwldlvl', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40stckwldlvl.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:10', '2025-04-14 18:58:10', 1),
(1024, 21, 'inativo', 'vswayseternity', 'Diamonds of Egypt', 'vswayseternity', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayseternity.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:11', '2025-04-14 18:58:11', 1),
(1025, 21, 'inativo', 'cs3w', 'Diamonds are Forever 3 Lines', 'cs3w', 'Slots', NULL, 'Games/Pragmatic_Oficial/cs3w.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:12', '2025-04-14 18:58:12', 1),
(1026, 21, 'inativo', 'vs20mtreasure', 'Pirate Golden Age', 'vs20mtreasure', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mtreasure.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:12', '2025-04-14 18:58:12', 1),
(1027, 21, 'inativo', 'vs20treesot', 'Trees of Treasure', 'vs20treesot', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20treesot.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:13', '2025-04-14 18:58:13', 1),
(1028, 21, 'inativo', 'vs20mysteryst', 'Country Farming', 'vs20mysteryst', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mysteryst.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:14', '2025-04-14 18:58:14', 1),
(1029, 21, 'inativo', 'vs10snakeladd', 'Snakes and Ladders Megadice', 'vs10snakeladd', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10snakeladd.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:15', '2025-04-14 18:58:15', 1),
(1030, 21, 'inativo', 'vs20forgewilds', 'Forging Wilds', 'vs20forgewilds', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20forgewilds.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:16', '2025-04-14 18:58:16', 1),
(1031, 21, 'inativo', 'vs10luckfort', 'Good Luck & Good Fortune', 'vs10luckfort', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10luckfort.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:17', '2025-04-14 18:58:17', 1),
(1032, 21, 'inativo', 'vs10jnmntzma', 'Jane Hunter and the Mask of Montezuma', 'vs10jnmntzma', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10jnmntzma.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:17', '2025-04-14 18:58:17', 1),
(1033, 21, 'inativo', 'vs20clustext', 'Gears of Horus', 'vs20clustext', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20clustext.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:17', '2025-04-14 18:58:17', 1),
(1034, 21, 'inativo', 'vswaysyumyum', 'Yum Yum Powerways', 'vswaysyumyum', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysyumyum.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:17', '2025-04-14 18:58:17', 1),
(1035, 21, 'inativo', 'vs20powerpays', 'Red Hot Luck', 'vs20powerpays', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20powerpays.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:18', '2025-04-14 18:58:18', 1),
(1036, 21, 'inativo', 'vs20yotdk', 'Year Of The Dragon King', 'vs20yotdk', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20yotdk.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:18', '2025-04-14 18:58:18', 1),
(1037, 21, 'inativo', 'vs20lobseafd', 'Lobster Bob\'s Sea Food and Win It', 'vs20lobseafd', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20lobseafd.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:18', '2025-04-14 18:58:18', 1),
(1038, 21, 'inativo', 'vswaysalterego', 'The Alter Ego', 'vswaysalterego', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaysalterego.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:18', '2025-04-14 18:58:18', 1),
(1039, 21, 'inativo', 'vs20loksriches', 'Loki\'s Riches', 'vs20loksriches', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20loksriches.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:19', '2025-04-14 18:58:19', 1),
(1040, 21, 'inativo', 'vs10bburger', 'Big Burger Load it up with Xtra Cheese', 'vs10bburger', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10bburger.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:19', '2025-04-14 18:58:19', 1),
(1041, 21, 'inativo', 'vs20terrorv', 'Cash Elevator', 'vs20terrorv', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20terrorv.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:19', '2025-04-14 18:58:19', 1),
(1042, 21, 'inativo', 'vs4096mystery', 'Mysterious', 'vs4096mystery', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs4096mystery.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:20', '2025-04-14 18:58:20', 1),
(1043, 21, 'inativo', 'vs10strawberry', 'Strawberry Cocktail', 'vs10strawberry', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10strawberry.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:21', '2025-04-14 18:58:21', 1),
(1044, 21, 'inativo', 'vs20ltng', 'Pinup Girls', 'vs20ltng', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20ltng.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:21', '2025-04-14 18:58:21', 1),
(1045, 21, 'inativo', 'vs5trjokers', 'Triple Jokers', 'vs5trjokers', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5trjokers.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:22', '2025-04-14 18:58:22', 1),
(1046, 21, 'inativo', 'vs20theights', 'Towering Fortunes', 'vs20theights', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20theights.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:23', '2025-04-14 18:58:23', 1),
(1047, 21, 'inativo', 'vs40mstrwild', 'Happy Hooves', 'vs40mstrwild', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs40mstrwild.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:23', '2025-04-14 18:58:23', 1),
(1048, 21, 'inativo', 'cs3irishcharms', 'Irish Charms', 'cs3irishcharms', 'Slots', NULL, 'Games/Pragmatic_Oficial/cs3irishcharms.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:23', '2025-04-14 18:58:23', 1),
(1049, 21, 'inativo', 'vs20mmmelon', 'Mighty Munching Melons', 'vs20mmmelon', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20mmmelon.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:24', '2025-04-14 18:58:24', 1),
(1050, 21, 'inativo', 'vs1024butterfly', 'Jade Butterfly', 'vs1024butterfly', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1024butterfly.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:25', '2025-04-14 18:58:25', 1),
(1051, 21, 'inativo', 'vs20eking', 'Emerald King', 'vs20eking', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20eking.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:27', '2025-04-14 18:58:27', 1),
(1052, 21, 'inativo', 'vswaystimber', 'Timber Stacks', 'vswaystimber', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswaystimber.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:28', '2025-04-14 18:58:28', 1),
(1053, 21, 'inativo', 'vswayscfglory', 'Chase For Glory', 'vswayscfglory', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayscfglory.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:28', '2025-04-14 18:58:28', 1),
(1054, 21, 'inativo', 'vs243crystalcave', 'Magic Crystals', 'vs243crystalcave', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs243crystalcave.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:29', '2025-04-14 18:58:29', 1),
(1055, 21, 'inativo', 'vs25pantherqueen', 'Panther Queen', 'vs25pantherqueen', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25pantherqueen.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:29', '2025-04-14 18:58:29', 1),
(1056, 21, 'inativo', 'vs25romeoandjuliet', 'Romeo and Juliet', 'vs25romeoandjuliet', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25romeoandjuliet.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:30', '2025-04-14 18:58:30', 1),
(1057, 21, 'inativo', 'vs1024atlantis', 'Queen of Atlantis', 'vs1024atlantis', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs1024atlantis.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:30', '2025-04-14 18:58:30', 1),
(1058, 21, 'inativo', 'vs50amt', 'Aladdin\'s Treasure', 'vs50amt', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs50amt.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:31', '2025-04-14 18:58:31', 1),
(1059, 21, 'inativo', 'vs25champ', 'The Champions', 'vs25champ', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25champ.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:31', '2025-04-14 18:58:31', 1),
(1060, 21, 'inativo', 'vs9catz', 'The Catfather', 'vs9catz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs9catz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:31', '2025-04-14 18:58:31', 1),
(1061, 21, 'inativo', 'vs13ladyofmoon', 'Lady of the Moon', 'vs13ladyofmoon', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs13ladyofmoon.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:31', '2025-04-14 18:58:31', 1),
(1062, 21, 'inativo', 'vs25dwarves', 'Dwarven Gold', 'vs25dwarves', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25dwarves.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:31', '2025-04-14 18:58:31', 1),
(1063, 21, 'inativo', 'vs20egypt', 'Tales of Egypt', 'vs20egypt', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20egypt.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:32', '2025-04-14 18:58:32', 1),
(1064, 21, 'inativo', 'vs20rome', 'Glorious Rome', 'vs20rome', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20rome.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:32', '2025-04-14 18:58:32', 1),
(1065, 21, 'inativo', 'vs9hockey', 'Hockey League Wild Match', 'vs9hockey', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs9hockey.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:32', '2025-04-14 18:58:32', 1),
(1066, 21, 'inativo', 'vs20hockey', 'Hockey League', 'vs20hockey', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20hockey.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:32', '2025-04-14 18:58:32', 1),
(1067, 21, 'inativo', 'vs10frontrun', 'Odds On Winner', 'vs10frontrun', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10frontrun.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:32', '2025-04-14 18:58:32', 1),
(1068, 21, 'inativo', 'vs20sugrux', 'Sugar Rush Xmas', 'vs20sugrux', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs20sugrux.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:33', '2025-04-14 18:58:33', 1),
(1069, 21, 'inativo', 'vs5triple8gold', '888 Gold', 'vs5triple8gold', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs5triple8gold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:33', '2025-04-14 18:58:33', 1),
(1070, 21, 'inativo', 'vs30catz', 'The Catfather Part II', 'vs30catz', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs30catz.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:34', '2025-04-14 18:58:34', 1),
(1071, 21, 'inativo', 'bjmb', 'American Blackjack', 'bjmb', 'Slots', NULL, 'Games/Pragmatic_Oficial/bjmb.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:34', '2025-04-14 18:58:34', 1),
(1072, 22, 'inativo', '1024', 'Andar Bahar', '1024', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/1024.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:58:35', '2025-07-23 12:34:04', 1),
(1073, 22, 'inativo', '114', 'Asian Games', '114', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/114.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:35', '2025-04-14 18:58:35', 1),
(1074, 22, 'inativo', '225', 'Auto Roulette', '225', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/225.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 51, 0, 1, '2025-04-14 18:58:35', '2025-09-10 17:14:53', 1),
(1075, 22, 'inativo', '266', 'Auto Roulette VIP', '266', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/266.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 15, 0, 0, '2025-04-14 18:58:35', '2025-08-10 03:18:18', 1),
(1076, 22, 'inativo', '422', 'Baccarat 3', '422', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/422.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:58:35', '2025-07-12 11:38:58', 1),
(1077, 22, 'inativo', '411', 'Baccarat 5', '411', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/411.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 10, 0, 0, '2025-04-14 18:58:36', '2025-09-04 23:19:59', 1),
(1078, 22, 'inativo', '413', 'Baccarat 6', '413', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/413.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 0, '2025-04-14 18:58:36', '2025-08-02 00:25:40', 1),
(1079, 22, 'inativo', '425', 'Baccarat 7', '425', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/425.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:58:36', '2025-07-04 16:32:52', 1),
(1080, 22, 'inativo', '436', 'Baccarat 9', '436', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/436.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2025-04-14 18:58:36', '2025-07-19 11:54:14', 1),
(1081, 1, 'inativo', '104', 'Wild Bandito', '104', 'Slots', NULL, 'Games/Pgsoft/104.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000318, 0, 0, '2025-04-14 18:58:36', '2025-09-10 16:14:49', 0),
(1082, 22, 'inativo', '1320', 'Big Bass Crash', '1320', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/1320.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 10, 0, 0, '2025-04-14 18:58:36', '2025-08-14 01:09:53', 1),
(1083, 22, 'inativo', '103', 'Blackjack Lobby', '103', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/103.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:58:36', '2025-09-04 18:48:37', 1),
(1084, 22, 'inativo', '3001', 'BlackjackX 1', '3001', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 23, 0, 0, '2025-04-14 18:58:37', '2025-09-05 02:24:17', 1),
(1085, 22, 'inativo', '3010', 'BlackjackX 10', '3010', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3010.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2025-04-14 18:58:37', '2025-08-19 23:25:26', 1),
(1086, 22, 'inativo', '3046', 'BlackjackX 11', '3046', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3046.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:58:37', '2025-08-08 15:12:52', 1),
(1087, 22, 'inativo', '3047', 'BlackjackX 12', '3047', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3047.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:37', '2025-04-14 18:58:37', 1),
(1088, 22, 'inativo', '3048', 'BlackjackX 13', '3048', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3048.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:37', '2025-04-14 18:58:37', 1),
(1089, 22, 'inativo', '3014', 'BlackjackX 14', '3014', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3014.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:37', '2025-04-14 18:58:37', 1),
(1090, 22, 'inativo', '3015', 'BlackjackX 15', '3015', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3015.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:37', '2025-04-14 18:58:37', 1),
(1091, 22, 'inativo', '3016', 'BlackjackX 16', '3016', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3016.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:38', '2025-04-14 18:58:38', 1),
(1092, 22, 'inativo', '3017', 'BlackjackX 17', '3017', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3017.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:38', '2025-04-14 18:58:38', 1),
(1093, 22, 'inativo', '3018', 'BlackjackX 18', '3018', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3018.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:38', '2025-04-14 18:58:38', 1),
(1094, 22, 'inativo', '3019', 'BlackjackX 19', '3019', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3019.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:38', '2025-04-14 18:58:38', 1),
(1095, 22, 'inativo', '3002', 'BlackjackX 2', '3002', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3002.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:38', '2025-04-14 18:58:38', 1),
(1096, 22, 'inativo', '3020', 'BlackjackX 20', '3020', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3020.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:38', '2025-04-14 18:58:38', 1),
(1097, 22, 'inativo', '3021', 'BlackjackX 21', '3021', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3021.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:38', '2025-04-14 18:58:38', 1),
(1098, 22, 'inativo', '3049', 'BlackjackX 22', '3049', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3049.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:39', '2025-04-14 18:58:39', 1),
(1099, 22, 'inativo', '3050', 'BlackjackX 23', '3050', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3050.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:39', '2025-04-14 18:58:39', 1);
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `original`) VALUES
(1100, 22, 'inativo', '3024', 'BlackjackX 24', '3024', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3024.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:39', '2025-04-14 18:58:39', 1),
(1101, 22, 'inativo', '3025', 'BlackjackX 25', '3025', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3025.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:39', '2025-04-14 18:58:39', 1),
(1102, 22, 'inativo', '3051', 'BlackjackX 26', '3051', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3051.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:39', '2025-04-14 18:58:39', 1),
(1103, 22, 'inativo', '3052', 'BlackjackX 27', '3052', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3052.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:39', '2025-04-14 18:58:39', 1),
(1104, 22, 'inativo', '3053', 'BlackjackX 28', '3053', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3053.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:39', '2025-04-14 18:58:39', 1),
(1105, 22, 'inativo', '3054', 'BlackjackX 29', '3054', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3054.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:39', '2025-04-14 18:58:39', 1),
(1106, 22, 'inativo', '3003', 'BlackjackX 3', '3003', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3003.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:40', '2025-04-14 18:58:40', 1),
(1107, 22, 'inativo', '3055', 'BlackjackX 30', '3055', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3055.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:40', '2025-04-14 18:58:40', 1),
(1108, 22, 'inativo', '3004', 'BlackjackX 4', '3004', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3004.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:58:40', '2025-09-11 02:27:55', 1),
(1109, 22, 'inativo', '3005', 'BlackjackX 5', '3005', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3005.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:40', '2025-04-14 18:58:40', 1),
(1110, 22, 'inativo', '3006', 'BlackjackX 6', '3006', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3006.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:40', '2025-04-14 18:58:40', 1),
(1111, 22, 'inativo', '3007', 'BlackjackX 7', '3007', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3007.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:40', '2025-04-14 18:58:40', 1),
(1112, 22, 'inativo', '3008', 'BlackjackX 8', '3008', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3008.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:40', '2025-04-14 18:58:40', 1),
(1113, 22, 'inativo', '3009', 'BlackjackX 9', '3009', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/3009.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:41', '2025-04-14 18:58:41', 1),
(1114, 22, 'inativo', '110', 'D&W', '110', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/110.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:41', '2025-04-14 18:58:41', 1),
(1115, 22, 'inativo', '1001', 'Dragon Tiger', '1001', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/1001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:41', '2025-04-14 18:58:41', 1),
(1116, 22, 'inativo', '434', 'Fortune 6 Baccarat', '434', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/434.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:41', '2025-04-14 18:58:41', 1),
(1117, 22, 'inativo', '105', 'Gameshows', '105', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/105.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:41', '2025-04-14 18:58:41', 1),
(1118, 22, 'inativo', '2201', 'High Flyer', '2201', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/2201.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2025-04-14 18:58:41', '2025-07-10 22:58:49', 1),
(1119, 22, 'inativo', '101', 'Live Casino Lobby', '101', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/101.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:41', '2025-04-14 18:58:41', 1),
(1120, 22, 'inativo', '211', 'Lucky 6 Roulette', '211', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/211.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:42', '2025-04-14 22:03:55', 1),
(1121, 22, 'inativo', '211a1', 'Lucky 6 Roulette', '211a1', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/211a1.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:42', '2025-04-14 22:07:44', 1),
(1122, 22, 'inativo', '442', 'Mega Baccarat', '442', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/442.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:42', '2025-04-14 18:58:42', 1),
(1123, 22, 'inativo', '2101', 'Mega Sic Bac', '2101', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/2101.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:42', '2025-04-14 18:58:42', 1),
(1125, 22, 'inativo', '801', 'Mega Wheel', '801', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/801.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 19, 0, 1, '2025-04-14 18:58:42', '2025-08-17 01:16:06', 1),
(1126, 22, 'inativo', '111', 'Other Promos', '111', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/111.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:43', '2025-04-14 21:56:45', 1),
(1127, 22, 'inativo', '123', 'Power Ball', '123', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/123.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:58:43', '2025-08-05 09:12:17', 1),
(1128, 22, 'inativo', '240', 'PowerUP Roulette', '240', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/240.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:58:43', '2025-04-14 22:07:41', 1),
(1129, 22, 'inativo', '454', 'Privé Lounge Baccarat 1', '454', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/454.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:43', '2025-04-14 18:58:43', 1),
(1130, 22, 'inativo', '455', 'Privé Lounge Baccarat 2', '455', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/455.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:43', '2025-04-14 18:58:43', 1),
(1131, 22, 'inativo', '456', 'Privé Lounge Baccarat 3', '456', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/456.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:44', '2025-04-14 18:58:44', 1),
(1132, 22, 'inativo', '458', 'Privé Lounge Baccarat 5', '458', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/458.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:44', '2025-04-14 18:58:44', 1),
(1133, 22, 'inativo', '466', 'Privé Lounge Baccarat 6', '466', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/466.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:44', '2025-04-14 18:58:44', 1),
(1134, 22, 'inativo', '467', 'Privé Lounge Baccarat 7', '467', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/467.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:44', '2025-04-14 18:58:44', 1),
(1135, 22, 'inativo', '468', 'Privé Lounge Baccarat 8', '468', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/468.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:44', '2025-04-14 18:58:44', 1),
(1136, 22, 'inativo', '457', 'Privé Lounge Baccarat 9', '457', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/457.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:45', '2025-04-14 18:58:45', 1),
(1137, 22, 'inativo', '227', 'Roulette 1', '227', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/227.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:45', '2025-04-14 22:07:38', 1),
(1138, 22, 'inativo', '230', 'Roulette 3', '230', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/230.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 8, 0, 0, '2025-04-14 18:58:45', '2025-09-09 17:44:00', 1),
(1139, 22, 'inativo', '102', 'Roulette Lobby', '102', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/102.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:45', '2025-04-14 22:07:33', 1),
(1140, 22, 'inativo', '109', 'Sic Bo & Dragon Tiger', '109', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/109.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:45', '2025-04-14 18:58:45', 1),
(1141, 22, 'inativo', '711', 'Sicbo', '711', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/711.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2025-04-14 18:58:45', '2025-09-10 16:21:06', 1),
(1142, 22, 'inativo', '1601', 'Snake & Ladders Live', '1601', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/1601.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:45', '2025-04-14 18:58:45', 1),
(1143, 22, 'inativo', '1301', 'Spaceman', '1301', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/1301.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 25, 0, 0, '2025-04-14 18:58:46', '2025-09-04 23:42:17', 1),
(1144, 22, 'inativo', '226', 'Speed Auto Roulette', '226', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/226.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:46', '2025-04-14 22:07:30', 1),
(1145, 22, 'inativo', '428', 'Speed Baccarat 10', '428', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/428.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:46', '2025-04-14 18:58:46', 1),
(1146, 22, 'inativo', '424', 'Speed Baccarat 11', '424', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/424.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:46', '2025-04-14 18:58:46', 1),
(1147, 22, 'inativo', '421', 'Speed Baccarat 12', '421', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/421.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:46', '2025-04-14 18:58:46', 1),
(1148, 22, 'inativo', '438', 'Speed Baccarat 13', '438', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/438.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:46', '2025-04-14 18:58:46', 1),
(1149, 22, 'inativo', '427', 'Speed Baccarat 15', '427', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/427.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:47', '2025-04-14 18:58:47', 1),
(1150, 22, 'inativo', '435', 'Speed Baccarat 16', '435', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/435.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:47', '2025-04-14 18:58:47', 1),
(1151, 22, 'inativo', '439', 'Speed Baccarat 17', '439', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/439.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:47', '2025-04-14 18:58:47', 1),
(1152, 22, 'inativo', '403', 'Speed Baccarat 2', '403', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/403.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:47', '2025-04-14 18:58:47', 1),
(1153, 22, 'inativo', '412', 'Speed Baccarat 3', '412', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/412.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:47', '2025-04-14 18:58:47', 1),
(1154, 22, 'inativo', '414', 'Speed Baccarat 5', '414', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/414.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:47', '2025-04-14 18:58:47', 1),
(1155, 22, 'inativo', '415', 'Speed Baccarat 6', '415', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/415.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:47', '2025-04-14 18:58:47', 1),
(1156, 22, 'inativo', '431', 'Speed Baccarat 7', '431', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/431.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:47', '2025-04-14 18:58:47', 1),
(1157, 22, 'inativo', '432', 'Speed Baccarat 8', '432', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/432.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:47', '2025-04-14 18:58:47', 1),
(1158, 22, 'inativo', '430', 'Speed Baccarat 9', '430', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/430.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:48', '2025-04-14 18:58:48', 1),
(1159, 22, 'inativo', '433', 'Super 8 Baccarat', '433', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/433.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:48', '2025-04-14 18:58:48', 1),
(1160, 22, 'inativo', '1101', 'Sweet Bonanza CandyLand', '1101', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/1101.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:48', '2025-04-14 18:58:48', 1),
(1161, 22, 'inativo', '426', 'Turbo Baccarat', '426', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/426.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:48', '2025-04-14 18:58:48', 1),
(1162, 22, 'inativo', '545', 'VIP Roulette', '545', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/545.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:48', '2025-04-14 22:07:27', 1),
(1163, 22, 'inativo', '1501', 'Vegas Ball Bonanza', '1501', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/1501.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:58:48', '2025-04-14 20:46:30', 1),
(1164, 21, 'inativo', 'bca', 'Baccarat', 'bca', 'Slots', NULL, 'Games/Pragmatic_Oficial/bca.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:50', '2025-04-14 18:58:50', 1),
(1165, 21, 'inativo', 'bjma', 'Multihand Blackjack', 'bjma', 'Slots', NULL, 'Games/Pragmatic_Oficial/bjma.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:50', '2025-04-14 18:58:50', 1),
(1166, 21, 'inativo', 'scwolfgold', 'Wolf Gold 1 Million', 'scwolfgold', 'Slots', NULL, 'Games/Pragmatic_Oficial/scwolfgold.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:50', '2025-04-14 18:58:50', 1),
(1167, 21, 'inativo', 'scqog', 'Queen of Gold 100,000', 'scqog', 'Slots', NULL, 'Games/Pragmatic_Oficial/scqog.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:50', '2025-04-14 18:58:50', 1),
(1168, 21, 'inativo', 'scpanda', 'Panda Gold 10,000', 'scpanda', 'Slots', NULL, 'Games/Pragmatic_Oficial/scpanda.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:50', '2025-04-14 18:58:50', 1),
(1169, 21, 'inativo', 'scsafari', 'Hot Safari 50,000', 'scsafari', 'Slots', NULL, 'Games/Pragmatic_Oficial/scsafari.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:50', '2025-04-14 18:58:50', 1),
(1170, 21, 'inativo', 'scgoldrush', 'Gold Rush 250,000', 'scgoldrush', 'Slots', NULL, 'Games/Pragmatic_Oficial/scgoldrush.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:50', '2025-04-14 18:58:50', 1),
(1171, 21, 'inativo', 'scdiamond', 'Diamond Strike 100,000', 'scdiamond', 'Slots', NULL, 'Games/Pragmatic_Oficial/scdiamond.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:51', '2025-04-14 18:58:51', 1),
(1172, 21, 'inativo', 'sc7piggies', '7 Piggies 5,000', 'sc7piggies', 'Slots', NULL, 'Games/Pragmatic_Oficial/sc7piggies.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:51', '2025-04-14 18:58:51', 1),
(1173, 21, 'inativo', 'vs10hottb7fs', 'Hot to Burn 7 Deadly Free Spins', 'vs10hottb7fs', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs10hottb7fs.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:51', '2025-04-14 18:58:51', 1),
(1174, 21, 'inativo', 'vswayscongcash', 'Congo Cash XL', 'vswayscongcash', 'Slots', NULL, 'Games/Pragmatic_Oficial/vswayscongcash.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:51', '2025-04-14 18:58:51', 1),
(1175, 21, 'inativo', 'rla', 'Roulette', 'rla', 'Slots', NULL, 'Games/Pragmatic_Oficial/rla.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:51', '2025-04-14 22:07:24', 1),
(1176, 21, 'inativo', 'vpa', 'Jacks or Better', 'vpa', 'Slots', NULL, 'Games/Pragmatic_Oficial/vpa.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:51', '2025-04-14 18:58:51', 1),
(1177, 21, 'inativo', 'vs25kingdomsnojp', '3 Kingdoms - Battle of Red Cliffs', 'vs25kingdomsnojp', 'Slots', NULL, 'Games/Pragmatic_Oficial/vs25kingdomsnojp.webp', '0', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:51', '2025-04-14 18:58:51', 1),
(1178, 22, 'inativo', '210', 'Auto Mega Roulette', '210', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/210.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2025-04-14 18:58:52', '2025-08-14 00:57:01', 1),
(1179, 22, 'inativo', '401', 'Baccarat 1', '401', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/401.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 7, 0, 1, '2025-04-14 18:58:52', '2025-09-05 19:03:39', 1),
(1180, 22, 'inativo', '404', 'Baccarat 2', '404', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/404.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:52', '2025-04-14 18:58:52', 1),
(1181, 22, 'inativo', '108', 'Dragon Tiger', '108', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/108.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:52', '2025-04-14 18:58:52', 1),
(1182, 22, 'inativo', '204', 'Mega Roulette', '204', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/204.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:52', '2025-04-14 22:07:19', 1),
(1183, 22, 'inativo', '201', 'Roulette 2', '201', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/201.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:58:53', '2025-04-14 22:07:16', 1),
(1184, 22, 'inativo', '206', 'Roulette Macao', '206', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/206.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:53', '2025-04-14 22:07:14', 1),
(1185, 22, 'inativo', '107', 'Sic Bo', '107', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/107.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:53', '2025-04-14 18:58:53', 1),
(1186, 22, 'inativo', '402', 'Speed Baccarat 1', '402', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/402.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:53', '2025-04-14 18:58:53', 1),
(1187, 22, 'inativo', '405', 'Speed Baccarat 14', '405', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/405.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:53', '2025-04-14 18:58:53', 1),
(1188, 22, 'inativo', '203', 'Speed Roulette 1', '203', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/203.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:58:53', '2025-07-23 12:23:52', 1),
(1189, 22, 'inativo', '205', 'Speed Roulette 2', '205', 'Ao vivo', NULL, 'Games/Pragmatic_Oficial/205.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:58:53', '2025-04-14 22:07:08', 1),
(1190, 23, 'inativo', '12959', 'Stock Market', '12959', 'Ao vivo', NULL, 'Games/Evolution_Original/12959.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:58:53', '2025-04-14 20:27:22', 1),
(1191, 23, 'inativo', '9690', 'Video Poker', '9690', 'Ao vivo', NULL, 'Games/Evolution_Original/9690.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:53', '2025-04-14 18:58:53', 1),
(1192, 23, 'inativo', '9689', 'EVO PowerBall', '9689', 'Ao vivo', NULL, 'Games/Evolution_Original/9689.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:54', '2025-04-14 18:58:54', 1),
(1193, 23, 'inativo', '9686', 'Emperor Bac Bo', '9686', 'Ao vivo', NULL, 'Games/Evolution_Original/9686.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:58:54', '2025-04-14 20:27:28', 1),
(1194, 23, 'inativo', '9685', 'First Person XXXtreme Lightning Roulette', '9685', 'Ao vivo', NULL, 'Games/Evolution_Original/9685.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:54', '2025-04-14 22:07:05', 1),
(1195, 23, 'inativo', '9682', 'Funky Time', '9682', 'Ao vivo', NULL, 'Games/Evolution_Original/9682.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:54', '2025-04-14 18:58:54', 1),
(1196, 23, 'inativo', '9681', 'Hippodrome Grand Casino', '9681', 'Ao vivo', NULL, 'Games/Evolution_Original/9681.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:54', '2025-04-14 18:58:54', 1),
(1197, 23, 'inativo', '9680', 'Dragonara Roulette', '9680', 'Ao vivo', NULL, 'Games/Evolution_Original/9680.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:54', '2025-04-14 22:07:02', 1),
(1198, 23, 'inativo', '9679', 'Casino Malta Roulette', '9679', 'Ao vivo', NULL, 'Games/Evolution_Original/9679.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:54', '2025-04-14 22:06:59', 1),
(1199, 23, 'inativo', '9674', 'Thai Speed Baccarat A', '9674', 'Ao vivo', NULL, 'Games/Evolution_Original/9674.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:54', '2025-04-14 18:58:54', 1),
(1200, 23, 'inativo', '9665', 'Punto Banco', '9665', 'Ao vivo', NULL, 'Games/Evolution_Original/9665.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:54', '2025-04-14 18:58:54', 1),
(1201, 23, 'inativo', '9663', 'Mega Bola', '9663', 'Ao vivo', NULL, 'Games/Evolution_Original/9663.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:55', '2025-04-14 18:58:55', 1),
(1202, 23, 'inativo', '9662', 'Lotus Speed Baccarat A', '9662', 'Ao vivo', NULL, 'Games/Evolution_Original/9662.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:55', '2025-04-14 18:58:55', 1),
(1203, 23, 'inativo', '9661', 'Lotus Roulette', '9661', 'Ao vivo', NULL, 'Games/Evolution_Original/9661.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:55', '2025-04-14 22:06:57', 1),
(1204, 23, 'inativo', '9655', 'Hindi Speed Baccarat A', '9655', 'Ao vivo', NULL, 'Games/Evolution_Original/9655.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:55', '2025-04-14 18:58:55', 1),
(1205, 23, 'inativo', '9654', 'Hindi Roulette', '9654', 'Ao vivo', NULL, 'Games/Evolution_Original/9654.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:55', '2025-04-14 22:06:53', 1),
(1206, 23, 'inativo', '9653', 'Hindi Lightning Roulette', '9653', 'Ao vivo', NULL, 'Games/Evolution_Original/9653.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:55', '2025-04-14 22:06:50', 1),
(1207, 23, 'inativo', '9649', 'First Person Deal or No Deal', '9649', 'Ao vivo', NULL, 'Games/Evolution_Original/9649.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:55', '2025-04-14 18:58:55', 1),
(1208, 23, 'inativo', '9635', 'Emperor Speed Baccarat D', '9635', 'Ao vivo', NULL, 'Games/Evolution_Original/9635.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:56', '2025-04-14 18:58:56', 1),
(1209, 23, 'inativo', '9634', 'Emperor Sic Bo A', '9634', 'Ao vivo', NULL, 'Games/Evolution_Original/9634.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:56', '2025-04-14 18:58:56', 1),
(1210, 23, 'inativo', '9632', 'Imperial Quest', '9632', 'Ao vivo', NULL, 'Games/Evolution_Original/9632.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:56', '2025-04-14 18:58:56', 1),
(1211, 23, 'inativo', '9631', 'Blackjack VIP 29', '9631', 'Ao vivo', NULL, 'Games/Evolution_Original/9631.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:56', '2025-04-14 18:58:56', 1),
(1212, 23, 'inativo', '9630', 'Blackjack VIP 28', '9630', 'Ao vivo', NULL, 'Games/Evolution_Original/9630.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:56', '2025-04-14 18:58:56', 1),
(1213, 23, 'inativo', '9628', 'Speed Baccarat 3', '9628', 'Ao vivo', NULL, 'Games/Evolution_Original/9628.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:56', '2025-04-14 18:58:56', 1),
(1214, 23, 'inativo', '9627', 'Speed Baccarat 2', '9627', 'Ao vivo', NULL, 'Games/Evolution_Original/9627.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:56', '2025-04-14 18:58:56', 1),
(1215, 23, 'inativo', '9626', 'Speed Baccarat 1', '9626', 'Ao vivo', NULL, 'Games/Evolution_Original/9626.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:57', '2025-04-14 18:58:57', 1),
(1216, 23, 'inativo', '9625', 'Speed Baccarat Z', '9625', 'Ao vivo', NULL, 'Games/Evolution_Original/9625.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:57', '2025-04-14 18:58:57', 1),
(1217, 23, 'inativo', '9624', 'Crazy Time A', '9624', 'Ao vivo', NULL, 'Games/Evolution_Original/9624.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 35, 0, 1, '2025-04-14 18:58:57', '2025-09-04 23:20:18', 1),
(1218, 23, 'inativo', '9610', 'Roleta Ao Vivo', '9610', 'Ao vivo', NULL, 'Games/Evolution_Original/9610.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:58:57', '2025-09-09 17:43:29', 1),
(1219, 23, 'inativo', '9609', 'Korean Speed Baccarat C', '9609', 'Ao vivo', NULL, 'Games/Evolution_Original/9609.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:57', '2025-04-14 18:58:57', 1),
(1220, 23, 'inativo', '9608', 'Korean Speed Baccarat B', '9608', 'Ao vivo', NULL, 'Games/Evolution_Original/9608.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:57', '2025-04-14 18:58:57', 1),
(1221, 23, 'inativo', '9606', 'Speed Baccarat X', '9606', 'Ao vivo', NULL, 'Games/Evolution_Original/9606.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:57', '2025-04-14 18:58:57', 1),
(1222, 23, 'inativo', '9605', 'Speed Baccarat W', '9605', 'Ao vivo', NULL, 'Games/Evolution_Original/9605.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:58', '2025-04-14 18:58:58', 1),
(1223, 23, 'inativo', '9604', 'Speed Baccarat V', '9604', 'Ao vivo', NULL, 'Games/Evolution_Original/9604.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:58', '2025-04-14 18:58:58', 1),
(1224, 23, 'inativo', '9603', 'Speed Baccarat U', '9603', 'Ao vivo', NULL, 'Games/Evolution_Original/9603.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:58', '2025-04-14 18:58:58', 1),
(1225, 23, 'inativo', '9602', 'Speed Baccarat T', '9602', 'Ao vivo', NULL, 'Games/Evolution_Original/9602.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:58', '2025-04-14 18:58:58', 1),
(1226, 23, 'inativo', '9600', 'First Person Lightning Baccarat', '9600', 'Ao vivo', NULL, 'Games/Evolution_Original/9600.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:58', '2025-04-14 18:58:58', 1),
(1227, 23, 'inativo', '9599', 'First Person Golden Wealth Baccarat', '9599', 'Ao vivo', NULL, 'Games/Evolution_Original/9599.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:58', '2025-04-14 18:58:58', 1),
(1228, 23, 'inativo', '9598', 'Golden Wealth Baccarat', '9598', 'Ao vivo', NULL, 'Games/Evolution_Original/9598.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:58', '2025-04-14 18:58:58', 1),
(1229, 23, 'inativo', '9597', 'Fan Tan', '9597', 'Ao vivo', NULL, 'Games/Evolution_Original/9597.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:59', '2025-04-14 18:58:59', 1),
(1230, 23, 'inativo', '9596', 'Cash Or Crash', '9596', 'Ao vivo', NULL, 'Games/Evolution_Original/9596.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:59', '2025-04-14 18:58:59', 1),
(1231, 23, 'inativo', '9585', 'Korean Speed Baccarat A', '9585', 'Ao vivo', NULL, 'Games/Evolution_Original/9585.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:59', '2025-04-14 18:58:59', 1),
(1232, 23, 'inativo', '9584', 'Emperor Roulette', '9584', 'Ao vivo', NULL, 'Games/Evolution_Original/9584.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:59', '2025-04-14 22:06:47', 1),
(1233, 23, 'inativo', '9577', 'XXXTreme Lightning Roulette', '9577', 'Ao vivo', NULL, 'Games/Evolution_Original/9577.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 1, '2025-04-14 18:58:59', '2025-09-10 16:21:31', 1),
(1234, 23, 'inativo', '9567', 'Speed Auto Roulette', '9567', 'Ao vivo', NULL, 'Games/Evolution_Original/9567.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:59', '2025-04-14 22:06:42', 1),
(1235, 23, 'inativo', '9560', 'Blackjack Diamond VIP', '9560', 'Ao vivo', NULL, 'Games/Evolution_Original/9560.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:59', '2025-04-14 18:58:59', 1),
(1236, 23, 'inativo', '9559', 'Blackjack Grand VIP', '9559', 'Ao vivo', NULL, 'Games/Evolution_Original/9559.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:59', '2025-04-14 18:58:59', 1),
(1237, 23, 'inativo', '9558', 'Blackjack Fortune VIP', '9558', 'Ao vivo', NULL, 'Games/Evolution_Original/9558.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:58:59', '2025-04-14 18:58:59', 1),
(1238, 23, 'inativo', '9557', 'Blackjack Platinum VIP', '9557', 'Ao vivo', NULL, 'Games/Evolution_Original/9557.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1239, 23, 'inativo', '9556', 'Speed VIP Blackjack D', '9556', 'Ao vivo', NULL, 'Games/Evolution_Original/9556.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1240, 23, 'inativo', '9555', 'Speed VIP Blackjack C', '9555', 'Ao vivo', NULL, 'Games/Evolution_Original/9555.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1241, 23, 'inativo', '9554', 'Speed VIP Blackjack B', '9554', 'Ao vivo', NULL, 'Games/Evolution_Original/9554.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1242, 23, 'inativo', '9553', 'Speed VIP Blackjack A', '9553', 'Ao vivo', NULL, 'Games/Evolution_Original/9553.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1243, 23, 'inativo', '9546', 'Blackjack VIP 16', '9546', 'Ao vivo', NULL, 'Games/Evolution_Original/9546.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1244, 23, 'inativo', '9545', 'Blackjack VIP 15', '9545', 'Ao vivo', NULL, 'Games/Evolution_Original/9545.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1245, 23, 'inativo', '9544', 'Blackjack VIP 14', '9544', 'Ao vivo', NULL, 'Games/Evolution_Original/9544.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1246, 23, 'inativo', '9543', 'Blackjack VIP 13', '9543', 'Ao vivo', NULL, 'Games/Evolution_Original/9543.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1247, 23, 'inativo', '9542', 'Blackjack VIP 12', '9542', 'Ao vivo', NULL, 'Games/Evolution_Original/9542.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1248, 23, 'inativo', '9541', 'Blackjack VIP 11', '9541', 'Ao vivo', NULL, 'Games/Evolution_Original/9541.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1249, 23, 'inativo', '9540', 'Blackjack VIP 10', '9540', 'Ao vivo', NULL, 'Games/Evolution_Original/9540.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1250, 23, 'inativo', '9539', 'Blackjack VIP 9', '9539', 'Ao vivo', NULL, 'Games/Evolution_Original/9539.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1251, 23, 'inativo', '9538', 'Blackjack VIP 22', '9538', 'Ao vivo', NULL, 'Games/Evolution_Original/9538.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1252, 23, 'inativo', '9537', 'Blackjack VIP 21', '9537', 'Ao vivo', NULL, 'Games/Evolution_Original/9537.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1253, 23, 'inativo', '9536', 'Blackjack VIP 20', '9536', 'Ao vivo', NULL, 'Games/Evolution_Original/9536.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1254, 23, 'inativo', '9535', 'Speed VIP Blackjack J', '9535', 'Ao vivo', NULL, 'Games/Evolution_Original/9535.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1255, 23, 'inativo', '9534', 'Speed VIP Blackjack I', '9534', 'Ao vivo', NULL, 'Games/Evolution_Original/9534.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1256, 23, 'inativo', '9533', 'Speed VIP Blackjack H', '9533', 'Ao vivo', NULL, 'Games/Evolution_Original/9533.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1257, 23, 'inativo', '9532', 'Bac Bo', '9532', 'Ao vivo', NULL, 'Games/Evolution_Original/9532.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 27, 0, 1, '2025-04-14 18:59:00', '2025-09-05 01:16:04', 1),
(1258, 23, 'inativo', '9531', 'Emperor Sic Bo', '9531', 'Ao vivo', NULL, 'Games/Evolution_Original/9531.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1259, 23, 'inativo', '9530', 'Emperor Speed Baccarat C', '9530', 'Ao vivo', NULL, 'Games/Evolution_Original/9530.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1260, 23, 'inativo', '9529', 'Emperor Dragon Tiger', '9529', 'Ao vivo', NULL, 'Games/Evolution_Original/9529.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1261, 23, 'inativo', '9528', 'Emperor Speed Baccarat B', '9528', 'Ao vivo', NULL, 'Games/Evolution_Original/9528.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1262, 23, 'inativo', '9527', 'Emperor Speed Baccarat A', '9527', 'Ao vivo', NULL, 'Games/Evolution_Original/9527.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:00', '2025-04-14 18:59:00', 1),
(1263, 23, 'inativo', '9526', 'Blackjack VIP 19', '9526', 'Ao vivo', NULL, 'Games/Evolution_Original/9526.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1264, 23, 'inativo', '9525', 'Blackjack VIP 18', '9525', 'Ao vivo', NULL, 'Games/Evolution_Original/9525.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1265, 23, 'inativo', '9524', 'Blackjack VIP 17', '9524', 'Ao vivo', NULL, 'Games/Evolution_Original/9524.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1266, 23, 'inativo', '9523', 'Speed VIP Blackjack G', '9523', 'Ao vivo', NULL, 'Games/Evolution_Original/9523.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1267, 23, 'inativo', '9522', 'Speed VIP Blackjack F', '9522', 'Ao vivo', NULL, 'Games/Evolution_Original/9522.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1268, 23, 'inativo', '9521', 'Speed VIP Blackjack E', '9521', 'Ao vivo', NULL, 'Games/Evolution_Original/9521.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1269, 23, 'inativo', '9520', 'First Person Lightning Blackjack', '9520', 'Ao vivo', NULL, 'Games/Evolution_Original/9520.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1270, 23, 'inativo', '9519', 'Lightning Blackjack', '9519', 'Ao vivo', NULL, 'Games/Evolution_Original/9519.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:01', '2025-04-14 20:26:54', 1),
(1271, 23, 'inativo', '9518', 'Blackjack VIP 8', '9518', 'Ao vivo', NULL, 'Games/Evolution_Original/9518.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1272, 23, 'inativo', '9517', 'Blackjack VIP 7', '9517', 'Ao vivo', NULL, 'Games/Evolution_Original/9517.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1273, 23, 'inativo', '9516', 'Blackjack VIP 6', '9516', 'Ao vivo', NULL, 'Games/Evolution_Original/9516.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1274, 23, 'inativo', '9515', 'Blackjack VIP 5', '9515', 'Ao vivo', NULL, 'Games/Evolution_Original/9515.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1275, 23, 'inativo', '9514', 'Blackjack VIP 4', '9514', 'Ao vivo', NULL, 'Games/Evolution_Original/9514.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1276, 23, 'inativo', '9513', 'Blackjack VIP 3', '9513', 'Ao vivo', NULL, 'Games/Evolution_Original/9513.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1277, 23, 'inativo', '9512', 'Blackjack VIP 2', '9512', 'Ao vivo', NULL, 'Games/Evolution_Original/9512.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1278, 23, 'inativo', '9511', 'Blackjack VIP 1', '9511', 'Ao vivo', NULL, 'Games/Evolution_Original/9511.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1279, 23, 'inativo', '9482', 'Peek Baccarat', '9482', 'Ao vivo', NULL, 'Games/Evolution_Original/9482.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1280, 23, 'inativo', '9481', 'No Commission Baccarat', '9481', 'Ao vivo', NULL, 'Games/Evolution_Original/9481.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1281, 23, 'inativo', '9480', 'No Commission Speed Baccarat C', '9480', 'Ao vivo', NULL, 'Games/Evolution_Original/9480.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1282, 23, 'inativo', '9479', 'No Commission Speed Baccarat B', '9479', 'Ao vivo', NULL, 'Games/Evolution_Original/9479.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1283, 23, 'inativo', '9478', 'No Commission Speed Baccarat A', '9478', 'Ao vivo', NULL, 'Games/Evolution_Original/9478.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1284, 23, 'inativo', '9477', 'Speed Baccarat S', '9477', 'Ao vivo', NULL, 'Games/Evolution_Original/9477.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1285, 23, 'inativo', '9476', 'Speed Baccarat R', '9476', 'Ao vivo', NULL, 'Games/Evolution_Original/9476.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1286, 23, 'inativo', '9475', 'Speed Baccarat Q', '9475', 'Ao vivo', NULL, 'Games/Evolution_Original/9475.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1287, 23, 'inativo', '9474', 'Speed Baccarat P', '9474', 'Ao vivo', NULL, 'Games/Evolution_Original/9474.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1288, 23, 'inativo', '9473', 'Speed Baccarat O', '9473', 'Ao vivo', NULL, 'Games/Evolution_Original/9473.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1289, 23, 'inativo', '9472', 'Speed Baccarat N', '9472', 'Ao vivo', NULL, 'Games/Evolution_Original/9472.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1290, 23, 'inativo', '9471', 'Speed Baccarat M', '9471', 'Ao vivo', NULL, 'Games/Evolution_Original/9471.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1291, 23, 'inativo', '9470', 'Speed Baccarat L', '9470', 'Ao vivo', NULL, 'Games/Evolution_Original/9470.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1292, 23, 'inativo', '9469', 'Speed Baccarat K', '9469', 'Ao vivo', NULL, 'Games/Evolution_Original/9469.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1293, 23, 'inativo', '9468', 'Speed Baccarat J', '9468', 'Ao vivo', NULL, 'Games/Evolution_Original/9468.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1294, 23, 'inativo', '9467', 'Speed Baccarat I', '9467', 'Ao vivo', NULL, 'Games/Evolution_Original/9467.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1295, 23, 'inativo', '9466', 'Speed Baccarat H', '9466', 'Ao vivo', NULL, 'Games/Evolution_Original/9466.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1296, 23, 'inativo', '9465', 'Speed Baccarat G', '9465', 'Ao vivo', NULL, 'Games/Evolution_Original/9465.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1297, 23, 'inativo', '9464', 'Speed Baccarat F', '9464', 'Ao vivo', NULL, 'Games/Evolution_Original/9464.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1298, 23, 'inativo', '9463', 'Speed Baccarat E', '9463', 'Ao vivo', NULL, 'Games/Evolution_Original/9463.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1299, 23, 'inativo', '9462', 'Speed Baccarat D', '9462', 'Ao vivo', NULL, 'Games/Evolution_Original/9462.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1300, 23, 'inativo', '9461', 'Speed Baccarat C', '9461', 'Ao vivo', NULL, 'Games/Evolution_Original/9461.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:01', '2025-04-14 18:59:01', 1),
(1301, 23, 'inativo', '9460', 'Speed Baccarat B', '9460', 'Ao vivo', NULL, 'Games/Evolution_Original/9460.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1302, 23, 'inativo', '9459', 'Speed Baccarat A', '9459', 'Ao vivo', NULL, 'Games/Evolution_Original/9459.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1303, 23, 'inativo', '9457', 'Speed Roulette', '9457', 'Ao vivo', NULL, 'Games/Evolution_Original/9457.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 22:06:38', 1),
(1304, 23, 'inativo', '9456', 'Speed Blackjack M', '9456', 'Ao vivo', NULL, 'Games/Evolution_Original/9456.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1305, 23, 'inativo', '9455', 'Speed Blackjack L', '9455', 'Ao vivo', NULL, 'Games/Evolution_Original/9455.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1306, 23, 'inativo', '9454', 'Speed Blackjack K', '9454', 'Ao vivo', NULL, 'Games/Evolution_Original/9454.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1307, 23, 'inativo', '9453', 'Speed Blackjack J', '9453', 'Ao vivo', NULL, 'Games/Evolution_Original/9453.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1308, 23, 'inativo', '9452', 'Speed Blackjack I', '9452', 'Ao vivo', NULL, 'Games/Evolution_Original/9452.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1309, 23, 'inativo', '9451', 'Speed Blackjack H', '9451', 'Ao vivo', NULL, 'Games/Evolution_Original/9451.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1310, 23, 'inativo', '9450', 'Speed Blackjack G', '9450', 'Ao vivo', NULL, 'Games/Evolution_Original/9450.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1311, 23, 'inativo', '9449', 'Speed Blackjack E', '9449', 'Ao vivo', NULL, 'Games/Evolution_Original/9449.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1312, 23, 'inativo', '9448', 'Speed Blackjack D', '9448', 'Ao vivo', NULL, 'Games/Evolution_Original/9448.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1313, 23, 'inativo', '9446', 'Grand Casino Roulette', '9446', 'Ao vivo', NULL, 'Games/Evolution_Original/9446.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2025-04-14 18:59:02', '2025-07-28 15:19:08', 1),
(1314, 23, 'inativo', '9445', 'First Person Lightning Roulette', '9445', 'Ao vivo', NULL, 'Games/Evolution_Original/9445.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 22:06:33', 1),
(1315, 23, 'inativo', '9410', 'Blackjack VIP Z', '9410', 'Ao vivo', NULL, 'Games/Evolution_Original/9410.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1316, 23, 'inativo', '9409', 'Blackjack VIP X', '9409', 'Ao vivo', NULL, 'Games/Evolution_Original/9409.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1317, 23, 'inativo', '9408', 'Blackjack VIP V', '9408', 'Ao vivo', NULL, 'Games/Evolution_Original/9408.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1318, 23, 'inativo', '9407', 'Blackjack VIP U', '9407', 'Ao vivo', NULL, 'Games/Evolution_Original/9407.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1319, 23, 'inativo', '9406', 'Blackjack VIP T', '9406', 'Ao vivo', NULL, 'Games/Evolution_Original/9406.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1320, 23, 'inativo', '9405', 'Blackjack VIP S', '9405', 'Ao vivo', NULL, 'Games/Evolution_Original/9405.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1321, 23, 'inativo', '9404', 'Blackjack VIP R', '9404', 'Ao vivo', NULL, 'Games/Evolution_Original/9404.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1322, 23, 'inativo', '9403', 'Blackjack VIP Q', '9403', 'Ao vivo', NULL, 'Games/Evolution_Original/9403.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1323, 23, 'inativo', '9402', 'Blackjack VIP P', '9402', 'Ao vivo', NULL, 'Games/Evolution_Original/9402.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1324, 23, 'inativo', '9401', 'Blackjack VIP O', '9401', 'Ao vivo', NULL, 'Games/Evolution_Original/9401.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1325, 23, 'inativo', '9400', 'Blackjack VIP N', '9400', 'Ao vivo', NULL, 'Games/Evolution_Original/9400.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1326, 23, 'inativo', '9399', 'Blackjack VIP M', '9399', 'Ao vivo', NULL, 'Games/Evolution_Original/9399.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1327, 23, 'inativo', '9398', 'Blackjack VIP L', '9398', 'Ao vivo', NULL, 'Games/Evolution_Original/9398.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1328, 23, 'inativo', '9397', 'Blackjack VIP K', '9397', 'Ao vivo', NULL, 'Games/Evolution_Original/9397.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1329, 23, 'inativo', '9396', 'Blackjack VIP J', '9396', 'Ao vivo', NULL, 'Games/Evolution_Original/9396.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1);
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `original`) VALUES
(1330, 23, 'inativo', '9395', 'Blackjack VIP I', '9395', 'Ao vivo', NULL, 'Games/Evolution_Original/9395.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1331, 23, 'inativo', '9394', 'Blackjack VIP H', '9394', 'Ao vivo', NULL, 'Games/Evolution_Original/9394.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1332, 23, 'inativo', '9393', 'Blackjack VIP Gamma', '9393', 'Ao vivo', NULL, 'Games/Evolution_Original/9393.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1333, 23, 'inativo', '9392', 'Blackjack VIP G', '9392', 'Ao vivo', NULL, 'Games/Evolution_Original/9392.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:02', '2025-04-14 18:59:02', 1),
(1334, 23, 'inativo', '9391', 'Blackjack VIP F', '9391', 'Ao vivo', NULL, 'Games/Evolution_Original/9391.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1335, 23, 'inativo', '9390', 'Blackjack VIP E', '9390', 'Ao vivo', NULL, 'Games/Evolution_Original/9390.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1336, 23, 'inativo', '9389', 'Blackjack VIP D', '9389', 'Ao vivo', NULL, 'Games/Evolution_Original/9389.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1337, 23, 'inativo', '9388', 'Blackjack VIP C', '9388', 'Ao vivo', NULL, 'Games/Evolution_Original/9388.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1338, 23, 'inativo', '9387', 'Blackjack VIP Beta', '9387', 'Ao vivo', NULL, 'Games/Evolution_Original/9387.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1339, 23, 'inativo', '9386', 'Blackjack VIP Alpha', '9386', 'Ao vivo', NULL, 'Games/Evolution_Original/9386.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1340, 23, 'inativo', '9385', 'Blackjack Silver G', '9385', 'Ao vivo', NULL, 'Games/Evolution_Original/9385.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1341, 23, 'inativo', '9384', 'Blackjack Silver F', '9384', 'Ao vivo', NULL, 'Games/Evolution_Original/9384.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1342, 23, 'inativo', '9383', 'Blackjack Silver E', '9383', 'Ao vivo', NULL, 'Games/Evolution_Original/9383.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1343, 23, 'inativo', '9382', 'Blackjack Silver D', '9382', 'Ao vivo', NULL, 'Games/Evolution_Original/9382.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1344, 23, 'inativo', '9381', 'Blackjack Silver C', '9381', 'Ao vivo', NULL, 'Games/Evolution_Original/9381.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1345, 23, 'inativo', '9380', 'Blackjack Silver B', '9380', 'Ao vivo', NULL, 'Games/Evolution_Original/9380.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:03', '2025-04-14 18:59:03', 1),
(1346, 23, 'inativo', '9379', 'Blackjack Silver A', '9379', 'Ao vivo', NULL, 'Games/Evolution_Original/9379.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:04', '2025-04-14 18:59:04', 1),
(1347, 23, 'inativo', '9378', 'Blackjack Party', '9378', 'Ao vivo', NULL, 'Games/Evolution_Original/9378.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:04', '2025-04-14 18:59:04', 1),
(1348, 23, 'inativo', '9339', 'Baccarat C', '9339', 'Ao vivo', NULL, 'Games/Evolution_Original/9339.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:04', '2025-04-14 18:59:04', 1),
(1349, 23, 'inativo', '9338', 'Baccarat B', '9338', 'Ao vivo', NULL, 'Games/Evolution_Original/9338.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:04', '2025-04-14 18:59:04', 1),
(1350, 23, 'inativo', '9337', 'VIP Roulette', '9337', 'Ao vivo', NULL, 'Games/Evolution_Original/9337.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:04', '2025-04-14 22:06:30', 1),
(1351, 23, 'inativo', '9336', 'Blackjack VIP A', '9336', 'Ao vivo', NULL, 'Games/Evolution_Original/9336.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:04', '2025-04-14 18:59:04', 1),
(1352, 23, 'inativo', '9335', 'First Person Craps', '9335', 'Ao vivo', NULL, 'Games/Evolution_Original/9335.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:04', '2025-04-14 18:59:04', 1),
(1353, 23, 'inativo', '9334', 'First Person Dream Catcher', '9334', 'Ao vivo', NULL, 'Games/Evolution_Original/9334.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:04', '2025-04-14 18:59:04', 1),
(1354, 23, 'inativo', '9333', 'American Roulette', '9333', 'Ao vivo', NULL, 'Games/Evolution_Original/9333.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:05', '2025-04-14 22:06:27', 1),
(1355, 23, 'inativo', '9332', 'Power Blackjack', '9332', 'Ao vivo', NULL, 'Games/Evolution_Original/9332.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:05', '2025-04-14 18:59:05', 1),
(1356, 23, 'inativo', '9331', 'Super Sic Bo', '9331', 'Ao vivo', NULL, 'Games/Evolution_Original/9331.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:05', '2025-04-14 18:59:05', 1),
(1357, 23, 'inativo', '9330', 'Football Studio', '9330', 'Ao vivo', NULL, 'Games/Evolution_Original/9330.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:59:05', '2025-08-12 18:49:05', 1),
(1358, 23, 'inativo', '9328', 'Infinite Blackjack', '9328', 'Ao vivo', NULL, 'Games/Evolution_Original/9328.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:05', '2025-04-14 18:59:05', 1),
(1359, 23, 'inativo', '9326', 'Baccarat A', '9326', 'Ao vivo', NULL, 'Games/Evolution_Original/9326.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:05', '2025-04-14 18:59:05', 1),
(1360, 23, 'inativo', '9325', 'Blackjack C', '9325', 'Ao vivo', NULL, 'Games/Evolution_Original/9325.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:05', '2025-04-14 18:59:05', 1),
(1361, 23, 'inativo', '9324', 'First Person Mega Ball', '9324', 'Ao vivo', NULL, 'Games/Evolution_Original/9324.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:05', '2025-04-14 18:59:05', 1),
(1362, 23, 'inativo', '9322', 'Blackjack B', '9322', 'Ao vivo', NULL, 'Games/Evolution_Original/9322.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 18:59:06', 1),
(1363, 23, 'inativo', '9321', 'Lightning Dice', '9321', 'Ao vivo', NULL, 'Games/Evolution_Original/9321.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 18:59:06', 1),
(1364, 23, 'inativo', '9320', 'Mega Ball', '9320', 'Ao vivo', NULL, 'Games/Evolution_Original/9320.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 18:59:06', 1),
(1365, 23, 'inativo', '9319', 'First Person Blackjack', '9319', 'Ao vivo', NULL, 'Games/Evolution_Original/9319.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 18:59:06', 1),
(1366, 23, 'inativo', '9318', 'Instant Roulette', '9318', 'Ao vivo', NULL, 'Games/Evolution_Original/9318.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2025-04-14 18:59:06', '2025-07-05 08:19:50', 1),
(1367, 23, 'inativo', '9315', 'Double Ball Roulette', '9315', 'Ao vivo', NULL, 'Games/Evolution_Original/9315.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 22:06:22', 1),
(1368, 23, 'inativo', '9314', 'Triple Card Poker', '9314', 'Ao vivo', NULL, 'Games/Evolution_Original/9314.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 18:59:06', 1),
(1369, 23, 'inativo', '9313', 'Lightning Baccarat', '9313', 'Ao vivo', NULL, 'Games/Evolution_Original/9313.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:06', '2025-04-14 20:26:19', 1),
(1370, 23, 'inativo', '9311', 'First Person Roulette', '9311', 'Ao vivo', NULL, 'Games/Evolution_Original/9311.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 22:06:19', 1),
(1371, 23, 'inativo', '9310', 'Baccarat Control Squeeze', '9310', 'Ao vivo', NULL, 'Games/Evolution_Original/9310.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 18:59:06', 1),
(1372, 23, 'inativo', '9309', 'Lightning Roulette', '9309', 'Ao vivo', NULL, 'Games/Evolution_Original/9309.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 22:06:16', 1),
(1373, 23, 'inativo', '9308', 'Blackjack VIP B', '9308', 'Ao vivo', NULL, 'Games/Evolution_Original/9308.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 18:59:06', 1),
(1374, 23, 'inativo', '9307', 'MONOPOLY Live', '9307', 'Ao vivo', NULL, 'Games/Evolution_Original/9307.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 18:59:06', 1),
(1375, 23, 'inativo', '9306', 'Immersive Roulette', '9306', 'Ao vivo', NULL, 'Games/Evolution_Original/9306.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 22:06:13', 1),
(1376, 23, 'inativo', '9305', 'First Person American Roulette', '9305', 'Ao vivo', NULL, 'Games/Evolution_Original/9305.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 22:06:10', 1),
(1377, 23, 'inativo', '9303', 'French Roulette Gold', '9303', 'Ao vivo', NULL, 'Games/Evolution_Original/9303.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 0, '2025-04-14 18:59:06', '2025-08-02 00:44:20', 1),
(1378, 23, 'inativo', '9302', 'First Person Dragon Tiger', '9302', 'Ao vivo', NULL, 'Games/Evolution_Original/9302.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:06', '2025-04-14 18:59:06', 1),
(1379, 23, 'inativo', '9301', 'Dragon Tiger', '9301', 'Ao vivo', NULL, 'Games/Evolution_Original/9301.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1380, 23, 'inativo', '9300', 'Infinite Free Bet Blackjack', '9300', 'Ao vivo', NULL, 'Games/Evolution_Original/9300.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1381, 23, 'inativo', '9299', 'Baccarat Squeeze', '9299', 'Ao vivo', NULL, 'Games/Evolution_Original/9299.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1382, 23, 'inativo', '9298', 'Caribbean Stud Poker', '9298', 'Ao vivo', NULL, 'Games/Evolution_Original/9298.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1383, 23, 'inativo', '9296', 'Craps', '9296', 'Ao vivo', NULL, 'Games/Evolution_Original/9296.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1384, 23, 'inativo', '9295', 'Crazy Time', '9295', 'Ao vivo', NULL, 'Games/Evolution_Original/9295.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1385, 23, 'inativo', '9294', 'Dream Catcher', '9294', 'Ao vivo', NULL, 'Games/Evolution_Original/9294.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1386, 23, 'inativo', '9293', 'Blackjack A', '9293', 'Ao vivo', NULL, 'Games/Evolution_Original/9293.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1387, 23, 'inativo', '9292', 'First Person Baccarat', '9292', 'Ao vivo', NULL, 'Games/Evolution_Original/9292.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1388, 23, 'inativo', '9291', 'Roulette', '9291', 'Ao vivo', NULL, 'Games/Evolution_Original/9291.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 22:06:03', 1),
(1389, 23, 'inativo', '9290', 'First Person Top Card', '9290', 'Ao vivo', NULL, 'Games/Evolution_Original/9290.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1390, 23, 'inativo', '9289', 'Football Studio Roulette', '9289', 'Ao vivo', NULL, 'Games/Evolution_Original/9289.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 22:06:00', 1),
(1391, 23, 'inativo', '9288', 'Football Studio Dice', '9288', 'Ao vivo', NULL, 'Games/Evolution_Original/9288.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1392, 23, 'inativo', '9287', 'Monopoly Big Baller', '9287', 'Ao vivo', NULL, 'Games/Evolution_Original/9287.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1393, 23, 'inativo', '9286', 'Blackjack VIP 27', '9286', 'Ao vivo', NULL, 'Games/Evolution_Original/9286.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1394, 23, 'inativo', '9285', 'Blackjack VIP 26', '9285', 'Ao vivo', NULL, 'Games/Evolution_Original/9285.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1395, 23, 'inativo', '9284', 'Blackjack VIP 25', '9284', 'Ao vivo', NULL, 'Games/Evolution_Original/9284.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1396, 23, 'inativo', '9283', 'Speed VIP Blackjack M', '9283', 'Ao vivo', NULL, 'Games/Evolution_Original/9283.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1397, 23, 'inativo', '9282', 'Speed VIP Blackjack L', '9282', 'Ao vivo', NULL, 'Games/Evolution_Original/9282.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1398, 23, 'inativo', '9281', 'Speed VIP Blackjack K', '9281', 'Ao vivo', NULL, 'Games/Evolution_Original/9281.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1399, 23, 'inativo', '9280', 'Teen Patti', '9280', 'Ao vivo', NULL, 'Games/Evolution_Original/9280.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1400, 23, 'inativo', '9279', 'Crazy Coin Flip', '9279', 'Ao vivo', NULL, 'Games/Evolution_Original/9279.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:07', '2025-04-14 18:59:07', 1),
(1401, 9, 'inativo', 'hand_of_gold', 'HAND OF GOLD', 'hand_of_gold', 'Slots', NULL, 'Games/Playson/hand_of_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 10, 0, 1, '2025-04-14 18:59:07', '2025-08-12 18:17:34', 0),
(1402, 9, 'inativo', 'legend_of_cleopatra', 'LEGEND OF CLEOPATRA', 'legend_of_cleopatra', 'Slots', NULL, 'Games/Playson/legend_of_cleopatra.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 10, 0, 1, '2025-04-14 18:59:07', '2025-07-30 22:00:14', 0),
(1403, 9, 'inativo', '40_joker_staxx', '40 JOKER STAXX', '40_joker_staxx', 'Slots', NULL, 'Games/Playson/40_joker_staxx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 5, 0, 1, '2025-04-14 18:59:07', '2025-09-01 11:40:56', 0),
(1404, 9, 'inativo', 'burning_wins', 'BURNING WINS', 'burning_wins', 'Slots', NULL, 'Games/Playson/burning_wins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:07', '2025-04-14 20:46:07', 0),
(1405, 9, 'inativo', 'book_of_gold', 'BOOK OF GOLD', 'book_of_gold', 'Slots', NULL, 'Games/Playson/book_of_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:07', '2025-04-14 20:46:08', 0),
(1406, 9, 'inativo', '100_joker_staxx', '100 JOKER STAXX', '100_joker_staxx', 'Slots', NULL, 'Games/Playson/100_joker_staxx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:07', '2025-04-14 20:46:08', 0),
(1407, 9, 'inativo', 'book_of_gold_classic', 'BOOK OF GOLD CLASSIC', 'book_of_gold_classic', 'Slots', NULL, 'Games/Playson/book_of_gold_classic.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:07', '2025-04-14 20:46:09', 0),
(1408, 9, 'inativo', 'buffalo_xmas', 'BUFFALO XMAS', 'buffalo_xmas', 'Slots', NULL, 'Games/Playson/buffalo_xmas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2025-04-14 18:59:07', '2025-08-06 11:13:32', 0),
(1409, 8, 'inativo', '7167', 'Berry Burst', '7167', 'Slots', NULL, 'Games/NetEnt/7167.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 0, 1, '2025-04-14 18:59:07', '2025-08-01 20:58:22', 1),
(1410, 8, 'inativo', '7163', 'Double Stacks', '7163', 'Slots', NULL, 'Games/NetEnt/7163.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 4, 0, 1, '2025-04-14 18:59:07', '2025-07-23 16:46:26', 1),
(1411, 8, 'inativo', '7198', 'Dracula', '7198', 'Slots', NULL, 'Games/NetEnt/7198.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:59:07', '2025-06-30 02:47:00', 1),
(1412, 8, 'inativo', '7189', 'Flowers Christmas Edition', '7189', 'Slots', NULL, 'Games/NetEnt/7189.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:07', '2025-04-14 20:40:28', 1),
(1413, 8, 'inativo', '7129', 'Fortune Rangers', '7129', 'Slots', NULL, 'Games/NetEnt/7129.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:07', '2025-04-14 20:40:29', 1),
(1414, 8, 'inativo', '7166', 'Fruit Shop Christmas Edition', '7166', 'Slots', NULL, 'Games/NetEnt/7166.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2025-04-14 18:59:07', '2025-07-05 08:46:06', 1),
(1415, 8, 'inativo', '8130', 'King of 3 Kingdoms', '8130', 'Slots', NULL, 'Games/NetEnt/8130.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:08', '2025-04-14 20:40:18', 1),
(1416, 8, 'inativo', '7131', 'Sweety Honey Fruity', '7131', 'Slots', NULL, 'Games/NetEnt/7131.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:08', '2025-04-14 20:40:20', 1),
(1417, 8, 'inativo', '7145', 'Twin Happiness', '7145', 'Slots', NULL, 'Games/NetEnt/7145.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:08', '2025-04-14 20:40:21', 1),
(1418, 8, 'inativo', '7190', 'Wild Water', '7190', 'Slots', NULL, 'Games/NetEnt/7190.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2025-04-14 18:59:08', '2025-04-14 20:40:22', 1),
(1419, 8, 'inativo', '1035', 'Wild Turkey', '1035', 'Slots', NULL, 'Games/NetEnt/1035.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2025-04-14 18:59:08', '2025-04-14 18:59:08', 1),
(1420, 3, 'inativo', 'aviator', 'Aviator', 'aviator', 'Crash', NULL, 'Games/Spribe/Aviator.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000488, 1, 1, '2025-04-14 18:59:08', '2025-09-11 18:20:47', 0),
(1421, 3, 'inativo', 'mines', 'Mines', 'mines', 'Crash', NULL, 'Games/Spribe/mines.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000410, 1, 1, '2025-04-14 18:59:08', '2025-09-11 19:05:00', 0),
(1423, 1, 'inativo', '98', 'Fortune Ox', '98', 'Slots', NULL, 'Games/Pgsoft/98.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000467, 1, 1, '2025-04-14 18:59:08', '2025-09-11 18:18:32', 0),
(1424, 1, 'inativo', '68', 'Fortune Mouse', '68', 'Slots', NULL, 'Games/Pgsoft/68.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000313, 1, 1, '2025-04-14 18:59:08', '2025-09-06 09:00:51', 0),
(1425, 1, 'inativo', '1543462', 'Fortune Rabbit', '1543462', 'Slots', NULL, 'Games/Pgsoft/1543462.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000475, 0, 1, '2025-04-14 18:59:08', '2025-09-11 17:18:43', 0),
(1426, 1, 'inativo', '69', 'Bikini Paradise', '69', 'Slots', NULL, 'Games/Pgsoft/69.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000304, 0, 0, '2025-04-14 18:59:08', '2025-07-22 10:06:47', 0),
(1427, 1, 'inativo', '40', 'Jungle Delight', '40', 'Slots', NULL, 'Games/Pgsoft/40.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000302, 0, 0, '2025-04-14 18:59:08', '2025-08-05 12:29:55', 0),
(1428, 1, 'inativo', '1695365', 'Fortune Dragon', '1695365', 'Slots', NULL, 'Games/Pgsoft/1695365.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000435, 1, 1, '2025-04-14 18:59:08', '2025-09-10 18:00:43', 0),
(1429, 1, 'inativo', '1738001', 'Chicky Run', '1738001', 'Slots', NULL, 'Games/Pgsoft/1738001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000309, 0, 1, '2025-04-14 18:59:08', '2025-08-05 12:23:00', 0),
(1430, 1, 'inativo', '42', 'Ganesha Gold', '42', 'Slots', NULL, 'Games/Pgsoft/42.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000312, 0, 0, '2025-04-14 18:59:08', '2025-08-12 18:22:48', 0),
(1431, 1, 'inativo', '60', 'Leprechaun Riches', '60', 'Slots', NULL, 'Games/Pgsoft/60.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000300, 0, 0, '2025-04-14 18:59:08', '2025-04-14 18:59:08', 0),
(1432, 1, 'inativo', '63', 'Dragon Tiger Luck', '63', 'Slots', NULL, 'Games/Pgsoft/63.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000305, 0, 0, '2025-04-14 18:59:08', '2025-07-24 23:39:19', 0),
(1433, 1, 'inativo', '39', 'Piggy Gold', '39', 'Slots', NULL, 'Games/Pgsoft/piggy-gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000300, 0, 0, '2025-04-14 18:59:08', '2025-04-14 18:59:08', 0),
(1434, 1, 'inativo', '48', 'Double Fortune', '48', 'Slots', NULL, 'Games/Pgsoft/double-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000304, 0, 0, '2025-04-14 18:59:08', '2025-08-10 04:30:40', 0),
(1435, 1, 'inativo', '53', 'The Great Icescape', '53', 'Slots', NULL, 'Games/Pgsoft/the-great-icescape.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000306, 0, 0, '2025-04-14 18:59:08', '2025-08-01 23:13:26', 0),
(1436, 1, 'inativo', '57', 'Dragon Hatch', '57', 'Slots', NULL, 'Games/Pgsoft/dragon-hatch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000300, 0, 0, '2025-04-14 18:59:08', '2025-04-14 18:59:08', 0),
(1437, 1, 'inativo', '88', 'Jewels of Prosperity', '88', 'Slots', NULL, 'Games/Pgsoft/jewels-prosper.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000300, 0, 0, '2025-04-14 18:59:08', '2025-04-14 18:59:08', 0),
(1438, 1, 'inativo', '1402846', 'Midas Fortune', '1402846', 'Slots', NULL, 'Games/Pgsoft/midas-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000306, 0, 0, '2025-04-14 18:59:09', '2025-09-11 18:08:06', 0),
(1439, 1, 'inativo', '1451122', 'Dragon Hatch2', '1451122', 'Slots', NULL, 'Games/Pgsoft/dragon-hatch2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000300, 0, 0, '2025-04-14 18:59:09', '2025-04-14 18:59:09', 0),
(1440, 1, 'inativo', '1508783', 'Wild Ape', '1508783', 'Slots', NULL, 'Games/Pgsoft/1508783.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000357, 1, 1, '2025-04-14 18:59:09', '2025-09-05 19:03:55', 0),
(1441, 1, 'inativo', '1623475', 'Anubis Wrath', '1623475', 'Slots', NULL, 'Games/Pgsoft/anubis-wrath.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000303, 0, 0, '2025-04-14 18:59:09', '2025-07-13 18:20:32', 0),
(1442, 1, 'inativo', '1635221', 'Zombie Outbreak', '1635221', 'Slots', NULL, 'Games/Pgsoft/zombie-outbrk.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000305, 0, 1, '2025-04-14 18:59:09', '2025-08-05 12:28:25', 0),
(1443, 1, 'inativo', '1682240', 'Cash Mania', '1682240', 'Slots', NULL, 'Games/Pgsoft/cash-mania.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000305, 0, 1, '2025-04-14 18:59:09', '2025-09-05 12:33:30', 0),
(1445, 1, 'inativo', '1879752', 'Fortune Snake', '1879752', 'Slots', NULL, 'Games/Pgsoft/1879752.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000326, 1, 1, '2025-04-14 18:59:10', '2025-09-10 16:53:36', 0),
(1446, 1, 'inativo', '1786529', 'Rio Fantasia', '1786529', 'Slots', NULL, 'Games/Pgsoft/1786529.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000301, 0, 0, '2025-04-14 18:59:10', '2025-07-13 18:15:39', 0),
(1447, 1, 'inativo', '1727711', 'Three Crazy Piggies', '1727711', 'Slots', NULL, 'Games/Pgsoft/1727711.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000301, 0, 1, '2025-04-14 18:59:10', '2025-04-22 02:54:02', 0),
(1448, 2, 'inativo', 'vs10forwild', 'Rato Sortudo', 'vs10forwild', 'Slots', NULL, 'Games/Pragmatic/vs10forwild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000546, 1, 1, '2025-04-14 18:59:10', '2025-09-11 02:24:23', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_keys`
--

CREATE TABLE `games_keys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `playfiver_url` varchar(191) DEFAULT NULL,
  `playfiver_secret` varchar(191) DEFAULT NULL,
  `playfiver_code` varchar(191) DEFAULT NULL,
  `playfiver_token` varchar(191) DEFAULT NULL,
  `saldo_agente` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games_keys`
--

INSERT INTO `games_keys` (`id`, `created_at`, `updated_at`, `playfiver_url`, `playfiver_secret`, `playfiver_code`, `playfiver_token`, `saldo_agente`) VALUES
(1, '2023-11-30 21:03:08', '2025-06-26 01:37:44', 'https://api.playfiver.com', 'e122dfed-dff9-4e0d-935b-2db977439f50', 'vaijogar.bet', '4ce62d87-e3cc-4dbc-9307-93fabc1ac2aa', 53152.40);

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_configs`
--

CREATE TABLE `game_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_arrecadacao` decimal(12,2) NOT NULL DEFAULT 0.00,
  `percentual_distribuicao` decimal(5,2) NOT NULL DEFAULT 0.00,
  `modo_atual` varchar(50) NOT NULL DEFAULT 'arrecadacao',
  `total_arrecadado` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_distribuido` decimal(12,2) NOT NULL DEFAULT 0.00,
  `minas_distribuicao` int(11) NOT NULL DEFAULT 5,
  `minas_arrecadacao` int(11) NOT NULL DEFAULT 5,
  `x_por_mina` decimal(5,2) NOT NULL DEFAULT 0.10,
  `x_a_cada_5` decimal(5,2) NOT NULL DEFAULT 1.50,
  `bet_loss` decimal(5,2) NOT NULL DEFAULT 50.00,
  `modo_influenciador` tinyint(1) NOT NULL DEFAULT 0,
  `modo_perdedor` tinyint(1) NOT NULL DEFAULT 0,
  `start_cycle_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `game_configs`
--

INSERT INTO `game_configs` (`id`, `meta_arrecadacao`, `percentual_distribuicao`, `modo_atual`, `total_arrecadado`, `total_distribuido`, `minas_distribuicao`, `minas_arrecadacao`, `x_por_mina`, `x_a_cada_5`, `bet_loss`, `modo_influenciador`, `modo_perdedor`, `start_cycle_at`, `created_at`, `updated_at`) VALUES
(1, 500.00, 60.00, 'arrecadacao', 196.50, 0.00, 5, 15, 0.20, 1.50, 50.00, 0, 0, '2025-03-11 12:23:03', '2025-02-19 06:30:30', '2025-04-10 21:25:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_favorites`
--

CREATE TABLE `game_favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_likes`
--

CREATE TABLE `game_likes` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_open_configs`
--

CREATE TABLE `game_open_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `requires_deposit_today` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `game_open_configs`
--

INSERT INTO `game_open_configs` (`id`, `requires_deposit_today`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-03-04 00:08:07', '2025-03-04 03:19:06');

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_reviews`
--

CREATE TABLE `game_reviews` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `suitpay_uri` varchar(191) DEFAULT NULL,
  `suitpay_cliente_id` varchar(191) DEFAULT NULL,
  `suitpay_cliente_secret` varchar(191) DEFAULT NULL,
  `stripe_production` tinyint(4) DEFAULT 0,
  `stripe_public_key` varchar(255) DEFAULT NULL,
  `stripe_secret_key` varchar(255) DEFAULT NULL,
  `stripe_webhook_key` varchar(255) DEFAULT NULL,
  `bspay_uri` varchar(255) DEFAULT NULL,
  `bspay_cliente_id` varchar(255) DEFAULT NULL,
  `bspay_cliente_secret` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `digito_uri` varchar(191) DEFAULT NULL,
  `digito_client` varchar(191) DEFAULT NULL,
  `digito_secret` varchar(191) DEFAULT NULL,
  `ezze_uri` varchar(191) DEFAULT NULL,
  `ezze_client` varchar(191) DEFAULT NULL,
  `ezze_secret` varchar(191) DEFAULT NULL,
  `ezze_user` varchar(191) DEFAULT NULL,
  `ezze_senha` varchar(191) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `gateways`
--

INSERT INTO `gateways` (`id`, `suitpay_uri`, `suitpay_cliente_id`, `suitpay_cliente_secret`, `stripe_production`, `stripe_public_key`, `stripe_secret_key`, `stripe_webhook_key`, `bspay_uri`, `bspay_cliente_id`, `bspay_cliente_secret`, `created_at`, `updated_at`, `digito_uri`, `digito_client`, `digito_secret`, `ezze_uri`, `ezze_client`, `ezze_secret`, `ezze_user`, `ezze_senha`) VALUES
(1, 'https://ws.suitpay.app/api/v1/', 'suitpay_*****************', '483733203da84badc12d0dfd5119dc1ada81b402c*****************', 0, 'OndaGames.com', 'OndaGames.com', 'OndaGames.com', 'https://api.pixupbr.com/v2/', 'zirigui_2849323247', 'e4e1a8e3c9c930650d4137ac844339171ebf437772182da8ff6494b456f04b0e', '2023-12-01 00:05:51', '2025-06-18 13:30:34', 'https://api.digitopayoficial.com.br/api/', 'f8f57f0c-6676-4693-9492-*****************', '6abbdaff-05e0-4b30-*****************', 'https://api.ezzebank.com/v2/', '*****************', '*****************', '*****************', '*****************');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_config`
--

CREATE TABLE `ggds_spin_config` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prizes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `ggds_spin_config`
--

INSERT INTO `ggds_spin_config` (`id`, `prizes`, `created_at`, `updated_at`) VALUES
(1, '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":6},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":13},{\"currency\":\"BRL\",\"value\":11},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2}]', '2024-01-11 23:52:59', '2024-05-31 18:19:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_runs`
--

CREATE TABLE `ggds_spin_runs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `nonce` varchar(255) NOT NULL,
  `possibilities` text NOT NULL,
  `prize` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_fivers`
--

CREATE TABLE `ggr_games_fivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_win` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_world_slots`
--

CREATE TABLE `ggr_games_world_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(191) NOT NULL,
  `game` varchar(191) NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_win` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(50) NOT NULL DEFAULT 'BRL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `liked_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(15, '2023_10_30_034921_create_settings_table', 6),
(7, '2023_11_03_205251_create_sport_categories_table', 1),
(8, '2023_11_03_205252_create_sports_table', 1),
(10, '2023_11_04_001342_create_sport_events_table', 2),
(11, '2023_11_04_213841_add_fields_to_users_table', 3),
(12, '2023_11_07_202919_create_currencies_table', 4),
(13, '2023_11_07_210310_create_wallets_table', 5),
(16, '2023_11_07_214236_create_withdrawals_table', 7),
(17, '2023_11_07_214240_create_deposits_table', 7),
(18, '2023_11_07_214244_create_orders_table', 7),
(19, '2023_11_07_214708_create_suit_pay_payments_table', 7),
(20, '2023_11_07_215204_create_notifications_table', 8),
(21, '2023_11_07_202919_create_currency_alloweds_table', 9),
(22, '2023_11_11_205824_create_casino_categories_table', 9),
(23, '2023_11_11_205834_create_casino_providers_table', 9),
(24, '2023_11_11_205938_create_casino_games_slotgrators_table', 9),
(25, '2023_11_11_210018_create_casino_games_kscinuses_table', 9),
(26, '2023_11_12_225424_create_transactions_table', 10),
(27, '2023_11_12_225431_create_affiliate_histories_table', 10),
(28, '2023_11_12_234643_add_field_to_wallet_table', 11),
(29, '2023_11_14_203632_create_likes_table', 12),
(30, '2023_09_27_214903_create_wallet_changes_table', 13),
(31, '2023_11_16_155140_create_permission_tables', 14),
(32, '2023_11_17_012533_add_language_to_users_table', 15),
(33, '2023_11_22_171616_create_football_leagues_table', 16),
(34, '2023_11_22_175530_create_football_venues_table', 17),
(35, '2023_11_22_175547_create_football_teams_table', 17),
(36, '2023_11_23_143637_create_football_events_table', 18),
(38, '2023_11_29_134520_create_sport_bets_table', 19),
(39, '2023_11_29_135451_create_sport_bets_odds_table', 19),
(40, '2023_11_30_195548_create_gateways_table', 20),
(41, '2023_11_30_195557_create_games_keys_table', 20),
(42, '2023_11_30_195609_create_setting_mails_table', 20),
(43, '2023_10_08_111755_add_fields_to_game_exclusives_table', 20),
(44, '2023_10_07_183921_create_game_exclusives_table', 21),
(45, '2023_10_11_144956_create_system_wallets_table', 22),
(46, '2023_12_18_172721_create_banners_table', 23),
(47, '2023_12_20_135908_create_casino_games_salsas_table', 24),
(48, '2023_12_23_224032_create_fivers_providers_table', 25),
(49, '2023_12_23_224105_create_fivers_games_table', 25),
(50, '2023_12_31_121453_create_custom_layouts_table', 26),
(51, '2024_01_01_193712_create_g_g_r_games_fivers_table', 27),
(52, '2024_01_14_155144_create_missions_table', 28),
(53, '2024_01_14_155150_create_mission_users_table', 28),
(54, '2024_01_19_120728_create_ka_gamings_table', 29),
(81, '2024_05_16_225244_create__digito_pay', 30),
(82, '2024_05_16_204842_create__ezzepay', 31),
(83, '2025_02_06_212838_configs_playfiver', 32),
(84, '2025_04_03_203757_add_in_game_original_games', 33);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missions`
--

CREATE TABLE `missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('deposit','game_bet','total_bet','rounds_played','win_amount','loss_amount') NOT NULL,
  `game_id` varchar(50) DEFAULT NULL COMMENT 'Lógica: Referência ao campo id na tabela games',
  `target_amount` decimal(10,2) NOT NULL,
  `reward` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `missions`
--

INSERT INTO `missions` (`id`, `title`, `description`, `type`, `game_id`, `target_amount`, `reward`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Aposte x100 spins!', 'Aposte x100 spins!', 'rounds_played', '126', 100.00, 15.00, 'uploads/missoes/01JNZ88HD880Y2BJP09TKAC3TJ.webp', 'active', '2024-11-27 22:58:50', '2025-03-10 02:25:52'),
(2, 'Deposite R$ 20,00', 'Deposite R$ 20,00', 'deposit', NULL, 20.00, 5.00, 'uploads/missoes/01JNZ7PHQ3HE1BKAEKMAXJM3J8.webp', 'active', '2024-11-28 23:06:30', '2025-03-10 02:19:23'),
(3, 'Ganhe R$ 10,00!', 'Ganhe R$ 10,00!', 'win_amount', 'vs20olympgate', 10.00, 5.00, 'uploads/missoes/01JNZ7ZR97NKYP60VJYBG17NM5.webp', 'active', '2024-11-28 23:09:01', '2025-03-10 02:32:35'),
(4, 'Ganhe R$ 12,00!', 'Ganhe R$ 12,00!', 'win_amount', 'vs5luckytig', 12.00, 6.00, 'uploads/missoes/01JNZ83NP1JMQCGQM73NEZ0A19.webp', 'active', '2024-11-28 23:10:47', '2025-03-10 02:33:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_users`
--

CREATE TABLE `mission_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Referência ao campo id na tabela users',
  `mission_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Referência ao campo id na tabela missions',
  `reward` decimal(10,2) DEFAULT 0.00,
  `redeemed` tinyint(1) DEFAULT 0 COMMENT '0 = Não resgatado, 1 = Resgatado',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mission_users`
--

INSERT INTO `mission_users` (`id`, `user_id`, `mission_id`, `reward`, `redeemed`, `created_at`, `updated_at`) VALUES
(1, 41, 2, 0.00, 1, '2025-06-26 00:26:31', '2025-06-26 00:26:31'),
(2, 54, 2, 0.00, 1, '2025-06-27 01:32:05', '2025-06-27 01:32:05'),
(3, 100, 2, 0.00, 1, '2025-06-29 09:29:06', '2025-06-29 09:29:06'),
(4, 101, 2, 0.00, 1, '2025-06-29 13:30:28', '2025-06-29 13:30:28'),
(5, 126, 2, 0.00, 1, '2025-06-30 16:45:11', '2025-06-30 16:45:11'),
(6, 127, 2, 0.00, 1, '2025-06-30 19:40:19', '2025-06-30 19:40:19'),
(7, 135, 2, 0.00, 1, '2025-07-01 19:59:46', '2025-07-01 19:59:46'),
(8, 139, 2, 0.00, 1, '2025-07-02 02:38:32', '2025-07-02 02:38:32'),
(9, 153, 2, 0.00, 1, '2025-07-02 20:44:41', '2025-07-02 20:44:41'),
(10, 111, 2, 0.00, 1, '2025-07-03 01:34:10', '2025-07-03 01:34:10'),
(11, 160, 2, 0.00, 1, '2025-07-03 02:40:34', '2025-07-03 02:40:34'),
(12, 182, 2, 0.00, 1, '2025-07-04 04:33:50', '2025-07-04 04:33:50'),
(13, 193, 2, 0.00, 1, '2025-07-05 07:24:50', '2025-07-05 07:24:50'),
(14, 204, 2, 0.00, 1, '2025-07-06 02:27:59', '2025-07-06 02:27:59'),
(15, 224, 2, 0.00, 1, '2025-07-10 23:10:01', '2025-07-10 23:10:01'),
(16, 234, 2, 0.00, 1, '2025-07-11 04:27:24', '2025-07-11 04:27:24'),
(17, 236, 2, 0.00, 1, '2025-07-11 11:50:59', '2025-07-11 11:50:59'),
(18, 238, 2, 0.00, 1, '2025-07-11 13:35:55', '2025-07-11 13:35:55'),
(19, 239, 2, 0.00, 1, '2025-07-11 20:10:05', '2025-07-11 20:10:05'),
(20, 242, 2, 0.00, 1, '2025-07-11 21:19:45', '2025-07-11 21:19:45'),
(21, 253, 2, 0.00, 1, '2025-07-12 13:13:06', '2025-07-12 13:13:06'),
(22, 254, 2, 0.00, 1, '2025-07-12 16:04:10', '2025-07-12 16:04:10'),
(23, 256, 2, 0.00, 1, '2025-07-12 19:55:32', '2025-07-12 19:55:32'),
(24, 257, 2, 0.00, 1, '2025-07-12 21:33:33', '2025-07-12 21:33:33'),
(25, 263, 2, 0.00, 1, '2025-07-13 11:36:16', '2025-07-13 11:36:16'),
(26, 264, 2, 0.00, 1, '2025-07-13 16:39:36', '2025-07-13 16:39:36'),
(27, 265, 2, 0.00, 1, '2025-07-13 22:08:18', '2025-07-13 22:08:18'),
(28, 274, 2, 0.00, 1, '2025-07-14 12:22:31', '2025-07-14 12:22:31'),
(29, 281, 2, 0.00, 1, '2025-07-14 22:42:40', '2025-07-14 22:42:40'),
(30, 277, 2, 0.00, 1, '2025-07-14 22:53:55', '2025-07-14 22:53:55'),
(31, 285, 2, 0.00, 1, '2025-07-15 18:42:37', '2025-07-15 18:42:37'),
(32, 289, 2, 0.00, 1, '2025-07-16 00:45:00', '2025-07-16 00:45:00'),
(33, 298, 2, 0.00, 1, '2025-07-16 13:25:17', '2025-07-16 13:25:17'),
(34, 323, 2, 0.00, 1, '2025-07-18 16:01:03', '2025-07-18 16:01:03'),
(35, 327, 2, 0.00, 1, '2025-07-19 03:54:47', '2025-07-19 03:54:47'),
(36, 347, 2, 0.00, 1, '2025-07-21 08:00:28', '2025-07-21 08:00:28'),
(37, 364, 2, 0.00, 1, '2025-07-23 03:05:11', '2025-07-23 03:05:11'),
(38, 370, 2, 0.00, 1, '2025-07-24 03:10:22', '2025-07-24 03:10:22'),
(39, 381, 2, 0.00, 1, '2025-07-25 18:32:04', '2025-07-25 18:32:04'),
(40, 401, 2, 0.00, 1, '2025-07-30 19:30:45', '2025-07-30 19:30:45'),
(41, 414, 2, 0.00, 1, '2025-08-01 13:17:27', '2025-08-01 13:17:27'),
(42, 417, 2, 0.00, 1, '2025-08-01 19:51:18', '2025-08-01 19:51:18'),
(43, 412, 2, 0.00, 1, '2025-08-01 23:30:30', '2025-08-01 23:30:30'),
(44, 431, 2, 0.00, 1, '2025-08-05 01:45:02', '2025-08-05 01:45:02'),
(45, 469, 2, 0.00, 1, '2025-08-10 03:19:37', '2025-08-10 03:19:37'),
(46, 484, 2, 0.00, 1, '2025-09-05 00:54:30', '2025-09-05 00:54:30'),
(47, 502, 2, 0.00, 1, '2025-09-10 16:29:35', '2025-09-10 16:29:35'),
(48, 506, 2, 0.00, 1, '2025-09-11 02:31:59', '2025-09-11 02:31:59'),
(49, 507, 2, 0.00, 1, '2025-09-11 03:09:45', '2025-09-11 03:09:45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 35),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 42),
(2, 'App\\Models\\User', 45),
(2, 'App\\Models\\User', 48),
(2, 'App\\Models\\User', 54),
(2, 'App\\Models\\User', 58),
(2, 'App\\Models\\User', 96),
(2, 'App\\Models\\User', 104),
(2, 'App\\Models\\User', 121),
(2, 'App\\Models\\User', 137),
(2, 'App\\Models\\User', 172),
(2, 'App\\Models\\User', 184),
(2, 'App\\Models\\User', 185),
(2, 'App\\Models\\User', 193),
(2, 'App\\Models\\User', 199),
(2, 'App\\Models\\User', 210),
(2, 'App\\Models\\User', 212),
(2, 'App\\Models\\User', 219),
(2, 'App\\Models\\User', 222),
(2, 'App\\Models\\User', 238),
(2, 'App\\Models\\User', 247),
(2, 'App\\Models\\User', 314),
(2, 'App\\Models\\User', 364),
(2, 'App\\Models\\User', 371),
(2, 'App\\Models\\User', 374),
(2, 'App\\Models\\User', 384),
(2, 'App\\Models\\User', 387),
(2, 'App\\Models\\User', 401),
(2, 'App\\Models\\User', 413),
(2, 'App\\Models\\User', 456),
(2, 'App\\Models\\User', 481);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `game` varchar(191) NOT NULL,
  `game_uuid` varchar(191) NOT NULL,
  `type` varchar(50) NOT NULL,
  `type_money` varchar(50) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `providers` varchar(191) NOT NULL,
  `refunded` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `round_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(1, 5, '1f01eed2-2c23-6538-bd11-2618be29cf44', '1f01eed2-2c2d-6eca-835c-2618be29cf44', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '1f01eed2-2c23-6538-bd11-2618be29cf44', '2025-04-21 17:13:49', '2025-04-21 17:13:49'),
(2, 5, '1f01eed2-4680-6610-8a75-ce1594471451', '1f01eed2-468c-62b2-8ea0-ce1594471451', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '1f01eed2-4680-6610-8a75-ce1594471451', '2025-04-21 17:13:52', '2025-04-21 17:13:52'),
(3, 5, '1f01eed2-6efa-6e88-b039-ce85c15c8927', '1f01eed2-6f05-6a5e-846e-ce85c15c8927', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '1f01eed2-6efa-6e88-b039-ce85c15c8927', '2025-04-21 17:13:57', '2025-04-21 17:13:57'),
(4, 5, '1f01eed2-8b95-699e-b887-1ac84d318a75', '1f01eed2-8ba1-6230-9166-1ac84d318a75', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '1f01eed2-8b95-699e-b887-1ac84d318a75', '2025-04-21 17:13:59', '2025-04-21 17:13:59'),
(5, 5, '1f01eed2-a9cf-6d7e-a2d8-a611d6eaed82', '1f01eed2-a9db-6c50-832e-a611d6eaed82', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '1f01eed2-a9cf-6d7e-a2d8-a611d6eaed82', '2025-04-21 17:14:02', '2025-04-21 17:14:02'),
(6, 5, '1f01eed2-c92d-69f0-b987-ce1594471451', '1f01eed2-c939-6890-b1ff-ce1594471451', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '1f01eed2-c92d-69f0-b987-ce1594471451', '2025-04-21 17:14:07', '2025-04-21 17:14:07'),
(7, 5, '1f01eed2-f9a3-64b8-82bc-2aa3910ac6bf', '1f01eed2-f9ae-6b38-8494-2aa3910ac6bf', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '1f01eed2-f9a3-64b8-82bc-2aa3910ac6bf', '2025-04-21 17:14:11', '2025-04-21 17:14:11'),
(8, 5, '1f01eed3-2c3d-60b8-9bda-72575f16cbd1', '1f01eed3-2c48-6184-bdb9-72575f16cbd1', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance', 20.00, 'play_fiver', 0, 1, '1f01eed3-2c3d-60b8-9bda-72575f16cbd1', '2025-04-21 17:14:16', '2025-04-21 17:14:16'),
(9, 5, '1f01eed5-7434-68ce-aecc-a611d6eaed82', '1f01eed5-7443-65a4-b908-a611d6eaed82', 'vs20olympgate', 'vs20olympgate', 'win', 'balance', 1.52, 'play_fiver', 0, 1, '1f01eed5-7434-68ce-aecc-a611d6eaed82', '2025-04-21 17:15:17', '2025-04-21 17:15:17'),
(10, 5, '1f01eed7-df71-6e3c-a22f-3e57bb803779', '1f01eed7-df7c-6da0-a6a8-3e57bb803779', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed7-df71-6e3c-a22f-3e57bb803779', '2025-04-21 17:16:22', '2025-04-21 17:16:22'),
(11, 5, '1f01eed7-f606-6d78-b399-72575f16cbd1', '1f01eed7-f612-6e2a-bc6c-72575f16cbd1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed7-f606-6d78-b399-72575f16cbd1', '2025-04-21 17:16:25', '2025-04-21 17:16:25'),
(12, 5, '1f01eed8-1496-6dd8-a669-2618be29cf44', '1f01eed8-14a4-6938-8608-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed8-1496-6dd8-a669-2618be29cf44', '2025-04-21 17:16:28', '2025-04-21 17:16:28'),
(13, 5, '1f01eed8-31cb-61ba-9774-72575f16cbd1', '1f01eed8-31d7-63a2-9676-72575f16cbd1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed8-31cb-61ba-9774-72575f16cbd1', '2025-04-21 17:16:31', '2025-04-21 17:16:31'),
(14, 5, '1f01eed8-48e5-6544-af70-72575f16cbd1', '1f01eed8-48f1-692a-b868-72575f16cbd1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed8-48e5-6544-af70-72575f16cbd1', '2025-04-21 17:16:33', '2025-04-21 17:16:33'),
(15, 5, '1f01eed8-61f7-6df2-9671-72575f16cbd1', '1f01eed8-6202-6798-8118-72575f16cbd1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed8-61f7-6df2-9671-72575f16cbd1', '2025-04-21 17:16:36', '2025-04-21 17:16:36'),
(16, 5, '1f01eed8-ac30-6d1a-b8ac-2618be29cf44', '1f01eed8-ac40-6512-a6f9-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed8-ac30-6d1a-b8ac-2618be29cf44', '2025-04-21 17:16:44', '2025-04-21 17:16:44'),
(17, 5, '1f01eed8-c0d1-659e-bcee-2618be29cf44', '1f01eed8-c0dc-6cbe-b960-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed8-c0d1-659e-bcee-2618be29cf44', '2025-04-21 17:16:46', '2025-04-21 17:16:46'),
(18, 5, '1f01eed8-d17b-650c-ac1d-2aa3910ac6bf', '1f01eed8-d186-68bc-9615-2aa3910ac6bf', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed8-d17b-650c-ac1d-2aa3910ac6bf', '2025-04-21 17:16:47', '2025-04-21 17:16:47'),
(19, 5, '1f01eed8-e5f6-65ae-96a3-2618be29cf44', '1f01eed8-e600-6d24-a077-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed8-e5f6-65ae-96a3-2618be29cf44', '2025-04-21 17:16:49', '2025-04-21 17:16:49'),
(20, 5, '1f01eed8-f9a1-6a4a-a936-1ac84d318a75', '1f01eed8-f9ae-6722-9890-1ac84d318a75', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed8-f9a1-6a4a-a936-1ac84d318a75', '2025-04-21 17:16:52', '2025-04-21 17:16:52'),
(21, 5, '1f01eed9-0b5d-693c-abd0-72575f16cbd1', '1f01eed9-0b6b-66f4-ad1a-72575f16cbd1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-0b5d-693c-abd0-72575f16cbd1', '2025-04-21 17:16:54', '2025-04-21 17:16:54'),
(22, 5, '1f01eed9-1e95-6f86-9690-2aa3910ac6bf', '1f01eed9-1ea2-6aa6-8650-2aa3910ac6bf', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-1e95-6f86-9690-2aa3910ac6bf', '2025-04-21 17:16:55', '2025-04-21 17:16:55'),
(23, 5, '1f01eed9-335d-68d8-a21b-ce85c15c8927', '1f01eed9-336a-640c-84c6-ce85c15c8927', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-335d-68d8-a21b-ce85c15c8927', '2025-04-21 17:16:58', '2025-04-21 17:16:58'),
(24, 5, '1f01eed9-4453-6430-886f-a611d6eaed82', '1f01eed9-445d-6e58-920a-a611d6eaed82', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-4453-6430-886f-a611d6eaed82', '2025-04-21 17:17:00', '2025-04-21 17:17:00'),
(25, 5, '1f01eed9-565b-66a0-98ce-5a4c206373c1', '1f01eed9-5666-646a-b197-5a4c206373c1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-565b-66a0-98ce-5a4c206373c1', '2025-04-21 17:17:01', '2025-04-21 17:17:01'),
(26, 5, '1f01eed9-8e6f-6b90-88f1-1ac84d318a75', '1f01eed9-8e7f-696e-ba03-1ac84d318a75', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-8e6f-6b90-88f1-1ac84d318a75', '2025-04-21 17:17:07', '2025-04-21 17:17:07'),
(27, 5, '1f01eed9-a53d-6d40-bbfd-ce85c15c8927', '1f01eed9-a548-6eac-b6a4-ce85c15c8927', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-a53d-6d40-bbfd-ce85c15c8927', '2025-04-21 17:17:10', '2025-04-21 17:17:10'),
(28, 5, '1f01eed9-b5a9-667a-9801-72575f16cbd1', '1f01eed9-b5b4-6322-9f87-72575f16cbd1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-b5a9-667a-9801-72575f16cbd1', '2025-04-21 17:17:11', '2025-04-21 17:17:11'),
(29, 5, '1f01eed9-cc03-6bc8-ad48-1ac84d318a75', '1f01eed9-cc10-6e54-b7dc-1ac84d318a75', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-cc03-6bc8-ad48-1ac84d318a75', '2025-04-21 17:17:14', '2025-04-21 17:17:14'),
(30, 5, '1f01eed9-dcc1-679e-9581-2618be29cf44', '1f01eed9-dccc-65b8-8f2a-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-dcc1-679e-9581-2618be29cf44', '2025-04-21 17:17:16', '2025-04-21 17:17:16'),
(31, 5, '1f01eed9-eefb-6752-b100-ce1594471451', '1f01eed9-ef09-61cc-a076-ce1594471451', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-eefb-6752-b100-ce1594471451', '2025-04-21 17:17:18', '2025-04-21 17:17:18'),
(32, 5, '1f01eed9-ff61-64f2-b46a-5a4c206373c1', '1f01eed9-ff6c-6370-ba7a-5a4c206373c1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eed9-ff61-64f2-b46a-5a4c206373c1', '2025-04-21 17:17:19', '2025-04-21 17:17:19'),
(33, 5, '1f01eeda-178f-67cc-8e6f-2618be29cf44', '1f01eeda-179a-64f6-af23-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-178f-67cc-8e6f-2618be29cf44', '2025-04-21 17:17:22', '2025-04-21 17:17:22'),
(34, 5, '1f01eeda-2999-6fd0-887c-a611d6eaed82', '1f01eeda-29a9-62fa-b35d-a611d6eaed82', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-2999-6fd0-887c-a611d6eaed82', '2025-04-21 17:17:24', '2025-04-21 17:17:24'),
(35, 5, '1f01eeda-3a80-6fc4-bc4b-1ac84d318a75', '1f01eeda-3a8c-6392-8662-1ac84d318a75', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-3a80-6fc4-bc4b-1ac84d318a75', '2025-04-21 17:17:25', '2025-04-21 17:17:25'),
(36, 5, '1f01eeda-4b5d-6b62-b672-a611d6eaed82', '1f01eeda-4b68-6922-b814-a611d6eaed82', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-4b5d-6b62-b672-a611d6eaed82', '2025-04-21 17:17:27', '2025-04-21 17:17:27'),
(37, 5, '1f01eeda-6a70-66f8-9dc5-2618be29cf44', '1f01eeda-6a7c-6700-867e-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-6a70-66f8-9dc5-2618be29cf44', '2025-04-21 17:17:30', '2025-04-21 17:17:30'),
(38, 5, '1f01eeda-80ab-6210-880c-ce85c15c8927', '1f01eeda-80b7-6222-8176-ce85c15c8927', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-80ab-6210-880c-ce85c15c8927', '2025-04-21 17:17:33', '2025-04-21 17:17:33'),
(39, 5, '1f01eeda-90f3-66a4-8418-2aa3910ac6bf', '1f01eeda-90fe-6d2e-972d-2aa3910ac6bf', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-90f3-66a4-8418-2aa3910ac6bf', '2025-04-21 17:17:34', '2025-04-21 17:17:34'),
(40, 5, '1f01eeda-a78e-686e-ad0d-5a4c206373c1', '1f01eeda-a79d-6af8-b5de-5a4c206373c1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-a78e-686e-ad0d-5a4c206373c1', '2025-04-21 17:17:37', '2025-04-21 17:17:37'),
(41, 5, '1f01eeda-b84e-683e-b60e-3e57bb803779', '1f01eeda-b859-68ba-b235-3e57bb803779', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-b84e-683e-b60e-3e57bb803779', '2025-04-21 17:17:39', '2025-04-21 17:17:39'),
(42, 5, '1f01eeda-c9cc-6660-9928-a611d6eaed82', '1f01eeda-c9d8-68ca-80cb-a611d6eaed82', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-c9cc-6660-9928-a611d6eaed82', '2025-04-21 17:17:40', '2025-04-21 17:17:40'),
(43, 5, '1f01eeda-dac7-66cc-88a5-72575f16cbd1', '1f01eeda-dad3-6544-8568-72575f16cbd1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-dac7-66cc-88a5-72575f16cbd1', '2025-04-21 17:17:42', '2025-04-21 17:17:42'),
(44, 5, '1f01eeda-ecbf-6e2e-8d95-ce1594471451', '1f01eeda-ecca-6b3a-bb2f-ce1594471451', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-ecbf-6e2e-8d95-ce1594471451', '2025-04-21 17:17:44', '2025-04-21 17:17:44'),
(45, 5, '1f01eeda-fd8b-6b0e-b397-2618be29cf44', '1f01eeda-fd96-6554-91b1-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eeda-fd8b-6b0e-b397-2618be29cf44', '2025-04-21 17:17:46', '2025-04-21 17:17:46'),
(46, 5, '1f01eedb-23e9-69cc-a846-5a4c206373c1', '1f01eedb-23f5-6ac4-9d8b-5a4c206373c1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-23e9-69cc-a846-5a4c206373c1', '2025-04-21 17:17:50', '2025-04-21 17:17:50'),
(47, 5, '1f01eedb-3633-6ce0-9108-2618be29cf44', '1f01eedb-363f-6540-aebd-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-3633-6ce0-9108-2618be29cf44', '2025-04-21 17:17:52', '2025-04-21 17:17:52'),
(48, 5, '1f01eedb-46e8-61d0-93df-72575f16cbd1', '1f01eedb-46f3-67c4-aefe-72575f16cbd1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-46e8-61d0-93df-72575f16cbd1', '2025-04-21 17:17:53', '2025-04-21 17:17:53'),
(49, 5, '1f01eedb-57e0-6eec-9fc6-3e57bb803779', '1f01eedb-57ec-6a76-bf52-3e57bb803779', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-57e0-6eec-9fc6-3e57bb803779', '2025-04-21 17:17:55', '2025-04-21 17:17:55'),
(50, 5, '1f01eedb-6ff0-6f78-826f-2618be29cf44', '1f01eedb-6ffc-6242-bbcc-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-6ff0-6f78-826f-2618be29cf44', '2025-04-21 17:17:58', '2025-04-21 17:17:58'),
(51, 5, '1f01eedb-80e0-6cac-b516-72575f16cbd1', '1f01eedb-80eb-6e2c-b1f5-72575f16cbd1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-80e0-6cac-b516-72575f16cbd1', '2025-04-21 17:18:00', '2025-04-21 17:18:00'),
(52, 5, '1f01eedb-9310-6756-a319-2618be29cf44', '1f01eedb-931b-6656-89aa-2618be29cf44', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-9310-6756-a319-2618be29cf44', '2025-04-21 17:18:02', '2025-04-21 17:18:02'),
(53, 5, '1f01eedb-a40d-6eb4-9423-2aa3910ac6bf', '1f01eedb-a418-6a30-888e-2aa3910ac6bf', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-a40d-6eb4-9423-2aa3910ac6bf', '2025-04-21 17:18:03', '2025-04-21 17:18:03'),
(54, 5, '1f01eedb-b478-6e52-b809-a611d6eaed82', '1f01eedb-b485-6de6-b76e-a611d6eaed82', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-b478-6e52-b809-a611d6eaed82', '2025-04-21 17:18:06', '2025-04-21 17:18:06'),
(55, 5, '1f01eedb-c504-6d98-9e81-ce85c15c8927', '1f01eedb-c510-67d8-8555-ce85c15c8927', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance', 0.10, 'play_fiver', 0, 1, '1f01eedb-c504-6d98-9e81-ce85c15c8927', '2025-04-21 17:18:08', '2025-04-21 17:18:08'),
(56, 5, '6806a84de6887', '1f01eede-bbaa-6984-8fb9-ce85c15c8927', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a84de6887', '2025-04-21 17:19:26', '2025-04-21 17:19:26'),
(57, 5, '6806a86f93bb3', '1f01eedf-fcae-6ca4-b3ae-3e57bb803779', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a86f93bb3', '2025-04-21 17:20:00', '2025-04-21 17:20:00'),
(58, 5, '6806a872ef9e0', '1f01eee0-1ce1-6a62-8f9b-a611d6eaed82', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a872ef9e0', '2025-04-21 17:20:03', '2025-04-21 17:20:03'),
(59, 5, '6806a87620000', '1f01eee0-3aea-6fcc-970c-8aa772090257', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a87620000', '2025-04-21 17:20:07', '2025-04-21 17:20:07'),
(60, 5, '6806a8795005d', '1f01eee0-5967-6784-b0f6-5a4c206373c1', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a8795005d', '2025-04-21 17:20:10', '2025-04-21 17:20:10'),
(61, 5, '6806a87c2f36f', '1f01eee0-74bb-68d2-8e55-ce1594471451', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a87c2f36f', '2025-04-21 17:20:13', '2025-04-21 17:20:13'),
(62, 5, '6806a87f1d63a', '1f01eee0-90a6-6196-815b-5222e75e5b40', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a87f1d63a', '2025-04-21 17:20:15', '2025-04-21 17:20:15'),
(63, 5, '6806a8820900b', '1f01eee0-ac76-6402-a94f-3e57bb803779', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a8820900b', '2025-04-21 17:20:18', '2025-04-21 17:20:18'),
(64, 5, '6806a8851c313', '1f01eee0-c9d1-6d94-b0af-72575f16cbd1', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a8851c313', '2025-04-21 17:20:22', '2025-04-21 17:20:22'),
(65, 5, '6806a8882f23a', '1f01eee0-e72b-6d22-9c11-ce1594471451', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a8882f23a', '2025-04-21 17:20:24', '2025-04-21 17:20:24'),
(66, 5, '6806a88b92928', '1f01eee1-07aa-6d8c-a7b3-a611d6eaed82', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a88b92928', '2025-04-21 17:20:28', '2025-04-21 17:20:28'),
(67, 5, '6806a88ec73b4', '1f01eee1-2655-6232-9cda-5222e75e5b40', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a88ec73b4', '2025-04-21 17:20:31', '2025-04-21 17:20:31'),
(68, 5, '6806a891edd21', '1f01eee1-4473-62c8-b2bc-2618be29cf44', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a891edd21', '2025-04-21 17:20:35', '2025-04-21 17:20:35'),
(69, 5, '6806a894dc638', '1f01eee1-6061-63a4-af2b-2618be29cf44', '1508783', '1508783', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6806a894dc638', '2025-04-21 17:20:38', '2025-04-21 17:20:38'),
(70, 5, '6806a8981e506', '1f01eee1-7f19-6fda-80f2-5222e75e5b40', '1508783', '1508783', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6806a8981e506', '2025-04-21 17:20:41', '2025-04-21 17:20:41'),
(71, 5, '6806a89b3912d', '1f01eee1-9cc1-6b5a-b77f-5222e75e5b40', '1508783', '1508783', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6806a89b3912d', '2025-04-21 17:20:44', '2025-04-21 17:20:44'),
(72, 5, '6806a89e29fb6', '1f01eee1-b8c7-66d8-bf30-a611d6eaed82', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806a89e29fb6', '2025-04-21 17:20:47', '2025-04-21 17:20:47'),
(73, 4, '6806ddf6cb375', '1f01f0de-78d7-6484-ac0e-8a561e998b80', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6806ddf6cb375', '2025-04-21 21:08:24', '2025-04-21 21:08:24'),
(74, 4, '6806ddf9c437d', '1f01f0de-952d-65f2-8f25-1ac84d318a75', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6806ddf9c437d', '2025-04-21 21:08:27', '2025-04-21 21:08:27'),
(75, 4, '6806ddfd06af5', '1f01f0de-b3ec-6056-8fd8-5a4c206373c1', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6806ddfd06af5', '2025-04-21 21:08:30', '2025-04-21 21:08:30'),
(76, 4, '6806ddffeacc9', '1f01f0de-cfe7-6a8a-a551-3e57bb803779', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806ddffeacc9', '2025-04-21 21:08:33', '2025-04-21 21:08:33'),
(77, 4, '6806de03b0ab3', '1f01f0de-f3c7-6f04-86a2-d6368d4ba514', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de03b0ab3', '2025-04-21 21:08:36', '2025-04-21 21:08:36'),
(78, 4, '6806de06d209a', '1f01f0df-11b1-6d8a-9694-2ef1073dde53', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de06d209a', '2025-04-21 21:08:40', '2025-04-21 21:08:40'),
(79, 4, '6806de0e3a817', '1f01f0df-5811-6c4e-a4e9-723ca0305a3d', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de0e3a817', '2025-04-21 21:08:47', '2025-04-21 21:08:47'),
(80, 4, '6806de0fb7b85', '1f01f0df-667f-652e-8c53-d6368d4ba514', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de0fb7b85', '2025-04-21 21:08:48', '2025-04-21 21:08:48'),
(81, 4, '6806de1156165', '1f01f0df-75c1-6cd0-913d-5a4c206373c1', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de1156165', '2025-04-21 21:08:50', '2025-04-21 21:08:50'),
(82, 4, '6806de136fff7', '1f01f0df-89d7-6990-8fe5-fe3bada48bfa', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de136fff7', '2025-04-21 21:08:52', '2025-04-21 21:08:52'),
(83, 4, '6806de153b361', '1f01f0df-9ada-6918-ac90-1ac84d318a75', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de153b361', '2025-04-21 21:08:54', '2025-04-21 21:08:54'),
(84, 4, '6806de1a142b0', '1f01f0df-c903-6614-97c5-8a561e998b80', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de1a142b0', '2025-04-21 21:08:59', '2025-04-21 21:08:59'),
(85, 4, '6806de1ba7280', '1f01f0df-d84a-68f2-a429-8a561e998b80', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de1ba7280', '2025-04-21 21:09:00', '2025-04-21 21:09:00'),
(86, 4, '6806de1d91efd', '1f01f0df-ea89-62fc-b1a5-723ca0305a3d', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6806de1d91efd', '2025-04-21 21:09:02', '2025-04-21 21:09:02'),
(87, 4, '6806de208d545', '1f01f0e0-06f7-6574-a345-5a4c206373c1', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, '6806de208d545', '2025-04-21 21:09:05', '2025-04-21 21:09:05'),
(88, 4, '6806de2257615', '1f01f0e0-17ee-6a94-958c-723ca0305a3d', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, '6806de2257615', '2025-04-21 21:09:07', '2025-04-21 21:09:07'),
(89, 4, '6806de8faf9ed', '1f01f0e4-2ae2-6570-8079-fe3bada48bfa', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, '6806de8faf9ed', '2025-04-21 21:10:56', '2025-04-21 21:10:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`, `expires_at`) VALUES
('mfernandessilva01@gmail.com', 'szeuQibu8JKpCdIl16PPcAuLVxXht9Xn2nQXLGaCTKxAzCMwYTfvjIRX4zY9', '2025-06-27 01:44:21', '2025-06-27 01:49:21'),
('luanff9287@gmail.com', '9nK02GJEqhfoTmc8jcVCDjn0oiKgzur4pJ1mscXcO3jI2sqTs52h7YzBoY5Q', '2025-06-29 02:17:42', '2025-06-29 02:22:42'),
('shadowoflux@gmail.com', 'zFVEXx7FDlgG5Lx79MbITY4RkCVPx3LLe2Tj7QPQAk1kCeSSo6SmEUsHIlzs', '2025-07-02 17:13:20', '2025-07-02 17:18:20'),
('scorpiogamer259@gmail.com', 'JFqxF6hVbrGMLmmjVpdS9jCh0D1ZkJ5QoMcBp9DOH1qq2874Y6d5aAn65vL6', '2025-07-04 19:53:30', '2025-07-04 19:58:30'),
('luccapoleze@gmail.com', 'tFKkHexNqPFwNdfLBUKdlx8cOGFmCw8ktk6MjrU4J6XUeiX9keyZw3rzy4wU', '2025-07-11 11:39:26', '2025-07-11 11:44:26'),
('felipesoarescruz1994@gmail.com', 'q3wZBiX3bzuivAW0x78WInzyvOY09gRhoYFmGlUkRC0bZYFGSKtbTHcW7NVA', '2025-07-12 16:49:44', '2025-07-12 16:54:44'),
('marcospaulosanntosboy@gmail.com', 'q0NOpiv9PRrF86Zta8UsTJQjGjVRQiBZkN7bdJwIfeVfe2YVARTcoMkgDtd0', '2025-07-19 22:13:12', '2025-07-19 22:18:12'),
('alexander.23112013@gmail.com', 'TMGTpoLoas6FDD70pTYZMjlXjS67ZaiXLL0LCx8nkVD3pd4NjI1I8xV7J2l7', '2025-07-20 19:13:30', '2025-07-20 19:18:30'),
('luizjhow1@hotmail.com', '6ARWIHQtMzfUiNSp84qhmsZYoc4cGDF7o3MiQpdXJhtnEXvk1HMnGffdNxHh', '2025-07-23 12:24:19', '2025-07-23 12:29:19'),
('xitiibig@gmail.com', 'ReamzhGkXxmA1korwUEbOl2NPIE5sQkX9eemNrukOdYYlm0DfF4EiEoED0fo', '2025-07-25 16:18:17', '2025-07-25 16:23:17'),
('smurfdevava00@gmail.com', 'py2vixMj4S8cuiCIMhcU5Y3Nw7nwRnXU8Pm39f1SR9FeZD0O7NJSJOdtUG4w', '2025-08-09 17:20:31', '2025-08-09 17:25:31'),
('nandin7152@gmail.com', '1QrnlAmybxxQUgCk6CRbhS1TBKwe9PdX8nQ7JXPvhj93Ku5U1PoqfCUx4qxw', '2025-08-12 17:11:16', '2025-08-12 17:16:16'),
('arielcesar98@hotmail.com', 'UE4vbVeat9TdoSjk85ruoMATSOhWQNUhcNeLGKMXcjc33N6yAlBMqpk7bw2H', '2025-08-21 13:59:32', '2025-08-21 14:04:32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'games-exclusive-edit', 'web', '2023-10-12 19:23:45', '2023-10-12 21:12:28'),
(2, 'games-exclusive-view', 'web', '2023-10-12 19:23:56', '2023-10-12 21:11:25'),
(3, 'games-exclusive-create', 'web', '2023-10-12 19:25:06', '2023-10-12 21:11:10'),
(4, 'admin-view', 'web', '2023-10-12 20:56:35', '2023-10-12 20:56:35'),
(5, 'admin-create', 'web', '2023-10-12 21:56:02', '2023-10-12 21:56:02'),
(6, 'admin-edit', 'web', '2023-10-12 21:56:27', '2023-10-12 21:56:27'),
(7, 'admin-delete', 'web', '2023-10-12 21:56:55', '2023-10-12 21:56:55'),
(8, 'category-view', 'web', '2023-10-12 22:01:31', '2023-10-12 22:01:31'),
(9, 'category-create', 'web', '2023-10-12 22:01:46', '2023-10-12 22:01:46'),
(10, 'category-edit', 'web', '2023-10-12 22:01:59', '2023-10-12 22:01:59'),
(11, 'category-delete', 'web', '2023-10-12 22:02:09', '2023-10-12 22:02:09'),
(12, 'game-view', 'web', '2023-10-12 22:02:27', '2023-10-12 22:02:27'),
(13, 'game-create', 'web', '2023-10-12 22:02:36', '2023-10-12 22:02:36'),
(14, 'game-edit', 'web', '2023-10-12 22:02:44', '2023-10-12 22:02:44'),
(15, 'game-delete', 'web', '2023-10-12 22:02:54', '2023-10-12 22:02:54'),
(16, 'wallet-view', 'web', '2023-10-12 22:05:49', '2023-10-12 22:05:49'),
(17, 'wallet-create', 'web', '2023-10-12 22:06:01', '2023-10-12 22:06:01'),
(18, 'wallet-edit', 'web', '2023-10-12 22:06:11', '2023-10-12 22:06:11'),
(19, 'wallet-delete', 'web', '2023-10-12 22:06:18', '2023-10-12 22:06:18'),
(20, 'deposit-view', 'web', '2023-10-12 22:06:44', '2023-10-12 22:06:44'),
(21, 'deposit-create', 'web', '2023-10-12 22:06:56', '2023-10-12 22:06:56'),
(22, 'deposit-edit', 'web', '2023-10-12 22:07:05', '2023-10-12 22:07:05'),
(23, 'deposit-update', 'web', '2023-10-12 22:08:00', '2023-10-12 22:08:00'),
(24, 'deposit-delete', 'web', '2023-10-12 22:08:11', '2023-10-12 22:08:11'),
(25, 'withdrawal-view', 'web', '2023-10-12 22:09:31', '2023-10-12 22:09:31'),
(26, 'withdrawal-create', 'web', '2023-10-12 22:09:40', '2023-10-12 22:09:40'),
(27, 'withdrawal-edit', 'web', '2023-10-12 22:09:51', '2023-10-12 22:09:51'),
(28, 'withdrawal-update', 'web', '2023-10-12 22:10:00', '2023-10-12 22:10:00'),
(29, 'withdrawal-delete', 'web', '2023-10-12 22:10:09', '2023-10-12 22:10:09'),
(30, 'order-view', 'web', '2023-10-12 22:12:36', '2023-10-12 22:12:36'),
(31, 'order-create', 'web', '2023-10-12 22:12:47', '2023-10-12 22:12:47'),
(32, 'order-edit', 'web', '2023-10-12 22:12:56', '2023-10-12 22:12:56'),
(33, 'order-update', 'web', '2023-10-12 22:13:06', '2023-10-12 22:13:06'),
(34, 'order-delete', 'web', '2023-10-12 22:13:19', '2023-10-12 22:13:19'),
(35, 'admin-menu-view', 'web', '2023-10-12 23:26:06', '2023-10-12 23:26:06'),
(36, 'setting-view', 'web', '2023-10-13 00:25:46', '2023-10-13 00:25:46'),
(37, 'setting-create', 'web', '2023-10-13 00:25:57', '2023-10-13 00:25:57'),
(38, 'setting-edit', 'web', '2023-10-13 00:26:06', '2023-10-13 00:26:06'),
(39, 'setting-update', 'web', '2023-10-13 00:26:19', '2023-10-13 00:26:19'),
(40, 'setting-delete', 'web', '2023-10-13 00:26:33', '2023-10-13 00:26:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `promocoes`
--

CREATE TABLE `promocoes` (
  `id` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `regras_html` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `rtp` bigint(20) DEFAULT 90,
  `views` bigint(20) DEFAULT 1,
  `distribution` varchar(50) DEFAULT 'play_fiver',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `providers`
--

INSERT INTO `providers` (`id`, `cover`, `code`, `name`, `status`, `rtp`, `views`, `distribution`, `created_at`, `updated_at`) VALUES
(1, 'Provedores/PGSOFT.webp', 'PGSOFT', 'PGSOFT', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:52', '2025-04-14 18:55:52'),
(2, 'Provedores/PRAGMATIC.webp', 'PRAGMATIC', 'PRAGMATIC', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:52', '2025-04-14 18:55:52'),
(3, 'Provedores/SPRIBE.webp', 'SPRIBE', 'SPRIBE', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:53', '2025-04-14 18:55:53'),
(4, 'Provedores/GALAXSYS.webp', 'GALAXSYS ORIGINAL', 'GALAXSYS', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:53', '2025-04-14 18:55:53'),
(5, 'Provedores/NOVAMATIC.webp', 'NOVAMATIC ORIGINAL', 'NOVAMATIC', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:53', '2025-04-14 18:55:53'),
(6, 'Provedores/MICROGAMING.webp', 'MICROGAMING ORIGINAL', 'MICROGAMING ', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:53', '2025-04-14 18:55:53'),
(7, 'Provedores/HABANERO.webp', 'HABANERO', 'HABANERO', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:53', '2025-04-14 18:55:53'),
(8, 'Provedores/NETENT.webp', 'NETENT ORIGINAL', 'NETENT', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:53', '2025-04-14 18:55:53'),
(9, 'Provedores/PLAYSON.webp', 'PLAYSON', 'PLAYSON', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:53', '2025-04-14 18:55:53'),
(10, 'Provedores/TOPTREND.webp', 'TOPTREND', 'TOPTREND', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(11, 'Provedores/DREAMTECH.webp', 'DREAMTECH', 'DREAMTECH', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(12, 'Provedores/EVOPLAY.webp', 'EVOPLAY', 'EVOPLAY', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(13, 'Provedores/BOOONGO.webp', 'BOOONGO', 'BOOONGO', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(14, 'Provedores/CQ9.webp', 'CQ9', 'CQ9', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(15, 'Provedores/REELKINGDOM.webp', 'REELKINGDOM', 'REELKINGDOM', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(16, 'Provedores/HABANERO.webp', 'HABANERO ORIGINAL', 'HABANERO', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(17, 'Provedores/JETX.webp', 'JETX ORIGINAL', 'JETX', 0, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(18, 'Provedores/PGSOFT.webp', 'PGSOFT ORIGINAL', 'PGSOFT', 0, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(19, 'Provedores/SPRIBE.webp', 'SPRIBE ORIGINAL', 'SPRIBE', 0, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(20, 'Provedores/FISH.webp', 'FISH ORIGINAL', 'FISH ORIGINAL', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(21, 'Provedores/PRAGMATIC.webp', 'PRAGMATIC PLAY OFICIAL', 'PRAGMATIC PLAY', 0, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(22, 'Provedores/PRAGMATICLIVE.webp', 'PRAGMATIC LIVE OFICIAL', 'PRAGMATIC LIVE', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54'),
(23, 'Provedores/EVOLUTION.webp', 'EVOLUTION ORIGINAL', 'EVOLUTION', 1, 0, 0, 'play_fiver', '2025-04-14 18:55:54', '2025-04-14 18:55:54');

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-10-12 19:20:41', '2023-10-12 19:20:41'),
(2, 'afiliado', 'web', '2023-10-12 19:21:08', '2023-10-12 19:21:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_name` varchar(255) DEFAULT NULL,
  `software_description` varchar(255) DEFAULT NULL,
  `software_favicon` varchar(255) DEFAULT NULL,
  `software_logo_white` varchar(255) DEFAULT NULL,
  `software_logo_black` varchar(255) DEFAULT NULL,
  `software_background` varchar(255) DEFAULT NULL,
  `currency_code` varchar(191) NOT NULL DEFAULT 'BRL',
  `decimal_format` varchar(20) NOT NULL DEFAULT 'dot',
  `currency_position` varchar(20) NOT NULL DEFAULT 'left',
  `revshare_percentage` bigint(20) DEFAULT 20,
  `ngr_percent` bigint(20) DEFAULT 20,
  `soccer_percentage` bigint(20) DEFAULT 30,
  `prefix` varchar(191) NOT NULL DEFAULT 'R$',
  `storage` varchar(191) NOT NULL DEFAULT 'local',
  `initial_bonus` bigint(20) DEFAULT 0,
  `min_deposit` decimal(10,2) DEFAULT 20.00,
  `max_deposit` decimal(10,2) DEFAULT 0.00,
  `min_withdrawal` decimal(10,2) DEFAULT 20.00,
  `max_withdrawal` decimal(10,2) DEFAULT 0.00,
  `rollover` bigint(20) DEFAULT 10,
  `rollover_deposit` bigint(20) DEFAULT 1,
  `suitpay_is_enable` tinyint(4) DEFAULT 1,
  `stripe_is_enable` tinyint(4) DEFAULT 1,
  `bspay_is_enable` tinyint(4) DEFAULT 0,
  `turn_on_football` tinyint(4) DEFAULT 1,
  `revshare_reverse` tinyint(1) DEFAULT 1,
  `bonus_vip` bigint(20) DEFAULT 100,
  `activate_vip_bonus` tinyint(1) DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT NULL,
  `maintenance_mode` tinyint(4) DEFAULT 0,
  `withdrawal_limit` bigint(20) DEFAULT NULL,
  `withdrawal_period` varchar(30) DEFAULT NULL,
  `disable_spin` tinyint(1) NOT NULL DEFAULT 0,
  `perc_sub_lv1` bigint(20) NOT NULL DEFAULT 4,
  `perc_sub_lv2` bigint(20) NOT NULL DEFAULT 2,
  `perc_sub_lv3` bigint(20) NOT NULL DEFAULT 3,
  `sharkpay_is_enable` tinyint(1) DEFAULT 0,
  `digito_is_enable` tinyint(1) NOT NULL DEFAULT 0,
  `ezzepay_is_enable` tinyint(1) NOT NULL DEFAULT 0,
  `saque` varchar(191) NOT NULL DEFAULT 'ezzepay',
  `cpa_baseline` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cpa_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `disable_rollover` tinyint(1) DEFAULT 0,
  `rollover_protection` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `software_name`, `software_description`, `software_favicon`, `software_logo_white`, `software_logo_black`, `software_background`, `currency_code`, `decimal_format`, `currency_position`, `revshare_percentage`, `ngr_percent`, `soccer_percentage`, `prefix`, `storage`, `initial_bonus`, `min_deposit`, `max_deposit`, `min_withdrawal`, `max_withdrawal`, `rollover`, `rollover_deposit`, `suitpay_is_enable`, `stripe_is_enable`, `bspay_is_enable`, `turn_on_football`, `revshare_reverse`, `bonus_vip`, `activate_vip_bonus`, `updated_at`, `maintenance_mode`, `withdrawal_limit`, `withdrawal_period`, `disable_spin`, `perc_sub_lv1`, `perc_sub_lv2`, `perc_sub_lv3`, `sharkpay_is_enable`, `digito_is_enable`, `ezzepay_is_enable`, `saque`, `cpa_baseline`, `cpa_value`, `disable_rollover`, `rollover_protection`) VALUES
(1, 'AtivaPLAY.BET', 'Aposte e ganhe na Casino! Cassino ao vivo, jogos de roleta, blackjack, slots e apostas esportivas. Depósitos via Pix e saques instantâneos.', '[]', 'uploads/9TOqv05B0koU0Y7JzzqJjyUkEg5pPSXDNB0m5wqF.png', 'uploads/xCG9R6uSx7zvMs6mUaoROs7G1Aqlc7vCZX7y8CMm.png', '[]', 'BRL', 'dot', 'left', 0, 0, 30, 'R$', 'local', 0, 30.00, 10000.00, 30.00, 10000.00, 2, 0, 0, 0, 1, 0, 0, 100, 0, '2025-07-01 14:10:28', 0, 10000, 'daily', 0, 0, 0, 0, 0, 0, 0, 'bspay', 30.00, 10.00, 0, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `setting_mails`
--

CREATE TABLE `setting_mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `software_smtp_type` varchar(30) DEFAULT NULL,
  `software_smtp_mail_host` varchar(100) DEFAULT NULL,
  `software_smtp_mail_port` varchar(30) DEFAULT NULL,
  `software_smtp_mail_username` varchar(191) DEFAULT NULL,
  `software_smtp_mail_password` varchar(100) DEFAULT NULL,
  `software_smtp_mail_encryption` varchar(30) DEFAULT NULL,
  `software_smtp_mail_from_address` varchar(191) DEFAULT NULL,
  `software_smtp_mail_from_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `setting_mails`
--

INSERT INTO `setting_mails` (`id`, `software_smtp_type`, `software_smtp_mail_host`, `software_smtp_mail_port`, `software_smtp_mail_username`, `software_smtp_mail_password`, `software_smtp_mail_encryption`, `software_smtp_mail_from_address`, `software_smtp_mail_from_name`, `created_at`, `updated_at`) VALUES
(1, 'smtp', 'smtp.titan.email', '465', '', '', 'ssl', '', '', '2024-03-12 18:34:31', '2024-08-26 17:28:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sub_affiliates`
--

CREATE TABLE `sub_affiliates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `affiliate_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suit_pay_payments`
--

CREATE TABLE `suit_pay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `withdrawal_id` bigint(20) UNSIGNED NOT NULL,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `observation` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `system_wallets`
--

CREATE TABLE `system_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` char(32) NOT NULL,
  `balance` decimal(27,12) NOT NULL DEFAULT 0.000000000000,
  `balance_min` decimal(27,12) NOT NULL DEFAULT 10000.100000000000,
  `pay_upto_percentage` decimal(4,2) NOT NULL DEFAULT 45.00,
  `mode` enum('balance_min','percentage') NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(20) NOT NULL DEFAULT 'usd',
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idUnico` varchar(191) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `transactions`
--

INSERT INTO `transactions` (`id`, `payment_id`, `user_id`, `payment_method`, `price`, `currency`, `status`, `created_at`, `updated_at`, `idUnico`) VALUES
(1, 'c4345addb84fb4dfb1b2m9qnm26w5wmb', 3, 'pix', 20.00, 'BRL', 0, '2025-04-21 02:47:12', '2025-04-21 02:47:12', '6805dbdfba232'),
(2, '586811345efffa36aa3em9rd3gp71b0q', 4, 'pix', 30.00, 'BRL', 0, '2025-04-21 14:40:35', '2025-04-21 14:40:35', '6806831218624'),
(3, 'f6980a9fd5e966608504m9rieiuq34zg', 5, 'pix', 30.00, 'BRL', 1, '2025-04-21 17:09:09', '2025-04-21 17:09:52', '6806a5e42c6fc'),
(4, '7d55a27c63218cb757fbm9rqv5jr3mu8', 4, 'pix', 30.00, 'BRL', 1, '2025-04-21 21:06:02', '2025-04-21 21:06:21', '6806dd691045c'),
(5, 'fa83647e4e6b6ec0d350m9s28i7e55l7', 8, 'pix', 30.00, 'BRL', 1, '2025-04-22 02:24:20', '2025-04-22 02:24:58', '68072803b69cf'),
(6, '3b007f118409bea3b975m9siih352rp3', 10, 'pix', 60.00, 'BRL', 1, '2025-04-22 09:59:59', '2025-04-22 10:02:34', '680792ceb0646'),
(7, 'c187d9cd432eaeba6b82m9t2d577lo09', 15, 'pix', 30.00, 'BRL', 0, '2025-04-22 19:15:43', '2025-04-22 19:15:43', '6808150e52d0b'),
(8, 'dadfa7cd5e79665fdd4emc2652jl5tdd', 21, 'pix', 30.00, 'BRL', 0, '2025-06-18 13:30:45', '2025-06-18 13:30:45', '6852e9b4aa013'),
(9, '271bbd19a93887dc24ffmc269tgl2hem', 21, 'pix', 1.00, 'BRL', 1, '2025-06-18 13:34:27', '2025-06-18 13:34:50', '6852ea9232f16'),
(10, '94cf9aca91be12c9d87dmc2xuevx1kmt', 24, 'pix', 30.00, 'BRL', 1, '2025-06-19 02:26:17', '2025-06-19 02:27:00', '68539f78b8e53'),
(11, 'abb1f2dce5091503a12emccjbxnw2a8z', 36, 'pix', 90.00, 'BRL', 1, '2025-06-25 19:37:42', '2025-06-25 19:38:23', '685c7a35b4e76'),
(12, '105d5c2e083177c654e8mcct4p1e40g9', 41, 'pix', 30.00, 'BRL', 1, '2025-06-26 00:12:01', '2025-06-26 00:13:02', '685cba801aa92'),
(13, 'c45a8790fc0bfc92765dmcdlxc4u5j3i', 46, 'pix', 60.00, 'BRL', 1, '2025-06-26 13:38:06', '2025-06-26 13:38:23', '685d776da0f90'),
(14, 'fa0ce32facdf5e9be084mce2a3aw45te', 51, 'pix', 30.00, 'BRL', 1, '2025-06-26 21:15:55', '2025-06-26 21:16:32', '685de2ba4b456'),
(15, '5f719c8bb3425db1be43mce2al4b10vl', 52, 'pix', 30.00, 'BRL', 1, '2025-06-26 21:16:18', '2025-06-26 21:16:55', '685de2d1ac072'),
(16, '5313cb75861b945c2f5dmce9pkav4q4m', 54, 'pix', 50.00, 'BRL', 0, '2025-06-27 00:43:54', '2025-06-27 00:43:54', '685e1379c400b'),
(17, 'ed4f418a4674a57e8e7dmce9q4sa2ub3', 54, 'pix', 100.00, 'BRL', 1, '2025-06-27 00:44:21', '2025-06-27 00:44:44', '685e139454bad'),
(18, '5e4f87b6f423b40ba1cemce9v96l11hh', 54, 'pix', 100.00, 'BRL', 1, '2025-06-27 00:48:20', '2025-06-27 00:48:37', '685e14834df1c'),
(19, '4d4c96d2231cf2648baemcemxv533gf7', 54, 'pix', 30.00, 'BRL', 0, '2025-06-27 06:54:16', '2025-06-27 06:54:16', '685e6a4818460'),
(20, 'a483e79b98955cb132cbmcg51vmn508a', 44, 'pix', 30.00, 'BRL', 1, '2025-06-28 08:09:03', '2025-06-28 08:09:54', '685fcd4e98663'),
(21, 'bf31ee782700a1e4a234mcgt25ny53k3', 85, 'pix', 50.00, 'BRL', 1, '2025-06-28 19:21:07', '2025-06-28 19:21:48', '68606ad2662fa'),
(22, '338b002f84f608489070mcgtojf95euk', 86, 'pix', 100.00, 'BRL', 0, '2025-06-28 19:38:31', '2025-06-28 19:38:31', '68606ee6a9bf6'),
(23, 'ad63e263e2823463b953mch80fjt583m', 94, 'pix', 30.00, 'BRL', 1, '2025-06-29 02:19:41', '2025-06-29 02:20:18', '6860ccec27625'),
(24, '4b9727f6747e53b0fd9amchlv16a3w3o', 98, 'pix', 40.00, 'BRL', 1, '2025-06-29 08:47:23', '2025-06-29 08:48:18', '686127cad3dc9'),
(25, '85cf10469ea58da094f4mchn3pmf4jmn', 100, 'pix', 30.00, 'BRL', 1, '2025-06-29 09:22:08', '2025-06-29 09:22:33', '68612fef64ade'),
(26, '8fc0f5660254f3ea288bmchprspc4i4r', 101, 'pix', 30.00, 'BRL', 1, '2025-06-29 10:36:50', '2025-06-29 10:37:48', '686141725aaa8'),
(27, 'd9c43732a44513ba08acmci06uz318h2', 108, 'pix', 30.00, 'BRL', 1, '2025-06-29 15:28:29', '2025-06-29 15:28:53', '686185cd4f92c'),
(28, 'b46d40a73edff812ecbbmci0d69t3igx', 109, 'pix', 30.00, 'BRL', 1, '2025-06-29 15:33:24', '2025-06-29 15:33:45', '686186f3db89c'),
(29, 'ef80f78bc392625ee506mcifkutbo7cw', 113, 'pix', 30.00, 'BRL', 1, '2025-06-29 22:39:17', '2025-06-29 22:39:47', '6861eac484c5c'),
(30, '6a7568208a7a05c1f49amcin2z9o532e', 116, 'pix', 30.00, 'BRL', 1, '2025-06-30 02:09:20', '2025-06-30 02:09:44', '68621bff6a4a2'),
(31, 'f871a7ea965ed6e75166mciqc2xi5441', 117, 'pix', 30.00, 'BRL', 0, '2025-06-30 03:40:23', '2025-06-30 03:40:23', '68623156e347e'),
(32, '1cf6dcea1ceea66d3e24mcjgmke71an7', 126, 'pix', 50.00, 'BRL', 1, '2025-06-30 15:56:23', '2025-06-30 15:56:57', '6862ddd620842'),
(33, '65f9ea7cda32da7e1fd3mcjo7rwq3rpo', 127, 'pix', 30.00, 'BRL', 1, '2025-06-30 19:28:49', '2025-06-30 19:36:06', '68630fa0ed8b8'),
(34, '6fb175acaf124e22ca99mckyckl44v3h', 133, 'pix', 30.00, 'BRL', 1, '2025-07-01 17:00:16', '2025-07-01 17:00:41', '68643e4f0ac45'),
(35, '99494d440de8c77c6b30mcl4qi184g2h', 135, 'pix', 30.00, 'BRL', 1, '2025-07-01 19:59:03', '2025-07-01 19:59:27', '68646836a428a'),
(36, '34c97b3828cb00ade48cmclbkt1241qy', 136, 'pix', 30.00, 'BRL', 0, '2025-07-01 23:10:35', '2025-07-01 23:10:35', '6864951a47e9b'),
(37, '33c61694c55345d2861fmclbm8924hez', 136, 'pix', 30.00, 'BRL', 1, '2025-07-01 23:11:41', '2025-07-01 23:11:58', '6864955ca7abc'),
(38, '121e7ec9cce084373e35mcliwy891aew', 139, 'pix', 30.00, 'BRL', 1, '2025-07-02 02:35:59', '2025-07-02 02:36:32', '6864c53e36d7f'),
(39, '68421378e554e7558410mclsfgtl4ft8', 143, 'pix', 30.00, 'BRL', 1, '2025-07-02 07:02:19', '2025-07-02 07:02:44', '686503aaa2a5b'),
(40, 'a824296116331abec701mcly5yeg3jw7', 144, 'pix', 30.00, 'BRL', 1, '2025-07-02 09:42:53', '2025-07-02 09:43:20', '6865294c88a37'),
(41, 'a6324475543f1e3fec39mcm5w36p1bfq', 145, 'pix', 60.00, 'BRL', 0, '2025-07-02 13:19:10', '2025-07-02 13:19:10', '68655bfd21878'),
(42, 'b8d90f246706077b4f5bmcm5wv1j1hxo', 145, 'pix', 60.00, 'BRL', 1, '2025-07-02 13:19:46', '2025-07-02 13:20:22', '68655c21397bd'),
(43, 'bbd22d989009d8c43711mcmhnno24t1h', 153, 'pix', 500.00, 'BRL', 1, '2025-07-02 18:48:32', '2025-07-02 18:48:51', '6865a92f2959e'),
(44, 'f2396321705a51a45c66mcmi42ew3hs6', 104, 'pix', 50.00, 'BRL', 0, '2025-07-02 19:01:18', '2025-07-02 19:01:18', '6865ac2cbf767'),
(45, 'c4bc6f19b64aea7b5132mcmw3gf91z6y', 111, 'pix', 30.00, 'BRL', 1, '2025-07-03 01:32:44', '2025-07-03 01:33:24', '686607eae1e02'),
(46, 'c65b6b38ae3210334b24mcmxp7cq1ezi', 160, 'pix', 100.00, 'BRL', 1, '2025-07-03 02:17:38', '2025-07-03 02:18:01', '6866127133ea4'),
(47, '1d1a0c88b02c96a34914mcmzvqik5tje', 161, 'pix', 30.00, 'BRL', 1, '2025-07-03 03:18:43', '2025-07-03 03:19:11', '686620c1361ee'),
(48, 'af9b11aff3244b9ec161mcn8sb9a37bd', 166, 'pix', 200.00, 'BRL', 1, '2025-07-03 07:27:59', '2025-07-03 07:29:17', '68665b2e0436c'),
(49, '7e27379c7672edd5cbeemco3s47z4mxy', 174, 'pix', 30.00, 'BRL', 1, '2025-07-03 21:55:40', '2025-07-03 21:56:00', '6867268900f8c'),
(50, 'b8239ff8bd635f5d89camco5n6hn1egh', 177, 'pix', 100.00, 'BRL', 1, '2025-07-03 22:47:48', '2025-07-03 22:48:15', '686732c1d4b5c'),
(51, 'bad2e7b48afad6e4046dmco9k3kf5a5k', 179, 'pix', 30.00, 'BRL', 1, '2025-07-04 00:37:22', '2025-07-04 00:38:34', '68674c709046e'),
(52, '4cafc4c96ded27e095aemcohkke22j6m', 182, 'pix', 50.00, 'BRL', 1, '2025-07-04 04:21:43', '2025-07-04 04:22:37', '686781034e316'),
(53, '6e1f6c075d8f23a635ebmcosvvm73c5b', 184, 'pix', 100.00, 'BRL', 1, '2025-07-04 09:38:26', '2025-07-04 09:39:01', '6867cb3ed023e'),
(54, '74da42969757fa66dbeemcouzcqh2p8s', 185, 'pix', 200.00, 'BRL', 1, '2025-07-04 10:37:08', '2025-07-04 10:37:31', '6867d9003859e'),
(55, '2847fb51c06e30a2f877mcovmvox22n8', 185, 'pix', 500.00, 'BRL', 0, '2025-07-04 10:55:24', '2025-07-04 10:55:24', '6867dd49db34d'),
(56, 'f644777f679c996089f7mcp28sky5lnh', 189, 'pix', 50.00, 'BRL', 0, '2025-07-04 14:00:24', '2025-07-04 14:00:24', '686808a5efede'),
(57, '5bf018bd708e1397d603mcp29f713v3s', 189, 'pix', 50.00, 'BRL', 1, '2025-07-04 14:00:55', '2025-07-04 14:01:38', '686808c34c392'),
(58, '9cfd52f8e71a57b7a28fmcpc133p1fw6', 191, 'pix', 30.00, 'BRL', 0, '2025-07-04 18:34:21', '2025-07-04 18:34:21', '686848da84c30'),
(59, 'a06e9d3c73611cc6e81fmcq3i4rr27qf', 193, 'pix', 40.00, 'BRL', 1, '2025-07-05 07:23:25', '2025-07-05 07:24:16', '6868fd1b79999'),
(60, 'e984af90445d052ce37fmcq3ulg1465l', 194, 'pix', 60.00, 'BRL', 1, '2025-07-05 07:33:08', '2025-07-05 07:34:07', '6868ff60ef91d'),
(61, 'b3e2972ab8c30fbda860mcqk59991ee3', 196, 'pix', 150.00, 'BRL', 1, '2025-07-05 15:09:19', '2025-07-05 15:09:45', '68696a4c38e36'),
(62, '05177b939ca6de0a6668mcr6yrc413jd', 203, 'pix', 30.00, 'BRL', 1, '2025-07-06 01:48:10', '2025-07-06 01:48:50', '686a000440c42'),
(63, '9d3c412ac12e6c9a3019mcr8bupzpdxa', 204, 'pix', 30.00, 'BRL', 1, '2025-07-06 02:26:28', '2025-07-06 02:27:42', '686a08f6c523d'),
(64, 'afe36a5927437fff9e9bmcrae2c0p2u6', 205, 'pix', 50.00, 'BRL', 1, '2025-07-06 03:24:00', '2025-07-06 03:24:27', '686a167d2f557'),
(65, '2199cd6b7efbc8bdf2f8mcs2tuw91mbk', 207, 'pix', 30.00, 'BRL', 1, '2025-07-06 16:40:07', '2025-07-06 16:41:00', '686ad113429d1'),
(66, '9689893a7e5c43e4c30fmcs8drh749b6', 208, 'pix', 50.00, 'BRL', 1, '2025-07-06 19:15:34', '2025-07-06 19:16:07', '686af582102e2'),
(67, '3b481e0da07cfb303218mcvkh69012f1', 211, 'pix', 30.00, 'BRL', 1, '2025-07-09 03:17:25', '2025-07-09 03:21:27', '686e09731a10b'),
(68, 'cdd5bcc1f8cbd3946a4bmcwqsuwa4684', 213, 'pix', 100.00, 'BRL', 0, '2025-07-09 23:02:14', '2025-07-09 23:02:14', '686f1f24207c9'),
(69, '94378367df0f7cfff374mcwzlea724g7', 216, 'pix', 30.00, 'BRL', 0, '2025-07-10 03:08:23', '2025-07-10 03:08:23', '686f58d487da4'),
(70, 'a01a24babba958b79bacmcxfei7549dc', 218, 'pix', 30.00, 'BRL', 0, '2025-07-10 10:30:56', '2025-07-10 10:30:56', '686fc08cd7ae5'),
(71, '98b0ede762cb972e7099mcxw64su52ta', 219, 'pix', 39.00, 'BRL', 0, '2025-07-10 18:20:18', '2025-07-10 18:20:18', '68702e8fba76d'),
(72, '8120c124cf00efdc1b02mcxw6w823axp', 219, 'pix', 41.00, 'BRL', 1, '2025-07-10 18:20:54', '2025-07-10 18:22:55', '68702eb34936e'),
(73, '013fa0604ecdbda3ff88mcy222n140sr', 220, 'pix', 30.00, 'BRL', 1, '2025-07-10 21:05:07', '2025-07-10 21:06:11', '6870552f779a9'),
(74, 'e558b6e25e18a63dced1mcy3hcxx5q94', 221, 'pix', 40.00, 'BRL', 1, '2025-07-10 21:44:59', '2025-07-10 21:45:54', '68705e88cfcd3'),
(75, '05c877e48fa68a70f500mcy5n1m13ygp', 223, 'pix', 40.00, 'BRL', 1, '2025-07-10 22:45:23', '2025-07-10 22:45:57', '68706cb14f220'),
(76, 'babb48b626dbe0f65752mcy5t62d3r06', 224, 'pix', 30.00, 'BRL', 1, '2025-07-10 22:50:11', '2025-07-10 22:51:10', '68706dcf07ca2'),
(77, 'b13ff85b3dbc9c37893emcy67d3u19or', 225, 'pix', 50.00, 'BRL', 1, '2025-07-10 23:01:12', '2025-07-10 23:01:52', '6870706551131'),
(78, '5a5d8e122f9b2968b232mcy6r90z43ze', 222, 'pix', 50.00, 'BRL', 1, '2025-07-10 23:16:39', '2025-07-10 23:17:13', '6870740528a2a'),
(79, '2b9bfc09710626c2fcf1mcy92x2b2auz', 227, 'pix', 30.00, 'BRL', 1, '2025-07-11 00:21:43', '2025-07-11 00:22:57', '68708344bcb51'),
(80, '30d7d1b40ad94baabe09mcy9gh5m10wo', 228, 'pix', 60.00, 'BRL', 0, '2025-07-11 00:32:16', '2025-07-11 00:32:16', '687085bd5291a'),
(81, 'c2e0099c3020d63c5fb1mcye9rn85iv5', 233, 'pix', 30.00, 'BRL', 1, '2025-07-11 02:47:01', '2025-07-11 02:48:59', '6870a552670e7'),
(82, '121f8feac9924a989d8amcyhpjtb2w1l', 234, 'pix', 30.00, 'BRL', 1, '2025-07-11 04:23:16', '2025-07-11 04:23:40', '6870bbe194f7d'),
(83, '551643c101ddc23a6f2amcywwqhc5xb7', 236, 'pix', 30.00, 'BRL', 1, '2025-07-11 11:28:46', '2025-07-11 11:29:16', '68711f9b13750'),
(84, '2b884b385797bb47a523mcyydkrf23sh', 237, 'pix', 30.00, 'BRL', 1, '2025-07-11 12:09:52', '2025-07-11 12:10:23', '6871293c20c6f'),
(85, '77cedc13384af6532f1dmcz0esiw2xae', 238, 'pix', 30.00, 'BRL', 1, '2025-07-11 13:06:46', '2025-07-11 13:07:16', '687136946265f'),
(86, '6c2ab093467d699b38d9mczf6jql5dzx', 239, 'pix', 30.00, 'BRL', 1, '2025-07-11 20:00:16', '2025-07-11 20:04:03', '6871977df3beb'),
(87, '0895c2ac03f2a00249c9mczh8a1j3ylr', 242, 'pix', 30.00, 'BRL', 1, '2025-07-11 20:57:38', '2025-07-11 20:58:21', '6871a4edf3d2c'),
(88, '2f6c8a5d96719f0b034bmczjj7mn3gof', 244, 'pix', 30.00, 'BRL', 0, '2025-07-11 22:02:06', '2025-07-11 22:02:06', '6871b40b4d12f'),
(89, '6bc4b1120adaf7b4210bmczmfh653l13', 245, 'pix', 30.00, 'BRL', 0, '2025-07-11 23:23:10', '2025-07-11 23:23:10', '6871c70bd568a'),
(90, '57cd5b4c4756731dae3emczoalyy52tw', 247, 'pix', 30.00, 'BRL', 1, '2025-07-12 00:15:22', '2025-07-12 00:16:02', '6871d3480daca'),
(91, '5f1bbb990c4a9b7235dfmd018eov1niy', 248, 'pix', 30.00, 'BRL', 1, '2025-07-12 06:17:35', '2025-07-12 06:18:11', '6872282c4df50'),
(92, '644a6b8d3b9a985b35f7md01c9sy3hmo', 249, 'pix', 200.00, 'BRL', 1, '2025-07-12 06:20:35', '2025-07-12 06:22:27', '687228e095682'),
(93, 'cab78d246cb6b135be76md077bze4fn7', 250, 'pix', 589.00, 'BRL', 1, '2025-07-12 09:04:42', '2025-07-12 09:04:58', '68724f57cedad'),
(94, '1328125fa9b4ef51a0a3md0bh0ul3q06', 243, 'pix', 100.00, 'BRL', 1, '2025-07-12 11:04:13', '2025-07-12 11:05:23', '68726b5a6a9d1'),
(95, 'b63fc49d1210726afac1md0fgybl5n45', 252, 'pix', 30.00, 'BRL', 0, '2025-07-12 12:56:08', '2025-07-12 12:56:08', '687285959ba49'),
(96, 'ff4e263e8d511907ab50md0fqnni454f', 252, 'pix', 30.00, 'BRL', 0, '2025-07-12 13:03:41', '2025-07-12 13:03:41', '6872875a5efaa'),
(97, 'fcd47862e0373682904emd0fvu011n0w', 253, 'pix', 40.00, 'BRL', 1, '2025-07-12 13:07:42', '2025-07-12 13:08:10', '6872884bd69fb'),
(98, '9821b589de1f6ebb51bfmd0m1ndt5wb7', 254, 'pix', 30.00, 'BRL', 1, '2025-07-12 16:00:10', '2025-07-12 16:00:37', '6872b0b8df140'),
(99, 'e4187b88c48997d2e756md0n8r8t4ecd', 255, 'pix', 30.00, 'BRL', 1, '2025-07-12 16:33:42', '2025-07-12 16:34:18', '6872b8942788f'),
(100, '429889445437e2ded665md0ufm8i1n03', 256, 'pix', 30.00, 'BRL', 1, '2025-07-12 19:55:03', '2025-07-12 19:55:17', '6872e7c18588f'),
(101, 'e6623c4b1501815f8d87md0x0cv71byr', 257, 'pix', 30.00, 'BRL', 0, '2025-07-12 21:07:08', '2025-07-12 21:07:08', '6872f8a863b59'),
(102, '046f5035956ae1a010c9md0xx3lf46z1', 257, 'pix', 30.00, 'BRL', 1, '2025-07-12 21:32:35', '2025-07-12 21:33:06', '6872fea007a27'),
(103, 'fbf45c40d052fd20d221md1bo8792qtt', 262, 'pix', 30.00, 'BRL', 1, '2025-07-13 03:57:35', '2025-07-13 03:57:55', '687358dcb45f7'),
(104, '1c0bc6a105fae53316fcmd1rwwlk1bvr', 263, 'pix', 30.00, 'BRL', 1, '2025-07-13 11:32:13', '2025-07-13 11:33:07', '6873c36b71057'),
(105, '471e5b9ab77aa7b49a3amd1yjh0kxvqh', 265, 'pix', 50.00, 'BRL', 1, '2025-07-13 14:37:44', '2025-07-13 14:38:26', '6873eee60cf11'),
(106, 'a34c4c1732c6a803302emd2242ir511k', 264, 'pix', 30.00, 'BRL', 1, '2025-07-13 16:17:45', '2025-07-13 16:19:42', '68740655311d2'),
(107, '0093baf187809d00a954md30smip3w4s', 272, 'pix', 30.00, 'BRL', 1, '2025-07-14 08:28:36', '2025-07-14 08:29:51', '6874e9e27aef6'),
(108, '9b7fa55d90bb8a626d41md38sa2g1w6b', 274, 'pix', 50.00, 'BRL', 1, '2025-07-14 12:12:18', '2025-07-14 12:12:54', '68751e4f47d19'),
(109, 'e1873a7d69b38918a98cmd3bi72lm8pr', 275, 'pix', 75.00, 'BRL', 0, '2025-07-14 13:28:26', '2025-07-14 13:28:26', '68753027a5738'),
(110, '950412f59182bd3c5fbbmd3btle73lme', 275, 'pix', 75.00, 'BRL', 0, '2025-07-14 13:37:19', '2025-07-14 13:37:19', '6875323b705a2'),
(111, '7f12b1f2aeb5b2b28ea9md3ceb742txc', 275, 'pix', 75.00, 'BRL', 0, '2025-07-14 13:53:24', '2025-07-14 13:53:24', '6875360203e59'),
(112, 'f4667881c0d2665a806cmd3ghklm5nbb', 277, 'pix', 70.00, 'BRL', 1, '2025-07-14 15:47:55', '2025-07-14 15:48:18', '687550d7e82f6'),
(113, '92707e6ff8d1efadd059md3upgts1qo3', 281, 'pix', 30.00, 'BRL', 1, '2025-07-14 22:25:58', '2025-07-14 22:26:18', '6875ae2399540'),
(114, 'a4cefb845442dba91f55md3vl9a84m0w', 277, 'pix', 30.00, 'BRL', 1, '2025-07-14 22:50:40', '2025-07-14 22:51:06', '6875b3eecc053'),
(115, 'd42b43a13c079e55b039md51tbcz3dav', 285, 'pix', 30.00, 'BRL', 1, '2025-07-15 18:32:41', '2025-07-15 18:33:39', '6876c8f69fd9d'),
(116, '67ace9da36c3bef3256dmd5270s51jc0', 286, 'pix', 30.00, 'BRL', 0, '2025-07-15 18:43:20', '2025-07-15 18:43:20', '6876cb761f0dd'),
(117, '898012aeff90d6be7f14md52kev45bkc', 286, 'pix', 30.00, 'BRL', 1, '2025-07-15 18:53:45', '2025-07-15 18:54:05', '6876cde6184e4'),
(118, 'e51f4e459d321b895e28md5ckl4t2xbf', 288, 'pix', 30.00, 'BRL', 1, '2025-07-15 23:33:50', '2025-07-15 23:34:10', '68770f8b2fec1'),
(119, 'e5b6ce112ee0c5bd5fd3md5cyag73bg9', 289, 'pix', 60.00, 'BRL', 1, '2025-07-15 23:44:28', '2025-07-15 23:45:00', '6877120a84a40'),
(120, 'fc48fc6eaf2dcaeb35fdmd5djaby4jiv', 289, 'pix', 130.00, 'BRL', 1, '2025-07-16 00:00:48', '2025-07-16 00:01:14', '687715de262cc'),
(121, '749b20dea48b2e7b143amd5fknuc3uf1', 283, 'pix', 30.00, 'BRL', 0, '2025-07-16 00:57:52', '2025-07-16 00:57:52', '6877233d8ac54'),
(122, '3309a4309cbeafd97f06md5hnirb5g1w', 292, 'pix', 5000.00, 'BRL', 0, '2025-07-16 01:56:04', '2025-07-16 01:56:04', '687730e22c3a7'),
(123, 'a1d359477347868bd4cfmd5idw0z1xew', 293, 'pix', 30.00, 'BRL', 1, '2025-07-16 02:16:35', '2025-07-16 02:16:55', '687735b0660bd'),
(124, '1e04627af44803c4e5ebmd5m1m2f128z', 198, 'pix', 100.00, 'BRL', 0, '2025-07-16 03:59:00', '2025-07-16 03:59:00', '68774db218e92'),
(125, '3b8b28d077000d2bd555md63gkvj3q0k', 296, 'pix', 50.00, 'BRL', 1, '2025-07-16 12:06:33', '2025-07-16 12:07:22', '6877bff54855e'),
(126, '0bdc2c174f6a0ec68bfemd6462t351w3', 297, 'pix', 30.00, 'BRL', 0, '2025-07-16 12:26:22', '2025-07-16 12:26:22', '6877c49b1a077'),
(127, '8691e154d8d61e5ff738md65tbeb2rrw', 298, 'pix', 100.00, 'BRL', 1, '2025-07-16 13:12:26', '2025-07-16 13:13:21', '6877cf6751130'),
(128, 'f04624794756be068f50md6en58q5smz', 300, 'pix', 50.00, 'BRL', 1, '2025-07-16 17:19:35', '2025-07-16 17:20:24', '68780953eec0c'),
(129, 'cfde971e37c35a3d1e69md7npv9t1bzu', 311, 'pix', 30.00, 'BRL', 0, '2025-07-17 14:21:24', '2025-07-17 14:21:24', '68793111b8ddd'),
(130, '4ab7757e2898b2058b46md7rl1z643rb', 269, 'pix', 30.00, 'BRL', 0, '2025-07-17 16:09:38', '2025-07-17 16:09:38', '68794a6f96e1f'),
(131, '6713fcac4526a9e6e3f8md7rlhgn32c9', 269, 'pix', 30.00, 'BRL', 1, '2025-07-17 16:09:58', '2025-07-17 16:10:51', '68794a83a7128'),
(132, '7b5898b290dd946b3860md909dkk5fqr', 323, 'pix', 30.00, 'BRL', 1, '2025-07-18 13:00:15', '2025-07-18 13:00:57', '687a6f8d7a757'),
(133, 'c18d6212ff1eb701708dmd9jpta71iys', 325, 'pix', 30.00, 'BRL', 0, '2025-07-18 22:04:53', '2025-07-18 22:04:53', '687aef3513d8c'),
(134, 'd0a02153fb45ac408cb0md9phduq2m62', 326, 'pix', 30.00, 'BRL', 1, '2025-07-19 00:46:17', '2025-07-19 00:46:46', '687b15097a5f4'),
(135, 'cf4e615c460aeee02a2cmd9uywd149lz', 327, 'pix', 40.00, 'BRL', 1, '2025-07-19 03:19:52', '2025-07-19 03:20:52', '687b3908b36f4'),
(136, 'de493a08a993f72e567dmda89inz5na9', 328, 'pix', 60.00, 'BRL', 1, '2025-07-19 09:32:03', '2025-07-19 09:32:53', '687b904331e04'),
(137, '95e0e64d6f931269d34amdais4t41xm3', 329, 'pix', 30.00, 'BRL', 1, '2025-07-19 14:26:28', '2025-07-19 14:27:01', '687bd543d4639'),
(138, 'bf75c320d8553d9764c5mdbz55ke2ixk', 341, 'pix', 30.00, 'BRL', 1, '2025-07-20 14:52:15', '2025-07-20 14:53:27', '687d2ccf6029f'),
(139, '948ad5a32ba8ff169f19mdcaqhb126yj', 343, 'pix', 100.00, 'BRL', 0, '2025-07-20 20:16:46', '2025-07-20 20:16:46', '687d78de2ad6f'),
(140, 'e555645673b707a0cb12mdcj5jej4za9', 344, 'pix', 30.00, 'BRL', 1, '2025-07-21 00:12:26', '2025-07-21 00:12:51', '687db019a0a4c'),
(141, 'a5a32458414424b92082mdclunxx2jfp', 347, 'pix', 33.00, 'BRL', 1, '2025-07-21 01:27:57', '2025-07-21 01:28:41', '687dc1cd29a33'),
(142, '94f5044f048a94ecc5acmddgwf1r38ip', 349, 'pix', 30.00, 'BRL', 1, '2025-07-21 15:57:07', '2025-07-21 15:57:35', '687e8d830d409'),
(143, 'd9648d850fe639cee295mddm2fkd13d9', 350, 'pix', 150.00, 'BRL', 1, '2025-07-21 18:21:46', '2025-07-21 18:22:10', '687eaf692bd10'),
(144, '7ebd9e6eaaaac9684d12mde1a54r22oi', 352, 'pix', 30.00, 'BRL', 1, '2025-07-22 01:27:39', '2025-07-22 01:28:18', '687f133bad742'),
(145, 'e7b05d433245be486cd8mde1td1h255j', 354, 'pix', 30.00, 'BRL', 1, '2025-07-22 01:42:36', '2025-07-22 01:44:01', '687f16bc6d5df'),
(146, 'd604e6af3e2ed6578ccemde25y7i5ols', 354, 'pix', 30.00, 'BRL', 1, '2025-07-22 01:52:23', '2025-07-22 01:52:56', '687f1907b28aa'),
(147, 'c0d158c8355662a5a509mde35207zgaj', 355, 'pix', 50.00, 'BRL', 1, '2025-07-22 02:19:41', '2025-07-22 02:20:06', '687f1f6d95e5d'),
(148, 'd791079763a6594b10edmde4hlvj2w9q', 356, 'pix', 100.00, 'BRL', 1, '2025-07-22 02:57:27', '2025-07-22 02:57:54', '687f2846d18ea'),
(149, '3a0475f1341c0948579emdf8pdie4o26', 361, 'pix', 30.00, 'BRL', 1, '2025-07-22 21:43:14', '2025-07-22 21:44:44', '6880302159261'),
(150, '48c71514a6e84db5bb21mdfjgy1vt9q7', 364, 'pix', 30.00, 'BRL', 1, '2025-07-23 02:44:36', '2025-07-23 02:45:00', '688076c461971'),
(151, 'c162fa3450a15df155ebmdfjo9ygyedd', 364, 'pix', 30.00, 'BRL', 0, '2025-07-23 02:50:18', '2025-07-23 02:50:18', '6880781a6510d'),
(152, 'd63572cd67798b7a418cmdflb24y51xk', 366, 'pix', 50.00, 'BRL', 1, '2025-07-23 03:36:01', '2025-07-23 03:36:22', '688082d0f0f05'),
(153, '8595f6f1e3e6e4ad48bemdg2kw6c50ug', 367, 'pix', 30.00, 'BRL', 1, '2025-07-23 11:39:33', '2025-07-23 11:40:50', '6880f42547c98'),
(154, '0115c194ebd0317cd6camdg3tcq5484p', 368, 'pix', 30.00, 'BRL', 1, '2025-07-23 12:14:07', '2025-07-23 12:14:49', '6880fc3f985c7'),
(155, 'e00ac4b383e2767eab55mdgcjfhj2xrs', 369, 'pix', 30.00, 'BRL', 1, '2025-07-23 16:18:21', '2025-07-23 16:18:57', '6881357d29d68'),
(156, '9d3bfd2acf8b260d05dcmdgzptsc59s5', 370, 'pix', 30.00, 'BRL', 1, '2025-07-24 03:07:11', '2025-07-24 03:07:26', '6881cd8ec43e0'),
(157, '3b95bffdb232da0c1230mdhgk0311vws', 371, 'pix', 30.00, 'BRL', 1, '2025-07-24 10:58:32', '2025-07-24 10:59:16', '68823c08781c1'),
(158, '6ee32a97f4d816e0c5ddmdi4y6ds1cyz', 374, 'pix', 40.00, 'BRL', 1, '2025-07-24 22:21:24', '2025-07-24 22:21:50', '6882dc149d2eb'),
(159, '3c94da6e132022d6054amdi50wl31eld', 375, 'pix', 30.00, 'BRL', 1, '2025-07-24 22:23:32', '2025-07-24 22:24:16', '6882dc93db3d7'),
(160, 'b9769bd4ba86e655e9a3mdi5ebll2tf0', 371, 'pix', 30.00, 'BRL', 0, '2025-07-24 22:33:58', '2025-07-24 22:33:58', '6882df058fd5a'),
(161, '83cdb5216b9f89e08878mdirk1lx3y1b', 378, 'pix', 30.00, 'BRL', 1, '2025-07-25 08:54:16', '2025-07-25 08:54:35', '688370686dc8c'),
(162, '637e32ce012fab29cb4bmdjbwj2211ah', 381, 'pix', 30.00, 'BRL', 1, '2025-07-25 18:23:51', '2025-07-25 18:24:10', '6883f5e735fec'),
(163, '8efc3dcf633975f37ee2mdjnapcz2zor', 382, 'pix', 30.00, 'BRL', 1, '2025-07-25 23:42:48', '2025-07-25 23:43:06', '688440a85d755'),
(164, '7e1f8e59f1e7fb9f1b5bmdne88x63j80', 386, 'pix', 35.00, 'BRL', 0, '2025-07-28 14:40:04', '2025-07-28 14:40:04', '6887b5f18f93b'),
(165, '5566bd4c83846468d097mdne96jf1fj3', 386, 'pix', 30.00, 'BRL', 1, '2025-07-28 14:40:45', '2025-07-28 14:41:01', '6887b61d26c5a'),
(166, '26149f3fec4256ccb488mdpfuefl33dp', 391, 'pix', 60.00, 'BRL', 1, '2025-07-30 01:00:47', '2025-07-30 01:01:36', '688998ef72c79'),
(167, '2a02f596c4bc59b6a992mdq53pja56n8', 397, 'pix', 30.00, 'BRL', 1, '2025-07-30 12:47:52', '2025-07-30 12:48:14', '688a3ea82283b'),
(168, '475c45dccd4e3c0a8cd2mdqjgewf5sc9', 401, 'pix', 30.00, 'BRL', 1, '2025-07-30 19:29:39', '2025-07-30 19:30:06', '688a9cd37b082'),
(169, '5a0a074795861f16013emdrgj1d537ah', 372, 'pix', 30.00, 'BRL', 1, '2025-07-31 10:55:29', '2025-07-31 10:55:58', '688b75d1405a3'),
(170, '76ee1cb777a6746651e7mds81b8w42jh', 404, 'pix', 30.00, 'BRL', 1, '2025-07-31 23:45:31', '2025-07-31 23:46:49', '688c2a4b8191c'),
(171, '22c847ccde060a9d7210mdsa0ff35ljt', 406, 'pix', 30.00, 'BRL', 1, '2025-08-01 00:40:49', '2025-08-01 00:41:05', '688c37417dad1'),
(172, '9823c9ef5b2840e72f12mdskeq2kv7s1', 412, 'pix', 30.00, 'BRL', 1, '2025-08-01 05:31:52', '2025-08-01 05:32:16', '688c7b78a274c'),
(173, '531a663ae2cacae70280mdszyh8r5nyt', 414, 'pix', 30.00, 'BRL', 1, '2025-08-01 12:47:08', '2025-08-01 12:47:47', '688ce17c8eb76'),
(174, '9e5ce7c875696279daf5mdtekaje2oci', 416, 'pix', 30.00, 'BRL', 1, '2025-08-01 19:36:01', '2025-08-01 19:36:27', '688d4150e7c4f'),
(175, '323ef43e4b85e7856a55mdtf339316l5', 417, 'pix', 30.00, 'BRL', 1, '2025-08-01 19:50:38', '2025-08-01 19:50:59', '688d44bdec4fd'),
(176, '7a7288dd3e0abfd162e1mdtl681s2tgm', 418, 'pix', 30.00, 'BRL', 1, '2025-08-01 22:41:02', '2025-08-01 22:41:55', '688d6cadccba2'),
(177, 'b331fab900a611022933mdtob3jo24eb', 421, 'pix', 30.00, 'BRL', 1, '2025-08-02 00:08:48', '2025-08-02 00:09:40', '688d814020cab'),
(178, 'b8634a78b71d011415c2mdtog3fw39o4', 422, 'pix', 30.00, 'BRL', 1, '2025-08-02 00:12:41', '2025-08-02 00:13:15', '688d822944c29'),
(179, '1afaeffc16114562446dmdtqnhud4k3h', 424, 'pix', 30.00, 'BRL', 1, '2025-08-02 01:14:25', '2025-08-02 01:14:50', '688d90a1bd39d'),
(180, 'ec637f632ea02e673935mdtumegp5urf', 426, 'pix', 30.00, 'BRL', 1, '2025-08-02 03:05:33', '2025-08-02 03:05:59', '688daaad2dca3'),
(181, '030faf051c27ae898fa6mdtumu0d53rm', 427, 'pix', 30.00, 'BRL', 0, '2025-08-02 03:05:53', '2025-08-02 03:05:53', '688daac15629c'),
(182, '585b0d15b93375e00276mdtunjli338v', 427, 'pix', 30.00, 'BRL', 1, '2025-08-02 03:06:26', '2025-08-02 03:06:50', '688daae2793d6'),
(183, '0b323a8a8921ef8b880emdxd9srz1mdd', 429, 'pix', 30.00, 'BRL', 1, '2025-08-04 14:10:56', '2025-08-04 14:15:01', '6890e9a009658'),
(184, 'c0ad4be7198f3b57a5f4mdxdo8g42jv6', 429, 'pix', 30.00, 'BRL', 1, '2025-08-04 14:22:10', '2025-08-04 14:23:05', '6890ec4195c80'),
(185, 'ac1f08f07e2d0c3f4a2bmdy073903ssm', 431, 'pix', 30.00, 'BRL', 1, '2025-08-05 00:52:41', '2025-08-05 00:53:58', '6891800936cb8'),
(186, '912ab306bbeeaa0b4190mdz3a2qm1w3k', 436, 'pix', 30.00, 'BRL', 1, '2025-08-05 19:06:45', '2025-08-05 19:07:20', '689280757ba3e'),
(187, '4235e77b3c262b6614a9mdzcmrho5xzu', 437, 'pix', 30.00, 'BRL', 1, '2025-08-05 23:28:34', '2025-08-05 23:29:04', '6892bdd2097e1'),
(188, '32a677fae27205c75640mdzhu1nr5qgg', 438, 'pix', 30.00, 'BRL', 1, '2025-08-06 01:54:12', '2025-08-06 01:54:50', '6892dff3d7572'),
(189, 'c1a97c94225a84fa2647me00hugv3mcz', 442, 'pix', 77.00, 'BRL', 1, '2025-08-06 10:36:35', '2025-08-06 10:36:59', '68935a635ed31'),
(190, '7e06e91736ab2c44b1aeme00rueg1v3a', 442, 'pix', 30.00, 'BRL', 1, '2025-08-06 10:44:22', '2025-08-06 10:44:42', '68935c35c9662'),
(191, 'dbad1714bdecd17615c9me111nuq2dxh', 446, 'pix', 50.00, 'BRL', 1, '2025-08-07 03:39:46', '2025-08-07 03:40:16', '68944a321d758'),
(192, '0cafb7203eeea46deaccme1ihk301wym', 449, 'pix', 30.00, 'BRL', 0, '2025-08-07 11:48:01', '2025-08-07 11:48:01', '6894bca12fa9c'),
(193, '5b299b09f2cc763d8818me1t8bye589t', 452, 'pix', 100.00, 'BRL', 1, '2025-08-07 16:48:46', '2025-08-07 16:49:29', '6895031e82e45'),
(194, '8cdf88a633f52d8cfcd8me2othdd1q0u', 457, 'pix', 30.00, 'BRL', 0, '2025-08-08 07:33:01', '2025-08-08 07:33:01', '6895d25d6893a'),
(195, 'f486242dc4fc69607836me2v5fu112bo', 459, 'pix', 50.00, 'BRL', 1, '2025-08-08 10:30:17', '2025-08-08 10:31:12', '6895fbe9049bd'),
(196, 'e49464842dc5069452efme34n0501tss', 460, 'pix', 50.00, 'BRL', 1, '2025-08-08 14:55:53', '2025-08-08 14:56:21', '68963a28ed33e'),
(197, 'f1b8cf1b51f1bac686e6me3k7x985o3q', 461, 'pix', 30.00, 'BRL', 1, '2025-08-08 22:12:03', '2025-08-08 22:12:40', '6896a06340f25'),
(198, '846e1adcb713404d5a97me4wkrj43cl4', 465, 'pix', 40.00, 'BRL', 1, '2025-08-09 20:45:44', '2025-08-09 20:46:19', '6897dda7c8e94'),
(199, 'd41d307fbddb7e5535e2me50mik63krw', 467, 'pix', 30.00, 'BRL', 1, '2025-08-09 22:39:04', '2025-08-09 22:41:44', '6897f8381c2dd'),
(200, 'bfcf576140808b3543cbme58vbal2es1', 469, 'pix', 30.00, 'BRL', 1, '2025-08-10 02:29:51', '2025-08-10 02:30:27', '68982e4f86b2b'),
(201, '6871db6ee59788dcebbeme5bb0qr121o', 470, 'pix', 30.00, 'BRL', 1, '2025-08-10 03:38:03', '2025-08-10 03:38:33', '68983e4b8ef0e'),
(202, 'f3c1fd8e6c6ec4a6951dme919rlr5ig8', 476, 'pix', 30.00, 'BRL', 1, '2025-08-12 18:08:14', '2025-08-12 18:09:09', '689bad3ccaad2'),
(203, '04af5d5edd1c59a34decmeavfbvw49gw', 477, 'pix', 150.00, 'BRL', 1, '2025-08-14 01:00:08', '2025-08-14 01:00:32', '689d5f47d1941'),
(204, '49f4916cde62b624e383merbydhc3awe', 381, 'pix', 1000.00, 'BRL', 0, '2025-08-25 13:27:10', '2025-08-25 13:27:10', '68ac8edbe8b85'),
(205, 'c9125a60000e7d11860bmf5rtj2122v7', 478, 'pix', 30.00, 'BRL', 1, '2025-09-04 16:00:03', '2025-09-04 16:00:25', '68b9e1b348f90'),
(206, '65c444f6688b266ab03dmf5xrtf1uyni', 481, 'pix', 50.00, 'BRL', 1, '2025-09-04 18:46:41', '2025-09-04 18:47:11', '68ba08c124519'),
(207, '52b3be404997f4fb613dmf676ivc2lbn', 482, 'pix', 30.00, 'BRL', 1, '2025-09-04 23:10:04', '2025-09-04 23:11:21', '68ba467b99328'),
(208, '22cc5fd94f80698863e6mf69zrxb3tfz', 484, 'pix', 30.00, 'BRL', 1, '2025-09-05 00:28:48', '2025-09-05 00:29:29', '68ba58efd1e47'),
(209, '810b208d2ba5f2900061mf6bcn925u28', 485, 'pix', 200.00, 'BRL', 1, '2025-09-05 01:06:48', '2025-09-05 01:07:27', '68ba61d7e7240'),
(210, 'b7461c3343a14e915e67mf6dcc711w0m', 486, 'pix', 30.00, 'BRL', 1, '2025-09-05 02:02:33', '2025-09-05 02:02:51', '68ba6ee8d0cbf'),
(211, '7e6fa663740c5c5df671mf6ztvziq4sx', 487, 'pix', 300.00, 'BRL', 0, '2025-09-05 12:32:03', '2025-09-05 12:32:03', '68bb0273321dd'),
(212, '239ae71a7d24b3a2835dmf6zx2jv4bwr', 487, 'pix', 30.00, 'BRL', 0, '2025-09-05 12:34:31', '2025-09-05 12:34:31', '68bb0307a6112'),
(213, '24cbe1009b4d078b3861mf6zyqzs1bb3', 487, 'pix', 30.00, 'BRL', 0, '2025-09-05 12:35:50', '2025-09-05 12:35:50', '68bb035602741'),
(214, '547d2543bc8ccefd49ffmf7doevh4get', 489, 'pix', 120.00, 'BRL', 1, '2025-09-05 18:59:43', '2025-09-05 19:00:15', '68bb5d4e5a432'),
(215, '3cd7867fcff00cdd185cmf7fbsp32c7i', 491, 'pix', 50.00, 'BRL', 1, '2025-09-05 19:45:53', '2025-09-05 19:47:58', '68bb6820efc41'),
(216, 'dd60e11ed4404a32fc15mf7xv9mmmo59', 487, 'pix', 30.00, 'BRL', 1, '2025-09-06 04:24:54', '2025-09-06 04:25:16', '68bbe1c6753cf'),
(217, '4652fd0925f726f4a795mf87m6svmw70', 492, 'pix', 60.00, 'BRL', 1, '2025-09-06 08:57:47', '2025-09-06 08:58:23', '68bc21bb12b18'),
(218, 'dc3490fe46031ed5d5b1mfczkur417al', 494, 'pix', 150.00, 'BRL', 1, '2025-09-09 17:11:39', '2025-09-09 17:12:09', '68c089fa5a011'),
(219, 'e8ee12c2490493496e45mfd0ob0p3e89', 494, 'pix', 150.00, 'BRL', 1, '2025-09-09 17:42:19', '2025-09-09 17:42:59', '68c0912b689a0'),
(220, 'aa60a584a1cef83e104bmfd2fyst5mcl', 496, 'pix', 30.00, 'BRL', 1, '2025-09-09 18:31:49', '2025-09-09 18:32:11', '68c09cc58aa7e'),
(221, '301b8645134c209b8b35mfd2qlvu5j57', 497, 'pix', 30.00, 'BRL', 1, '2025-09-09 18:40:06', '2025-09-09 18:40:42', '68c09eb609957'),
(222, '4fab5d62a108380a7361mfecvhty2zlo', 502, 'pix', 30.00, 'BRL', 1, '2025-09-10 16:11:36', '2025-09-10 16:11:59', '68c1cd686550a'),
(223, '729ec23d2864dbed2e0fmfedytpy2dgo', 503, 'pix', 50.00, 'BRL', 1, '2025-09-10 16:42:11', '2025-09-10 16:42:43', '68c1d493610ed'),
(224, '68cdec267bf1e78dfab2mfegmq8331p8', 504, 'pix', 30.00, 'BRL', 1, '2025-09-10 17:56:46', '2025-09-10 17:57:14', '68c1e60dd0db1'),
(225, '35d1d2f536e0d67df350mfeyi8jx16x5', 506, 'pix', 30.00, 'BRL', 1, '2025-09-11 02:17:09', '2025-09-11 02:17:34', '68c25b5565b10'),
(226, 'f753f68d97d33c4bbb8dmff0bolz1odb', 507, 'pix', 30.00, 'BRL', 1, '2025-09-11 03:08:03', '2025-09-11 03:08:17', '68c26742d453d'),
(227, '2b132424e83d83436f6bmffwgv1r12a5', 511, 'pix', 120.00, 'BRL', 1, '2025-09-11 18:07:52', '2025-09-11 18:08:34', '68c33a282ed3d');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `oauth_id` varchar(191) DEFAULT NULL,
  `oauth_type` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT 'uploads/avatar/padrao.webp',
  `last_name` varchar(191) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `logged_in` tinyint(4) NOT NULL DEFAULT 0,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `inviter` int(11) DEFAULT NULL,
  `inviter_code` varchar(25) DEFAULT NULL,
  `affiliate_revenue_share` bigint(20) NOT NULL DEFAULT 0,
  `affiliate_revenue_share_fake` bigint(20) DEFAULT 0,
  `affiliate_cpa` decimal(20,2) NOT NULL DEFAULT 0.00,
  `affiliate_baseline` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_demo_agent` tinyint(4) NOT NULL DEFAULT 0,
  `status` varchar(50) NOT NULL DEFAULT 'active',
  `language` varchar(191) NOT NULL DEFAULT 'pt_BR',
  `role_id` int(11) DEFAULT 3
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`) VALUES
(1, 'Admin', 'admin@hotmail.com', '2025-04-01 22:02:22', '$2y$10$cIZhjENMDc0vPNcP/ftj3O52NxFH0AJ/R2ZeNvk3c4dKI6CgTzKOG', 'mm9KGQgsLdealYIJaJn5dgr689j68ayO2IyG8H1fiXP2BY7Z8NaGSoekYKAd', '2025-04-12 19:00:12', '2025-04-21 02:50:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, '123.123.123-12', '(12) 34567-8910', 0, 0, NULL, 'VT1YGWERSA', 0, 0, 15.00, 5.00, 0, 'active', 'pt-BR', 3),
(3, 'teste', 'teste@gmail.com', NULL, '$2y$10$sSsLYb8/brKLeFKqR9SO2uYp.lwiCVbMuY9HbJ4uY2so/KIOksVdq', NULL, '2025-04-21 02:44:59', '2025-04-21 02:50:52', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(17) 99150-0437', 0, 0, NULL, 'UXS29WREYW', 0, 0, 5.00, 10.00, 0, 'active', 'pt_BR', 3),
(4, 'klayton', 'klaytonramon@gmail.com', NULL, '$2y$10$YjugYtWKo/ny33.c8zBx2.3/CMpDHOH.vtLxK83.pOD1p4tEIEue2', NULL, '2025-04-21 14:38:55', '2025-04-21 14:38:55', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 99645-6574', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(5, 'Giusepe Sergi', 'giusepej@gmail.com', NULL, '$2y$10$Ga8aylp7.99bDHd2fmYxU.7ARhTr/RViRlH376nKXthI1PCMW42Me', NULL, '2025-04-21 17:07:43', '2025-04-21 17:07:43', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(13) 92000-2178', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(6, 'Camila', 'camilagon12354@gmail.com', NULL, '$2y$10$XO2JUHBDd5iJvlS6f30D7egiB8oQAKhUUMZO.HJZqF13ra37HU8R2', NULL, '2025-04-21 19:34:01', '2025-04-21 19:34:01', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(66) 99682-2954', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(7, 'Rafael', 'Rafaelrosanelle@hotmail.com', NULL, '$2y$10$00dVV/k4sjLqHLD5RKckve.2E7fROLLEqY5J.j4YYlfElYrIzZeea', NULL, '2025-04-22 02:19:48', '2025-04-22 02:19:48', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(14) 99866-9342', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(8, 'Samuel', 'samuelcarvalho8991@gmail.com', NULL, '$2y$10$HPiljvtXEhddUXVOIi3HrO9sHud0NsK/GAY/J.2ydbMpihQql/3tS', NULL, '2025-04-22 02:23:08', '2025-04-22 02:23:08', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 99662-8051', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(9, 'Gabriel', 'biel_krapp@hotmail.com', NULL, '$2y$10$WheHpKDhK4RQ9CNGmuSfZemKvtiVGUokycoOvoW0sog/IZ2LUzMOO', NULL, '2025-04-22 04:31:50', '2025-04-22 04:31:50', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99200-7509', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(10, 'Guilherme Marcelino', 'guilhermemarcelino_91@outlook.com', NULL, '$2y$10$Osv7t3byiINZPEFGaHn6V.nLQ/w95xmdjHfjI.GftF5CJU77cvidm', NULL, '2025-04-22 09:58:46', '2025-04-22 09:58:46', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99185-4342', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(11, 'Gabriel palheta rabelo', 'dtatsumi430@gmail.com', NULL, '$2y$10$XfoVoy/3anG4MVGKa7mjDOWw.tws8X9mCQhBfu2D70mPb0scI1Z1.', NULL, '2025-04-22 10:34:37', '2025-04-22 10:34:37', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 99414-7949', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(12, 'Davi', 'marquessilva7779@gmail.com', NULL, '$2y$10$rthbr/X4ESO.d4a5wbVy4u3Lua0ejPhMabkOj/2eByHei8elyy4Qe', NULL, '2025-04-22 12:30:44', '2025-04-22 12:30:44', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(33) 99122-7047', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(13, 'Victor Alexandre ribeiro da silva Aurélio', 'vitorfoy@gmail.com', NULL, '$2y$10$LXLE1g4xGmdUFxW4Fc/YD.3pkXkezm87kStd664Cmd12MWmfpNGXa', NULL, '2025-04-22 14:19:59', '2025-04-22 14:19:59', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 98936-8208', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(14, 'DAIANE ROCHA DE SOUZA', 'daianerocha380@gmail.com', NULL, '$2y$10$hah1.EQSOw3HE.h1D9eM/e/cUvSdFMZcEeV18qs9nbdUtqpP3buRu', NULL, '2025-04-22 18:44:50', '2025-04-22 18:44:50', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(73) 99952-7248', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(15, 'MChina', 'marcelouno27@gmail.com', NULL, '$2y$10$J0m972r9CQXH1hZxcrCdsO4nxl.1H94e2Mob0gklIzJ7SPI32cvgO', NULL, '2025-04-22 19:14:11', '2025-04-22 19:14:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(81) 98992-7464', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(16, 'Diego Francisco da Conceição', 'diegofc15@gmail.com', NULL, '$2y$10$1Qy2F9SVlsmQkV6vNEQPw.EbfDrrM5Ch1IharXOcti1kFFIK45tyi', NULL, '2025-04-23 02:17:59', '2025-04-23 02:17:59', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95421-9280', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(17, 'DANILO CAMPOS MACHADO DA SILVA', 'danilocampos855@gmail.com', NULL, '$2y$10$nSbkM4JgoDK/NH/Lmv6JE.BZ7XMNLxp/GXv5pUy9oEZbZkruUbJzu', NULL, '2025-04-23 05:03:03', '2025-04-23 05:03:03', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 98903-3757', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(18, 'María del Valle Caro', 'mariadelvallecaroalvarez@gmail.com', NULL, '$2y$10$xMxnzZbSqiaNXmxJ3kdxRu0y7wuZQ8Ee04aXQ1yunn0bb5j0E6oWK', NULL, '2025-04-23 09:19:41', '2025-04-23 09:19:41', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 61353-1062', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(19, 'iphone gustavin', 'iphonegustavni017@gmail.com', NULL, '$2y$10$PNrRN2gon/FFiRdvvxkbd.NKMFNYuZJGhVHlYHN4/exkYaFQUmTiq', NULL, '2025-04-23 13:54:04', '2025-04-23 14:19:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(17) 99150-0437', 0, 0, NULL, 'M91U32ZUG7', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(20, 'XTNGR333', 'xtngr333@gmail.com', NULL, '$2y$10$tjS7EADMt9aPcNzDC5HjAOI7we0v4Ng5Q5gvO0P1h7zb13rEdJucS', NULL, '2025-04-23 14:11:38', '2025-04-23 14:11:38', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(95) 11172-9', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(21, 'LUIZ RODRIGO MARTINS DE PINHO', 'rodrigogatinhobom@gmail.com', NULL, '$2y$10$CaWavO/1LlXbEv6kbTEQGO/vyxpETIXhyUbBv7kMHIiBTscRTeMwm', 'Ub5zr9W2ZearpxM78UwaAZly9imilcByT9KU3NvoXidDPRRrsNOXSXroM2TV', '2025-06-18 13:24:16', '2025-06-18 13:24:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(38) 99134-2982', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(22, 'EDILSON ALVES DA SILVA JUNIOR', 'junioralves.rjcg@gmail.com', NULL, '$2y$10$lxqeQlVoNSCfiqKY5z3c5Ovx4dEziIatVsK8BUv/N2KITXhshs6Fm', NULL, '2025-06-18 23:43:36', '2025-06-18 23:43:36', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97637-3774', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(23, 'Alexandro', 'Arobedesio@gmail.com', NULL, '$2y$10$1hbPYgo2v8LvhgeHKnqlIuYVf/TGSUE1cL2oRO6.UJT46mX4POFUW', NULL, '2025-06-19 00:51:34', '2025-06-19 00:51:34', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(86) 99948-2894', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(24, 'MARCUS VINICIUS RODRIGUES ALVES', 'marcus-kita@hotmail.com', NULL, '$2y$10$OuNIQTblx/3gOtNn.m7C4uL7H4N5UMs6da/HF4Qp1smzNRWmPWsC2', NULL, '2025-06-19 02:25:47', '2025-06-19 02:25:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(13) 99185-1632', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(25, 'Cauã', 'cauanunes1806@gmail.com', NULL, '$2y$10$K25HSO7hXCt9fhMQPFfrp.zsdX2Ew718VVU39sKuQwHVBPxAPb9uK', NULL, '2025-06-19 03:30:01', '2025-06-19 03:30:01', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 99551-2903', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(26, 'henrique gomes jorge', 'henriquegjorgee@gmail.com', NULL, '$2y$10$N3w4B49MBKMECSTnAd47wOYNhZt.yyPnREPZD/W1F51fv7jPEvsaS', NULL, '2025-06-19 03:32:39', '2025-06-19 03:32:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 99352-7789', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(27, 'Renan Corrêa', 'renan.cf@hotmail.com', NULL, '$2y$10$Q/JeM7uTVqjHAZ6wMmDkBOW6HRhLcuaAyTy2P5pXTEiqLKv43KYA.', NULL, '2025-06-19 04:31:26', '2025-06-19 04:31:26', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97690-6427', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(28, 'LUCAS MATOS SOUSA', 'lucasuiton@gmail.com', NULL, '$2y$10$eLTHLYMsJm/an9YUZ.EdJersTw3vLjljZuDAYoaiW8aUOx3ha5sS6', NULL, '2025-06-24 21:03:07', '2025-06-24 21:03:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(71) 98628-3861', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(29, 'Rhian Dos Santos Aleixo', 'rhianjss155@gmail.com', NULL, '$2y$10$Z.lMdoRNBJKNRMJQRC4Sruv713TmtS8Y7GJaShK5hpzpFmrynSiVa', NULL, '2025-06-24 21:05:47', '2025-06-24 21:05:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 94199-5901', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(30, 'phzzn', 'dantesnb@gmail.com', NULL, '$2y$10$V8KRx3WoTZBuJ0NmQj6jlunnsD9HfX4VJXue32gPHukY6ps/Cfria', NULL, '2025-06-24 21:37:23', '2025-06-24 21:37:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(32) 98424-4251', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(31, 'David Maciel', 'david_south.surf@hotmail.com', NULL, '$2y$10$4to9ElT0VxdHLugFHmkWr.jLw4TWYtPXveR6Qc2HbohhpIMD2WUTu', NULL, '2025-06-24 21:41:16', '2025-06-24 21:41:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99520-3046', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(32, 'matheus barauna', 'barauna4i20@gmail.com', NULL, '$2y$10$Rpe8Ox5fGbVdTMNI.k8hMe7FQRUzE.S9DyB5tqQIZkA/ZziP98vHS', NULL, '2025-06-25 02:51:09', '2025-06-25 02:51:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99999-8531', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(33, 'OLDEMAR JUNIOR MARTINS DE ALMEIDA', 'oldemar.martins@gmail.com', NULL, '$2y$10$/EWm5QUpVTy9dOolL9yUL.qmhUL.9iCHBLa/PDqaU/t278ajvynGq', NULL, '2025-06-25 04:17:18', '2025-06-25 04:17:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(38) 99211-3819', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(34, 'Patricia', 'shadowoflux@gmail.com', NULL, '$2y$10$KaW6SwRfrrsQTKhjgqzb5eYhvJGLXRoLpTEmrQXZBhGkv/bZ9XnnW', NULL, '2025-06-25 17:11:07', '2025-06-25 17:11:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97211-2483', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(35, 'LUIS FERNANDO IRENE DE CAMPOS', 'luisfernandocamposirene@gmail.com', NULL, '$2y$10$FSl/pN4jVOPocHR.Kk4I7e9U7R1YBO0cq4pEnsNSb1USNzRd2Sqq6', NULL, '2025-06-25 19:19:29', '2025-06-25 19:20:42', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(14) 98158-1050', 0, 0, NULL, 'BFHVZF9V0M', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(36, 'Gabriel tesa', 'gabrieltesa9@gmail.com', NULL, '$2y$10$kyWcXh1hSIRajI5AdMynp.kb2KbQinh3wrIeB1jk0NXKc.Ve1U/5m', NULL, '2025-06-25 19:37:19', '2025-06-25 19:37:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(48) 99615-8550', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(37, 'Victor Henrique Lima Sanches', 'vh2542520@gmail.com', NULL, '$2y$10$1W0DvsmQFO3Z8WNPC0UkCOhO1fK3lJOT6Ukx7KCkd1/yBvVNuBR3G', NULL, '2025-06-25 21:56:09', '2025-06-25 21:56:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(18) 99633-9356', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(38, 'Lizandra', 'lizyh.007p@gmail.com', NULL, '$2y$10$Igb8mLTvQaP5gF0mN/Ocgu4JGvuM3U7Qown4DHW/ryt1pcvYH5VLa', NULL, '2025-06-25 23:12:09', '2025-06-25 23:14:37', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(15) 98119-9826', 0, 0, NULL, 'LDOEGVQ535', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(39, 'pedro', 'larcompletoo@gmail.com', NULL, '$2y$10$hjgbHoV34byO4HNCqiULAOC4rZPzA6bvv7mOB3zfSNU769n9pGQwO', NULL, '2025-06-25 23:13:31', '2025-06-25 23:13:31', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 94002-6045', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(40, 'Lucas Oliveira', 'lucasoliveirabr98@gmail.com', NULL, '$2y$10$IrZ.QZT4k8Zy7IZUvqUofO6p8NOO8dx1DDTHg/j92wwmry/UZthjG', NULL, '2025-06-25 23:39:26', '2025-06-25 23:39:26', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99695-8307', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(41, 'Camila Rocha Graeff', 'caamilasilva03@gmail.com', NULL, '$2y$10$krIATPKovwZ35eVyGUpPGucMx7xQn0W/7md7.6hBTQXjjgGf.7F7m', NULL, '2025-06-26 00:11:17', '2025-06-26 00:11:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99898-1850', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(42, 'Edvaldo', 'ajunior1710@gmail.com', NULL, '$2y$10$P8W0RFmxXqFpkCsimtn52eXGoPxsMarhhlUzyRWY9lj5inpWXaG3G', NULL, '2025-06-26 00:19:03', '2025-06-27 08:58:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 98695-1800', 0, 0, NULL, '32XEZWADJK', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(43, 'Matheus de Lima da Silva', 'sheikovisc@hotmail.com', NULL, '$2y$10$oVGJqv6h7TbyauzhcR4M9.qH66GTcllj/XAw3oB/26Ns.FbL0XHme', NULL, '2025-06-26 09:08:44', '2025-06-26 09:08:44', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99191-4946', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(44, 'Fabricio Ribeiro', 'fabriciols989@gmail.com', NULL, '$2y$10$bwbrQ329Eejel4INm8wWnutPmlwt/ntjFXDV6MBAWkenj8ycoMH6q', NULL, '2025-06-26 11:21:24', '2025-06-26 11:21:24', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(73) 99808-8194', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(45, 'Júlio', 'jazardoli@live.com', NULL, '$2y$10$KQ.9j74rRhkrOMomqTHxO.Zdf84ia8MDOCmnsdqLmF6Poly5AxDzO', NULL, '2025-06-26 11:41:29', '2025-06-26 11:45:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 98480-4080', 0, 0, NULL, 'TPQEPR7BJ8', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(46, 'Henrique Massao Ito Dutra', 'veiosowow@hotmail.com', NULL, '$2y$10$FzscPBIoQBuvc6pwUP/0xeK8v2S7WoiyjaNT8LwagCGyolklX5nAe', NULL, '2025-06-26 13:37:54', '2025-06-26 13:37:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 99862-6782', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(47, 'Kaique', 'kauetofoli123@gmail.com', NULL, '$2y$10$pbgKvtD/PVnu4qcAdnVX3efP52vJxEfVfqthT4k8faDR1Q6Cr.prm', NULL, '2025-06-26 16:24:26', '2025-06-26 16:24:26', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99257-6146', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(48, 'Pedro Muzeti', 'pedro.muzeti66@gmail.com', NULL, '$2y$10$NZhlcN3foDG11gYl.vWLZOYfeXEb05nnMbxA1Q29bcH5zfjSPt.yq', NULL, '2025-06-26 16:47:20', '2025-06-26 16:48:02', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(17) 99115-9230', 0, 0, NULL, '1ESGA7KLWX', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(49, 'KEVERSON CUSTODIO MENDES', 'keversonm089@gmail.com', NULL, '$2y$10$AexJg/G95C8QqsjqX0TapOYZEQlAI.1Vh9ORjTl19xOhn7D/MLYES', NULL, '2025-06-26 17:43:35', '2025-06-26 17:43:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 98843-8046', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(50, 'since QuebraBanca', 'nickzimyt@gmail.com', NULL, '$2y$10$Y31aqPdpZ6Uz88V3lrp.gugJBXzMHedcLBBlaST7mvstl6cnnnvFi', NULL, '2025-06-26 21:00:49', '2025-06-26 21:00:49', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99903-3090', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(51, 'Arthur Manoel dos Santos', 'artglowsz3@gmail.com', NULL, '$2y$10$KqiJI2km..ycrUfQCNxycus/6Sg0ToLW32g8/XgjKiAKq5hdgrdSO', NULL, '2025-06-26 21:02:07', '2025-06-26 21:02:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 96545-2104', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(52, 'Guilherme Obedy Castro Barbalho', 'guilhermeobedycastrobarbalho@gmail.com', NULL, '$2y$10$TSQAfH/aBhX.I0i00vZtRuoJ/EzH.aIKlU6EO.ipRyowLzHVyT3m2', NULL, '2025-06-26 21:14:20', '2025-06-26 21:14:20', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(77) 99192-5282', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(53, 'vinicius tavares', 'viniciusfernandoleite995@gmail.com', NULL, '$2y$10$5Yghz1V6FVq4U83OqFhba.4.Rw9YgLO1rE7m/CFJ14KbMa7pIUh9W', NULL, '2025-06-27 00:18:35', '2025-06-27 00:18:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(15) 99808-3897', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(54, 'Matheus Fernandes Silva', 'mfernandessilva01@gmail.com', NULL, '$2y$10$ElcS7vwowXTm2D/MKMhXEePMOVtpPmZ7g1cmEtfThbghuZiLieToS', NULL, '2025-06-27 00:43:39', '2025-06-27 03:44:05', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 99380-8737', 0, 0, NULL, '0LKXJ6HKNJ', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(55, 'Lucas Munoz', 'lacas1998@hotmail.com', NULL, '$2y$10$0C/cSc1R6e.rjopYAC8YQeCMwQTMxoiQgzxfzPftaYoXTEJuJkM8m', NULL, '2025-06-27 01:34:18', '2025-06-27 01:34:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95811-1273', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(56, 'Phelipe de Paula', 'phelipelgk4@gmail.com', NULL, '$2y$10$OebhesUV1Utsj.6HuCFYo.dS96BBtuM8SaYsP6cFRiUkgHeSChy5O', NULL, '2025-06-27 02:34:46', '2025-06-27 02:34:46', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(32) 99990-6426', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(57, 'Everton Luis garroni Soares', 'evertongarronisoares2021@gmail.com', NULL, '$2y$10$lEIWqKsURn3u5yYNpUgZi.KCDuRFmHd..85hggwpEpFPSILprHuB2', NULL, '2025-06-27 05:25:54', '2025-06-27 05:25:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 98317-8008', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(58, 'Kaique', 'kaique.moraes.pereira85@gmail.com', NULL, '$2y$10$n1BRK1BPTYjkWFw.0QPy3ukDBPTYBZc/.BFAZ4mroJRPlO4vaTSZe', NULL, '2025-06-27 07:28:07', '2025-06-27 07:29:34', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 99925-9943', 0, 0, NULL, '1AZMLE2NFX', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(59, 'Boragozar', 'boragozar@gmail.com', NULL, '$2y$10$/wJNpkyBR4.MW/qrD5s.4OS39C/SDA90jGM57bYD8URIBxqgRm4Xa', NULL, '2025-06-27 07:56:56', '2025-06-27 07:56:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(89) 56986-5328', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(60, 'Marllon Alcantara Freitas Feitoza', 'marllonalcantaraff@gmail.com', NULL, '$2y$10$0ubc//Xj4uGwtJ2fuQAPK.TTeEK81ZUDnCFbQ7yAu5N51CSu1Zpf2', NULL, '2025-06-27 07:58:33', '2025-06-27 07:58:33', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(65) 99230-1365', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(61, 'rhuan kharlo dias dos santos', 'rhuankharlo@gmail.com', NULL, '$2y$10$IyFj9gg.kYd4it3biIKYjuJ5I9EnrK5TSVdJueKPXOhj8h6bKU37G', NULL, '2025-06-27 10:27:03', '2025-06-27 10:27:03', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(65) 99323-7506', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(62, 'pedro vinicius pimentel dos santos', 'pehmentel97@gmail.com', NULL, '$2y$10$ExMrHwfXmAe8w0nkgU4Lz.jagu2qb2bri/vNjkwO87QeTF1bmOcXS', NULL, '2025-06-27 10:29:06', '2025-06-27 10:29:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95276-1850', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(63, 'Nicolas Leschemelle', 'nicolaslesche95@gmail.com', NULL, '$2y$10$Fi6c2ooptsnA9sNH1jGoK.VbrZcRmLlcAff6YLAEO70He1.ZpFHg6', NULL, '2025-06-27 15:33:15', '2025-06-27 15:33:15', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 99885-6083', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(64, 'Gabriel', 'gabriel.duaaarte@gmail.com', NULL, '$2y$10$y0szXNkcBkBWPTdtAuB2lOHtdXDSZG5X9dxR5TMPqKe1oMqApAkh.', NULL, '2025-06-27 16:02:54', '2025-06-27 16:02:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(13) 99161-9712', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(65, 'Cleverson silva de Oliveira', 'popimanne@gmail.com', NULL, '$2y$10$PIkqISD4VlOds7jRBeeoGuZOV3y/1KP22G1ibUDfjs2lyGNbmbS6i', NULL, '2025-06-27 17:12:09', '2025-06-27 17:12:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99966-8947', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(66, 'ISRAEL FERNANDEZ AVILA', 'israelfernandez13ras@gmail.com', NULL, '$2y$10$GHvlb6/9HwFGpk66IvejI.9MaFCGB81ciydbOKaqC3/80h3Hd./0G', NULL, '2025-06-27 18:12:18', '2025-06-27 18:12:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(77) 12436-342', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(67, 'Luiz Felipe Ribeiro', 'luiz.silva66ribeiro@gmail.com', NULL, '$2y$10$8ph4.WLDs/7LbPP3De.0.u4blHlekagfkR6D1P3iBWx9hYqMLC.wO', NULL, '2025-06-27 20:10:00', '2025-06-27 20:10:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98419-9699', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(68, 'Gabriela', 'gaby.silva.2276@gmail.com', NULL, '$2y$10$u7Mn9GAjmAFECg5rWCBdi.tvuHcrykddNUmDkUy7nPjMxJbKxe/OG', NULL, '2025-06-27 22:18:31', '2025-06-27 22:18:31', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97345-9739', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(69, 'gabriel henrique zanattaa', 'bogussatk1457@outlook.com', NULL, '$2y$10$oacNunAvxI6H0nAFMVIXi.SxVM1Mdih8jNi8CnrRGDaAp.x3NLmoC', NULL, '2025-06-27 22:49:55', '2025-06-27 22:49:55', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 99167-3786', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(70, 'luciano', 'scorpiogamer259@gmail.com', NULL, '$2y$10$ivQDK.JsJqlTL6UcQoKkC.3dN9UE6aSV2Oz7PvFUzx2bVcptexdFy', NULL, '2025-06-28 00:19:24', '2025-06-28 00:19:24', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(48) 99112-7719', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(71, 'Yudi Hamachi Simão', 'yudihamachi@gmail.com', NULL, '$2y$10$HGy2sK7Z/B8zlSVBklA2w.VBxNGq.P/XLfslFUd/amcCZHRjOJTFC', NULL, '2025-06-28 00:50:18', '2025-06-28 00:50:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98310-3489', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(72, 'RAFAEL CANTILHANO RIBEIRO', 'rafinhacantilhano1992@gmail.com', NULL, '$2y$10$Q0U0OUAYdrFJr0x4YSxAd.Ngvup6msfUo/GcjSOhVwFYoPUBPYrTm', NULL, '2025-06-28 01:25:02', '2025-06-28 01:25:02', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99236-7962', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(73, 'Elton Do Nascimento Eusébio', 'flaeltinho@gmail.com', NULL, '$2y$10$WiX.ipMJ0iOWqcBWUiNcO.eIwkNhOp/zfHYRZNh0Yr.0ng7zUd0hm', NULL, '2025-06-28 03:12:36', '2025-06-28 03:12:36', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 98659-1572', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(74, 'Rafhael', 'rafhaelxt@hotmail.com', NULL, '$2y$10$z2dTa5Vj8CGwTPnC6KAYUe0P1NwN4p7vOBcRn7y1Hq7ZRDY/C7RdS', NULL, '2025-06-28 03:58:48', '2025-06-28 03:58:48', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(63) 99254-1225', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(75, 'lucas', 'lkrodrigues1207@gmail.com', NULL, '$2y$10$lljtQxIEMZ72qZels23tYuwQfH6ZMT.OmimhO947nl0Re9s1MowEi', NULL, '2025-06-28 05:56:40', '2025-06-28 05:56:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 98467-5785', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(76, 'Vivian Lima', 'vivianc.limaa99@gmail.com', NULL, '$2y$10$JPI4ipH96rfewZq9UxVvfewiIT6Q3rN5c8Z8cCzO.SDQBm3M.l6dO', NULL, '2025-06-28 06:10:18', '2025-06-28 06:10:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(75) 98268-5218', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(77, 'Rayon Neto', 'rayonxneto@gmail.com', NULL, '$2y$10$yQwpLBDJTOdg6BtMMNFTpupMchbUboCiJeheKvGdx4F2a8sWqOgL.', NULL, '2025-06-28 07:02:01', '2025-06-28 07:02:01', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(54) 99232-6492', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(78, 'VINÍCIUS ANTHONY JUBILATO BORASCHI', 'majdjkadjd@gmail.com', NULL, '$2y$10$VJngG8hxUnrtLNJ.8ece9Olu6MuT7/pqR7AGX7QAs.pbelHLwiYQW', NULL, '2025-06-28 10:49:59', '2025-06-28 10:49:59', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(17) 99276-8230', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(79, 'marlon rondinele', 'marlonrondinele@gmail.com', NULL, '$2y$10$HSYOpqBFZ9/xWT/LHQfjSu32TtueX6j0pxJ7lzJJjwYx7IwHg10OC', NULL, '2025-06-28 12:01:45', '2025-06-28 12:01:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 99338-9078', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(80, 'lucas kaque frota dasilva', 'lucasfrotasilva1994@gmail.com', NULL, '$2y$10$XW/oOrl8uTcVF1/bH8Jwm.gtC5WCMn4g3UB2bJ5lFjY9obq2WhJB.', NULL, '2025-06-28 13:26:44', '2025-06-28 13:26:44', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98139-7153', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(81, 'Enzo', 'enzorodrigoof24@gmail.com', NULL, '$2y$10$blDSk2b3xMaifV0/QiiRgevJ7vzPq/9htf8y3x.OolvjVInIAouU6', NULL, '2025-06-28 14:44:44', '2025-06-28 14:44:44', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98608-6854', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(82, 'saymon júnior da silva basso', 'd80759780@gmail.com', NULL, '$2y$10$MSQENInoXI13YQ08p.4t3e0XQijz/T3ns/UtXYYmGhewfdD8NCvsq', NULL, '2025-06-28 16:00:13', '2025-06-28 16:00:13', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 99971-1819', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(83, 'jefferson brito', 'jotasbbrito@gmail.com', NULL, '$2y$10$GnyDRteBaKUOE2Nfh12l3eGLG4TXJn5Hq8wYtb4TQffVyDBzXr6pq', NULL, '2025-06-28 16:42:19', '2025-06-28 16:42:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 32811-442', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(84, 'Vinicius Nicolau Alves Correa', 'viniciusbudaa@hotmail.com', NULL, '$2y$10$H6NuuvyebxYrD2dq3ZLItuH3AWdw3OJ6fQcntDMWzi9L4q2lZ30YW', NULL, '2025-06-28 19:00:00', '2025-06-28 19:00:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(17) 98118-9309', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(85, 'robinson', 'robinsonsantosadaojunior@gmail.com', NULL, '$2y$10$/OkgkwRcDc.EnC7SvEiP.OsFaPHE7f72gg0FzslmB.hflkkl8Zty6', NULL, '2025-06-28 19:20:40', '2025-06-28 19:20:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 91944-4496', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(86, 'Yuri Mendes', 'yurimendespb@hotmail.com', NULL, '$2y$10$f07DY5lGJ6ZSZYeF9FHor.oxJIHmK0/9QH1VOK1RwAjX/Ovr91TVG', NULL, '2025-06-28 19:38:14', '2025-06-28 19:38:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(83) 99869-4422', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(87, 'Thomas da silva santos', 'thomax65s@gmail.com', NULL, '$2y$10$3te6p7qJJW24gQjizN8qFuB6xrT6tLw9eWo.3dtr67LZT6ySaWEpS', NULL, '2025-06-28 22:03:12', '2025-06-28 22:03:12', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(87) 98854-0916', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(88, 'LEANDRO LUAN ANTUNES DA COSTA', 'leandroantunes1104@gmail.com', NULL, '$2y$10$Il54yOSTz7b.MQbx2Qf2L.cxQq0c2hgOg.g11S3NnjKb5YF/or8X.', NULL, '2025-06-28 22:23:34', '2025-06-28 22:23:34', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99150-0286', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(89, 'Joao Schumacher', 'balamito123@gmail.com', NULL, '$2y$10$QLc9tCUatoq90BJpAiXDjeBkR5CKD6QNJwd1cuXm9MH0QQQJIq/PW', NULL, '2025-06-28 22:30:00', '2025-06-28 22:30:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95168-6126', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(90, 'Luan766y', 'luanff9287@gmail.com', NULL, '$2y$10$pBrKlCMCm/tbr7CDY5KiXezLosntWkwL0JoArYzrJMAKL12RwJ5Z2', NULL, '2025-06-29 00:17:27', '2025-06-29 00:17:27', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(75) 98179-8186', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(91, 'Brito', 'brito.igor96@gmail.com', NULL, '$2y$10$LBHbo5jWEQHERHLjFoKW8OqCGnEU7PjgjoC2Y011itFs3zzJohhZ6', NULL, '2025-06-29 00:23:09', '2025-06-29 00:23:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99253-5162', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(92, 'Everton Fogaça da Silva', 'contatoevertonfogaca@gmail.com', NULL, '$2y$10$15QzpcBuaTdtVJwuQHzwZ.PwD9RinzaNmxytu8LDCBmCi09CFw5kC', NULL, '2025-06-29 02:00:01', '2025-06-29 02:00:01', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 96503-8279', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(93, 'Luan77y', 'luanssjssl@gmail.com', NULL, '$2y$10$A47tq..xdEyCMOxkCwX/sOiKvGeJmd3CyTCwQ3EEkRwBBffl8Qs7O', NULL, '2025-06-29 02:18:51', '2025-06-29 02:18:51', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(75) 98179-8186', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(94, 'bernardo', 'bernardonaflex@gmail.com', NULL, '$2y$10$ntms6TP/c54PDxKDcBBfJOS6F8nAlOQkLG.9YRx04pqZINdHJ63He', NULL, '2025-06-29 02:19:17', '2025-06-29 02:19:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 99700-2207', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(95, 'Caio de Vasconcellos Resende', 'caiovasr@outlook.com', NULL, '$2y$10$IcZKPkqSQ4OONcb/0VLlIu02nqZzDegnSmaC.W0ceHfNwr1YJwAb2', NULL, '2025-06-29 03:46:50', '2025-06-29 03:46:50', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99889-8305', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(96, 'david toral', 'expressmodas2024@outlook.com', NULL, '$2y$10$M.wf8HvIotaETsH4Jkhxv.H1UQRfPttILaM42OjSdrAC8FXMv2.KW', NULL, '2025-06-29 06:13:40', '2025-06-29 06:18:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(49) 99806-1667', 0, 0, NULL, 'DDVZ4MMO2B', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(97, 'Victor Gabriel dos Santos Magalhães', 'awokdoawkdo12@gmail.com', NULL, '$2y$10$N8oKUIvwS3gcC6OEQB1Lvu6edoqLVHDyQg4BhorEdDYEpuNbUNAc.', NULL, '2025-06-29 07:34:50', '2025-06-29 07:34:50', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 96588-3860', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(98, 'Fabiano', 'www.fabianopereir@gmail.com', NULL, '$2y$10$4gBgxn8/JRrmnIUFTCB2v.GV5cGjosLHWn26GmqlmrRaWN2pOJrii', NULL, '2025-06-29 08:46:52', '2025-06-29 08:46:52', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99207-7743', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(99, 'WAGNER WESLEY DE OLIVEIRA', 'wagneerr@hotmail.com', NULL, '$2y$10$WT/EQDXVMWkL7/e4tUZnA.DGlFqxMXRmNVhWv35HV7NLd/.eW.DIe', NULL, '2025-06-29 09:11:39', '2025-06-29 09:11:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(37) 99866-2130', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(100, 'Luiz Fernando', 'luizf9919@gmail.com', NULL, '$2y$10$0DY/kPEcoFb540VQD7zRQeg/85DdwD1AwY9rtFHvGphOwqi4W8ut2', NULL, '2025-06-29 09:18:48', '2025-06-29 09:18:48', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 99639-1486', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(101, 'BEATRIZ GOMES CARVALHAL', 'bcarvalhal70@hotmail.com', NULL, '$2y$10$VShdMrWj7ucIUp8bNf9wXuvMvSRn79GgQSf84woKaqweg0xV6MVaa', NULL, '2025-06-29 10:36:24', '2025-06-29 10:36:24', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(69) 99987-7657', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(102, 'Anderson pinto da Silva', 'andyypdfs51@gmail.com', NULL, '$2y$10$x5nKucobJr.wiqMST7B4OOYtltA5o3xcfTlNSoKkzo/lqmqFsAs2q', NULL, '2025-06-29 10:54:18', '2025-06-29 10:54:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99168-3200', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(103, 'vinicius', 'viniciosriosdelima@gmail.com', NULL, '$2y$10$tJha/ao5IiXfgUTMHIqBk.YHfmuAZvl3L8LwgwQ/ZCMCa3AWBxGQe', NULL, '2025-06-29 11:32:01', '2025-06-29 11:32:01', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(27) 99936-0073', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(104, 'Gustavo', 'diasgustavo319@gmail.com', NULL, '$2y$10$3CLcOgYu.PRBdDRfyzC/4uYbFkDRPjH1Tu8/lSAQJvyS5.IcrGVv2', NULL, '2025-06-29 12:11:03', '2025-06-29 12:11:42', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(45) 98824-4316', 0, 0, NULL, 'OJW2SP5ELF', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(105, 'Kleber', 'Kleberpatrick44@gmail.com', NULL, '$2y$10$Bwq.lt3.fGQbMdJbgaswE.P4ZnlauEe.MoCHz95sDq87EDYCUDUni', NULL, '2025-06-29 13:03:05', '2025-06-29 13:03:05', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99965-2876', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(106, 'RAFAEL HENRIQUE CIPRIANO', 'rafaelbolt35@gmail.com', NULL, '$2y$10$g3HzNUe/ElnJIv0ycmWcvePjjhfeyKtyTG/zIBQFP5IAvqJtUxMdC', NULL, '2025-06-29 14:34:22', '2025-06-29 14:34:22', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(48) 99919-7372', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(107, 'marcos adriano de moraes', 'marcia_gaucha121@hotmail.com', NULL, '$2y$10$MJhYrX2vInJhsW8neZPZ1e/pV8DZ7f/9D0LpdHje45HS.xV6NlxFS', NULL, '2025-06-29 14:38:04', '2025-06-29 14:38:04', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(54) 99709-7596', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(108, 'michael', 'Xisdexd4head@gmail.com', NULL, '$2y$10$SK3iUgCp8wPW5jF4ibV1z.7Dr8kZYQwxXMqXC6Tb88IOOuqfqbZeO', NULL, '2025-06-29 15:20:47', '2025-06-29 15:20:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(14) 99671-8204', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(109, 'BRUNO ALEC DA SILVA', 'alec.psp.27@gmail.com', NULL, '$2y$10$1wHRvVtzzpskmz1oQ0xGce0rvNHMVcb3RGOS3mwdHCUURMy7zGAU2', NULL, '2025-06-29 15:32:37', '2025-06-29 15:32:37', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 98972-2672', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(110, 'Raylane Esteves', 'raylaneesteves@hotmail.com', NULL, '$2y$10$3byjupD8PX1QTegQG7ioXevMBEG.PFnMvUj4mMejPhSzonPwxzYr6', NULL, '2025-06-29 17:18:48', '2025-06-29 17:18:48', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 99417-6706', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(111, 'Eduardo cesar', 'eduardocorreiacesarsilva@gmail.com', NULL, '$2y$10$foUbtudeWsdZBZMjXJ/wfuMAucqEe4Cc5c7T.l1xO7fHkCof6RVoC', NULL, '2025-06-29 20:13:28', '2025-06-29 20:13:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 98419-3210', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(112, 'Fabio Borfe', 'bf.fabio@yahoo.com.br', NULL, '$2y$10$Rk.NYlz5wHXGePjnwdr5mu3tGPIkxUq3LHyMFrI2lZRsCRMAw6UJy', NULL, '2025-06-29 21:48:10', '2025-06-29 21:48:10', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99574-6762', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(113, 'biancamarc', 'biamariamachado27@gmail.com', NULL, '$2y$10$gp1Zup5a/TeKkdVaVLVTB.LP7zaamlKmvrJYjuh5Z9Ou8Bapqw.Ka', NULL, '2025-06-29 22:35:35', '2025-06-29 22:35:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(42) 98422-1240', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(114, 'Jander Lúcio Moreno Jonior', 'janderjunior24@gmail.com', NULL, '$2y$10$3eQL2Wu751D1ZVr6GpQBdOhVnNR7CtKmLiqJD.Q3X/J/.JhZ9GaiO', NULL, '2025-06-29 23:27:16', '2025-06-29 23:27:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 98876-5269', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(115, 'Jonathan Bauer Goebel', 'jonathanbaueg@gmail.com', NULL, '$2y$10$uceOKJ8ez0PDtl1H6e4Y2uLPdFnbCbCfFmumQZorO7yMzXdhMHhBC', NULL, '2025-06-29 23:46:23', '2025-06-29 23:46:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(24) 99321-4738', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(116, 'Edemilson ADRIANO DA MOTTA', 'edemilson_ps399@hotmail.com', NULL, '$2y$10$VT.idPVZTdedZDKMR.KAl.JjUVMfXBJYRFEQUG9F7OjVUwGiM8OpK', NULL, '2025-06-30 02:02:54', '2025-06-30 02:02:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99127-0430', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(117, 'Leonardo', 'Lo6879331@gmail.com', NULL, '$2y$10$nXvn7EBu6Q0E5GAEtGqzC.jY4tdZk1PHlW3O1NlWaMuzctV4cDbyu', NULL, '2025-06-30 03:08:00', '2025-06-30 03:08:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(13) 99184-3498', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(118, 'Matheus Gabriel Franzo', 'matheusfranzo@hotmail.com', NULL, '$2y$10$ZtXSL8B/hCcJVJcQ6ImCSefJBo8NUOTMl9gr67SGrXVLlDUckLwU.', NULL, '2025-06-30 04:45:40', '2025-06-30 04:45:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 94115-2024', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(119, 'eduardo', 'eduzxl170@gmail.com', NULL, '$2y$10$Yi3omNj7z5xezkgYFB/e6exHZWEMBs5Lat/6Q/uKptZaDsfxmTZhy', NULL, '2025-06-30 05:36:41', '2025-06-30 05:36:41', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(45) 99973-4961', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(120, 'Vinícius Hoppe de Souza Rocha', 'viniciushoppe469@gmail.com', NULL, '$2y$10$FeyrnfzXdIJ8bTZtrYLFreqAMwRhGjlf2wFI0zP859Gb3ZQtsrQN.', NULL, '2025-06-30 09:03:56', '2025-06-30 09:03:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(14) 98800-4776', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(121, 'TAYLON', 'taayllonn@gmail.com', NULL, '$2y$10$F9qQnyB6Ga6w9J2cY5U6dOfQHOa2biIM97AGZ/yyggz6Ay2CSgVTG', NULL, '2025-06-30 13:08:26', '2025-06-30 13:10:04', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97836-9132', 0, 0, NULL, '1CYUXKPXYV', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(122, 'Juliana Rodrigues dos Santos', 'richardanny686@gmail.com', NULL, '$2y$10$etxmfQoCL9TQmBEuQdzgoe8f5A68ZHHxapJ2dT7MChzhANzBjxW22', NULL, '2025-06-30 13:13:45', '2025-06-30 13:13:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97345-2465', 0, 0, 121, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(123, 'Jefferso Novais', 'jefferilha@hotmail.com', NULL, '$2y$10$PQDqeWLqtQoX80xP3P.nSOS4ASbKALU5UyFE3GOY..lTSJl0dpr2.', NULL, '2025-06-30 15:12:55', '2025-06-30 15:12:55', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(17) 99736-8728', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(124, 'Luiz', 'Luiskzin31326631@gmail.com', NULL, '$2y$10$JAf2yLvbhe.ObdQRAn2tOOAC2FgSa2XkAO5PIuZuuiX/ozijfUSpC', NULL, '2025-06-30 15:44:59', '2025-06-30 15:44:59', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(12) 98185-3216', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(125, 'Simone', 'aparecidateixeirasimone27@gmail.com', NULL, '$2y$10$lsqCkUb/GHCaHbzT9EUMy.YbnlYdZgC9twDwHNbseUFg1SmTKWawi', NULL, '2025-06-30 15:52:23', '2025-06-30 15:52:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(42) 98843-6968', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(126, 'Cristian', 'silvacristiansilva23@gmail.com', NULL, '$2y$10$PQlD4uqTIgxRmUI12nZspu6gqD8xJ2XIVfBjiPnDBPtyvyUle45a6', NULL, '2025-06-30 15:55:26', '2025-06-30 15:55:26', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99884-7893', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(127, 'Alisson Thiago do Prado', 'alissonthiagop3@gmail.com', NULL, '$2y$10$h0pZK2ux99d.qW0cN3cKD.AjCXFakSBKvHKs/hG69vXiwEwjDnqoG', NULL, '2025-06-30 19:27:42', '2025-06-30 19:27:42', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99789-1520', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(128, 'lucas dos santos neves', 'lucas.santos.ves38@gmail.com', NULL, '$2y$10$BBDX5yfDrQsw0cQRswPi6uLidARICL5R0t2IC5a/.nRSxYbO9b9S6', NULL, '2025-06-30 19:35:53', '2025-06-30 19:35:53', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 93451-885', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(129, 'Willian Iensen Oliveira', 'willian.iensen@gmail.com', NULL, '$2y$10$RT5Ol/Ee0D.f7RgzaLWOXezghn5vWuKaU6hsCY5k1WVbEWmt4BAAy', NULL, '2025-06-30 23:27:54', '2025-06-30 23:27:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(42) 99164-9992', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(130, 'Kelvin Breno Pinheiro Pereira', 'kelvinbrenno101@gmail.com', NULL, '$2y$10$FeP4VUFzI04XjYE7pUWCuOdHXI6Cf3REdMCJG6uPSqLIFe8u2j8s2', NULL, '2025-07-01 02:07:15', '2025-07-01 02:07:15', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(92) 99401-9351', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(131, 'Catarine', 'moraescatarine46@gmail.com', NULL, '$2y$10$MxLHBRcivrOGEGS8Cqdy7OqNVVHHeej3BRpk.rvgB5/Qgvas38MXK', NULL, '2025-07-01 11:22:25', '2025-07-01 11:22:25', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99622-2239', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(132, 'JamesLauro', 'james_bancoff@outlook.com', NULL, '$2y$10$8GFmF/tgutz6SFTqQRbLfOfK5m03.AmrMzJY2NuZXThaUrEi78TB6', NULL, '2025-07-01 16:12:53', '2025-07-01 16:12:53', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(45) 99962-4864', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(133, 'Wellington Gouveia', 'wellingtonyuu@gmail.com', NULL, '$2y$10$5WpgfxY.zfUg8nXWGN9f9e0CyfrOMDQMqwTv10fYHh24Z.yXk82E2', NULL, '2025-07-01 16:59:28', '2025-07-01 16:59:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 94908-8401', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(134, 'Liliane', 'lincolnjunor@gmail.com', NULL, '$2y$10$q9fyUP1B6AYOujuiR62JNOcTxCZocsiptE4c4yzMDqkqlWUnEXBP.', NULL, '2025-07-01 19:00:37', '2025-07-01 19:00:37', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(92) 98843-0560', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(135, 'romulo', 'romulomachado8@gmail.com', NULL, '$2y$10$S7XsTitJJK5rj74kfUp20eyBAw5hq7qyLkRM5qBsVdpqbqa7gb1Hu', NULL, '2025-07-01 19:57:43', '2025-07-01 19:57:43', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 99135-7323', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(136, 'Pablo', 'plotitolotito@gmail.com', NULL, '$2y$10$Yde1gQEUf46vFJ3BrFn28uNenyTCdv3AWi4ZNawADjcEBY7Dz2WQS', NULL, '2025-07-01 23:02:40', '2025-07-01 23:02:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 98128-6744', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(137, 'Nayara Damasceno de Oliveira', 'darkness99999h@gmail.com', NULL, '$2y$10$fOQStMBAIylmcUGwYsoXDeqmGZQQbAV3n2ENyhCxsSpv4s9t6V4VO', NULL, '2025-07-02 00:48:53', '2025-07-02 00:49:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99737-3522', 0, 0, NULL, 'AFCKZ5L4RY', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(138, 'Davi Ricardo Dutra Pereira Lapa', 'davidutralapa@gmail.com', NULL, '$2y$10$YZnlJY30knPkNOvZyqRkK.lfFoKAPMNnOGgQOiwoA7LKd5QQhBmGq', NULL, '2025-07-02 01:52:09', '2025-07-02 01:52:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(24) 99972-7671', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(139, 'Vilson', 'vilson.silva.45zx@gmail.com', NULL, '$2y$10$U.tH2N650H.kBBhdOgOC4Or1JHrjFnQUvjhxYcC8Dd3b2qKfxg55m', NULL, '2025-07-02 02:32:28', '2025-07-02 02:32:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97489-1182', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(140, 'Anderson Cardoso Da Silva', 'cotocol70@gmail.com', NULL, '$2y$10$T.K4XGEoI/20Izq739gKKOqKjlFUjzGJczM0fun4iG9vLDH0K54A2', NULL, '2025-07-02 02:58:47', '2025-07-02 02:58:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99701-5271', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(141, 'Erik vinicius de camargo', 'erikcamargo21@gmail.com', NULL, '$2y$10$c5A630FcugObH5GXhj68VO5F5690Yq95j1yJESP.wRHEL0JSzBGXK', NULL, '2025-07-02 04:00:20', '2025-07-02 04:00:20', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99623-1931', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(142, 'PEDRO HENRIQUE GONCALVES QUEIROZ', 'pedrocraft1208@gmail.com', NULL, '$2y$10$yZc/isRgdmbLXGoTQ49IT.N.jhHIUyd68Ls1bYRajHCe5FK//GVEC', NULL, '2025-07-02 04:27:31', '2025-07-02 04:27:31', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95488-7734', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(143, 'Jean', 'jeanlucas2012.7050@gmail.com', NULL, '$2y$10$sWJnJ/CVus6mrxLr/VoaKOXDkyNCehHymjujy.F.EQLPvUTIQpO9e', NULL, '2025-07-02 07:01:05', '2025-07-02 07:01:05', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(38) 98821-6484', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(144, 'arthur bernardo', 'arthur_mancha@outlook.com', NULL, '$2y$10$Z79CkPHQFbQ4iYMl7ltDmulewsS.mQPmjWVPnkiyITnnJ/ZmECT9K', NULL, '2025-07-02 09:42:40', '2025-07-02 09:42:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(82) 99336-0103', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(145, 'Luiz eduardo', 'Presidenciadespachar@gmail.com', NULL, '$2y$10$Z769cgeTHXnnCPA3MjtiDenVYib5uxp8W.5ewW6uwO17IIqV2/K3S', NULL, '2025-07-02 13:18:44', '2025-07-02 13:18:44', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(27) 99938-2088', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(146, 'gabriel', 'gmartinho26@gmail.com', NULL, '$2y$10$/oLThbjOX/2U5ZQfvy8f.eBYs.Ys5RCZCdlsfpZOHP/NvY7WuzTTy', NULL, '2025-07-02 13:50:24', '2025-07-02 13:50:24', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97345-5986', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(147, 'Leandro', 'leandroloko2013@hotmail.com', NULL, '$2y$10$C2yzg1/tSEnzmRGAFhPQbuQxl2uQMn5QVbx0BN/lK3.dFydmPNfVG', NULL, '2025-07-02 14:18:25', '2025-07-02 14:18:25', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 98906-9377', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(148, 'alberson gean correa da silva', 'alberson_42@hotmail.com', NULL, '$2y$10$kBGCpXhdtTZ20BU/ps9RRehyuK2mDceutATvmKzuPy72mn3ONh.ra', NULL, '2025-07-02 15:41:45', '2025-07-02 15:41:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(24) 99909-5052', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(149, 'Joao Monteiro', 'fozjoao@gmail.com', NULL, '$2y$10$kS.EY.ccSOFDM/kCBTpKQOlg3eMtebQrZHPqnRb9t2Ax6pYUlExnu', NULL, '2025-07-02 16:20:25', '2025-07-02 16:20:25', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(48) 98808-9382', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(150, 'Patricia', 'pattyumix@gmail.com', NULL, '$2y$10$LjvQRt41AYexxd6/zAJUTOUkbwWv48DPwn8JxVMKnjd1/PwP8b9QC', NULL, '2025-07-02 17:14:20', '2025-07-02 17:14:20', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97211-2483', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(151, 'Arthur tofano de souza', 'karoljose4@gmail.com', NULL, '$2y$10$6DYEd6G2mufgtm9jJpFajOFyvUDD44bEmh6gO1pdF4nxWXmIpXDXa', NULL, '2025-07-02 17:24:23', '2025-07-02 17:24:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(35) 99771-6058', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(152, 'Michael', 'mi************@outlook.com', NULL, '$2y$10$Vj6t9xNeex3mV7QlGCWu2OLVEdhcDW9SSc5DLFwO5ExnZ0Kp5uqBq', NULL, '2025-07-02 18:30:14', '2025-07-02 18:30:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(32) 99801-1378', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(153, 'João Gabriel', 'jg_const@hotmail.com', NULL, '$2y$10$F6GBxUHlD.n/mr3BjGGno.3SMvVYJpLlGkESeONKCHis0/FBogAPC', NULL, '2025-07-02 18:47:57', '2025-07-02 18:47:57', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(27) 99883-2482', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(154, 'Leonardo', 'leonardogirardi2002@gmail.com', NULL, '$2y$10$GiKyPfda3Lk3019gCF7fOu08oWJJTMqz3frWshKzqaOxSv6ZpcDIu', NULL, '2025-07-02 22:46:56', '2025-07-02 22:46:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(45) 99964-1882', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(155, 'Luizgustavodesouza', 'luizgustavosouza063@gmail.com', NULL, '$2y$10$8g49Xn1XMOvuuEVxG7bLeeeKAInxXrZQm/yUs4tErLu7sb2S/xYbi', NULL, '2025-07-02 23:28:30', '2025-07-02 23:28:30', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(75) 99909-4741', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(156, 'Theo', 'theoandradereal@gmail.com', NULL, '$2y$10$F1dFg9aTrNn1vxJcHlZBYeMua7z6EPUNGobRZtSeY/sjfeahajPwC', NULL, '2025-07-03 00:34:44', '2025-07-03 00:34:44', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(73) 98208-7233', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(157, 'Arthur', 'mouraarthur547@gmail.com', NULL, '$2y$10$cMAGF/4H3iRTo69g0sftWOIcJb6sgMNCyOeSdImP1KI1dVhsTxpA2', NULL, '2025-07-03 01:20:49', '2025-07-03 01:20:49', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 99334-1375', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(158, 'Fabrício Junior De Oliveira Marques', 'juniorfabricio140@gmail.com', NULL, '$2y$10$JaCVBFQe4mPUJbKrJjxMXu7ZKkA.EbpZEn5aMxtX6bJVyoqaisQd2', NULL, '2025-07-03 01:35:29', '2025-07-03 01:35:29', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99615-7874', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(159, 'Paty', 'eduardocmc0@gmail.com', NULL, '$2y$10$C254kDOTRMM/paybP8QZQ.bGWfK/zQ9WRr2zStvi4wts4FLcaw/pW', NULL, '2025-07-03 02:13:52', '2025-07-03 02:13:52', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 98419-3210', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(160, 'Johann Strauss', 'Johannstraussgamer@gmail.com', NULL, '$2y$10$TyPNdwza3cJfVust57p.ju19Oy80MMhDINGzbKKEempWu4IY/fc16', NULL, '2025-07-03 02:16:54', '2025-07-03 02:16:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(85) 99729-1050', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`) VALUES
(161, 'Lucas Matias Tavares', 'lucasmatias1995menor@gmail.com', NULL, '$2y$10$ER7BFHGnyAgy.vqhKhXVxe4f0bNrZi6vs3fqM3cDs3XkTImY/yI72', NULL, '2025-07-03 03:17:55', '2025-07-03 03:17:55', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(24) 98146-0134', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(162, 'Cauã Lucas Verissimo Soares', 'verisotmf@gmail.com', NULL, '$2y$10$d0peLHd9IC5ebz3QzysvI.mEjCcboPlkGZVzySFlzclB8cypsY/ZG', NULL, '2025-07-03 04:20:07', '2025-07-03 04:20:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(81) 99198-5792', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(163, 'felipe', 'felipesantanafps@gmail.com', NULL, '$2y$10$r2G9stUW0mQQLvrSbz5GveuFopaOWrvu.0QS8Rp875YxarYcyUGtW', NULL, '2025-07-03 04:34:38', '2025-07-03 04:34:38', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97826-1358', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(164, 'Kilmery Marques Cabral', 'kilmery83@gmail.com', NULL, '$2y$10$6wr00D9T05gJHKGqDNN4h.BaD3.k.u3S4PulD7IIJpfUe56XW.6IG', NULL, '2025-07-03 06:04:04', '2025-07-03 06:04:04', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 99333-5435', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(165, 'Gabriel Morais Oliveira', 'moraisdesignerwork@gmail.com', NULL, '$2y$10$Z1HOtc3tovFxm9vKtFvJyu4vjBc7CoOYOfWywUO4r8.9y/LYwPCQu', NULL, '2025-07-03 06:23:00', '2025-07-03 06:23:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(35) 99726-2736', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(166, 'LUCAS GUILHERME LOVATO', 'lglovato25@gmail.com', NULL, '$2y$10$1l73XSmhGWi/UaAH2Xluw.FO/SPKYiat/Ys7VO5u3st5HWXz87vDK', NULL, '2025-07-03 07:27:41', '2025-07-03 07:27:41', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99859-7566', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(167, 'Hugo Oliveira', 'hugoxlymf1@gmail.co', NULL, '$2y$10$53VLX/eMLvz1r/Poh5j9Xu0XyPuqHHdhbAvOgU9Ba3wSqpXM.sU9a', NULL, '2025-07-03 08:05:07', '2025-07-03 08:05:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97240-3391', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(168, 'otavio siefert', 'otaviosiefert46@gmail.com', NULL, '$2y$10$nTukJBp0waUefnnJkX1LLe5GtFaRNS2QLSOt3n5wAYtMH62z7h1mO', NULL, '2025-07-03 09:55:56', '2025-07-03 09:55:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99743-3735', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(169, 'ALYSSON SADAN GOMES DUARTE', 'alyssongomesduarte1@gmail.com', NULL, '$2y$10$T.O.OPTqkZnncIgsVRj.pOgFAB2Oz3CWCoT.pftlCAMJy4pfwSBXa', NULL, '2025-07-03 11:46:53', '2025-07-03 11:46:53', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(12) 99195-4271', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(170, 'eduardo oliveira sales', 'eduardoolive07@gmail.com', NULL, '$2y$10$UaHlN7AaLEDBIt57qQHxpO6/GgPFFwUICIvly30n4JiI3DI9sOUMy', NULL, '2025-07-03 15:33:00', '2025-07-03 15:33:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(85) 99698-5897', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(171, 'Vinícius Costa Do Nascimento', 'clasher2017jj@gmail.com', NULL, '$2y$10$ex3xyZITHHUxysPrcsI0pOrvqo94jLJki2leEdLIoNbJKSW.L5nPO', NULL, '2025-07-03 20:49:40', '2025-07-03 20:49:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 98546-8514', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(172, 'Alef Anunciação Barreto', 'barretoalef57@gmail.com', NULL, '$2y$10$1xRJwYsz9OylAsot8i/tR.ABRu7Ad33IveL/15MwOK4wf947VSCt6', NULL, '2025-07-03 21:42:49', '2025-07-03 21:47:57', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(71) 99192-2958', 0, 0, NULL, '4PWQJ98QLO', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(173, 'ELIZANDRO DA MOTTA OLIVEIRA', 'ugamerelizandro16@gmail.com', NULL, '$2y$10$JJDzvXXSUVW6cqrIKlC0n.77xelO17JOMGUgHbNC3XI.PM9zNEWt.', NULL, '2025-07-03 21:51:15', '2025-07-03 21:51:15', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 99994-3052', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(174, 'Renato', 'renatinhojunior33@gmail.com', NULL, '$2y$10$UBp33U6StpOKRljcm67IDOLJ.VtW98Xyodtmj/t6TKUhH6DtHjs/m', NULL, '2025-07-03 21:55:19', '2025-07-03 21:55:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 96486-0623', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(175, 'ebraim', 'ebraim.herrera@gmail.com', NULL, '$2y$10$jF.bT.nvNryvlcFKYqalBOdN2A0pPwtBevzpTztCMsxPTKCJCAN5S', NULL, '2025-07-03 22:15:21', '2025-07-03 22:15:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99198-2269', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(176, 'Arthur', 'hadsrjdmz@gmail.com', NULL, '$2y$10$CvjItzD6EPL9UP96QMnJrOls9lp9lDTEzeY3Y5JzdrQxKoeGPJgHu', NULL, '2025-07-03 22:25:31', '2025-07-03 22:25:31', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99924-4416', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(177, 'rafael donowan gama santos', 'rafaeldonowan52@gmail.com', NULL, '$2y$10$GluIxfpNy3N4.IOXeNGjDuLply4mPB1WayN84QPJjnNmY5IjC6Uh.', NULL, '2025-07-03 22:47:02', '2025-07-03 22:47:02', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 99144-8085', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(178, 'Adenilton45', 'adeniltonaraujo99@gmail.com', NULL, '$2y$10$1VhVZKVPn8psmY/nn4BbC.xTHGunYjCANSkVCl80gOyPEdBn2Cq7.', NULL, '2025-07-03 23:33:10', '2025-07-03 23:33:10', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(75) 98134-4637', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(179, 'HENRIQUE SOUZA CAMPRAS', 'rikgdm23@gmail.com', NULL, '$2y$10$gmAXDAh.TQl0pIo3dDlOk.142Y8gsuTZFzHkpCUHNTNdGr/ja9iC.', NULL, '2025-07-04 00:36:54', '2025-07-04 00:36:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 98963-9720', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(180, 'maicon', 'ldepaula410@gmail.com', NULL, '$2y$10$ZNtMoYs.qi1PxPeFWm1UY.zilFpiAy9rMFrX4ulcHhA1.L.2fJXE6', NULL, '2025-07-04 02:11:07', '2025-07-04 02:11:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(67) 98125-3035', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(181, 'Arieloshima', 'arieloshima@gmail.com', NULL, '$2y$10$fX4YyhQkgPsOg.RbSE04POHmPZDp0p8Akh384oDTSiBawURvIPvW.', NULL, '2025-07-04 03:15:39', '2025-07-04 03:15:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 98874-2626', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(182, 'Joao Pedro Faciolla Lisboa', 'joaopedrolisboa21@gmail.com', NULL, '$2y$10$8pNoj694yjLAN5o.fnIQVu0Kh9IvzDYiTkn7vMt15ky8muljP60sK', NULL, '2025-07-04 04:21:14', '2025-07-04 04:21:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 98834-1368', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(183, 'Tainan Thiago Pinto', 'Taithiek@gmail.com', NULL, '$2y$10$86ntfujRd5J4j8FhlHA2kuhU0QTWtjTRwcAscCvydt4HEqUy5VtMq', NULL, '2025-07-04 09:25:17', '2025-07-04 09:25:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(49) 92000-4978', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(184, 'Gabriel', 'gabrielleonardotesta2003@gmail.com', NULL, '$2y$10$lTWz/Lioz9SZA6stqIEaMOL6.0rLxeMJqxxI6v2dRiYUbC7xSUxBu', NULL, '2025-07-04 09:34:36', '2025-07-10 10:34:32', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 91339-4131', 0, 0, 3, 'E4YZP0F5I8', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(185, 'Rodrigo Nunes', 'rodrigonunes-ka@hotmail.com', NULL, '$2y$10$0Hooafag0taGNmOY628PdO1MIOIdJ6qS.zSa9zYbFL8SMlo2CDYsO', NULL, '2025-07-04 10:30:07', '2025-07-04 10:58:51', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(63) 98490-5816', 0, 0, NULL, 'UCH7UTNUS3', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(186, 'ARTHUR SCHIMICOSKI', 'hyl0sh1thegod@gmail.com', NULL, '$2y$10$sj3oJYXbEe8YDBNY4DSHEO988NOVtrFrgTGz7Dei2qCkRSuXL4Yd.', NULL, '2025-07-04 11:28:10', '2025-07-04 11:28:10', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 99633-2391', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(187, 'Cleiton Rodrigues', 'cleitonrodriguesjb@gmail.com', NULL, '$2y$10$pXCtaddExXmf0qou2NzG0u/5XgK6893vxAzHxgFTHm5RDJh1t1CSu', NULL, '2025-07-04 12:43:33', '2025-07-04 12:43:33', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 99402-7007', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(188, 'joao', 'pereirajon72@gmail.com', NULL, '$2y$10$7vd6/fr8AOZ0H.NrxO0sQuS600ztAAHHs8.iOivejah5A.skjeVae', NULL, '2025-07-04 13:35:47', '2025-07-04 13:35:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99163-6001', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(189, 'Diego hernandes mantovani', 'dhernandesm@hotmail.com', NULL, '$2y$10$5VIp3JBJ.Y5NirJrZD5laeVdXhcEDMPKdzmZMQPWqtxhLc0LFYFqi', NULL, '2025-07-04 13:59:51', '2025-07-04 13:59:51', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99742-6421', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(190, 'Bernardo', 'bernardooliveira0023@gmail.com', NULL, '$2y$10$JaV6r9nYXQQ1Ujx.OSP6MeiF2wJ3umf6hwHlN2BfSzM3hNFAFGw3e', NULL, '2025-07-04 17:56:31', '2025-07-04 17:56:31', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 98803-6022', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(191, 'Leonardo', 'leonardoprescendogrochoski@gmail.com', NULL, '$2y$10$v1yCqNIq6gI1yjz6b8Zex.gcTvhzWrdCCbOKhq7fqIMm75UoUh4Pa', NULL, '2025-07-04 18:34:01', '2025-07-04 18:34:01', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99692-9498', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(192, 'YTALO M NASCIMENTO', 'ytalomauricio586@gmail.com', NULL, '$2y$10$vZXqYuA/fY8bZehpZQxQhu0uJBXgCXVV/85NLIHBg1CXVgbuDwUZm', NULL, '2025-07-04 19:44:03', '2025-07-04 19:44:03', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99283-0018', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(193, 'Kerleyh', 'kerley773@gmail.com', NULL, '$2y$10$xjHEIQsRn79ArSF8EyWGmOsSOunBXr73GGxsnB3jODkDwX5aYnfdm', NULL, '2025-07-05 07:08:36', '2025-07-05 08:17:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(67) 99158-8595', 0, 0, 3, '9RLVSAU937', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(194, 'Luis Henrique Domingues', 'lhdomingues@hotmail.com', NULL, '$2y$10$JiNgSYKIzjet2LFMgLwanuAIq0I1aTfS1cJdz1qU5.LQfOQ22xExG', NULL, '2025-07-05 07:30:42', '2025-07-05 07:30:42', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98145-0846', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(195, 'LUIZ EDUARDO LORENZEN JUNIOR', 'deejaydudu01@gmail.com', NULL, '$2y$10$xR1gYeIBWLLWp8qFVpRheeG8a.twL9IVoiWo9oHd5pvB2ExLHZf/O', NULL, '2025-07-05 10:22:47', '2025-07-05 10:22:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99668-2011', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(196, 'fernando henrique beltramin lima', 'fernandobeltramin55@gmail.com', NULL, '$2y$10$IGC72cTYKBbWXgC6NVyBAexPcBC/rqQsIqi/Hodf1FGT5.ES/7aRq', NULL, '2025-07-05 15:08:58', '2025-07-05 15:08:58', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(67) 99937-6928', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(197, 'Yuri', 'thekiller.br.pro@gmail.com', NULL, '$2y$10$r7EKfe9zUn538VlU9oWKyeJb26z9zIwbwu3g7qyoyz9yMKPorUfnq', NULL, '2025-07-05 17:28:08', '2025-07-05 17:28:08', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(37) 99829-5799', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(198, 'Maylon Junior leal', 'maylonleal99@gmail.com', NULL, '$2y$10$tH4aPDDx59hzBAXYNSGiS.nIInsz3Nll0VYNZSXdwnianbttmRYNC', NULL, '2025-07-05 19:42:00', '2025-07-05 19:42:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99908-6006', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(199, 'Adrielle Dias de Jesus', 'Adrielledias028@gmail.com', NULL, '$2y$10$x6gULijeoVKANXO6hkHtWeiOAiQ8Mi.y8VI13FYf1U1i3rmiQqRdm', NULL, '2025-07-05 23:47:07', '2025-07-05 23:49:36', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(77) 99939-7315', 0, 0, NULL, 'OTBYI5LSNG', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(200, 'everton', 'evtnff@gmail.com', NULL, '$2y$10$BFIVHl7WL7SRoXMyooA1oe6lIdbpPH97viVu.n7xFs9j.VPibKNPi', NULL, '2025-07-06 00:04:08', '2025-07-06 00:04:08', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(67) 99331-7421', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(201, 'Rodolfo Andrade Ferreira', 'rodolfo_xskino@hotmail.com', NULL, '$2y$10$Rhqvuq0a7SCQVrHu.xXQ6.Vy4G1arog5QHqtmerssFaOYmtFTfE6q', NULL, '2025-07-06 00:31:00', '2025-07-06 00:31:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(83) 98847-2413', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(202, 'WANDERSON SILVA CHAVES', 'chaveszx7@gmail.com', NULL, '$2y$10$svRZ9HgFeGdM84kgBg4bse1nEC8R66GYigTtTfhddg.A5R/ykXxiO', NULL, '2025-07-06 00:39:36', '2025-07-06 00:39:36', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(13) 95540-5593', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(203, 'Douglas', 'douline2802@gmail.com', NULL, '$2y$10$tWOXohuhZ5sapiU8sHOREOk7PcW8b.2OsQB6GeK9YvQWeD08dOVPu', NULL, '2025-07-06 01:47:17', '2025-07-06 01:47:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95995-8863', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(204, 'Mateus', 'mateus.mawtts11@gmail.com', NULL, '$2y$10$p87LtY8lJRi0d0DeQYKkv.ca3el6aUIFhfwRbjxjEOwIcddhp9y1C', NULL, '2025-07-06 02:15:10', '2025-07-06 02:15:10', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(64) 99230-4413', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(205, 'Gabriel Steilmann', 'gabrielsteilmann@hotmail.com', NULL, '$2y$10$4G.WqSeJdND80VnfBXnNC.FDoEHK6gbMwncqT79jtPpPUsAIyrNPe', NULL, '2025-07-06 03:23:32', '2025-07-06 03:23:32', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(54) 99907-2260', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(206, 'Kayky Inácio', 'xunbinhokayky@gmail.com', NULL, '$2y$10$f0ocpvrdqAChgiOXCPsG/ucSW1c1HCwwunw1lJo3g7ofnpi9zD1t.', NULL, '2025-07-06 08:51:06', '2025-07-06 08:51:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(17) 98843-5208', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(207, 'THALES SAMUEL FERRARI', 'thalesamuel@hotmail.com', NULL, '$2y$10$noHon1QOI76gb6l0xQFPn.ALk9Mkv1IVIpU9oel9sD6me7KpORAu2', NULL, '2025-07-06 16:39:34', '2025-07-06 16:39:34', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(18) 99634-6053', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(208, 'julio cezar menezes dos santos', 'juliocezarmenezesdossantos5@gmail.com', NULL, '$2y$10$CRKrhblJoHgavgUeDellpOB.Gfr9uIKOvNhAZFHxnbcsDH8FvfmCS', NULL, '2025-07-06 19:14:34', '2025-07-06 19:14:34', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 99629-5476', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(209, 'Kauan', 'kauantuler9@gmail.com', NULL, '$2y$10$Zsnx8n10w7DQyACN6AIKv.2WEtEFT1QYvk9YvxKEnUqUxTFua7pDS', NULL, '2025-07-06 19:29:28', '2025-07-06 19:29:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99742-4539', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(210, 'Carlos Felipe Barros feitoza', 'carlosfelipe265@gmail.com', NULL, '$2y$10$AAsu5Irk1D9MD3R9Ip.a9OeqVhndp0BrN1ZxeLXFJRCMrU4NlYDkO', NULL, '2025-07-06 19:35:31', '2025-07-06 19:36:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(87) 98807-7772', 0, 0, NULL, 'ECFRZDABQ5', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(211, 'Anderso', 'Magraaoo@hotmail.com', NULL, '$2y$10$jbqnkkwPZUEmiciZ.fVPO.hPRoe2Ly70im9u3pWMO7y0EDXUvMek6', NULL, '2025-07-09 03:02:51', '2025-07-09 03:02:51', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99020-4534', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(212, 'CAIO DE CASTRO MACIEL', 'caiocastromaciel2310@gmail.com', NULL, '$2y$10$L0m2DJ/mIpmUl7R7i331t.t5ajHzLJXhgVt1NS7WSW5oQtxOpHsJW', NULL, '2025-07-09 21:19:17', '2025-07-09 21:20:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97127-6231', 0, 0, NULL, '4YC3KBVK83', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(213, 'Cássio Hirsch', 'hirschcassio@gmail.com', NULL, '$2y$10$y5oZ6m.iZ.z3b9n8K7QXVepIzLPhGxsPY6mYHI/erC20MaTJoiWFO', NULL, '2025-07-09 23:01:12', '2025-07-09 23:01:12', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 99965-2332', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(214, 'David', 'daviryancv15@icloud.com', NULL, '$2y$10$q6yydT4zR/neio5H5eiIv.cwtvZEjHCRngyD0ImfgY.KNCWfZ.Lw.', NULL, '2025-07-10 01:17:21', '2025-07-10 01:17:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 91505-9901', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(215, 'Renan Gomes', 'Renanalvesgomes.1801@gmail.com', NULL, '$2y$10$CkQdLVc8HQS8X4eCXSPdw.hs2a5vHx0zEg4YyUVY90LruC/lvqqVi', NULL, '2025-07-10 02:10:28', '2025-07-10 02:10:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 91302-7355', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(216, 'Ricardo', 'rs2027268@gmail.com', NULL, '$2y$10$IRseS2JOX8AqCKtrHEOj4O34t/gGHcmu6CXMPjkaN.DQZS/le40ou', NULL, '2025-07-10 03:07:52', '2025-07-10 03:07:52', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 94082-1517', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(217, 'alfredo junior', 'alfredojunior@gmail.com', NULL, '$2y$10$qwgGT/amAb5E/perLMIMnuunZP1r7W8gI/G7cwPvfjDYn2Rt.BDzi', NULL, '2025-07-10 08:46:42', '2025-07-10 08:46:42', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 65464-6554', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(218, 'Marcos Viniciusestevamdasilva', 'marcoscoquinho2@gmail.com', NULL, '$2y$10$W6ItqXj0jjY6wnC9Hi.pGOs6S8TKEJOUrgOXzj6wXSvw/nb.gIiyy', NULL, '2025-07-10 10:01:04', '2025-07-10 10:01:04', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 99939-6469', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(219, 'Jonathan Morlin Pansani de Oliveira', 'jonathanoliveira2024@outlook.com', NULL, '$2y$10$2plYFQHlbV8rELtpaoSOCuMf.J77qnK/YUbCAD6vjaHfPKGa6d2GG', NULL, '2025-07-10 18:19:55', '2025-07-10 21:26:38', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 99770-0550', 0, 0, NULL, 'T9387I38A0', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(220, 'Lucas de Jesus', 'lucas.jmoraes@hotmail.com', NULL, '$2y$10$6Do/rU6Rt79Grl.Y432imuiaEkptPT9iQBbkqMb5OOm/o/KjU34A6', NULL, '2025-07-10 21:04:09', '2025-07-10 21:04:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99902-2266', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(221, 'ANDRE LUCAS SANTOS VAZ', 'andresantosbaz@gmail.com', NULL, '$2y$10$FdEbqLoJ7ye5rifFbPiMqOnpgqzERXeEd5IwI08q3eb1btAA7xUhm', NULL, '2025-07-10 21:44:34', '2025-07-10 21:44:34', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(66) 99215-0377', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(222, 'Arnon', 'xitiibig@gmail.com', NULL, '$2y$10$7tNQTEVVdtpdYrPL2xI9Ruej6EpesoJWx8fk6jZIJyjoSL3cP.Fde', NULL, '2025-07-10 22:30:53', '2025-07-26 03:19:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 99297-4652', 0, 0, NULL, 'JFU2EB7YJ1', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(223, 'Carlos Eduardo', 'kaka.eduardo16@gmail.com', NULL, '$2y$10$o7J7U/56VQbH2HiU/gogV.P28jOD2830B016vrBmO82oPBo7QTDq.', NULL, '2025-07-10 22:44:45', '2025-07-10 22:44:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 99544-2248', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(224, 'teletonx4', 'fv96300@gmail.com', NULL, '$2y$10$.ZAuJ86buwUZnIoG/dFj/.h5VE9JGcTx4Npxqe4XhvoEWXY2zevXO', NULL, '2025-07-10 22:49:37', '2025-07-10 22:49:37', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 98750-2728', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(225, 'Felipe Dutra', 'felipedasilvadutra@hotmail.com', NULL, '$2y$10$Ltpdy0C7tCZ0WKWu2UiSzu48Zk/dAbCWi7YWK4hpR0oznY/Ai66xi', NULL, '2025-07-10 23:00:47', '2025-07-10 23:00:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99697-7902', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(226, 'LUIZ MIGUEL DA SILVA FLORÊNCIO', 'florencioluizmiguel@gmail.com', NULL, '$2y$10$aRCYgZPefrJJIojqmsdFw.nObuKUYQKdYa2blSoV6vue51nlEDOEa', NULL, '2025-07-10 23:17:08', '2025-07-10 23:17:08', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(84) 98639-9483', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(227, 'Alisson dos santos', 'alisson0502santos@gmail.com', NULL, '$2y$10$p7QUUMTuhyQYe0aB3ghpRebQ63sZ9feQY2UYVm.8drkqqAesX/BUO', NULL, '2025-07-11 00:21:10', '2025-07-11 00:21:10', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99643-1980', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(228, 'Miguel Angelo Soares', 'guel.angelo.soares2010@gmail.com', NULL, '$2y$10$hEhyGZv3MONzx3jXlTYUrOz4VnkVJIZrLV.vkV3CoLhD0/h3DIB1K', NULL, '2025-07-11 00:31:48', '2025-07-11 00:31:48', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(12) 99790-0592', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(229, 'Guilherme', 'guilhermehenrique27232@gmail.com', NULL, '$2y$10$pek7Ejy.ySII24jsFdWnbOSrbMc9iQ36V9Ch2BTqKECMyVeIH3BoK', NULL, '2025-07-11 00:49:14', '2025-07-11 00:49:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 97507-0598', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(230, 'Matheus Felipe Carvalho Piao', 'xxlipaoxx@gmail.com', NULL, '$2y$10$Katd97XLjEMILmVrC0FUQeUt0xjh6Br.MmEfX4hy8R6COUSzQNi8W', NULL, '2025-07-11 00:49:35', '2025-07-11 00:49:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(77) 99168-9799', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(231, 'LUCAS VENDRAMI', 'vendr4k@gmail.com', NULL, '$2y$10$3mmYqGZjx/6yqUt89qA71uEt6NGFStH4Bg9HayFqdEdYCA9ZYfF3O', NULL, '2025-07-11 02:14:42', '2025-07-11 02:14:42', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97522-3672', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(232, 'ISAAC MENDES DA SILVA', 'isaacmendes053@gmail.com', NULL, '$2y$10$4WCz51O0CBR//32TtODEYO3hQmd07tdtsyJy9WbntFT2ZAK0JYoWO', NULL, '2025-07-11 02:29:53', '2025-07-11 02:29:53', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(88) 99911-9135', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(233, 'Hector', 'hector.camargo2058@gmail.com', NULL, '$2y$10$BF.QPJyfrJ6yXwzYD20kl.o1t3uvGiBUUZI056S5R/6NcMPYUsG4q', NULL, '2025-07-11 02:46:30', '2025-07-11 02:46:30', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 99765-0443', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(234, 'GUILHERME POZZA FANCELLI', 'guipozzafancelli@gmail.com', NULL, '$2y$10$dB1Cxufaaiyz9/MzmAIbgewvyNAINg/xhAtem6zY.h7xPq7DAnWFi', NULL, '2025-07-11 04:22:55', '2025-07-11 04:22:55', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(67) 99986-0768', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(235, 'Bernardo Goulart', 'bernardogouvaz1575@gmail.com', NULL, '$2y$10$bYa6y9yLk/A9ZaVNEmL5TuM1XnakLPn.qsu2ulrPhovbhoQO3ir86', NULL, '2025-07-11 10:34:13', '2025-07-11 10:34:13', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 47992-9144', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(236, 'lucca poleze', 'luccapoleze@gmail.com', NULL, '$2y$10$s9yZ13ZSavDCDcyVcsqePe.oKLD/OtwAt3PSK/icRpq0ndReUAPW6', NULL, '2025-07-11 11:28:09', '2025-07-11 11:28:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(27) 98847-0759', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(237, 'Pedro Henrique Beraldo Cavalheiro', 'pedropac91@gmail.com', NULL, '$2y$10$U8/LOLpNh7EuqaSTmOOOVeEQ0/wGYo4xbY.DAR/DxKdpP.8cQ0i5i', NULL, '2025-07-11 12:09:18', '2025-07-11 12:09:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99588-4400', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(238, 'JAYARA DA SILVA CARDOSO', 'jayarazimba@hotmail.com', NULL, '$2y$10$o2RoGKVjXkoxP9tmrp7gdOXM/U9kn5PLB.bT1ApQOioAYXxT/Vegu', NULL, '2025-07-11 13:06:20', '2025-07-11 13:18:08', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(48) 99947-1412', 0, 0, NULL, 'JH2U58ZQKQ', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(239, 'joao', 'miranda.blumenau@gmail.com', NULL, '$2y$10$1JBpVogUZi/iUTNbJZ0Nj.lTbnMbJFYCM9v94h.HNGmhKOclIY516', NULL, '2025-07-11 19:26:52', '2025-07-11 19:26:52', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99616-1956', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(240, 'Wallace', 'wallace_yagosousa@hotmail.com', NULL, '$2y$10$idv3CYFUf5yqV2L85L6lq.1hpoT8pmQ/HJOBvC4muLBcHF8vc7Jju', NULL, '2025-07-11 19:29:06', '2025-07-11 19:29:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 98371-6409', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(241, 'Leonardo Kelvin', 'lkelvin86341522@gmail.com', NULL, '$2y$10$WIUETDfbgzbFVaaYxjUjEeXASomv6AYhVVrJOHhgecGhJN3ymSOM.', NULL, '2025-07-11 19:55:25', '2025-07-11 19:55:25', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98140-8333', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(242, 'David Dias Da Silva', 'davidnicolas769@gmail.com', NULL, '$2y$10$ftvWQj2z1A8pZ5318xBUdOXrjJ0g2o3ixz5W9U8yfpfQgZsm03mX2', NULL, '2025-07-11 20:56:42', '2025-07-11 20:56:42', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 98226-7349', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(243, 'WENISSON SANTOS ANDRADE', 'wenissonandrade76@gmail.com', NULL, '$2y$10$xPiuLfLnxz53iv8k7LMkQeoo9BBCuaej2yZYmwvpyZlnjfIQM5fM6', NULL, '2025-07-11 21:21:29', '2025-07-11 21:21:29', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(13) 99624-1455', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(244, 'FREDDY ALEXSANDRO MAMANI CALLE', 'freddyzika@gmail.com', NULL, '$2y$10$2Wv3wG1GMBMda2dGQaoJMuriC1JocifdTVxAuP8fUgA7J0OCYvHFu', NULL, '2025-07-11 22:00:06', '2025-07-11 22:00:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95909-6436', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(245, 'maicon Alievi', 'Maicon.alievi@hotmail.com', NULL, '$2y$10$VwOaxvfWbh1KZLd6httOzOOPC0Zh6E6NLB96bJYrZVOeXC7vuLtAm', NULL, '2025-07-11 23:22:20', '2025-07-11 23:22:20', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(54) 99653-6379', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(246, 'Caio Santa Clara', 'caiozordan.sc@gmail.com', NULL, '$2y$10$dg2g8jGw0AHlH3tLwSAGBOhUe/1ViEzz6YiXkrbhZrCj6ncg/unO2', NULL, '2025-07-11 23:26:51', '2025-07-11 23:26:51', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(27) 98894-6885', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(247, 'Leonardo', 'leojs759@gmail.com', NULL, '$2y$10$g4Y375lLzk3DE8WQVGT4mOWMzGdts4UluT9QG.FPl2K9bHYlk6wpe', NULL, '2025-07-12 00:15:01', '2025-07-12 10:11:27', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 99119-6649', 0, 0, NULL, '4C6AUVA9AW', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(248, 'Matheus', 'mabr292@gmail.com', NULL, '$2y$10$a1tq3PJe980V.SrFNEJnTeEblXwmunblelpgWBuBvyk8OEN/wQcWO', NULL, '2025-07-12 06:17:07', '2025-07-12 06:17:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98985-8413', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(249, 'Julio', 'juliocolli83@gmail.com', NULL, '$2y$10$SOMlnbjKh3DAFzeZCImEA.d.4UCfkM5pbCJxyfvsF0YmgfCLt1djW', NULL, '2025-07-12 06:19:21', '2025-07-12 06:19:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(66) 99979-8806', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(250, 'Jordan Teixeira Arruda Santos', 'jordan2001.ojic@gmail.com', NULL, '$2y$10$5Ki7ZAZlXl.z0cRweySZJ.VLqDcwg47kJrV9HEsf2e4R3cQictbvm', NULL, '2025-07-12 09:02:11', '2025-07-12 09:02:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98920-7953', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(251, 'JORDY GUYBSON', 'jordyguybson2014@gmail.com', NULL, '$2y$10$1IMKaTcCdgRpZaXLA66IGODc4OWEN/tVNA7jXrsKXIiKV/NrCKKHK', NULL, '2025-07-12 12:34:20', '2025-07-12 12:34:20', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 98682-2703', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(252, 'samuel sousa', 'samukaobpc11@gmail.com', NULL, '$2y$10$KE25eQC/NaVfv3PMA3ZPCOwifZAK2ppuZofm5R1wNiPgRT4fVlg..', NULL, '2025-07-12 12:45:43', '2025-07-12 12:45:43', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 98127-2268', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(253, 'Shamuell Lomeu De Souza', 'shamuellsouza22@gmail.com', NULL, '$2y$10$8x5RvtsZEtTAWH7I7I28s.LL9aJOhr.pENcyHadBkNdb0fm0bfG2e', NULL, '2025-07-12 13:07:17', '2025-07-12 13:07:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(24) 99827-2532', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(254, 'Davi Piva Magri', 'pivadavi89@gmail.com', NULL, '$2y$10$VC0Pv2FOvjliKacVoWfGIeuqM/utID5Pgut6sMuzCJgyxFr7ZQDuu', NULL, '2025-07-12 15:59:35', '2025-07-12 15:59:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97285-3016', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(255, 'Felipe', 'felipesoarescruz1994@gmail.com', NULL, '$2y$10$Xgxr22NfOpBNEvS8w3kZAOrb.qgaXWT44beIN04gKZlaGBSOkPZEO', NULL, '2025-07-12 16:22:58', '2025-07-12 16:22:58', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97078-1649', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(256, 'Rafael Correa da silva', 'rafisk100@gmail.com', NULL, '$2y$10$MDAztPHgNLWMe9AxScrFZO5oXRRz3VYz6Vd/UQ/gbGP10T7hWNRWq', NULL, '2025-07-12 19:52:43', '2025-07-12 19:52:43', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99549-1210', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(257, 'luis filipe viana muller', 'luisfilipe_viana@hotmail.com', NULL, '$2y$10$iE9f1.LVCMLE8h4cSGb4.emY1KvgrQl4Pba/67YaSemibfqGRNyQ6', NULL, '2025-07-12 21:06:19', '2025-07-12 21:06:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97035-0488', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(258, 'Kauan augusto costa de Oliveira', 'ca3035452@gmail.com', NULL, '$2y$10$JpbKYoLGZznR1B.EXSnbWOWEK8EOIU/KwFWJ18AYCjG5RmynwEteS', NULL, '2025-07-12 22:23:49', '2025-07-12 22:23:49', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 98719-4351', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(259, 'bartolomeu', 'srsidneyalencar@gmail.com', NULL, '$2y$10$8MJLG8F/K/af6Csmuv0NvuN5QUQRFLRmU7JVM3DsN0cGw3k1VLtQG', NULL, '2025-07-13 02:09:00', '2025-07-13 02:09:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(99) 99183-8059', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(260, 'Gabriel Dos Santos', 'tibiquinha2006@gmail.com', NULL, '$2y$10$5iM5FIOXcCpxC2.mdEKQLey23Fzu9.Q2ODnCTDjDmbea2l9wSxIZe', NULL, '2025-07-13 02:41:45', '2025-07-13 02:41:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(42) 99850-7429', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(261, 'Brunno', 'brunno.victtor65@gmail.com', NULL, '$2y$10$VKUyYhc1uAOlFgrM0k3FcOtnfRUlsPZ8OLwuVOATqe5i8kLe3KpIm', NULL, '2025-07-13 03:11:35', '2025-07-13 03:11:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(92) 99241-4369', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(262, 'Felipe Ribeiro Leite', 'felipe-bboy10@hotmail.com', NULL, '$2y$10$wGBuQaLPvMMOmtZmm9s0Ke43/O4UUqvlw3HiJZ.TvGzIiNTl0PSaa', NULL, '2025-07-13 03:55:11', '2025-07-13 03:55:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97339-1064', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(263, 'Alesson', 'alee.lbarbosa@gmail.com', NULL, '$2y$10$7sRhFcJuv8U9snfTwGokWuyrGicqikgdwpNQUDmuW2O1RQuIZlYz.', NULL, '2025-07-13 11:31:56', '2025-07-13 11:31:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(42) 98836-0702', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(264, 'Paulo Henrique', 'henriquesousa199528@gmail.com', NULL, '$2y$10$.8OeZTEQiQqveE2koe/1ZOKgxFm9/RBZUd5b50lpgFDuLW1MA5/MC', NULL, '2025-07-13 14:35:23', '2025-07-13 14:35:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(85) 98161-2738', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(265, 'PAULO TEIXEIRA', 'parrera9565@hotmail.com', NULL, '$2y$10$fi3Ak2T6hMQo/NZB4uoQrONvC3u3FKTQ1Tvw0K7.vhZV6s4x.PHxK', NULL, '2025-07-13 14:35:58', '2025-07-13 14:35:58', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 96604-7575', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(266, 'RYAN FELIPE DE SOUSA', 'ryanfelipe226@hotmail.com', NULL, '$2y$10$8tHb/fPUoqB6xa0gtqctQ.Q/cnwfq73.MWkJ8EpRHLZPZqaizvvY6', NULL, '2025-07-13 14:39:33', '2025-07-13 14:39:33', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(18) 98818-3688', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(267, 'Ismael Do Carmo Rodrigues', 'ismaeldocarmo577@gmail.com', NULL, '$2y$10$fEJiXiDhhxeIWaM4kzWd5O8/K6fTiZnBjcN9wo0C0FOXPMnSgInLy', NULL, '2025-07-13 18:57:30', '2025-07-13 18:57:30', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 99510-4768', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(268, 'Junior', 'srjun1nff@gmail.com', NULL, '$2y$10$pjJssWD.D/S0VrwIh.XWheQ/hWNh5n9i1CEcRfuiW8LcieK13giyK', NULL, '2025-07-13 20:41:49', '2025-07-13 20:41:49', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 99162-3404', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(269, 'THARLLES GONZAGA DA PAZ', 'taejogos@gmail.com', NULL, '$2y$10$xPphQP.JwGgtoJwvHEexYearPFVwO4q1oq0JgfXPWsXEGQVV2VQlO', NULL, '2025-07-13 21:40:52', '2025-07-13 21:40:52', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99202-2553', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(270, 'Tarciso08', 'tarcisovital2@gmail.com', NULL, '$2y$10$RpKr299z9GHEL5FdqjHyTu6PaNEpKkCH7zWMm6Sv/xpk2g2DoGvQW', NULL, '2025-07-13 23:55:27', '2025-07-13 23:55:27', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 99319-2206', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(271, 'Keytchman', 'keytchman2011@hotmail.com', NULL, '$2y$10$ICPKnXsPI8fdWRtt0xw7GO.FikUxLjd6GSeSvi5OFROmQIFQgSXCK', NULL, '2025-07-14 03:28:51', '2025-07-14 03:28:51', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(37) 99823-7414', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(272, 'Ariel Freitas', 'arielcesar98@hotmail.com', NULL, '$2y$10$3hQJduuJtU8jmA2s453Q6./I7R5rjoNIxvSNXn7S63hiPOYzyi34S', NULL, '2025-07-14 08:14:22', '2025-07-14 08:14:22', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(85) 98684-1789', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(273, 'danilo barreto verdelho', 'danilobarreto40@gmail.com', NULL, '$2y$10$Z6axq4q7zte81.M1Gv4TP.zz/mqr3lxyJw5UjEFgAWYmbqcpBY2ZC', NULL, '2025-07-14 10:10:46', '2025-07-14 10:10:46', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(18) 99749-5801', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(274, 'samuel hoff siqueira', 'samuelhoff11@gmail.com', NULL, '$2y$10$dUzmjKLtxYlT/mcguhaj5eeg9BCEn68kvvknyZEX9AcB1CJxRLqhi', NULL, '2025-07-14 12:11:48', '2025-07-14 12:11:48', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99301-1731', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(275, 'victor  silva', 'victorsiilvaa14@gmail.com', NULL, '$2y$10$x/EiCAPoMMq1Jl4pTuKJH.COSjPDphVnS1EAmgN.w4AzOwTcNhYvC', NULL, '2025-07-14 13:27:54', '2025-07-14 13:27:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99892-2894', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(276, 'hugo tostes campos', 'hugo3280.hc@gmail.com', NULL, '$2y$10$wr9QZCkvrwtQlLznIj9GxuRgQFOA9PxmpiGGOUAME8TYve5TotgRC', NULL, '2025-07-14 15:15:37', '2025-07-14 15:15:37', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(32) 98453-6032', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(277, 'Antonio henrique da silva', 'nortesulmadeiras@outlook.com', NULL, '$2y$10$TzVJm4eAZy7AteM60HXNIOWet/tCVkmuEZoCKKP.A9t.tr0aveEvq', NULL, '2025-07-14 15:47:14', '2025-07-14 15:47:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(66) 99927-4471', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(278, 'MAYCON DARIUX DE LACERDA', 'maycondariux1@gmail.com', NULL, '$2y$10$.PjPglrKiml4k7JVnE75ieH1.xo.jiJESlzkCBDW/mc2wEgR2NwtW', NULL, '2025-07-14 18:15:25', '2025-07-14 18:15:25', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 98263-6611', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(279, 'Brenda', 'Brendaaaraujo022@gmail.com', NULL, '$2y$10$YKloGIDCOydBqgCtY/tDHer.WmXb2SPUWb2w20V2AcAbsxMDhiGfm', NULL, '2025-07-14 20:30:32', '2025-07-14 20:30:32', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(84) 99658-5730', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(280, 'PATRICIA MILENA DE OLIVEIRA', 'weliton051196@gmail.com', NULL, '$2y$10$R.gaB4LYF92cARkN7XsYfeIMYkzD/whORnFMPb/7ZBDg/1cGvhDxy', NULL, '2025-07-14 21:05:32', '2025-07-14 21:05:32', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 99171-7489', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(281, 'sidnei gomes', 'sidnei.gomes20020@gmail.com', NULL, '$2y$10$TF7czZAgLMQtGzsjrByw5uloCTweVZuUCP62N688/qLtAw6GoRc6a', NULL, '2025-07-14 22:24:04', '2025-07-14 22:24:04', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(88) 98192-3774', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(282, 'Fernando Montoya Coutinho', 'fernandofdmc1@gmail.com', NULL, '$2y$10$8gvf0q.Vyca8LAQcxbWNpeU00ei21xC6ODn4ZLeH4Mr5qESdaVQ8G', NULL, '2025-07-14 22:50:40', '2025-07-14 22:50:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 96728-0211', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(283, 'JUAN VIKTOR CANDIDA RIBEIRO', 'juanribeiro242@gmail.com', NULL, '$2y$10$aszqvCQAvAMlN19CXZzHL.J.L4yQD5gNXZTo1PjAqnZ2.R/hetKeO', NULL, '2025-07-15 03:14:36', '2025-07-15 03:14:36', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 98190-6553', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(284, 'Bruno', 'bbgo0911@gmail.com', NULL, '$2y$10$P9JnFINGukKgMXWPCNJJruhF7E6oUswAEi.ebrm1qTFSXmKh13aFK', NULL, '2025-07-15 13:56:31', '2025-07-15 13:56:31', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 99868-0327', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(285, 'Lucas Guy', 'lucasguyg@gmail.com', NULL, '$2y$10$XNepVFdiiQ5G0qvd7d5HyeBTAzlxVEbqOM6HbRnhKpQoL6SfGHDg6', NULL, '2025-07-15 18:32:06', '2025-07-15 18:32:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 96558-9612', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(286, 'Luiz eduardo', 'luizeduardozeusbat@gmail.com', NULL, '$2y$10$bB67GOST/3DpPs5zeik/mOU4lGxk/82gvOPWzBRcvs0D3jcMIW6Gu', NULL, '2025-07-15 18:42:58', '2025-07-15 18:42:58', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 99869-0055', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(287, 'Kauan Kennedy', 'kauanmapoa123@gmail.com', NULL, '$2y$10$FSANrfqQTMXqq6gqg5005.Y81IssYCNP09i.bCJf66y8/wZbfUde2', NULL, '2025-07-15 19:55:43', '2025-07-15 19:55:43', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(35) 99139-2312', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(288, 'Gabriel Conte', 'gabriel_conte@outlook.com', NULL, '$2y$10$mqJdqWDB0Q7bnECv321jUuhKWvgLPQKHWJ1TfoGabafh.i9sl7PXW', NULL, '2025-07-15 23:33:24', '2025-07-15 23:33:24', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(71) 99338-1658', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(289, 'Bobckok', 'bruno.moquiuti2112@gmail.com', NULL, '$2y$10$0r1aA2Jp2NzR2.lHzqLBte8nXzrD/20Zv2rgudJzgUJQea8By7mIS', NULL, '2025-07-15 23:44:09', '2025-07-15 23:44:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 99165-2625', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(290, 'MARCELA APARECIDA ZAGO', 'marcellazaggo24@gmail.com', NULL, '$2y$10$LaTUHvEi7hfhLxee8Yd46efbGaqMPqRUXGsiG1syV8uDL/f.t7UBW', NULL, '2025-07-15 23:57:50', '2025-07-15 23:57:50', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98147-0370', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(291, 'Igor', 'Igormdossantos280@gmail.com', NULL, '$2y$10$advEVOdquyIrTsIsE039IOxxpfNLi1nSdCV7qgm5OZdmwOTFdEFWi', NULL, '2025-07-16 01:22:20', '2025-07-16 01:22:20', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 99387-830', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(292, 'Ana cleia', 'daniel20braga17@gmail.com', NULL, '$2y$10$fG4rUgqoDyDDwvdEzZNeh./YPm/K9RqR9W4XVt69CQojCRy6hYnTi', NULL, '2025-07-16 01:55:38', '2025-07-16 01:55:38', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99852-2741', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(293, 'vinicius rodrigues', 'vzzfe7@gmail.com', NULL, '$2y$10$xIJlczSbSw7Y/EdMaoIAsu5QjJalPnQ.9MBdzpVk4i4U//LjWv1Ne', NULL, '2025-07-16 02:15:11', '2025-07-16 02:15:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(81) 98301-8992', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(294, 'ana beatriz amaral losso de medeiros', 'dksguii@gmail.com', NULL, '$2y$10$pi0Zj2bCMLYkbKaIRCF3..rKC/nPEHj1bcqToUdSl04v8arw7sqBu', NULL, '2025-07-16 10:07:57', '2025-07-16 10:07:57', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 96455-6399', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(295, 'João Pedro De Almeida Viana', 'joaopedrodealmeidaviana2@gmail.com', NULL, '$2y$10$udtO3WorFVnM0q1S42uRf./R2//NaIbGa/pQZ/LQdQijI6N1dnkO6', NULL, '2025-07-16 10:08:20', '2025-07-16 10:08:20', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99551-9271', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(296, 'Neto', 'canalosabsurdos100@gmail.com', NULL, '$2y$10$isnNZFwn4ICDADlMtq9KauPQKswhUxZYl.roEWkDgLEgsMuwnr746', NULL, '2025-07-16 12:05:53', '2025-07-16 12:05:53', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(92) 99326-7284', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(297, 'Pedro José Soares Silva Lucena', 'pjsslucena15@gmail.com', NULL, '$2y$10$6QFc/eCAuQ.ZMId16Ws0WuIJ1jGkeQC5aOEVg6xyjaqnNWgNkaqmm', NULL, '2025-07-16 12:25:50', '2025-07-16 12:25:50', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(83) 99820-0816', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(298, 'Ricardo Antonio', 'hipetos11@gmail.com', NULL, '$2y$10$ETa37nRd4IEVQH5rbAD8qOYsMHKll34k0qzLJdqZbmuc0YsxlJ2um', NULL, '2025-07-16 13:11:36', '2025-07-16 13:11:36', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 99534-7047', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(299, 'Renan Gomes', 'renan_gomes3@hotmail.com', NULL, '$2y$10$VDCh775bCce9YEPaxV5o0OI3DBkDaQtn01UCzfSaqozw35yfTIhTG', NULL, '2025-07-16 15:57:22', '2025-07-16 15:57:22', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99944-8564', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(300, 'geni j r mello junior', 'junyy15@hotmail.com', NULL, '$2y$10$34Q8BOt1NTNXziLNsurDLeKTYNQEVGJUahpEGOr3ECG0Cfu3hY2dK', NULL, '2025-07-16 16:54:35', '2025-07-16 16:54:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(49) 99147-594', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(301, 'Pedro Arantes', 'pedroarantes.contato@hotmail.com', NULL, '$2y$10$PDWOjKSu4wEgWh2ymdwvp.2QThzhYE3KuP7gLof4FgzDCZiRTk3KS', NULL, '2025-07-16 22:03:38', '2025-07-16 22:03:38', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(12) 99643-1084', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(302, 'Adriano88', 'adrianomacedo9758@gmail.com', NULL, '$2y$10$DAIyknvElnFQUtRM8fLFW.3y82tosHfKbzV7m7VGCSp.inFhnMiMy', NULL, '2025-07-16 22:38:45', '2025-07-16 22:38:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(77) 99950-7339', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(303, 'JONATHAN LUCAS ZELINSKI', 'jonassemconta@gmail.com', NULL, '$2y$10$ZJy3tGtxGu6p7eymwMkzT.Tcz7ZgTb8Gzyx1pbeo/1EUk3I6VK40u', NULL, '2025-07-17 01:02:07', '2025-07-17 01:02:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(45) 99994-3150', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(304, 'DIEGO santos', 'diegoomurasantos@outlook.com', NULL, '$2y$10$0LrdrxEOzQ48r15oidIzfOktH8hzD7IO5iSiro9dqJHhBfuFBeAQS', NULL, '2025-07-17 02:12:57', '2025-07-17 02:12:57', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(12) 99102-9584', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(305, 'ARTUR LUIZ DOS SANTOS ALVES', 'arturzex24@gmail.com', NULL, '$2y$10$Id39YuGZl68sctge64i.reejBOYLjdKWwX.9GDvlga6yOcuN5rxjK', NULL, '2025-07-17 02:42:14', '2025-07-17 02:42:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99792-9821', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(306, 'gabriel', 'gabrielcruzbareto039@gmail.com', NULL, '$2y$10$SZqkB/FZWLutEps8J7NYW.MH1YISa9bU3vmZTtawt6pktb5BdIF36', NULL, '2025-07-17 04:09:23', '2025-07-17 04:09:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(79) 98838-8765', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(307, 'matheus Fernandes', 'teteufernandes1121@gmail.com', NULL, '$2y$10$ikLja2KvBlsQRgMtrn1e6ehK7TmV16PYTKZL8zSSyhjMoyv7W4VPi', NULL, '2025-07-17 06:22:39', '2025-07-17 06:22:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(13) 98232-5229', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(308, 'felipe', 'feliperigr@gmail.com', NULL, '$2y$10$oU/fk.1SmMIYWAT2FWyKZeUtdybv79ss.mxcMRvvBf7ydtWWpYfIG', NULL, '2025-07-17 07:44:10', '2025-07-17 07:44:10', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(15) 99123-7419', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(309, 'Rafael Silva Soares', 'rafass951@gmail.com', NULL, '$2y$10$zSe4V0qJhgqtScQegXJac.yj8Ig/4xMRQwDDlAhnNq7JPhX0NAaLO', NULL, '2025-07-17 13:46:15', '2025-07-17 13:46:15', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 99660-5928', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(310, 'Micael M Macedo', 'zecabaco41@gmail.com', NULL, '$2y$10$NmlHpcWTMof/nJd/9kQ.3eohd5OlV2L5A3z8.d6fmUXerRKY.U0f2', NULL, '2025-07-17 13:49:16', '2025-07-17 13:49:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99276-0265', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(311, 'VICTOR HENRIQUE PEREIRA DA SILVA', 'victor.palmeiras011@gmail.com', NULL, '$2y$10$GqfeZvCQgj/muu5YIKgRb.byS5k3wxd3jUe4aGHmJyENSzVsScJnK', NULL, '2025-07-17 14:21:03', '2025-07-17 14:21:03', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 99137-3353', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(312, 'Maicon Ferreira', 'maicon_nilo@hotmail.com', NULL, '$2y$10$puk.8FY4GIteXWk5bUf5M.bxnj2KWYv3J/ZO/Ln9Epil7QxgjEcYm', NULL, '2025-07-17 14:52:14', '2025-07-17 14:52:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 98079-2049', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(313, 'Emerson Aurelino', 'eangaspari@gmail.com', NULL, '$2y$10$1pWzwdsVMML2PzPybV38V.0AwxvUw4/S3LFXZZ5IGKjcblVW37enO', NULL, '2025-07-17 15:01:57', '2025-07-17 15:01:57', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 99207-1733', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(314, 'peterson', 'ps36834@gmail.com', NULL, '$2y$10$MC/xJJucINk3dUKKQI.Rqe1ZJJmRuunVF1s7QW4PJQMf42/L2qEmC', NULL, '2025-07-17 17:58:55', '2025-07-17 18:00:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(35) 99960-6263', 0, 0, NULL, 'ODIEAO0MBB', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(315, 'Ana Marques', 'marquesanna192@gmail.com', NULL, '$2y$10$DusXWsFnKfBNNlVHwjWdPuhISxNas8CM6bsUmeAotrWkPv1F42fsu', NULL, '2025-07-17 20:21:57', '2025-07-17 20:21:57', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(92) 99516-6845', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(316, 'DOUGLAS LIMA DE OLIVEIRA', 'lima25150@gmail.com', NULL, '$2y$10$opMVRbSK7u38KZOCAx8GIOInf5/v/xmrIoqrHqhmLRxfXG33AFWpS', NULL, '2025-07-18 01:48:38', '2025-07-18 01:48:38', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 99363-5349', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(317, 'ELISANGELA APARECIDA TINETI', 'tinetilucas@gmail.com', NULL, '$2y$10$NAySxNCkpLMzP.heUOMWd.YiayjOIhgOkieJ8Fg5FS86Wi5/IACHi', NULL, '2025-07-18 02:08:39', '2025-07-18 02:08:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(18) 99825-4626', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(318, 'Arthur', 'costaarthur112@gmail.com', NULL, '$2y$10$Y18BDho8li73RzwwxD.o2uPjlaRwiBe9.wql4F9kS9inHaeVrL.gi', NULL, '2025-07-18 02:35:12', '2025-07-18 02:35:12', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 99610-5550', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(319, 'Vitor Andrade', 'andradev978@gmail.com', NULL, '$2y$10$lorywfrMRf.yH70afC71TukWinCWiyje6hg4Bne2cFstZ44tHIRLO', NULL, '2025-07-18 02:45:21', '2025-07-18 02:45:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 98384-1708', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`) VALUES
(320, 'Matheus De Souza Macedo', 'theus34533@gmail.com', NULL, '$2y$10$6KRI1dG5gnb/bXZa8fFecuqcjEq351aW.CbkHwVkeTmwEHzl/kp.G', NULL, '2025-07-18 03:10:37', '2025-07-18 03:10:37', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(14) 99178-8737', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(321, 'Cícero Aleson', 'fvitoria255mari@gmail.com', NULL, '$2y$10$xahGRyPw5oQUITkgmPJWNOe9Jf9yAufULg29CBn2b46i72vDN.TmW', NULL, '2025-07-18 04:27:24', '2025-07-18 04:27:24', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(88) 98110-1198', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(322, 'Vinicius', 'vinicius.formoso321@gmail.com', NULL, '$2y$10$.18BJ/mg0Kdd4FMzwK3SI.4/4iwAgJpmD7IdO9P581XwvgPANO1E6', NULL, '2025-07-18 09:26:58', '2025-07-18 09:26:58', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99913-2669', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(323, 'Victor Rodrigues', 'vrpoha@gmail.com', NULL, '$2y$10$nCT5LoxJ3lnJuMPlh.A2Pei4sCiVkQliA4XNHAs1RXwRu0.tR3.mG', NULL, '2025-07-18 12:55:05', '2025-07-18 12:55:05', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(53) 99127-5098', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(324, 'Renison Lucas da Silva Bezerra', 'renisonbezerra1@gmail.com', NULL, '$2y$10$KrdRUEouiQZmipUz2Uq6T.Lx6kLnGnUPp/cRHMIigUmzjkbff5G9K', NULL, '2025-07-18 19:44:46', '2025-07-18 19:44:46', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(87) 99939-8778', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(325, 'LUCAS REZENDE SIQUEIRA', 'flucabecao@gmail.com', NULL, '$2y$10$0Q2zMlKbtgscO7pa7zMHiOuiWbfHBnzi4jQOvoMZwM5WyewAr9WX6', NULL, '2025-07-18 22:04:23', '2025-07-18 22:04:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99747-0787', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(326, 'WESLEY ROTUNDARIO DE AMORIM CONCEICAO', 'wesleyrotundario218@gmail.com', NULL, '$2y$10$kqicRnTyzxrGRYbM6MK/hOnvAw11/TSD3Im/a1T4VjO/imthx/xhC', NULL, '2025-07-19 00:14:41', '2025-07-19 00:14:41', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97269-8739', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(327, 'Mauricio', 'mauriciolobato@hotmail.com', NULL, '$2y$10$cnFwUmnRmx03B3J.eGRUSubvW4MAUs345xa89H/xzTtDY.sw4XjNC', NULL, '2025-07-19 03:19:20', '2025-07-19 03:19:20', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 98892-3498', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(328, 'Leonardo', 'leovgc@hotmail.com', NULL, '$2y$10$mttBC5wA8zrQjGgvFaTa5uM3m5gZHs/dy4TTHIyYGwUxBTZWuilZ2', NULL, '2025-07-19 09:31:39', '2025-07-19 09:31:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 94947-1803', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(329, 'Marcos Vinícius da Silva Pereira', 'marcosvinicius2004silvapereira@gmail.com', NULL, '$2y$10$r9.3x5pHPAvc/c4YN/2L/Ow69zDFUzGEvCfT5CbQ3hcTTSmevLsAm', NULL, '2025-07-19 14:26:08', '2025-07-19 14:26:08', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 98479-0104', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(330, 'rousemany maciel lira da silva', 'rousemanyysillva@gmail.com', NULL, '$2y$10$YuREvjXEUBoV6pPMOH7g/el4FC5nltUx79jHXML3Wt1LWwI7kp02y', NULL, '2025-07-19 14:52:07', '2025-07-19 14:52:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97612-5301', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(331, 'Gabriel Felipe Fortunato Romualdo', 'gabrielffr0@gmail.com', NULL, '$2y$10$FePbpkGoS8kv7sgIsoUyUOCUiZTh7coo1KrAYp7l7MdaBQaEtaw4.', NULL, '2025-07-19 15:06:19', '2025-07-19 15:06:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(27) 99902-5188', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(332, 'Vitor Maciel', 'vitormacielcompras@gmail.com', NULL, '$2y$10$mnEgSssOQFH2jR6iG8CgBewG6ma4mftDKvs6Bh5rz.I5UNmKVXnmC', NULL, '2025-07-19 19:28:01', '2025-07-19 19:28:01', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(35) 99140-9449', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(333, 'Christyan vanzelli da Silva', 'christyan.vanzelli@gmail.com', NULL, '$2y$10$GByKKRs9n5LuxlwIBYy1yewi6UkOZWhR8A2YRAUrCdavzxcf9kIG.', NULL, '2025-07-19 19:28:11', '2025-07-19 19:28:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(14) 99670-5422', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(334, 'Jorge Corral', 'jorginhocorral@gmail.com', NULL, '$2y$10$uym3PVZkcJ5cj6X/NuSAMeebYcTOHpyvSAByqv3ZXJo69N06BhXKC', NULL, '2025-07-19 22:05:34', '2025-07-19 22:05:34', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(15) 96000-0087', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(335, 'Marcos Paulo Santos Carvalho', 'marcospaulosanntosboy@gmail.com', NULL, '$2y$10$TuHRIU4reEOZ9prReDJr2ObZAGgEfkzGMpTLoed.BEGbzoIkQQX6y', NULL, '2025-07-19 22:07:22', '2025-07-19 22:07:22', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(66) 99603-7129', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(336, 'Matheus Henrique Alvarenga', 'matheushenriquenaves@gmail.com', NULL, '$2y$10$CU05V43XWcfxbmi8EzHHUOzu6UZJjPgPOSUc8taK4SNi/Fhkjifzq', NULL, '2025-07-19 22:10:51', '2025-07-19 22:10:51', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(24) 98151-1369', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(337, 'Allan everton assumcao', 'allanassuncao1992@outlook.com', NULL, '$2y$10$P0dWTSnZlvhB/hhF8hqbiuTpPg9dyRJ1HMYwcFmRGCErhZCefOvI6', NULL, '2025-07-19 22:11:16', '2025-07-19 22:11:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(12) 99168-5068', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(338, 'Miguel Angelo Soares', 'miguel.angelo.soares20100@gmail.com', NULL, '$2y$10$0Evw2IcM.nJ7/6odl1KIJOxOuXLvkWnOOamphsAxfQ0oK1jnT2kpW', NULL, '2025-07-19 22:54:25', '2025-07-19 22:54:25', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(12) 99790-0592', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(339, 'Gustavo', 'alexmendoon.za@gmail.com', NULL, '$2y$10$5fJlsKR3Mc46AnmXn4AORu2pPwKGL.qyn/YKSmGkrV.cvgk/FdNHu', NULL, '2025-07-20 01:36:46', '2025-07-20 01:36:46', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(33) 98439-3167', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(340, 'Miguel Lake Ferreyra', 'nhametek@gmail.com', NULL, '$2y$10$HD0dMAJlz0CQeekq3JLfmONv0a0fd2C.GAo.y0nBRx5oEggUkIbF6', NULL, '2025-07-20 02:40:16', '2025-07-20 02:40:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 98879-6217', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(341, 'Alexander Silvan Queres Prado Takamura', 'alexander.23112013@gmail.com', NULL, '$2y$10$Pa7iEObRP7hUuM8D4SpFrevTyi5i7/wNfbhlzZlW2es1ow.xVs/TO', NULL, '2025-07-20 14:51:39', '2025-07-20 14:51:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(12) 99154-0372', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(342, 'Vtcbf@icloud.com', 'vtcbf@icloud.com', NULL, '$2y$10$EQK6uF87i6Ee9NgUiGEyruoNo8SgDHw5eqyCqQYIxq/qqWZcwpR0S', NULL, '2025-07-20 15:21:40', '2025-07-20 15:21:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(29) 92628-101', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(343, 'Felipe Pennacchi Meirelles', 'felipennacchi@gmail.com', NULL, '$2y$10$gsnIQPyMvEvaWZtC9.7eROJs4sjqsVdKZxlBWllyMDEKpuJ03ftke', NULL, '2025-07-20 20:13:16', '2025-07-20 20:13:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 99171-2817', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(344, 'Gustavo Lima Rodrigues de Melo', 'gustavogu3741@gmail.com', NULL, '$2y$10$lBDfuamsCLBQbxAsqqqdl.YnC7jr/jEKZh.etToLQtfrXByAvWpD6', NULL, '2025-07-21 00:11:53', '2025-07-21 00:11:53', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 91691-5985', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(345, 'rafael', 'rafaelrosabatera@gmail.com', NULL, '$2y$10$5O3HPQOhVwVBJcNR3d94Q.FxuDoo3Or5/0DPlAf9XvBRDe8IHOduW', NULL, '2025-07-21 01:24:45', '2025-07-21 01:24:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(24) 99966-4628', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(346, 'Lucas pereira', 'destroyermax120120@gmail.com', NULL, '$2y$10$wwRrKFtcy07.ZUiAWI8OmONTXZBxzf3d5yW2qA0BEPaYYR/rhbbai', NULL, '2025-07-21 01:24:48', '2025-07-21 01:24:48', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 96267-5926', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(347, 'Amezac', 'Amezac.n@gmail.com', NULL, '$2y$10$LrY2OTFC6gfBBhwadUqp8OAt0heJMd3tt1uwPPBQZKQVP81qNWtPS', NULL, '2025-07-21 01:27:07', '2025-07-21 01:27:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 96801-1159', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(348, 'Enzo do Espirito Santo', 'enzo.esanto@gmail.com', NULL, '$2y$10$dDRGbbQqyq.gend/etIAE.toWsChrCWCG5FKxJS4R8vuaY.Eumj7C', NULL, '2025-07-21 15:20:48', '2025-07-21 15:20:48', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 91072-6461', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(349, 'FABRICIO HUGO PEDRINI', 'fabriciopedrini98@gmail.com', NULL, '$2y$10$rRbb5ms4IvHl4GAqG2YOK.uMYTmmERTadkG90MQDFBTy8mniMptk6', NULL, '2025-07-21 15:56:14', '2025-07-21 15:56:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(18) 99679-8960', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(350, 'Mateus Nery', 'mateusneryandrade@gmail.com', NULL, '$2y$10$8sK1YWZKC.OwPb.mhDFRiOgYVjJiS5ZvqA4FtueQ5BoyfpgkIQfGC', NULL, '2025-07-21 18:14:58', '2025-07-21 18:14:58', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(24) 97404-0239', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(351, 'Mathias Machado Bernardo', 'mathiasgrb@hotmail.com', NULL, '$2y$10$Ri5TzPK17lFfl7K4Ce6/2O3PNX0Qar0WBymnDNccROmZzVXGNi3VW', NULL, '2025-07-21 22:07:47', '2025-07-21 22:07:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(48) 99632-1405', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(352, 'Eduardo Sobrinho', 'superonzecanalendou@gmail.com', NULL, '$2y$10$VvTX3IKZbAXVqH81rLgPT.Ypvdl5pOHisQnN33eLsFy.GoR9u8p1i', NULL, '2025-07-22 01:27:18', '2025-07-22 01:27:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(48) 99926-2942', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(353, 'cvrgk', 'kaarla1criistina@gmail.com', NULL, '$2y$10$w1qhhac7HM3iM6xQZFyHTOnMxg6m7VETY4JuZ5IUuf/uLfrfNQ3pG', NULL, '2025-07-22 01:32:13', '2025-07-22 01:32:13', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(95) 99175-5763', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(354, 'Carlos', 'cadu7863@gmail.com', NULL, '$2y$10$EBf8wxbG4KdQp43DWCf41uyX.8G3/1eogoogTGCQgYyK.cLn/rB.C', NULL, '2025-07-22 01:42:00', '2025-07-22 01:42:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(38) 81808-22', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(355, 'Cesar Gustavo Lima', 'cesatgustavo1998@gmail.com', NULL, '$2y$10$Z0QCnEnpb1CquvS9l8LBB.1q822XTKiYsB2jhdySULGkRr6kuxUuq', NULL, '2025-07-22 02:19:27', '2025-07-22 02:19:27', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99568-6280', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(356, 'Guilherme Lugli Pacheco', 'guilugli30@gmail.com', NULL, '$2y$10$p1VvSdpu17YxG41updnJq.26ewDkDeZ7wtFeuIS/RAp7j3XMyqIVu', NULL, '2025-07-22 02:55:21', '2025-07-22 02:55:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(13) 98208-3951', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(357, 'Arthur Vinícius', 'arthursilverio1.2015@gmail.com', NULL, '$2y$10$OI8B23RV6jez8AQBMMzCD.KxLIs470ELnmB3pzO.0irGN2j/rFOwO', NULL, '2025-07-22 09:40:57', '2025-07-22 09:40:57', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(17) 99759-9068', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(358, 'Wellington Fernando', 'Wellintonfernando68@gmail.com', NULL, '$2y$10$25PKnvsmeOq/7iebP7ueZOOVA5AtwVj9qtkvHK954lJ16z4fTUmwe', NULL, '2025-07-22 10:19:43', '2025-07-22 10:19:43', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 98048-8881', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(359, 'MAGNO DE SOUZA NERE', 'magnonere@gmail.com', NULL, '$2y$10$mhMTG9X1N7ocN3NOu0UKRe1GeOXmn1XT/MtNDXF9eMCbGPNzPeHcq', NULL, '2025-07-22 16:30:33', '2025-07-22 16:30:33', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99873-9478', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(360, 'Gabriel', 'gr2505257@gmail.com', NULL, '$2y$10$2LvkWBOukjasJ0Mo1Z7s2Oi/ScWUDJYfopmBIo4qNLzMDQmH6k3Mq', NULL, '2025-07-22 21:37:41', '2025-07-22 21:37:41', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99921-5661', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(361, 'Vitor', 'vitorpovoatorres16@gmail.com', NULL, '$2y$10$GLOCm5fF8KdkfpychuT72u8MZxqCuK/fL4H9cvNmnB6lY9IOwk3se', NULL, '2025-07-22 21:38:56', '2025-07-22 21:38:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 99598-9960', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(362, 'Camila Miyuki', 'camilinha.miyuki1997@gmail.com', NULL, '$2y$10$H1B20NLoZuC4LTy4kN39KO2fLoTw9JKmxr6rS20Vl.S23WjvorLc.', NULL, '2025-07-23 00:43:17', '2025-07-23 00:43:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95160-9221', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(363, 'MARCIA DOS SANTOS MARQUES ZANINELO', 'murilobaitola2@gmail.com', NULL, '$2y$10$njobmV8kolxVbbSVgHeoPOjjW6cF7GiNj5y.R1AzhVNOdXeZLhlMi', NULL, '2025-07-23 02:19:42', '2025-07-23 02:19:42', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(44) 98822-2569', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(364, 'Enzo Candioto', 'enzocandioto3804@gmail.com', NULL, '$2y$10$fHF45aba9Y.bSHjIRNhtMuDgjjkavFvIyindIqeckD8Rsrceyxw8.', NULL, '2025-07-23 02:44:13', '2025-07-23 03:26:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(44) 97400-5607', 0, 0, NULL, 'GCN53B8KEJ', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(365, 'Henrique', 'fulanolegal01@gmail.com', NULL, '$2y$10$wagWFesVxtsCYPjwjwhmie/5RW2m7AhUgFQLsmABFD5O.NPSm6tP6', NULL, '2025-07-23 03:28:39', '2025-07-23 03:28:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(14) 99763-5819', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(366, 'Jose Domingos Druzik', 'josedruzik@gmail.com', NULL, '$2y$10$I4Fv9.gthP.P5QITWQSlBuR4.bgJU4aSrKJzpHU5PRmThvfWGicNu', NULL, '2025-07-23 03:34:16', '2025-07-23 03:34:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99686-2606', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(367, 'pedro mendes', 'pmendesvieira7@gmail.com', NULL, '$2y$10$Ag2pQG26WnvK0yTE5nWBXejpihIys9lm0Dywx4F198x8AuXBrAtw2', NULL, '2025-07-23 11:38:43', '2025-07-23 11:38:43', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 99677-4676', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(368, 'LUIZ FERNANDO VAZ TAVARES', 'luizjhow1@hotmail.com', NULL, '$2y$10$4qQWIczvlAXhl87ixgKNnOJw32tQXh6CMf.zs1F1dlXnKM4hrUCEm', NULL, '2025-07-23 12:13:46', '2025-07-23 12:13:46', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 99536-7798', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(369, 'Cristiano', 'cristianodna@gmail.com', NULL, '$2y$10$VsHE6ZIXH0hr.VbN4P.RwOVpr7p7JKAtGbcpC7OOCuwLgWdbV9OtK', NULL, '2025-07-23 16:13:30', '2025-07-23 16:13:30', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 99587-6688', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(370, 'niu', 'kmzkratos@gmail.com', NULL, '$2y$10$0HTYIxVMoNY./3Z8INXqiOz120lD/0Y9Tm3ZTyCFHRLcGpEDAu3aq', NULL, '2025-07-24 03:01:38', '2025-07-24 03:01:38', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(17) 99610-0640', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(371, 'Ana Claudia Reis Ribeiro', 'claudia.rezei@gmail.com', NULL, '$2y$10$G.Kx/bfnbNyjCBsI3p/SleboEYHbXj8SxM0t.LtKjxdCf/4YucLei', NULL, '2025-07-24 10:58:07', '2025-07-24 11:08:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(92) 99602-4487', 0, 0, NULL, 'RR2Q6XWBH4', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(372, 'Paton ⚡️', 'pedro.paton@hotmail.com', NULL, '$2y$10$QtmBiCCqhTgHPO/ZZ8E4l.JaFEEexo8N7/C49IQ.LfySEH1AEJVJS', NULL, '2025-07-24 17:39:09', '2025-07-24 17:39:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(12) 99796-9489', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(373, 'savio', 'saviobardasson@gmail.com', NULL, '$2y$10$5uz4XhhTvTlyFxuUOBhJ8e3Wo1TAMR9yyT2ThPcg2LGbMka4vMhSq', NULL, '2025-07-24 17:45:53', '2025-07-24 17:45:53', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 98172-8649', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(374, 'pedro', 'pedro.goncalves8464@gmail.com', NULL, '$2y$10$GVblfSFxiD0x3NnyANhoVOAC/D3WR9O.Fe/4CEfiVOIgoMsAXqhFm', NULL, '2025-07-24 22:19:28', '2025-07-24 23:37:38', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 99624-4533', 0, 0, NULL, 'ZXPPEZHU6G', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(375, 'Pollyanna Germana da Silva', 'daniellygermana51@gmail.com', NULL, '$2y$10$GaCFhdzzSHYlgnD4SlPdt.W9m8yG.EvbecGtJ0A06tTvhXyfanQZO', NULL, '2025-07-24 22:22:03', '2025-07-24 22:22:03', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(64) 99975-7407', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(376, 'MIKHAEL SOUZA DE JESUS', 'mikhael02souza@gmail.com', NULL, '$2y$10$41Ub7HILe5wgjMzBbdtJRu1w5si4WKKJVFdXcyFuwZ5NANf/.4vjO', NULL, '2025-07-25 01:42:04', '2025-07-25 01:42:04', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99667-7441', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(377, 'Vinícius Heron de Oliveira', 'heron1960@hotmail.com', NULL, '$2y$10$oo.9blc5dHmxC/wKkHMoK.Uqb4DcejdhC5Ruy/oOHgs65WT/SQjt6', NULL, '2025-07-25 04:57:14', '2025-07-25 04:57:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(67) 98145-7498', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(378, 'Joao Siscato Neto', 'joaosiscato@gmail.com', NULL, '$2y$10$XN1g7ATOXG59zOPI84c35.0WbD7LqwLAt1R3OLdK7jgkLvwavpy4m', NULL, '2025-07-25 08:53:57', '2025-07-25 08:53:57', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(18) 99754-4796', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(379, 'Alan', 'andressaflorianof@gmail.com', NULL, '$2y$10$BMKDbEqqKvCtcjxa20LnYuoas/ILAndoyRSVnTthlaLwCszf3uaM6', NULL, '2025-07-25 17:44:56', '2025-07-25 17:44:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(66) 99721-0721', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(380, 'Dgzinn', 'trakinass71@gmail.com', NULL, '$2y$10$ZlGuDk3hklC2KbXOUEAioOwPkOviSzPE0V1j08ePGj4Ufp0vHyuM.', NULL, '2025-07-25 18:03:00', '2025-07-25 18:03:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(55) 99173-187', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(381, 'GUSTAVO BESERRA DOS SANTOS', 'santosgus2000@hotmail.com', NULL, '$2y$10$G3db.nn53I3VgQ3bbBzbIutqVzr0tW.dLdmSwx0z/pDdC0Jk54DAW', NULL, '2025-07-25 18:22:23', '2025-07-25 18:22:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 98811-0441', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(382, 'Marlon andre Correa de Faria garcia', 'andremarlon011@gmail.com', NULL, '$2y$10$2JNCI3Z9/7XZhd.3epZJ3.ikIG51yJJwU8yCw9m/vCV9HKR9pQQJi', NULL, '2025-07-25 23:42:13', '2025-07-25 23:42:13', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(15) 99832-1934', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(383, 'Guilherme', 'gulhermefinatopellisari@gmail.com', NULL, '$2y$10$SEJSc.urOt4wa7uomjIv9.sOyfbNYXigDWZZDFOu97VhOx4rScYIC', NULL, '2025-07-26 01:56:55', '2025-07-26 01:56:55', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(45) 99129-9948', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(384, 'Vinicius Dos Santos Silva', 'viniciu.s111414@gmail.com', NULL, '$2y$10$6BKdRbEsuuXfNtPlcF18xuX1g7rAq.TA8PCHwtEjeeAU9ixtZzI4S', NULL, '2025-07-26 01:59:58', '2025-07-26 02:31:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 98414-7785', 0, 0, NULL, 'PKNQW7LB8W', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(385, 'Allan Pilatti Gonçalves', 'allanpg0156@gmail.com', NULL, '$2y$10$P5sPnQrVKTnbJsOI1edy2.SnMBd.uTYytnUk/4WKzKgrzwBnzKUSq', NULL, '2025-07-28 13:31:12', '2025-07-28 13:31:12', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(49) 99931-1317', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(386, 'Vitória Alves', 'limahvitoria@gmail.com', NULL, '$2y$10$GN7Fj5MGebPW7BGdfWF1qOsOg4xuPezl4Rzc3H6zVMChDeLcYI/za', NULL, '2025-07-28 14:39:17', '2025-07-28 14:39:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(83) 98163-3793', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(387, 'HERICLIS RIBEIRO DE QUEIROZ', 'hquertt@gmail.com', NULL, '$2y$10$CEBDRe8z4uZmHdX8DG3J/.O.eI4CegWjUgkjmeDKV83FtpSwWd/LS', NULL, '2025-07-28 16:45:05', '2025-07-30 12:45:12', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 98833-6685', 0, 0, NULL, 'RZNK1RCSI5', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(388, 'Lucas', 'lucasfrancagloria@gmail.com', NULL, '$2y$10$1BJouZIk3HIk9f7hKBdrs..Z8Rx8x1K4wIdTG4YHLbdFJ8HtXraMa', NULL, '2025-07-29 19:55:39', '2025-07-29 19:55:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97220-2783', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(389, 'anne', 'annyleelima35@gmail.com', NULL, '$2y$10$NQIeZQ9sxArrOsaoabOK3eNvZcLq2C51l4rxsDgzT/JwFmr1baig6', NULL, '2025-07-29 20:30:02', '2025-07-29 20:30:02', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(15) 98828-7903', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(390, 'GUIHLHERME CARVALHO DA SILVA', 'carvalhojobs1@gmail.com', NULL, '$2y$10$GHQIfj5Wg7e5pu0lpY2cGuPo68qcxf2XF9vzddqID9htmS6vxqf7e', NULL, '2025-07-29 23:06:30', '2025-07-29 23:06:30', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97628-8017', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(391, 'Marcos', 'marcoscostamarquinhos20@gmail.com', NULL, '$2y$10$wj9FxU3EmE0ACdSz2JqHmuQMa6/ZbHHFhSsaKebMomJq2e28BqQrC', NULL, '2025-07-30 01:00:30', '2025-07-30 01:00:30', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 98779-3694', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(392, 'Gabriel rerman funk', 'gabrielrermanfunk@hotmail.com', NULL, '$2y$10$60Mic04f7BPN874aE09CzuE/if6aoNze6zh3Zqp0Q0KBZxK0DsL86', NULL, '2025-07-30 02:31:03', '2025-07-30 02:31:03', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(66) 99230-8889', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(393, 'jk', 'jkanjosj2@gmail.com', NULL, '$2y$10$jeE.ASLASyOYTaKdlCiB6O6oLtpiwBh2c.q33ikXq53.7vNRRneIu', NULL, '2025-07-30 06:25:07', '2025-07-30 06:25:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(96) 14138-69', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(394, 'Rafael Matias', 'rafaelmatias244@gmail.com', NULL, '$2y$10$tvW.s8g./5.8GS3fdafkbOPSGmK5U7PLtBxouqelXfmTWyZPKf/KK', NULL, '2025-07-30 06:25:45', '2025-07-30 06:25:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99317-7239', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(395, 'ARTHUR VINICIUS SILVA PITANGA', 'arthurpitangajere@gmail.com', NULL, '$2y$10$d.plvrCv.22PEWJ4IVIvWOFBajYvp40gUF24qlPyx6PacsffpTdl6', NULL, '2025-07-30 06:34:12', '2025-07-30 06:34:12', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(75) 99949-7478', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(396, 'dominik1121', 'kiss.dominik77@gmail.com', NULL, '$2y$10$NcKh7wDYTqOf2Xc/c5gvVOk9iMRdECCDtoyYfhAgZKFcOVsZ44lbe', NULL, '2025-07-30 11:44:54', '2025-07-30 11:44:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(06) 20454-6163', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(397, 'Ivanildo', 'ivanildoveracruz31@gmil.com', NULL, '$2y$10$lLg3/lcJcJ3NnQ3uzal6Pea68p37feZtqwcdaar8q6dVdizBsydaa', NULL, '2025-07-30 12:47:19', '2025-07-30 12:47:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 98195-0301', 0, 0, 387, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(398, 'santos', 'kaiosantosbati@gmail.com', NULL, '$2y$10$ExOfEZ3EgZnRkHfINGAeuOJdIfC2yt2oFjaxOvSqBDJDbduzmURYu', NULL, '2025-07-30 14:13:35', '2025-07-30 14:13:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 92002-7325', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(399, 'adriana mota', 'mitakayllan@gmail.com', NULL, '$2y$10$z0FKwb4v3H2.n4bxPIMD5uVYu/8HYUU0pwNqEbko1ByRIkQpSEWSm', NULL, '2025-07-30 16:32:31', '2025-07-30 16:32:31', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97373-2690', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(400, 'Michel', 'michel27019600@gmail.com', NULL, '$2y$10$k5JRvmLryvhGeUYWMrtqC.0xdaaZNngE/3LZ3idW2IeLRE52LBi/e', NULL, '2025-07-30 16:42:40', '2025-07-30 16:42:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95413-7588', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(401, 'eduardo', 'eduaraujo0895@gmail.com', NULL, '$2y$10$a.dhyumDC3Kmv0Umi2BwiuYqu0icYKllJ4C3yAm5Or17DEEgkidEm', NULL, '2025-07-30 19:22:42', '2025-07-30 20:26:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 98451-9882', 0, 0, NULL, 'VBJU6CX4IK', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(402, 'Victor Galvão Silva', 'victorgalvao05@gmail.com', NULL, '$2y$10$izaa9UTCY/bybylF9EN3Cun3A7BsTxfCrakXQm2ruAwdja6FpWCzy', NULL, '2025-07-30 22:52:11', '2025-07-30 22:52:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 94787-4592', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(403, 'Alexsander Felipe da Silva Martins', 'smurfdevava00@gmail.com', NULL, '$2y$10$55erD8VL6bG9DVYReDPZFevqkZCrrNJ1Q2/LfOTn13Gx0ZJCPCISK', NULL, '2025-07-31 18:44:10', '2025-07-31 18:44:10', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99443-8392', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(404, 'Alexsander Felipe da Silva Martins', 'octaleexm@gmail.com', NULL, '$2y$10$pYRfQWWH46/nGpPo9M/Y8.RouhGZ6TAoq0GW1r2f8d2kdiBt4sjbK', NULL, '2025-07-31 23:45:10', '2025-07-31 23:45:10', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99443-8392', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(405, 'Igor Nogueira', 'turmafps@gmail.com', NULL, '$2y$10$IXzC2TxAJ4eSOtfrInSiZeQvEKbfWZmT/VZYS7ebb53GHxRHCyrEa', NULL, '2025-08-01 00:38:03', '2025-08-01 00:38:03', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95194-2504', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(406, 'Thainara', 'thainarabastos6@gmail.com', NULL, '$2y$10$Y3i7onr.Zkw9t3TQJmCbKeiO8zw2SXTDiC7JHdPYQpbphRJXIHWXi', NULL, '2025-08-01 00:40:19', '2025-08-01 00:40:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(42) 99819-1611', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(407, 'MAURICIO MOREIRA DOS SANTOS', 'mauriciomoreira603@gmail.com', NULL, '$2y$10$OHuthuWDUdk6iiieDndU0ejDf0KSC0xmtk2jldzWQfnVcSTU1ov9e', NULL, '2025-08-01 01:03:48', '2025-08-01 01:03:48', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97579-9295', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(408, 'THAISA CRISTINA PEREIRA AGUIAR COSTA', 'felipeaguiar043@gmail.com', NULL, '$2y$10$T821GwbboXUgRawWHEjjUe186nJ1njNfQa0roJ/A0UP7wXzXWGg8i', NULL, '2025-08-01 01:25:04', '2025-08-01 01:25:04', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(67) 99838-9310', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(409, 'Pedro', 'ph181899@gmail.com', NULL, '$2y$10$5ueOh.nU6MJa319J9g5ISuhs0pAK18r7FzbqBySB6fNA.Go4SWNyO', NULL, '2025-08-01 01:26:34', '2025-08-01 01:26:34', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(81) 99575-2637', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(410, 'PABLO MELO', 'pablosilvaa557@gmail.com', NULL, '$2y$10$cNlbCPin9KpL9uH1yDRV1eVJXZqIzjsVyoTj.JEDd57UHTL/5YplS', NULL, '2025-08-01 03:02:01', '2025-08-01 03:02:01', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(38) 99116-0255', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(411, 'BIBIANA SILVA CAIRES', 'vkcm174@gmail.com', NULL, '$2y$10$dOZnwDUoi7xMS0VSux52vebisTRd/IRXO2j1ih54jrxLqxdcsEZ.a', NULL, '2025-08-01 03:37:29', '2025-08-01 03:37:29', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 99758-7064', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(412, 'Caruso', 'marcoantoniocaruso32@gmail.com', NULL, '$2y$10$QNwhuwzgDa9S5RIPj5XrVeN7ZwlkgIHwmzmDijK237NL/BCbldFaG', NULL, '2025-08-01 05:28:56', '2025-08-01 05:28:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 99050-0505', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(413, 'Marcos Manoel', 'Marcosmanoelsantos3@gmail.com', NULL, '$2y$10$45caLr66sFOVhXkpXhpcAua.Ao8iYLvncMVqKYq8ji644BP.I6LzG', NULL, '2025-08-01 12:36:34', '2025-08-01 12:38:39', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(79) 98120-5191', 0, 0, NULL, '8CUPYAK0YL', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(414, 'CRISTIANE DOS SANTOS SILVA', 'Marcosmanoelsantos5@gmail.com', NULL, '$2y$10$T1Syl38yB/3is9uievxsmuIHjRTyFfX..dSK..6uyw0VprhCt6/tq', NULL, '2025-08-01 12:45:46', '2025-08-01 12:45:46', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(79) 98130-1530', 0, 0, 413, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(415, 'Matheus', 'sejoc16528@hostbyt.com', NULL, '$2y$10$S6UiMTNRFEEsD.bEZc9kNOpeNy.Cec6JFFrXwrHMwiNhXNN6HlwH6', NULL, '2025-08-01 17:01:59', '2025-08-01 17:01:59', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(65) 98429-3344', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(416, 'Leonardo', 'leoostw003@gmail.com', NULL, '$2y$10$plbbL6IZJHj4Vf44YezQw.A0oDjN5HUcc8V7F.2J6EnTNZ7rOJV6K', NULL, '2025-08-01 19:34:57', '2025-08-01 19:34:57', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99313-1111', 0, 0, 3, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(417, 'WILLIAN ALEF MARTINS PINTO', 'willian_hvs@hotmail.com', NULL, '$2y$10$OV2FK.V.XAmAfNxo6yV8YeqAxBaeJyk52KGx.SvRFCIn85Ml33xGe', NULL, '2025-08-01 19:42:11', '2025-08-01 19:42:11', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 98409-4711', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(418, 'Adrian Santana', 'adrian.santanaandrade@gmail.com', NULL, '$2y$10$r8Pwn2HQEhAOINDLkdmv6eKSPr3I6jmSTiLKAy3UZDkEwIVZD3Ya.', NULL, '2025-08-01 22:39:40', '2025-08-01 22:39:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(79) 99605-5461', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(419, 'davi', 'daviaugustocorrearocha@gmail.com', NULL, '$2y$10$g0aaP88FaWQa1jX476sbG.977Fpcl5cVoYAjKqcylgakPmFWzLYfq', NULL, '2025-08-01 23:07:46', '2025-08-01 23:07:46', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(33) 99837-1214', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(420, 'Higor Souza Garcia', 'kbloko777@gmail.com', NULL, '$2y$10$rNqJxYKNcbGf02aVlqU0g.CtirDTj.llUi3LTJiVFSIg.qyr3wqwS', NULL, '2025-08-01 23:24:09', '2025-08-01 23:24:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(73) 99117-6626', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(421, 'André Marques', 'andre.lmarqs@gmail.com', NULL, '$2y$10$r28SftAgk/5.sp11oFM8B.vNYUOgWOBOtgG3MyEExgiOn1xthPrhi', NULL, '2025-08-02 00:07:18', '2025-08-02 00:07:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(48) 98453-5302', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(422, 'Fabio Fidencio', 'fabio_-_fidencio@hotmail.com', NULL, '$2y$10$2An4YgpWvJ/SNfcVhNczp.iCVmaDMfSgAk7ypmjIPNVGBLE8RpB9.', NULL, '2025-08-02 00:11:21', '2025-08-02 00:11:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(14) 99793-5320', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(423, 'Camisa10', 'joaovlg157@gmail.com', NULL, '$2y$10$uRFKmbAjF/IiT4AhTzUdRezpq2jTltj7uJdEf964czBK3YBucenoy', NULL, '2025-08-02 00:35:07', '2025-08-02 00:35:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 93347-0924', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(424, 'Kauã Pedro De Souza', 'kauas2348@gmail.com', NULL, '$2y$10$GuP6eAqcR0fiUR4OwMX22eksLosHq7gEX.xUBwbcZgEJPEQtzKjFu', NULL, '2025-08-02 01:10:28', '2025-08-02 01:10:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99230-3689', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(425, 'Luis Felipe', 'moraisluis576@gmail.com', NULL, '$2y$10$OxipyI5.K/nLR3m.ik2vMui9gKXfvKlnQJ5nSyMSzNAer/RIU.z72', NULL, '2025-08-02 01:15:27', '2025-08-02 01:15:27', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(94) 92905-617', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(426, 'Marcio Rogério Bueno Gonçalves filho', 'marcinhorogerio282@gmail.com', NULL, '$2y$10$bV5jo3uVE1S9LR5InvAjEOut../spbPODJu34fLq7ay3Il29R54F6', NULL, '2025-08-02 03:05:00', '2025-08-02 03:05:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 98831-0681', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(427, 'Lucas Alves', 'lucasalvesdacosta184@gmail.com', NULL, '$2y$10$FUeO14BJilt./56kgEze3OQskucafqwb5J821RzWS4MP03xMxHEzW', NULL, '2025-08-02 03:05:23', '2025-08-02 03:05:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97052-6639', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(428, 'WALLACE NASCIMENTO ARAGAO', 'wallacezica064@gmail.com', NULL, '$2y$10$sY/jPbT73HRfe/8sBaZ7JO5MjWzNEnD9h8doP9hoFyrO773N/USMW', NULL, '2025-08-02 03:18:41', '2025-08-02 03:18:41', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97569-0806', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(429, 'ALEX VILELA GONZALES DA SILVA', 'allexvilela.av@gmail.com', NULL, '$2y$10$zqb2pT0qePKBbgoil9KtsealJSCAUQbSb4TlbXIVwknQLLDUxHRtu', NULL, '2025-08-04 14:10:31', '2025-08-04 14:10:31', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99885-6299', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(430, 'ERIVELTON RIBEIRO', 'Confirmacao2023@gmail.com', NULL, '$2y$10$yhOzWEL3RgQvfTnkqGzxRO/QFo5k5LDBaOIPcHMO/sRasuBMgTj2C', NULL, '2025-08-04 22:55:29', '2025-08-04 22:55:29', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(88) 92159-2182', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(431, 'jefferson henriquesson', 'jeffersonh9906@gmail.com', NULL, '$2y$10$u7tpKVPE7gSXHrkFW6/Fzu..pKmaeJXnSZeR0C0aOta52vS/.5VwW', NULL, '2025-08-05 00:52:19', '2025-08-05 00:52:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 98283-3525', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(432, 'guilherme de andrade luz lauriano silva', 'guilhermeluz.contato@gmail.com', NULL, '$2y$10$gjLYMUMt7N7JWbdoRyNec.BrBVIHZna5.HXTfOS292B0QnZhdR4Dm', NULL, '2025-08-05 01:29:08', '2025-08-05 01:29:08', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 94949-7684', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(433, 'MATHEUS M CAMPOS', 'dracotheus957@gmail.com', NULL, '$2y$10$3xtkeX9a/X6PUbyb6sSPM.GE..8VY7Gpt68440sGtcigt0JzuNaAO', NULL, '2025-08-05 02:29:36', '2025-08-05 02:29:36', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97759-8903', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(434, 'lucas cantarelle', 'lukinha93@hotmail.com', NULL, '$2y$10$IjDiNoUXPippHPHAVHg4WOLPEytnprz6U81KwIhKHVrF1q2QHYeda', NULL, '2025-08-05 06:33:41', '2025-08-05 06:33:41', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 99764-0538', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(435, 'Juliana', 'Silvajuly65@gmail.com', NULL, '$2y$10$oU9lj9OZJabH6MNV9q0HF.6eJYT0k.GrJ8J8z9nHg7H8HJdOEIvyy', NULL, '2025-08-05 11:09:50', '2025-08-05 11:09:50', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(79) 98175-9352', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(436, 'Weverton', 'wevertonelias14@gmail.com', NULL, '$2y$10$.cCOF0B9bGwKpff3h6eTFuVDGYzcD216JmdhphxYd/48RnpH3U2H.', NULL, '2025-08-05 18:56:55', '2025-08-05 18:56:55', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(38) 99976-6115', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(437, 'Rafael', 'rafaelrangel307@yahoo.com', NULL, '$2y$10$SsRNJTrcGAbWjZdmLMGPrOn72jnnTXTYkdnSVi/ovjflTNk.OIHsa', NULL, '2025-08-05 23:28:06', '2025-08-05 23:28:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(27) 99840-4888', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(438, 'lucas', 'lucasleitecastro3@gmail.com', NULL, '$2y$10$dYMr2buckJNZDpiA4MTI5u2AqJmKtQdjdArNrIZ5/o4HABW7mlNPK', NULL, '2025-08-06 01:50:47', '2025-08-06 01:50:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 91140-5006', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(439, 'Luan de Toledo', 'ltcontato77@gmail.com', NULL, '$2y$10$wyXtsUp6upgXF6cjELGI7.wvaVWpjH1vDC0uZKW1MMHMeZVUpW.Py', NULL, '2025-08-06 02:17:42', '2025-08-06 02:17:42', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 96705-1072', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(440, 'Carla noronha', 'noronhacarla576@gmail.com', NULL, '$2y$10$VUyqhUICeR5c7nd0KFCtx.mCH7E8Jv2kM2XuI3hnOmDVM4vBX.2c.', NULL, '2025-08-06 04:59:14', '2025-08-06 04:59:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(85) 99700-7751', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(441, 'ALEX JUNIO ALVES DOS SANTOS', 'alexjunior1571@hotmail.com', NULL, '$2y$10$U3b0hTMVB/TyxMcR04/X0O/IogNWh.YkFLUV/nBC7p9J6PnholMbu', NULL, '2025-08-06 07:17:49', '2025-08-06 07:17:49', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 99207-0643', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(442, 'JOAO PAULO CANAVESE', 'joao.canavese@gmail.com', NULL, '$2y$10$PdCBqFwRNCkP7T.zKNd1EOAFosjhSUaZ1STgP2tq6AFa9Y/j.gzIC', NULL, '2025-08-06 10:36:24', '2025-08-06 10:36:24', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 98818-1923', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(443, 'Weverton Moises Bispo Gaspar', 'wevertonmoises@gmail.com', NULL, '$2y$10$lc3/Ds./1qE/hfz1YbG9BOKdQeRTajEnmEzh7ootMzXMBloK1yvCW', NULL, '2025-08-06 10:47:07', '2025-08-06 10:47:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99929-0145', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(444, 'MICHAEL RIBEIRO CERQUEIRA', 'jf42606@gmail.com', NULL, '$2y$10$dt0hKdYV/iKI1CJx6J9U5ON.oCP8hNKNySG8dOCbB8iQMx14cAAyi', NULL, '2025-08-06 23:36:36', '2025-08-06 23:36:36', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(75) 98323-0017', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(445, 'LUAN BARROS DA SILVA', 'luanbubbaloo.lbb@gmail.com', NULL, '$2y$10$IJ78IzXyaxmSYYR02ceFl.hrVqzDJycfITEwve5VPE2dv3RWe3uRq', NULL, '2025-08-07 00:14:17', '2025-08-07 00:14:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 98162-9149', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(446, 'Jhone Carlos Tavares santana', 'jhonecarlos154@gmail.com', NULL, '$2y$10$zoAv/mE0QitiR9R1XdY.be2BwXBbb2DueukN.WS1nQELz1FNcf6hy', NULL, '2025-08-07 03:39:24', '2025-08-07 03:39:24', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(41) 99257-2675', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(447, 'João gomes', 'jp.gomes2002@outlook.com', NULL, '$2y$10$ugGkgRtsRiPzy9UgXenLMuGPpJ1Zal3j5mTTFxAizEDla7SOeB3k2', NULL, '2025-08-07 05:21:06', '2025-08-07 05:21:06', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 99454-4545', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(448, 'Rubensbageston', 'rubensbageston@gmail.com', NULL, '$2y$10$gqGFlvZz0uHplJHiIBF4TemjuRLMh5LImT0BoolPnfzuQAOx.Uo.G', NULL, '2025-08-07 11:21:32', '2025-08-07 11:21:32', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(54) 99609-4478', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(449, 'José Ricardo Faleiro', 'josericardofaleironeto81@gmail.com', NULL, '$2y$10$yCqI14qJNyJu4571XoHCPOkGwgP7/XLduAvW96Zxn4HP2Pf7/tSo.', NULL, '2025-08-07 11:47:22', '2025-08-07 11:47:22', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(61) 98102-2452', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(450, 'José Felipe moura da Silva', 'filipemouraa17@gmail.com', NULL, '$2y$10$/NsOGTdINXcv84s9jSVfQ.mB4YHOBbVWztlDYG85kD0q6vePNBH0S', NULL, '2025-08-07 15:29:45', '2025-08-07 15:29:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(85) 99440-3967', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(451, 'Gian Carlos Martins Vechi', 'gian.karlos@hotmail.com', NULL, '$2y$10$S.D8VVK2Bq6uNpTmwRPCveYKkdnARsDXXnoEmVRiHGzQU1pZ7CsnW', NULL, '2025-08-07 15:56:56', '2025-08-07 15:56:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 99260-3330', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(452, 'Lucas Medeiros', 'lu_kynhas_m@hotmail.com', NULL, '$2y$10$aW5P6Do54owPPWkxGvKUB.MhQ9qiNBO9zHByOIzmG2QfP2MD/GW1W', NULL, '2025-08-07 16:48:28', '2025-08-07 16:48:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(48) 99684-4758', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(453, 'Murilo Silva Bragion', 'murilobragion@gmail.com', NULL, '$2y$10$q/fiUQdPusiTbTmcWH4C6OH6bHRNQZpk8Swm5u8se/x4K.7VnTHWu', NULL, '2025-08-07 22:04:12', '2025-08-07 22:04:12', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95689-5017', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(454, 'Rodrigo Becker Ruaro', 'rodrigob.ruaro@hotmail.com', NULL, '$2y$10$X2FpWV0t/eTc2u1LGuf69uweFfogDth7KtjIgDqNen6kGGza/c6MK', NULL, '2025-08-08 00:09:00', '2025-08-08 00:09:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99269-5227', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(455, 'yago', 'mendkncayago40@gmail.com', NULL, '$2y$10$pS/5sf.qUNFse9ltsh0oA.LuUidbIdVNLxSROmecpSwC2.NqQGaia', NULL, '2025-08-08 03:48:07', '2025-08-08 03:48:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(92) 99275-1618', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(456, 'Valdecir', 'valdecirgabriel727@gmail.com', NULL, '$2y$10$BwyxM0ebhn7155wDvsoze.ZyD5osEupyYvjylHnfs3Hw/O6uVsdru', NULL, '2025-08-08 05:02:12', '2025-08-08 05:02:40', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(14) 99177-8711', 0, 0, NULL, '7BOVJFPTKF', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(457, 'LUAN DOS SANTOS NASCIMENTO SANTOS', 'luanvlogs457@gmail.com', NULL, '$2y$10$z6gOpvgnemzVMYjEm4qIze6.R.MPPDbEaV.J..1mkFRB5bIdnDpei', NULL, '2025-08-08 07:31:58', '2025-08-08 07:31:58', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(71) 98840-1345', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(458, 'denisson', 'rafa152d@gmail.com', NULL, '$2y$10$J5aAC6700QgB/o6cJtelnu.dKTDZX80XoMQG8L1sjv7umUUa7rRIy', NULL, '2025-08-08 07:40:59', '2025-08-08 07:40:59', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 98781-7636', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(459, 'TIAGO JOSE FARIA', 'tiagojfaria@gmail.com', NULL, '$2y$10$3vnGYoelYMiuR6ALk.BEd.FEAW.knDDRsaVF4Prb8UJ9UK0XXyep6', NULL, '2025-08-08 10:29:47', '2025-08-08 10:29:47', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 98733-8647', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(460, 'Fernando Teixeira', 'fernandoteixeira8868@gmail.com', NULL, '$2y$10$dwRbBix270aIKJSYBqXMTeoLe5T7wqQYtB91AQfMCSt/p1JTW3uRe', NULL, '2025-08-08 14:55:37', '2025-08-08 14:55:37', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(67) 99831-3277', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(461, 'Gabriel Henrique', 'gabrielhenriqueufc@gmail.com', NULL, '$2y$10$E5Wo7R6iVsZmiYbGlTjFfewsQIuNdDb5ELPNGiwkLP5dBd3yw/STC', NULL, '2025-08-08 22:11:41', '2025-08-08 22:11:41', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(34) 99813-6281', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(462, 'elio', 'leonardo8cds@gmail.com', NULL, '$2y$10$zRDZqKiknn4rMZ2ubOH5Re3Bu/X75BudpOf6tkFml7eKMDp8L5886', NULL, '2025-08-08 22:42:54', '2025-08-08 22:42:54', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(13) 99808-9446', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(463, 'Victor Manoel Bueno de Souza', 'victormanoelcrc12@gmail.com', NULL, '$2y$10$uufjN91BDye3ZJHgTye0teLFBaMUu0BCrFALfj5tQzB2tmwu5Tjdi', NULL, '2025-08-08 22:53:31', '2025-08-08 22:53:31', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(35) 99849-6523', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(464, 'Gustavo Alves', 'gustavoff007gf8@gmail.com', NULL, '$2y$10$TrZGPLtlbpTMmNCH8DfQPu.l2VYDL3qcXnNOWFs8Ez0XzeIRKXnNm', NULL, '2025-08-09 15:44:25', '2025-08-09 15:44:25', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 99634-5132', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(465, 'Eduardo', 'edudramosbanco@gmail.com', NULL, '$2y$10$9UZ7oC.kFTsdPD72hYoA0e4f7kJwsnj/ChZiBAFeGa7KLGflwxkda', NULL, '2025-08-09 20:45:26', '2025-08-09 20:45:26', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95302-3937', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(466, 'Braian', 'eusobraian@outlook.com', NULL, '$2y$10$YftC9.vwcKNTWis2ffAxJeFivh7Ewzrd5Gz0Pp6MGM3LCp2f85XMq', NULL, '2025-08-09 20:51:26', '2025-08-09 20:51:26', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99953-3981', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(467, 'André', 'andreandradeferreira6364@gmail.com', NULL, '$2y$10$okAY.TH.3ojhSJzQDy1oJum3m9t7BZBc9NLouEadu80qP8lChAMsW', NULL, '2025-08-09 22:38:38', '2025-08-09 22:38:38', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99897-0602', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(468, 'Jean Marchiori', 'cheell.marchiori@gmail.com', NULL, '$2y$10$wJAVcy2lN2crHjPWr1vXlenULcF5cGsnH1HNrOAwK2Y.slVJmnsb.', NULL, '2025-08-09 22:59:14', '2025-08-09 22:59:14', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 98141-3896', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(469, 'Geanderson', 'geanderson4646@gmail.com', NULL, '$2y$10$F6BDJcVoF9e8Fj5FXimNaOcaumL0pMeP7aEL8MzDW2yEdgMPwdUl6', NULL, '2025-08-10 02:21:29', '2025-08-10 02:21:29', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99819-5193', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(470, 'Luis Fernando', 'nandin7152@gmail.com', NULL, '$2y$10$IKR8UIsfzHiHSPpN4yaP3uzpKGch63ctKUpVZo6usaCBxfUT/LOMu', NULL, '2025-08-10 03:37:49', '2025-08-10 03:37:49', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 98273-4980', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(471, 'SAMANTHA LIMA DA SILVA', 'limasamantha297@gmail.com', NULL, '$2y$10$NIT2uGVCDxwJXRS0UKN73ObpoOPvVCSz1KmrwPrwkNkIfFbaHzcmW', NULL, '2025-08-10 03:39:58', '2025-08-10 03:39:58', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 98572-0645', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(472, 'Monique Silva de lima', 'mniquelima55@gmail.com', NULL, '$2y$10$vmRh3B0fiiz.KkKTWUDtyuHNet/KnDaJK1qhqVoBHhvLu3xaFLOm2', NULL, '2025-08-10 04:28:15', '2025-08-10 04:28:15', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 96559-043', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(473, 'Jorge', 'jlpessanha234@gmail.com', NULL, '$2y$10$tHUWRCEZYb3xtjmXvCa52uTfpXezvxB7jqu2LQAE5Kw59b97S2Zjy', NULL, '2025-08-10 04:32:08', '2025-08-10 04:32:08', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99229-2201', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(474, 'Gabriel stefferson carmino leite', 'gabrielsterfferson22@hotmail.com', NULL, '$2y$10$xMC5DnI9dOfovQxPW3RnAe6FN4hjXLXu4y8np7Iw4HrBNWozvY356', NULL, '2025-08-10 05:47:17', '2025-08-10 05:47:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(88) 99222-6837', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(475, 'Micael', 'Micaelmoretto15@gmail.com', NULL, '$2y$10$OahwOq1Q095g0.hpQwREcugIvLp1WqE9NK1I4zQsnh2QzP9t0G1oS', NULL, '2025-08-12 17:33:21', '2025-08-12 17:33:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(47) 93385-2787', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(476, 'Wegila', 'wegilamenezes@gmail.com', NULL, '$2y$10$8etDXuAFFWB1b01ircdh6.CgxBLjxK5LVYbFV8bJdv2eJ1R2buPtO', NULL, '2025-08-12 18:07:45', '2025-08-12 18:07:45', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 99852-4641', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(477, 'Angelo marcio freire', 'Freireangelomarcio@gmail.com', NULL, '$2y$10$2GUS5CCfX55.YPR51lZw5u1yTuN/fR52OjAlq.0kbhil1bqtpex2W', NULL, '2025-08-14 00:59:36', '2025-08-14 00:59:36', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(27) 99876-5659', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`) VALUES
(478, 'rodrigo luiz', 'Luizpinho23123@gmail.com', NULL, '$2y$10$bz45u4vBRpNQ6fV.CQilju9MOFLhNu.LU.2vPzW.7xXRkQKpQz7qy', NULL, '2025-09-04 15:59:46', '2025-09-04 15:59:46', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(38) 99144-1258', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(479, 'TIAGO CARLOS', 'tiago08carlos@gmail.com', NULL, '$2y$10$RqqKAPr7WWL2qaqlZUbP2ef1.YGmsukSsr5uaVTXn3cbvmWAdA09a', NULL, '2025-09-04 16:29:20', '2025-09-04 16:29:20', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97763-4678', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(480, 'Luan Pereira', 'lukime68@gmail.com', NULL, '$2y$10$w6mycXeRyMpxb2SeZpbtAe2j2eLCFAx/puFAhLDsaA05sxC0JbPUS', NULL, '2025-09-04 18:05:32', '2025-09-04 18:05:32', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 99226-1934', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(481, 'Luciana Oliveira Barbosa', 'vitorlbarbosa2007@gmail.com', NULL, '$2y$10$IJTTsMz78xzu7tXBQap.C.kFqWTaAxyBJKgU3xC1Pv9rLq12Et27O', NULL, '2025-09-04 18:45:45', '2025-09-04 19:17:41', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 98514-2512', 0, 0, NULL, 'CP8NOGXC0T', 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(482, 'DANIEL AMERICO SANTOS', 'dnlsantos1990@gmail.com', NULL, '$2y$10$YuJZVUhqK1NjjxKlo6kifOa3t3Paze1b7Pu09Sroz942ZXrqi4gOG', NULL, '2025-09-04 23:08:18', '2025-09-04 23:08:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 99481-5467', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(483, 'GUILHERME DE SOUZA LARANJEIRA ROSA', 'guicontasjp@gmail.com', NULL, '$2y$10$e8tXgskMnQCJ9tkJxAeZCeQInzt..LZqt0DMdKWgdTDh/0JX2B4Im', NULL, '2025-09-05 00:23:00', '2025-09-05 00:23:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(16) 99113-3872', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(484, 'Bruno Cardoso', 'bruno_h_cardoso@hotmail.com', NULL, '$2y$10$olqKua.AV3BK5u.DUP.wEuL8liKk/xu4Ennv.ayKjdXOvhwadzOKO', NULL, '2025-09-05 00:28:30', '2025-09-05 00:28:30', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(51) 99884-1414', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(485, 'Vinicius beserra', 'vinigomesbeserra@gmail.com', NULL, '$2y$10$He08QIVOfl4ZGBgtKtkt1uJW4QFJNXH.psu9B0ZQja7orlQGjj0cS', NULL, '2025-09-05 01:06:28', '2025-09-05 01:06:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 94858-7772', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(486, 'GUILHERME RIBEIRO', 'contatoguilhermeribeiroxd@gmail.com', NULL, '$2y$10$W1/TsMXKzMVeOwGQx1mGE.Vlx31tBWYDSizrvN1yP43kotIP9gmeO', NULL, '2025-09-05 02:02:15', '2025-09-05 02:02:15', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 99709-7274', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(487, 'Luis Felipe', 'Felipefreirejbe0@gmail.com', NULL, '$2y$10$fqrY2mNLTLIx8zGYzAnJsuLyJ1jVfFJ9/R1ynkSjhHMAXawh45FR6', NULL, '2025-09-05 12:23:21', '2025-09-05 12:23:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(88) 98179-9728', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(488, 'FELIPE GUERREIRO CASSIANO', 'filipecassiano869@gmail.com', NULL, '$2y$10$JZoSxuRzx8238THWxLGBieeavqDeqpxNHE1cmqp49WYS5R0PWIf6O', NULL, '2025-09-05 13:17:59', '2025-09-05 13:17:59', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 97238-8941', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(489, 'Gabriel de Moura Neris', 'bielmoura78@icloud.com', NULL, '$2y$10$f2ufqYzBO1/obJT1iAs6zuVumUZJAgLTdlmJ08lW7z9mspuElgGma', NULL, '2025-09-05 18:59:29', '2025-09-05 18:59:29', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 99264-5212', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(490, 'RAFAEL DA SILVA CAVALCANTI', 'seupohha@gmail.com', NULL, '$2y$10$7erx1KWoxIlb.N4vMFSdNO2/pNzHCnctn7UjT9pCvu29ToDpF6Ede', NULL, '2025-09-05 19:19:29', '2025-09-05 19:19:29', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(81) 99428-0388', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(491, 'joao marcos', 'joaojm32@gmail.com', NULL, '$2y$10$LhG0Kr2LVSC2N4zmP2racuck8kgis5cCG6IXOtWxltsWxjtsr5C6O', NULL, '2025-09-05 19:45:21', '2025-09-05 19:45:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(22) 98858-6322', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(492, 'Felipe', 'felipemandeli10@gmail.com', NULL, '$2y$10$z50vqR.FcEzUwxgyUNizy..2J7x5Vm0z0kmT71xwytlWEM3ImIwbm', NULL, '2025-09-06 08:56:56', '2025-09-06 08:56:56', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 99949-3778', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(493, 'JEFERSON ALENCAR LEMES SANTOS', 'jefersonalencar59@gmail.com', NULL, '$2y$10$R77raUG/WGhKSJLaSm9U7u5A7Q545RoYkhcMunUKGFm1Z1qSJlthu', NULL, '2025-09-06 11:43:37', '2025-09-06 11:43:37', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 99833-3129', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(494, 'TANDY DE OLIVEIRA BRAZ', 'tandylucasjoao@gmail.com', NULL, '$2y$10$D5mPlS5tOxQK0mzkzh2ER.Xw14aQw2k22jvcZE3NjIb5B9mRaYmzW', NULL, '2025-09-09 17:11:21', '2025-09-09 17:11:21', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(62) 99104-3110', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(495, 'Ana carolina menezes alves', 'carolmalves2010@hotmail.com', NULL, '$2y$10$gadoBydZuwbkZO.zVYsxWe84TxFDD5LGmObWb9HdWuM6sBz0hqp6S', NULL, '2025-09-09 17:45:07', '2025-09-09 17:45:07', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 98864-2793', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(496, 'Nathalia Britto', 'nathaliabrever@gmail.com', NULL, '$2y$10$xVFFS4V5ur7fn6opfU1tJuObBFfBg/5H1AQGNvUgyaHwjQxpSQkS2', NULL, '2025-09-09 18:31:28', '2025-09-09 18:31:28', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 96802-2990', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(497, 'THIAGO NICOLAS VARGAS ALMEIDA', 'thiagonva@gmail.com', NULL, '$2y$10$V3IO4wS3vI.Mqr4kMonak.3oMJO7CBabQDz0lNXllF8GwZLsXudqG', NULL, '2025-09-09 18:39:35', '2025-09-09 18:39:35', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(54) 99632-0454', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(498, 'manuela', 'manuoliveira.pn@gmail.com', NULL, '$2y$10$72acVJRAWX1qwQeU1q2JS.IEv0N2Piwg4hN0QOkvzCLDk0YR3bEdC', NULL, '2025-09-09 19:03:17', '2025-09-09 19:03:17', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(31) 97145-1055', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(499, 'Rodrigo Camboim Morais', 'moraisrodrigo791@gmail.com', NULL, '$2y$10$uO25etzeIS2eF43groqtWeA.maVQJBjuDT0H6IHa8w4BjIpYnik.u', NULL, '2025-09-10 01:28:55', '2025-09-10 01:28:55', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95337-5125', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(500, 'Israel', 'cellosisrael@gmail.com', NULL, '$2y$10$xsRyQpOoSzzCyO9vXfk1redhs6bJsz6M2qXZi1VBvO05AROfDL95O', NULL, '2025-09-10 04:12:18', '2025-09-10 04:12:18', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 91207-1731', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(501, 'GABRIEL DA SILVA FONSECA', 'bieltielsilva@gmail.com', NULL, '$2y$10$Fu2Fg1tTBI1d14rW5fojB.ToLS8a0igEQw4SmCToTllnW9pMbrHVa', NULL, '2025-09-10 07:52:16', '2025-09-10 07:52:16', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 96622-3327', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(502, 'Luiz Otavio Baldan Lopez', 'carrypro223@gmail.com', NULL, '$2y$10$SvUxgNfzSlAE./h4nrdXxepEfc7sFUCuo72E2FRHI2YVGSVJHnQlm', NULL, '2025-09-10 16:05:34', '2025-09-10 16:05:34', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 97015-0021', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(503, 'gabriel oliveira', 'gabrieloli.p2003@gmail.com', NULL, '$2y$10$kERokU3nxIkuhfiOOd6RZO8.qvAaX7wduoo.3xIhICu60IcBbt4.q', NULL, '2025-09-10 16:32:25', '2025-09-10 16:32:25', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(27) 99891-3207', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(504, 'Ana beatriz', 'santosambiia@icloud.com', NULL, '$2y$10$DgBIy4XdHFZ0iD2vS3H60.HnJCLMf5Xr336OPZovVy0RuGacBsEjy', NULL, '2025-09-10 17:44:24', '2025-09-10 17:44:24', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95847-6643', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(505, 'Thiago Moura dos Santos Nascimento', 'thiagomgamer236@gmail.com', NULL, '$2y$10$FznKANdxpah3Gh2XG.NTB.DRqkrH5q82AGvrLk5KvQAAuixxTo7xq', NULL, '2025-09-10 22:30:23', '2025-09-10 22:30:23', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 96740-6699', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(506, 'LUIZ FERNANDO BRITO MATOS', 'fernandoembuart@gmail.com', NULL, '$2y$10$n/qAWfdCUgqK1VQZbxwy7ukbIsxMVqQhWGFf3a.4L.6qaeXU1OSum', NULL, '2025-09-11 02:16:53', '2025-09-11 02:16:53', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95707-5568', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(507, 'Bruno Henrique da Rocha', 'bh87308@gmail.com', NULL, '$2y$10$SwLNvLcPPqG/cBi5jV.u2OEeQXO3HQh8qQyOFM3cVxge0QMW3/C/e', NULL, '2025-09-11 02:31:51', '2025-09-11 02:31:51', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(19) 97132-3116', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(508, 'Rafael', 'rafateixeira805@gmail.com', NULL, '$2y$10$.JRiz/LPWbuCkiuAMvEQKeEBOndDooRLVsO.8bRhPumh7X0BJdZJK', NULL, '2025-09-11 02:55:01', '2025-09-11 02:55:01', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(67) 84083-206', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(509, 'Matheus Javier Ribeiro Xavier', 'matheus_javierxavier@hotmail.com', NULL, '$2y$10$w6ZAZgjw2.imFWjCxwxrgullAutFscplN6e7ba8DVl7upv01C4o1S', NULL, '2025-09-11 03:23:00', '2025-09-11 03:23:00', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(73) 99845-2927', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(510, 'felipe', 'felipe7ronaldo7@gmail.com', NULL, '$2y$10$2p06GvkEPZ6HULr/GzFXW.fSqwDBbvY1F9VadJc2mBQ3UXUZFCIRW', NULL, '2025-09-11 04:02:09', '2025-09-11 04:02:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(21) 98625-6571', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3),
(511, 'Bruno Pinheiro', 'Vendas2@pirow.com.br', NULL, '$2y$10$N.Uk/iHAO7Ggc5ewI1Lc/ebtSZX8IE7n/NX0Ab1m0aQKr/Od9MD7u', NULL, '2025-09-11 18:07:19', '2025-09-11 18:07:19', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(11) 95276-7706', 0, 0, NULL, NULL, 0, 0, 10.00, 30.00, 0, 'active', 'pt_BR', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_vips`
--

CREATE TABLE `user_vips` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Identificador único',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT 'ID do usuário',
  `vip_id` bigint(20) UNSIGNED NOT NULL COMMENT 'ID do VIP alcançado',
  `last_reward_claimed_at` timestamp NULL DEFAULT NULL COMMENT 'Data do último resgate semanal',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Data de criação',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Data de atualização'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela que relaciona usuários aos níveis VIP';

--
-- Despejando dados para a tabela `user_vips`
--

INSERT INTO `user_vips` (`id`, `user_id`, `vip_id`, `last_reward_claimed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-04-12 22:50:49', '2025-04-12 22:50:49', '2025-04-12 22:50:49'),
(2, 7, 1, '2025-04-22 02:21:28', '2025-04-22 02:21:28', '2025-04-22 02:21:28'),
(3, 8, 1, '2025-04-22 02:59:31', '2025-04-22 02:59:31', '2025-04-22 02:59:31'),
(4, 17, 1, '2025-04-23 05:03:40', '2025-04-23 05:03:40', '2025-04-23 05:03:40'),
(5, 26, 1, '2025-06-19 03:33:59', '2025-06-19 03:33:59', '2025-06-19 03:33:59'),
(6, 27, 1, '2025-06-19 04:33:25', '2025-06-19 04:33:25', '2025-06-19 04:33:25'),
(7, 29, 1, '2025-06-24 21:06:07', '2025-06-24 21:06:07', '2025-06-24 21:06:07'),
(8, 39, 1, '2025-06-25 23:14:23', '2025-06-25 23:14:23', '2025-06-25 23:14:23'),
(9, 40, 1, '2025-06-25 23:39:59', '2025-06-25 23:39:59', '2025-06-25 23:39:59'),
(10, 41, 1, '2025-06-26 00:35:29', '2025-06-26 00:35:29', '2025-06-26 00:35:29'),
(11, 54, 1, '2025-06-27 00:56:01', '2025-06-27 00:56:01', '2025-06-27 00:56:01'),
(12, 60, 1, '2025-06-27 07:59:24', '2025-06-27 07:59:24', '2025-06-27 07:59:24'),
(13, 62, 1, '2025-06-27 10:29:26', '2025-06-27 10:29:26', '2025-06-27 10:29:26'),
(14, 71, 1, '2025-06-28 00:50:33', '2025-06-28 00:50:33', '2025-06-28 00:50:33'),
(15, 78, 1, '2025-06-28 10:50:16', '2025-06-28 10:50:16', '2025-06-28 10:50:16'),
(16, 95, 1, '2025-06-29 03:47:29', '2025-06-29 03:47:29', '2025-06-29 03:47:29'),
(17, 96, 1, '2025-06-29 06:19:36', '2025-06-29 06:19:36', '2025-06-29 06:19:36'),
(18, 105, 1, '2025-06-29 13:03:33', '2025-06-29 13:03:33', '2025-06-29 13:03:33'),
(19, 101, 1, '2025-06-29 13:30:52', '2025-06-29 13:30:52', '2025-06-29 13:30:52'),
(20, 116, 1, '2025-06-30 02:04:17', '2025-06-30 02:04:17', '2025-06-30 02:04:17'),
(21, 126, 1, '2025-06-30 17:15:08', '2025-06-30 17:15:08', '2025-06-30 17:15:08'),
(22, 127, 1, '2025-06-30 20:05:49', '2025-06-30 20:05:49', '2025-06-30 20:05:49'),
(23, 137, 1, '2025-07-02 00:50:12', '2025-07-02 00:50:12', '2025-07-02 00:50:12'),
(24, 142, 1, '2025-07-02 05:17:37', '2025-07-02 05:17:37', '2025-07-02 05:17:37'),
(25, 145, 1, '2025-07-02 13:34:21', '2025-07-02 13:34:21', '2025-07-02 13:34:21'),
(26, 153, 1, '2025-07-02 20:45:18', '2025-07-02 20:45:18', '2025-07-02 20:45:18'),
(27, 158, 1, '2025-07-03 01:36:36', '2025-07-03 01:36:36', '2025-07-03 01:36:36'),
(28, 170, 1, '2025-07-03 15:34:07', '2025-07-03 15:34:07', '2025-07-03 15:34:07'),
(29, 180, 1, '2025-07-04 02:16:24', '2025-07-04 02:16:24', '2025-07-04 02:16:24'),
(30, 188, 1, '2025-07-04 13:36:17', '2025-07-04 13:36:17', '2025-07-04 13:36:17'),
(31, 193, 1, '2025-07-05 07:15:30', '2025-07-05 07:15:30', '2025-07-05 07:15:30'),
(32, 210, 1, '2025-07-06 19:39:55', '2025-07-06 19:39:55', '2025-07-06 19:39:55'),
(33, 160, 1, '2025-07-09 09:08:41', '2025-07-09 09:08:41', '2025-07-09 09:08:41'),
(34, 234, 1, '2025-07-11 04:25:51', '2025-07-11 04:25:51', '2025-07-11 04:25:51'),
(35, 222, 1, '2025-07-25 16:20:05', '2025-07-11 07:22:13', '2025-07-25 16:20:05'),
(36, 236, 1, '2025-07-11 12:16:09', '2025-07-11 12:16:09', '2025-07-11 12:16:09'),
(37, 239, 1, '2025-07-11 20:18:13', '2025-07-11 20:18:13', '2025-07-11 20:18:13'),
(38, 247, 1, '2025-07-12 10:12:58', '2025-07-12 10:12:58', '2025-07-12 10:12:58'),
(39, 253, 1, '2025-07-12 13:14:41', '2025-07-12 13:14:41', '2025-07-12 13:14:41'),
(40, 256, 1, '2025-07-12 19:53:13', '2025-07-12 19:53:13', '2025-07-12 19:53:13'),
(41, 257, 1, '2025-07-12 21:51:01', '2025-07-12 21:51:01', '2025-07-12 21:51:01'),
(42, 263, 1, '2025-07-13 11:52:21', '2025-07-13 11:52:21', '2025-07-13 11:52:21'),
(43, 265, 1, '2025-07-13 22:09:06', '2025-07-13 22:09:06', '2025-07-13 22:09:06'),
(44, 271, 1, '2025-07-14 03:29:40', '2025-07-14 03:29:40', '2025-07-14 03:29:40'),
(45, 284, 1, '2025-07-15 13:57:31', '2025-07-15 13:57:31', '2025-07-15 13:57:31'),
(46, 285, 1, '2025-07-15 18:41:51', '2025-07-15 18:41:51', '2025-07-15 18:41:51'),
(47, 286, 1, '2025-07-15 19:05:56', '2025-07-15 19:05:56', '2025-07-15 19:05:56'),
(48, 289, 1, '2025-07-15 23:48:42', '2025-07-15 23:48:42', '2025-07-15 23:48:42'),
(49, 294, 1, '2025-07-16 10:08:23', '2025-07-16 10:08:23', '2025-07-16 10:08:23'),
(50, 295, 1, '2025-07-16 10:10:04', '2025-07-16 10:10:04', '2025-07-16 10:10:04'),
(51, 303, 1, '2025-07-17 01:02:54', '2025-07-17 01:02:54', '2025-07-17 01:02:54'),
(52, 323, 1, '2025-07-18 14:40:19', '2025-07-18 14:40:19', '2025-07-18 14:40:19'),
(53, 351, 1, '2025-07-21 22:13:20', '2025-07-21 22:13:20', '2025-07-21 22:13:20'),
(54, 364, 1, '2025-07-23 03:06:45', '2025-07-23 03:06:45', '2025-07-23 03:06:45'),
(55, 370, 1, '2025-07-24 03:02:25', '2025-07-24 03:02:25', '2025-07-24 03:02:25'),
(56, 366, 1, '2025-07-24 08:00:19', '2025-07-24 08:00:19', '2025-07-24 08:00:19'),
(57, 377, 1, '2025-07-25 04:57:44', '2025-07-25 04:57:44', '2025-07-25 04:57:44'),
(58, 371, 1, '2025-07-25 10:23:52', '2025-07-25 10:23:51', '2025-07-25 10:23:52'),
(59, 392, 1, '2025-07-30 02:32:49', '2025-07-30 02:32:49', '2025-07-30 02:32:49'),
(60, 394, 1, '2025-07-30 06:26:15', '2025-07-30 06:26:15', '2025-07-30 06:26:15'),
(61, 401, 1, '2025-07-30 19:31:11', '2025-07-30 19:31:11', '2025-07-30 19:31:11'),
(62, 395, 1, '2025-08-01 01:23:50', '2025-08-01 01:23:50', '2025-08-01 01:23:50'),
(63, 416, 1, '2025-08-01 19:40:09', '2025-08-01 19:40:09', '2025-08-01 19:40:09'),
(64, 431, 1, '2025-08-19 23:24:15', '2025-08-05 01:08:37', '2025-08-19 23:24:15'),
(65, 442, 1, '2025-08-06 10:52:10', '2025-08-06 10:52:10', '2025-08-06 10:52:10'),
(66, 456, 1, '2025-08-08 05:12:48', '2025-08-08 05:12:48', '2025-08-08 05:12:48'),
(67, 467, 1, '2025-08-09 22:45:07', '2025-08-09 22:45:07', '2025-08-09 22:45:07'),
(68, 479, 1, '2025-09-04 16:30:25', '2025-09-04 16:30:25', '2025-09-04 16:30:25'),
(69, 484, 1, '2025-09-05 00:50:05', '2025-09-05 00:50:05', '2025-09-05 00:50:05'),
(70, 506, 1, '2025-09-11 02:32:59', '2025-09-11 02:32:59', '2025-09-11 02:32:59'),
(71, 507, 1, '2025-09-11 03:31:11', '2025-09-11 03:31:11', '2025-09-11 03:31:11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vips`
--

CREATE TABLE `vips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL COMMENT 'Título do VIP',
  `description` text DEFAULT NULL,
  `required_missions` int(10) UNSIGNED NOT NULL COMMENT 'Quantidade de missões necessárias',
  `weekly_reward` decimal(10,2) NOT NULL COMMENT 'Valor da recompensa semanal',
  `image` varchar(255) DEFAULT NULL COMMENT 'Imagem do VIP',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT 'Data de criação',
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Data de atualização'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela de níveis VIP';

--
-- Despejando dados para a tabela `vips`
--

INSERT INTO `vips` (`id`, `title`, `description`, `required_missions`, `weekly_reward`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Bronze 1', 'Você está no nivel 1, sua jornada inicia aqui. Complete as missões e passe para o próximo nível.', 0, 2.00, 'uploads/vips/01JDWD2JRP6GCYZ8QK4E1ZQ98Q.png', '2024-11-29 17:46:42', '2024-11-29 17:46:42'),
(2, 'Bronze 2', 'Parabéns você está no nível 2. Agora para cumprir as missões você precisará fazer depósitos um pouco mais altos. Além disso, você terá a opção de indicar um amigo para ganhar pontos! Boa sorte jogador(a)!', 2, 3.00, 'uploads/vips/01JDWDBF4D38K5VNTAE0HWGNFN.png', '2024-11-29 17:51:33', '2024-11-29 17:51:33'),
(3, 'Bronze 3', 'Você chegou a nível 3! Agora, as missões pedem por depósitos maiores, mas ó, vem coisa boa por aí. E ó, chama aquele amigo pro game e ganha pontos extras. Bora lá, campeão!', 4, 4.00, 'uploads/vips/01JDWDC58VHXQSCY362XY2A2DB.png', '2024-11-29 17:51:56', '2024-11-29 17:51:56'),
(4, 'Prata 1', 'Parabéns por alcançar o Nível 6! Agora, as missões estão mais complexas e desafiadoras. Prepare-se para testar suas habilidades ao máximo. E lembre-se: trazer um amigo para jogar pode render pontos bônus para ambos!', 7, 5.00, 'uploads/vips/01JDWDEFT8TA5DKX190CBYJ5ZX.png', '2024-11-29 17:53:12', '2024-11-29 17:53:12'),
(5, 'Prata 2', 'As tarefas aqui exigem precisão e estratégia. Mostre que você tem o que é preciso para dominar este estágio. Convide um amigo para se juntar e compartilhe a jornada para ganhar ainda mais pontos!', 9, 6.00, 'uploads/vips/01JDWDH1NC2SMSXJES2XERC5G3.png', '2024-11-29 17:54:36', '2024-11-29 17:54:36'),
(6, 'Prata 3', 'Bem-vindo, você onde apenas os verdadeiros mestres prevalecem! As missões são intensas, mas as recompensas são ainda maiores. Não se esqueça de que jogar com amigos aumenta suas chances de sucesso e pontos!', 12, 7.00, 'uploads/vips/01JDWDK9K7Q9EZMBC2M0CWY2C3.png', '2024-11-29 17:55:50', '2024-11-29 17:55:50'),
(7, 'Ouro 1', 'Você é agora uma Lenda!, prepare-se para missões lendárias que poucos conseguem completar. Chame seus amigos mais confiáveis e juntos, façam história nos jogos da Donald.', 15, 10.00, 'uploads/vips/01JDWDNR01Q6KRCGZ4WAP1FEHF.png', '2024-11-29 17:57:10', '2024-11-29 17:57:10'),
(8, 'Ouro 2', 'Bem-vindo, onde só os Titãs caminham. Sua jornada até aqui foi impressionante. Agora, cada missão é uma batalha épica que exige força e inteligência. Traga amigos e elevem uns aos outros à grandeza.', 18, 13.00, 'uploads/vips/01JDWDQJ33PTYEM7VC8FBX52YS.png', '2024-11-29 17:58:09', '2024-11-29 17:58:09'),
(9, 'Ouro 3', 'Você chegou ao Nível, o domínio dos Conquistadores. Aqui, cada desafio é uma chance de provar seu valor. Convide um amigo para essa jornada épica e juntos, conquistem vitórias memoráveis!', 23, 15.00, 'uploads/vips/01JDWDRXA8DMHQFC23M6RTWN53.png', '2024-11-29 17:58:54', '2024-11-29 17:58:54'),
(10, 'Platina 1', 'Bem-vindo ao Platina 1! Você chegou até aqui e sem dúvidas merece recompensas incríveis. É por isso que durante a sua jornada nesse novo nível, você vai encontrar missões mais emocionantes e prêmios igualmente incríveis. Agora é com você, te esperamos no Platina 2!', 30, 20.00, 'uploads/vips/01JDWDTNAJR3G2BWQFNFC9H2P2.png', '2024-11-29 17:59:51', '2024-11-29 17:59:51'),
(11, 'Platina 2', 'Bem-vindo ao Platina 2! Você realmente é um jogador nato. E como forma de reconhecimento do seu esforço até aqui, garantimos mais missões e prêmios de alto nível. Mostre seu empenho, conquiste novas recompensas e prepare-se para o Platina 3!', 40, 30.00, 'uploads/vips/01JDWDW1B4BZHZGFG8K7ZYSAG0.png', '2024-11-29 18:00:36', '2024-11-29 18:00:36'),
(12, 'Platina 3', 'Bem-vindo ao Platina 3! Você é nosso orgulho! Aqui, os desafios são mais intensos e as recompensas ainda maiores. Continue se esforçando e desafie suas habilidades – você está no caminho!', 58, 40.00, 'uploads/vips/01JDWDXGJKSVK1706NCGB7C6CJ.png', '2024-11-29 18:01:24', '2024-11-29 18:01:24'),
(13, 'Diamante 1', 'Bem-vindo ao Diamante 1! Estamos muito impressionados com o seu potencial. Neste nível, você começa a enfrentar desafios de nível superior e ganhar recompensas ainda mais valiosas. Prepare-se para um nível de jogo mais emocionante e mostre que está pronto para o Diamante 2!', 70, 50.00, 'uploads/vips/01JDWDYMNPXP2ECQK33VBBEPX4.png', '2024-11-29 18:02:01', '2024-11-29 18:02:01'),
(14, 'Diamante 2', 'Bem-vindo ao Diamante 2! Você está se destacando cada vez mais, os desafios ficam ainda mais intensos e as recompensas mais impressionantes. Continue se empenhando, complete as tarefas e prepare-se para alcançar o Diamante 3!', 85, 65.00, 'uploads/vips/01JDWE40KYF3H8S541EGBEWCKS.png', '2024-11-29 18:04:57', '2024-11-29 18:04:57'),
(15, 'Diamante 3', 'Bem-vindo ao Diamante 3! Esse é só para os que não tem medo da grandeza. Com desafios de alta dificuldade e recompensas de prestígio, você está se consolidando como um verdadeiro mestre. Mostre sua maestria e conquiste novos feitos – você está quase no topo!', 100, 70.00, 'uploads/vips/01JDWE5QFA2RC7P40CZ36WFV2S.png', '2024-11-29 18:05:54', '2024-11-29 18:05:54'),
(16, 'Black I', 'Bem-vindo ao Black 1! Você está entrando na elite com os desafios mais exclusivos e recompensas extraordinárias. Neste nível, cada conquista é um marco e cada desafio, uma prova de sua habilidade. Mostre seu valor e prepare-se para o próximo nível de prestígio!', 150, 100.00, 'uploads/vips/01JDWE745DRM8MRBPSR7GXMHYZ.png', '2024-11-29 18:06:39', '2024-11-29 18:06:39'),
(17, 'Black II', 'No Black 2, você está solidificando sua posição na elite. Os desafios são mais complexos e as recompensas, ainda mais impressionantes. Continue sua jornada com determinação e prove que você é um verdadeiro mestre entre os melhores.', 200, 150.00, 'uploads/vips/01JDWE7YVH9WTR5Z7SB3AH0XYJ.png', '2024-11-29 18:07:07', '2024-11-29 18:07:07'),
(18, 'Black III', 'Chegou o Black 3, onde você enfrenta os desafios mais exigentes e mostra um domínio impressionante. Este é um nível de alta performance, onde cada tarefa completada e cada meta alcançada refletem sua excelência e dedicação.', 500, 400.00, 'uploads/vips/01JDWE98F2CGMJEH35QKTRJN9A.png', '2024-11-29 18:07:49', '2024-11-29 18:07:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `currency` varchar(20) NOT NULL,
  `symbol` varchar(5) NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_bonus_rollover` decimal(10,2) DEFAULT 0.00,
  `balance_deposit_rollover` decimal(10,2) DEFAULT 0.00,
  `balance_withdrawal` decimal(10,2) DEFAULT 0.00,
  `balance_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `balance_cryptocurrency` decimal(20,8) NOT NULL DEFAULT 0.00000000,
  `balance_demo` decimal(20,8) DEFAULT 1000.00000000,
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT 0.00,
  `hide_balance` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_bet` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_won` bigint(20) NOT NULL DEFAULT 0,
  `total_lose` bigint(20) NOT NULL DEFAULT 0,
  `last_won` bigint(20) NOT NULL DEFAULT 0,
  `last_lose` bigint(20) NOT NULL DEFAULT 0,
  `vip_level` bigint(20) DEFAULT 0,
  `vip_points` bigint(20) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `currency`, `symbol`, `balance`, `balance_bonus_rollover`, `balance_deposit_rollover`, `balance_withdrawal`, `balance_bonus`, `balance_cryptocurrency`, `balance_demo`, `refer_rewards`, `hide_balance`, `active`, `created_at`, `updated_at`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `vip_level`, `vip_points`) VALUES
(1, 1, 'BRL', 'R$', 0.00, 0.00, 0.00, 203.25, 0.15, 0.00000000, 1000.00000000, 0.00, 0, 1, '2024-04-20 19:00:12', '2025-04-14 22:31:44', 0.00, 0, 0, 0, 0, 0, 0),
(3, 3, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 30.00, 0, 1, '2025-04-21 02:44:59', '2025-08-01 19:36:27', 0.00, 0, 0, 0, 0, 0, 0),
(4, 4, 'BRL', 'R$', 23.20, 0.00, 0.00, 0.00, 0.30, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-21 14:38:55', '2025-04-21 21:10:56', 0.00, 0, 0, 0, 0, 0, 0),
(5, 5, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.22, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-21 17:07:43', '2025-04-21 17:20:47', 0.00, 0, 0, 0, 0, 0, 0),
(6, 6, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-21 19:34:01', '2025-04-21 19:34:01', 0.00, 0, 0, 0, 0, 0, 0),
(7, 7, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-22 02:19:48', '2025-04-22 02:21:28', 0.00, 0, 0, 0, 0, 0, 0),
(8, 8, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 3.50, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-22 02:23:08', '2025-04-22 02:59:31', 0.00, 0, 0, 0, 0, 0, 0),
(9, 9, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-22 04:31:50', '2025-04-22 04:31:50', 0.00, 0, 0, 0, 0, 0, 0),
(10, 10, 'BRL', 'R$', 60.00, 6.00, 0.00, 0.00, 3.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-22 09:58:46', '2025-04-22 10:02:34', 0.00, 0, 0, 0, 0, 0, 0),
(11, 11, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-22 10:34:37', '2025-04-22 10:34:37', 0.00, 0, 0, 0, 0, 0, 0),
(12, 12, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-22 12:30:44', '2025-04-22 12:30:44', 0.00, 0, 0, 0, 0, 0, 0),
(13, 13, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-22 14:19:59', '2025-04-22 14:19:59', 0.00, 0, 0, 0, 0, 0, 0),
(14, 14, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-22 18:44:50', '2025-04-22 18:44:50', 0.00, 0, 0, 0, 0, 0, 0),
(15, 15, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-22 19:14:11', '2025-04-22 19:14:11', 0.00, 0, 0, 0, 0, 0, 0),
(16, 16, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-23 02:17:59', '2025-04-23 02:17:59', 0.00, 0, 0, 0, 0, 0, 0),
(17, 17, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-23 05:03:03', '2025-04-23 05:03:40', 0.00, 0, 0, 0, 0, 0, 0),
(18, 18, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-23 09:19:41', '2025-04-23 09:19:41', 0.00, 0, 0, 0, 0, 0, 0),
(19, 19, 'BRL', 'R$', 100.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-23 13:54:04', '2025-04-23 13:54:31', 0.00, 0, 0, 0, 0, 0, 0),
(20, 20, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-04-23 14:11:38', '2025-04-23 14:11:38', 0.00, 0, 0, 0, 0, 0, 0),
(21, 21, 'BRL', 'R$', 1.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-18 13:24:16', '2025-06-18 13:34:50', 0.00, 0, 0, 0, 0, 0, 0),
(22, 22, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-18 23:43:36', '2025-06-18 23:43:36', 0.00, 0, 0, 0, 0, 0, 0),
(23, 23, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-19 00:51:34', '2025-06-19 00:51:34', 0.00, 0, 0, 0, 0, 0, 0),
(24, 24, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-19 02:25:47', '2025-06-19 02:27:00', 0.00, 0, 0, 0, 0, 0, 0),
(25, 25, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-19 03:30:01', '2025-06-19 03:30:01', 0.00, 0, 0, 0, 0, 0, 0),
(26, 26, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-19 03:32:39', '2025-06-19 03:33:59', 0.00, 0, 0, 0, 0, 0, 0),
(27, 27, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-19 04:31:26', '2025-06-19 04:33:25', 0.00, 0, 0, 0, 0, 0, 0),
(28, 28, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-24 21:03:07', '2025-06-24 21:03:07', 0.00, 0, 0, 0, 0, 0, 0),
(29, 29, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-24 21:05:47', '2025-06-24 21:06:07', 0.00, 0, 0, 0, 0, 0, 0),
(30, 30, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-24 21:37:23', '2025-06-24 21:37:23', 0.00, 0, 0, 0, 0, 0, 0),
(31, 31, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-24 21:41:16', '2025-06-24 21:41:16', 0.00, 0, 0, 0, 0, 0, 0),
(32, 32, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-25 02:51:09', '2025-06-25 02:51:09', 0.00, 0, 0, 0, 0, 0, 0),
(33, 33, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-25 04:17:18', '2025-06-25 04:17:18', 0.00, 0, 0, 0, 0, 0, 0),
(34, 34, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-25 17:11:07', '2025-06-25 17:11:07', 0.00, 0, 0, 0, 0, 0, 0),
(35, 35, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-25 19:19:29', '2025-06-25 19:19:29', 0.00, 0, 0, 0, 0, 0, 0),
(36, 36, 'BRL', 'R$', 90.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-25 19:37:19', '2025-06-25 19:38:23', 0.00, 0, 0, 0, 0, 0, 0),
(37, 37, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-25 21:56:09', '2025-06-25 21:56:09', 0.00, 0, 0, 0, 0, 0, 0),
(38, 38, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-25 23:12:09', '2025-06-25 23:12:09', 0.00, 0, 0, 0, 0, 0, 0),
(39, 39, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-25 23:13:31', '2025-06-25 23:14:23', 0.00, 0, 0, 0, 0, 0, 0),
(40, 40, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-25 23:39:26', '2025-06-25 23:39:59', 0.00, 0, 0, 0, 0, 0, 0),
(41, 41, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 00:11:17', '2025-06-26 00:35:29', 0.00, 0, 0, 0, 0, 0, 0),
(42, 42, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 00:19:03', '2025-06-26 00:19:03', 0.00, 0, 0, 0, 0, 0, 0),
(43, 43, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 09:08:44', '2025-06-26 09:08:44', 0.00, 0, 0, 0, 0, 0, 0),
(44, 44, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 11:21:24', '2025-06-28 08:09:54', 0.00, 0, 0, 0, 0, 0, 0),
(45, 45, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 11:41:29', '2025-06-26 11:41:29', 0.00, 0, 0, 0, 0, 0, 0),
(46, 46, 'BRL', 'R$', 60.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 13:37:54', '2025-06-26 13:38:23', 0.00, 0, 0, 0, 0, 0, 0),
(47, 47, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 16:24:26', '2025-06-26 16:24:26', 0.00, 0, 0, 0, 0, 0, 0),
(48, 48, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 16:47:20', '2025-06-26 16:47:20', 0.00, 0, 0, 0, 0, 0, 0),
(49, 49, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 17:43:35', '2025-06-26 17:43:35', 0.00, 0, 0, 0, 0, 0, 0),
(50, 50, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 21:00:49', '2025-06-26 21:00:49', 0.00, 0, 0, 0, 0, 0, 0),
(51, 51, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 21:02:07', '2025-06-26 21:16:32', 0.00, 0, 0, 0, 0, 0, 0),
(52, 52, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-26 21:14:20', '2025-06-26 21:16:55', 0.00, 0, 0, 0, 0, 0, 0),
(53, 53, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 00:18:35', '2025-06-27 00:18:35', 0.00, 0, 0, 0, 0, 0, 0),
(54, 54, 'BRL', 'R$', 200.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 00:43:39', '2025-06-27 01:32:05', 0.00, 0, 0, 0, 0, 0, 0),
(55, 55, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 01:34:18', '2025-06-27 01:34:18', 0.00, 0, 0, 0, 0, 0, 0),
(56, 56, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 02:34:46', '2025-06-27 02:34:46', 0.00, 0, 0, 0, 0, 0, 0),
(57, 57, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 05:25:54', '2025-06-27 05:25:54', 0.00, 0, 0, 0, 0, 0, 0),
(58, 58, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 07:28:07', '2025-06-27 07:28:07', 0.00, 0, 0, 0, 0, 0, 0),
(59, 59, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 07:56:56', '2025-06-27 07:56:56', 0.00, 0, 0, 0, 0, 0, 0),
(60, 60, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 07:58:33', '2025-06-27 07:59:24', 0.00, 0, 0, 0, 0, 0, 0),
(61, 61, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 10:27:03', '2025-06-27 10:27:03', 0.00, 0, 0, 0, 0, 0, 0),
(62, 62, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 10:29:06', '2025-06-27 10:29:26', 0.00, 0, 0, 0, 0, 0, 0),
(63, 63, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 15:33:15', '2025-06-27 15:33:15', 0.00, 0, 0, 0, 0, 0, 0),
(64, 64, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 16:02:54', '2025-06-27 16:02:54', 0.00, 0, 0, 0, 0, 0, 0),
(65, 65, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 17:12:09', '2025-06-27 17:12:09', 0.00, 0, 0, 0, 0, 0, 0),
(66, 66, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 18:12:18', '2025-06-27 18:12:18', 0.00, 0, 0, 0, 0, 0, 0),
(67, 67, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 20:10:00', '2025-06-27 20:10:00', 0.00, 0, 0, 0, 0, 0, 0),
(68, 68, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 22:18:31', '2025-06-27 22:18:31', 0.00, 0, 0, 0, 0, 0, 0),
(69, 69, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-27 22:49:55', '2025-06-27 22:49:55', 0.00, 0, 0, 0, 0, 0, 0),
(70, 70, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 00:19:24', '2025-06-28 00:19:24', 0.00, 0, 0, 0, 0, 0, 0),
(71, 71, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 00:50:18', '2025-06-28 00:50:33', 0.00, 0, 0, 0, 0, 0, 0),
(72, 72, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 01:25:02', '2025-06-28 01:25:02', 0.00, 0, 0, 0, 0, 0, 0),
(73, 73, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 03:12:36', '2025-06-28 03:12:36', 0.00, 0, 0, 0, 0, 0, 0),
(74, 74, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 03:58:48', '2025-06-28 03:58:48', 0.00, 0, 0, 0, 0, 0, 0),
(75, 75, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 05:56:40', '2025-06-28 05:56:40', 0.00, 0, 0, 0, 0, 0, 0),
(76, 76, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 06:10:18', '2025-06-28 06:10:18', 0.00, 0, 0, 0, 0, 0, 0),
(77, 77, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 07:02:01', '2025-06-28 07:02:01', 0.00, 0, 0, 0, 0, 0, 0),
(78, 78, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 10:49:59', '2025-06-28 10:50:16', 0.00, 0, 0, 0, 0, 0, 0),
(79, 79, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 12:01:45', '2025-06-28 12:01:45', 0.00, 0, 0, 0, 0, 0, 0),
(80, 80, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 13:26:44', '2025-06-28 13:26:44', 0.00, 0, 0, 0, 0, 0, 0),
(81, 81, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 14:44:44', '2025-06-28 14:44:44', 0.00, 0, 0, 0, 0, 0, 0),
(82, 82, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 16:00:13', '2025-06-28 16:00:13', 0.00, 0, 0, 0, 0, 0, 0),
(83, 83, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 16:42:19', '2025-06-28 16:42:19', 0.00, 0, 0, 0, 0, 0, 0),
(84, 84, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 19:00:00', '2025-06-28 19:00:00', 0.00, 0, 0, 0, 0, 0, 0),
(85, 85, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 19:20:40', '2025-06-28 19:21:48', 0.00, 0, 0, 0, 0, 0, 0),
(86, 86, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 19:38:14', '2025-06-28 19:38:14', 0.00, 0, 0, 0, 0, 0, 0),
(87, 87, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 22:03:12', '2025-06-28 22:03:12', 0.00, 0, 0, 0, 0, 0, 0),
(88, 88, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 22:23:34', '2025-06-28 22:23:34', 0.00, 0, 0, 0, 0, 0, 0),
(89, 89, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-28 22:30:00', '2025-06-28 22:30:00', 0.00, 0, 0, 0, 0, 0, 0),
(90, 90, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 00:17:27', '2025-06-29 00:17:27', 0.00, 0, 0, 0, 0, 0, 0),
(91, 91, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 00:23:09', '2025-06-29 00:23:09', 0.00, 0, 0, 0, 0, 0, 0),
(92, 92, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 02:00:01', '2025-06-29 02:00:01', 0.00, 0, 0, 0, 0, 0, 0),
(93, 93, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 02:18:51', '2025-06-29 02:18:51', 0.00, 0, 0, 0, 0, 0, 0),
(94, 94, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 02:19:17', '2025-06-29 02:20:18', 0.00, 0, 0, 0, 0, 0, 0),
(95, 95, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 03:46:50', '2025-06-29 03:47:29', 0.00, 0, 0, 0, 0, 0, 0),
(96, 96, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 06:13:40', '2025-06-29 06:19:36', 0.00, 0, 0, 0, 0, 0, 0),
(97, 97, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 07:34:50', '2025-06-29 07:34:50', 0.00, 0, 0, 0, 0, 0, 0),
(98, 98, 'BRL', 'R$', 40.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 08:46:52', '2025-06-29 08:48:18', 0.00, 0, 0, 0, 0, 0, 0),
(99, 99, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 09:11:39', '2025-06-29 09:11:39', 0.00, 0, 0, 0, 0, 0, 0),
(100, 100, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 09:18:48', '2025-06-29 09:29:06', 0.00, 0, 0, 0, 0, 0, 0),
(101, 101, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 10:36:24', '2025-06-29 13:30:52', 0.00, 0, 0, 0, 0, 0, 0),
(102, 102, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 10:54:18', '2025-06-29 10:54:18', 0.00, 0, 0, 0, 0, 0, 0),
(103, 103, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 11:32:01', '2025-06-29 11:32:01', 0.00, 0, 0, 0, 0, 0, 0),
(104, 104, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 12:11:03', '2025-06-29 12:11:03', 0.00, 0, 0, 0, 0, 0, 0),
(105, 105, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 13:03:05', '2025-06-29 13:03:33', 0.00, 0, 0, 0, 0, 0, 0),
(106, 106, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 14:34:22', '2025-06-29 14:34:22', 0.00, 0, 0, 0, 0, 0, 0),
(107, 107, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 14:38:04', '2025-06-29 14:38:04', 0.00, 0, 0, 0, 0, 0, 0),
(108, 108, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 15:20:47', '2025-06-29 15:28:53', 0.00, 0, 0, 0, 0, 0, 0),
(109, 109, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 15:32:37', '2025-06-29 15:33:45', 0.00, 0, 0, 0, 0, 0, 0),
(110, 110, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 17:18:48', '2025-06-29 17:18:48', 0.00, 0, 0, 0, 0, 0, 0),
(111, 111, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 20:13:28', '2025-07-03 01:34:10', 0.00, 0, 0, 0, 0, 0, 0),
(112, 112, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 21:48:10', '2025-06-29 21:48:10', 0.00, 0, 0, 0, 0, 0, 0),
(113, 113, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 22:35:35', '2025-06-29 22:39:47', 0.00, 0, 0, 0, 0, 0, 0),
(114, 114, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 23:27:16', '2025-06-29 23:27:16', 0.00, 0, 0, 0, 0, 0, 0),
(115, 115, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-29 23:46:23', '2025-06-29 23:46:23', 0.00, 0, 0, 0, 0, 0, 0),
(116, 116, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 02:02:54', '2025-06-30 02:09:44', 0.00, 0, 0, 0, 0, 0, 0),
(117, 117, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 03:08:00', '2025-06-30 03:08:00', 0.00, 0, 0, 0, 0, 0, 0),
(118, 118, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 04:45:40', '2025-06-30 04:45:40', 0.00, 0, 0, 0, 0, 0, 0),
(119, 119, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 05:36:41', '2025-06-30 05:36:41', 0.00, 0, 0, 0, 0, 0, 0),
(120, 120, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 09:03:56', '2025-06-30 09:03:56', 0.00, 0, 0, 0, 0, 0, 0),
(121, 121, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 13:08:26', '2025-06-30 13:08:26', 0.00, 0, 0, 0, 0, 0, 0),
(122, 122, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 13:13:45', '2025-06-30 13:13:45', 0.00, 0, 0, 0, 0, 0, 0),
(123, 123, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 15:12:55', '2025-06-30 15:12:55', 0.00, 0, 0, 0, 0, 0, 0),
(124, 124, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 15:44:59', '2025-06-30 15:44:59', 0.00, 0, 0, 0, 0, 0, 0),
(125, 125, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 15:52:23', '2025-06-30 15:52:23', 0.00, 0, 0, 0, 0, 0, 0),
(126, 126, 'BRL', 'R$', 50.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 15:55:26', '2025-06-30 17:15:08', 0.00, 0, 0, 0, 0, 0, 0),
(127, 127, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 19:27:42', '2025-06-30 20:05:49', 0.00, 0, 0, 0, 0, 0, 0),
(128, 128, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 19:35:53', '2025-06-30 19:35:53', 0.00, 0, 0, 0, 0, 0, 0),
(129, 129, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-06-30 23:27:54', '2025-06-30 23:27:54', 0.00, 0, 0, 0, 0, 0, 0),
(130, 130, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-01 02:07:15', '2025-07-01 02:07:15', 0.00, 0, 0, 0, 0, 0, 0),
(131, 131, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-01 11:22:25', '2025-07-01 11:22:25', 0.00, 0, 0, 0, 0, 0, 0),
(132, 132, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-01 16:12:53', '2025-07-01 16:12:53', 0.00, 0, 0, 0, 0, 0, 0),
(133, 133, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-01 16:59:28', '2025-07-01 17:00:41', 0.00, 0, 0, 0, 0, 0, 0),
(134, 134, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-01 19:00:37', '2025-07-01 19:00:37', 0.00, 0, 0, 0, 0, 0, 0),
(135, 135, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-01 19:57:43', '2025-07-01 19:59:46', 0.00, 0, 0, 0, 0, 0, 0),
(136, 136, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-01 23:02:40', '2025-07-01 23:11:58', 0.00, 0, 0, 0, 0, 0, 0),
(137, 137, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 00:48:53', '2025-07-02 00:50:12', 0.00, 0, 0, 0, 0, 0, 0),
(138, 138, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 01:52:09', '2025-07-02 01:52:09', 0.00, 0, 0, 0, 0, 0, 0),
(139, 139, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 02:32:28', '2025-07-02 02:38:32', 0.00, 0, 0, 0, 0, 0, 0),
(140, 140, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 02:58:47', '2025-07-02 02:58:47', 0.00, 0, 0, 0, 0, 0, 0),
(141, 141, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 04:00:20', '2025-07-02 04:00:20', 0.00, 0, 0, 0, 0, 0, 0),
(142, 142, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 04:27:31', '2025-07-02 05:17:37', 0.00, 0, 0, 0, 0, 0, 0),
(143, 143, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 07:01:05', '2025-07-02 07:02:44', 0.00, 0, 0, 0, 0, 0, 0),
(144, 144, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 09:42:40', '2025-07-02 09:43:20', 0.00, 0, 0, 0, 0, 0, 0),
(145, 145, 'BRL', 'R$', 60.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 13:18:44', '2025-07-02 13:34:21', 0.00, 0, 0, 0, 0, 0, 0),
(146, 146, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 13:50:24', '2025-07-02 13:50:24', 0.00, 0, 0, 0, 0, 0, 0),
(147, 147, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 14:18:25', '2025-07-02 14:18:25', 0.00, 0, 0, 0, 0, 0, 0),
(148, 148, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 15:41:45', '2025-07-02 15:41:45', 0.00, 0, 0, 0, 0, 0, 0),
(149, 149, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 16:20:25', '2025-07-02 16:20:25', 0.00, 0, 0, 0, 0, 0, 0),
(150, 150, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 17:14:20', '2025-07-02 17:14:20', 0.00, 0, 0, 0, 0, 0, 0),
(151, 151, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 17:24:23', '2025-07-02 17:24:23', 0.00, 0, 0, 0, 0, 0, 0),
(152, 152, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 18:30:14', '2025-07-02 18:30:14', 0.00, 0, 0, 0, 0, 0, 0),
(153, 153, 'BRL', 'R$', 500.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 18:47:57', '2025-07-02 20:45:18', 0.00, 0, 0, 0, 0, 0, 0),
(154, 154, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 22:46:56', '2025-07-02 22:46:56', 0.00, 0, 0, 0, 0, 0, 0),
(155, 155, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-02 23:28:30', '2025-07-02 23:28:30', 0.00, 0, 0, 0, 0, 0, 0),
(156, 156, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 00:34:44', '2025-07-03 00:34:44', 0.00, 0, 0, 0, 0, 0, 0),
(157, 157, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 01:20:49', '2025-07-03 01:20:49', 0.00, 0, 0, 0, 0, 0, 0),
(158, 158, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 01:35:29', '2025-07-03 01:36:36', 0.00, 0, 0, 0, 0, 0, 0),
(159, 159, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 02:13:52', '2025-07-03 02:13:52', 0.00, 0, 0, 0, 0, 0, 0),
(160, 160, 'BRL', 'R$', 100.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 02:16:54', '2025-07-09 09:08:41', 0.00, 0, 0, 0, 0, 0, 0),
(161, 161, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 03:17:55', '2025-07-03 03:19:11', 0.00, 0, 0, 0, 0, 0, 0),
(162, 162, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 04:20:07', '2025-07-03 04:20:07', 0.00, 0, 0, 0, 0, 0, 0),
(163, 163, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 04:34:38', '2025-07-03 04:34:38', 0.00, 0, 0, 0, 0, 0, 0),
(164, 164, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 06:04:04', '2025-07-03 06:04:04', 0.00, 0, 0, 0, 0, 0, 0),
(165, 165, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 06:23:00', '2025-07-03 06:23:00', 0.00, 0, 0, 0, 0, 0, 0),
(166, 166, 'BRL', 'R$', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 07:27:41', '2025-07-03 07:29:17', 0.00, 0, 0, 0, 0, 0, 0),
(167, 167, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 08:05:07', '2025-07-03 08:05:07', 0.00, 0, 0, 0, 0, 0, 0),
(168, 168, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 09:55:56', '2025-07-03 09:55:56', 0.00, 0, 0, 0, 0, 0, 0),
(169, 169, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 11:46:53', '2025-07-03 11:46:53', 0.00, 0, 0, 0, 0, 0, 0),
(170, 170, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 15:33:00', '2025-07-03 15:34:07', 0.00, 0, 0, 0, 0, 0, 0),
(171, 171, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 20:49:40', '2025-07-03 20:49:40', 0.00, 0, 0, 0, 0, 0, 0),
(172, 172, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 21:42:49', '2025-07-03 21:42:49', 0.00, 0, 0, 0, 0, 0, 0),
(173, 173, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 21:51:15', '2025-07-03 21:51:15', 0.00, 0, 0, 0, 0, 0, 0),
(174, 174, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 21:55:19', '2025-07-03 21:56:00', 0.00, 0, 0, 0, 0, 0, 0),
(175, 175, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 22:15:21', '2025-07-03 22:15:21', 0.00, 0, 0, 0, 0, 0, 0),
(176, 176, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 22:25:31', '2025-07-03 22:25:31', 0.00, 0, 0, 0, 0, 0, 0),
(177, 177, 'BRL', 'R$', 100.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 22:47:02', '2025-07-03 22:48:15', 0.00, 0, 0, 0, 0, 0, 0),
(178, 178, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-03 23:33:10', '2025-07-03 23:33:10', 0.00, 0, 0, 0, 0, 0, 0),
(179, 179, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 00:36:54', '2025-07-04 00:38:34', 0.00, 0, 0, 0, 0, 0, 0),
(180, 180, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 02:11:07', '2025-07-04 02:16:24', 0.00, 0, 0, 0, 0, 0, 0),
(181, 181, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 03:15:39', '2025-07-04 03:15:39', 0.00, 0, 0, 0, 0, 0, 0),
(182, 182, 'BRL', 'R$', 50.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 04:21:14', '2025-07-04 04:33:50', 0.00, 0, 0, 0, 0, 0, 0),
(183, 183, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 09:25:17', '2025-07-04 09:25:17', 0.00, 0, 0, 0, 0, 0, 0),
(184, 184, 'BRL', 'R$', 100.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 09:34:36', '2025-07-04 09:39:01', 0.00, 0, 0, 0, 0, 0, 0),
(185, 185, 'BRL', 'R$', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 10:30:07', '2025-07-04 10:37:31', 0.00, 0, 0, 0, 0, 0, 0),
(186, 186, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 11:28:10', '2025-07-04 11:28:10', 0.00, 0, 0, 0, 0, 0, 0),
(187, 187, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 12:43:33', '2025-07-04 12:43:33', 0.00, 0, 0, 0, 0, 0, 0),
(188, 188, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 13:35:47', '2025-07-04 13:36:17', 0.00, 0, 0, 0, 0, 0, 0),
(189, 189, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 13:59:51', '2025-07-04 14:01:38', 0.00, 0, 0, 0, 0, 0, 0),
(190, 190, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 17:56:31', '2025-07-04 17:56:31', 0.00, 0, 0, 0, 0, 0, 0),
(191, 191, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 18:34:01', '2025-07-04 18:34:01', 0.00, 0, 0, 0, 0, 0, 0),
(192, 192, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-04 19:44:03', '2025-07-04 19:44:03', 0.00, 0, 0, 0, 0, 0, 0),
(193, 193, 'BRL', 'R$', 40.00, 5.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-05 07:08:36', '2025-07-05 07:24:50', 0.00, 0, 0, 0, 0, 0, 0),
(194, 194, 'BRL', 'R$', 60.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-05 07:30:42', '2025-07-05 07:34:07', 0.00, 0, 0, 0, 0, 0, 0),
(195, 195, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-05 10:22:47', '2025-07-05 10:22:47', 0.00, 0, 0, 0, 0, 0, 0),
(196, 196, 'BRL', 'R$', 150.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-05 15:08:58', '2025-07-05 15:09:45', 0.00, 0, 0, 0, 0, 0, 0),
(197, 197, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-05 17:28:08', '2025-07-05 17:28:08', 0.00, 0, 0, 0, 0, 0, 0),
(198, 198, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-05 19:42:00', '2025-07-05 19:42:00', 0.00, 0, 0, 0, 0, 0, 0),
(199, 199, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-05 23:47:07', '2025-07-05 23:47:07', 0.00, 0, 0, 0, 0, 0, 0),
(200, 200, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 00:04:08', '2025-07-06 00:04:08', 0.00, 0, 0, 0, 0, 0, 0),
(201, 201, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 00:31:00', '2025-07-06 00:31:00', 0.00, 0, 0, 0, 0, 0, 0),
(202, 202, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 00:39:36', '2025-07-06 00:39:36', 0.00, 0, 0, 0, 0, 0, 0),
(203, 203, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 01:47:17', '2025-07-06 01:48:50', 0.00, 0, 0, 0, 0, 0, 0),
(204, 204, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 02:15:10', '2025-07-06 02:27:59', 0.00, 0, 0, 0, 0, 0, 0),
(205, 205, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 03:23:32', '2025-07-06 03:24:27', 0.00, 0, 0, 0, 0, 0, 0),
(206, 206, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 08:51:06', '2025-07-06 08:51:06', 0.00, 0, 0, 0, 0, 0, 0),
(207, 207, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 16:39:34', '2025-07-06 16:41:00', 0.00, 0, 0, 0, 0, 0, 0),
(208, 208, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 19:14:34', '2025-07-06 19:16:07', 0.00, 0, 0, 0, 0, 0, 0),
(209, 209, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 19:29:28', '2025-07-06 19:29:28', 0.00, 0, 0, 0, 0, 0, 0),
(210, 210, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-06 19:35:31', '2025-07-06 19:39:55', 0.00, 0, 0, 0, 0, 0, 0),
(211, 211, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-09 03:02:51', '2025-07-09 03:21:27', 0.00, 0, 0, 0, 0, 0, 0),
(212, 212, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-09 21:19:17', '2025-07-09 21:19:17', 0.00, 0, 0, 0, 0, 0, 0),
(213, 213, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-09 23:01:12', '2025-07-09 23:01:12', 0.00, 0, 0, 0, 0, 0, 0),
(214, 214, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 01:17:21', '2025-07-10 01:17:21', 0.00, 0, 0, 0, 0, 0, 0),
(215, 215, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 02:10:28', '2025-07-10 02:10:28', 0.00, 0, 0, 0, 0, 0, 0),
(216, 216, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 03:07:52', '2025-07-10 03:07:52', 0.00, 0, 0, 0, 0, 0, 0),
(217, 217, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 08:46:42', '2025-07-10 08:46:42', 0.00, 0, 0, 0, 0, 0, 0),
(218, 218, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 10:01:04', '2025-07-10 10:01:04', 0.00, 0, 0, 0, 0, 0, 0),
(219, 219, 'BRL', 'R$', 41.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 18:19:55', '2025-07-10 18:22:55', 0.00, 0, 0, 0, 0, 0, 0),
(220, 220, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 21:04:09', '2025-07-10 21:06:11', 0.00, 0, 0, 0, 0, 0, 0),
(221, 221, 'BRL', 'R$', 40.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 21:44:34', '2025-07-10 21:45:54', 0.00, 0, 0, 0, 0, 0, 0),
(222, 222, 'BRL', 'R$', 50.00, 4.00, 0.00, 0.00, 4.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 22:30:53', '2025-07-25 16:20:05', 0.00, 0, 0, 0, 0, 0, 0),
(223, 223, 'BRL', 'R$', 40.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 22:44:45', '2025-07-10 22:45:57', 0.00, 0, 0, 0, 0, 0, 0),
(224, 224, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 22:49:37', '2025-07-10 23:10:01', 0.00, 0, 0, 0, 0, 0, 0),
(225, 225, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 23:00:47', '2025-07-10 23:01:52', 0.00, 0, 0, 0, 0, 0, 0),
(226, 226, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-10 23:17:08', '2025-07-10 23:17:08', 0.00, 0, 0, 0, 0, 0, 0),
(227, 227, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 00:21:10', '2025-07-11 00:22:57', 0.00, 0, 0, 0, 0, 0, 0),
(228, 228, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 00:31:48', '2025-07-11 00:31:48', 0.00, 0, 0, 0, 0, 0, 0),
(229, 229, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 00:49:14', '2025-07-11 00:49:14', 0.00, 0, 0, 0, 0, 0, 0),
(230, 230, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 00:49:35', '2025-07-11 00:49:35', 0.00, 0, 0, 0, 0, 0, 0),
(231, 231, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 02:14:42', '2025-07-11 02:14:42', 0.00, 0, 0, 0, 0, 0, 0),
(232, 232, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 02:29:53', '2025-07-11 02:29:53', 0.00, 0, 0, 0, 0, 0, 0),
(233, 233, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 02:46:30', '2025-07-11 02:48:59', 0.00, 0, 0, 0, 0, 0, 0),
(234, 234, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 04:22:55', '2025-07-11 04:27:24', 0.00, 0, 0, 0, 0, 0, 0),
(235, 235, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 10:34:13', '2025-07-11 10:34:13', 0.00, 0, 0, 0, 0, 0, 0),
(236, 236, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 11:28:09', '2025-07-11 12:16:09', 0.00, 0, 0, 0, 0, 0, 0),
(237, 237, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 12:09:18', '2025-07-11 12:10:23', 0.00, 0, 0, 0, 0, 0, 0),
(238, 238, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 13:06:20', '2025-07-11 13:35:55', 0.00, 0, 0, 0, 0, 0, 0),
(239, 239, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 19:26:52', '2025-07-11 20:18:13', 0.00, 0, 0, 0, 0, 0, 0),
(240, 240, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 19:29:06', '2025-07-11 19:29:06', 0.00, 0, 0, 0, 0, 0, 0),
(241, 241, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 19:55:25', '2025-07-11 19:55:25', 0.00, 0, 0, 0, 0, 0, 0),
(242, 242, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 20:56:42', '2025-07-11 21:19:45', 0.00, 0, 0, 0, 0, 0, 0),
(243, 243, 'BRL', 'R$', 100.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 21:21:29', '2025-07-12 11:05:23', 0.00, 0, 0, 0, 0, 0, 0),
(244, 244, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 22:00:06', '2025-07-11 22:00:06', 0.00, 0, 0, 0, 0, 0, 0),
(245, 245, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 23:22:20', '2025-07-11 23:22:20', 0.00, 0, 0, 0, 0, 0, 0),
(246, 246, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-11 23:26:51', '2025-07-11 23:26:51', 0.00, 0, 0, 0, 0, 0, 0),
(247, 247, 'BRL', 'R$', 30.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 00:15:01', '2025-07-12 10:12:58', 0.00, 0, 0, 0, 0, 0, 0),
(248, 248, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 06:17:07', '2025-07-12 06:18:11', 0.00, 0, 0, 0, 0, 0, 0),
(249, 249, 'BRL', 'R$', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 06:19:21', '2025-07-12 06:22:27', 0.00, 0, 0, 0, 0, 0, 0),
(250, 250, 'BRL', 'R$', 589.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 09:02:11', '2025-07-12 09:04:58', 0.00, 0, 0, 0, 0, 0, 0),
(251, 251, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 12:34:20', '2025-07-12 12:34:20', 0.00, 0, 0, 0, 0, 0, 0),
(252, 252, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 12:45:43', '2025-07-12 12:45:43', 0.00, 0, 0, 0, 0, 0, 0),
(253, 253, 'BRL', 'R$', 40.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 13:07:17', '2025-07-12 13:14:41', 0.00, 0, 0, 0, 0, 0, 0),
(254, 254, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 15:59:35', '2025-07-12 16:04:10', 0.00, 0, 0, 0, 0, 0, 0),
(255, 255, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 16:22:58', '2025-07-12 16:34:18', 0.00, 0, 0, 0, 0, 0, 0),
(256, 256, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 19:52:43', '2025-07-12 19:55:32', 0.00, 0, 0, 0, 0, 0, 0),
(257, 257, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 21:06:19', '2025-07-12 21:51:01', 0.00, 0, 0, 0, 0, 0, 0),
(258, 258, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-12 22:23:49', '2025-07-12 22:23:49', 0.00, 0, 0, 0, 0, 0, 0),
(259, 259, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 02:09:00', '2025-07-13 02:09:00', 0.00, 0, 0, 0, 0, 0, 0),
(260, 260, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 02:41:45', '2025-07-13 02:41:45', 0.00, 0, 0, 0, 0, 0, 0),
(261, 261, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 03:11:35', '2025-07-13 03:11:35', 0.00, 0, 0, 0, 0, 0, 0),
(262, 262, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 03:55:11', '2025-07-13 03:57:55', 0.00, 0, 0, 0, 0, 0, 0),
(263, 263, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 11:31:56', '2025-07-13 11:52:21', 0.00, 0, 0, 0, 0, 0, 0),
(264, 264, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 14:35:23', '2025-07-13 16:39:36', 0.00, 0, 0, 0, 0, 0, 0),
(265, 265, 'BRL', 'R$', 50.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 14:35:58', '2025-07-13 22:09:06', 0.00, 0, 0, 0, 0, 0, 0),
(266, 266, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 14:39:33', '2025-07-13 14:39:33', 0.00, 0, 0, 0, 0, 0, 0),
(267, 267, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 18:57:30', '2025-07-13 18:57:30', 0.00, 0, 0, 0, 0, 0, 0),
(268, 268, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 20:41:49', '2025-07-13 20:41:49', 0.00, 0, 0, 0, 0, 0, 0),
(269, 269, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 21:40:52', '2025-07-17 16:10:51', 0.00, 0, 0, 0, 0, 0, 0),
(270, 270, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-13 23:55:27', '2025-07-13 23:55:27', 0.00, 0, 0, 0, 0, 0, 0),
(271, 271, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 03:28:51', '2025-07-14 03:29:40', 0.00, 0, 0, 0, 0, 0, 0),
(272, 272, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 08:14:22', '2025-07-14 08:29:51', 0.00, 0, 0, 0, 0, 0, 0),
(273, 273, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 10:10:46', '2025-07-14 10:10:46', 0.00, 0, 0, 0, 0, 0, 0),
(274, 274, 'BRL', 'R$', 50.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 12:11:48', '2025-07-14 12:22:31', 0.00, 0, 0, 0, 0, 0, 0),
(275, 275, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 13:27:54', '2025-07-14 13:27:54', 0.00, 0, 0, 0, 0, 0, 0),
(276, 276, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 15:15:37', '2025-07-14 15:15:37', 0.00, 0, 0, 0, 0, 0, 0),
(277, 277, 'BRL', 'R$', 100.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 15:47:14', '2025-07-14 22:53:55', 0.00, 0, 0, 0, 0, 0, 0),
(278, 278, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 18:15:25', '2025-07-14 18:15:25', 0.00, 0, 0, 0, 0, 0, 0),
(279, 279, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 20:30:32', '2025-07-14 20:30:32', 0.00, 0, 0, 0, 0, 0, 0),
(280, 280, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 21:05:32', '2025-07-14 21:05:32', 0.00, 0, 0, 0, 0, 0, 0),
(281, 281, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 22:24:04', '2025-07-14 22:42:40', 0.00, 0, 0, 0, 0, 0, 0),
(282, 282, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-14 22:50:40', '2025-07-14 22:50:40', 0.00, 0, 0, 0, 0, 0, 0),
(283, 283, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-15 03:14:36', '2025-07-15 03:14:36', 0.00, 0, 0, 0, 0, 0, 0),
(284, 284, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-15 13:56:31', '2025-07-15 13:57:31', 0.00, 0, 0, 0, 0, 0, 0),
(285, 285, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-15 18:32:06', '2025-07-15 18:42:37', 0.00, 0, 0, 0, 0, 0, 0),
(286, 286, 'BRL', 'R$', 30.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-15 18:42:58', '2025-07-15 19:05:56', 0.00, 0, 0, 0, 0, 0, 0),
(287, 287, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-15 19:55:43', '2025-07-15 19:55:43', 0.00, 0, 0, 0, 0, 0, 0),
(288, 288, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-15 23:33:24', '2025-07-15 23:34:10', 0.00, 0, 0, 0, 0, 0, 0),
(289, 289, 'BRL', 'R$', 190.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-15 23:44:09', '2025-07-16 00:45:00', 0.00, 0, 0, 0, 0, 0, 0),
(290, 290, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-15 23:57:50', '2025-07-15 23:57:50', 0.00, 0, 0, 0, 0, 0, 0),
(291, 291, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 01:22:20', '2025-07-16 01:22:20', 0.00, 0, 0, 0, 0, 0, 0),
(292, 292, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 01:55:38', '2025-07-16 01:55:38', 0.00, 0, 0, 0, 0, 0, 0),
(293, 293, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 02:15:11', '2025-07-16 02:16:55', 0.00, 0, 0, 0, 0, 0, 0),
(294, 294, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 10:07:57', '2025-07-16 10:08:23', 0.00, 0, 0, 0, 0, 0, 0),
(295, 295, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 10:08:20', '2025-07-16 10:10:04', 0.00, 0, 0, 0, 0, 0, 0),
(296, 296, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 12:05:53', '2025-07-16 12:07:22', 0.00, 0, 0, 0, 0, 0, 0),
(297, 297, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 12:25:50', '2025-07-16 12:25:50', 0.00, 0, 0, 0, 0, 0, 0),
(298, 298, 'BRL', 'R$', 100.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 13:11:36', '2025-07-16 13:25:17', 0.00, 0, 0, 0, 0, 0, 0),
(299, 299, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 15:57:22', '2025-07-16 15:57:22', 0.00, 0, 0, 0, 0, 0, 0),
(300, 300, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 16:54:35', '2025-07-16 17:20:24', 0.00, 0, 0, 0, 0, 0, 0),
(301, 301, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 22:03:38', '2025-07-16 22:03:38', 0.00, 0, 0, 0, 0, 0, 0),
(302, 302, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-16 22:38:45', '2025-07-16 22:38:45', 0.00, 0, 0, 0, 0, 0, 0),
(303, 303, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 01:02:07', '2025-07-17 01:02:54', 0.00, 0, 0, 0, 0, 0, 0),
(304, 304, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 02:12:57', '2025-07-17 02:12:57', 0.00, 0, 0, 0, 0, 0, 0),
(305, 305, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 02:42:14', '2025-07-17 02:42:14', 0.00, 0, 0, 0, 0, 0, 0),
(306, 306, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 04:09:23', '2025-07-17 04:09:23', 0.00, 0, 0, 0, 0, 0, 0),
(307, 307, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 06:22:39', '2025-07-17 06:22:39', 0.00, 0, 0, 0, 0, 0, 0);
INSERT INTO `wallets` (`id`, `user_id`, `currency`, `symbol`, `balance`, `balance_bonus_rollover`, `balance_deposit_rollover`, `balance_withdrawal`, `balance_bonus`, `balance_cryptocurrency`, `balance_demo`, `refer_rewards`, `hide_balance`, `active`, `created_at`, `updated_at`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `vip_level`, `vip_points`) VALUES
(308, 308, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 07:44:10', '2025-07-17 07:44:10', 0.00, 0, 0, 0, 0, 0, 0),
(309, 309, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 13:46:15', '2025-07-17 13:46:15', 0.00, 0, 0, 0, 0, 0, 0),
(310, 310, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 13:49:16', '2025-07-17 13:49:16', 0.00, 0, 0, 0, 0, 0, 0),
(311, 311, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 14:21:03', '2025-07-17 14:21:03', 0.00, 0, 0, 0, 0, 0, 0),
(312, 312, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 14:52:14', '2025-07-17 14:52:14', 0.00, 0, 0, 0, 0, 0, 0),
(313, 313, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 15:01:57', '2025-07-17 15:01:57', 0.00, 0, 0, 0, 0, 0, 0),
(314, 314, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 17:58:55', '2025-07-17 17:58:55', 0.00, 0, 0, 0, 0, 0, 0),
(315, 315, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-17 20:21:57', '2025-07-17 20:21:57', 0.00, 0, 0, 0, 0, 0, 0),
(316, 316, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 01:48:38', '2025-07-18 01:48:38', 0.00, 0, 0, 0, 0, 0, 0),
(317, 317, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 02:08:39', '2025-07-18 02:08:39', 0.00, 0, 0, 0, 0, 0, 0),
(318, 318, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 02:35:12', '2025-07-18 02:35:12', 0.00, 0, 0, 0, 0, 0, 0),
(319, 319, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 02:45:21', '2025-07-18 02:45:21', 0.00, 0, 0, 0, 0, 0, 0),
(320, 320, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 03:10:37', '2025-07-18 03:10:37', 0.00, 0, 0, 0, 0, 0, 0),
(321, 321, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 04:27:24', '2025-07-18 04:27:24', 0.00, 0, 0, 0, 0, 0, 0),
(322, 322, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 09:26:58', '2025-07-18 09:26:58', 0.00, 0, 0, 0, 0, 0, 0),
(323, 323, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 12:55:05', '2025-07-18 16:01:03', 0.00, 0, 0, 0, 0, 0, 0),
(324, 324, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 19:44:46', '2025-07-18 19:44:46', 0.00, 0, 0, 0, 0, 0, 0),
(325, 325, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-18 22:04:23', '2025-07-18 22:04:23', 0.00, 0, 0, 0, 0, 0, 0),
(326, 326, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 00:14:41', '2025-07-19 00:46:46', 0.00, 0, 0, 0, 0, 0, 0),
(327, 327, 'BRL', 'R$', 40.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 03:19:20', '2025-07-19 03:54:47', 0.00, 0, 0, 0, 0, 0, 0),
(328, 328, 'BRL', 'R$', 60.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 09:31:39', '2025-07-19 09:32:53', 0.00, 0, 0, 0, 0, 0, 0),
(329, 329, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 14:26:08', '2025-07-19 14:27:01', 0.00, 0, 0, 0, 0, 0, 0),
(330, 330, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 14:52:07', '2025-07-19 14:52:07', 0.00, 0, 0, 0, 0, 0, 0),
(331, 331, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 15:06:19', '2025-07-19 15:06:19', 0.00, 0, 0, 0, 0, 0, 0),
(332, 332, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 19:28:01', '2025-07-19 19:28:01', 0.00, 0, 0, 0, 0, 0, 0),
(333, 333, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 19:28:11', '2025-07-19 19:28:11', 0.00, 0, 0, 0, 0, 0, 0),
(334, 334, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 22:05:34', '2025-07-19 22:05:34', 0.00, 0, 0, 0, 0, 0, 0),
(335, 335, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 22:07:22', '2025-07-19 22:07:22', 0.00, 0, 0, 0, 0, 0, 0),
(336, 336, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 22:10:51', '2025-07-19 22:10:51', 0.00, 0, 0, 0, 0, 0, 0),
(337, 337, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 22:11:16', '2025-07-19 22:11:16', 0.00, 0, 0, 0, 0, 0, 0),
(338, 338, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-19 22:54:25', '2025-07-19 22:54:25', 0.00, 0, 0, 0, 0, 0, 0),
(339, 339, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-20 01:36:46', '2025-07-20 01:36:46', 0.00, 0, 0, 0, 0, 0, 0),
(340, 340, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-20 02:40:16', '2025-07-20 02:40:16', 0.00, 0, 0, 0, 0, 0, 0),
(341, 341, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-20 14:51:39', '2025-07-20 14:53:27', 0.00, 0, 0, 0, 0, 0, 0),
(342, 342, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-20 15:21:40', '2025-07-20 15:21:40', 0.00, 0, 0, 0, 0, 0, 0),
(343, 343, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-20 20:13:16', '2025-07-20 20:13:16', 0.00, 0, 0, 0, 0, 0, 0),
(344, 344, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-21 00:11:53', '2025-07-21 00:12:51', 0.00, 0, 0, 0, 0, 0, 0),
(345, 345, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-21 01:24:45', '2025-07-21 01:24:45', 0.00, 0, 0, 0, 0, 0, 0),
(346, 346, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-21 01:24:48', '2025-07-21 01:24:48', 0.00, 0, 0, 0, 0, 0, 0),
(347, 347, 'BRL', 'R$', 33.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-21 01:27:07', '2025-07-21 08:00:28', 0.00, 0, 0, 0, 0, 0, 0),
(348, 348, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-21 15:20:48', '2025-07-21 15:20:48', 0.00, 0, 0, 0, 0, 0, 0),
(349, 349, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-21 15:56:14', '2025-07-21 15:57:35', 0.00, 0, 0, 0, 0, 0, 0),
(350, 350, 'BRL', 'R$', 150.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-21 18:14:58', '2025-07-21 18:22:10', 0.00, 0, 0, 0, 0, 0, 0),
(351, 351, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-21 22:07:47', '2025-07-21 22:13:20', 0.00, 0, 0, 0, 0, 0, 0),
(352, 352, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 01:27:18', '2025-07-22 01:28:18', 0.00, 0, 0, 0, 0, 0, 0),
(353, 353, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 01:32:13', '2025-07-22 01:32:13', 0.00, 0, 0, 0, 0, 0, 0),
(354, 354, 'BRL', 'R$', 60.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 01:42:00', '2025-07-22 01:52:56', 0.00, 0, 0, 0, 0, 0, 0),
(355, 355, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 02:19:27', '2025-07-22 02:20:06', 0.00, 0, 0, 0, 0, 0, 0),
(356, 356, 'BRL', 'R$', 100.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 02:55:21', '2025-07-22 02:57:54', 0.00, 0, 0, 0, 0, 0, 0),
(357, 357, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 09:40:57', '2025-07-22 09:40:57', 0.00, 0, 0, 0, 0, 0, 0),
(358, 358, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 10:19:43', '2025-07-22 10:19:43', 0.00, 0, 0, 0, 0, 0, 0),
(359, 359, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 16:30:33', '2025-07-22 16:30:33', 0.00, 0, 0, 0, 0, 0, 0),
(360, 360, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 21:37:41', '2025-07-22 21:37:41', 0.00, 0, 0, 0, 0, 0, 0),
(361, 361, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-22 21:38:56', '2025-07-22 21:44:44', 0.00, 0, 0, 0, 0, 0, 0),
(362, 362, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-23 00:43:17', '2025-07-23 00:43:17', 0.00, 0, 0, 0, 0, 0, 0),
(363, 363, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-23 02:19:42', '2025-07-23 02:19:42', 0.00, 0, 0, 0, 0, 0, 0),
(364, 364, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-23 02:44:13', '2025-07-23 03:06:45', 0.00, 0, 0, 0, 0, 0, 0),
(365, 365, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-23 03:28:39', '2025-07-23 03:28:39', 0.00, 0, 0, 0, 0, 0, 0),
(366, 366, 'BRL', 'R$', 50.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-23 03:34:16', '2025-07-24 08:00:19', 0.00, 0, 0, 0, 0, 0, 0),
(367, 367, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-23 11:38:43', '2025-07-23 11:40:50', 0.00, 0, 0, 0, 0, 0, 0),
(368, 368, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-23 12:13:46', '2025-07-23 12:14:49', 0.00, 0, 0, 0, 0, 0, 0),
(369, 369, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-23 16:13:30', '2025-07-23 16:18:57', 0.00, 0, 0, 0, 0, 0, 0),
(370, 370, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-24 03:01:38', '2025-07-24 03:10:22', 0.00, 0, 0, 0, 0, 0, 0),
(371, 371, 'BRL', 'R$', 30.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-24 10:58:07', '2025-07-25 10:23:52', 0.00, 0, 0, 0, 0, 0, 0),
(372, 372, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-24 17:39:09', '2025-07-31 10:55:58', 0.00, 0, 0, 0, 0, 0, 0),
(373, 373, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-24 17:45:53', '2025-07-24 17:45:53', 0.00, 0, 0, 0, 0, 0, 0),
(374, 374, 'BRL', 'R$', 40.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-24 22:19:28', '2025-07-24 22:21:50', 0.00, 0, 0, 0, 0, 0, 0),
(375, 375, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-24 22:22:03', '2025-07-24 22:24:16', 0.00, 0, 0, 0, 0, 0, 0),
(376, 376, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-25 01:42:04', '2025-07-25 01:42:04', 0.00, 0, 0, 0, 0, 0, 0),
(377, 377, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-25 04:57:14', '2025-07-25 04:57:44', 0.00, 0, 0, 0, 0, 0, 0),
(378, 378, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-25 08:53:57', '2025-07-25 08:54:35', 0.00, 0, 0, 0, 0, 0, 0),
(379, 379, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-25 17:44:56', '2025-07-25 17:44:56', 0.00, 0, 0, 0, 0, 0, 0),
(380, 380, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-25 18:03:00', '2025-07-25 18:03:00', 0.00, 0, 0, 0, 0, 0, 0),
(381, 381, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-25 18:22:23', '2025-07-25 18:32:04', 0.00, 0, 0, 0, 0, 0, 0),
(382, 382, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-25 23:42:13', '2025-07-25 23:43:06', 0.00, 0, 0, 0, 0, 0, 0),
(383, 383, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-26 01:56:55', '2025-07-26 01:56:55', 0.00, 0, 0, 0, 0, 0, 0),
(384, 384, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-26 01:59:58', '2025-07-26 01:59:58', 0.00, 0, 0, 0, 0, 0, 0),
(385, 385, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-28 13:31:12', '2025-07-28 13:31:12', 0.00, 0, 0, 0, 0, 0, 0),
(386, 386, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-28 14:39:17', '2025-07-28 14:41:01', 0.00, 0, 0, 0, 0, 0, 0),
(387, 387, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 10.00, 0, 1, '2025-07-28 16:45:05', '2025-07-30 12:48:14', 0.00, 0, 0, 0, 0, 0, 0),
(388, 388, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-29 19:55:39', '2025-07-29 19:55:39', 0.00, 0, 0, 0, 0, 0, 0),
(389, 389, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-29 20:30:02', '2025-07-29 20:30:02', 0.00, 0, 0, 0, 0, 0, 0),
(390, 390, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-29 23:06:30', '2025-07-29 23:06:30', 0.00, 0, 0, 0, 0, 0, 0),
(391, 391, 'BRL', 'R$', 60.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 01:00:30', '2025-07-30 01:01:36', 0.00, 0, 0, 0, 0, 0, 0),
(392, 392, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 02:31:03', '2025-07-30 02:32:49', 0.00, 0, 0, 0, 0, 0, 0),
(393, 393, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 06:25:07', '2025-07-30 06:25:07', 0.00, 0, 0, 0, 0, 0, 0),
(394, 394, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 06:25:45', '2025-07-30 06:26:15', 0.00, 0, 0, 0, 0, 0, 0),
(395, 395, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 06:34:12', '2025-08-01 01:23:50', 0.00, 0, 0, 0, 0, 0, 0),
(396, 396, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 11:44:54', '2025-07-30 11:44:54', 0.00, 0, 0, 0, 0, 0, 0),
(397, 397, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 12:47:19', '2025-07-30 12:48:14', 0.00, 0, 0, 0, 0, 0, 0),
(398, 398, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 14:13:35', '2025-07-30 14:13:35', 0.00, 0, 0, 0, 0, 0, 0),
(399, 399, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 16:32:31', '2025-07-30 16:32:31', 0.00, 0, 0, 0, 0, 0, 0),
(400, 400, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 16:42:40', '2025-07-30 16:42:40', 0.00, 0, 0, 0, 0, 0, 0),
(401, 401, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 19:22:42', '2025-07-30 19:31:11', 0.00, 0, 0, 0, 0, 0, 0),
(402, 402, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-30 22:52:11', '2025-07-30 22:52:11', 0.00, 0, 0, 0, 0, 0, 0),
(403, 403, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-31 18:44:10', '2025-07-31 18:44:10', 0.00, 0, 0, 0, 0, 0, 0),
(404, 404, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-07-31 23:45:10', '2025-07-31 23:46:49', 0.00, 0, 0, 0, 0, 0, 0),
(405, 405, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 00:38:03', '2025-08-01 00:38:03', 0.00, 0, 0, 0, 0, 0, 0),
(406, 406, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 00:40:19', '2025-08-01 00:41:05', 0.00, 0, 0, 0, 0, 0, 0),
(407, 407, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 01:03:48', '2025-08-01 01:03:48', 0.00, 0, 0, 0, 0, 0, 0),
(408, 408, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 01:25:04', '2025-08-01 01:25:04', 0.00, 0, 0, 0, 0, 0, 0),
(409, 409, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 01:26:34', '2025-08-01 01:26:34', 0.00, 0, 0, 0, 0, 0, 0),
(410, 410, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 03:02:01', '2025-08-01 03:02:01', 0.00, 0, 0, 0, 0, 0, 0),
(411, 411, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 03:37:29', '2025-08-01 03:37:29', 0.00, 0, 0, 0, 0, 0, 0),
(412, 412, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 05:28:56', '2025-08-01 23:30:30', 0.00, 0, 0, 0, 0, 0, 0),
(413, 413, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 10.00, 0, 1, '2025-08-01 12:36:34', '2025-08-01 12:47:47', 0.00, 0, 0, 0, 0, 0, 0),
(414, 414, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 12:45:46', '2025-08-01 13:17:27', 0.00, 0, 0, 0, 0, 0, 0),
(415, 415, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 17:01:59', '2025-08-01 17:01:59', 0.00, 0, 0, 0, 0, 0, 0),
(416, 416, 'BRL', 'R$', 30.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 19:34:57', '2025-08-01 19:40:09', 0.00, 0, 0, 0, 0, 0, 0),
(417, 417, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 19:42:11', '2025-08-01 19:51:18', 0.00, 0, 0, 0, 0, 0, 0),
(418, 418, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 22:39:40', '2025-08-01 22:41:55', 0.00, 0, 0, 0, 0, 0, 0),
(419, 419, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 23:07:46', '2025-08-01 23:07:46', 0.00, 0, 0, 0, 0, 0, 0),
(420, 420, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-01 23:24:09', '2025-08-01 23:24:09', 0.00, 0, 0, 0, 0, 0, 0),
(421, 421, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-02 00:07:18', '2025-08-02 00:09:40', 0.00, 0, 0, 0, 0, 0, 0),
(422, 422, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-02 00:11:21', '2025-08-02 00:13:15', 0.00, 0, 0, 0, 0, 0, 0),
(423, 423, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-02 00:35:07', '2025-08-02 00:35:07', 0.00, 0, 0, 0, 0, 0, 0),
(424, 424, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-02 01:10:28', '2025-08-02 01:14:50', 0.00, 0, 0, 0, 0, 0, 0),
(425, 425, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-02 01:15:27', '2025-08-02 01:15:27', 0.00, 0, 0, 0, 0, 0, 0),
(426, 426, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-02 03:05:00', '2025-08-02 03:05:59', 0.00, 0, 0, 0, 0, 0, 0),
(427, 427, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-02 03:05:23', '2025-08-02 03:06:50', 0.00, 0, 0, 0, 0, 0, 0),
(428, 428, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-02 03:18:41', '2025-08-02 03:18:41', 0.00, 0, 0, 0, 0, 0, 0),
(429, 429, 'BRL', 'R$', 60.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-04 14:10:31', '2025-08-04 14:23:05', 0.00, 0, 0, 0, 0, 0, 0),
(430, 430, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-04 22:55:29', '2025-08-04 22:55:29', 0.00, 0, 0, 0, 0, 0, 0),
(431, 431, 'BRL', 'R$', 30.00, 9.00, 0.00, 0.00, 9.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-05 00:52:19', '2025-08-19 23:24:15', 0.00, 0, 0, 0, 0, 0, 0),
(432, 432, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-05 01:29:08', '2025-08-05 01:29:08', 0.00, 0, 0, 0, 0, 0, 0),
(433, 433, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-05 02:29:36', '2025-08-05 02:29:36', 0.00, 0, 0, 0, 0, 0, 0),
(434, 434, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-05 06:33:41', '2025-08-05 06:33:41', 0.00, 0, 0, 0, 0, 0, 0),
(435, 435, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-05 11:09:50', '2025-08-05 11:09:50', 0.00, 0, 0, 0, 0, 0, 0),
(436, 436, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-05 18:56:55', '2025-08-05 19:07:20', 0.00, 0, 0, 0, 0, 0, 0),
(437, 437, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-05 23:28:06', '2025-08-05 23:29:04', 0.00, 0, 0, 0, 0, 0, 0),
(438, 438, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-06 01:50:47', '2025-08-06 01:54:50', 0.00, 0, 0, 0, 0, 0, 0),
(439, 439, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-06 02:17:42', '2025-08-06 02:17:42', 0.00, 0, 0, 0, 0, 0, 0),
(440, 440, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-06 04:59:14', '2025-08-06 04:59:14', 0.00, 0, 0, 0, 0, 0, 0),
(441, 441, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-06 07:17:49', '2025-08-06 07:17:49', 0.00, 0, 0, 0, 0, 0, 0),
(442, 442, 'BRL', 'R$', 107.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-06 10:36:24', '2025-08-06 10:52:10', 0.00, 0, 0, 0, 0, 0, 0),
(443, 443, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-06 10:47:07', '2025-08-06 10:47:07', 0.00, 0, 0, 0, 0, 0, 0),
(444, 444, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-06 23:36:36', '2025-08-06 23:36:36', 0.00, 0, 0, 0, 0, 0, 0),
(445, 445, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-07 00:14:17', '2025-08-07 00:14:17', 0.00, 0, 0, 0, 0, 0, 0),
(446, 446, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-07 03:39:24', '2025-08-07 03:40:16', 0.00, 0, 0, 0, 0, 0, 0),
(447, 447, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-07 05:21:06', '2025-08-07 05:21:06', 0.00, 0, 0, 0, 0, 0, 0),
(448, 448, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-07 11:21:32', '2025-08-07 11:21:32', 0.00, 0, 0, 0, 0, 0, 0),
(449, 449, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-07 11:47:22', '2025-08-07 11:47:22', 0.00, 0, 0, 0, 0, 0, 0),
(450, 450, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-07 15:29:45', '2025-08-07 15:29:45', 0.00, 0, 0, 0, 0, 0, 0),
(451, 451, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-07 15:56:56', '2025-08-07 15:56:56', 0.00, 0, 0, 0, 0, 0, 0),
(452, 452, 'BRL', 'R$', 100.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-07 16:48:28', '2025-08-07 16:49:29', 0.00, 0, 0, 0, 0, 0, 0),
(453, 453, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-07 22:04:12', '2025-08-07 22:04:12', 0.00, 0, 0, 0, 0, 0, 0),
(454, 454, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 00:09:00', '2025-08-08 00:09:00', 0.00, 0, 0, 0, 0, 0, 0),
(455, 455, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 03:48:07', '2025-08-08 03:48:07', 0.00, 0, 0, 0, 0, 0, 0),
(456, 456, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 05:02:12', '2025-08-08 05:12:48', 0.00, 0, 0, 0, 0, 0, 0),
(457, 457, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 07:31:58', '2025-08-08 07:31:58', 0.00, 0, 0, 0, 0, 0, 0),
(458, 458, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 07:40:59', '2025-08-08 07:40:59', 0.00, 0, 0, 0, 0, 0, 0),
(459, 459, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 10:29:47', '2025-08-08 10:31:12', 0.00, 0, 0, 0, 0, 0, 0),
(460, 460, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 14:55:37', '2025-08-08 14:56:21', 0.00, 0, 0, 0, 0, 0, 0),
(461, 461, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 22:11:41', '2025-08-08 22:12:40', 0.00, 0, 0, 0, 0, 0, 0),
(462, 462, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 22:42:54', '2025-08-08 22:42:54', 0.00, 0, 0, 0, 0, 0, 0),
(463, 463, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-08 22:53:31', '2025-08-08 22:53:31', 0.00, 0, 0, 0, 0, 0, 0),
(464, 464, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-09 15:44:25', '2025-08-09 15:44:25', 0.00, 0, 0, 0, 0, 0, 0),
(465, 465, 'BRL', 'R$', 40.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-09 20:45:26', '2025-08-09 20:46:19', 0.00, 0, 0, 0, 0, 0, 0),
(466, 466, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-09 20:51:26', '2025-08-09 20:51:26', 0.00, 0, 0, 0, 0, 0, 0),
(467, 467, 'BRL', 'R$', 30.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-09 22:38:38', '2025-08-09 22:45:07', 0.00, 0, 0, 0, 0, 0, 0),
(468, 468, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-09 22:59:14', '2025-08-09 22:59:14', 0.00, 0, 0, 0, 0, 0, 0),
(469, 469, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-10 02:21:29', '2025-08-10 03:19:37', 0.00, 0, 0, 0, 0, 0, 0),
(470, 470, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-10 03:37:49', '2025-08-10 03:38:33', 0.00, 0, 0, 0, 0, 0, 0),
(471, 471, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-10 03:39:58', '2025-08-10 03:39:58', 0.00, 0, 0, 0, 0, 0, 0),
(472, 472, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-10 04:28:15', '2025-08-10 04:28:15', 0.00, 0, 0, 0, 0, 0, 0),
(473, 473, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-10 04:32:08', '2025-08-10 04:32:08', 0.00, 0, 0, 0, 0, 0, 0),
(474, 474, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-10 05:47:17', '2025-08-10 05:47:17', 0.00, 0, 0, 0, 0, 0, 0),
(475, 475, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-12 17:33:21', '2025-08-12 17:33:21', 0.00, 0, 0, 0, 0, 0, 0),
(476, 476, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-12 18:07:45', '2025-08-12 18:09:09', 0.00, 0, 0, 0, 0, 0, 0),
(477, 477, 'BRL', 'R$', 150.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-08-14 00:59:36', '2025-08-14 01:00:32', 0.00, 0, 0, 0, 0, 0, 0),
(478, 478, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-04 15:59:46', '2025-09-04 16:00:25', 0.00, 0, 0, 0, 0, 0, 0),
(479, 479, 'BRL', 'R$', 0.00, 2.00, 0.00, 0.00, 2.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-04 16:29:20', '2025-09-04 16:30:25', 0.00, 0, 0, 0, 0, 0, 0),
(480, 480, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-04 18:05:32', '2025-09-04 18:05:32', 0.00, 0, 0, 0, 0, 0, 0),
(481, 481, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-04 18:45:45', '2025-09-04 18:47:11', 0.00, 0, 0, 0, 0, 0, 0),
(482, 482, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-04 23:08:18', '2025-09-04 23:11:21', 0.00, 0, 0, 0, 0, 0, 0),
(483, 483, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-05 00:23:00', '2025-09-05 00:23:00', 0.00, 0, 0, 0, 0, 0, 0),
(484, 484, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-05 00:28:30', '2025-09-05 00:54:30', 0.00, 0, 0, 0, 0, 0, 0),
(485, 485, 'BRL', 'R$', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-05 01:06:28', '2025-09-05 01:07:27', 0.00, 0, 0, 0, 0, 0, 0),
(486, 486, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-05 02:02:15', '2025-09-05 02:02:51', 0.00, 0, 0, 0, 0, 0, 0),
(487, 487, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-05 12:23:21', '2025-09-06 04:25:16', 0.00, 0, 0, 0, 0, 0, 0),
(488, 488, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-05 13:17:59', '2025-09-05 13:17:59', 0.00, 0, 0, 0, 0, 0, 0),
(489, 489, 'BRL', 'R$', 120.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-05 18:59:29', '2025-09-05 19:00:15', 0.00, 0, 0, 0, 0, 0, 0),
(490, 490, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-05 19:19:29', '2025-09-05 19:19:29', 0.00, 0, 0, 0, 0, 0, 0),
(491, 491, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-05 19:45:21', '2025-09-05 19:47:58', 0.00, 0, 0, 0, 0, 0, 0),
(492, 492, 'BRL', 'R$', 60.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-06 08:56:56', '2025-09-06 08:58:23', 0.00, 0, 0, 0, 0, 0, 0),
(493, 493, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-06 11:43:37', '2025-09-06 11:43:37', 0.00, 0, 0, 0, 0, 0, 0),
(494, 494, 'BRL', 'R$', 300.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-09 17:11:21', '2025-09-09 17:42:59', 0.00, 0, 0, 0, 0, 0, 0),
(495, 495, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-09 17:45:07', '2025-09-09 17:45:07', 0.00, 0, 0, 0, 0, 0, 0),
(496, 496, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-09 18:31:28', '2025-09-09 18:32:11', 0.00, 0, 0, 0, 0, 0, 0),
(497, 497, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-09 18:39:35', '2025-09-09 18:40:42', 0.00, 0, 0, 0, 0, 0, 0),
(498, 498, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-09 19:03:17', '2025-09-09 19:03:17', 0.00, 0, 0, 0, 0, 0, 0),
(499, 499, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-10 01:28:55', '2025-09-10 01:28:55', 0.00, 0, 0, 0, 0, 0, 0),
(500, 500, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-10 04:12:18', '2025-09-10 04:12:18', 0.00, 0, 0, 0, 0, 0, 0),
(501, 501, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-10 07:52:16', '2025-09-10 07:52:16', 0.00, 0, 0, 0, 0, 0, 0),
(502, 502, 'BRL', 'R$', 30.00, 5.00, 0.00, 0.00, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-10 16:05:34', '2025-09-10 16:29:35', 0.00, 0, 0, 0, 0, 0, 0),
(503, 503, 'BRL', 'R$', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-10 16:32:25', '2025-09-10 16:42:43', 0.00, 0, 0, 0, 0, 0, 0),
(504, 504, 'BRL', 'R$', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-10 17:44:24', '2025-09-10 17:57:14', 0.00, 0, 0, 0, 0, 0, 0),
(505, 505, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-10 22:30:23', '2025-09-10 22:30:23', 0.00, 0, 0, 0, 0, 0, 0),
(506, 506, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-11 02:16:53', '2025-09-11 02:32:59', 0.00, 0, 0, 0, 0, 0, 0),
(507, 507, 'BRL', 'R$', 30.00, 7.00, 0.00, 0.00, 7.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-11 02:31:51', '2025-09-11 03:31:11', 0.00, 0, 0, 0, 0, 0, 0),
(508, 508, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-11 02:55:01', '2025-09-11 02:55:01', 0.00, 0, 0, 0, 0, 0, 0),
(509, 509, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-11 03:23:00', '2025-09-11 03:23:00', 0.00, 0, 0, 0, 0, 0, 0),
(510, 510, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-11 04:02:09', '2025-09-11 04:02:09', 0.00, 0, 0, 0, 0, 0, 0),
(511, 511, 'BRL', 'R$', 120.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2025-09-11 18:07:19', '2025-09-11 18:08:34', 0.00, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallet_changes`
--

CREATE TABLE `wallet_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `change` varchar(50) DEFAULT NULL,
  `value_bonus` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_roi` decimal(20,2) NOT NULL DEFAULT 0.00,
  `value_entry` decimal(20,2) NOT NULL DEFAULT 0.00,
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT 0.00,
  `game` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(191) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) DEFAULT NULL,
  `proof` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `pix_key` varchar(191) DEFAULT NULL,
  `pix_type` varchar(191) DEFAULT NULL,
  `bank_info` text DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cpf` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_histories_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `affiliate_histories_inviter_index` (`inviter`) USING BTREE;

--
-- Índices de tabela `affiliate_logs`
--
ALTER TABLE `affiliate_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_logs_user_id` (`user_id`);

--
-- Índices de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_withdraws_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `bet_histories`
--
ALTER TABLE `bet_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bet_histories_user_id_index` (`user_id`);

--
-- Índices de tabela `bs_pays`
--
ALTER TABLE `bs_pays`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `casino_categories_slug_unique` (`slug`) USING BTREE;

--
-- Índices de tabela `category_game`
--
ALTER TABLE `category_game`
  ADD KEY `category_games_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `category_games_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `configs_playfiver`
--
ALTER TABLE `configs_playfiver`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Índices de tabela `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `currency_alloweds_currency_id_foreign` (`currency_id`) USING BTREE;

--
-- Índices de tabela `custom_layouts`
--
ALTER TABLE `custom_layouts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `daily_bonus_claims`
--
ALTER TABLE `daily_bonus_claims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_claims_idx` (`user_id`);

--
-- Índices de tabela `daily_bonus_configs`
--
ALTER TABLE `daily_bonus_configs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `deposits_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `digito_pay`
--
ALTER TABLE `digito_pay`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `distribution_systems`
--
ALTER TABLE `distribution_systems`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ezzepay`
--
ALTER TABLE `ezzepay`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `games_provider_id_index` (`provider_id`),
  ADD KEY `games_game_code_index` (`game_code`);

--
-- Índices de tabela `games_keys`
--
ALTER TABLE `games_keys`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `game_configs`
--
ALTER TABLE `game_configs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `game_favorites_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_favorites_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_likes`
--
ALTER TABLE `game_likes`
  ADD UNIQUE KEY `game_likes_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_likes_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_open_configs`
--
ALTER TABLE `game_open_configs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `game_reviews`
--
ALTER TABLE `game_reviews`
  ADD UNIQUE KEY `game_reviews_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_reviews_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggr_games_fivers`
--
ALTER TABLE `ggr_games_fivers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_fivers_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_world_slots_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `likes_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `likes_liked_user_id_foreign` (`liked_user_id`) USING BTREE;

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mission_users`
--
ALTER TABLE `mission_users`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE;

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE;

--
-- Índices de tabela `promocoes`
--
ALTER TABLE `promocoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sub_affiliates_affiliate_id_index` (`affiliate_id`) USING BTREE,
  ADD KEY `sub_affiliates_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `suit_pay_payments_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `suit_pay_payments_withdrawal_id_foreign` (`withdrawal_id`) USING BTREE;

--
-- Índices de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `transactions_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Índices de tabela `user_vips`
--
ALTER TABLE `user_vips`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallets_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallet_changes_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdrawals_user_id_foreign` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `affiliate_logs`
--
ALTER TABLE `affiliate_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `bet_histories`
--
ALTER TABLE `bet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `bs_pays`
--
ALTER TABLE `bs_pays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `configs_playfiver`
--
ALTER TABLE `configs_playfiver`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `cupons`
--
ALTER TABLE `cupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `custom_layouts`
--
ALTER TABLE `custom_layouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `daily_bonus_claims`
--
ALTER TABLE `daily_bonus_claims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `daily_bonus_configs`
--
ALTER TABLE `daily_bonus_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT de tabela `digito_pay`
--
ALTER TABLE `digito_pay`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `distribution_systems`
--
ALTER TABLE `distribution_systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ezzepay`
--
ALTER TABLE `ezzepay`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1449;

--
-- AUTO_INCREMENT de tabela `games_keys`
--
ALTER TABLE `games_keys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `game_configs`
--
ALTER TABLE `game_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `game_open_configs`
--
ALTER TABLE `game_open_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `ggr_games_fivers`
--
ALTER TABLE `ggr_games_fivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de tabela `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `mission_users`
--
ALTER TABLE `mission_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `promocoes`
--
ALTER TABLE `promocoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT de tabela `user_vips`
--
ALTER TABLE `user_vips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador único', AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `vips`
--
ALTER TABLE `vips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

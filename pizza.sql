-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Dec 21. 18:01
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `pizza`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_price` int(11) NOT NULL,
  `delivery_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) NOT NULL,
  `is_ready` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_data`, `email`, `shipping_price`, `delivery_method`, `total`, `is_ready`, `created_at`, `updated_at`) VALUES
(5, 4, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"\",\"email\":\"farkasbence2@gmail.com\",\"delivery-method\":\"kiszallitas\"}', 'farkasbence2@gmail.com', 1000, 'kiszallitas', 2500, 0, '2022-08-21 17:50:27', NULL),
(6, 4, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'farkasbence@gmail.com', 0, 'szemelyes', 2300, 0, '2022-08-24 17:16:18', NULL),
(7, 4, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence2@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'farkasbence2@gmail.com', 0, 'szemelyes', 2300, 0, '2022-08-24 17:48:59', NULL),
(10, 4, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence2@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'farkasbence2@gmail.com', 0, 'szemelyes', 2500, 0, '2022-08-24 17:56:50', NULL),
(11, 5, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"kiszallitas\"}', 'farkasbence@gmail.com', 1000, 'kiszallitas', 5100, 0, '2022-08-24 17:57:54', NULL),
(12, 5, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"kiszallitas\"}', 'farkasbence@gmail.com', 1000, 'kiszallitas', 4800, 0, '2022-08-24 18:02:18', NULL),
(13, 5, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"kiszallitas\"}', 'farkasbence@gmail.com', 1000, 'kiszallitas', 2300, 1, '2022-08-24 18:21:48', '2022-08-25 19:24:27'),
(14, 5, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"kiszallitas\"}', 'farkasbence@gmail.com', 1000, 'kiszallitas', 14200, 1, '2022-08-24 18:22:22', '2022-08-25 19:22:45'),
(15, 4, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence2@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'farkasbence2@gmail.com', 0, 'szemelyes', 7100, 1, '2022-09-05 15:21:28', '2022-10-03 21:26:13'),
(16, 0, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'farkasbence@gmail.com', 0, 'szemelyes', 6600, 1, '2022-09-28 15:16:13', '2022-09-28 15:16:43'),
(17, 0, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence2@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'farkasbence2@gmail.com', 0, 'szemelyes', 3900, 1, '2022-10-03 21:24:51', '2022-10-03 21:25:13'),
(18, 0, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'farkasbence@gmail.com', 0, 'szemelyes', 2200, 0, '2022-10-06 23:16:48', NULL),
(19, 0, '{\"first_name\":\"Teszt\",\"last_name\":\"Elek\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Teszt Elek\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"Farkasbence2@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'Farkasbence2@gmail.com', 0, 'szemelyes', 2300, 1, '2022-10-17 16:33:38', '2022-10-17 16:51:43'),
(20, 5, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"1\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"1\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"kiszallitas\"}', 'farkasbence@gmail.com', 1000, 'kiszallitas', 2600, 1, '2022-10-21 16:10:45', '2022-10-21 16:10:55'),
(21, 0, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"kiszallitas\"}', 'farkasbence@gmail.com', 1000, 'kiszallitas', 4100, 0, '2022-10-21 16:32:47', NULL),
(23, 0, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"kiszallitas\"}', 'farkasbence@gmail.com', 1000, 'kiszallitas', 1800, 1, '2022-10-23 11:34:07', '2022-10-23 11:34:21'),
(24, 0, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"farkasbence@gmail.com\",\"delivery-method\":\"kiszallitas\"}', 'farkasbence@gmail.com', 1000, 'kiszallitas', 10200, 0, '2022-10-23 11:42:33', NULL),
(25, 10, '{\"first_name\":\"TesztVeznév001\",\"last_name\":\"TesztKernév001\",\"shipping_zip\":\"1010\",\"shipping_city\":\"Budapest\",\"shipping_street\":\"Teszt utca\",\"shipping_nr\":\"10\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"TesztVeznév001 TesztKernév001\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1010\",\"billing_city\":\"Budapest\",\"billing_street\":\"Teszt utca\",\"billing_nr\":\"10\",\"email\":\"teszt@teszt.hu\",\"delivery-method\":\"kiszallitas\"}', 'teszt@teszt.hu', 1000, 'kiszallitas', 4900, 0, '2022-12-03 11:14:03', NULL),
(26, 0, '{\"first_name\":\"TesztVeznév001\",\"last_name\":\"TesztKernév001\",\"shipping_zip\":\"1010\",\"shipping_city\":\"Budapest\",\"shipping_street\":\"Teszt utca\",\"shipping_nr\":\"1\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"TesztVeznév001 TesztKernév001\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1010\",\"billing_city\":\"Budapest\",\"billing_street\":\"Teszt utca\",\"billing_nr\":\"1\",\"email\":\"teszt@teszt.hu\",\"delivery-method\":\"kiszallitas\"}', 'teszt@teszt.hu', 1000, 'kiszallitas', 7000, 0, '2022-12-03 11:42:38', NULL),
(27, 0, '{\"first_name\":\"TesztVeznév001\",\"last_name\":\"TesztKernév001\",\"shipping_zip\":\"1010\",\"shipping_city\":\"Budapest\",\"shipping_street\":\"Teszt utca\",\"shipping_nr\":\"10\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"TesztVeznév001 TesztKernév001\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1010\",\"billing_city\":\"Budapest\",\"billing_street\":\"Teszt utca\",\"billing_nr\":\"10\",\"email\":\"teszt@teszt.hu\",\"delivery-method\":\"kiszallitas\"}', 'teszt@teszt.hu', 1000, 'kiszallitas', 2300, 1, '2022-12-03 11:44:48', '2022-12-14 19:58:22'),
(28, 11, '{\"first_name\":\"TesztVeznév001\",\"last_name\":\"TesztKernév001\",\"shipping_zip\":\"1010\",\"shipping_city\":\"Budapest\",\"shipping_street\":\"Teszt utca\",\"shipping_nr\":\"10\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"TesztVeznév001 TesztKernév001\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1010\",\"billing_city\":\"Budapest\",\"billing_street\":\"Teszt utca\",\"billing_nr\":\"10\",\"email\":\"teszt@teszt.hu\",\"delivery-method\":\"kiszallitas\"}', 'teszt@teszt.hu', 1000, 'kiszallitas', 2200, 1, '2022-12-03 11:47:11', '2022-12-03 12:02:57'),
(29, 5, '{\"first_name\":\"Farkas\",\"last_name\":\"Bence\",\"shipping_zip\":\"1028\",\"shipping_city\":\"Budapest, II.\",\"shipping_street\":\"Máriaremetei Út 11\",\"shipping_nr\":\"11\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Farkas Bence\",\"billing_tax_nr\":\"\",\"billing_zip\":\"1028\",\"billing_city\":\"Budapest, II.\",\"billing_street\":\"Máriaremetei Út 11\",\"billing_nr\":\"11\",\"email\":\"teszt@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'teszt@gmail.com', 0, 'szemelyes', 2300, 0, '2022-12-14 20:00:01', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `order_pizzas`
--

CREATE TABLE `order_pizzas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pizza_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `pizza_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topping_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`topping_list`)),
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `order_pizzas`
--

INSERT INTO `order_pizzas` (`id`, `pizza_id`, `order_id`, `pizza_name`, `topping_list`, `size`, `price`, `quantity`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Songoku', '[{\"id\":\"2\",\"name\":\"Sonka\",\"created_at\":null,\"updated_at\":null},{\"id\":\"6\",\"name\":\"Gomba\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"11\",\"name\":\"Kukorica\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2600, 1, 2600, '2022-08-15 09:27:32', NULL),
(2, 2, 1, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2200, 10, 22000, '2022-08-15 09:27:32', NULL),
(3, 1, 1, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szalu00e1mi\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-08-15 09:27:32', NULL),
(4, 2, 2, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2200, 1, 2200, '2022-08-15 09:31:41', NULL),
(5, 4, 3, 'Magyaros', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"9\",\"name\":\"Kolbu00e1sz\",\"created_at\":null,\"updated_at\":null},{\"id\":\"7\",\"name\":\"Bacon\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null},{\"id\":\"10\",\"name\":\"Csemegeuborka\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2500, 5, 12500, '2022-08-15 09:33:38', NULL),
(6, 2, 4, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2200, 1, 2200, '2022-08-15 18:32:06', NULL),
(7, 3, 4, 'Songoku', '[{\"id\":\"2\",\"name\":\"Sonka\",\"created_at\":null,\"updated_at\":null},{\"id\":\"6\",\"name\":\"Gomba\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"11\",\"name\":\"Kukorica\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2600, 1, 2600, '2022-08-15 18:32:06', NULL),
(8, 4, 4, 'Magyaros', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"9\",\"name\":\"Kolbu00e1sz\",\"created_at\":null,\"updated_at\":null},{\"id\":\"7\",\"name\":\"Bacon\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null},{\"id\":\"10\",\"name\":\"Csemegeuborka\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2500, 1, 2500, '2022-08-15 18:32:06', NULL),
(9, 4, 5, 'Magyaros', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"9\",\"name\":\"Kolbu00e1sz\",\"created_at\":null,\"updated_at\":null},{\"id\":\"7\",\"name\":\"Bacon\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null},{\"id\":\"10\",\"name\":\"Csemegeuborka\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2500, 1, 2500, '2022-08-21 17:50:27', NULL),
(10, 1, 6, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szalu00e1mi\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-08-24 17:16:18', NULL),
(11, 1, 0, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szalu00e1mi\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-08-24 17:50:39', NULL),
(12, 4, 10, 'Magyaros', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"9\",\"name\":\"Kolbu00e1sz\",\"created_at\":null,\"updated_at\":null},{\"id\":\"7\",\"name\":\"Bacon\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null},{\"id\":\"10\",\"name\":\"Csemegeuborka\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2500, 1, 2500, '2022-08-24 17:56:50', NULL),
(13, 4, 11, 'Magyaros', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"9\",\"name\":\"Kolbu00e1sz\",\"created_at\":null,\"updated_at\":null},{\"id\":\"7\",\"name\":\"Bacon\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null},{\"id\":\"10\",\"name\":\"Csemegeuborka\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2500, 1, 2500, '2022-08-24 17:57:54', NULL),
(14, 3, 11, 'Songoku', '[{\"id\":\"2\",\"name\":\"Sonka\",\"created_at\":null,\"updated_at\":null},{\"id\":\"6\",\"name\":\"Gomba\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"11\",\"name\":\"Kukorica\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2600, 1, 2600, '2022-08-24 17:57:54', NULL),
(15, 1, 12, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szalami\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-08-24 18:02:18', NULL),
(16, 4, 12, 'Magyaros', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"9\",\"name\":\"Kolbasz\",\"created_at\":null,\"updated_at\":null},{\"id\":\"7\",\"name\":\"Bacon\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null},{\"id\":\"10\",\"name\":\"Csemegeuborka\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2500, 1, 2500, '2022-08-24 18:02:18', NULL),
(17, 1, 13, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szálami\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-08-24 18:21:48', NULL),
(18, 2, 14, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2200, 1, 2200, '2022-08-24 18:22:22', NULL),
(19, 3, 14, 'Songoku', '[{\"id\":\"2\",\"name\":\"Sonka\",\"created_at\":null,\"updated_at\":null},{\"id\":\"6\",\"name\":\"Gomba\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"11\",\"name\":\"Kukorica\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2600, 1, 2600, '2022-08-24 18:22:22', NULL),
(20, 4, 14, 'Magyaros', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"9\",\"name\":\"Kolbász\",\"created_at\":null,\"updated_at\":null},{\"id\":\"7\",\"name\":\"Bacon\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null},{\"id\":\"10\",\"name\":\"Csemegeuborka\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2500, 1, 2500, '2022-08-24 18:22:22', NULL),
(21, 1, 14, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szálami\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 3, 6900, '2022-08-24 18:22:22', NULL),
(22, 2, 15, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2200, 1, 2200, '2022-09-05 15:21:28', NULL),
(23, 3, 15, 'Songoku', '[{\"id\":\"2\",\"name\":\"Sonka\",\"created_at\":null,\"updated_at\":null},{\"id\":\"6\",\"name\":\"Gomba\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"11\",\"name\":\"Kukorica\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2600, 1, 2600, '2022-09-05 15:21:28', NULL),
(24, 1, 15, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szálami\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-09-05 15:21:28', NULL),
(25, 2, 16, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2200, 3, 6600, '2022-09-28 15:16:13', NULL),
(26, 2, 17, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Nagy', 3900, 1, 3900, '2022-10-03 21:24:51', NULL),
(27, 2, 18, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2200, 1, 2200, '2022-10-06 23:16:48', NULL),
(28, 1, 19, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szálami\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-10-17 16:33:38', NULL),
(29, 3, 20, 'Songoku', '[{\"id\":\"2\",\"name\":\"Sonka\",\"created_at\":null,\"updated_at\":null},{\"id\":\"6\",\"name\":\"Gomba\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"11\",\"name\":\"Kukorica\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2600, 1, 2600, '2022-10-21 16:10:45', NULL),
(30, 1, 21, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szálami\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Nagy', 4100, 1, 4100, '2022-10-21 16:32:47', NULL),
(31, 4, 22, 'Magyaros', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"9\",\"name\":\"Kolbász\",\"created_at\":null,\"updated_at\":null},{\"id\":\"7\",\"name\":\"Bacon\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null},{\"id\":\"10\",\"name\":\"Csemegeuborka\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2500, 1, 2500, '2022-10-21 16:42:14', NULL),
(32, 2, 22, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2200, 1, 2200, '2022-10-21 16:42:14', NULL),
(33, 5, 23, 'paradicsomos', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 1800, 1, 1800, '2022-10-23 11:34:07', NULL),
(34, 6, 24, 'pármai', '[{\"id\":\"12\",\"name\":\"Pármai sonka\",\"created_at\":null,\"updated_at\":null},{\"id\":\"13\",\"name\":\"Rukkola\",\"created_at\":null,\"updated_at\":null}]', 'Nagy', 3400, 3, 10200, '2022-10-23 11:42:33', NULL),
(35, 3, 25, 'Songoku', '[{\"id\":\"2\",\"name\":\"Sonka\",\"created_at\":null,\"updated_at\":null},{\"id\":\"6\",\"name\":\"Gomba\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"11\",\"name\":\"Kukorica\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2600, 1, 2600, '2022-12-03 11:14:03', NULL),
(36, 1, 25, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szálami\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-12-03 11:14:03', NULL),
(37, 5, 26, 'Paradicsomos', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 1800, 1, 1800, '2022-12-03 11:42:38', NULL),
(38, 3, 26, 'Songoku', '[{\"id\":\"2\",\"name\":\"Sonka\",\"created_at\":null,\"updated_at\":null},{\"id\":\"6\",\"name\":\"Gomba\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"11\",\"name\":\"Kukorica\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2600, 2, 5200, '2022-12-03 11:42:38', NULL),
(39, 1, 27, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szálami\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-12-03 11:44:48', NULL),
(40, 2, 28, 'Mexicoi', '[{\"id\":\"5\",\"name\":\"Bab\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"4\",\"name\":\"Csirke\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2200, 1, 2200, '2022-12-03 11:47:11', NULL),
(41, 1, 29, 'Suprame', '[{\"id\":\"3\",\"name\":\"Szálami\",\"created_at\":null,\"updated_at\":null},{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2300, 1, 2300, '2022-12-14 20:00:01', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzas`
--

CREATE TABLE `pizzas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hot_deal` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `pizzas`
--

INSERT INTO `pizzas` (`id`, `url`, `name`, `image`, `description`, `hot_deal`, `created_at`, `updated_at`) VALUES
(1, 'suprame', 'Suprame', '1.jpg', '', 1, NULL, NULL),
(2, 'mexicoi', 'Mexicoi', '2.jpg', '', 1, NULL, NULL),
(3, 'songoku', 'Songoku', '3.jpg', '', 1, NULL, NULL),
(4, 'magyaros', 'Magyaros', '5.jpg', '', 1, NULL, NULL),
(5, 'paradicsomos', 'Paradicsomos', '12.jpg', '', 0, NULL, NULL),
(6, 'parmai', 'Pármai', '11.jpg', '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzas_sizes`
--

CREATE TABLE `pizzas_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pizza_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `pizzas_sizes`
--

INSERT INTO `pizzas_sizes` (`id`, `pizza_id`, `size_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2300, NULL, NULL),
(2, 1, 2, 4100, NULL, NULL),
(3, 2, 1, 2200, NULL, NULL),
(4, 2, 2, 3900, NULL, NULL),
(5, 3, 1, 2600, NULL, NULL),
(6, 3, 2, 4500, NULL, NULL),
(7, 4, 1, 2500, NULL, NULL),
(8, 4, 2, 4300, NULL, NULL),
(0, 5, 1, 1800, NULL, NULL),
(0, 5, 2, 2600, NULL, NULL),
(0, 6, 1, 2300, NULL, NULL),
(0, 6, 2, 3400, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizzas_toppings`
--

CREATE TABLE `pizzas_toppings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pizza_id` bigint(20) UNSIGNED NOT NULL,
  `topping_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `pizzas_toppings`
--

INSERT INTO `pizzas_toppings` (`id`, `pizza_id`, `topping_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, NULL),
(2, 1, 1, NULL, NULL),
(3, 2, 5, NULL, NULL),
(4, 2, 1, NULL, NULL),
(5, 2, 4, NULL, NULL),
(6, 3, 2, NULL, NULL),
(7, 3, 6, NULL, NULL),
(8, 3, 1, NULL, NULL),
(9, 3, 11, NULL, NULL),
(10, 4, 1, NULL, NULL),
(11, 4, 9, NULL, NULL),
(12, 4, 7, NULL, NULL),
(13, 4, 8, NULL, NULL),
(14, 4, 10, NULL, NULL),
(0, 5, 1, NULL, NULL),
(0, 5, 8, NULL, NULL),
(0, 6, 12, NULL, NULL),
(0, 6, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `default`, `created_at`, `updated_at`) VALUES
(1, 'Normál', 1, NULL, NULL),
(2, 'Nagy', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `toppings`
--

CREATE TABLE `toppings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `toppings`
--

INSERT INTO `toppings` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sajt', NULL, NULL),
(2, 'Sonka', NULL, NULL),
(3, 'Szálami', NULL, NULL),
(4, 'Csirke', NULL, NULL),
(5, 'Bab', NULL, NULL),
(6, 'Gomba', NULL, NULL),
(7, 'Bacon', NULL, NULL),
(8, 'Paradicsom', NULL, NULL),
(9, 'Kolbász', NULL, NULL),
(10, 'Csemegeuborka', NULL, NULL),
(11, 'Kukorica', NULL, NULL),
(12, 'Pármai sonka', NULL, NULL),
(13, 'Rukkola', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 0,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_zip` int(11) NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_nr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_tax_nr` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_zip` int(11) NOT NULL,
  `billing_nr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_token` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `is_admin`, `first_name`, `last_name`, `email`, `new_email`, `email_verified_at`, `password`, `shipping_zip`, `shipping_city`, `shipping_street`, `shipping_nr`, `billing_name`, `billing_tax_nr`, `billing_zip`, `billing_nr`, `billing_street`, `billing_city`, `remember_token`, `verification_token`, `created_at`, `updated_at`) VALUES
(3, 0, 'Farkas', 'Bence', 'asds@gmail.com', NULL, '2022-08-20 02:34:28', 'c334246cfc6455f1e084c7646a04f432', 0, '', '', NULL, NULL, NULL, 0, NULL, '', '', NULL, NULL, '2022-08-20 00:34:28', '2022-12-14 19:58:35'),
(4, 1, 'Farkas', 'Bence', 'farkasbence2@gmail.com', NULL, '2022-08-21 16:24:57', 'c334246cfc6455f1e084c7646a04f432', 0, '', '', NULL, NULL, NULL, 0, NULL, '', '', NULL, NULL, '2022-08-21 14:24:57', '2022-08-21 17:33:50'),
(5, 1, 'Farkas', 'Bence', 'farkasbence@gmail.com', NULL, '2022-08-24 19:57:30', 'c334246cfc6455f1e084c7646a04f432', 0, '', '', NULL, NULL, NULL, 0, NULL, '', '', NULL, NULL, '2022-08-24 17:57:30', '2022-08-24 18:00:34'),
(7, 0, 'teszt', 'teszt', 'teszt@gmail.com', NULL, '2022-08-25 21:31:43', '7815696ecbf1c96e6894b779456d330e', 0, '', '', NULL, NULL, NULL, 0, NULL, '', '', NULL, NULL, '2022-08-25 19:31:43', NULL),
(8, 0, 'Nagy', 'Aladár', 'nagyaladar@gmail.com', NULL, '2022-10-21 18:38:19', 'a125f852854bff5d6d876183b1a2562c', 0, '', '', NULL, NULL, NULL, 0, NULL, '', '', NULL, NULL, '2022-10-21 16:38:19', NULL),
(11, 1, 'TesztVeznév1', 'TesztKernév1', 'teszt@teszt.hu', NULL, '2022-12-03 12:25:46', 'a152e841783914146e4bcd4f39100686', 0, '', '', NULL, NULL, NULL, 0, NULL, '', '', NULL, NULL, '2022-12-03 11:25:46', '2022-12-03 11:56:55');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `order_pizzas`
--
ALTER TABLE `order_pizzas`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- A tábla indexei `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `toppings`
--
ALTER TABLE `toppings`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT a táblához `order_pizzas`
--
ALTER TABLE `order_pizzas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Aug 15. 20:55
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `pizzarendelo_bead`
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
(1, 2, '{\"first_name\":\"Kis\",\"last_name\":\"Pu00e9ter\",\"shipping_zip\":\"4400\",\"shipping_city\":\"Kecskemu00e9t\",\"shipping_street\":\"Lu00f3\",\"shipping_nr\":\"10\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Kis Pu00e9ter\",\"billing_tax_nr\":\"\",\"billing_zip\":\"4400\",\"billing_city\":\"Kecskemu00e9t\",\"billing_street\":\"Lu00f3\",\"billing_nr\":\"10\",\"email\":\"burai.sandor@gmail.com\",\"delivery-method\":\"szemelyes\"}', 'burai.sandor@gmail.com', 0, 'szemelyes', 26900, 0, '2022-08-15 09:27:32', '2022-08-15 09:32:19'),
(2, 1, '', 'totlajos@gmail.com', 1000, 'kiszallitas', 2200, 0, '2022-08-15 09:31:41', NULL),
(3, 2, '', 'burai.sandor@gmail.com', 1000, 'kiszallitas', 12500, 1, '2022-08-15 09:33:38', '2022-08-15 09:41:18'),
(4, 0, '{\"first_name\":\"Kis \",\"last_name\":\"Elek\",\"shipping_zip\":\"6500\",\"shipping_city\":\"baja\",\"shipping_street\":\"kecske\",\"shipping_nr\":\"10\",\"copy-shipping-billing\":\"on\",\"billing_name\":\"Kis  Elek\",\"billing_tax_nr\":\"\",\"billing_zip\":\"6500\",\"billing_city\":\"baja\",\"billing_street\":\"kecske\",\"billing_nr\":\"10\",\"email\":\"kis@elek.hu\",\"delivery-method\":\"kiszallitas\"}', 'kis@elek.hu', 1000, 'kiszallitas', 7300, 0, '2022-08-15 18:32:06', NULL);

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
(8, 4, 4, 'Magyaros', '[{\"id\":\"1\",\"name\":\"Sajt\",\"created_at\":null,\"updated_at\":null},{\"id\":\"9\",\"name\":\"Kolbu00e1sz\",\"created_at\":null,\"updated_at\":null},{\"id\":\"7\",\"name\":\"Bacon\",\"created_at\":null,\"updated_at\":null},{\"id\":\"8\",\"name\":\"Paradicsom\",\"created_at\":null,\"updated_at\":null},{\"id\":\"10\",\"name\":\"Csemegeuborka\",\"created_at\":null,\"updated_at\":null}]', 'Normál', 2500, 1, 2500, '2022-08-15 18:32:06', NULL);

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
(4, 'magyaros', 'Magyaros', '5.jpg', '', 1, NULL, NULL);

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
(8, 4, 2, 4300, NULL, NULL);

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
(14, 4, 10, NULL, NULL);

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
(3, 'Szalámi', NULL, NULL),
(4, 'Csirke', NULL, NULL),
(5, 'Bab', NULL, NULL),
(6, 'Gomba', NULL, NULL),
(7, 'Bacon', NULL, NULL),
(8, 'Paradicsom', NULL, NULL),
(9, 'Kolbász', NULL, NULL),
(10, 'Csemegeuborka', NULL, NULL),
(11, 'Kukorica', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 0,
  `type` enum('user','guest') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'guest',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
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

INSERT INTO `users` (`id`, `is_admin`, `type`, `first_name`, `last_name`, `email`, `new_email`, `email_verified_at`, `password`, `shipping_zip`, `shipping_city`, `shipping_street`, `shipping_nr`, `billing_name`, `billing_tax_nr`, `billing_zip`, `billing_nr`, `billing_street`, `billing_city`, `remember_token`, `verification_token`, `created_at`, `updated_at`) VALUES
(1, 0, 'guest', 'tót', 'lajos', 'totlajos@gmail.com', NULL, '2022-08-15 09:29:22', 'bad670f05ad869901d90a37aef62572c', 0, '', '', NULL, NULL, NULL, 0, NULL, '', '', NULL, NULL, '2022-08-15 09:29:22', '2022-08-15 09:30:41'),
(2, 1, 'guest', 'Kis', 'Péter', 'burai.sandor@gmail.com', NULL, '2022-08-15 09:32:19', '49295e81560f25ecdb7db6d860a31f77', 0, '', '', NULL, NULL, NULL, 0, NULL, '', '', NULL, NULL, '2022-08-15 09:32:19', '2022-08-15 09:35:32');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `order_pizzas`
--
ALTER TABLE `order_pizzas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

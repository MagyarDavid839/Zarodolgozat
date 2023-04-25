-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Ápr 11. 23:35
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fos_db`
--
CREATE DATABASE IF NOT EXISTS `fos_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fos_db`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `food_customer`
--

CREATE TABLE `food_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `food_customer`
--

INSERT INTO `food_customer` (`id`, `name`, `email`, `password`, `phone`, `address`) VALUES
(12, 'Dávid', 'magyar.david@gmail.com', 'd5c3660f5b33d8c6d13cbf70a8a1681f', '067040444', 'Teljes cimem');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `food_items`
--

CREATE TABLE `food_items` (
  `id` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `images` varchar(200) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'ENABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `food_items`
--

INSERT INTO `food_items` (`id`, `name`, `price`, `description`, `images`, `status`) VALUES
(1, 'Burger', 1850, '', './images/burger.jfif', 'ENABLE'),
(2, 'Sült Krumpli', 460, 'Fincsi', './images/fries.jfif', 'ENABLE'),
(3, 'Nachos', 850, 'Fincsi', './images/nachos.jpg', 'ENABLE'),
(4, 'Pizza', 2290, 'Fincsi', './images/pizza.jfif', 'ENABLE'),
(5, 'Sült csirke', 2890, 'Fincsi', './images/fried-chicken.png', 'ENABLE'),
(6, 'Grill csirke', 3290, 'Fincsi', './images/grilled-chicken.jpg', 'ENABLE'),
(7, 'sertés', 3470, 'Fincsi', './images/roasted-pork-billy.jpg', 'ENABLE');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `food_orders`
--

CREATE TABLE `food_orders` (
  `id` int(30) NOT NULL,
  `item_id` int(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `order_date` date NOT NULL,
  `order_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `food_orders`
--

INSERT INTO `food_orders` (`id`, `item_id`, `name`, `price`, `quantity`, `order_date`, `order_id`) VALUES
(5, 3, 'Nachos', 850, 1, '2023-04-10', '399597193025733179'),
(6, 2, 'Sült Krumpli', 460, 1, '2023-04-10', '399597193025733179'),
(7, 1, 'Burger', 1850, 1, '2023-04-10', '100526678285887685'),
(8, 2, 'Sült Krumpli', 460, 1, '2023-04-10', '906450863612724734'),
(9, 2, 'Sült Krumpli', 460, 1, '2023-04-10', '274171892930561927'),
(10, 2, 'Sült Krumpli', 460, 1, '2023-04-10', '365870514953212931');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `food_customer`
--
ALTER TABLE `food_customer`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `food_orders`
--
ALTER TABLE `food_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `food_customer`
--
ALTER TABLE `food_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `food_items`
--
ALTER TABLE `food_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `food_orders`
--
ALTER TABLE `food_orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `food_orders`
--
ALTER TABLE `food_orders`
  ADD CONSTRAINT `item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `food_items` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

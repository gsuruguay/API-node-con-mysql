-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-08-2021 a las 18:33:28
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_node_con_mysql`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authors`
--

CREATE TABLE `authors` (
  `id` int(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `authors`
--

INSERT INTO `authors` (`id`, `name`, `country`) VALUES
(1, 'Plasencia Juan Luis', 'España'),
(2, 'Bazilian Eric', 'Pensilvania'),
(3, 'Llorens Antonia', 'Italia'),
(4, 'Richter Helmut', 'Alemania'),
(5, 'Leverling, Janet', 'Londres'),
(6, 'Bertomeu, Andrés', 'Argentina'),
(7, 'Sanabria, Carmelo', 'Colombia'),
(8, 'Wilde, Oscar', 'Irlanda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `isbn` bigint(15) UNSIGNED NOT NULL,
  `id_author` int(10) NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `name`, `isbn`, `id_author`, `status`) VALUES
(1, 'El tránsito terreno', 8412123101, 1, 1),
(2, 'Sistemas operativos', 8474891469, 2, 1),
(3, 'Poemas intrínsecos', 8430504737, 3, 1),
(4, 'Avances en Arquitectura', 8447301206, 4, 1),
(5, 'Las balas del bien!', 8420617040, 5, 1),
(7, 'La mente y el sentir', 8422621282, 1, 1),
(8, 'Ensayos póstumos', 8479083492, 6, 0),
(10, 'Ensayos póstumos', 847908349, 6, 0),
(11, 'La dualidad aparente', 8457802148, 7, 1),
(12, 'La importancia de llamarse Ernesto', 9780194235181, 8, 1),
(13, 'aaaaaaa', 555555555555, 8, 1),
(14, 'Guillermo suru', 55555566667, 8, 1),
(15, 'Guillermo suru', 18446744073709551615, 8, 1),
(18, 'Guillermo suru dgfgfgfgfgfgfgfgfg', 444444, 8, 1),
(23, 'Guillermo suru ', 4444446666777, 8, 1),
(24, 'Guillermo suru ', 44444466667778, 8, 1),
(25, 'Guillermo suru ', 444444666677789, 8, 1),
(27, 'Guillermo suru ', 44442222222258, 8, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `id_author` (`id_author`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`id_author`) REFERENCES `authors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

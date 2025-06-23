-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 23, 2025 at 07:31 PM
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
-- Database: `base_malibu`
--

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `subtitulo` text COLLATE utf8mb4_general_ci NOT NULL,
  `cuerpo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `img_id` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `titulo`, `subtitulo`, `cuerpo`, `img_id`) VALUES
(1, 'Malibu Cocktail', 'Malibu offers ready-to-drink canned cocktails including the Piña Colada, Strawberry Daiquiri, Peach Rum Punch, and Pineapple Bay Breeze. These pre-mixed options are convenient for a variety of occasions, including get-togethers, picnics, or simply enjoying at home.', '', 'a0ik2tl9hdshm1dibwfk'),
(3, 'Malibu Splash', 'Malibu Splash is a sparkling malt beverage that combines fruity flavors with a hint of coconut. Known for its freshness and tropical flavor, it\'s available in several flavors, including strawberry, pineapple, lime, passion fruit, and watermelon, all blended with coconut.', '', 'zdtz4ojcv7sif3mjby31'),
(11, 'Ready to Serve', 'Malibu Ready-to-Serve (RTS) cocktails are pre-mixed, bottled cocktails made with Malibu white rum, offering convenience and portability for enjoying popular drinks like Strawberry Daiquiri, Pineapple Bay Breeze, and Rum Punch. They are designed for easy serving over ice or straight from the bottle, making them ideal for gatherings or on-the-go occasions. ', NULL, 'sc7taxzrsayi37zfusrc'),
(12, 'Malibu Beer', 'Malibu Beer is a golden lager infused with a hint of natural coconut flavor, produced in the Caribbean and imported to the US by United States Beverage. It has a 5% ABV and is designed to offer a light, tropical taste. ', NULL, 'znc4e3cprysnceht6g3g'),
(13, 'Classic Malibu', 'Malibu is a coconut-flavored liqueur made with white rum, known for its smooth and sweet taste. It\'s a popular base for tropical cocktails like piña coladas and is often enjoyed on its own with ice. The product was created in 1978 and is known for its distinctive blend of Caribbean rum and natural coconut flavor. ', NULL, 'cpa14n2rrvcymwabvwwm');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'pedroantognozzi', '9d59e4e3078bf1f1d5e8dfb2a0a4c64f'),
(3, 'flavia', '81dc9bdb52d04dc20036dbd8313ed055');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

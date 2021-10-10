-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2021 a las 20:20:10
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `nameAutores` varchar(45) NOT NULL,
  `nacionalidad` varchar(45) NOT NULL,
  `id_autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`nameAutores`, `nacionalidad`, `id_autor`) VALUES
('Anthony Browne', 'Britanico', 1),
('Elsa Bornemann', 'Argentina', 2),
('Ema Wolf', 'Argentina', 3),
('Fran', 'ARgentino', 32),
('Graciela Montes', 'Argentina', 5),
('Maurice Sendak', 'Estadounidense', 6),
('Roald Dahl', 'Britanico', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `autor` varchar(45) NOT NULL,
  `anio_publicado` int(11) NOT NULL,
  `genero` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `titulo`, `autor`, `anio_publicado`, `genero`) VALUES
(2, 'Las Brujas ', 'Roald Dahl', 1985, 'Novela'),
(3, 'El Superzorro', 'Roald Dahl', 1977, 'Novela'),
(4, 'La maravillosa medicina de Jorge', 'Roald Dahl', 1983, 'Novela'),
(5, 'Charlie y la fábrica de chocolate', 'Roald Dahl', 1978, 'Novela'),
(6, 'La familia Delasoga', 'Graciela Montes', 1985, 'Cuento'),
(7, 'Doña Clementina Queridita, la Achicadora', 'Graciela Montes', 1985, 'Cuento'),
(8, '¡Socorro! 12 cuentos para caerse de miedo', 'Elsa Bornemann', 1988, 'Cuento'),
(9, 'Maruja', 'Ema Wolf', 1989, 'Novela'),
(10, 'Tengo un monstruo en el bolsillo', 'Graciela Montes', 1988, 'Novela'),
(11, 'Historias a Fernández ', 'Ema Wolf', 1994, 'Cuento'),
(12, 'Historia de un amor exagerado', 'Graciela Montes', 1987, 'Novela'),
(13, 'Willy el tímido', 'Anthony Browne', 1991, 'Cuento'),
(14, 'El túnel', 'Anthony Browne', 1993, 'Cuento'),
(15, 'Donde viven los monstruos', 'Maurice Sendak', 1977, 'Cuento'),
(30, 'Matilda', 'Roald Dahl', 1989, 'Novela'),
(31, 'PRUEBA', 'Fran', 1, 'TEST');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `user_password`) VALUES
(2, 'test1@gmail.com', '$2y$10$97546txtqz0A6Wjbk8Uc/eLS.AaXQ1oYzTsA/mI1pH6bPv4sMXbne'),
(3, 'test2@gmail.com', '$2y$10$ll6ZgiUcEDgMPWB9pYkCtuaSr9Qom0973FTRGWQIJa7Y9cxKF3TOK'),
(5, 'test3@gmail.com', '$2y$10$AmQ83jECnVbu.1aD/jO65./8sp/8wx8kwZb42MGhJ3uviIxfd08v.'),
(6, 'test@gmail.com', '$2y$10$C21m89eGnDHogysg0hg5quKS2b3j8q3rLhOAK0BCu3/tWZ3GvXPfe'),
(7, 'test5@gmail.com', '$2y$10$CH6v8g7P3YrHYIrdmZM/9uLmab/i0I8jnilgq4Pwew5nl2osRxlhy'),
(9, 'test6@gmail.com', '$2y$10$Rk5YS0tKiA/Sy3oAWUghreQnaUwoRAef8i/FepX0Nyad7BX/gszWm');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`nameAutores`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `autor` (`autor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `autores` (`nameAutores`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2021 a las 19:35:09
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
  `id_autor` int(11) NOT NULL,
  `nameAutores` varchar(45) NOT NULL,
  `nacionalidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id_autor`, `nameAutores`, `nacionalidad`) VALUES
(1, 'Roald Dahl', 'Britanico'),
(8, 'Anthony Browne', 'Britanico'),
(9, 'Elsa Bornemann', 'Argentina'),
(10, 'Ema Wolf', 'Argentina'),
(11, 'Graciela Montes', 'Argentina'),
(12, 'Maurice Sendak', 'Estadounidense');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `anio_publicado` int(11) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `fk_id_autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `titulo`, `anio_publicado`, `genero`, `fk_id_autor`) VALUES
(6, 'Las brujas', 1985, 'Novela', 1),
(8, 'Matilda', 1988, 'Novela', 1),
(22, 'El Superzorro', 1977, 'Novela', 1),
(23, 'La maravillosa medicina de Jorge', 1983, 'Novela', 1),
(24, 'Charlie y la fabrica de chocolates', 1978, 'Novela', 1),
(25, 'La familia Delasoga', 1985, 'Cuento', 11),
(26, 'Doña Clementina Queridita, la achicadora', 1985, 'Cuento', 11),
(27, 'Tengo un mounstruo en el bolsillo', 1988, 'Novela', 11),
(28, 'Historia de un amor exagerado', 1987, 'Novela', 11),
(29, 'Maruja', 1989, 'Novela', 10),
(30, 'Historia a Fernandez', 1994, 'Cuento', 10),
(31, '¡Socorro! 12 cuentos para caerse del miedo', 1988, 'Cuento', 9),
(32, 'El túnel', 1993, 'Cuento', 8),
(33, 'Willy el tímido', 1991, 'Cuento', 8),
(34, 'Donde viven los mounstruos', 1977, 'Cuento', 12);

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
(9, 'test6@gmail.com', '$2y$10$Rk5YS0tKiA/Sy3oAWUghreQnaUwoRAef8i/FepX0Nyad7BX/gszWm'),
(10, 'test7@gmail.com', '$2y$10$qy.vHh33e2Qx9iGa.eTu..7DY8x/P9.842W1b4iX41N73x5IVbjFa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `fk_id_autor` (`fk_id_autor`);

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
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`fk_id_autor`) REFERENCES `autores` (`id_autor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

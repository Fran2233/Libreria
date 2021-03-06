-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2021 a las 23:03:22
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
  `fk_id_autor` int(11) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `titulo`, `anio_publicado`, `genero`, `fk_id_autor`, `imagen`) VALUES
(6, 'Las brujas', 1985, 'Novela', 1, ''),
(8, 'Matilda', 1988, 'Novela', 1, ''),
(22, 'El Superzorro', 1977, 'Novela', 1, ''),
(23, 'La maravillosa medicina de Jorge', 1983, 'Novela', 1, ''),
(24, 'Charlie y la fabrica de chocolates', 1978, 'Novela', 1, ''),
(25, 'La familia Delasoga', 1985, 'Cuento', 11, ''),
(26, 'Doña Clementina Queridita, la achicadora', 1985, 'Cuento', 11, ''),
(27, 'Tengo un mounstruo en el bolsillo', 1988, 'Novela', 11, ''),
(28, 'Historia de un amor exagerado', 1987, 'Novela', 11, ''),
(29, 'Maruja', 1989, 'Novela', 10, ''),
(30, 'Historia a Fernandez', 1994, 'Cuento', 10, ''),
(31, '¡Socorro! 12 cuentos para caerse del miedo', 1988, 'Cuento', 9, ''),
(32, 'El túnel', 1993, 'Cuento', 8, ''),
(33, 'Willy el tímido', 1991, 'Cuento', 8, ''),
(34, 'Donde viven los monstruos', 1977, 'Cuento', 12, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `administrador` varchar(40) NOT NULL DEFAULT 'no-admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `user_password`, `administrador`) VALUES
(22, 'test1@gmail.com', '$2y$10$PGkJvs0r7ogWemWdL.SMzejrrpKmRun3mCn0.Ny014dXiVL5g7.tW', 'userAdmin'),
(24, 'test3@gmail.com', '$2y$10$PPlXr.9A.QrIAT3DCnzGRef7LFotUzHx3eQTZ1h4P/Eo0hqr.07De', 'no-admin'),
(25, 'test4@gmail.com', '$2y$10$oJjh0c6O5EsND4WO2pHcyu3eGj1jmuAyn5Su2dU2vK02zwDTdRnc2', 'no-admin'),
(33, 'test100@gmail.com', '$2y$10$FGpBV3eMSZa3ysPFaT35W.JTADSlv0z4KxvfkaAnbP6B9txMKHeae', 'no-admin'),
(34, 'user1234@gmail.com', '$2y$10$mG.ax4gvJ.GE.VF7DayrHuglj.brOadcEI.AMmSWAEuV.SRCuCW/G', 'no-admin'),
(36, 'francisco2233@gmail.com', '$2y$10$NWCwmqbr2sM3je3YqJt1ZORv9YY29v.6uElJs8ZlqqDyK9uwnIu7m', 'no-admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoracion`
--

CREATE TABLE `valoracion` (
  `id_valoracion` int(11) NOT NULL,
  `puntaje` int(11) NOT NULL,
  `comentario` varchar(400) NOT NULL,
  `fk_id_libro` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `valoracion`
--

INSERT INTO `valoracion` (`id_valoracion`, `puntaje`, `comentario`, `fk_id_libro`, `fk_id_usuario`) VALUES
(120, 5, 'Comentario de prueba', 6, 22),
(121, 5, 'Prueba 2', 6, 22);

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
-- Indices de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  ADD PRIMARY KEY (`id_valoracion`),
  ADD KEY `fk_id_libro` (`fk_id_libro`),
  ADD KEY `fk_id_usuario` (`fk_id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `valoracion`
--
ALTER TABLE `valoracion`
  MODIFY `id_valoracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`fk_id_autor`) REFERENCES `autores` (`id_autor`);

--
-- Filtros para la tabla `valoracion`
--
ALTER TABLE `valoracion`
  ADD CONSTRAINT `valoracion_ibfk_1` FOREIGN KEY (`fk_id_libro`) REFERENCES `libros` (`id_libro`),
  ADD CONSTRAINT `valoracion_ibfk_2` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

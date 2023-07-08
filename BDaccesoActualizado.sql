-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2023 a las 10:42:24
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `acceso`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdmin` int(11) NOT NULL,
  `userLogin` varchar(50) NOT NULL,
  `passwdLogin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdmin`, `userLogin`, `passwdLogin`) VALUES
(1, 'JavierSG', 'JSG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `idIngresos` int(11) NOT NULL,
  `noCuenta` int(7) NOT NULL,
  `idTarjeta` varchar(20) NOT NULL,
  `FechaIngreso` date NOT NULL DEFAULT current_timestamp(),
  `HoraIngreso` time NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`idIngresos`, `noCuenta`, `idTarjeta`, `FechaIngreso`, `HoraIngreso`) VALUES
(1, 1414838, 'ABCD1234', '2023-07-03', '21:46:32'),
(2, 1414838, 'ABCD1234', '2023-07-03', '22:47:29'),
(3, 1414838, 'ABCD1234', '2023-07-03', '22:54:02'),
(4, 1414838, 'ABCD1234', '2023-07-03', '22:54:15'),
(5, 1714817, 'EFGH5678', '2023-07-03', '23:38:14'),
(6, 1714817, 'EFGH5678', '2023-07-04', '02:09:03'),
(7, 1413545, 'IJKL9101', '2023-07-04', '10:49:53'),
(8, 3579514, 'QETU1357', '2023-07-04', '11:42:00'),
(9, 4568521, '1R2T7W9E', '2023-07-04', '11:47:47'),
(10, 1414838, 'ABCD1234', '2023-07-08', '02:41:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `noCuenta` int(7) NOT NULL,
  `nombres` varchar(65) NOT NULL,
  `apellidoPaterno` varchar(65) NOT NULL,
  `apellidoMaterno` varchar(65) NOT NULL,
  `genero` varchar(65) NOT NULL,
  `idTarjeta` varchar(20) NOT NULL,
  `tipoUsuario` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `noCuenta`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `genero`, `idTarjeta`, `tipoUsuario`) VALUES
(1, 1414838, 'Iván', 'Martínez', 'Aguirre', 'Masculino', 'ABCD1234', 'Alumno'),
(2, 1714817, 'Alan', 'López', 'Zepeda', 'No binario', 'EFGH5678', 'Alumno'),
(3, 1413545, 'Jorge', 'Tecpa', 'Villegas', 'Masculino', 'IJKL9101', 'Alumno'),
(4, 3579514, 'Ana', 'Mendoza', 'Zepeda', 'Prefiero no decir', 'QETU1357', 'Alumno'),
(5, 4568521, 'Alejandro', 'Díaz', 'Paez', 'Masculino', '1R2T7W9E', 'Docente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `userLogin` (`userLogin`),
  ADD UNIQUE KEY `passwdLogin` (`passwdLogin`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`idIngresos`),
  ADD KEY `noCuenta` (`noCuenta`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `idTarjeta` (`idTarjeta`),
  ADD KEY `noCuenta` (`noCuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `idIngresos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `nombre_restriccion` FOREIGN KEY (`noCuenta`) REFERENCES `usuarios` (`noCuenta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

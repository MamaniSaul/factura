-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-12-2024 a las 19:21:52
-- Versión del servidor: 10.4.32-MariaDB-log
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `tipodoc` varchar(10) DEFAULT NULL,
  `nrodoc` varchar(20) DEFAULT NULL,
  `razon_social` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `pais` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `tipodoc`, `nrodoc`, `razon_social`, `direccion`, `pais`) VALUES
(5, '6', '10123456789', 'CLIENTE CON RUC', 'VIRTUAL', 'PE'),
(7, '6', '10123456789', 'CLIENTE CON RUC', 'VIRTUAL', 'PE'),
(8, NULL, NULL, NULL, NULL, NULL),
(9, '6', '10123456789', 'CLIENTE CON RUC', 'VIRTUAL', 'PE'),
(10, '6', '10123456789', 'CLIENTE CON RUC', 'VIRTUAL', 'PE'),
(11, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `id` int(11) NOT NULL,
  `emisor_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `tipodoc` varchar(50) DEFAULT NULL,
  `serie` varchar(50) DEFAULT NULL,
  `correlativo` varchar(50) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `hora_emision` time DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `moneda` varchar(50) DEFAULT NULL,
  `total_opgravadas` decimal(10,2) DEFAULT NULL,
  `total_opexoneradas` decimal(10,2) DEFAULT NULL,
  `total_opinafectas` decimal(10,2) DEFAULT NULL,
  `total_impbolsas` decimal(10,2) DEFAULT NULL,
  `total_opgratuitas1` decimal(10,2) DEFAULT NULL,
  `total_opgratuitas2` decimal(10,2) DEFAULT NULL,
  `igv` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `total_texto` varchar(255) DEFAULT NULL,
  `forma_pago` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`id`, `emisor_id`, `cliente_id`, `tipodoc`, `serie`, `correlativo`, `fecha_emision`, `hora_emision`, `fecha_vencimiento`, `moneda`, `total_opgravadas`, `total_opexoneradas`, `total_opinafectas`, `total_impbolsas`, `total_opgratuitas1`, `total_opgratuitas2`, `igv`, `total`, `total_texto`, `forma_pago`) VALUES
(3, 5, 5, '01', 'FACT', '1', '2024-12-26', '06:03:00', '2024-12-26', 'PEN', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'ochocientos ', 'Contado'),
(6, 7, 7, '01', 'FACT', '1', '2024-12-19', '06:55:00', '2024-12-27', 'PEN', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'ochocientos ', 'Contado'),
(7, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 9, 9, '01', 'FACT', '1', '2024-12-26', '07:02:00', '2024-12-26', 'PEN', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'ochocientos ', 'Contado'),
(9, 10, 10, '01', 'FACT', '1', '2024-12-26', '14:31:00', '2024-12-27', 'PEN', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'ochocientos ', 'Contado'),
(10, 11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `id` int(11) NOT NULL,
  `comprobante_id` int(11) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `valor_unitario` decimal(10,2) DEFAULT NULL,
  `igv` decimal(10,2) DEFAULT NULL,
  `tipo_precio` varchar(50) DEFAULT NULL,
  `porcentaje_igv` decimal(10,2) DEFAULT NULL,
  `importe_total` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  `bolsa_plastica` varchar(50) DEFAULT NULL,
  `total_impuesto_bolsas` decimal(10,2) DEFAULT NULL,
  `tipo_afectacion_igv` varchar(50) DEFAULT NULL,
  `codigo_tipo_tributo` varchar(50) DEFAULT NULL,
  `tipo_tributo` varchar(50) DEFAULT NULL,
  `nombre_tributo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`id`, `comprobante_id`, `item`, `codigo`, `descripcion`, `cantidad`, `precio_unitario`, `valor_unitario`, `igv`, `tipo_precio`, `porcentaje_igv`, `importe_total`, `valor_total`, `unidad`, `bolsa_plastica`, `total_impuesto_bolsas`, `tipo_afectacion_igv`, `codigo_tipo_tributo`, `tipo_tributo`, `nombre_tributo`) VALUES
(2, 3, '1', 'PRO001', 'IMPRESORA EPSON WIFI\'', 1.00, 800.00, 677.97, 122.30, '01', 18.00, 800.00, 677.97, 'NIU', 'NO', 0.00, '10', '1000', 'VAT', 'IGV'),
(3, 6, '1', 'PRO001', 'IMPRESORA EPSON WIFI\'', 1.00, 800.00, 677.97, 122.30, '01', 18.00, 800.00, 677.97, 'NIU', 'NO', 0.00, '10', '1000', 'VAT', 'IGV'),
(4, 8, '1', 'PRO001', 'IMPRESORA EPSON WIFI\'', 1.00, 800.00, 677.97, 122.30, '01', 18.00, 800.00, 677.97, 'NIU', 'NO', 0.00, '10', '1000', 'VAT', 'IGV'),
(5, 9, '1', 'PRO001', 'IMPRESORA EPSON WIFI\'', 1.00, 800.00, 677.97, 122.30, '01', 18.00, 800.00, 677.97, 'NIU', 'NO', 0.00, '10', '1000', 'VAT', 'IGV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emisor`
--

CREATE TABLE `emisor` (
  `id` int(11) NOT NULL,
  `tipodoc` varchar(10) DEFAULT NULL,
  `nrodoc` varchar(20) DEFAULT NULL,
  `razon_social` varchar(100) DEFAULT NULL,
  `nombre_comercial` varchar(50) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ubigeo` varchar(10) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `pais` varchar(10) DEFAULT NULL,
  `usuario_secundario` varchar(50) DEFAULT NULL,
  `clave_usuario_secundario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `emisor`
--

INSERT INTO `emisor` (`id`, `tipodoc`, `nrodoc`, `razon_social`, `nombre_comercial`, `direccion`, `ubigeo`, `departamento`, `provincia`, `distrito`, `pais`, `usuario_secundario`, `clave_usuario_secundario`) VALUES
(5, '6', '20123456789', 'CETI ORG', 'CETI', 'VIRTUAL', '130101', 'LAMBAYEQUE', 'CHICLAYO', 'CHICLAYO', 'PE', 'franco', '12345678'),
(7, '6', '20123456789', 'CETI ORG', 'CETI', 'VIRTUAL', '2012345678', 'LAMBAYEQUE', 'CHICLAYO', 'CHICLAYO', 'PE', 'franco', '12345678'),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '6', '20123456789', 'CETI ORG', 'CETI', 'VIRTUAL', '2012345678', 'LAMBAYEQUE', 'CHICLAYO', 'CHICLAYO', 'PE', 'franco', '12345678'),
(10, '6', '20123456789', 'CETI ORG', 'CETI', 'VIRTUAL', '2012345678', 'LAMBAYEQUE', 'CHICLAYO', 'CHICLAYO', 'PE', 'franco', '12345678'),
(11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emisor_id` (`emisor_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comprobante_id` (`comprobante_id`);

--
-- Indices de la tabla `emisor`
--
ALTER TABLE `emisor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `emisor`
--
ALTER TABLE `emisor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD CONSTRAINT `comprobante_ibfk_1` FOREIGN KEY (`emisor_id`) REFERENCES `emisor` (`id`),
  ADD CONSTRAINT `comprobante_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobante` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

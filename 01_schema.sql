-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2026 a las 14:03:55
-- Versión del servidor: 8.0.46
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerta`
--

CREATE TABLE `alerta` (
  `id_alerta` int NOT NULL,
  `tipo` enum('stock','vencimiento') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `id_producto` int NOT NULL,
  `id_lote` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id_producto` int NOT NULL,
  `id_lote` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_actual` int NOT NULL,
  `estado` enum('vencido','fresco') COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `costo_compra` decimal(12,2) NOT NULL,
  `stock_minimo` int NOT NULL,
  `id_orden` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodo` int NOT NULL,
  `tipo` enum('efectivo','nequi') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra`
--

CREATE TABLE `orden_compra` (
  `id_orden` int NOT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `id_proveedor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen_producto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contraseña` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('admin','empleado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` enum('activo','inactivo') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int NOT NULL,
  `fecha_venta` datetime NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_lote`
--

CREATE TABLE `venta_lote` (
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_lote` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int NOT NULL,
  `precio_momento` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_metodo_pago`
--

CREATE TABLE `venta_metodo_pago` (
  `id_venta` int NOT NULL,
  `id_metodo` int NOT NULL,
  `monto` decimal(12,2) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_subtotal_venta_lote`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_subtotal_venta_lote` (
`cantidad` int
,`id_lote` varchar(50)
,`id_producto` int
,`id_venta` int
,`precio_momento` decimal(12,2)
,`subtotal` decimal(22,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_total_venta`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_total_venta` (
`fecha_venta` datetime
,`id_usuario` int
,`id_venta` int
,`total` decimal(44,2)
);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD PRIMARY KEY (`id_alerta`),
  ADD KEY `fk_alerta_lote` (`id_producto`,`id_lote`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id_producto`,`id_lote`),
  ADD KEY `fk_lote_orden` (`id_orden`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodo`);

--
-- Indices de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `fk_orden_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_categoria` (`id_categoria`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_venta_usuario` (`id_usuario`);

--
-- Indices de la tabla `venta_lote`
--
ALTER TABLE `venta_lote`
  ADD PRIMARY KEY (`id_venta`,`id_producto`,`id_lote`),
  ADD KEY `fk_venta_lote_lote` (`id_producto`,`id_lote`);

--
-- Indices de la tabla `venta_metodo_pago`
--
ALTER TABLE `venta_metodo_pago`
  ADD PRIMARY KEY (`id_venta`,`id_metodo`),
  ADD KEY `fk_vmp_metodo` (`id_metodo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alerta`
--
ALTER TABLE `alerta`
  MODIFY `id_alerta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  MODIFY `id_orden` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_subtotal_venta_lote`
--
DROP TABLE IF EXISTS `vista_subtotal_venta_lote`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_subtotal_venta_lote`  AS SELECT `venta_lote`.`id_venta` AS `id_venta`, `venta_lote`.`id_producto` AS `id_producto`, `venta_lote`.`id_lote` AS `id_lote`, `venta_lote`.`cantidad` AS `cantidad`, `venta_lote`.`precio_momento` AS `precio_momento`, (`venta_lote`.`cantidad` * `venta_lote`.`precio_momento`) AS `subtotal` FROM `venta_lote` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_total_venta`
--
DROP TABLE IF EXISTS `vista_total_venta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_total_venta`  AS SELECT `v`.`id_venta` AS `id_venta`, `v`.`fecha_venta` AS `fecha_venta`, `v`.`id_usuario` AS `id_usuario`, coalesce(sum((`vl`.`cantidad` * `vl`.`precio_momento`)),0) AS `total` FROM (`venta` `v` left join `venta_lote` `vl` on((`v`.`id_venta` = `vl`.`id_venta`))) GROUP BY `v`.`id_venta`, `v`.`fecha_venta`, `v`.`id_usuario` ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD CONSTRAINT `fk_alerta_lote` FOREIGN KEY (`id_producto`,`id_lote`) REFERENCES `lote` (`id_producto`, `id_lote`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `fk_lote_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden_compra` (`id_orden`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lote_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD CONSTRAINT `fk_orden_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta_lote`
--
ALTER TABLE `venta_lote`
  ADD CONSTRAINT `fk_venta_lote_lote` FOREIGN KEY (`id_producto`,`id_lote`) REFERENCES `lote` (`id_producto`, `id_lote`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venta_lote_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta_metodo_pago`
--
ALTER TABLE `venta_metodo_pago`
  ADD CONSTRAINT `fk_vmp_metodo` FOREIGN KEY (`id_metodo`) REFERENCES `metodo_pago` (`id_metodo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vmp_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

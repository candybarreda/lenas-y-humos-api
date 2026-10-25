-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2026 a las 13:10:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lenas_humos_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` varchar(30) NOT NULL DEFAULT 'ADMIN',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `nombre`, `email`, `password_hash`, `rol`, `activo`, `creado_en`) VALUES
(1, 'Administrador de prueba', 'admin.prueba@lenasyhumos.local', 'HASH_DE_PRUEBA_NO_USAR_PARA_LOGIN', 'ADMIN', 1, '2026-10-24 05:43:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_admin`
--

CREATE TABLE `auditoria_admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `accion` varchar(100) NOT NULL,
  `entidad` varchar(60) NOT NULL,
  `entidad_id` varchar(100) DEFAULT NULL,
  `detalle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`detalle`)),
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pedido_id` bigint(20) UNSIGNED NOT NULL,
  `producto_firebase_id` varchar(150) NOT NULL,
  `nombre_producto` varchar(180) NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `subtotal_linea` decimal(12,2) GENERATED ALWAYS AS (`precio_unitario` * `cantidad`) STORED
) ;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedido_id`, `producto_firebase_id`, `nombre_producto`, `precio_unitario`, `cantidad`) VALUES
(1, 1, '8', 'Gaseosa Inka Cola', 5.00, 2),
(2, 1, '7', 'Cerveza Dörcher Cramberrry', 15.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pedido_id` bigint(20) UNSIGNED NOT NULL,
  `destinatario_tipo` varchar(20) NOT NULL,
  `telefono_destino` varchar(20) NOT NULL,
  `tipo_evento` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE',
  `intentos` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clave_idempotencia` varchar(150) NOT NULL,
  `referencia_externa` varchar(180) DEFAULT NULL,
  `ultimo_error` text DEFAULT NULL,
  `proximo_intento` datetime DEFAULT NULL,
  `enviado_en` datetime DEFAULT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pedido_id` bigint(20) UNSIGNED NOT NULL,
  `metodo` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE',
  `referencia_operacion` varchar(150) DEFAULT NULL,
  `verificado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `verificado_en` datetime DEFAULT NULL,
  `observacion_verificacion` varchar(500) DEFAULT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `pedido_id`, `metodo`, `estado`, `referencia_operacion`, `verificado_por`, `verificado_en`, `observacion_verificacion`, `creado_en`, `actualizado_en`) VALUES
(1, 1, 'YAPE', 'VERIFICADO', 'PRUEBA-YAPE-001', 1, '2026-10-24 05:43:42', 'Verificación de prueba', '2026-10-24 05:11:58', '2026-10-24 05:43:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero_pedido` varchar(40) NOT NULL,
  `clave_idempotencia` varchar(100) NOT NULL,
  `usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre_cliente` varchar(120) NOT NULL,
  `telefono_cliente` varchar(20) NOT NULL,
  `tipo_entrega` varchar(20) NOT NULL,
  `zona_delivery_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre_zona` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `referencia_direccion` varchar(255) DEFAULT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `tarifa_delivery` decimal(10,2) NOT NULL DEFAULT 0.00,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(12,2) NOT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'PENDIENTE',
  `observaciones` varchar(500) DEFAULT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `numero_pedido`, `clave_idempotencia`, `usuario_id`, `nombre_cliente`, `telefono_cliente`, `tipo_entrega`, `zona_delivery_id`, `nombre_zona`, `direccion`, `referencia_direccion`, `subtotal`, `tarifa_delivery`, `descuento`, `total`, `estado`, `observaciones`, `creado_en`, `actualizado_en`) VALUES
(1, 'LH-83C924C3115B46ADAF4C', 'prueba-lh-001', NULL, 'Cliente de prueba', '999999999', 'DELIVERY', 15, 'Chorrillos', 'Dirección de prueba, Chorrillos', 'Cerca del parque', 25.00, 5.00, 0.00, 30.00, 'CONFIRMADO', 'Pedido de prueba', '2026-10-24 04:57:20', '2026-10-24 05:43:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) NOT NULL,
  `categoria` varchar(60) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `disponible` bit(1) NOT NULL,
  `imagen_url` varchar(500) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria`, `descripcion`, `disponible`, `imagen_url`, `nombre`, `precio`) VALUES
(3, 'Cilindro', 'Carne de cerdo marinada durante 24 horas y cocinada lentamente al cilindro con ensalada.', b'1', '/images/chancho.jpg', 'Chancho al Cilindro', 30.00),
(4, 'Cilindro', 'Pollo jugoso con el auténtico sabor ahumado acompañado de papas nativas y ensalada.', b'1', '/images/pollo.jpg', 'Pollo al Cilindro', 25.00),
(5, 'Cilindro', 'Carne de cerdo y pollo jugoso con el auténtico sabor ahumado y cocinado al cilindro.', b'1', '/images/combinado.jpg', 'Combinado al Cilindro', 50.00),
(6, 'Bebidas', 'Elaborada en Pozuzo, Oxapampa, que combina granos de trigo malteado con tradición alemana.', b'1', '/images/cerveza.jpg', 'Cerveza Dörcher Trigo', 15.00),
(7, 'Bebidas', 'Elaborada en Pozuzo, Oxapampa, que combina granos de trigo malteado con tradición alemana.', b'1', '/images/cramberry.jpg', 'Cerveza Dörcher Cramberrry', 15.00),
(8, 'Bebidas', 'Gaseosa INCA KOLA Original Botella 600ml.', b'1', '/images/inkacola.jpg', 'Gaseosa Inka Cola', 5.00),
(9, 'Bebidas', 'Gaseosa Coca Cola Original Botella 600ml.', b'1', '/images/cocacola.jpg', 'Gaseosa Coca Cola', 5.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(180) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas_delivery`
--

CREATE TABLE `zonas_delivery` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tarifa` decimal(10,2) NOT NULL,
  `habilitada` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `zonas_delivery`
--

INSERT INTO `zonas_delivery` (`id`, `nombre`, `tarifa`, `habilitada`, `creado_en`) VALUES
(9, 'Ancón', 30.00, 0, '2026-10-24 04:08:54'),
(10, 'Ate', 22.00, 0, '2026-10-24 04:08:54'),
(11, 'Barranco', 8.00, 1, '2026-10-24 04:08:54'),
(12, 'Breña', 15.00, 0, '2026-10-24 04:08:54'),
(13, 'Carabayllo', 28.00, 0, '2026-10-24 04:08:54'),
(14, 'Chaclacayo', 30.00, 0, '2026-10-24 04:08:54'),
(15, 'Chorrillos', 5.00, 1, '2026-10-24 04:08:54'),
(16, 'Cieneguilla', 30.00, 0, '2026-10-24 04:08:54'),
(17, 'Comas', 25.00, 0, '2026-10-24 04:08:54'),
(18, 'El Agustino', 18.00, 0, '2026-10-24 04:08:54'),
(19, 'Independencia', 23.00, 0, '2026-10-24 04:08:54'),
(20, 'Jesús María', 15.00, 0, '2026-10-24 04:08:54'),
(21, 'La Molina', 18.00, 0, '2026-10-24 04:08:54'),
(22, 'La Victoria', 15.00, 0, '2026-10-24 04:08:54'),
(23, 'Lima', 15.00, 0, '2026-10-24 04:08:54'),
(24, 'Lince', 13.00, 0, '2026-10-24 04:08:54'),
(25, 'Los Olivos', 25.00, 0, '2026-10-24 04:08:54'),
(26, 'Lurigancho', 30.00, 0, '2026-10-24 04:08:54'),
(27, 'Lurín', 25.00, 0, '2026-10-24 04:08:54'),
(28, 'Magdalena del Mar', 12.00, 0, '2026-10-24 04:08:54'),
(29, 'Miraflores', 10.00, 0, '2026-10-24 04:08:54'),
(30, 'Pachacámac', 30.00, 0, '2026-10-24 04:08:54'),
(31, 'Pucusana', 40.00, 0, '2026-10-24 04:08:54'),
(32, 'Pueblo Libre', 14.00, 0, '2026-10-24 04:08:54'),
(33, 'Puente Piedra', 28.00, 0, '2026-10-24 04:08:54'),
(34, 'Punta Hermosa', 35.00, 0, '2026-10-24 04:08:54'),
(35, 'Punta Negra', 38.00, 0, '2026-10-24 04:08:54'),
(36, 'Rímac', 18.00, 0, '2026-10-24 04:08:54'),
(37, 'San Bartolo', 40.00, 0, '2026-10-24 04:08:54'),
(38, 'San Borja', 12.00, 0, '2026-10-24 04:08:54'),
(39, 'San Isidro', 12.00, 0, '2026-10-24 04:08:54'),
(40, 'San Juan de Lurigancho', 25.00, 0, '2026-10-24 04:08:54'),
(41, 'San Juan de Miraflores', 10.00, 1, '2026-10-24 04:08:54'),
(42, 'San Luis', 15.00, 0, '2026-10-24 04:08:54'),
(43, 'San Martín de Porres', 23.00, 0, '2026-10-24 04:08:54'),
(44, 'San Miguel', 13.00, 0, '2026-10-24 04:08:54'),
(45, 'Santa Anita', 20.00, 0, '2026-10-24 04:08:54'),
(46, 'Santa María del Mar', 45.00, 0, '2026-10-24 04:08:54'),
(47, 'Santa Rosa', 32.00, 0, '2026-10-24 04:08:54'),
(48, 'Santiago de Surco', 10.00, 1, '2026-10-24 04:08:54'),
(49, 'Surquillo', 10.00, 0, '2026-10-24 04:08:54'),
(50, 'Villa El Salvador', 12.00, 1, '2026-10-24 04:08:54'),
(51, 'Villa María del Triunfo', 15.00, 0, '2026-10-24 04:08:54');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `auditoria_admin`
--
ALTER TABLE `auditoria_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_auditoria_admin` (`administrador_id`),
  ADD KEY `idx_auditoria_fecha` (`creado_en`),
  ADD KEY `idx_auditoria_entidad` (`entidad`,`entidad_id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_detalle_pedido` (`pedido_id`),
  ADD KEY `idx_detalle_producto` (`producto_firebase_id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clave_idempotencia` (`clave_idempotencia`),
  ADD KEY `idx_notificacion_reintento` (`estado`,`proximo_intento`),
  ADD KEY `idx_notificacion_pedido` (`pedido_id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pedido_id` (`pedido_id`),
  ADD KEY `fk_pago_admin` (`verificado_por`),
  ADD KEY `idx_pago_estado` (`estado`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_pedido` (`numero_pedido`),
  ADD UNIQUE KEY `clave_idempotencia` (`clave_idempotencia`),
  ADD KEY `fk_pedido_usuario` (`usuario_id`),
  ADD KEY `fk_pedido_zona` (`zona_delivery_id`),
  ADD KEY `idx_pedidos_estado` (`estado`),
  ADD KEY `idx_pedidos_fecha` (`creado_en`),
  ADD KEY `idx_pedidos_telefono` (`telefono_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `zonas_delivery`
--
ALTER TABLE `zonas_delivery`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auditoria_admin`
--
ALTER TABLE `auditoria_admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `zonas_delivery`
--
ALTER TABLE `zonas_delivery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoria_admin`
--
ALTER TABLE `auditoria_admin`
  ADD CONSTRAINT `fk_auditoria_admin` FOREIGN KEY (`administrador_id`) REFERENCES `administradores` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `fk_notificacion_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_pago_admin` FOREIGN KEY (`verificado_por`) REFERENCES `administradores` (`id`),
  ADD CONSTRAINT `fk_pago_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_pedido_zona` FOREIGN KEY (`zona_delivery_id`) REFERENCES `zonas_delivery` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

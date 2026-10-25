-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2026 a las 12:59:13
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
-- Base de datos: `ag_pasteleria_esencia`
--
CREATE DATABASE IF NOT EXISTS `ag_pasteleria_esencia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ag_pasteleria_esencia`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Base de datos: `appointments_db`
--
CREATE DATABASE IF NOT EXISTS `appointments_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `appointments_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id_registro` int(11) NOT NULL,
  `fecha_accion` datetime(6) DEFAULT NULL,
  `id_auditoria` bigint(20) NOT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `tabla_afectada` varchar(50) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `valores_anteriores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`valores_anteriores`)),
  `valores_nuevos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`valores_nuevos`)),
  `accion` enum('delete','insert','update') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_servicio`
--

CREATE TABLE `categorias_servicio` (
  `orden` int(11) DEFAULT 0,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `id_categoria` bigint(20) NOT NULL,
  `icono` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` enum('activo','inactivo') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `duracion_estimada` int(11) DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `fecha_actualizacion` datetime(6) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_hora` datetime(6) NOT NULL,
  `id_cita` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`duracion_estimada`, `id_servicio`, `id_user`, `fecha_actualizacion`, `fecha_creacion`, `fecha_hora`, `id_cita`, `id_cliente`, `estado`, `notas`) VALUES
(45, 1, 1, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', '2025-12-05 10:00:00.000000', 1, 1, 'confirmada', 'Cliente solicita estilo bob moderno'),
(90, 3, 2, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', '2025-12-05 14:00:00.000000', 2, 2, 'confirmada', 'Tinte color castaño claro'),
(30, 2, 1, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', '2025-12-06 09:00:00.000000', 3, 3, 'pendiente', NULL),
(180, 7, 3, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', '2025-12-06 15:00:00.000000', 4, 4, 'confirmada', 'Primera vez con keratina, revisar alergias'),
(40, 5, 2, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', '2025-12-07 11:00:00.000000', 5, 5, 'pendiente', NULL),
(60, 9, 2, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', '2025-12-08 16:00:00.000000', 6, 1, 'pendiente', 'Peinado para boda'),
(45, 12, 1, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', '2025-12-08 10:30:00.000000', 7, 2, 'confirmada', NULL),
(30, 11, 1, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', '2025-12-09 08:00:00.000000', 8, 3, 'pendiente', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_actualizacion` datetime(6) DEFAULT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`fecha_nacimiento`, `fecha_actualizacion`, `fecha_registro`, `id_cliente`, `telefono`, `email`, `nombre`, `direccion`, `genero`, `notas`) VALUES
('1990-05-15', '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 1, '987654321', 'maria.garcia@email.com', 'María García', 'Av. Principal 123, Lima', 'femenino', 'Cliente frecuente, prefiere cortes modernos'),
('1985-08-22', '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 2, '987654322', 'ana.lopez@email.com', 'Ana López', 'Jr. Los Olivos 456, Lima', 'femenino', 'Cliente VIP, alergica a ciertos productos'),
('1992-11-30', '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 3, '987654323', 'carlos.mendoza@email.com', 'Carlos Mendoza', 'Calle Lima 789, Callao', 'masculino', 'Prefiere citas por la tarde'),
('1988-03-10', '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 4, '987654324', 'laura.torres@email.com', 'Laura Torres', 'Av. Arequipa 321, Lima', 'femenino', NULL),
('1995-07-18', '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 5, '987654325', 'roberto.diaz@email.com', 'Roberto Díaz', 'Jr. Huancayo 654, Lima', 'masculino', 'Cliente nuevo, referido por María');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_users`
--

CREATE TABLE `horarios_users` (
  `dia_semana` int(11) NOT NULL,
  `hora_fin` time NOT NULL,
  `hora_inicio` time NOT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `id_horario` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `activo` enum('activo','inactivo') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_inventario`
--

CREATE TABLE `movimientos_inventario` (
  `cantidad` int(11) NOT NULL,
  `costo_unitario` decimal(10,2) DEFAULT NULL,
  `fecha_movimiento` datetime(6) DEFAULT NULL,
  `id_cita` bigint(20) DEFAULT NULL,
  `id_movimiento` bigint(20) NOT NULL,
  `id_producto` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `tipo_movimiento` enum('ajuste','entrada','merma','salida') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `monto` decimal(10,2) NOT NULL,
  `monto_descuento` decimal(10,2) DEFAULT NULL,
  `monto_total` decimal(10,2) NOT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_pago` datetime(6) DEFAULT NULL,
  `id_cita` bigint(20) NOT NULL,
  `id_pago` bigint(20) NOT NULL,
  `id_user_registro` bigint(20) DEFAULT NULL,
  `referencia_transaccion` varchar(100) DEFAULT NULL,
  `estado` enum('cancelado','completado','pendiente','reembolsado') DEFAULT NULL,
  `metodo_pago` enum('efectivo','plin','tarjeta','transferencia','yape') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `fecha_actualizacion` datetime(6) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `id_producto` bigint(20) NOT NULL,
  `agregar` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `mensaje` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`precio`, `stock`, `stock_minimo`, `fecha_actualizacion`, `fecha_creacion`, `id_producto`, `agregar`, `categoria`, `marca`, `nombre`, `proveedor`, `descripcion`, `estado`, `mensaje`) VALUES
(25.99, 50, 10, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 1, NULL, 'Cuidado Capilar', 'L\'Oréal', 'Shampoo Hidratante', 'Distribuidora Beauty Pro', 'Shampoo profesional para todo tipo de cabello', 'disponible', NULL),
(22.50, 45, 10, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 2, NULL, 'Cuidado Capilar', 'Pantene', 'Acondicionador Nutritivo', 'Distribuidora Beauty Pro', 'Acondicionador reparador intensivo', 'disponible', NULL),
(35.00, 30, 8, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 3, NULL, 'Coloración', 'Wella', 'Tinte Profesional Negro', 'Colorex SAC', 'Tinte permanente color negro intenso', 'disponible', NULL),
(35.00, 28, 8, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 4, NULL, 'Coloración', 'Wella', 'Tinte Profesional Castaño', 'Colorex SAC', 'Tinte permanente color castaño natural', 'disponible', NULL),
(18.90, 60, 15, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 5, NULL, 'Estilizado', 'Schwarzkopf', 'Gel Fijador Extra Fuerte', 'Distribuidora Beauty Pro', 'Gel para peinado con fijación extrema', 'disponible', NULL),
(89.00, 20, 5, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 6, NULL, 'Tratamientos', 'Kerastase', 'Crema Alisadora', 'Premium Hair Products', 'Crema para alisado permanente', 'disponible', NULL),
(65.00, 15, 5, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 7, NULL, 'Tratamientos', 'Moroccanoil', 'Serum Reparador', 'Premium Hair Products', 'Serum intensivo para puntas dañadas', 'disponible', NULL),
(28.50, 40, 10, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 8, NULL, 'Cuidado Capilar', 'TRESemmé', 'Spray Protector Térmico', 'Distribuidora Beauty Pro', 'Protección contra calor de planchas y secadores', 'disponible', NULL),
(32.00, 8, 10, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 9, NULL, 'Tratamientos', 'Dove', 'Mascarilla Capilar', 'Distribuidora Beauty Pro', 'Mascarilla intensiva de hidratación profunda', 'agotado', NULL),
(42.00, 35, 8, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 10, NULL, 'Estilizado', 'American Crew', 'Cera para Cabello', 'Men\'s Grooming Store', 'Cera modeladora con acabado mate', 'disponible', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `compra_minima` decimal(10,2) DEFAULT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `usos_actuales` int(11) DEFAULT NULL,
  `usos_maximos` int(11) DEFAULT NULL,
  `valor_descuento` decimal(10,2) NOT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `id_promocion` bigint(20) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` enum('activo','inactivo') DEFAULT NULL,
  `tipo_descuento` enum('monto_fijo','porcentaje') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorios`
--

CREATE TABLE `recordatorios` (
  `intentos_envio` int(11) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_enviado` datetime(6) DEFAULT NULL,
  `fecha_programada` datetime(6) NOT NULL,
  `id_cita` bigint(20) NOT NULL,
  `id_recordatorio` bigint(20) NOT NULL,
  `error_mensaje` text DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `estado` enum('enviado','fallido','pendiente') DEFAULT NULL,
  `tipo` enum('email','push','sms','whatsapp') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenas`
--

CREATE TABLE `resenas` (
  `calificacion` int(11) NOT NULL,
  `fecha_resena` datetime(6) DEFAULT NULL,
  `fecha_respuesta` datetime(6) DEFAULT NULL,
  `id_cita` bigint(20) NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `id_resena` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `comentario` text DEFAULT NULL,
  `respuesta` text DEFAULT NULL,
  `visible` enum('no','si') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `duracion_min` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_actualizacion` datetime(6) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `id_servicio` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`duracion_min`, `id_categoria`, `precio`, `fecha_actualizacion`, `fecha_creacion`, `id_servicio`, `nombre`, `descripcion`, `estado`) VALUES
(45, 1, 35.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 1, 'Corte de Cabello Dama', 'Corte profesional para dama con lavado y secado incluido', 'activo'),
(30, 1, 25.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 2, 'Corte de Cabello Caballero', 'Corte clásico o moderno para caballero', 'activo'),
(90, 2, 80.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 3, 'Tinte Completo', 'Aplicación de tinte en todo el cabello, incluye lavado', 'activo'),
(120, 2, 150.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 4, 'Mechas Californianas', 'Aplicación de mechas con técnica balayage', 'activo'),
(40, 3, 30.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 5, 'Manicure Clásico', 'Cuidado completo de uñas de manos', 'activo'),
(60, 3, 45.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 6, 'Pedicure Spa', 'Tratamiento completo para pies con exfoliación', 'activo'),
(180, 4, 200.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 7, 'Keratina Brasileña', 'Tratamiento alisador con queratina natural', 'activo'),
(90, 4, 120.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 8, 'Tratamiento Botox Capilar', 'Tratamiento intensivo de reconstrucción capilar', 'activo'),
(60, 5, 65.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 9, 'Peinado para Evento', 'Peinado profesional para eventos especiales', 'activo'),
(45, 5, 55.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 10, 'Maquillaje Social', 'Maquillaje para eventos diurnos o nocturnos', 'activo'),
(30, 1, 20.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 11, 'Lavado y Secado', 'Lavado profesional con productos premium y secado', 'activo'),
(45, 4, 50.00, '2025-12-04 19:25:05.000000', '2025-12-04 19:25:05.000000', 12, 'Hidratación Profunda', 'Tratamiento de hidratación intensiva con mascarilla', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_promociones`
--

CREATE TABLE `servicios_promociones` (
  `fecha_asignacion` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `id_promocion` bigint(20) NOT NULL,
  `id_servicio` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `fecha_actualizacion` datetime(6) DEFAULT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `id_user` bigint(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `estado` enum('activo','inactivo') DEFAULT NULL,
  `rol` enum('admin','empleado','recepcionista') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_servicios`
--

CREATE TABLE `users_servicios` (
  `fecha_asignacion` datetime(6) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `id_servicio` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `nivel_experiencia` enum('experto','intermedio','principiante') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_auditoria`),
  ADD KEY `FKafmia9j4esyxcrhu0eanb6uqt` (`id_user`);

--
-- Indices de la tabla `categorias_servicio`
--
ALTER TABLE `categorias_servicio`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `FKhfcu70fv18mkjfvu1b8maw1ll` (`id_cliente`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `UK1c96wv36rk2hwui7qhjks3mvg` (`email`);

--
-- Indices de la tabla `horarios_users`
--
ALTER TABLE `horarios_users`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `FK446hwghjqmclv6er2b8a8cs8m` (`id_user`);

--
-- Indices de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `FKd9yhdbfavie9spgxok11tgj50` (`id_cita`),
  ADD KEY `FK7ttlcxcscpdu0wa9vhq6celdu` (`id_producto`),
  ADD KEY `FK2ul1kmpnda3osvo0t1by6duvu` (`id_user`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `FKipa6lpcxw6ebs3c5lhfuo3l61` (`id_cita`),
  ADD KEY `FKl9i8g15acqk3ie9ogxcteh55k` (`id_user_registro`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id_promocion`),
  ADD UNIQUE KEY `UKfy1j1ox2d9jnv5cqvxl00bqav` (`codigo`);

--
-- Indices de la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  ADD PRIMARY KEY (`id_recordatorio`),
  ADD KEY `FK5yu6q29cx0ne253npfcdo0v5` (`id_cita`);

--
-- Indices de la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id_resena`),
  ADD KEY `FK10e0l29ey03wc0ujsqum40b8s` (`id_cita`),
  ADD KEY `FKb9b2re4h462ufcbs1ku101v2a` (`id_cliente`),
  ADD KEY `FKjv9jarnmyedwlrtdtvkql77xx` (`id_user`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `servicios_promociones`
--
ALTER TABLE `servicios_promociones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbpvjdqd4sbd0jxnv581mfyy5w` (`id_promocion`),
  ADD KEY `FKf8isy82i2ot7376l67ym6web1` (`id_servicio`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- Indices de la tabla `users_servicios`
--
ALTER TABLE `users_servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlkhsccfia0n9iba22adcfw8he` (`id_servicio`),
  ADD KEY `FKbto4sxj8msy6u0jb2j0pmwi7s` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id_auditoria` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_servicio`
--
ALTER TABLE `categorias_servicio`
  MODIFY `id_categoria` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `horarios_users`
--
ALTER TABLE `horarios_users`
  MODIFY `id_horario` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  MODIFY `id_movimiento` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id_promocion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  MODIFY `id_recordatorio` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id_resena` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `servicios_promociones`
--
ALTER TABLE `servicios_promociones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users_servicios`
--
ALTER TABLE `users_servicios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `FKafmia9j4esyxcrhu0eanb6uqt` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `FKhfcu70fv18mkjfvu1b8maw1ll` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `horarios_users`
--
ALTER TABLE `horarios_users`
  ADD CONSTRAINT `FK446hwghjqmclv6er2b8a8cs8m` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `movimientos_inventario`
--
ALTER TABLE `movimientos_inventario`
  ADD CONSTRAINT `FK2ul1kmpnda3osvo0t1by6duvu` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `FK7ttlcxcscpdu0wa9vhq6celdu` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `FKd9yhdbfavie9spgxok11tgj50` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `FKipa6lpcxw6ebs3c5lhfuo3l61` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`),
  ADD CONSTRAINT `FKl9i8g15acqk3ie9ogxcteh55k` FOREIGN KEY (`id_user_registro`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  ADD CONSTRAINT `FK5yu6q29cx0ne253npfcdo0v5` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`);

--
-- Filtros para la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD CONSTRAINT `FK10e0l29ey03wc0ujsqum40b8s` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`),
  ADD CONSTRAINT `FKb9b2re4h462ufcbs1ku101v2a` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `FKjv9jarnmyedwlrtdtvkql77xx` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `servicios_promociones`
--
ALTER TABLE `servicios_promociones`
  ADD CONSTRAINT `FKbpvjdqd4sbd0jxnv581mfyy5w` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`),
  ADD CONSTRAINT `FKf8isy82i2ot7376l67ym6web1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `users_servicios`
--
ALTER TABLE `users_servicios`
  ADD CONSTRAINT `FKbto4sxj8msy6u0jb2j0pmwi7s` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `FKlkhsccfia0n9iba22adcfw8he` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);
--
-- Base de datos: `base_datos`
--
CREATE DATABASE IF NOT EXISTS `base_datos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `base_datos`;
--
-- Base de datos: `chiflepop`
--
CREATE DATABASE IF NOT EXISTS `chiflepop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `chiflepop`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `bancoid` int(11) NOT NULL,
  `nombre_banco` varchar(100) NOT NULL,
  `tipo_bancoid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`bancoid`, `nombre_banco`, `tipo_bancoid`) VALUES
(1, 'BCP', 1),
(2, 'Interbank', 1),
(3, 'BBVA', 1),
(4, 'Banco de la Nación', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `clienteid` int(11) NOT NULL,
  `direccion` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`clienteid`, `direccion`, `email`, `fecha_registro`, `nombre`, `password`, `rol`, `telefono`) VALUES
(1, NULL, 'admin@chiflepop.com', '2026-04-28 17:05:24.000000', 'Super Administrador', '$2a$10$4hxHz4zGWy8946WDdwAtWuJqe25VDfvVwvHaQV1bOgMK6a3nM2cB2', 'ROLE_ADMIN', '999000999'),
(2, NULL, 'candy@gmail.com', '2026-04-28 21:59:01.000000', 'candy', '$2a$10$zQz4HHe6dsEQ4c/wIiQ9/.E2.ggvftta/RRLOyvdnilaqdElxpUHS', 'ROLE_CLIENTE', '9999999999'),
(5, NULL, 'leon@gmail.com', '2026-05-30 21:12:41.000000', 'leon garcia', '$2a$10$.7wCoreNE7TzCR/Xz4ETQeUWgd0dIkDYcruG/0D.efEsnDpBi86ye', 'ROLE_CLIENTE', '999999999');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_productos`
--

CREATE TABLE `clientes_productos` (
  `cliente_productoid` int(11) NOT NULL,
  `comentario` text DEFAULT NULL,
  `fecha_relacion` datetime(6) DEFAULT NULL,
  `clienteid` int(11) NOT NULL,
  `productoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_cliente`
--

CREATE TABLE `cuentas_cliente` (
  `cuenta_clienteid` int(11) NOT NULL,
  `es_principal` bit(1) DEFAULT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `numero_cuenta` varchar(100) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `bancoid` int(11) DEFAULT NULL,
  `clienteid` int(11) NOT NULL,
  `metodo_pagoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `detalleid` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `pedidoid` int(11) NOT NULL,
  `productoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones_entrega`
--

CREATE TABLE `direcciones_entrega` (
  `direccion_entregaid` int(11) NOT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `es_principal` bit(1) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `clienteid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direcciones_entrega`
--

INSERT INTO `direcciones_entrega` (`direccion_entregaid`, `ciudad`, `departamento`, `direccion`, `es_principal`, `pais`, `clienteid`) VALUES
(124, 'Lima', 'Lima', 'Av. Larco 123', b'1', 'Perú', 1),
(125, 'Lima', 'Lima', 'Calle Los Pinos 456', b'1', 'Perú', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `empleadoid` int(11) NOT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`empleadoid`, `cargo`, `fecha_ingreso`, `nombre`) VALUES
(2, 'Repartidor', '2015-01-01', 'leon ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_pedidos`
--

CREATE TABLE `empleados_pedidos` (
  `empleado_pedidoid` int(11) NOT NULL,
  `rol_en_pedido` varchar(50) DEFAULT NULL,
  `empleadoid` int(11) NOT NULL,
  `pedidoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_producto`
--

CREATE TABLE `empleado_producto` (
  `empleado_productoid` int(11) NOT NULL,
  `función` varchar(100) DEFAULT NULL,
  `empleadoid` int(11) NOT NULL,
  `productoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `estadoid` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`estadoid`, `descripcion`) VALUES
(1, 'Pendiente'),
(2, 'Pagado'),
(3, 'Enviado'),
(4, 'Entregado'),
(5, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `metodo_pagoid` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `nombre_metodo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`metodo_pagoid`, `descripcion`, `nombre_metodo`) VALUES
(1, 'Visa/Mastercard', 'Tarjeta Crédito'),
(2, 'Saldo directo', 'Tarjeta Débito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedidoid` int(11) NOT NULL,
  `fecha_pedido` datetime(6) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `clienteid` int(11) NOT NULL,
  `cuenta_clienteid` int(11) NOT NULL,
  `direccion_entregaid` int(11) NOT NULL,
  `estadoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `productoid` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`productoid`, `descripcion`, `imagen`, `nombre`, `precio`, `stock`) VALUES
(630, 'El sabor tradicional, crujiente y con el punto exacto de sal marina.', 'chifles.jpg', 'Chifle Clásico', 3.50, 50),
(631, 'Para los valientes. Con un toque de ají limo y especias.', 'chifles1.jpg', 'Chifle Picante', 4.00, 45),
(632, 'Ácido y refrescante. La combinación perfecta para el plátano.', 'chifles3.jpg', 'Chifle con Limón', 4.50, 30),
(633, 'Hecho de plátano maduro, naturalmente dulce y caramelizado.', 'chifles10.jpg', 'Chifle Dulce (Madurito)', 4.20, 25),
(634, 'Crujientes láminas con un intenso sabor a ajo tostado.', 'chifles33.jpg', 'Chifle al Ajo', 3.80, 40),
(635, 'Bolsa gigante de 500g ideal para compartir en reuniones.', 'chifles1.jpg', 'Chifle Familiar', 8.50, 20),
(636, 'Edición Premium con trocitos de cecina ahumada de la selva.', 'chifles1.jpg', 'Chifle con Cecina', 6.00, 15),
(637, 'Corte especial ondulado para mayor crocancia y dip.', 'chifles1.jpg', 'Chifle Ondulado', 3.90, 60),
(638, 'Mezcla de chifles, camote frito y yuca frita.', 'chifles1.jpg', 'Mix Tropical', 5.00, 35),
(639, 'La opción saludable, 100% natural sin sodio añadido.', 'chifles1.jpg', 'Chifle Sin Sal', 3.50, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `promocionid` int(11) NOT NULL,
  `activo` bit(1) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `descuento_porcentaje` decimal(5,2) DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `nombre_promocion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamos`
--

CREATE TABLE `reclamos` (
  `reclamoid` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `clienteid` int(11) NOT NULL,
  `pedidoid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencias`
--

CREATE TABLE `sugerencias` (
  `sugerenciaid` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `clienteid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_banco`
--

CREATE TABLE `tipo_banco` (
  `tipo_bancoid` int(11) NOT NULL,
  `nombre_tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_banco`
--

INSERT INTO `tipo_banco` (`tipo_bancoid`, `nombre_tipo`) VALUES
(2, 'Banca Estatal'),
(1, 'Banca Privada');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`bancoid`),
  ADD KEY `FKb8hfmlpv0ws5788kbvikq16yf` (`tipo_bancoid`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`clienteid`),
  ADD UNIQUE KEY `UK1c96wv36rk2hwui7qhjks3mvg` (`email`);

--
-- Indices de la tabla `clientes_productos`
--
ALTER TABLE `clientes_productos`
  ADD PRIMARY KEY (`cliente_productoid`),
  ADD KEY `FKnvjqfcp4o0wvjh1h13vo4sadd` (`clienteid`),
  ADD KEY `FKf6btnhnt05wg0wyhlql6hq476` (`productoid`);

--
-- Indices de la tabla `cuentas_cliente`
--
ALTER TABLE `cuentas_cliente`
  ADD PRIMARY KEY (`cuenta_clienteid`),
  ADD KEY `FKplwn3w41141y25jiyqcqmj6di` (`bancoid`),
  ADD KEY `FKb5b35h6s8853jlip74r1j3c11` (`clienteid`),
  ADD KEY `FK411ohcoasctb16kagrow87gte` (`metodo_pagoid`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`detalleid`),
  ADD KEY `FK6cbq21ubmgk53buwg61f9bu5x` (`pedidoid`),
  ADD KEY `FKh1owfq0lvue7an5orf8l18w9l` (`productoid`);

--
-- Indices de la tabla `direcciones_entrega`
--
ALTER TABLE `direcciones_entrega`
  ADD PRIMARY KEY (`direccion_entregaid`),
  ADD KEY `FK898u61u2t2qwhxv409eyjx0us` (`clienteid`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`empleadoid`);

--
-- Indices de la tabla `empleados_pedidos`
--
ALTER TABLE `empleados_pedidos`
  ADD PRIMARY KEY (`empleado_pedidoid`),
  ADD KEY `FK24v2tske6b3m8kp42he7w25js` (`empleadoid`),
  ADD KEY `FK5bthvo5fgkt0hft8ysvxe5cf4` (`pedidoid`);

--
-- Indices de la tabla `empleado_producto`
--
ALTER TABLE `empleado_producto`
  ADD PRIMARY KEY (`empleado_productoid`),
  ADD KEY `FKsw428slc4yuo4pj55mdap0hmj` (`empleadoid`),
  ADD KEY `FKe72s79hmd3os6nahu380y3fk8` (`productoid`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`estadoid`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`metodo_pagoid`),
  ADD UNIQUE KEY `UKbfsoq0858xn2iw2l102kal7ss` (`nombre_metodo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedidoid`),
  ADD KEY `FKmj3o0taf0x32isvu59tgef6t2` (`clienteid`),
  ADD KEY `FK325fdhgka9km7np0em31d4k0f` (`cuenta_clienteid`),
  ADD KEY `FKjvpo8xusg7y4c82gm5vmo7gwt` (`direccion_entregaid`),
  ADD KEY `FK5462xcrjjevoxt686o1ud7s38` (`estadoid`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`productoid`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`promocionid`);

--
-- Indices de la tabla `reclamos`
--
ALTER TABLE `reclamos`
  ADD PRIMARY KEY (`reclamoid`),
  ADD KEY `FKdal975x1l4ucrk9q6dg09ea26` (`clienteid`),
  ADD KEY `FK6jl29q29i191emhalq7b35wl2` (`pedidoid`);

--
-- Indices de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD PRIMARY KEY (`sugerenciaid`),
  ADD KEY `FKocxs0dlsvejbsq4jk6xarsvpk` (`clienteid`);

--
-- Indices de la tabla `tipo_banco`
--
ALTER TABLE `tipo_banco`
  ADD PRIMARY KEY (`tipo_bancoid`),
  ADD UNIQUE KEY `UK4s4xjo67yrn8ifpptl8xu773f` (`nombre_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `bancoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `clienteid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes_productos`
--
ALTER TABLE `clientes_productos`
  MODIFY `cliente_productoid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas_cliente`
--
ALTER TABLE `cuentas_cliente`
  MODIFY `cuenta_clienteid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `detalleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `direcciones_entrega`
--
ALTER TABLE `direcciones_entrega`
  MODIFY `direccion_entregaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `empleadoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados_pedidos`
--
ALTER TABLE `empleados_pedidos`
  MODIFY `empleado_pedidoid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado_producto`
--
ALTER TABLE `empleado_producto`
  MODIFY `empleado_productoid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `estadoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `metodo_pagoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedidoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `productoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=640;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `promocionid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reclamos`
--
ALTER TABLE `reclamos`
  MODIFY `reclamoid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  MODIFY `sugerenciaid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_banco`
--
ALTER TABLE `tipo_banco`
  MODIFY `tipo_bancoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD CONSTRAINT `FKb8hfmlpv0ws5788kbvikq16yf` FOREIGN KEY (`tipo_bancoid`) REFERENCES `tipo_banco` (`tipo_bancoid`);

--
-- Filtros para la tabla `clientes_productos`
--
ALTER TABLE `clientes_productos`
  ADD CONSTRAINT `FKf6btnhnt05wg0wyhlql6hq476` FOREIGN KEY (`productoid`) REFERENCES `productos` (`productoid`),
  ADD CONSTRAINT `FKnvjqfcp4o0wvjh1h13vo4sadd` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`clienteid`);

--
-- Filtros para la tabla `cuentas_cliente`
--
ALTER TABLE `cuentas_cliente`
  ADD CONSTRAINT `FK411ohcoasctb16kagrow87gte` FOREIGN KEY (`metodo_pagoid`) REFERENCES `metodo_pago` (`metodo_pagoid`),
  ADD CONSTRAINT `FKb5b35h6s8853jlip74r1j3c11` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`clienteid`),
  ADD CONSTRAINT `FKplwn3w41141y25jiyqcqmj6di` FOREIGN KEY (`bancoid`) REFERENCES `bancos` (`bancoid`);

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `FK6cbq21ubmgk53buwg61f9bu5x` FOREIGN KEY (`pedidoid`) REFERENCES `pedidos` (`pedidoid`),
  ADD CONSTRAINT `FKh1owfq0lvue7an5orf8l18w9l` FOREIGN KEY (`productoid`) REFERENCES `productos` (`productoid`);

--
-- Filtros para la tabla `direcciones_entrega`
--
ALTER TABLE `direcciones_entrega`
  ADD CONSTRAINT `FK898u61u2t2qwhxv409eyjx0us` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`clienteid`);

--
-- Filtros para la tabla `empleados_pedidos`
--
ALTER TABLE `empleados_pedidos`
  ADD CONSTRAINT `FK24v2tske6b3m8kp42he7w25js` FOREIGN KEY (`empleadoid`) REFERENCES `empleados` (`empleadoid`),
  ADD CONSTRAINT `FK5bthvo5fgkt0hft8ysvxe5cf4` FOREIGN KEY (`pedidoid`) REFERENCES `pedidos` (`pedidoid`);

--
-- Filtros para la tabla `empleado_producto`
--
ALTER TABLE `empleado_producto`
  ADD CONSTRAINT `FKe72s79hmd3os6nahu380y3fk8` FOREIGN KEY (`productoid`) REFERENCES `productos` (`productoid`),
  ADD CONSTRAINT `FKsw428slc4yuo4pj55mdap0hmj` FOREIGN KEY (`empleadoid`) REFERENCES `empleados` (`empleadoid`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK325fdhgka9km7np0em31d4k0f` FOREIGN KEY (`cuenta_clienteid`) REFERENCES `cuentas_cliente` (`cuenta_clienteid`),
  ADD CONSTRAINT `FK5462xcrjjevoxt686o1ud7s38` FOREIGN KEY (`estadoid`) REFERENCES `estados` (`estadoid`),
  ADD CONSTRAINT `FKjvpo8xusg7y4c82gm5vmo7gwt` FOREIGN KEY (`direccion_entregaid`) REFERENCES `direcciones_entrega` (`direccion_entregaid`),
  ADD CONSTRAINT `FKmj3o0taf0x32isvu59tgef6t2` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`clienteid`);

--
-- Filtros para la tabla `reclamos`
--
ALTER TABLE `reclamos`
  ADD CONSTRAINT `FK6jl29q29i191emhalq7b35wl2` FOREIGN KEY (`pedidoid`) REFERENCES `pedidos` (`pedidoid`),
  ADD CONSTRAINT `FKdal975x1l4ucrk9q6dg09ea26` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`clienteid`);

--
-- Filtros para la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD CONSTRAINT `FKocxs0dlsvejbsq4jk6xarsvpk` FOREIGN KEY (`clienteid`) REFERENCES `clientes` (`clienteid`);
--
-- Base de datos: `esencia_pasteleria`
--
CREATE DATABASE IF NOT EXISTS `esencia_pasteleria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `esencia_pasteleria`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_personalizado`
--

CREATE TABLE `categoria_personalizado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_personalizado`
--

INSERT INTO `categoria_personalizado` (`id`, `nombre`) VALUES
(1, 'Porciones'),
(2, 'Relleno'),
(3, 'Sabor'),
(4, 'Temática'),
(5, 'Dedicatoria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id`, `nombre`) VALUES
(1, 'Tradicional'),
(2, 'Personalizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto_categoria_personalizacion`
--

CREATE TABLE `categoria_producto_categoria_personalizacion` (
  `id` int(11) NOT NULL,
  `id_categoria_producto` int(11) NOT NULL,
  `id_categoria_personalizado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_producto_categoria_personalizacion`
--

INSERT INTO `categoria_producto_categoria_personalizacion` (`id`, `id_categoria_producto`, `id_categoria_personalizado`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 1, 10, 1, 45.00, 45.00),
(2, 1, 15, 2, 60.00, 120.00),
(3, 2, 17, 1, 12.00, 12.00),
(4, 3, 19, 1, 50.00, 50.00),
(5, 4, 28, 1, 55.00, 55.00),
(6, 5, 40, 2, 80.00, 160.00),
(7, 6, 41, 1, 90.00, 90.00),
(8, 7, 42, 1, 85.00, 85.00),
(9, 8, 43, 3, 70.00, 210.00),
(10, 9, 44, 1, 95.00, 95.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepersonalizacion`
--

CREATE TABLE `detallepersonalizacion` (
  `id_detalle_personalizacion` int(11) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `id_personalizacion` int(11) NOT NULL,
  `precio_extra` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido_historico`
--

CREATE TABLE `detalle_pedido_historico` (
  `id_historial` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `cambio` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `usuario_responsable` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id_notificacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `leido` tinyint(1) DEFAULT 0,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `metodo` varchar(50) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `id_pedido`, `metodo`, `monto`, `fecha`, `estado`) VALUES
(1, 1, 'TARJETA', 45.90, '2025-12-03 00:47:04', 'COMPLETADO'),
(2, 2, 'EFECTIVO', 30.00, '2025-12-03 00:47:04', 'PENDIENTE'),
(3, 3, 'YAPE', 18.50, '2025-12-03 00:47:04', 'COMPLETADO'),
(4, 4, 'PLIN', 22.00, '2025-12-03 00:47:04', 'FALLIDO'),
(5, 5, 'TARJETA', 50.00, '2025-12-03 00:47:04', 'COMPLETADO'),
(6, 6, 'EFECTIVO', 12.00, '2025-12-03 00:47:04', 'PENDIENTE'),
(7, 7, 'YAPE', 90.00, '2025-12-03 00:47:04', 'COMPLETADO'),
(8, 8, 'PLIN', 40.00, '2025-12-03 00:47:04', 'PENDIENTE'),
(9, 9, 'TARJETA', 75.25, '2025-12-03 00:47:04', 'FALLIDO'),
(10, 10, 'EFECTIVO', 20.00, '2025-12-03 00:47:04', 'COMPLETADO'),
(11, 1, 'TARJETA', 45.90, '2025-12-03 01:55:08', 'COMPLETADO'),
(12, 2, 'EFECTIVO', 30.00, '2025-12-03 01:55:08', 'PENDIENTE'),
(13, 3, 'YAPE', 18.50, '2025-12-03 01:55:08', 'COMPLETADO'),
(14, 4, 'PLIN', 22.00, '2025-12-03 01:55:08', 'FALLIDO'),
(15, 5, 'TARJETA', 50.00, '2025-12-03 01:55:08', 'COMPLETADO'),
(16, 6, 'EFECTIVO', 12.00, '2025-12-03 01:55:08', 'PENDIENTE'),
(17, 7, 'YAPE', 90.00, '2025-12-03 01:55:08', 'COMPLETADO'),
(18, 8, 'PLIN', 40.00, '2025-12-03 01:55:08', 'PENDIENTE'),
(19, 9, 'TARJETA', 75.25, '2025-12-03 01:55:08', 'FALLIDO'),
(20, 10, 'EFECTIVO', 20.00, '2025-12-03 01:55:08', 'COMPLETADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `estado` varchar(50) DEFAULT 'Pendiente',
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_usuario`, `fecha_pedido`, `estado`, `total`) VALUES
(1, 1, '2025-01-10 14:32:00', 'PENDIENTE', 120.50),
(2, 1, '2025-01-11 09:15:00', 'EN_PROCESO', 89.90),
(3, 1, '2025-01-12 18:45:00', 'ENTREGADO', 45.00),
(4, 1, '2025-01-13 11:20:00', 'CANCELADO', 0.00),
(5, 1, '2025-01-14 16:10:00', 'PENDIENTE', 300.75),
(6, 1, '2025-01-15 08:55:00', 'EN_PROCESO', 150.00),
(7, 1, '2025-01-16 20:40:00', 'ENTREGADO', 210.99),
(8, 1, '2025-01-17 13:00:00', 'CANCELADO', 10.00),
(9, 1, '2025-01-18 17:25:00', 'PENDIENTE', 78.20),
(10, 1, '2025-01-19 12:05:00', 'ENTREGADO', 499.90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personalizacion`
--

CREATE TABLE `personalizacion` (
  `id_personalizacion` int(11) NOT NULL,
  `id_categoria_personalizado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio_extra` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personalizacion`
--

INSERT INTO `personalizacion` (`id_personalizacion`, `id_categoria_personalizado`, `nombre`, `precio_extra`) VALUES
(1, 1, 'Porción para 6 personas', 5.00),
(2, 1, 'Porción para 8 personas', 7.00),
(3, 1, 'Porción para 10 personas', 9.00),
(4, 1, 'Porción para 12 personas', 11.00),
(5, 1, 'Porción para 15 personas', 14.00),
(6, 1, 'Porción para 20 personas', 18.00),
(7, 2, 'Relleno de Manjar Blanco', 3.00),
(8, 2, 'Relleno de Fresa', 4.00),
(9, 2, 'Relleno de Chocolate', 4.50),
(10, 2, 'Relleno de Ganache', 5.00),
(11, 2, 'Relleno de Crema Pastelera', 3.50),
(12, 3, 'Sabor Vainilla', 0.00),
(13, 3, 'Sabor Chocolate', 0.00),
(14, 3, 'Sabor Red Velvet', 2.00),
(15, 3, 'Sabor Tres Leches', 2.50),
(16, 3, 'Sabor Limon', 1.50),
(17, 3, 'Sabor Naranja', 1.50),
(18, 3, 'Sabor Zanahoria', 2.00),
(19, 4, 'Temática Infantil', 10.00),
(20, 4, 'Temática Princesas', 12.00),
(21, 4, 'Temática Superhéroes', 12.00),
(22, 4, 'Temática Minimalista', 5.00),
(23, 4, 'Temática Floral', 8.00),
(24, 4, 'Temática Anime', 15.00),
(25, 4, 'Temática Gamer', 12.00),
(26, 4, 'Temática Deportiva', 10.00),
(27, 5, 'Feliz Cumpleaños', 2.00),
(28, 5, 'Feliz Aniversario', 2.50),
(29, 5, 'Te Amo', 2.00),
(30, 5, 'Feliz Día Mamá', 3.00),
(31, 5, 'Feliz Día Papá', 3.00),
(32, 5, 'Gracias por Todo', 2.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio_base` decimal(10,2) NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') DEFAULT 'ACTIVO',
  `id_categoria` int(11) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `precio_base`, `estado`, `id_categoria`, `imagen_url`) VALUES
(10, 'Torta de Fresas', 'Torta esponjosa con relleno de fresas frescas y crema chantilly', 180.00, 'ACTIVO', 1, '/uploads/productos/a3cbb719-deba-4aeb-b604-047a6cf373d1-pastel de fresas.jpg'),
(15, 'Pastel de Tres Leches', 'Clásico pastel empapado en tres leches con canela', 120.00, 'ACTIVO', 1, '/uploads/productos/0fe4995c-8186-4b93-bac5-00ec1e31ebd6-Pastel de Tres Leches.jpg'),
(17, 'Café Gourmet', 'Café de especialidad recién molido, perfecto para acompañar tus postres', 8.00, 'ACTIVO', NULL, '/uploads/productos/17f60a38-7c58-4555-b01c-ec24584b1cfe-Café Gourmet.webp'),
(19, 'Pastel de Chocolate', 'Pastel clásico de chocolate con cobertura cremosa.', 45.00, 'ACTIVO', 1, '/uploads/productos/d6031d8e-846b-4176-b45e-d4155926ab1c-pastel%20de%20chocolate.jpg'),
(28, 'Pastel de Chocolate', 'Pastel clásico de chocolate con cobertura cremosa.', 45.00, 'ACTIVO', 1, '/uploads/productos/d6031d8e-846b-4176-b45e-d4155926ab1c-pastel%20de%20chocolate.jpg'),
(40, 'Pastel Naruto', 'Pastel temático de Naruto, ideal para fanáticos del anime y decorado con el símbolo de la Hoja.', 135.00, 'ACTIVO', 2, '/uploads/productos/naruto1.jfif'),
(41, 'Pastel Spiderman', 'Pastel con diseño del Hombre Araña, cubierto con telarañas de glaseado rojo y azul.', 140.00, 'ACTIVO', 2, '/uploads/productos/hombrearaña.jfif'),
(42, 'Pastel Paw Patrol', 'Pastel con los personajes de Paw Patrol, perfecto para celebraciones infantiles.', 125.50, 'ACTIVO', 2, '/uploads/productos/pawpatrol.jfif'),
(43, 'Pastel Bob Esponja', 'Diseño divertido de Bob Esponja y sus amigos en Fondo de Bikini.', 115.00, 'ACTIVO', 2, '/uploads/productos/bobsponga.jfif'),
(44, 'Pastel Goku', 'Pastel de Dragon Ball con el personaje Goku en acción, ideal para fiestas temáticas.', 145.99, 'ACTIVO', 2, '/uploads/productos/goku.jfif'),
(45, 'Torta Personalizada Candy', 'Torta temática inspirada en Candy, totalmente personalizable.', 65.00, 'ACTIVO', 2, '/uploads/productos/candy.jpg'),
(46, 'Torta Personalizada Stitch', 'Torta temática de Stitch ideal para cumpleaños, personalizable.', 70.00, 'ACTIVO', 2, '/uploads/productos/stich.jpg'),
(47, 'Torta Personalizada Batman', 'Torta temática de Batman con detalles personalizables.', 75.00, 'ACTIVO', 2, '/uploads/productos/batman.jpg'),
(48, 'Torta Personalizada Lego', 'Torta temática de Lego con bloques comestibles personalizados.', 72.00, 'ACTIVO', 2, '/uploads/productos/lego.jpg'),
(49, 'Torta Personalizada Barbie', 'Torta temática de Barbie totalmente personalizable.', 68.00, 'ACTIVO', 2, '/uploads/productos/barbie.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`) VALUES
(1, 'ADMIN'),
(2, '[CLIENTE]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `rol_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `email`, `contrasena`, `telefono`, `direccion`, `rol_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Esencia', 'admin@esencia.com', 'admin123', '987654321', 'Calle Ficticia 123', 1, '2025-11-20 10:08:18', '2025-11-20 10:08:18'),
(2, 'Cliente', 'Esencia', 'cliente@esencia.com', 'cliente123', '987654321', 'Calle Ficticia 123', 2, '2025-11-20 15:08:18', '2025-11-20 15:08:18'),
(5, 'can', 'bar', 'can@gmail.com', '123456', '933933933', 'jiron123', 2, '2025-11-29 11:01:56', '2025-11-29 11:01:56'),
(6, 'Candy', 'Barreda', 'candy@gmail.com', '123456789', '933800800', 'jiron justo naveda 241', 2, '2025-11-29 11:50:19', '2025-11-29 11:50:19'),
(8, 'candy', 'barreda', 'candy123@gmail.com', '987654321', '999999999', 'jiron justo', 2, '2025-11-29 12:21:29', '2025-11-29 12:21:29'),
(9, 'candy', 'barreda', 'candy321@gmail.com', '321654987', '999999999', 'hiron', 2, '2025-11-29 12:23:02', '2025-11-29 12:23:02'),
(10, 'Ana', 'García', 'ana@gmail.com', '123456', '987654321', 'Av. Lima 123', 2, '2025-11-29 10:09:44', '2025-11-29 10:09:44'),
(11, 'Carlos', 'Ramírez', 'carlos@gmail.com', 'abc123', '999888777', 'Calle Perú 456', 2, '2025-11-29 10:09:44', '2025-11-29 10:09:44'),
(12, 'vale', 'alarte', 'vale123@gmail.com', '123456', '99999999', 'jiron123', 2, '2025-12-01 10:22:56', '2025-12-01 10:22:56'),
(13, 'mateo', 'rodolfo', 'mateo123@gmail.com', '123456', '933933933', 'jiron andalusia', 2, '2025-12-01 12:50:29', '2025-12-01 12:50:29'),
(14, 'luis', 'villegas', 'luis@gmail.com', '123456', '987987987', 'jiron', 2, '2025-12-01 14:13:09', '2025-12-01 14:13:09'),
(15, 'mateo', 'diaz', 'mateo@gmail.com', '123456', '987987987', 'jiron lima', 2, '2025-12-01 14:58:56', '2025-12-01 14:58:56'),
(16, 'maria', 'almenara', 'mariaAlmenara@gmail.com', '123456', '999888777', 'jiron fictios', 2, '2025-12-03 21:39:33', '2025-12-03 21:39:33'),
(17, 'maria2', 'almenara1', 'maria2@gmail.com', '123456', '999888666', 'jironfivtio', 2, '2025-12-03 21:44:47', '2025-12-03 21:44:47'),
(18, 'candy1', 'barreda', 'candy1@gmail.com', '123456', '966966966', 'calle fictia', 2, '2025-12-03 21:53:22', '2025-12-03 21:53:22'),
(19, 'candy2', 'barreda', 'candy2@gmail.com', '123456', '933933933', 'jiron fictio', 2, '2025-12-03 22:00:22', '2025-12-03 22:00:22');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_personalizado`
--
ALTER TABLE `categoria_personalizado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria_producto_categoria_personalizacion`
--
ALTER TABLE `categoria_producto_categoria_personalizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cp_cpz_producto` (`id_categoria_producto`),
  ADD KEY `fk_cp_cpz_personalizado` (`id_categoria_personalizado`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `fk_detalle_pedido` (`id_pedido`),
  ADD KEY `fk_detalle_producto` (`id_producto`);

--
-- Indices de la tabla `detallepersonalizacion`
--
ALTER TABLE `detallepersonalizacion`
  ADD PRIMARY KEY (`id_detalle_personalizacion`),
  ADD KEY `fk_dp_detalle` (`id_detalle`),
  ADD KEY `fk_dp_personalizacion` (`id_personalizacion`);

--
-- Indices de la tabla `detalle_pedido_historico`
--
ALTER TABLE `detalle_pedido_historico`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `fk_historial_pedido` (`id_pedido`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `fk_notificacion_usuario` (`id_usuario`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `fk_pago_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_pedido_usuario` (`id_usuario`);

--
-- Indices de la tabla `personalizacion`
--
ALTER TABLE `personalizacion`
  ADD PRIMARY KEY (`id_personalizacion`),
  ADD KEY `fk_personalizacion_categoria` (`id_categoria_personalizado`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_categoria` (`id_categoria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_personalizado`
--
ALTER TABLE `categoria_personalizado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categoria_producto_categoria_personalizacion`
--
ALTER TABLE `categoria_producto_categoria_personalizacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detallepersonalizacion`
--
ALTER TABLE `detallepersonalizacion`
  MODIFY `id_detalle_personalizacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido_historico`
--
ALTER TABLE `detalle_pedido_historico`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personalizacion`
--
ALTER TABLE `personalizacion`
  MODIFY `id_personalizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria_producto_categoria_personalizacion`
--
ALTER TABLE `categoria_producto_categoria_personalizacion`
  ADD CONSTRAINT `fk_cp_cpz_personalizado` FOREIGN KEY (`id_categoria_personalizado`) REFERENCES `categoria_personalizado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cp_cpz_producto` FOREIGN KEY (`id_categoria_producto`) REFERENCES `categoria_producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detallepersonalizacion`
--
ALTER TABLE `detallepersonalizacion`
  ADD CONSTRAINT `fk_dp_detalle` FOREIGN KEY (`id_detalle`) REFERENCES `detallepedido` (`id_detalle`),
  ADD CONSTRAINT `fk_dp_personalizacion` FOREIGN KEY (`id_personalizacion`) REFERENCES `personalizacion` (`id_personalizacion`);

--
-- Filtros para la tabla `detalle_pedido_historico`
--
ALTER TABLE `detalle_pedido_historico`
  ADD CONSTRAINT `fk_historial_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `fk_notificacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `personalizacion`
--
ALTER TABLE `personalizacion`
  ADD CONSTRAINT `fk_personalizacion_categoria` FOREIGN KEY (`id_categoria_personalizado`) REFERENCES `categoria_personalizado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_producto` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id_rol`);
--
-- Base de datos: `lenas_humos_db`
--
CREATE DATABASE IF NOT EXISTS `lenas_humos_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `lenas_humos_db`;

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
--
-- Base de datos: `peluchesperudb`
--
CREATE DATABASE IF NOT EXISTS `peluchesperudb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `peluchesperudb`;
--
-- Base de datos: `peluches_peru`
--
CREATE DATABASE IF NOT EXISTS `peluches_peru` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `peluches_peru`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id_almacen` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `responsable` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id_almacen`, `nombre`, `direccion`, `responsable`, `telefono`, `estado`, `fecha_creacion`) VALUES
(1, 'Almacén Central', 'Lima', 'Administrador', NULL, 1, '2026-08-02 22:50:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` enum('ACTIVO','ABANDONADO','CONVERTIDO','CANCELADO') DEFAULT 'ACTIVO',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `id_usuario`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 2, 'ACTIVO', '2026-08-02 23:12:26', '2026-08-02 23:12:26'),
(2, 3, 'ACTIVO', '2026-08-02 23:12:26', '2026-08-02 23:12:26'),
(3, 4, 'ABANDONADO', '2026-08-02 23:12:26', '2026-08-02 23:12:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `icono` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`, `icono`, `estado`, `fecha_creacion`) VALUES
(1, 'Peluches', 'Peluches de animales peruanos', NULL, 1, '2026-08-02 22:50:21'),
(2, 'Llaveros', 'Llaveros de peluche', NULL, 1, '2026-08-02 22:50:21'),
(3, 'Edición Especial', 'Colecciones limitadas', NULL, 1, '2026-08-02 22:50:21'),
(4, 'Accesorios', 'Productos complementarios', NULL, 1, '2026-08-02 22:50:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coleccion`
--

CREATE TABLE `coleccion` (
  `id_coleccion` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `imagen_banner` varchar(500) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `coleccion`
--

INSERT INTO `coleccion` (`id_coleccion`, `nombre`, `descripcion`, `imagen_banner`, `estado`, `fecha_creacion`) VALUES
(1, 'Aves del Perú', 'Colección inspirada en aves emblemáticas', NULL, 1, '2026-08-02 22:50:21'),
(2, 'Fauna Amazónica', 'Animales de la Amazonía', NULL, 1, '2026-08-02 22:50:21'),
(3, 'Mamíferos Andinos', 'Especies de los Andes', NULL, 1, '2026-08-02 22:50:21'),
(4, 'Edición Coleccionista', 'Peluches exclusivos', NULL, 1, '2026-08-02 22:50:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupon`
--

CREATE TABLE `cupon` (
  `id_cupon` int(11) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `tipo_descuento` enum('PORCENTAJE','MONTO_FIJO') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `compra_minima` decimal(10,2) DEFAULT 0.00,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `usos_maximos` int(11) DEFAULT NULL,
  `usos_actuales` int(11) DEFAULT 0,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_variante` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `id_pedido`, `id_variante`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 1, 1, 2, 79.90, 159.80),
(2, 2, 2, 1, 109.90, 109.90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `departamento` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `distrito` varchar(100) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `referencia` varchar(250) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `predeterminada` tinyint(1) DEFAULT 0,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `id_usuario`, `alias`, `departamento`, `provincia`, `distrito`, `direccion`, `referencia`, `codigo_postal`, `predeterminada`, `estado`, `fecha_creacion`) VALUES
(1, 2, 'Casa', 'Lima', 'Lima', 'Miraflores', 'Av. Larco 123', NULL, NULL, 1, 1, '2026-08-02 23:12:26'),
(2, 3, 'Casa', 'Cusco', 'Cusco', 'Wanchaq', 'Av. Perú 450', NULL, NULL, 1, 1, '2026-08-02 23:12:26'),
(3, 4, 'Casa', 'Arequipa', 'Arequipa', 'Yanahuara', 'Calle Grau 800', NULL, NULL, 1, 1, '2026-08-02 23:12:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donacion`
--

CREATE TABLE `donacion` (
  `id_donacion` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `organizacion` varchar(150) DEFAULT NULL,
  `proyecto` varchar(200) DEFAULT NULL,
  `mensaje` varchar(300) DEFAULT NULL,
  `anonima` tinyint(1) DEFAULT 0,
  `estado` enum('PENDIENTE','CONFIRMADA','TRANSFERIDA') DEFAULT 'PENDIENTE',
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `donacion`
--

INSERT INTO `donacion` (`id_donacion`, `id_pedido`, `monto`, `organizacion`, `proyecto`, `mensaje`, `anonima`, `estado`, `fecha`) VALUES
(1, 1, 5.00, 'SERNANP', 'Protección del Gallito de las Rocas', NULL, 0, 'CONFIRMADA', '2026-08-02 23:12:26');

--
-- Disparadores `donacion`
--
DELIMITER $$
CREATE TRIGGER `trg_donacion_ai` AFTER INSERT ON `donacion` FOR EACH ROW BEGIN

    INSERT INTO log_auditoria
    (
        tabla,
        accion,
        descripcion
    )

    VALUES
    (
        'donacion',
        'INSERT',
        CONCAT('Donación registrada por S/ ', NEW.monto)
    );

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id_envio` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `empresa_transporte` varchar(120) DEFAULT NULL,
  `codigo_seguimiento` varchar(120) DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `observaciones` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especie`
--

CREATE TABLE `especie` (
  `id_especie` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_region` int(11) NOT NULL,
  `nombre_comun` varchar(150) NOT NULL,
  `nombre_cientifico` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `alimentacion` varchar(300) DEFAULT NULL,
  `habitat` varchar(300) DEFAULT NULL,
  `esperanza_vida` smallint(6) DEFAULT NULL,
  `peso_promedio` decimal(6,2) DEFAULT NULL,
  `altura_promedio` decimal(6,2) DEFAULT NULL,
  `curiosidades` text DEFAULT NULL,
  `imagen_mapa` varchar(500) DEFAULT NULL,
  `video` varchar(500) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `especie`
--

INSERT INTO `especie` (`id_especie`, `id_estado`, `id_region`, `nombre_comun`, `nombre_cientifico`, `descripcion`, `alimentacion`, `habitat`, `esperanza_vida`, `peso_promedio`, `altura_promedio`, `curiosidades`, `imagen_mapa`, `video`, `estado`, `fecha_creacion`) VALUES
(1, 4, 4, 'Gallito de las Rocas', 'Rupicola peruvianus', 'Ave nacional del Perú conocida por su espectacular cresta roja.', 'Frutas e insectos', 'Bosques nublados andinos', 15, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-02 22:50:21'),
(2, 4, 2, 'Oso de Anteojos', 'Tremarctos ornatus', 'Único oso de Sudamérica.', 'Omnívoro', 'Bosques andinos', 25, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-02 22:50:21'),
(3, 5, 3, 'Mono Choro de Cola Amarilla', 'Lagothrix flavicauda', 'Primate endémico del Perú.', 'Frutas', 'Selva alta', 22, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-02 22:50:21'),
(4, 4, 3, 'Manatí Amazónico', 'Trichechus inunguis', 'Mamífero acuático amazónico.', 'Vegetación acuática', 'Ríos amazónicos', 35, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-02 22:50:21'),
(5, 4, 3, 'Delfín Rosado', 'Inia geoffrensis', 'Delfín de agua dulce.', 'Peces', 'Amazonía', 30, NULL, NULL, NULL, NULL, NULL, 1, '2026-08-02 22:50:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especie_imagen`
--

CREATE TABLE `especie_imagen` (
  `id_imagen` int(11) NOT NULL,
  `id_especie` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `fotografo` varchar(150) DEFAULT NULL,
  `fuente` varchar(255) DEFAULT NULL,
  `principal` tinyint(1) DEFAULT 0,
  `orden` tinyint(4) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `especie_imagen`
--

INSERT INTO `especie_imagen` (`id_imagen`, `id_especie`, `url`, `titulo`, `descripcion`, `fotografo`, `fuente`, `principal`, `orden`, `fecha_creacion`) VALUES
(1, 1, '/especies/gallito1.jpg', 'Gallito de las Rocas', NULL, NULL, NULL, 1, 1, '2026-08-02 22:50:21'),
(2, 1, '/especies/gallito2.jpg', 'Hábitat natural', NULL, NULL, NULL, 0, 2, '2026-08-02 22:50:21'),
(3, 2, '/especies/oso1.jpg', 'Oso de Anteojos', NULL, NULL, NULL, 1, 1, '2026-08-02 22:50:21'),
(4, 3, '/especies/mono1.jpg', 'Mono Choro', NULL, NULL, NULL, 1, 1, '2026-08-02 22:50:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_conservacion`
--

CREATE TABLE `estado_conservacion` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `orden` tinyint(4) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_conservacion`
--

INSERT INTO `estado_conservacion` (`id_estado`, `nombre`, `descripcion`, `color`, `orden`, `estado`) VALUES
(1, 'Preocupación Menor', 'Bajo riesgo', '#4CAF50', 1, 1),
(2, 'Casi Amenazado', 'Riesgo moderado', '#8BC34A', 2, 1),
(3, 'Vulnerable', 'Riesgo alto', '#FFC107', 3, 1),
(4, 'En Peligro', 'Muy alto riesgo', '#FF5722', 4, 1),
(5, 'En Peligro Crítico', 'Riesgo extremo', '#D32F2F', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `id_estado_pedido` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `orden` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta`
--

CREATE TABLE `etiqueta` (
  `id_etiqueta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `etiqueta`
--

INSERT INTO `etiqueta` (`id_etiqueta`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Hecho a Mano', 'Producto artesanal', 1),
(2, 'Material Reciclado', 'Material sostenible', 1),
(3, 'Coleccionable', 'Edición para colección', 1),
(4, 'Edición Limitada', 'Producción limitada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorito`
--

CREATE TABLE `favorito` (
  `id_favorito` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `favorito`
--

INSERT INTO `favorito` (`id_favorito`, `id_usuario`, `id_producto`, `fecha_creacion`) VALUES
(1, 2, 1, '2026-08-02 23:12:26'),
(2, 3, 1, '2026-08-02 23:12:26'),
(3, 4, 1, '2026-08-02 23:12:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_pedido`
--

CREATE TABLE `historial_pedido` (
  `id_historial` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_estado_pedido` int(11) NOT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `usuario_responsable` varchar(120) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_producto`
--

CREATE TABLE `imagen_producto` (
  `id_imagen` int(11) NOT NULL,
  `id_variante` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `texto_alternativo` varchar(255) DEFAULT NULL,
  `principal` tinyint(1) DEFAULT 0,
  `orden` tinyint(4) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `imagen_producto`
--

INSERT INTO `imagen_producto` (`id_imagen`, `id_variante`, `url`, `texto_alternativo`, `principal`, `orden`, `fecha_creacion`) VALUES
(1, 1, '/img/gallito25_1.webp', 'Gallito de las Rocas 25 cm', 1, 1, '2026-08-02 22:50:21'),
(2, 1, '/img/gallito25_2.webp', 'Vista lateral', 0, 2, '2026-08-02 22:50:21'),
(3, 2, '/img/gallito35.webp', 'Gallito 35 cm', 1, 1, '2026-08-02 22:50:21'),
(4, 3, '/img/gallito_llavero.webp', 'Llavero', 1, 1, '2026-08-02 22:50:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL,
  `id_variante` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_almacen` int(11) NOT NULL,
  `stock_disponible` int(11) NOT NULL DEFAULT 0,
  `stock_reservado` int(11) NOT NULL DEFAULT 0,
  `stock_minimo` int(11) NOT NULL DEFAULT 5,
  `ubicacion` varchar(80) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `id_variante`, `id_lote`, `id_almacen`, `stock_disponible`, `stock_reservado`, `stock_minimo`, `ubicacion`, `fecha_actualizacion`) VALUES
(1, 1, 1, 1, 50, 0, 10, NULL, '2026-08-02 22:50:21'),
(2, 2, 1, 1, 30, 0, 5, NULL, '2026-08-02 22:50:21'),
(3, 3, 1, 1, 20, 0, 5, NULL, '2026-08-02 22:50:21');

--
-- Disparadores `inventario`
--
DELIMITER $$
CREATE TRIGGER `trg_inventario_au` AFTER UPDATE ON `inventario` FOR EACH ROW BEGIN

    IF NEW.stock_disponible <> OLD.stock_disponible THEN

        INSERT INTO movimiento_inventario
        (
            id_inventario,
            tipo_movimiento,
            cantidad,
            motivo
        )

        VALUES
        (
            NEW.id_inventario,
            IF(NEW.stock_disponible < OLD.stock_disponible,
               'SALIDA',
               'ENTRADA'),
            ABS(NEW.stock_disponible - OLD.stock_disponible),
            'Actualización automática'
        );

    END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_inventario_validacion` BEFORE UPDATE ON `inventario` FOR EACH ROW BEGIN

    IF NEW.stock_disponible < 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Stock insuficiente';

    END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_carrito`
--

CREATE TABLE `item_carrito` (
  `id_item` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_variante` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `item_carrito`
--

INSERT INTO `item_carrito` (`id_item`, `id_carrito`, `id_variante`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 1, 1, 2, 79.90, 159.80),
(2, 2, 2, 1, 109.90, 109.90);

--
-- Disparadores `item_carrito`
--
DELIMITER $$
CREATE TRIGGER `trg_item_carrito_bi` BEFORE INSERT ON `item_carrito` FOR EACH ROW BEGIN

    SET NEW.subtotal = NEW.cantidad * NEW.precio_unitario;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_item_carrito_bu` BEFORE UPDATE ON `item_carrito` FOR EACH ROW BEGIN

    SET NEW.subtotal = NEW.cantidad * NEW.precio_unitario;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_auditoria`
--

CREATE TABLE `log_auditoria` (
  `id_log` bigint(20) NOT NULL,
  `tabla` varchar(100) NOT NULL,
  `accion` enum('INSERT','UPDATE','DELETE','LOGIN','LOGOUT') NOT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `log_auditoria`
--

INSERT INTO `log_auditoria` (`id_log`, `tabla`, `accion`, `usuario`, `descripcion`, `ip`, `fecha`) VALUES
(1, 'usuario', 'INSERT', 'admin@peluchesperu.pe', 'Nuevo usuario registrado', NULL, '2026-08-02 23:12:26'),
(2, 'usuario', 'INSERT', 'candy@correo.com', 'Nuevo usuario registrado', NULL, '2026-08-02 23:12:26'),
(3, 'usuario', 'INSERT', 'luis@gmail.com', 'Nuevo usuario registrado', NULL, '2026-08-02 23:12:26'),
(4, 'usuario', 'INSERT', 'maria@gmail.com', 'Nuevo usuario registrado', NULL, '2026-08-02 23:12:26'),
(5, 'donacion', 'INSERT', NULL, 'Donación registrada por S/ 5.00', NULL, '2026-08-02 23:12:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id_lote` int(11) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `fecha_fabricacion` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `cantidad_inicial` int(11) NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `observacion` varchar(300) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id_lote`, `codigo`, `fecha_fabricacion`, `fecha_ingreso`, `cantidad_inicial`, `costo_unitario`, `observacion`, `estado`) VALUES
(1, 'LOT-0001', '2026-08-01', '2026-08-02', 100, 35.00, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `id_material` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `es_hipoalergenico` tinyint(1) DEFAULT 0,
  `es_reciclado` tinyint(1) DEFAULT 0,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`id_material`, `nombre`, `descripcion`, `es_hipoalergenico`, `es_reciclado`, `estado`) VALUES
(1, 'Minky Premium', 'Tela extra suave', 1, 0, 1),
(2, 'Felpa', 'Felpa tradicional', 1, 0, 1),
(3, 'Algodón Orgánico', 'Algodón ecológico', 1, 1, 1),
(4, 'Relleno Siliconado', 'Fibra siliconada premium', 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodo` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodo`, `nombre`, `descripcion`, `activo`) VALUES
(1, 'Yape', 'Pago mediante Yape', 1),
(2, 'Plin', 'Pago mediante Plin', 1),
(3, 'Visa', 'Tarjeta Visa', 1),
(4, 'Mastercard', 'Tarjeta Mastercard', 1),
(5, 'Transferencia', 'Transferencia bancaria', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_inventario`
--

CREATE TABLE `movimiento_inventario` (
  `id_movimiento` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `tipo_movimiento` enum('ENTRADA','SALIDA','AJUSTE','DEVOLUCION','RESERVA','LIBERACION') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `motivo` varchar(250) DEFAULT NULL,
  `usuario_responsable` varchar(150) DEFAULT NULL,
  `fecha_movimiento` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id_notificacion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `mensaje` text NOT NULL,
  `tipo` enum('SISTEMA','PEDIDO','PAGO','PROMOCION') NOT NULL,
  `leido` tinyint(1) DEFAULT 0,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`id_notificacion`, `id_usuario`, `titulo`, `mensaje`, `tipo`, `leido`, `fecha`) VALUES
(1, 2, 'Pedido entregado', 'Tu pedido PED-000001 fue entregado correctamente.', 'PEDIDO', 0, '2026-08-02 23:12:26'),
(2, 3, 'Pedido en preparación', 'Estamos preparando tu pedido.', 'PEDIDO', 0, '2026-08-02 23:12:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `codigo_operacion` varchar(150) DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` enum('PENDIENTE','APROBADO','RECHAZADO','REEMBOLSADO') DEFAULT 'PENDIENTE',
  `fecha_pago` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `id_pedido`, `codigo_operacion`, `monto`, `estado`, `fecha_pago`) VALUES
(1, 1, 'YAPE123456', 169.80, 'APROBADO', '2026-08-02 23:12:26'),
(2, 2, 'PLIN888999', 119.90, 'PENDIENTE', '2026-08-02 23:12:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `numero_pedido` varchar(30) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_metodo` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) DEFAULT 0.00,
  `costo_envio` decimal(10,2) DEFAULT 0.00,
  `impuesto` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `estado` enum('PENDIENTE','PAGADO','PREPARANDO','ENVIADO','ENTREGADO','CANCELADO') DEFAULT 'PENDIENTE',
  `nombre_destinatario` varchar(150) NOT NULL,
  `telefono_destinatario` varchar(20) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `distrito` varchar(100) DEFAULT NULL,
  `direccion_envio` varchar(250) DEFAULT NULL,
  `referencia` varchar(250) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT current_timestamp(),
  `id_cupon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `numero_pedido`, `id_usuario`, `id_metodo`, `subtotal`, `descuento`, `costo_envio`, `impuesto`, `total`, `estado`, `nombre_destinatario`, `telefono_destinatario`, `departamento`, `provincia`, `distrito`, `direccion_envio`, `referencia`, `fecha_pedido`, `id_cupon`) VALUES
(1, 'PED-000001', 2, 1, 159.80, 0.00, 10.00, 0.00, 169.80, 'ENTREGADO', 'Candy Barreda', '987654321', 'Lima', 'Lima', 'Miraflores', 'Av. Larco 123', NULL, '2026-08-02 23:12:26', NULL),
(2, 'PED-000002', 3, 2, 109.90, 0.00, 10.00, 0.00, 119.90, 'PREPARANDO', 'Luis Ramirez', '987111222', 'Cusco', 'Cusco', 'Wanchaq', 'Av. Perú 450', NULL, '2026-08-02 23:12:26', NULL);

--
-- Disparadores `pedido`
--
DELIMITER $$
CREATE TRIGGER `trg_cupon_usado` AFTER INSERT ON `pedido` FOR EACH ROW BEGIN

    IF NEW.id_cupon IS NOT NULL THEN

        UPDATE cupon
        SET usos_actuales = usos_actuales + 1
        WHERE id_cupon = NEW.id_cupon;

    END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_notificacion_pedido` AFTER UPDATE ON `pedido` FOR EACH ROW BEGIN

    IF NEW.estado <> OLD.estado THEN

        INSERT INTO notificacion
        (
            id_usuario,
            titulo,
            mensaje,
            tipo
        )

        VALUES
        (
            NEW.id_usuario,
            'Actualización del pedido',
            CONCAT('Su pedido ahora está: ', NEW.estado),
            'PEDIDO'
        );

    END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_pedido_historial` AFTER UPDATE ON `pedido` FOR EACH ROW BEGIN

    IF NEW.estado <> OLD.estado THEN

        INSERT INTO historial_pedido
        (
            id_pedido,
            id_estado_pedido,
            observacion,
            usuario_responsable
        )

        SELECT
            NEW.id_pedido,
            ep.id_estado_pedido,
            CONCAT('Cambio de estado a ', NEW.estado),
            'Sistema'
        FROM estado_pedido ep
        WHERE ep.nombre = NEW.estado;

    END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_producto`
--

CREATE TABLE `precio_producto` (
  `id_precio` int(11) NOT NULL,
  `id_variante` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_inicio` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_fin` datetime DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `precio_producto`
--

INSERT INTO `precio_producto` (`id_precio`, `id_variante`, `precio`, `fecha_inicio`, `fecha_fin`, `activo`) VALUES
(1, 1, 79.90, '2026-08-02 22:50:21', NULL, 1),
(2, 2, 109.90, '2026-08-02 22:50:21', NULL, 1),
(3, 3, 29.90, '2026-08-02 22:50:21', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_especie` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `historia` text DEFAULT NULL,
  `instrucciones_cuidado` text DEFAULT NULL,
  `fabricante` varchar(150) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_categoria`, `id_especie`, `nombre`, `descripcion`, `historia`, `instrucciones_cuidado`, `fabricante`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 1, 'Gallito de las Rocas', 'Peluche inspirado en el ave nacional del Perú.', 'Diseñado para fomentar la conservación de la fauna peruana.', 'Lavar a mano.', 'Peluches Perú', 1, '2026-08-02 22:50:21', '2026-08-02 22:50:21');

--
-- Disparadores `producto`
--
DELIMITER $$
CREATE TRIGGER `trg_producto_au` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN

    INSERT INTO log_auditoria
    (
        tabla,
        accion,
        descripcion
    )

    VALUES
    (
        'producto',
        'UPDATE',
        CONCAT('Producto actualizado: ', NEW.nombre)
    );

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_coleccion`
--

CREATE TABLE `producto_coleccion` (
  `id_producto` int(11) NOT NULL,
  `id_coleccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_etiqueta`
--

CREATE TABLE `producto_etiqueta` (
  `id_producto` int(11) NOT NULL,
  `id_etiqueta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id_region` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id_region`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Costa', 'Fauna de la costa peruana', 1),
(2, 'Sierra', 'Fauna andina', 1),
(3, 'Selva', 'Fauna amazónica', 1),
(4, 'Bosque Nublado', 'Bosques montanos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resena`
--

CREATE TABLE `resena` (
  `id_resena` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `calificacion` tinyint(4) NOT NULL,
  `comentario` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `resena`
--

INSERT INTO `resena` (`id_resena`, `id_usuario`, `id_producto`, `calificacion`, `comentario`, `fecha`) VALUES
(1, 2, 1, 5, 'Excelente calidad y muy suave.', '2026-08-02 23:12:26'),
(2, 3, 1, 4, 'Muy bonito, ideal para regalar.', '2026-08-02 23:12:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`, `descripcion`, `estado`, `fecha_creacion`) VALUES
(1, 'ADMINISTRADOR', 'Administrador del sistema', 1, '2026-08-02 22:50:21'),
(2, 'CLIENTE', 'Cliente registrado', 1, '2026-08-02 22:50:21'),
(3, 'EMPLEADO', 'Gestión de pedidos e inventario', 1, '2026-08-02 22:50:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `foto_perfil` varchar(300) DEFAULT NULL,
  `ultimo_acceso` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_rol`, `nombres`, `apellidos`, `correo`, `password_hash`, `telefono`, `foto_perfil`, `ultimo_acceso`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 'Administrador', 'Sistema', 'admin@peluchesperu.pe', '$2a$10$xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '999111111', NULL, NULL, 1, '2026-08-02 23:12:26', '2026-08-02 23:12:26'),
(2, 2, 'Candy', 'Barreda', 'candy@correo.com', '$2a$10$xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '987654321', NULL, NULL, 1, '2026-08-02 23:12:26', '2026-08-02 23:12:26'),
(3, 2, 'Luis', 'Ramirez', 'luis@gmail.com', '$2a$10$xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '987111222', NULL, NULL, 1, '2026-08-02 23:12:26', '2026-08-02 23:12:26'),
(4, 2, 'María', 'Flores', 'maria@gmail.com', '$2a$10$xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '999888777', NULL, NULL, 1, '2026-08-02 23:12:26', '2026-08-02 23:12:26');

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `trg_usuario_ai` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN

    INSERT INTO log_auditoria
    (
        tabla,
        accion,
        usuario,
        descripcion
    )

    VALUES
    (
        'usuario',
        'INSERT',
        NEW.correo,
        'Nuevo usuario registrado'
    );

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variante_producto`
--

CREATE TABLE `variante_producto` (
  `id_variante` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `nombre_variante` varchar(100) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `tamano_cm` decimal(5,2) DEFAULT NULL,
  `peso_gramos` decimal(6,2) DEFAULT NULL,
  `alto_cm` decimal(5,2) DEFAULT NULL,
  `ancho_cm` decimal(5,2) DEFAULT NULL,
  `largo_cm` decimal(5,2) DEFAULT NULL,
  `edad_minima` tinyint(4) DEFAULT NULL,
  `costo_produccion` decimal(10,2) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `variante_producto`
--

INSERT INTO `variante_producto` (`id_variante`, `id_producto`, `id_material`, `sku`, `nombre_variante`, `color`, `tamano_cm`, `peso_gramos`, `alto_cm`, `ancho_cm`, `largo_cm`, `edad_minima`, `costo_produccion`, `activo`, `fecha_creacion`) VALUES
(1, 1, 1, 'GAL-25', '25 cm', 'Rojo', 25.00, 350.00, 25.00, 18.00, 18.00, 3, 35.00, 1, '2026-08-02 22:50:21'),
(2, 1, 1, 'GAL-35', '35 cm', 'Rojo', 35.00, 520.00, 35.00, 24.00, 24.00, 3, 48.00, 1, '2026-08-02 22:50:21'),
(3, 1, 1, 'GAL-KEY', 'Llavero', 'Rojo', 12.00, 90.00, 12.00, 8.00, 8.00, 3, 12.00, 1, '2026-08-02 22:50:21');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_catalogo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_catalogo` (
`id_producto` int(11)
,`nombre` varchar(150)
,`descripcion` text
,`categoria` varchar(80)
,`especie` varchar(150)
,`nombre_cientifico` varchar(200)
,`estado_conservacion` varchar(80)
,`id_variante` int(11)
,`nombre_variante` varchar(100)
,`sku` varchar(50)
,`precio` decimal(10,2)
,`stock_disponible` int(11)
,`imagen` varchar(500)
,`activo` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_dashboard`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_dashboard` (
`usuarios` bigint(21)
,`productos` bigint(21)
,`pedidos` bigint(21)
,`especies` bigint(21)
,`ventas` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_detalle_pedido`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_detalle_pedido` (
`id_detalle` int(11)
,`numero_pedido` varchar(30)
,`nombre` varchar(150)
,`nombre_variante` varchar(100)
,`cantidad` int(11)
,`precio_unitario` decimal(10,2)
,`subtotal` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_donaciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_donaciones` (
`id_donacion` int(11)
,`numero_pedido` varchar(30)
,`monto` decimal(10,2)
,`organizacion` varchar(150)
,`proyecto` varchar(200)
,`estado` enum('PENDIENTE','CONFIRMADA','TRANSFERIDA')
,`fecha` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_especies`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_especies` (
`id_especie` int(11)
,`nombre_comun` varchar(150)
,`nombre_cientifico` varchar(200)
,`estado` varchar(80)
,`region` varchar(100)
,`habitat` varchar(300)
,`alimentacion` varchar(300)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_favoritos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_favoritos` (
`id_usuario` int(11)
,`cliente` varchar(201)
,`id_producto` int(11)
,`nombre` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_inventario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_inventario` (
`nombre` varchar(150)
,`sku` varchar(50)
,`almacen` varchar(120)
,`stock_disponible` int(11)
,`stock_reservado` int(11)
,`stock_minimo` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_pedidos` (
`id_pedido` int(11)
,`numero_pedido` varchar(30)
,`cliente` varchar(201)
,`total` decimal(10,2)
,`estado` enum('PENDIENTE','PAGADO','PREPARANDO','ENVIADO','ENTREGADO','CANCELADO')
,`fecha_pedido` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_productos` (
`id_producto` int(11)
,`nombre` varchar(150)
,`categoria` varchar(80)
,`especie` varchar(150)
,`variantes` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_resenas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_resenas` (
`id_resena` int(11)
,`producto` varchar(150)
,`cliente` varchar(201)
,`calificacion` tinyint(4)
,`comentario` text
,`fecha` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_top_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_top_productos` (
`id_producto` int(11)
,`nombre` varchar(150)
,`vendidos` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_catalogo`
--
DROP TABLE IF EXISTS `vw_catalogo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_catalogo`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre` AS `nombre`, `p`.`descripcion` AS `descripcion`, `c`.`nombre` AS `categoria`, `e`.`nombre_comun` AS `especie`, `e`.`nombre_cientifico` AS `nombre_cientifico`, `ec`.`nombre` AS `estado_conservacion`, `vp`.`id_variante` AS `id_variante`, `vp`.`nombre_variante` AS `nombre_variante`, `vp`.`sku` AS `sku`, `pr`.`precio` AS `precio`, `i`.`stock_disponible` AS `stock_disponible`, `ip`.`url` AS `imagen`, `vp`.`activo` AS `activo` FROM (((((((`producto` `p` join `categoria` `c` on(`p`.`id_categoria` = `c`.`id_categoria`)) join `especie` `e` on(`p`.`id_especie` = `e`.`id_especie`)) join `estado_conservacion` `ec` on(`e`.`id_estado` = `ec`.`id_estado`)) join `variante_producto` `vp` on(`p`.`id_producto` = `vp`.`id_producto`)) join `precio_producto` `pr` on(`vp`.`id_variante` = `pr`.`id_variante`)) left join `inventario` `i` on(`vp`.`id_variante` = `i`.`id_variante`)) left join `imagen_producto` `ip` on(`vp`.`id_variante` = `ip`.`id_variante` and `ip`.`principal` = 1)) WHERE `vp`.`activo` = 1 AND `pr`.`activo` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_dashboard`
--
DROP TABLE IF EXISTS `vw_dashboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_dashboard`  AS SELECT (select count(0) from `usuario`) AS `usuarios`, (select count(0) from `producto`) AS `productos`, (select count(0) from `pedido`) AS `pedidos`, (select count(0) from `especie`) AS `especies`, (select sum(`pedido`.`total`) from `pedido` where `pedido`.`estado` = 'ENTREGADO') AS `ventas` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_detalle_pedido`
--
DROP TABLE IF EXISTS `vw_detalle_pedido`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_detalle_pedido`  AS SELECT `d`.`id_detalle` AS `id_detalle`, `ped`.`numero_pedido` AS `numero_pedido`, `p`.`nombre` AS `nombre`, `vp`.`nombre_variante` AS `nombre_variante`, `d`.`cantidad` AS `cantidad`, `d`.`precio_unitario` AS `precio_unitario`, `d`.`subtotal` AS `subtotal` FROM (((`detalle_pedido` `d` join `pedido` `ped` on(`d`.`id_pedido` = `ped`.`id_pedido`)) join `variante_producto` `vp` on(`d`.`id_variante` = `vp`.`id_variante`)) join `producto` `p` on(`vp`.`id_producto` = `p`.`id_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_donaciones`
--
DROP TABLE IF EXISTS `vw_donaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_donaciones`  AS SELECT `d`.`id_donacion` AS `id_donacion`, `ped`.`numero_pedido` AS `numero_pedido`, `d`.`monto` AS `monto`, `d`.`organizacion` AS `organizacion`, `d`.`proyecto` AS `proyecto`, `d`.`estado` AS `estado`, `d`.`fecha` AS `fecha` FROM (`donacion` `d` join `pedido` `ped` on(`d`.`id_pedido` = `ped`.`id_pedido`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_especies`
--
DROP TABLE IF EXISTS `vw_especies`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_especies`  AS SELECT `e`.`id_especie` AS `id_especie`, `e`.`nombre_comun` AS `nombre_comun`, `e`.`nombre_cientifico` AS `nombre_cientifico`, `ec`.`nombre` AS `estado`, `r`.`nombre` AS `region`, `e`.`habitat` AS `habitat`, `e`.`alimentacion` AS `alimentacion` FROM ((`especie` `e` join `estado_conservacion` `ec` on(`e`.`id_estado` = `ec`.`id_estado`)) join `region` `r` on(`e`.`id_region` = `r`.`id_region`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_favoritos`
--
DROP TABLE IF EXISTS `vw_favoritos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_favoritos`  AS SELECT `u`.`id_usuario` AS `id_usuario`, concat(`u`.`nombres`,' ',`u`.`apellidos`) AS `cliente`, `p`.`id_producto` AS `id_producto`, `p`.`nombre` AS `nombre` FROM ((`favorito` `f` join `usuario` `u` on(`f`.`id_usuario` = `u`.`id_usuario`)) join `producto` `p` on(`f`.`id_producto` = `p`.`id_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_inventario`
--
DROP TABLE IF EXISTS `vw_inventario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_inventario`  AS SELECT `p`.`nombre` AS `nombre`, `vp`.`sku` AS `sku`, `a`.`nombre` AS `almacen`, `i`.`stock_disponible` AS `stock_disponible`, `i`.`stock_reservado` AS `stock_reservado`, `i`.`stock_minimo` AS `stock_minimo` FROM (((`inventario` `i` join `variante_producto` `vp` on(`i`.`id_variante` = `vp`.`id_variante`)) join `producto` `p` on(`vp`.`id_producto` = `p`.`id_producto`)) join `almacen` `a` on(`i`.`id_almacen` = `a`.`id_almacen`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_pedidos`
--
DROP TABLE IF EXISTS `vw_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_pedidos`  AS SELECT `ped`.`id_pedido` AS `id_pedido`, `ped`.`numero_pedido` AS `numero_pedido`, concat(`u`.`nombres`,' ',`u`.`apellidos`) AS `cliente`, `ped`.`total` AS `total`, `ped`.`estado` AS `estado`, `ped`.`fecha_pedido` AS `fecha_pedido` FROM (`pedido` `ped` join `usuario` `u` on(`ped`.`id_usuario` = `u`.`id_usuario`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_productos`
--
DROP TABLE IF EXISTS `vw_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_productos`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre` AS `nombre`, `c`.`nombre` AS `categoria`, `e`.`nombre_comun` AS `especie`, count(`vp`.`id_variante`) AS `variantes` FROM (((`producto` `p` left join `categoria` `c` on(`p`.`id_categoria` = `c`.`id_categoria`)) left join `especie` `e` on(`p`.`id_especie` = `e`.`id_especie`)) left join `variante_producto` `vp` on(`p`.`id_producto` = `vp`.`id_producto`)) GROUP BY `p`.`id_producto` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_resenas`
--
DROP TABLE IF EXISTS `vw_resenas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_resenas`  AS SELECT `r`.`id_resena` AS `id_resena`, `p`.`nombre` AS `producto`, concat(`u`.`nombres`,' ',`u`.`apellidos`) AS `cliente`, `r`.`calificacion` AS `calificacion`, `r`.`comentario` AS `comentario`, `r`.`fecha` AS `fecha` FROM ((`resena` `r` join `usuario` `u` on(`r`.`id_usuario` = `u`.`id_usuario`)) join `producto` `p` on(`r`.`id_producto` = `p`.`id_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_top_productos`
--
DROP TABLE IF EXISTS `vw_top_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_top_productos`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre` AS `nombre`, sum(`dp`.`cantidad`) AS `vendidos` FROM ((`detalle_pedido` `dp` join `variante_producto` `vp` on(`dp`.`id_variante` = `vp`.`id_variante`)) join `producto` `p` on(`vp`.`id_producto` = `p`.`id_producto`)) GROUP BY `p`.`id_producto` ORDER BY sum(`dp`.`cantidad`) DESC ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id_almacen`),
  ADD UNIQUE KEY `uq_almacen_nombre` (`nombre`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `idx_carrito_usuario` (`id_usuario`),
  ADD KEY `idx_carrito_estado` (`estado`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `uq_categoria_nombre` (`nombre`);

--
-- Indices de la tabla `coleccion`
--
ALTER TABLE `coleccion`
  ADD PRIMARY KEY (`id_coleccion`),
  ADD UNIQUE KEY `uq_coleccion_nombre` (`nombre`);

--
-- Indices de la tabla `cupon`
--
ALTER TABLE `cupon`
  ADD PRIMARY KEY (`id_cupon`),
  ADD UNIQUE KEY `uq_cupon_codigo` (`codigo`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `idx_detalle_pedido` (`id_pedido`),
  ADD KEY `idx_detalle_variante` (`id_variante`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `fk_direccion_usuario` (`id_usuario`);

--
-- Indices de la tabla `donacion`
--
ALTER TABLE `donacion`
  ADD PRIMARY KEY (`id_donacion`),
  ADD KEY `idx_donacion_pedido` (`id_pedido`),
  ADD KEY `idx_donacion_estado` (`estado`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `idx_envio_pedido` (`id_pedido`),
  ADD KEY `idx_envio_seguimiento` (`codigo_seguimiento`);

--
-- Indices de la tabla `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`id_especie`),
  ADD UNIQUE KEY `uq_nombre_cientifico` (`nombre_cientifico`),
  ADD KEY `idx_especie_estado` (`id_estado`),
  ADD KEY `idx_especie_region` (`id_region`),
  ADD KEY `idx_especie_nombre` (`nombre_comun`);

--
-- Indices de la tabla `especie_imagen`
--
ALTER TABLE `especie_imagen`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `idx_especie_imagen` (`id_especie`),
  ADD KEY `idx_especie_principal` (`principal`);

--
-- Indices de la tabla `estado_conservacion`
--
ALTER TABLE `estado_conservacion`
  ADD PRIMARY KEY (`id_estado`),
  ADD UNIQUE KEY `uq_estado` (`nombre`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`id_estado_pedido`),
  ADD UNIQUE KEY `uq_estado_pedido` (`nombre`);

--
-- Indices de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`id_etiqueta`),
  ADD UNIQUE KEY `uq_etiqueta_nombre` (`nombre`);

--
-- Indices de la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`id_favorito`),
  ADD UNIQUE KEY `uq_favorito` (`id_usuario`,`id_producto`),
  ADD KEY `idx_favorito_usuario` (`id_usuario`),
  ADD KEY `idx_favorito_producto` (`id_producto`);

--
-- Indices de la tabla `historial_pedido`
--
ALTER TABLE `historial_pedido`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `fk_historial_pedido` (`id_pedido`),
  ADD KEY `fk_historial_estado` (`id_estado_pedido`);

--
-- Indices de la tabla `imagen_producto`
--
ALTER TABLE `imagen_producto`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `idx_imagen_variante` (`id_variante`),
  ADD KEY `idx_imagen_principal` (`principal`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `idx_inventario_variante` (`id_variante`),
  ADD KEY `idx_inventario_lote` (`id_lote`),
  ADD KEY `idx_inventario_almacen` (`id_almacen`),
  ADD KEY `idx_inventario_almacen_variante` (`id_almacen`,`id_variante`);

--
-- Indices de la tabla `item_carrito`
--
ALTER TABLE `item_carrito`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `idx_item_carrito` (`id_carrito`),
  ADD KEY `idx_item_variante` (`id_variante`);

--
-- Indices de la tabla `log_auditoria`
--
ALTER TABLE `log_auditoria`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `idx_log_fecha` (`fecha`),
  ADD KEY `idx_log_tabla` (`tabla`),
  ADD KEY `idx_log_accion` (`accion`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id_lote`),
  ADD UNIQUE KEY `uq_lote_codigo` (`codigo`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id_material`),
  ADD UNIQUE KEY `uq_material` (`nombre`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodo`),
  ADD UNIQUE KEY `uq_metodo_pago` (`nombre`);

--
-- Indices de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `idx_movimiento_inventario` (`id_inventario`),
  ADD KEY `idx_movimiento_fecha` (`fecha_movimiento`),
  ADD KEY `idx_movimiento_tipo` (`tipo_movimiento`),
  ADD KEY `idx_movimiento_inventario_fecha` (`id_inventario`,`fecha_movimiento`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `idx_notificacion_usuario` (`id_usuario`),
  ADD KEY `idx_notificacion_leido` (`leido`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `idx_pago_pedido` (`id_pedido`),
  ADD KEY `idx_pago_estado` (`estado`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD UNIQUE KEY `uq_numero_pedido` (`numero_pedido`),
  ADD KEY `idx_pedido_usuario` (`id_usuario`),
  ADD KEY `idx_pedido_estado` (`estado`),
  ADD KEY `idx_pedido_fecha` (`fecha_pedido`),
  ADD KEY `idx_pedido_metodo` (`id_metodo`),
  ADD KEY `idx_pedido_usuario_fecha` (`id_usuario`,`fecha_pedido`),
  ADD KEY `fk_pedido_cupon` (`id_cupon`);

--
-- Indices de la tabla `precio_producto`
--
ALTER TABLE `precio_producto`
  ADD PRIMARY KEY (`id_precio`),
  ADD KEY `idx_precio_variante` (`id_variante`),
  ADD KEY `idx_precio_activo` (`activo`),
  ADD KEY `idx_precio_fechas` (`fecha_inicio`,`fecha_fin`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `idx_producto_categoria` (`id_categoria`),
  ADD KEY `idx_producto_especie` (`id_especie`),
  ADD KEY `idx_producto_estado` (`estado`),
  ADD KEY `idx_producto_nombre` (`nombre`),
  ADD KEY `idx_producto_categoria_estado` (`id_categoria`,`estado`),
  ADD KEY `idx_producto_especie_estado` (`id_especie`,`estado`);

--
-- Indices de la tabla `producto_coleccion`
--
ALTER TABLE `producto_coleccion`
  ADD PRIMARY KEY (`id_producto`,`id_coleccion`),
  ADD KEY `fk_pc_coleccion` (`id_coleccion`);

--
-- Indices de la tabla `producto_etiqueta`
--
ALTER TABLE `producto_etiqueta`
  ADD PRIMARY KEY (`id_producto`,`id_etiqueta`),
  ADD KEY `fk_pe_etiqueta` (`id_etiqueta`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id_region`),
  ADD UNIQUE KEY `uq_region` (`nombre`);

--
-- Indices de la tabla `resena`
--
ALTER TABLE `resena`
  ADD PRIMARY KEY (`id_resena`),
  ADD KEY `idx_resena_producto` (`id_producto`),
  ADD KEY `idx_resena_usuario` (`id_usuario`),
  ADD KEY `idx_resena_producto_fecha` (`id_producto`,`fecha`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `uq_rol_nombre` (`nombre`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `uq_usuario_correo` (`correo`),
  ADD KEY `idx_usuario_rol` (`id_rol`),
  ADD KEY `idx_usuario_estado` (`estado`),
  ADD KEY `idx_usuario_apellidos` (`apellidos`);

--
-- Indices de la tabla `variante_producto`
--
ALTER TABLE `variante_producto`
  ADD PRIMARY KEY (`id_variante`),
  ADD UNIQUE KEY `uq_sku` (`sku`),
  ADD KEY `idx_variante_producto` (`id_producto`),
  ADD KEY `idx_variante_material` (`id_material`),
  ADD KEY `idx_variante_activo` (`activo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id_almacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `coleccion`
--
ALTER TABLE `coleccion`
  MODIFY `id_coleccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cupon`
--
ALTER TABLE `cupon`
  MODIFY `id_cupon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `donacion`
--
ALTER TABLE `donacion`
  MODIFY `id_donacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especie`
--
ALTER TABLE `especie`
  MODIFY `id_especie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `especie_imagen`
--
ALTER TABLE `especie_imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado_conservacion`
--
ALTER TABLE `estado_conservacion`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `id_estado_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `id_etiqueta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `favorito`
--
ALTER TABLE `favorito`
  MODIFY `id_favorito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historial_pedido`
--
ALTER TABLE `historial_pedido`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagen_producto`
--
ALTER TABLE `imagen_producto`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `item_carrito`
--
ALTER TABLE `item_carrito`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `log_auditoria`
--
ALTER TABLE `log_auditoria`
  MODIFY `id_log` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id_lote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `id_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `precio_producto`
--
ALTER TABLE `precio_producto`
  MODIFY `id_precio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id_region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `resena`
--
ALTER TABLE `resena`
  MODIFY `id_resena` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `variante_producto`
--
ALTER TABLE `variante_producto`
  MODIFY `id_variante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `fk_carrito_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_detalle_variante` FOREIGN KEY (`id_variante`) REFERENCES `variante_producto` (`id_variante`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `fk_direccion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `donacion`
--
ALTER TABLE `donacion`
  ADD CONSTRAINT `fk_donacion_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `fk_envio_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE;

--
-- Filtros para la tabla `especie`
--
ALTER TABLE `especie`
  ADD CONSTRAINT `fk_especie_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado_conservacion` (`id_estado`),
  ADD CONSTRAINT `fk_especie_region` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`);

--
-- Filtros para la tabla `especie_imagen`
--
ALTER TABLE `especie_imagen`
  ADD CONSTRAINT `fk_especie_imagen` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id_especie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD CONSTRAINT `fk_favorito_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_favorito_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial_pedido`
--
ALTER TABLE `historial_pedido`
  ADD CONSTRAINT `fk_historial_estado` FOREIGN KEY (`id_estado_pedido`) REFERENCES `estado_pedido` (`id_estado_pedido`),
  ADD CONSTRAINT `fk_historial_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE;

--
-- Filtros para la tabla `imagen_producto`
--
ALTER TABLE `imagen_producto`
  ADD CONSTRAINT `fk_imagen_variante` FOREIGN KEY (`id_variante`) REFERENCES `variante_producto` (`id_variante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_inventario_almacen` FOREIGN KEY (`id_almacen`) REFERENCES `almacen` (`id_almacen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inventario_lote` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id_lote`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inventario_variante` FOREIGN KEY (`id_variante`) REFERENCES `variante_producto` (`id_variante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `item_carrito`
--
ALTER TABLE `item_carrito`
  ADD CONSTRAINT `fk_item_carrito` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_item_variante` FOREIGN KEY (`id_variante`) REFERENCES `variante_producto` (`id_variante`);

--
-- Filtros para la tabla `movimiento_inventario`
--
ALTER TABLE `movimiento_inventario`
  ADD CONSTRAINT `fk_movimiento_inventario` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `fk_notificacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cupon` FOREIGN KEY (`id_cupon`) REFERENCES `cupon` (`id_cupon`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedido_metodo` FOREIGN KEY (`id_metodo`) REFERENCES `metodo_pago` (`id_metodo`),
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `precio_producto`
--
ALTER TABLE `precio_producto`
  ADD CONSTRAINT `fk_precio_variante` FOREIGN KEY (`id_variante`) REFERENCES `variante_producto` (`id_variante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `fk_producto_especie` FOREIGN KEY (`id_especie`) REFERENCES `especie` (`id_especie`);

--
-- Filtros para la tabla `producto_coleccion`
--
ALTER TABLE `producto_coleccion`
  ADD CONSTRAINT `fk_pc_coleccion` FOREIGN KEY (`id_coleccion`) REFERENCES `coleccion` (`id_coleccion`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pc_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `producto_etiqueta`
--
ALTER TABLE `producto_etiqueta`
  ADD CONSTRAINT `fk_pe_etiqueta` FOREIGN KEY (`id_etiqueta`) REFERENCES `etiqueta` (`id_etiqueta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pe_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `resena`
--
ALTER TABLE `resena`
  ADD CONSTRAINT `fk_resena_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `fk_resena_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `variante_producto`
--
ALTER TABLE `variante_producto`
  ADD CONSTRAINT `fk_variante_material` FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`),
  ADD CONSTRAINT `fk_variante_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"lenas_humos_db\",\"table\":\"pagos\"},{\"db\":\"lenas_humos_db\",\"table\":\"pedidos\"},{\"db\":\"lenas_humos_db\",\"table\":\"administradores\"},{\"db\":\"lenas_humos_db\",\"table\":\"detalle_pedido\"},{\"db\":\"lenas_humos_db\",\"table\":\"zonas_delivery\"},{\"db\":\"lenas_humos_db\",\"table\":\"productos\"},{\"db\":\"peluches_peru\",\"table\":\"usuario\"},{\"db\":\"peluches_peru\",\"table\":\"cupon\"},{\"db\":\"chiflepop\",\"table\":\"clientes\"},{\"db\":\"chiflepop\",\"table\":\"bancos\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'esencia_pasteleria', 'categoria_producto_categoria_personalizacion', '{\"sorted_col\":\"`categoria_producto_categoria_personalizacion`.`id_categoria_producto` DESC\"}', '2025-11-30 10:09:10'),
('root', 'esencia_pasteleria', 'personalizacion', '{\"sorted_col\":\"`personalizacion`.`id_categoria_personalizado` ASC\"}', '2025-11-30 21:41:27'),
('root', 'esencia_pasteleria', 'producto', '{\"sorted_col\":\"`producto`.`id_categoria` DESC\",\"CREATE_TIME\":\"2025-11-29 03:03:59\"}', '2025-12-03 05:31:16'),
('root', 'peluches_peru', 'usuario', '{\"sorted_col\":\"`usuario`.`password_hash` ASC\"}', '2026-09-30 04:27:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-10-25 11:58:38', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

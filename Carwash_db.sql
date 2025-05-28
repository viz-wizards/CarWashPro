SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

/*CREATE DATABASE Carwash_db;*/
USE Carwash_db;

CREATE TABLE `tb_categoria` (
  `id_categoria` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tb_categoria` (`id_categoria`, `descripcion`, `estado`) VALUES
(3, 'Calzado', 0),
(5, 'Bebidas', 0),
(6, 'Vegetales', 0);

CREATE TABLE `tb_cliente` (
  `id_cliente` int(11) NOT NULL,
  `dni` int(9) DEFAULT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `estado` enum('Activo','Negativo') DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tb_cliente` (`id_cliente`, `dni`, `nombre`, `apellido`, `correo`, `estado`) VALUES
(1, 1212321, 'asdasd', 'asdasd', 'sdaasdasdasd@gmail.com', 'Activo');

CREATE TABLE `tb_producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double(10,2) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tb_producto` (`id_producto`, `nombre`, `cantidad`, `precio`, `descripcion`, `id_categoria`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Inka Kola', 2, 20.00, 'dasdasdas', 5, 1, '2025-03-27 21:24:54', '2025-03-27 21:24:54');

CREATE TABLE `tb_rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tb_rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'admin'),
(2, 'usuario');

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tb_usuario` (`id_usuario`, `nombre`, `apellido`, `usuario`, `password`, `telefono`, `id_rol`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Juan', 'Pérez', 'cajero', '123', '987654321', 2, 1, '2025-03-13 19:08:50', '2025-05-09 19:18:34'),
(2, 'María', 'Gómez', 'admin', '123', '912345678', 1, 1, '2025-03-13 19:08:50', '2025-05-09 19:18:34');

-- Crear tabla de pagos
CREATE TABLE `tb_pagos` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `monto` double(10,2) NOT NULL,
  `metodo_pago` enum('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Exitoso','Fallido') DEFAULT 'Exitoso',
  PRIMARY KEY (`id_pago`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `tb_pagos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Claves primarias e índices
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`id_categoria`);

ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `correo` (`correo`);

ALTER TABLE `tb_producto`
  ADD PRIMARY KEY (`id_producto`);

ALTER TABLE `tb_rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `id_rol` (`id_rol`);

-- Auto_increment
ALTER TABLE `tb_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `tb_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `tb_producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `tb_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- Claves foráneas
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tb_rol` (`id_rol`) ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

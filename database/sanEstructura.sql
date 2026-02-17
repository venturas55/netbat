-- Adminer 4.8.1 MySQL 5.5.5-10.9.5-MariaDB-1:10.9.5+maria~ubu2204 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `balizamiento`;
CREATE TABLE `balizamiento` (
  `nif` varchar(10) NOT NULL,
  `num_internacional` varchar(12) DEFAULT NULL,
  `tipo` varchar(250) DEFAULT NULL,
  `telecontrol` varchar(200) DEFAULT NULL,
  `apariencia` varchar(50) DEFAULT NULL,
  `periodo` decimal(5,2) DEFAULT NULL,
  `caracteristica` varchar(50) DEFAULT NULL,
  `necesita_pintado` tinyint(1) DEFAULT 0,
  `apagada` tinyint(1) DEFAULT 0,
  `esBoya` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de balizas';


DROP TABLE IF EXISTS `documentos`;
CREATE TABLE `documentos` (
  `id_archivo` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de documentos';


DROP TABLE IF EXISTS `eliminados`;
CREATE TABLE `eliminados` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(10) NOT NULL,
  `item` varchar(50) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Tabla de elementos de inventario eliminados';


DROP TABLE IF EXISTS `fondeos`;
CREATE TABLE `fondeos` (
  `nif` varchar(10) NOT NULL,
  `calado` decimal(5,2) unsigned DEFAULT NULL,
  `longitud_cadena` decimal(5,2) unsigned DEFAULT NULL,
  `ubicacion` enum('exterior','intermedio','interior') DEFAULT 'interior',
  `h_muerto` smallint(5) unsigned DEFAULT NULL,
  `b_muerto` smallint(5) unsigned DEFAULT NULL,
  `l_muerto` smallint(5) unsigned DEFAULT NULL,
  `diametro_cadena` tinyint(3) unsigned DEFAULT NULL,
  `area_total_viva` decimal(5,3) unsigned DEFAULT NULL,
  `Cw_aerodinamico` decimal(5,4) unsigned DEFAULT NULL,
  `area_total_muerta` decimal(5,3) unsigned DEFAULT NULL,
  `Cd_aerodinamico` decimal(5,4) unsigned DEFAULT NULL,
  `observaciones` varchar(250) DEFAULT NULL,
  `last_modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `nif` (`nif`),
  CONSTRAINT `fondeos_ibfk_2` FOREIGN KEY (`nif`) REFERENCES `balizamiento` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de fondeos';


DROP TABLE IF EXISTS `fotos_balizamiento`;
CREATE TABLE `fotos_balizamiento` (
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de descripcion de fotos del balizamiento';


DROP TABLE IF EXISTS `inventario`;
CREATE TABLE `inventario` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `item` varchar(50) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de inventario';


DROP TABLE IF EXISTS `lampara`;
CREATE TABLE `lampara` (
  `nif` varchar(10) NOT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `elevacion` decimal(5,2) DEFAULT NULL,
  `alcanceNom` decimal(5,2) DEFAULT NULL,
  `linterna` varchar(200) DEFAULT NULL,
  `candelasCalc` float(12,2) DEFAULT NULL,
  `alcanceLum` decimal(5,2) DEFAULT NULL,
  `candelasInst` float(12,2) DEFAULT NULL,
  PRIMARY KEY (`nif`),
  CONSTRAINT `lampara_ibfk_1` FOREIGN KEY (`nif`) REFERENCES `balizamiento` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de detalles lampara';


DROP TABLE IF EXISTS `localizacion`;
CREATE TABLE `localizacion` (
  `nif` varchar(10) NOT NULL,
  `puerto` varchar(50) DEFAULT NULL,
  `num_local` decimal(5,0) DEFAULT NULL,
  `localizacion` varchar(70) DEFAULT NULL,
  `latitud` varchar(15) DEFAULT NULL,
  `longitud` varchar(15) DEFAULT NULL,
  `coordenadas` point DEFAULT NULL,
  PRIMARY KEY (`nif`),
  CONSTRAINT `localizacion_ibfk_2` FOREIGN KEY (`nif`) REFERENCES `balizamiento` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de localizacion del balizamiento';


DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(50) NOT NULL,
  `accion` varchar(100) DEFAULT NULL,
  `observacion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de logs';


DROP TABLE IF EXISTS `mantenimiento`;
CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int(10) NOT NULL AUTO_INCREMENT,
  `nif` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `mantenimiento` varchar(500) NOT NULL,
  PRIMARY KEY (`id_mantenimiento`),
  KEY `mantenimiento_FK` (`nif`),
  CONSTRAINT `mantenimiento_ibfk_1` FOREIGN KEY (`nif`) REFERENCES `balizamiento` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de mantenimiento del balizamiento';


DROP TABLE IF EXISTS `observaciones`;
CREATE TABLE `observaciones` (
  `id_observacion` int(10) NOT NULL AUTO_INCREMENT,
  `nif` varchar(10) NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  PRIMARY KEY (`id_observacion`),
  KEY `observaciones_FK` (`nif`),
  CONSTRAINT `observaciones_ibfk_1` FOREIGN KEY (`nif`) REFERENCES `balizamiento` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de observaciones del balizamiento';


DROP TABLE IF EXISTS `preventivos`;
CREATE TABLE `preventivos` (
  `preventivo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nif` varchar(10) DEFAULT NULL,
  `estructura_estado` enum('ok','ko','na') DEFAULT NULL,
  `estructura_marca_tope` enum('ok','ko','na') DEFAULT NULL,
  `estructura_engrase` enum('ok','ko','na') DEFAULT NULL,
  `estructura_golpes` enum('ok','ko','na') DEFAULT NULL,
  `estructura_flotador` enum('ok','ko','na') DEFAULT NULL,
  `estructura_limpieza_interior` enum('ok','ko','na') DEFAULT NULL,
  `estructura_limpieza_exterior` enum('ok','ko','na') DEFAULT NULL,
  `estructura_cuadro_interior` enum('ok','ko','na') DEFAULT NULL,
  `estructura_cuadro_exterior` enum('ok','ko','na') DEFAULT NULL,
  `linterna_ldr1` enum('ok','ko','na') DEFAULT NULL,
  `linterna_ldr2` enum('ok','ko','na') DEFAULT NULL,
  `linterna_optica` enum('ok','ko','na') DEFAULT NULL,
  `linterna_estanqueidad_tornillos` enum('ok','ko','na') DEFAULT NULL,
  `linterna_estanqueidad_humedades` enum('ok','ko','na') DEFAULT NULL,
  `telecontrol_monitoreo` enum('ok','ko','na') DEFAULT NULL,
  `telecontrol_gps` enum('ok','ko','na') DEFAULT NULL,
  `telecontrol_tipo` enum('Radio-Moscad','radioUHF','AIS','GSM','Satelital') DEFAULT NULL,
  `alimentacion_panelFV` enum('ok','ko','na') DEFAULT NULL,
  `alimentacion_red` enum('ok','ko','na') DEFAULT NULL,
  `alimentacion_baterias` enum('ok','ko','na') DEFAULT NULL,
  `alimentacion_ah` int(11) DEFAULT NULL,
  `alimentacion_vcc` float DEFAULT NULL,
  `alimentacion_grupo` enum('ok','ko','na') DEFAULT NULL,
  `alimentacion_cableado` enum('ok','ko','na') DEFAULT NULL,
  `estructura_observaciones` varchar(500) DEFAULT NULL,
  `linterna_observaciones` varchar(500) DEFAULT NULL,
  `telecontrol_observaciones` varchar(500) DEFAULT NULL,
  `alimentacion_observaciones` varchar(500) DEFAULT NULL,
  `observaciones_generales` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `solved_at` timestamp NULL DEFAULT NULL,
  `solved_by_id` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `completado` tinyint(1) DEFAULT 0,
  `foto_estructura` varchar(250) DEFAULT NULL,
  `foto_linterna` varchar(250) DEFAULT NULL,
  `foto_monitoreo` varchar(250) DEFAULT NULL,
  `foto_alimentacion` varchar(250) DEFAULT NULL,
  `foto_general` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`preventivo_id`),
  KEY `preventivo_ibfk_1` (`created_by_id`),
  KEY `preventivo_ibfk_3` (`solved_by_id`),
  KEY `preventivo_ibfk_2` (`nif`),
  CONSTRAINT `preventivo_ibfk_1` FOREIGN KEY (`created_by_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `preventivo_ibfk_2` FOREIGN KEY (`nif`) REFERENCES `balizamiento` (`nif`),
  CONSTRAINT `preventivo_ibfk_3` FOREIGN KEY (`solved_by_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de preventivos';


DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `sqlmapfile`;
CREATE TABLE `sqlmapfile` (
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `nif` varchar(10) DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `resolved_by_id` int(11) DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `solved_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `created_by_id` (`created_by_id`),
  KEY `assigned_to_id` (`assigned_to_id`),
  KEY `resolved_by_id` (`resolved_by_id`),
  KEY `nif` (`nif`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`created_by_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`assigned_to_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`resolved_by_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`nif`) REFERENCES `balizamiento` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de tickets';


DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `user_id` int(11) NOT NULL,
  `hashedtoken` varchar(200) NOT NULL,
  `expires` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hashedtoken`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de tokens';


DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `privilegio` varchar(20) DEFAULT NULL,
  `pictureURL` varchar(100) CHARACTER SET utf16 COLLATE utf16_spanish2_ci DEFAULT NULL,
  `prefmap` varchar(10) DEFAULT 'leaflet',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='tabla de usuarios';


-- 2026-01-30 11:38:26
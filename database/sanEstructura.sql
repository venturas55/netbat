/* drop database if exists sanpfcdaw;

create database sanpfcdaw;

use sanpfcdaw;

SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00"; */

/*INICIO informacion ATON*/
CREATE TABLE IF NOT EXISTS `balizamiento` (
  `nif` varchar(8) NOT NULL,
  `num_internacional` varchar(12) DEFAULT NULL,
  `tipo` varchar(250) DEFAULT NULL,
  `telecontrol` varchar(200) DEFAULT NULL,
  `apariencia` varchar(50) DEFAULT NULL,
  `periodo` decimal(5, 2) DEFAULT NULL,
  `caracteristica` varchar(50) DEFAULT NULL,
  `necesita_pintado` tinyint(1) DEFAULT 0,
  `apagada` tinyint(1) DEFAULT 0,
  `esBoya` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de balizas';

CREATE TABLE IF NOT EXISTS `lampara` (
  `nif` varchar(8) NOT NULL,
  `altura` decimal(5, 2) DEFAULT NULL,
  `elevacion` decimal(5, 2) DEFAULT NULL,
  `alcanceNom` decimal(5, 2) DEFAULT NULL,
  `linterna` varchar(200) DEFAULT NULL,
  `candelasCalc` float(12, 2) DEFAULT NULL,
  `alcanceLum` decimal(5, 2) DEFAULT NULL,
  `candelasInst` float(12, 2) DEFAULT NULL,
  PRIMARY KEY (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de detalles lampara';

CREATE TABLE IF NOT EXISTS `localizacion` (
  `nif` varchar(8) NOT NULL,
  `puerto` varchar(50) DEFAULT NULL,
  `num_local` decimal(5, 0) DEFAULT NULL,
  `localizacion` varchar(70) DEFAULT NULL,
  `latitud` varchar(15) DEFAULT NULL,
  `longitud` varchar(15) DEFAULT NULL,
  `coordenadas` point default NULL,
  PRIMARY KEY (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de localizacion del balizamiento';

CREATE TABLE IF NOT EXISTS `mantenimiento` (
  `id_mantenimiento` int(10) NOT NULL AUTO_INCREMENT,
  `nif` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `mantenimiento` varchar(500) NOT NULL,
  PRIMARY KEY (`id_mantenimiento`),
  KEY `mantenimiento_FK` (`nif`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de mantenimiento del balizamiento';

CREATE TABLE IF NOT EXISTS `observaciones` (
  `id_observacion` int(10) NOT NULL AUTO_INCREMENT,
  `nif` varchar(8) NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  PRIMARY KEY (`id_observacion`),
  KEY `observaciones_FK` (`nif`)
) ENGINE = InnoDB AUTO_INCREMENT = 188 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de observaciones del balizamiento';

CREATE TABLE IF NOT EXISTS `fondeos` (
  `nif` varchar(8) NOT NULL,
  `calado` decimal(5, 2) UNSIGNED DEFAULT NULL,
  `longitud_cadena` decimal(5, 2) UNSIGNED DEFAULT NULL,
  `ubicacion` ENUM('exterior', 'intermedio', 'interior') default 'interior',
  `h_muerto` smallint unsigned DEFAULT NULL,
  `b_muerto` smallint unsigned DEFAULT NULL,
  `l_muerto` smallint unsigned DEFAULT NULL,
  `diametro_cadena` TINYINT unsigned DEFAULT NULL,
  `area_total_viva` decimal(5, 3) UNSIGNED DEFAULT NULL,
  `Cw_aerodinamico` decimal(5, 4) UNSIGNED DEFAULT NULL,
  `area_total_muerta` decimal(5, 3) UNSIGNED DEFAULT NULL,
  `Cd_aerodinamico` decimal(5, 4) UNSIGNED DEFAULT NULL,
  `observaciones` varchar(250) default null,
  `last_modified` DATETIME NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (nif) REFERENCES balizamiento(nif) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de fondeos';

/*FIN ATON*/
/* INVENTARIO */
CREATE TABLE IF NOT EXISTS `inventario` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `item` varchar(50) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 79 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de inventario';

/* DESCRIPCION DOCUMENTOS */
CREATE TABLE `documentos` (
  `id_archivo` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`id_archivo`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de documentos';

/* DESCRIPCION FOTOS */
CREATE TABLE `fotos_balizamiento` (
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`nombre`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de descripcion de fotos del balizamiento';

/* USUARIOS y LOGS */
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `privilegio` varchar(20) DEFAULT NULL,
  `pictureURL` varchar(100) CHARACTER SET utf16 COLLATE utf16_spanish2_ci DEFAULT NULL,
  `prefmap` varchar(10) default 'leaflet',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de usuarios';

CREATE TABLE IF NOT EXISTS `logs` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(50) NOT NULL,
  `accion` varchar(100) DEFAULT NULL,
  `observacion` varchar(150) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de logs';

drop table if exists tickets;

CREATE TABLE IF NOT EXISTS `tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `nif` varchar(8) DEFAULT NULL,
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
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`nif`) REFERENCES `balizamiento` (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de tickets';

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `tokens` (
  `user_id` int(11) NOT NULL,
  `hashedtoken` varchar(200) PRIMARY KEY,
  `expires` DATETIME NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de tokens';

DROP TABLE IF EXISTS preventivos;

CREATE TABLE IF NOT EXISTS `preventivos` (
  `preventivo_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nif` varchar(8) DEFAULT NULL,
  `estructura_estado` ENUM('ok', 'ko', 'na') default null,
  `estructura_marca_tope` ENUM('ok', 'ko', 'na') default null,
  `estructura_engrase` ENUM('ok', 'ko', 'na') default null,
  `estructura_golpes` ENUM('ok', 'ko', 'na') default null,
  `estructura_flotador` ENUM('ok', 'ko', 'na') default null,
  `estructura_limpieza_interior` ENUM('ok', 'ko', 'na') default null,
  `estructura_limpieza_exterior` ENUM('ok', 'ko', 'na') default null,
  `estructura_cuadro_interior` ENUM('ok', 'ko', 'na') default null,
  `estructura_cuadro_exterior` ENUM('ok', 'ko', 'na') default null,
  `linterna_ldr1` ENUM('ok', 'ko', 'na') default null,
  `linterna_ldr2` ENUM('ok', 'ko', 'na') default null,
  `linterna_optica` ENUM('ok', 'ko', 'na') default null,
  `linterna_estanqueidad_tornillos` ENUM('ok', 'ko', 'na') default null,
  `linterna_estanqueidad_humedades` ENUM('ok', 'ko', 'na') default null,
  `telecontrol_monitoreo` ENUM('ok', 'ko', 'na') default null,
  `telecontrol_gps` ENUM('ok', 'ko', 'na') default null,
  `telecontrol_tipo` ENUM(
    'Radio-Moscad',
    'radioUHF',
    'AIS',
    'GSM',
    'Satelital'
  ) default null,
  `alimentacion_panelFV` ENUM('ok', 'ko', 'na') default null,
  `alimentacion_red` ENUM('ok', 'ko', 'na') default null,
  `alimentacion_baterias` ENUM('ok', 'ko', 'na') default null,
  `alimentacion_ah` int default null,
  `alimentacion_vcc` float default null,
  `alimentacion_grupo` ENUM('ok', 'ko', 'na') default null,
  `alimentacion_cableado` ENUM('ok', 'ko', 'na') default null,
  `estructura_observaciones` varchar(250) default null,
  `linterna_observaciones` varchar(250) default null,
  `telecontrol_observaciones` varchar(250) default null,
  `alimentacion_observaciones` varchar(250) default null,
  `observaciones_generales` varchar(250) default null,
  `created_at` timestamp DEFAULT current_timestamp(),
  `solved_at` timestamp DEFAULT NULL,
  `solved_by_id` int(11) DEFAULT NULL,
  `fecha` timestamp DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `completado` BOOLEAN DEFAULT false,
  `foto_estructura` varchar(250) default null,
  `foto_linterna` varchar(250) default null,
  `foto_monitoreo` varchar(250) default null,
  `foto_alimentacion` varchar(250) default null,
  `foto_general` varchar(250) default null,
  CONSTRAINT `preventivo_ibfk_1` FOREIGN KEY (`created_by_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `preventivo_ibfk_3` FOREIGN KEY (`solved_by_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `preventivo_ibfk_2` FOREIGN KEY (`nif`) REFERENCES `balizamiento` (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de preventivos';

-- Inserta usuario "admin" con contraseña "admin"
INSERT INTO
  `usuarios` (
    `id`,
    `usuario`,
    `contrasena`,
    `email`,
    `full_name`,
    `privilegio`,
    `pictureURL`
  )
VALUES
  (
    1,
    'admin',
    '$2a$10$44RiEqgdwBZhtbd1rN6pfe/CLbTMpc4mGUPDiCgAlle0ISkMuJAC2',
    'admin@email.com',
    'Admin name',
    'admin',
    ''
  );

COMMIT;
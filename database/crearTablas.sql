CREATE TABLE IF NOT EXISTS `tokens` (
    `user_id` int(11) NOT NULL,
    `hashedtoken` varchar(200) PRIMARY KEY,
    `expires` DATETIME NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de tokens';

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

CREATE TABLE IF NOT EXISTS `documentos` (
  `id_archivo` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_archivo`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de documentos';

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

CREATE TABLE IF NOT EXISTS `fotos_balizamiento` (
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`nombre`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de descripcion de fotos del balizamiento';
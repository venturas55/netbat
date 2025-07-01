drop database if exists sanpfcdaw;

create database sanpfcdaw;

use sanpfcdaw;

SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*INICIO informacion ATON*/
CREATE TABLE `balizamiento` (
  `nif` varchar(8) NOT NULL,
  `num_internacional` varchar(12) DEFAULT NULL,
  `tipo` varchar(250) DEFAULT NULL,
  `telecontrol` varchar(200) DEFAULT NULL,
  `apariencia` varchar(50) DEFAULT NULL,
  `periodo` decimal(5, 2) DEFAULT NULL,
  `caracteristica` varchar(50) NULL,
  `necesita_pintado` boolean default 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de balizas';

CREATE TABLE `lampara` (
  `nif` varchar(8) NOT NULL,
  `altura` decimal(5, 2) DEFAULT NULL,
  `elevacion` decimal(5, 2) DEFAULT NULL,
  `alcanceNom` decimal(5, 2) DEFAULT NULL,
  `linterna` varchar(200) DEFAULT NULL,
  `candelasCalc` float(12, 2) DEFAULT NULL,
  `alcanceLum` decimal(5, 2) DEFAULT NULL,
  `candelasInst` float(12, 2) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de detalles lampara';

CREATE TABLE `localizacion` (
  `nif` varchar(8) NOT NULL,
  `puerto` varchar(50) DEFAULT NULL,
  `num_local` decimal(5, 0) DEFAULT NULL,
  `localizacion` varchar(70) DEFAULT NULL,
  `latitud` varchar(15) DEFAULT NULL,
  `longitud` varchar(15) DEFAULT NULL,
  `coordenadas` point default NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de localizacion del balizamiento';

CREATE TABLE `mantenimiento` (
  `id_mantenimiento` int(10) UNSIGNED NOT NULL,
  `nif` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `mantenimiento` varchar(500) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de mantenimiento del balizamiento';

CREATE TABLE `observaciones` (
  `id_observacion` int(10) UNSIGNED NOT NULL,
  `nif` varchar(8) NOT NULL,
  `observaciones` varchar(250) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de observaciones del balizamiento';

/*FIN ATON*/
/* INVENTARIO */
CREATE TABLE `inventario` (
  `id` mediumint(9) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `item` varchar(50) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de inventario';

/* DESCRIPCION DOCUMENTOS */
CREATE TABLE `documentos` (
  `id_archivo` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de documentos';

/* USUARIOS y LOGS */
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `privilegio` varchar(20) DEFAULT NULL,
  `pictureURL` varchar(100) CHARACTER SET utf16 COLLATE utf16_spanish2_ci DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de usuarios';

CREATE TABLE `logs` (
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(50) NOT NULL,
  `accion` varchar(100) DEFAULT NULL,
  `observacion` varchar(150) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de logs';

drop table if exists tickets;
CREATE TABLE `tickets` (
  `ticket_id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `nif` varchar(8),
  `created_by_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `resolved_by_id` int(11) DEFAULT NULL,
  `titulo` VARCHAR(255) NOT NULL,
  `descripcion` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `solved_at` TIMESTAMP NULL DEFAULT NULL,
  FOREIGN KEY (created_by_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  FOREIGN KEY (assigned_to_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  FOREIGN KEY (resolved_by_id) REFERENCES usuarios(id) ON DELETE CASCADE,
  FOREIGN KEY (nif) REFERENCES balizamiento(nif) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT = 'tabla de tickets';

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;


--
ALTER TABLE
  `balizamiento`
ADD
  PRIMARY KEY (`nif`);

ALTER TABLE
  `inventario`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `lampara`
ADD
  PRIMARY KEY (`nif`);

ALTER TABLE
  `localizacion`
ADD
  PRIMARY KEY (`nif`);

ALTER TABLE
  `mantenimiento`
ADD
  PRIMARY KEY (`id_mantenimiento`),
ADD
  KEY `mantenimiento_FK` (`nif`),
MODIFY
  `id_mantenimiento` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 1;

ALTER TABLE
  `observaciones`
ADD
  PRIMARY KEY (`id_observacion`),
ADD
  KEY `observaciones_FK` (`nif`),
MODIFY
  `id_observacion` int(10) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 1;

ALTER TABLE
  `usuarios`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `usuarios`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 1;

ALTER TABLE
  `inventario`
MODIFY
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 1;

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

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
--------------------------------------------
TRUNCATE  table balizamiento;
TRUNCATE  table lampara;
TRUNCATE  table localizacion;
TRUNCATE  table mantenimiento;
TRUNCATE  table observaciones;

TRUNCATE  table inventario;
TRUNCATE  table documentos;
TRUNCATE  table usuarios;
TRUNCATE  table logs;


INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25460',
    'E-0190',
    'Baliza Torre troncopiramidal verde blanca',
    'telecontrol ',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25470',
    'E-0190.2',
    'Baliza Torre troncopiramidal roja blanca',
    'teeee',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25530',
    'E-0194',
    'Baliza bocana Torre de hormigón verde',
    'Sí  RTU Nº 41',
    'DV',
    5.00,
    'L1 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25545',
    'E-0193',
    'Baliza bocana Torre de hormigón Roja',
    'RTU Nº 42',
    'DR',
    5.00,
    'L1 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25552',
    'E-0196',
    'Baliza Torre cilíndrica TPS',
    '',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25554',
    '36564',
    'Boya de espeque roja/verde MSM',
    'NO',
    'GpD(2+1)V',
    14.00,
    'L0,5 oc1 L5,5 oc3 L0,5 oc1'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25555',
    'E-0196.2',
    'Baliza Hormigon pequeña Columna cuadrangular verde',
    '',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25560',
    'E-0196.25',
    'Baliza Hormigon pequeña columna cuadrangular',
    'NOo',
    'GpD(4)R',
    11.00,
    '(L0,5 oc1,5)x3 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25563',
    'E-0196.32',
    'Baliza Metal Estribor Linterna sobre pilote.',
    'NO',
    'GpD(4) V',
    11.00,
    '(L0,5 oc1,5)x3 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25564',
    '',
    'Baliza Metal amarilla Linterna sobre pilote.',
    'SI',
    'DA',
    3.00,
    'L0,5 oc 2,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25565',
    'E-0196.3',
    'Baliza Metal Torre troncopiramidal verde',
    '',
    'DV',
    3.00,
    'L0,5 oc 2,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25570',
    'E-0196.35',
    'Baliza Metal Torre tronco piramidal roja',
    '',
    'GpD(3)R',
    9.00,
    '(L0,5 oc1,5)x2 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25590',
    'E-0197',
    'Baliza Torre cilíndrica verde sobre base verde',
    '',
    'GpD(4)V',
    11.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25600',
    'E-0197.2',
    'Baliza Torre cilíndrica roja sobre base roja',
    '',
    'GpD(4)R',
    11.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25620',
    'E-0197.5',
    'Baliza semaforo Panel circular blanco, bandas rojas en el tablero del puente',
    '',
    'Iso B',
    2.00,
    'L2 oc2'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25640',
    '',
    'Baliza Columna de hierro',
    '',
    'sin apariencia',
    0.00,
    'l10oc0'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25650',
    'E-0198',
    'faro',
    'Si SCADA',
    'GpD(3)',
    20.00,
    'L0.255+Oc3.745+L0.255+Oc3.745+L0.255+Oc11.74'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25660',
    'E-0199',
    'Baliza Torreta cuadrangular verde.',
    '',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25665',
    'E-0199.2',
    'Baliza Espeque rojo con la base blanca.',
    '',
    'GpD(3)R',
    11.00,
    '[(L0,5 oc1,5)x2] L0,5 oc6,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25667',
    'E-0199.6',
    'Baliza Poste cuadrangular rojo.',
    '',
    'GpD(4)R',
    11.00,
    '[(L0,5 oc1,5)x3] L0,5 oc5,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25700',
    'FValencia',
    'Faro',
    'Si SCADA',
    'D',
    10.00,
    'L 0,8 OC 9,2'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25720',
    'E-0200.4',
    'Baliza Cilíndrica verde base blanca',
    'RTU 06',
    'DV',
    5.00,
    'L1 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25721',
    'E-0200.5',
    'Baliza TPS 3.3',
    '',
    'DV',
    5.00,
    'L1 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25730',
    '',
    'Boya Castillete negra amarilla negra y marca de tope',
    'No lo necesita',
    'GRp(3)B',
    5.00,
    '[(L0.25 oc0.25)x2]   L0.25 oc3.75'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25740',
    '',
    'Boya Castillete roja y marca de tope',
    'No lo necesita',
    'D R',
    4.00,
    'L0.5 oc3.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25761',
    '',
    'Boya Castillete amarilla y marca de tope',
    'RTU 04',
    'GpD(4)A',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25765',
    '',
    'Boya Castillete amarilla y marca de tope',
    'RTU 02',
    'GpD(4)A',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25768',
    '',
    'Boya Castillete verde-roja-verde y marca de tope',
    'No',
    'GpD(2+1)V',
    9.00,
    'L0.6 oc0.6 L0.6 oc1.8 L0.6 oc5.4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25774',
    'E-0201.11',
    'Baliza Cilíndrica roja, base blanca',
    'RTU 10',
    'GpD(2)R',
    7.00,
    'L0.5 oc 1.5 L0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25776',
    'E-0201.25',
    'Baliza TPS 3.3',
    '',
    'GpD(3)R',
    9.00,
    '[(L0.5 oc1.5)x2] L0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25777',
    'E-0201.16',
    'Baliza TPS 3.3',
    '',
    'GpD(3)R',
    9.00,
    '[(L 0.5 oc 1.5)x2] L0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25800',
    'E-0201.2',
    'Baliza TPS 3.3',
    '',
    'DR',
    3.00,
    'L 0.5 oc 2.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25820',
    'E-0201.4',
    'Baliza TPS 3.3',
    '',
    'GpD(2)V',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25820.1',
    '',
    'Boya Castillete verde y marca de tope',
    'Sí',
    'GpD(2)V',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25830',
    'E-0201.5',
    'Baliza TPS 4.8',
    '',
    'GpD(3)V',
    9.00,
    '[(L 0.5 oc 1.5)x2]  L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25831',
    '',
    'Baliza Columna cilíndrica verde con la base blanca.',
    '',
    'GpD(3)V',
    9.00,
    '[L0,5+oc 1,5]x2+L0,5+oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25840',
    'E-0202',
    'Baliza TPS 3.3',
    'RTU 44',
    'GpD(4)R',
    11.00,
    '[(0.5 oc 1.5)x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25841',
    '',
    'Boya Castillete rojo y marca de tope',
    'RTU 54',
    'GpD(4)R',
    11.00,
    '[( L 0.5 oc 1.5)x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25842',
    'E-0201.7',
    'Baliza TPS 3.3',
    '',
    'GpDV',
    3.00,
    'L 0.5 oc 2.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25842.5',
    '',
    'Boya Cilíndrica verde.',
    'Si.',
    'CtV',
    1.00,
    'L 0,5   oc 0,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25843',
    'E-0201.75',
    'Boya Castillete',
    'Si',
    'DR',
    3.00,
    'L 0.5 oc 2.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25843.5',
    '',
    'Boya Cilíndrica roja',
    'Si',
    'CtR',
    1.00,
    'L 0,5   oc 0,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25843.8',
    '',
    'Boya Cilíndrica roja',
    'Si',
    'CtR',
    1.00,
    'L 0,5   oc 0,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25844',
    '',
    'Boya oceanográfica Castillete amarilla y marca de tope',
    'RTU 37',
    'GpD(4)A',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25850',
    'E-0203.4',
    'Baliza Poliester reforzado con fibra de vidrio',
    'REU 54',
    'GpD(2 1)V',
    14.50,
    'L0.5 oc 1 L 0.5 oc 3 L 0.5 oc 9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25920',
    'E-0204.2',
    'Baliza TPS 3.3',
    'RTU 13',
    'GpD(4)V',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25940',
    'E-0204',
    'Baliza TPS 3.3',
    '',
    'GpDR',
    3.00,
    'L 0.5 oc 2.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '25960',
    'E-0205',
    'Baliza Poliester reforzado con fibra de vidrio',
    'Sí RTU 43',
    'GpD(2+1)R',
    14.50,
    'L0.5 oc 1 L 0.5 oc 3 L 0.5 oc 9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26020',
    'E-0206.7',
    'Baliza SUR Tronco piramidal negro-amarillo con marca de tope.',
    'No',
    'GpRp(6)B',
    10.00,
    '[(L0.25 oc0.25)x6] L2 oc5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26021',
    'E-0208.6',
    'Baliza TPS 3.3',
    '',
    'GpD(2)V',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26025',
    'E-0208.65',
    'Baliza TPS 3.3',
    '',
    'GpD(2)R',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26035',
    'E-0208.75',
    'Baliza Tronco piramidal metálica',
    '',
    'GpD(3)V',
    9.00,
    '[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26041',
    'E-0208.8',
    'Baliza Tronco piramidal metálica',
    '',
    'GpD(3)R',
    9.00,
    '[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26045',
    'E-0208.84',
    'Baliza Estribor Tronco piramidal metálica',
    '',
    'CtV',
    1.00,
    'L0.3 oc0.7'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26046',
    'E-0208.86',
    'Baliza Babor Tronco piramidal metálica',
    '',
    'CtR',
    1.00,
    'L0.3 oc0.7'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26047',
    '',
    'Baliza Torre cilíndrica verde',
    'RTU 35',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26047.1',
    '',
    'Baliza Cilíndrica con base cónica, negra amarilla negra con marca tope',
    'Si.',
    'GpRp(3)B',
    5.00,
    '[(L0,25 oc0,25)x2]+L0,25 oc3,75'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26047.2',
    '',
    'Baliza Poliester reforzado con fibra de vidrio',
    'RTU 33',
    'RpB',
    0.50,
    'L 0,25 + oc 0,25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26048',
    '',
    'Baliza Torre cilíndrica con base cónica roja',
    '',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26048.1',
    '',
    'Baliza Torre cilíndrica con base cónica roja',
    '',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26048.2',
    '',
    'Boya Elastomero (Espuma polietileno cubierta de poliuretano)',
    'RTU 31',
    'RpB',
    0.50,
    'L0.25+  oc 0.25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26048.3',
    '',
    'Boya Elastomero (Espuma polietileno cubierta de poliuretano)',
    'RTU 32',
    'RpB',
    0.50,
    'L02.5 + oc 0.25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26049',
    '',
    'Boya Fibra de vidrio',
    'No',
    'CtR',
    0.50,
    'L0,25 oc 0,25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26050',
    'E-0199.9',
    'Baliza Acero',
    'No',
    'CtR',
    0.50,
    'L0,25 oc 0,25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26052',
    'E-0199.91',
    'Baliza Poste Acero',
    'No',
    'CtV',
    0.50,
    'L0,25 oc 0,25'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26052.5',
    '',
    'Boya Cilíndrica',
    'Si',
    'D A',
    5.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26052.7',
    '',
    'Boya Cilíndrica',
    'Si',
    'D A',
    5.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26055',
    'E-0199.92',
    'Baliza Poste rojo con paneles cuadrangulares adosados',
    '',
    'DR',
    5.00,
    'L0.5 oc4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26055.5',
    'E-0199.925',
    'Baliza Poste rojo, verde, rojo con paneles triangulares adosados',
    'No',
    'GpD(2+1)R',
    14.50,
    'L0.5 oc1 L0.5 oc3 L0.5 oc9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26055.6',
    'E-0199.926',
    'Baliza Poste cilindrico rojo con paneles cuadrangulares adosados.',
    '',
    'GpD(2)R',
    7.00,
    'L0.5 oc1.5 L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26056',
    'E-0199.93',
    'Baliza Poste verde con paneles triangulares adosados',
    '',
    'DV',
    5.00,
    'L0.5 oc4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058',
    'E-0199.94',
    'Baliza Poste verde, rojo, verde con paneles triangulares adosados',
    'No',
    'GpD(2+1)V',
    14.50,
    'L0.5 oc1 L0.5 oc3 L0.5 oc9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.1',
    'E-0199.945',
    'Baliza Poste cilindrico amarillo con paneles triangulares adosados',
    '',
    'DA',
    5.00,
    'L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.15',
    '',
    'BALIZA semaforo Panel metalico con el fondo negro.',
    '',
    'Luz fija (tres luces rojas superpuestas)',
    1.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.16',
    '',
    'BALIZA semaforo Panel metalico con el fondo negro.',
    '',
    'Luz fija (tres luces rojas superpuestas)',
    1.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.17',
    '',
    'BALIZA semaforo Panel metalico con el fondo negro.',
    '',
    'Luz fija (tres luces rojas superpuestas)',
    1.00,
    'Fija'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.2',
    'E-0199.96',
    'Baliza Poste cilindrico verde.',
    '',
    'GpD(2)V',
    7.00,
    'L0.5 oc1.5 L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.4',
    'E-0199.97',
    'Baliza Poste cilíndrico rojo.',
    '',
    'GpD(3)R',
    9.00,
    '[(L0.5 oc1.5)x2]+ L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.6',
    'E-0199.98',
    'Baliza Poste cilíndrico verde.',
    '',
    'GpD(3)V',
    9.00,
    '[(L0.5 oc1.5)x2]+ L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26058.8',
    'E-0199.99',
    'Baliza Poste cilíndrico rojo.',
    'No',
    'GpD(4)R',
    11.00,
    '[(L0.5 oc1.5)x3]+ L0.5 o4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26060',
    '',
    'Boya Castillete amarillo Marca de tope un aspa amarilla',
    'Sí',
    'GpD(4)A',
    1.00,
    'borrada por error'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  ('26083', '0', 'Boya ODAS SW 6020', '0', '0', 0.00, '0');
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26150',
    'E-0209.6',
    'Baliza Torrete cilíndrica roja blanca',
    'SPC88',
    'GpD(3)R',
    9.00,
    '[(L0,5+oc1,5)x2]+L0,5+oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26160',
    'E-0209.7',
    'Baliza Torrete cilíndrica verde blanca',
    'SPC88',
    'GpD(3)V',
    9.00,
    '[(L0,5+oc1,5)x2]+L0,5+oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26190',
    '',
    'Boya Peligro aislado. Espeque negra roja negra',
    'no',
    'GpD(2)B',
    5.00,
    'L0,5 oc1 L0,5 oc3'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26200',
    'E-0210',
    'Baliza E Torreta cilíndrica sobre caseta de hormigón',
    '',
    'GpD(2)V',
    5.00,
    'L0,5 oc0,7 L0,5 oc3'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26202',
    'E-0210.73',
    'Baliza E Torreta troncocónica',
    '',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2] L0,5 oc4'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26205',
    'E-0210.74',
    'Baliza CE Columna cilíndrica',
    '',
    'GpRp(3)B',
    5.00,
    '[(L0,25 oc0,25)x2] L0,25 oc3,75'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26220',
    'E-0210.5',
    'Baliza B Torreta cilíndrica sobre caseta de hormigón',
    '',
    'GpD(2)R',
    5.00,
    'L0,5 oc0,7 L0,5 oc3'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26230',
    'E-0210.7',
    'Baliza B Columna cuadrangular adosada a muro azul.',
    '',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26270',
    '',
    'Boya ME Castillete amarillo ( X )',
    'NO',
    'GpD(4)A',
    11.00,
    '[(L0,5+oc1,5)x3]+L0,5+oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26285',
    'E-0210.75',
    'Baliza BE Metalica Moncada',
    'RTU 38 (5 hilos)',
    'DV',
    5.00,
    'L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26290',
    'E-0210.9',
    'Baliza E TPS 3.3',
    '',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26311',
    'E-0210.8',
    'Baliza CS TPS 3.3',
    'RTU 19 (5 hilos)',
    'GpRp(6) DLB',
    10.00,
    '[(L0,25 oc0,25)x 6] L2 oc5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26312',
    'E-0211',
    'Baliza B TPS 3.3',
    '',
    'DR',
    5.00,
    'L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26313',
    '',
    'Boya ME Castillete  amarillo ( X )',
    'RTU 28 (5 hilos)',
    'GpD(4)A',
    11.00,
    '[ ( L0,5 oc1,5 )x 3 ] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26314',
    'E-0212.1',
    'Baliza B TPS 3.3',
    '',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26320',
    '',
    'Boya E Castillete verde( ^ )',
    'No lo necesita',
    'GpD(3)V',
    9.00,
    '[ ( L0,5 oc1,5 ) x 2 ]  L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26325',
    'E-0212.2',
    'Baliza BB TPS 3.3',
    'RTU 11 (5 hilos)',
    'GpD(2+1)R',
    5.00,
    'L0,5 oc1 L0,5 oc3 L0,5 oc9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26326',
    '',
    'Baliza E MTP-35',
    '',
    'Ct V',
    1.00,
    'L 0.5 oc 0.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26360',
    '',
    'Boya E Castillete verde(^ )',
    'RTU 08 (3 hilos)',
    'GpD(4)V',
    11.00,
    '[ ( L0,5 oc1,5 ) x 3 ] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26375',
    '',
    'Baliza B torre poligonal metálica',
    'NO',
    'GpD(4)R',
    11.00,
    '[ ( L0,5 oc1,5 )x 3 ] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26380',
    'E-0214',
    'Baliza B TPS 3.3',
    'RTU 40 (5 hilos)',
    'GpD(2+1)R',
    14.50,
    'L0,5 oc1 L0,5 oc3 L0,5 oc9'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26390',
    'E-0214.6',
    'Baliza E TPS 3.3',
    '',
    'DV',
    3.00,
    'L0,5 oc2,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26392',
    'E-0214.7',
    'Baliza B TPS 3.3',
    '',
    'DR',
    3.00,
    'L0,5 oc2,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450',
    'E-0212.6',
    'Baliza CE Metalica Torre cilíndrica',
    'RTU 39 (5 hilos)',
    'GpCt(3)B',
    5.00,
    '[(L0,3 oc0,8) x2 ] L0,3 oc2,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-a',
    '0',
    'Boya Marca especial',
    '0',
    'DA',
    5.00,
    'L0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-b',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-c',
    '0',
    'Boya Marca especial',
    '0',
    'DA',
    5.00,
    'l0.5  Oc4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-d',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-e',
    '0',
    'Boya Marca especial',
    '0',
    'DA',
    5.00,
    'L0,5 OC 4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-f',
    '0',
    'Boya Marca especialll',
    'No',
    'DA',
    1.00,
    'L0.5 oc 0.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-g',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-h',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-i',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26450-j',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26465',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'DA',
    5.00,
    'L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26465.1',
    '',
    'Boya De castillete amarilla y marca de tope  X amarilla',
    '',
    'DA',
    6.00,
    'L0,7 oc1,8'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26465.3',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'DA',
    6.00,
    'L0,7 oc1,8'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26465.4',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'DA',
    6.00,
    'L0,7 oc1,8'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26470',
    '',
    'Boya SUPRIMIDA De castillete amarilla y marca de tope X amarilla',
    '',
    'GpD(4)A',
    1.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26471',
    '',
    'Boya SUPRIMIDA De castillete amarilla marca de tope  X amarilla',
    '',
    'GpD(4)A',
    1.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26472',
    '',
    'Boya SUPRIMIDA De castillete amarilla y marca de tope X amarilla',
    '',
    'GpD(4)A',
    1.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26473',
    '',
    'Boya SUPRIMIDA De castillete amarilla y marca de tope X amarilla',
    '',
    'GpD(4)A',
    1.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26500',
    'FCanet',
    'Faro',
    'Si',
    'GpD(2)',
    10.00,
    'L0,5+oc2+L0,5+oc7'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26504',
    'E-0217',
    'Baliza Columna verde con la base blanca.',
    '',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26508',
    'E-0217.2',
    'Baliza Columna verde con la base blanca.',
    '',
    'GpD(4)V',
    11.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26510',
    'E-0217.4',
    'Baliza Columna roja con la base blanca.',
    '',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    '26512',
    'E-0217.5',
    'Baliza Columna roja con la base blanca.',
    '',
    'GpD(4)R',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  (
    'batea1',
    '0',
    '0',
    '0',
    'GdD(4)A',
    11.00,
    '(L0.5+oC0.5)X3+L0.5+Oc4.5'
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`
  )
VALUES
  ('prueba', '0', '0', '0', 'GdD(4)A', 0.00, '0');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: documentos
# ------------------------------------------------------------

INSERT INTO
  `documentos` (`id_archivo`, `nombre`, `descripcion`, `created_at`)
VALUES
  (
    '500eebfb-4302-4fe7-8954-155883d44f51.pdf',
    'Resolucion Valencia',
    'Resolucion provisional emitida por PPEE  sobre una parte del balizamiento',
    '2023-05-16'
  );
INSERT INTO
  `documentos` (`id_archivo`, `nombre`, `descripcion`, `created_at`)
VALUES
  (
    'de79b703-f67b-455b-9d8a-f8dacd6a3eed.pdf',
    'Resolucion Marina Real Juan Carlos I',
    'Ultima Resolucion emitida por PPEE sobre dicho balizamiento',
    '2023-05-16'
  );
INSERT INTO
  `documentos` (`id_archivo`, `nombre`, `descripcion`, `created_at`)
VALUES
  (
    'e502a93b-9a59-4d67-9486-23cca55e3f82.pdf',
    'Resolucion Sagunto',
    'Ultima Resolucion emitida por PPEE',
    '2023-05-16'
  );
INSERT INTO
  `documentos` (`id_archivo`, `nombre`, `descripcion`, `created_at`)
VALUES
  (
    'fa5861e4-3dca-4319-ab1e-f9f079ca2840.pdf',
    'Resolucion Gandia',
    'Ultima Resolucion emitida por PPEE',
    '2023-05-16'
  );
INSERT INTO
  `documentos` (`id_archivo`, `nombre`, `descripcion`, `created_at`)
VALUES
  (
    'e4a920eb-f9d5-409d-9e46-cc1aae58b239.pdf',
    'Resolucion Bateas',
    'Resolucion de balizamiento de Bateas emitido por OPPE',
    '2023-05-23'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: inventario
# ------------------------------------------------------------

INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    1,
    NULL,
    'BDL300 G',
    3,
    6,
    4,
    'Baliza modelo BDL300 color verde'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    2,
    NULL,
    'BDL300 R',
    1,
    6,
    4,
    'Baliza modelo BDL300 color roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    3,
    NULL,
    'Optica BDL300',
    2,
    6,
    4,
    'Solo la óptica para modelo BDL300'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    4,
    NULL,
    'Optica BDL120',
    20,
    6,
    4,
    'Solo la óptica para modelo BDL120'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    5,
    NULL,
    'BDL120 R',
    1,
    6,
    4,
    'Baliza modelo BDL120 color Roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    6,
    NULL,
    'Optica BDL120 2018',
    NULL,
    6,
    4,
    'Solo la óptica para modelo BDL120 año 2018'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    8,
    NULL,
    'Panel 20w 36cmx31xm',
    1,
    5,
    2,
    'Panel solar de 20w de medidas 36cmx31'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    9,
    NULL,
    'Panel 10w 27cmx48cm',
    3,
    5,
    2,
    'Panel solar de 10w de medidas 27cmx48'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    10,
    NULL,
    'BDL 120 HI W',
    1,
    5,
    3,
    'Baliza de alta intensidad color blanco'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    11,
    NULL,
    'MCL 120 Y',
    1,
    5,
    3,
    'Baliza color amarillo'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (12, NULL, 'MCL 120 W', 1, 5, 3, 'Baliza color blanco');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    13,
    NULL,
    'MBL 160 Y',
    2,
    5,
    3,
    'Baliza color amarillo'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    14,
    NULL,
    'BDL 120 G',
    1,
    5,
    4,
    'Baliza BDL120 de color verde'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    15,
    NULL,
    'BDL 120 R',
    1,
    5,
    4,
    'Baliza BDL120 de color roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    16,
    NULL,
    'BDL 120 W',
    1,
    5,
    4,
    'Baliza BDL120 de color blanca'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    17,
    NULL,
    'Corona amarilla completa',
    1,
    5,
    4,
    'Una corona amarilla entera'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    18,
    NULL,
    'Corona roja completa',
    3,
    5,
    4,
    'Una corona roja entera'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    19,
    NULL,
    'Corona verde completa',
    3,
    5,
    4,
    'Una corona verde entera'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    20,
    NULL,
    'Piña verde de 50w',
    1,
    5,
    4,
    'Una piña verde 50w'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    21,
    NULL,
    'Piña blanca de 50w',
    1,
    5,
    4,
    'Una piña blanca 50w'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    22,
    NULL,
    'Discos amarillos',
    5,
    5,
    4,
    'Discos amarillos 02827'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    25,
    NULL,
    'Panel 66w 66x78',
    6,
    4,
    2,
    'Panel solar de 66w de medidas 66cmx78cm'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    26,
    NULL,
    'Cuandro de Anfer MOSCAD',
    1,
    4,
    2,
    'Un cuadro completo de Anfer para telecomunicaciones'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    27,
    NULL,
    'MBL 160 R',
    1,
    4,
    3,
    'Baliza MBL160 de color roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    28,
    NULL,
    'MCL 140 G',
    1,
    4,
    3,
    'Baliza MCL140 de color verde'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    29,
    NULL,
    'BDL 120 Y',
    1,
    4,
    3,
    'Baliza BDL120 de color amarilla'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    30,
    NULL,
    'BDL 120 Y',
    2,
    4,
    4,
    'Baliza BDL120 de color amarilla'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    31,
    NULL,
    'Panel 95w 66x78',
    3,
    3,
    2,
    'Panel solar de 95w de medidas 66cmx78cm'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    32,
    NULL,
    'Antena GPS',
    1,
    4,
    2,
    'Antena GPS marca Garmin'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    33,
    NULL,
    'BDL 120 R',
    4,
    3,
    3,
    'Baliza BDL120 de color roja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    34,
    NULL,
    'BDL 120 R old',
    1,
    3,
    3,
    'Baliza BDL120 de color roja vieja'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (35, NULL, 'Radial', 1, 3, 4, 'Radial');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (36, NULL, 'Analizador de Baterias', 1, 3, 4, '');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    37,
    NULL,
    'Taladro Metabo',
    1,
    3,
    4,
    'Taladro Metabo 18LT'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    38,
    NULL,
    'Taladro Bosch',
    1,
    3,
    4,
    'Taladro Bosch GST-60P'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    39,
    NULL,
    'Sistema Alimentacion',
    3,
    2,
    2,
    'Sistema alimentacion C20'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    40,
    NULL,
    'Cargador',
    9,
    2,
    2,
    'Blue Power Charger ISA'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    41,
    NULL,
    'BKL 120 W',
    1,
    2,
    3,
    'Baliza BKL 120 blanca'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    42,
    NULL,
    'BKL 120 Y',
    1,
    2,
    3,
    'Baliza BKL 120 amarilla'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (43, NULL, 'BDL 120 G', 3, 2, 3, 'Baliza BDL 120 verde');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (44, NULL, 'DES22', 6, 2, 4, 'Destellador D22');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (45, NULL, 'DES33', 1, 2, 4, 'Destellador D33');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (46, NULL, 'Tarjeta BKL120', 2, 2, 4, 'Tarjeta BKL 120');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    47,
    NULL,
    'Disco LEDs Y',
    30,
    2,
    4,
    'Disco LEDs amarillo'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (48, NULL, 'Disco LEDs G', 30, 2, 4, 'Disco LEDs verde');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (49, NULL, 'Disco LEDs W', 3, 2, 4, 'Disco LEDs blanco');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (50, NULL, 'Disco LEDs R', 22, 2, 4, 'Disco LEDs rojo');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    53,
    NULL,
    'Cargador Bateria',
    1,
    1,
    1,
    'Cargador bateria Krauser 20A'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    54,
    NULL,
    'Bateria SB12',
    7,
    1,
    2,
    'Bateria SB6 de 100Ah medidas 24x19cm'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (55, NULL, 'AS12V', 3, 1, 3, 'Bateria de 10Ah 15x10cm');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (56, NULL, 'AS06V', 3, 1, 3, 'Bateria de 10Ah 15x5cm');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    57,
    NULL,
    'PR2020 STECA',
    3,
    1,
    4,
    'Regulador carga fotovoltaica PR2020 STECA'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    58,
    NULL,
    'PRS 2020 STECA',
    2,
    1,
    4,
    'Regulador carga fotovoltaica PRS2020 STECA'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    59,
    NULL,
    'PR2020 STECA IP65',
    1,
    1,
    4,
    'Regulador carga fotovoltaica PR2020 STECA IP65'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    60,
    NULL,
    'Soldador',
    1,
    1,
    4,
    'Soldador portatil Fronius TransPocket 1500'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (73, NULL, 'Pintura Spray VERDE', 8, 5, 1, '6038 400ml');
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    74,
    NULL,
    'Pintura Spray ROJO',
    8,
    5,
    1,
    'RAL 3024 400ml'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    75,
    NULL,
    'Pintura Spray BLANCO',
    8,
    5,
    1,
    'RAL 9016 400ml'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    76,
    NULL,
    'Pintura Spray AMARILLO',
    8,
    5,
    1,
    'RAL 1023 400ml'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    77,
    NULL,
    'Pintura Spray NEGRO',
    8,
    5,
    1,
    'RAL 9017 400ml'
  );
INSERT INTO
  `inventario` (
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (78, NULL, 'Disolvente', 5, 5, 1, '');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: inventario_eliminados
# ------------------------------------------------------------

INSERT INTO
  `inventario_eliminados` (
    `fecha`,
    `id`,
    `tipo`,
    `item`,
    `cantidad`,
    `fila`,
    `columna`,
    `descripcion`
  )
VALUES
  (
    '2023-05-23 07:45:59',
    52,
    '',
    'Grupo monofasico',
    111,
    1,
    1,
    'Grupo monofasico Ayerbe de 1,5kw'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lampara
# ------------------------------------------------------------

INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25460', 1.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25470', 1.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25530',
    7.00,
    15.00,
    7.00,
    'DES 33 MaqVal. Bola leds 50 w Óptica300 mm',
    0.00,
    0.00,
    2.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25545',
    3.00,
    9.00,
    5.00,
    'Des 33 Maq. Val.Bola de leds de 50 W ÓpticaFresnel 300mm',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25552',
    4.00,
    6.00,
    3.00,
    'DES 22 Maq. Val.  8 coronas de leds  Óptica BDL 120',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25554',
    22.00,
    2.00,
    1.00,
    'MCL 160 (MSM)',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25555',
    2.00,
    4.00,
    1.00,
    'DES 22 Maq. Val.  4 coronas de leds  Óptica BDL 120',
    0.00,
    1.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25560',
    2.00,
    4.00,
    1.00,
    'DES 22 LMV   4 coronas de leds  Óptica BDL 120',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25563',
    2.00,
    33.00,
    1.00,
    'MBL 160 (MSM) S/N:224 Año 2015',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25564',
    3.00,
    3.00,
    2.32,
    'MBL 160 (MSM)',
    0.00,
    0.01,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25565',
    3.00,
    5.00,
    1.00,
    'DES 22 LMV     2 discos de leds    Óptica BDL 120',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25570',
    3.00,
    5.00,
    1.00,
    'DES 22 LMV  2 discos de leds  Óptica BDL 120',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25590',
    7.00,
    10.00,
    5.00,
    'BDL 300 LMV Leds 18w. DES 22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25600',
    7.00,
    10.00,
    3.00,
    'BDL 120 LMV DES 22',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25640', 0.00, 0.00, 0.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25650',
    14.00,
    28.00,
    19.00,
    'Lampara halogenuros venture light 400w',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25665',
    5.00,
    7.00,
    4.00,
    'AUTONOMA MCL 140 MSM (3MN)',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25667',
    2.00,
    3.00,
    1.00,
    'Autónoma SL60 SEALITE (1MN)',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25700',
    32.00,
    35.00,
    24.00,
    'PRINCIPAL: MBR600L --- BAEM: MBR300L --- MOTOR: MRM160',
    2.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25720',
    5.00,
    21.00,
    5.00,
    'BDL 300 50w.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25721',
    4.00,
    6.00,
    1.00,
    'BDL 120 cuatro coronas.',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25730',
    3.00,
    3.00,
    3.00,
    'MCL360 L',
    1000.00,
    3.00,
    100.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25740',
    6.00,
    6.00,
    5.00,
    'MCL360 L',
    191.67,
    0.00,
    230.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25761',
    4.00,
    4.00,
    3.00,
    'BDL 120 una corona HI (DES33).',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25765',
    4.00,
    4.00,
    3.00,
    'BDL 120 una corona HI (DES33).',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25768', 3.00, 3.00, 2.00, 'MCL 160', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25774',
    9.00,
    21.00,
    3.00,
    'BDL 300 50w.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25776',
    3.00,
    12.00,
    3.00,
    'BDL 120 ocho coronas.',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25777',
    4.00,
    6.00,
    3.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25800',
    3.00,
    5.00,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25820',
    4.00,
    6.00,
    3.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25820.1', 3.00, 0.00, 1.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25830',
    6.00,
    8.00,
    1.00,
    'MBL 160 - 2 niveles',
    907.00,
    1.00,
    756.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25831',
    2.00,
    5.00,
    1.00,
    'MCL200.',
    360.00,
    1.00,
    300.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25840',
    4.00,
    7.00,
    3.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25841',
    3.00,
    3.00,
    3.00,
    'BDL 120 (ocho coronas de led)',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25842', 4.00, 5.00, 1.00, 'MCL 200', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25842.5',
    2.00,
    0.00,
    1.00,
    'MCL 160 12% divergencia',
    109.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('25843', 2.00, 0.00, 1.00, 'MCL 200', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25843.5',
    2.00,
    0.00,
    1.00,
    'MCL 140',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25843.8',
    2.00,
    0.00,
    1.00,
    'MCL 140',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25844',
    3.00,
    3.00,
    3.00,
    'BDL 120 dos. coronas.',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25850',
    4.00,
    6.00,
    3.00,
    'BDL 120 ocho coronas',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25920',
    4.00,
    6.00,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    1.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25940',
    4.00,
    6.00,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '25960',
    4.00,
    5.00,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26020',
    3.00,
    9.00,
    3.00,
    'BDL 120 LC-b/ HI.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26021',
    4.00,
    9.00,
    3.00,
    'BDL 300 Piña de leds de 25W.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26025',
    4.00,
    5.00,
    1.00,
    'BDL 300 Piña de leds de 25W.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26035',
    3.00,
    5.00,
    1.00,
    'BDL 120 ocho coronas. ',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26041',
    3.00,
    5.00,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26045',
    4.00,
    8.00,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26046',
    4.00,
    5.00,
    1.00,
    'BDL 120 ocho coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26047', 5.00, 17.00, 5.00, 'BDL 300', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26047.1',
    4.00,
    16.00,
    3.00,
    'BDL 120 HI',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26047.2',
    4.00,
    16.00,
    3.00,
    'BDL 120 HI',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26048', 5.00, 12.00, 5.00, 'BDL 300', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26048.1',
    4.00,
    9.00,
    3.00,
    'BDL 120',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26048.2',
    3.00,
    0.00,
    3.00,
    'MBL 160',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26048.3',
    3.00,
    0.00,
    3.00,
    'MBL 160',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26049', 2.00, 2.00, 3.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26050', 3.00, 9.00, 5.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26052', 0.00, 6.00, 3.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26052.5',
    1.00,
    0.00,
    1.00,
    'MCL 100',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26052.7',
    1.00,
    0.00,
    1.00,
    'MCL 100',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26055', 0.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26055.5', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26055.6', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26056', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.1', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.15', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.16', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.17', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.2', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.4', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.6', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26058.8', 3.00, 5.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26060', 0.00, 0.00, 1.00, '', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26083', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26190', 4.00, 4.00, 3.00, 'MCL140', 10.10, 2.30, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26200', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26202', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26205', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26220', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26230', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26270',
    2.00,
    2.00,
    3.00,
    'MCL-140  SN 295  (Autoalimentada)',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26285',
    5.00,
    20.00,
    5.00,
    ' BDL-300 (50w)/ DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26290',
    4.00,
    7.00,
    2.00,
    'BDL-120 (3 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26311',
    4.00,
    17.00,
    3.00,
    'BDL-120 (3 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26312',
    4.00,
    17.00,
    3.00,
    'BDL-120 (8 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26313',
    5.00,
    5.00,
    3.00,
    'BDL-120 (5 coronas) / DES-33',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26314',
    4.00,
    12.00,
    3.00,
    'BDL-120 (4 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26320',
    4.00,
    4.00,
    3.00,
    'BDL-120 (4 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26325',
    4.00,
    8.00,
    3.00,
    'BDL-120 (8 coronas) / DES-22',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26326', 5.00, 7.00, 1.00, 'MBL-160', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26360',
    4.00,
    4.00,
    3.00,
    'BDL-120 (8 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26375',
    3.00,
    4.00,
    1.00,
    'MCL 200',
    283.00,
    1.00,
    236.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26380',
    4.00,
    6.00,
    3.00,
    'BDL-120 (8 coronas) / DES-22',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26390',
    4.00,
    6.00,
    1.00,
    'BDL-120 HI (2 coronas) / DES-33',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26392',
    4.00,
    6.00,
    1.00,
    'BDL-120 HI (2 coronas) / DES-33',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450',
    6.00,
    12.00,
    5.00,
    'MCL200 autonoma / DES-33',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-a',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-b',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-c',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-d',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-e',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-f',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-g',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-h',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-i',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26450-j',
    2.00,
    2.00,
    1.00,
    'MCL100 sync',
    56.00,
    1.00,
    56.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26465', 0.00, 0.00, 3.00, 'Si', 0.00, 2.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26465.3', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26465.4', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('26470', 0.00, 0.00, 3.00, 'Si', 0.00, NULL, NULL);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26500',
    30.00,
    33.00,
    23.00,
    'MV MGE150 2002',
    0.00,
    0.00,
    0.00
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26508',
    2.00,
    4.00,
    1.00,
    'BDL 120 dos coronas.',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  (
    '26512',
    2.00,
    4.00,
    1.00,
    'BDA 155 LMV',
    0.00,
    NULL,
    NULL
  );
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('batea1', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);
INSERT INTO
  `lampara` (
    `nif`,
    `altura`,
    `elevacion`,
    `alcanceNom`,
    `linterna`,
    `candelasCalc`,
    `alcanceLum`,
    `candelasInst`
  )
VALUES
  ('prueba', 0.00, 0.00, 0.00, '0', 0.00, 0.00, 0.00);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: localizacion
# ------------------------------------------------------------

INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25460',
    'C.N. Oliva',
    1,
    'Extremo dique de abrigo',
    '38º 59.004\' N',
    '00º 05.490\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25470',
    'C.N. Oliva',
    2,
    'Extremo contradique',
    '38º55.989\' N',
    '00º 05.559\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25530',
    'Puerto de Gandía',
    11,
    'Extremo dique norte',
    '38º 59.712\' N',
    '00º 8.666\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25545',
    'Puerto de Gandía',
    2,
    'Extremo del contradique',
    '38º 59.661\' N',
    '00º 8.813\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25552',
    'Puerto de Gandía',
    3,
    'Extremo Dique Sur',
    '38º 59.736\' N',
    '00º 9.108\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25554',
    'Puerto de Gandía',
    43,
    'Boya bifurcación',
    '38º 59.789\' N',
    '00º 9.173\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25555',
    'Puerto de Gandía',
    5,
    'Dársena deportiva a estribor.',
    '38º 59.815\' N',
    '00º 9.154\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25560',
    'Puerto de Gandía',
    6,
    'Dársena deportiva Extremo contradique.',
    '38º 59.813\' N',
    '00º 9.181\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25563',
    'Puerto de Gandía',
    7,
    'Pantalan A - extremo - muelle Borgia',
    '38º 59.720\' N',
    '00º 9.359\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25564',
    'Puerto de Gandía',
    8,
    'Pantalan B - extremo - muelle Borgia',
    '38º 59.662\' N',
    '00º 9.527\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25565',
    'Puerto de Gandía',
    9,
    'Muelle final encauzamiento',
    '38º 59.639\' N',
    '00º 9.560\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25570',
    'Puerto de Gandía',
    10,
    'Muelle frutero angulo NE',
    '38º 59.708\' N',
    '00º 9.259\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25590',
    'Desembocadura Júcar Cullera',
    1,
    'Malecón Norte a 20 m del extremo',
    '39º 09.079\' N',
    '00º 14.048\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25600',
    'Desembocadura Júcar Cullera',
    2,
    'Malecón Sur a 39 m del extremo',
    '39º 09.034\' N',
    '00º 14.164\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25620',
    'Desembocadura Júcar Cullera',
    3,
    'Puente de la Bega, en el mejor lugar de paso',
    '39º 09.450\' N',
    '00º 15.138\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25640',
    'Al norte de la desembocadura del Júcar',
    4,
    'Escollo El Moro',
    '39º 09.605\' N',
    '00º 13.849\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25650',
    'Gandia',
    0,
    'Extremo del cabo de Cullera',
    '39º 11.188\' N',
    '00º 13.016\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25660',
    'Gola del Perelló',
    1,
    'Extremo Dique Norte',
    '39º16,723\' N',
    '00º 16,359\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25665',
    'Gola del Perelló',
    2,
    'Extremo Dique sur',
    '39º16,695\' N',
    '00º 16,374\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25667',
    'Gola del Perelló',
    3,
    'Extremo espigón interior.',
    '39º16,719\' N',
    '00º 16,406\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25700',
    'Faro de Valencia',
    1,
    'Angulo del dique de la ampliacion norte',
    '39º 27.297´ N',
    '00º 17.161´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25720',
    'Puerto de Valencia.',
    1,
    'Extremo dique del Este',
    '39º 26.028\' N',
    '000º 18.171\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25721',
    'Puerto de Valencia.',
    3,
    'Martillo dique del Este',
    '39° 26.139\' N',
    '00° 18.349\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25730',
    'Puerto de Valencia.',
    25,
    'Exterior, en alineación contradique RCNV.',
    '39º 25.219´N',
    '00º 18.218´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25740',
    'Puerto de Valencia.',
    2,
    'Canal de entrada Br.',
    '39º 25.582´N',
    '000º 18.187´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25761',
    'Puerto de Valencia.',
    5,
    'Canal, ángulo Este del contradique.',
    '39º 25.898´N',
    '000º 18.465´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25765',
    'Puerto de Valencia.',
    6,
    'Canal, ángulo Norte del contradique.',
    '39º 26.150´N',
    '00º 18.766´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25768',
    'Puerto de Valencia.',
    10,
    'Canal de entrada Er. frente Xitá.',
    '39º 26.401\' N',
    '00º 18.684\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25774',
    'Puerto de Valencia.',
    4,
    'Contra dique, ángulo Este',
    '39º 25.840´N',
    '00º18.561´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25776',
    'Puerto de Valencia.',
    7,
    'Extremo del contradique.',
    '39° 26.106\' N',
    '00° 18.811\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25777',
    'Puerto de Valencia.',
    8,
    'Extremo del contradique ángulo interior.',
    '39º 26.083´N',
    '00º 18.847´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25800',
    'Puerto de Valencia.',
    9,
    'Roja xita.',
    '39º 26.527´N',
    '00º 18.635´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25820',
    'Puerto de Valencia.',
    11,
    'Verde Xitá.',
    '39º 26.516´N',
    '00º 18.760´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25820.1',
    'Puerto de Valencia.',
    12,
    'Canal de entrada Er. Xitá.',
    '39º 26.512´N',
    '00º 18.779´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25830',
    'Puerto de Valencia.',
    20,
    'Muelle Transversal Costa.',
    '39º 26.245´N',
    '00º 19.181´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25831',
    'Puerto de Valencia',
    21,
    'Muelle Transversal Costa en Duque de Alba',
    '39º 26,252´N',
    '000º 19,145´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25840',
    'Puerto de Valencia.',
    14,
    'Muelle Sur.',
    '39º 26.589´N',
    '00º 18.984´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25841',
    'Puerto de Valencia.',
    15,
    'Extremo del muelle sur.',
    '39º 26.590´N',
    '00º 18.938´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25842',
    'Puerto de Valencia.',
    16,
    'Er. Dársena de servicios Náuticos.',
    '39º 26.475´N',
    '00º 19.062´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25842.5',
    'Puerto de Valencia.',
    18,
    'Boya a Er. Bocana Dársena de Servicios Náuticos.',
    '39º 26.454´N',
    '00º 19.056´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25843',
    'Puerto de Valencia.',
    17,
    '1ª boya a Br. Dársena de Servicios Náuticos.',
    '39º 26.402´N',
    '00º 19.076´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25843.5',
    'Puerto de Valencia.',
    19,
    '2ª boya a Br. Dársena de Servicios Náuticos.',
    '39º 26.439´N',
    '00º 19.094´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25843.8',
    'Puerto de Valencia.',
    19,
    '3ª boya Br. Dársena de Servicios Náuticos',
    '39º 26.484´N',
    '00º 19.093´W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  ('25844', '1', 1, 'RETIRADA', '1', '1');
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25850',
    'Puerto de Valencia',
    13,
    'Muelle de Levante',
    '39º 26.772´N',
    '00º 18.866´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25920',
    'Puerto de Valencia.',
    22,
    'E. Turia Er.',
    '39º 26.901´N',
    '00º 19.284´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25940',
    'Puerto de Valencia.',
    23,
    'Br E.Turia.',
    '39º 26.990´N',
    '00º 19.237´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '25960',
    'Puerto de Valencia.',
    24,
    'Muelle Poniente.',
    '39º 27.241´N',
    '00º 19.372´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26020',
    'Puerto de Valencia.',
    26,
    'RCNV Contra dique ángulo Sur',
    '39º 25.242´N',
    '00º 19.052´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26021',
    'Puerto de Valencia.',
    27,
    'Er. Bocana R.C.N.V.',
    '39º 25.356´N',
    '00º 19.360´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26025',
    'Puerto de Valencia.',
    28,
    'Br.Bocana R.C.N.V.',
    '39º 25.427´N',
    '00º 19.411´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26035',
    'Puerto de Valencia.',
    30,
    'R.C.N.V. Verde interior',
    '39º 25,643´ N',
    '0º 19,773´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26041',
    'Puerto de Valencia.',
    29,
    'R.C.N.V. Bocana interior roja',
    '39º 25,595´ N',
    '0º 19,776´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26045',
    'Puerto de Valencia.',
    31,
    'Verde bocana D.E.M.',
    '39º 25.530´N',
    '00º 19.856´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26046',
    'Puerto de Valencia.',
    32,
    'Roja bocana D.E.M.',
    '39º 25.545´N',
    '00º 19.884´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26047',
    'Puerto de Valencia.',
    33,
    'Er.Extremo dique de abrigo de la ampliación N',
    '39º 26.651´N',
    '00º 17.500´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26047.1',
    'Puerto de Valencia.',
    36,
    'Cambio de alineación del dique de abrigo de ampliación N',
    '39º 27.300´N',
    '00º 17.147´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26047.2',
    'Puerto de Valencia.',
    37,
    'Quiebro del nuevo dique de abrigo',
    '39º 27.512´N',
    '00º 17,748\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26048',
    'Puerto de Valencia.',
    34,
    '1ª Baliza de babor del nuevo contradique de la amp. N',
    '39º 26.679\' N',
    '00º 17.930\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26048.1',
    'Puerto de Valencia.',
    35,
    '2ª baliza de Br, Extremo contradique de la ampliación N',
    '39º 27.070´N',
    '00º 17.719´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26048.2',
    'Puerto de Valencia.',
    100,
    'Darsena Norte',
    '39º 27.155´N',
    '00º 18.042\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26048.3',
    'Puerto Valencia',
    101,
    'Darsena Norte',
    '39º 27.104´N',
    '00º 17.882\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26049',
    'Marina Real Juan Carlos I.Valencia',
    38,
    'Boya a babor Bocana Norte',
    '39º 27.850´N',
    '00º 18.509\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26050',
    'Marina Real Juan Carlos I.Valencia',
    39,
    'Extremo Dique de abrigo Bocana Norte',
    '39º 27.767´N',
    '00º 18.509\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26052',
    'Marina Real Juan Carlos I.Valencia',
    40,
    'Extremo Contradique Bocana Norte',
    '39º 27.665´N',
    '00º 18.632\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26052.5',
    'Marina Real Juan Carlos I Valencia',
    0,
    'Primera boya Marca Especial Dársena Exterior',
    '39º 27.677´N',
    '000º 18.610´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26052.7',
    'Marina Real Juan Carlos I Valencia',
    0,
    '0',
    '0',
    '0'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26055',
    'Marina Real Juan Carlos I.Valencia',
    41,
    'Espigón de cierre Extremo oeste Darsena Sur',
    '39º 27.599´N',
    '00º 18.753\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26055.5',
    'Marina Real Juan Carlos I Valencia',
    43,
    'Dique - Extremo - Darsena Sur',
    '39º 27.615\' N',
    '00º 18.833\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26055.6',
    'Marina Real Juan Carlos I.Valencia.',
    45,
    '1ª Baliza a babor Canal de Acceso',
    '39º 27.634´N',
    '00º 19.016\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26056',
    'Marina Real Juan Carlos I.Valencia',
    42,
    'Angulo Oeste- Darsena Norte - Explanada',
    '39º 27.668´N',
    '00º 18.755\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058',
    'Marina Real Juan Carlos I. Valencia.',
    44,
    'Espigón - Extremo - Darsena Auxiliar',
    '39º 27.677´N',
    '00º 19.002\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.1',
    'Marina Real Juan Carlos I. Valencia',
    51,
    'Angulo oeste - Darsena auxiliar',
    '39º 27.683\'N',
    '00º 19.112\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.15',
    'Marina Real Juan Carlos I. Valencia',
    102,
    'Semaforo a estribor - Puente móvil. Valencia',
    '39º 27,683´ N',
    '000º 19.112´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.16',
    'Marina Real Juan Carlos I. Valencia',
    103,
    'Semáforo a babor - Puente móvil. Valencia',
    '39º 27,638´ N',
    '000º 19.112´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.17',
    'Marina Real Juan Carlos I. Valencia',
    104,
    'Semáforo sobre tablero del puente móvil. Valencia',
    '39º 27,666´ N',
    '000º 19.133´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.2',
    'Marina Real Juan Carlos I.Valencia',
    46,
    '1ª Baliza a estribor Canal de Acceso',
    '39º 27.685´N',
    '00º 19.328\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.4',
    'Marina Real Juan Carlos I.Valencia.',
    47,
    '2ª Baliza a babor Darsena Auxiliar',
    '39º 27.642´N',
    '00º 19.315\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.6',
    'Marina Real Juan Carlos I.Valencia.',
    48,
    '2ª Baliza a estribor Canal de acceso',
    '39º 27.617´N',
    '00º 19.505\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26058.8',
    'Marina Real Juan Carlos I.Valencia.',
    49,
    '3ª Baliza a babor Darsena auxiliar',
    '39º 27.562´N',
    '00º 19.466\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26060',
    'Marina Real Juan Carlos I.Valencia',
    50,
    'Darsena interior, en el extremo de la rampa de varadero',
    '39º 27.669´N',
    '00º 19.560\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  ('26083', 'Puertos del Estado', 0, '0', '0', '0');
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26150',
    'PORT-SAPLAYA',
    1,
    'Extremo dique Sur',
    '39º 30.614\' N',
    '00º 19.111\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26160',
    'PORT-SAPLAYA',
    2,
    'Extremo dique Norte',
    '39º 30,602\' N',
    '00º 19,065\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26190',
    'Port saplaya pontona',
    3,
    'Señaliza pontona hundida',
    '39º 32.766\' N',
    '00º 16.887\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26200',
    'Pobla Farnals',
    1,
    'Extremo dique de Levante',
    '39º 33,496\' N',
    '00º 17,008\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26202',
    'Pobla Farnals',
    2,
    'Dique de Levante, angulo interior.',
    '39º 33,589\' N',
    '00º 17,026\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26205',
    'Pobla Farnals',
    3,
    'Ángulo exterior',
    '39º 33,767\' N',
    '00º 16,861\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26220',
    'Pobla Farnals',
    4,
    'Extremo espigón de playa.',
    '39º 33,520\' N',
    '00º 17,070\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26230',
    'Pobla Farnals',
    5,
    'Extremo muelle contradique.',
    '39º 33.617\' N',
    '00º 17.046\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26270',
    'Puerto de Sagunto - UNIÓN FENOSA',
    14,
    'Emisario submarino',
    '39º 37.831\' N',
    '00º 13.528\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26285',
    'Puerto de Sagunto',
    1,
    'Extremo Dique de abrigo',
    '39º 37.830\' N',
    '00º 12.321\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26290',
    'Puerto de Sagunto',
    2,
    'Martillo Dique de abrigo',
    '39º 38.035\' N',
    '00º 12.372\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26311',
    'Puerto de Sagunto',
    3,
    'Contradique ( Angulo S )',
    '39º 37.754\' N',
    '00º 12.935\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26312',
    'Puerto de Sagunto',
    4,
    'Contradique ( Angulo E )',
    '39º 38.001\' N',
    '00º 12.715\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26313',
    'Puerto de Sagunto',
    5,
    'Talud contradique',
    '39º 38.060\' N',
    '00º 12.630\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26314',
    'Puerto de Sagunto',
    6,
    'Contradique ( Extremo )',
    '39º 38.264\' N',
    '00º 12.684\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26320',
    'Puerto de Sagunto',
    7,
    '1ª boya Canal Principal',
    '39º 38.590\' N',
    '00º 12.570\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26325',
    'Puerto de Sagunto',
    8,
    'Muelle noreste,extremo sur.',
    '39º 38.569\' N',
    '00º 12.746\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26326',
    'Puerto de Sagunto',
    15,
    'Muelle Norte Dos',
    '39º 38.562\' N',
    '00º 12.805\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26360',
    'Puerto de Sagunto',
    9,
    '2ª boya Canal Principal',
    '39º 38.920\' N',
    '00º 12.690\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26375',
    'Puerto de Sagunto',
    16,
    'Muelle de servicios, extremo',
    '39º 38.822 N',
    '000º 12.797 W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26380',
    'Puerto de Sagunto',
    10,
    'Muelle Sur (Angulo)',
    '39º 38.858\' N',
    '00º 12.820\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26390',
    'Puerto de Sagunto',
    11,
    'Dársena pesquera (Dique)',
    '39º 39.134\' N',
    '00º 12.654\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26392',
    'Puerto de Sagunto',
    12,
    'Dársena pesquera (Contradique)',
    '39º 39.152\' N',
    '00º 12.622\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450',
    'Puerto de Sagunto',
    13,
    'Pantalán Sierra Menera',
    '39º 38.803\' N',
    '00º 11.664\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-a',
    'Puerto de Sagunto',
    0,
    'Pantalan Sierra Menera',
    '39º 38.885\' N',
    '00° 11.760\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-b',
    'Puerto de Sagunto',
    0,
    'Pantalan Sierra Menera',
    '39° 38.838\' N',
    '0° 11.796\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-c',
    'Puerto de Sagunto',
    0,
    'Pantalan Sierra Menera',
    '39° 38.940\' N',
    '0° 11.880\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-d',
    'Puerto de Sagunto',
    0,
    'Pantalan Sierra Menera',
    '39° 38.894\' N',
    '0° 11.916\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-e',
    'Puerto de Sagunto',
    5,
    'Pantalan sierra menera sagunto',
    '39° 38.9956\' N',
    '0° 12.0005\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-f',
    'Puerto de Sagunto',
    6,
    'Pantalan Sierra Menera',
    '39° 38.9495\' N',
    '0° 12.0364\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-g',
    'Puerto de Sagunto',
    0,
    'Pantalan Sierra Menera',
    '39° 39.051\' N',
    '0° 12.121\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-h',
    'Puerto de Sagunto',
    0,
    'Pantalan Sierra Menera',
    '39° 39.005\' N',
    '0° 12.156\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-i',
    'Puerto de Sagunto',
    0,
    'Pantalan Sierra Menera',
    '39° 39.106\' N',
    '0° 12.241\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26450-j',
    'Puerto de Sagunto',
    0,
    'Pantalan Sierra Menera',
    '39° 39.060\' N',
    '0° 12.276\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26465',
    'Cultivos marinos &quot;Culmarex&quot;',
    1,
    'Boya SE',
    '39º 38.213\' N',
    '00º 9.638\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26465.1',
    'Cultivos marinos &quot;Culmarex&quot;',
    4,
    'Boya NE',
    '39º 38.770\' N',
    '00º 09.835\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26465.3',
    'Cultivos marinos &quot;Costa Blanca&quot;',
    3,
    'Boya SW',
    '39º 38.105\' N',
    '00º 10.161\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26465.4',
    'Cultivos marinos &quot;Culmarex&quot;',
    4,
    'Boya NW',
    '39º 38.657\' N',
    '00º 10.356\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26470',
    'Cultivos marinos &quot;Acuimed&quot;',
    5,
    'Boya S',
    '39º 38.900\' N',
    '00º 10.600\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26471',
    'Cultivos marinos &quot;Acuimed&quot;',
    6,
    'Boya W',
    '39º 39.100\' N',
    '00º 10.900\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26472',
    'Cultivos marinos &quot;Acuimed&quot;',
    7,
    'Boya N',
    '39º 39.200\' N',
    '00º 10.800\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26473',
    'Cultivos marinos',
    8,
    'Boya E',
    '39º 39.031\' N',
    '00º 10.523\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26500',
    'Faro de Canet Sagunto',
    1,
    'Cabo Canet',
    '39º 40,471´ N',
    '00º 12,460´ W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26504',
    'Canet de Berenguer',
    1,
    'Extremo dique de Levante',
    '39º 40.337\' N',
    '00º 12.063\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26508',
    'Canet de Berenguer',
    2,
    'Extremo Martillo',
    '39º 40.366\' N',
    '00º 12.073\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26510',
    'Canet de Berenguer',
    3,
    'Extremo Sur Contradique',
    '39º 40.370\' N',
    '00º 12.105\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    '26512',
    'Canet de Berenguer',
    4,
    'Extremo Norte Contradique',
    '39º 40.430\' N',
    '00º 12.093\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    'batea1',
    'Valencia',
    0,
    '0',
    '39º 27.150\' N',
    '000º 17.292\' W'
  );
INSERT INTO
  `localizacion` (
    `nif`,
    `puerto`,
    `num_local`,
    `localizacion`,
    `latitud`,
    `longitud`
  )
VALUES
  (
    'prueba',
    '0',
    0,
    '0',
    '39º 26.724\' N',
    '000º 17.292\' W'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: logs
# ------------------------------------------------------------

INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 14:36:22', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 14:37:20', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 14:44:28', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 14:44:51', 'adrian', 'elimado', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 14:48:46',
    'adrian',
    'Item elimi',
    'delete from inventario where id=62'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 14:59:11', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 14:59:48',
    'adrian',
    'Item elimi',
    'delete from inventario where id=63'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 14:59:51',
    'adrian',
    'Item elimi',
    'delete from inventario where id=64'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 14:59:53',
    'adrian',
    'Item elimi',
    'delete from inventario where id=65'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 15:03:53', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 15:03:59', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 15:04:21', 'pepe', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 15:04:28', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 15:04:33',
    'adrian',
    'Item elimi',
    'delete from inventario where id=66'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 15:09:39',
    'adrian',
    'Item elimi',
    'delete from inventario where id=67'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 15:15:35',
    'adrian',
    'Item elimi',
    'delete from inventario where id=68'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 15:18:58',
    'adrian',
    'Item añadi',
    'insert into inventario values(NULL,\'fgg\',4,6,1,\'fg\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 15:22:21',
    'adrian',
    'Item añadi',
    'insert into inventario values(NULL,\'gjfgjfkj\',5,6,1,\'6\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 15:31:43',
    'adrian',
    'Item elimi',
    'fgg 4 6 1 fg'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-05-31 15:35:30',
    'adrian',
    'Item elimi',
    'gjfgjfkj 5 6 1 6'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-05-31 15:41:58', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-04 10:12:09', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-05 14:28:51', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-05 16:02:16', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-05 16:10:39',
    'adrian',
    'Mantenimie',
    'insert into mantenimiento values(25700,\'2019-06-05\',\'sfg\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 11:16:25',
    '',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25740,\'2019-06-05\',\'Se recupera la boya varada en la playa de pinedo\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 11:28:27',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'prueba\',2,5,3,\'e\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 11:29:19',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'p2\',2,5,3,\'3\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-07 11:29:27', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 11:29:36',
    'adrian',
    'Item eliminado',
    'delete prueba 2 5 3 e'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 11:29:39',
    'adrian',
    'Item eliminado',
    'delete p2 2 5 3 3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:02:33',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray VERDE\',8,5,1,\'6038 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:02:53',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray ROJO\',8,5,1,\'RAL 3024 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:03:11',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray BLANCO\',8,5,1,\'RAL 9016 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:03:25',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray AMARILLO\',8,5,1,\'RAL 1023 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:03:40',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Pintura Spray NEGRO\',8,5,1,\'RAL 9017 400ml\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:03:51',
    '',
    'Item añadido',
    'insert into inventario values(NULL,\'Disolvente\',5,5,1,\'\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-07 15:20:43', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:20:51',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=26285 AND fecha=\'2019-01-11\' AND mantenimiento=\'eSTOY CON GORRIZ\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-07 15:44:48', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-07 15:45:32', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:45:42',
    'marcos',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2019-06-05\' AND mantenimiento=\'sfg\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:45:49',
    'marcos',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2019-06-07\',\'sdd\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-07 15:45:54',
    'marcos',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2019-06-07\' AND mantenimiento=\'sdd\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-07 15:45:58', 'marcos', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-07 15:52:09', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-07 15:58:54', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-07 16:03:35', 'marcos', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-07 16:07:36', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-10 13:19:35', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-10 14:44:10', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-10 15:05:51', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-10 15:09:30', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-10 15:16:06',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Canet de Berenguer&quot;, num_local=1,localizacion=&quot;Extremo dique de Levante&quot;,latitud=&quot;39º 40.337\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 10:09:21', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 10:10:53', 'pepe', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 10:15:42', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 11:02:38', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-11 11:04:20',
    'pepe',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;E-0198&quot;, tipo=&quot;Faro&quot;,apariencia=&quot;GpD(3)&quot;,periodo=20.00,caracteristica=&quot;L'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-11 11:05:25',
    'pepe',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Gandia&quot;, num_local=1,localizacion=&quot;Extremo del cabo de Cullera&quot;,latitud=&quot;39º 11.188´N&quot;,l'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-11 11:05:53',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=14, elevacion=28,alcanceNom=19.00,alcanceLum=0,linterna=&quot;1&quot;,candelasCalc=0, candelasInst=0 where nif=25650'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-11 11:06:17',
    'pepe',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Gandia&quot;, num_local=0,localizacion=&quot;Extremo del cabo de Cullera&quot;,latitud=&quot;39º 11.188´N&quot;,l'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-11 11:08:24',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26190,\'2019-04-21\',\'Varada en playa norte Port Saplaya debido a fuerte temporal (Baja)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-11 11:08:32',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=26190 AND fecha=\'2019-04-21\' AND mantenimiento=\'Varada en playa norte Port Saplaya debido a fuerte temporal\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-11 11:10:04',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=4, elevacion=4,alcanceNom=3.00,alcanceLum=2.3,linterna=&quot;MCL140&quot;,candelasCalc=10.1, candelasInst=0.00 where nif=261'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 12:38:27', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-11 12:56:42',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-11\',\'07:56\',\'12:56\',\'asdd\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 14:12:46', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 14:22:27', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 14:22:34', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 14:43:14', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-11 14:43:26', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-11 14:44:35',
    'adrian',
    'Uso coche borrado',
    'delete from cochecito where usuario=\'adrian\' AND fecha=\'2019-06-11\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-12 16:12:59', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-12 16:13:40',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-12\',\'08:13\',\'\',\'Revision balizamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-12 16:14:24',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-11\',\'08:14\',\'14:15\',\'Deplazamiento a Cullera\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-12 16:14:30',
    'adrian',
    'Uso coche borrado',
    'delete from cochecito where usuario=\'adrian\' AND fecha=\'0000-00-00\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-13 10:00:16', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 10:00:36',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-13\',\'06:00\',\'dfgdg\',\'06:00\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-13 10:35:46', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:14:17',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'\', horaE=\'08:14\',horaS=\'horaSout\',motivo=\'prueba\' where usuario=\'adrian\' AND fecha=\'2019-06-13\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:15:08',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'2019-09-13\', horaE=\'08:14\',horaS=\'09:14\',motivo=\'pruebecita\' where usuario=\'adrian\' AND fecha=\'0000-00-00\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:19:15',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'\', horaE=\'\',horaS=\'\',motivo=\'\' where usuario=\'adrian\' AND fecha=\'2019-06-12\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:20:55',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'2019-06-03\', horaE=\'08:00\',horaS=\'12:45\',motivo=\'Revision Balizamiento\' where usuario=\'adrian\' AND fecha=\'2019-09-13\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:21:29',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'2019-06-04\', horaE=\'08:21\',horaS=\'14:21\',motivo=\'Desplazamiento al Faro de Cullera\' where usuario=\'adrian\' AND fecha=\'2019'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:22:19',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'2019-06-06\', horaE=\'08:15\',horaS=\'12:21\',motivo=\'Revision Balizamiento\' where usuario=\'adrian\' AND fecha=\'0000-00-00\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:22:47',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-07\',\'08:07\',\'14:22\',\'Revision Balizamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:23:07',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-10\',\'08:20\',\'14:30\',\'Revision Balizamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:23:32',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-11\',\'08:15\',\'14:25\',\'Desplazamiento al Faro de Cullera\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 12:23:59',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-06-12\',\'08:15\',\'13:30\',\'Revision Boyas Valencia\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-13 12:56:30', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-13 13:04:37', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-06-13 14:25:08', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 14:25:22',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=25554 AND observaciones=\'Pendiente de sacar con Wartsila, para revisar\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 14:26:31',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25554,\'2019-05-17\',\'Se recoloca la boya original en su sitio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-06-13 14:27:18',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-06-12\',\'Se realiza supervision del sistema AIS bajo petición del CCI.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-07-19 10:01:35', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-07-19 10:02:33',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-07-16\',\'07:20\',\'14:02\',\'Desplazamiento al Faro de Cullera\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-07-19 10:19:36', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-07-19 10:21:57',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25820,\'2019-07-08\',\'Se sustituye la batería y se repone el fusible de 16A de salida de la fuente.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-07-19 10:55:23',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-07-19\',\'08:54\',\'10:00\',\'Prestado a Marcos (lavadero)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-07-19 11:18:21',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2019-07-12\',\'MSM instala dos convertidores 12 - 24 V. Se comprueba su funcionamiento y se da de alta.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-07-19 11:18:44',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2019-07-03\',\'MSM sustituye y repara tarjetas SB03. Sigue de baja.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-07-19 11:19:03',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2019-06-28\',\'Avería en la rotación. Se da de baja. Funciona con la B.E.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-07-29 15:22:41', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-07-31 11:22:27', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-08-01 12:31:45', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-01 12:32:40',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'\',\'11:31\',\'15:40\',\'Revision Balizamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-01 12:32:53',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'\', horaE=\'\',horaS=\'\',motivo=\'\' where usuario=\'adrian\' AND fecha=\'0000-00-00\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-01 12:33:48',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2019-07-31\',\'11:33\',\'15:40\',\'Revision Balizamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-01 12:34:55',
    'adrian',
    'Uso coche modificado',
    'update cochecito set fecha=\'2019-08-01\', horaE=\'11:34\',horaS=\'14:30\',motivo=\'Revision Balizamiento\' where usuario=\'adrian\' AND fecha=\'0000-00-00\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-08-06 12:14:34', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-06 12:15:04',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-08-06\',\'La bateria del sistema de comunicacion de emisoras ha explotado. Se avisa a comunicaciones.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-08-20 10:41:19', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-20 10:41:31',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-08-20\',\'\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-20 10:41:55',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-08-20\',\'Se instala verja como refuerzo antivandalico en ventanas exteriores del lado mar.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-20 10:42:03',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25650 AND fecha=\'2019-08-20\' AND mantenimiento=\'\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-08-20 15:15:36', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-08-26 09:35:26', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-08-26 10:38:13', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-08-27 14:41:12', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-27 14:41:38',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-08-27\',\'El grupo electrogeno no entra en funcionamiento. Se sospecha de la bateria, y se pone a cargar pa'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-27 14:42:06',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25650,\'La bateria del sistema de comunicacion radio de emisores está funcionando sin bateria, pues explotó.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-27 14:42:15',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=25650 AND observaciones=\'La bateria del sistema de comunicacion radio de emisores está funcionando sin bateria, pu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-27 14:42:32',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25650,\'El sistema de comunicacion radio de emisoras está funcionando sin bateria, pues ésta explotó.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-27 14:43:07',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25650,\'Escasa presion en la instalación de fontaneria.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-27 14:43:39',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25650,\'Muros tanto interior como exterior en condiciones pauperrimas.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-27 14:44:44',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-06-20\',\'El sistema AIS tiene un fallo en el cable de alimentacion. Está desconectado. A la espera de reci'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-08-28 15:18:51', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-08-28 15:19:25',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-08-28\',\'Se sustituye la bateria del grupo electrógeno por una nueva. VARTA 720A 90Ah\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-02 12:07:30', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-02 12:08:03',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25740,\'2019-08-22\',\'Se sustituye la antigua linterna BDL120 por la nueva MCL330. Además se refuerza el fondeo.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-02 12:12:11',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25740,\'2019-08-22\',\'Tambien se le sustituye el flotador por uno de mayores dimensiones.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-02 12:12:38',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=4, elevacion=4,alcanceNom=5.00,alcanceLum=0,linterna=&quot;MCL330&quot;,candelasCalc=0.00, candelasInst=0 where nif=25740'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-02 12:17:06',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=4, elevacion=4,alcanceNom=3.00,alcanceLum=0,linterna=&quot;BDL 120 una corona HI (DES33).&quot;,candelasCalc=0.00, candelasI'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-02 12:30:09', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-02 13:53:51', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-02 14:55:51', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-04 13:40:33', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-05 09:41:19', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-05 09:45:08',
    'pepe',
    'Observacion añadida',
    'insert into observaciones values(25765,\'2019-08-09 Se sustituye el flotador por degradación.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-05 09:47:29',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25765,\'2019-08-14\',\'Se sustituye el flotador por degradación del original.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-05 09:49:15',
    'pepe',
    'Observacion añadida',
    'insert into observaciones values(25765,\'\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-05 10:36:55', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-05 10:37:26',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=4, elevacion=4,alcanceNom=5.00,alcanceLum=0.00,linterna=&quot;MCL330&quot;,candelasCalc=0.00, candelasInst=230 where nif=257'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-05 10:42:05',
    'pepe',
    'Observacion borrada',
    'delete from observaciones where nif=25765 AND observaciones=\'\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-05 10:42:15',
    'pepe',
    'Observacion borrada',
    'delete from observaciones where nif=25765 AND observaciones=\'2019-08-09 Se sustituye el flotador por degradación.\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-05 10:43:31',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=4, elevacion=4,alcanceNom=5.00,alcanceLum=0.00,linterna=&quot;MCL330&quot;,candelasCalc=191.67, candelasInst=230.00 where ni'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-09 11:22:29', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-09 11:22:40',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25590,\'Necesita ser pintada\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-09 11:22:48',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=25590 AND observaciones=\'Necesita ser pintada\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-09 11:27:45',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25590,\'Necesita ser pintada, por presencia de grafitti que dificulta la identificación de la señal.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-09 15:29:11', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-09 15:29:34',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=2, elevacion=3,alcanceNom=1.00,alcanceLum=0,linterna=&quot;MBL 160 (MSM) S/N:224 Año 2015&quot;,candelasCalc=0.00, candelasI'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-09 15:30:22',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25565,\'El marco de la placa fotovoltaica mide 124x34 cm\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-09 15:30:52',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;E-0196.32&quot;, tipo=&quot;Baliza Estribor Linterna sobre pilote.&quot;,apariencia=&quot;Gp D (4 )  V'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-09 15:31:18',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;&quot;, tipo=&quot;Baliza amarilla Linterna sobre pilote.&quot;,apariencia=&quot;D Amarillos 3s.&quot;'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-09 15:32:19',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25570,\'Panel Fotovoltaico de 53x64cm (Agujeros a 48x30cm)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-12 11:49:51', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-16 16:25:11', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-16 16:25:52',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26048.1,\'2019-09-16\',\'Se sustituye la batería y la óptica por degradación y filtraciones\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-17 09:55:20', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-17 09:55:43',
    'pepe',
    'Observacion añadida',
    'insert into observaciones values(26471,\'Suprimida definitivamente. Septiembre 2019\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-17 09:56:02',
    'pepe',
    'Observacion añadida',
    'insert into observaciones values(26470,\'Suprimida definitivamente. Septiembre 2019\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-17 09:56:25',
    'pepe',
    'Observacion añadida',
    'insert into observaciones values(26472,\'Suprimida definitivamente. Septiembre 2019\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-09-17 09:56:53',
    'pepe',
    'Observacion añadida',
    'insert into observaciones values(26473,\'Suprimida definitivamente. Septiembre 2019\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-18 10:56:38', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-18 10:56:46', 'pepe', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-18 11:16:54', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-09-19 11:16:40', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-01 10:29:30', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-04 09:55:52', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-04 09:56:07', 'marcos', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-10 11:28:54', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-10 11:29:24',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25650,\'Alicatado del cuarto de baño de la oficina deteriorado. Han saltado cuatro azulejos.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-10 11:31:57',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-10-08\',\'Visita Concejales del ayuntamiento de Cullera.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-14 11:03:04', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-14 11:04:04',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25545,\'2019-10-11\',\'Se tuvo que resetear MOSCAD ya que se quedó encendida permanentemente.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-15 14:01:26', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-17 09:30:37', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-17 09:30:43',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25640,\'Dada de baja del sistema de balizamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-17 16:31:30', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-17 16:31:40',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25460,\'Estructura de poliester\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-17 16:40:55',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25470,\'Corona formada a base de (led con optica)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-17 16:41:11',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25470,\'Recomendable pintar se cara a la proxima inspeccion\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-17 16:42:42',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;E-0197.2&quot;, tipo=&quot;Baliza Torre cilíndrica roja sobre base roja&quot;,apariencia=&quot;GpD(4)R'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-17 16:42:50',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=7, elevacion=10,alcanceNom=3.00,alcanceLum=0,linterna=&quot;BDL 120 LMV DES 22&quot;,candelasCalc=0.00, candelasInst=0 where'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-23 13:20:34', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-23 13:21:21',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-10-23\',\'Se instalan las nuevas puertas de Almacen y tercera vivienda, a cargo de la empresa Nuñez-Armando'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-29 09:33:24', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-29 09:34:00',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26048.1,\'2019-10-25\',\'Se repinta toda la torre.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-10-29 09:34:53',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26048,\'2019-10-25\',\'Se repinta toda la torre.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-10-30 15:09:32', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-11-13 09:53:51', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-11-13 09:54:41',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-11-12\',\'Se repara fallo de foto-célula interior (lámparas). Conector flojo, provocaba apagado del faro.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-11-20 08:16:52', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-11-20 08:20:14',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2019-11-19\',\'Se ajusta a la baja la sensibilidad de la foto-célula de encendido (encendía y apagaba continuame'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-11-20 09:16:58', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-11-20 09:18:12',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2019-11-19\',\'Se sustituye la LDR interna por una nueva.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-12-02 09:24:07', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-02 09:25:19',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25545,\'2019-11-27\',\'Se repinta toda la torre.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-02 09:26:05',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25552,\'2019-11-26\',\'Se repinta toda la torre.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-02 09:26:47',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25565,\'2019-11-26\',\'Se repinta toda la torre.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-02 09:35:46',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25565,\'2019-11-28\',\'Se repinta toda la torre.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-02 09:37:20',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25564,\'2019-11-27\',\'Se repinta todo el soporte.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-02 09:38:29',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25563,\'2019-11-27\',\'Se repinta todo el soporte.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-02 09:41:16',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2019-11-26\',\'Avería en la rotación.  Funciona con la B.E.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-02 09:42:36',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2019-11-27\',\'Se fuerza el encendido con motor dos y queda en funcionamiento.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-02 09:51:27',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2019-11-28\',\'VARESER comienza las obras para instalar agua potable en el faro.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-12-10 09:28:16', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-10 09:29:04',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25830,\'2019-12-09\',\'Se repinta toda la torre.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-10 09:29:56',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25831,\'2019-12-09\',\'Se repinta todo el soporte.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-12-13 11:36:03', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-13 11:36:40',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26326,\'2019-12-12\',\'Se repinta todo el soporte.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-12-27 09:45:26', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-12-27 09:47:16', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-27 09:48:03',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26360,\'2019-12-23\',\'Se dió de baja por la noche.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2019-12-27 09:48:59',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26360,\'2019-12-26\',\'Se sustituye una bateria ???\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-12-30 14:38:25', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-12-30 16:32:38', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-12-30 18:47:33', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2019-12-31 09:45:22', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-01-03 10:19:52', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-01-10 13:39:28', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-01-10 13:40:33',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26048,\'2020-01-10\',\'Se instala un panel solar por la perdida del anterior.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-01-24 09:07:37', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-01-24 09:09:10',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26450,\'2020-01-21\',\'Se apaga por el fuerte temporal y se da de baja.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-01-24 14:49:24', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-01-24 14:52:07',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25730,\'2020-01-22\',\'Queda a la deriva y se localiza en la playa (Pinedo) sin paneles, ni linterna, ni baterías.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-01-24 14:53:45',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25730,\'2020-01-24\',\'Se retira de la playa para su reparación y se deposita en la campa de la Dársena de Servicios.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-01-30 07:58:23', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-02-04 15:06:58', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-02-04 15:08:44',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26450,\'2020-02-04\',\'Se instala baliza nueva MCL 200 y se da de alta.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-02-04 15:10:45',
    'pepe',
    'Observacion añadida',
    'insert into observaciones values(26450,\'Se modifica la característica a GpRp (3) 5s. Se comunica a PP EE y al Hidrográfico\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-02-05 09:41:21', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-02-05 10:15:39', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-02-13 15:12:40', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-02-13 15:14:27', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-02-13 15:17:26', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-02-13 15:17:30', 'pepe', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-08 16:23:20', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-08 16:23:46',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-07-06\',\'Pintores Nuñez inician trabajos de impermeabilizar terrazas y pintar fachada principal.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-08 16:25:33',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2020-07-08\',\'09:00\',\'14:00\',\'Revision Balizamiento Valeancia\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-09 10:04:43', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:05:25',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26285,\'2020-04-20\',\'Se repinta toda la torre.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:05:47',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=26285 AND observaciones=\' SE REPINTARÁ EN 2019\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:06:42',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26285,\'2011-10-21\',\'Sustitución de la fotocélula y la tarjeta destelladora del litepipe derecho.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:07:57',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26290,\'2020-04-20\',\'Se repinta la torre y vallado.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:10:35',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26320,\'2020-02-27\',\'Se sustituye por la mobilis para su reparación y mantenimiento.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:11:14',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26325,\'2019-02-18\',\'Se sustituye LDR por avería.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:12:14',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26325,\'2018-12-07\',\'Se repinta la torre de la baliza.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:13:08',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26326,\'2012-04-17\',\'Sustitución de la óptica.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:14:58',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26360,\'2019-02-27\',\'Se repone la boya en su posición con el telecontrol desconectado.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:15:34',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26360,\'2019-12-24\',\'CCE comunica que esta apagada. Se da de baja.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:16:05',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26360,\'2019-12-26\',\'Se sustituye una batería y se da de alta.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:16:16',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=26360 AND fecha=\'2019-12-26\' AND mantenimiento=\'Se sustituye una bateria ???\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:16:36',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26360,\'2020-04-28\',\'Se le reduce el alcance a 1mn.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:16:51',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=26326 AND fecha=\'2012-04-17\' AND mantenimiento=\'Sustitución de la óptica.\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:17:59',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26380,\'2020-04-28\',\'Se modifica pasando a ser una Marca lateral de bifurcación (Se repinta).\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:19:51',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26390,\'2020-04-27\',\'Se repinta la torre y el contorno blanco.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:20:30',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26392,\'2019-02-18\',\'Se rearma diferencial de acometida.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:26:00',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26375,\'2020-04-28\',\'Entra en servicio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:27:07',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;E-0214&quot;, tipo=&quot;Baliza TPS 3.3&quot;,apariencia=&quot;GpD(4)R&quot;,periodo=14.5,caracteristi'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:27:52',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26380,\'2020-04-28\',\'Se modifica pasando a ser una Marca lateral de bifurcación. Se repinta del color correspondiente '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:28:01',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=26380 AND fecha=\'2020-04-28\' AND mantenimiento=\'Se modifica pasando a ser una Marca lateral de bifurcación (Se rep'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:33:03',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=6, elevacion=12,alcanceNom=5.00,alcanceLum=0,linterna=&quot;MCL200 / DES-33&quot;,candelasCalc=0.00, candelasInst=0 where ni'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:33:13',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=6, elevacion=12,alcanceNom=5.00,alcanceLum=0.00,linterna=&quot;MCL200 autonoma / DES-33&quot;,candelasCalc=0.00, candelasIns'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:40:43',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=2, elevacion=2,alcanceNom=3.00,alcanceLum=0,linterna=&quot;MCL-140  SN 295  (Autoalimentada)&quot;,candelasCalc=0.00, candel'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:43:10',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25555,\'2019-06-25\',\'Se sustituye la batería por avería.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:45:56',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25530,\'2020-02-26\',\'Se reinicia MOSCAD reestableciendose comunicaciones con el SCADA.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:46:13',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25545,\'2020-04-03\',\'Se reinicia MOSCAD reestableciendose comunicaciones con el SCADA.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:47:02',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=3, elevacion=2,alcanceNom=1.00,alcanceLum=0,linterna=&quot;Des 33 Maq. Val.Bola de leds de 50 W ÓpticaFresnel 300mm&quot;,ca'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:47:11',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=7, elevacion=15,alcanceNom=7.00,alcanceLum=0,linterna=&quot;DES 33 MaqVal. Bola leds 50 w Óptica300 mm&quot;,candelasCalc=0.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:47:21',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=4, elevacion=6,alcanceNom=3.00,alcanceLum=0,linterna=&quot;DES 22 Maq. Val.  8 coronas de leds  Óptica BDL 120&quot;,candela'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:47:46',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=2, elevacion=2,alcanceNom=1.00,alcanceLum=0,linterna=&quot;MCL 160 (MSM)&quot;,candelasCalc=0.00, candelasInst=0 where nif=2'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:48:14',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25554,\'2019-05-17\',\'Se recoloca la boya original en su sitio, repintada.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:48:25',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25554 AND fecha=\'2019-05-17\' AND mantenimiento=\'Se recoloca la boya original en su sitio.\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:48:57',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=2, elevacion=4,alcanceNom=1.00,alcanceLum=0,linterna=&quot;DES 22 Maq. Val.  4 coronas de leds  Óptica BDL 120&quot;,candela'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:54:36',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25560,\'2020-02-14\',\'Aparece con grafities, limpiando y parcheando a spray para obtener un color homogeneo.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:54:57',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=2, elevacion=4,alcanceNom=1.00,alcanceLum=0,linterna=&quot;DES 22 LMV   4 coronas de leds  Óptica BDL 120&quot;,candelasCalc'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 10:56:42',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25563,\'2020-06-04\',\'Pantalan acordonado por policia portuaria, y pivote de la baliza doblado.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 11:02:42',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=3, elevacion=5,alcanceNom=1.00,alcanceLum=0,linterna=&quot;DES 22 LMV     2 discos de leds    Óptica BDL 120&quot;,candelasC'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-09 13:22:57', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 13:24:24',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2020-07-09\',\'11:00\',\'13:00\',\'Desplazamiento oficinas\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-09 13:40:03', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-09 13:46:22',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25730,\'2020-02-17\',\'Se fondea la boya de sustitución sin tele-control.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-10 10:46:37', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:47:03',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-05-07\',\'Mecanicos cambian las bisagras de la puerta de acceso peatonal.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:47:47',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-04-30\',\'Se reinicia el SAI del faro, reestableciendose las comunicaciones de dicho elemento.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:49:46',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-03-12\',\'Se inician las obras de conservacion y mantenimiento del faro.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:51:16',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-03-27\',\'Se tiende una nueva linea desde la camara de servicio del faro hasta el cuadro general de electri'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:52:41',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-02-25\',\'Mecanicos instalan nueva pieza anti-retorno y reductor de caudal de agua.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:54:22',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-03-11\',\'Kgest toma muestras de calidad de ambiente interior de las instalaciones del faro.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:54:51',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-01-30\',\'Guipons hace la revisión de extintores.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:56:11',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25650,\'Grupo electrógeno aterpillar 13.5 KVA\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:56:29',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=25650 AND observaciones=\'Muros tanto interior como exterior en condiciones pauperrimas.\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:57:25',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-10-23\',\'Guipons hace la revisión del material contra incendios.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:58:49',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-09-30\',\'Visita del responsable de Gestión Documental. Se acuerda llevar los documentos historicos a la bi'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 10:59:59',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-08-06\',\'Explota la batería del sistema de comunicaciones de las emisoras ubicada en la camara de servicio'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:01:02',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-08-15\',\'Se sustituye la fuente de alimentación del sistema de comunicación de las emisoras.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:02:13',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-07-01\',\'Guipons hace la revisión de los extintores. Kgest hace la recogida de muestras en agua potable.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:02:44',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-10-23\',\'Guipons hace la revisión del material contra incendios.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:02:51',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25650 AND fecha=\'2020-10-23\' AND mantenimiento=\'Guipons hace la revisión del material contra incendios.\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:03:49',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-06-09\',\'No se puede acceder remotamente al PC del AIS. Se resetea y se reestablecen las comunicaciones.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:04:56',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-06-03\',\'Soler realiza la revisión de los sistemas de detección de incendios.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:08:20',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-02-05\',\'Se acude con persoanl de la climina para toma de muestras de calidad.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:08:58',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-02-05\',\'Se acude con personal de la clinica y subcontrata para toma de muestras de calidad.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:09:20',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25650 AND fecha=\'2020-02-05\' AND mantenimiento=\'Se acude con persoanl de la climina para toma de muestras de calid'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:10:57',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-09-20\',\'KGEST realiza la toma de muestras de calidad del aire interior (CAI).\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:11:45',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-09-12\',\'Se procede a la sustitución del cable de alimentación del ELMAN ABT 1103, pues el conector se enc'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:13:05',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-07-09\',\'Se reactiva el funcionamiento tanto de la camara de la sala de máquinas como de la camara de la l'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:13:42',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-07-17\',\'Guipons realiza la revisión de extintores.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:15:28',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-05-21\',\'Se resuelve a traves del SAUSI avería en el ordenador de la oficina del faro. Se le sustituyó la '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:17:09',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-04-23\',\'SOLER realiza la revisión del sistema de detección de incendios.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:19:01',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2019-05-21\',\'Personal de la clínica acuden junto con el técnico de sonido para la medición de ruidos.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:19:44',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25650 AND fecha=\'2019-05-21\' AND mantenimiento=\'Visita del técnico de sonido\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:21:25',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-04-16\',\'Se retoman las obras en el faro por parte de PAVASAL.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:22:12',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-04-21\',\'Se rearma el magnetotermico de la bomba del pozo, la hizo saltar los servicios conectados en el a'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:23:53',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-06-03\',\'PAVASAL finaliza las obras de restauración en el faro.(Pozo incluido)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:25:10',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-07-07\',\'Se retira un trozo de unos 3KG de la cornisa de la terraza superior del faro (linterna) por riesg'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:26:10',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=10, elevacion=20,alcanceNom=20.00,alcanceLum=0,linterna=&quot;2&quot;,candelasCalc=2.00, candelasInst=0 where nif=25700'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:26:23',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=4, elevacion=6,alcanceNom=1.00,alcanceLum=0,linterna=&quot;BDL 120 cuatro coronas.&quot;,candelasCalc=0.00, candelasInst=0 w'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:26:36',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=3, elevacion=5,alcanceNom=1.00,alcanceLum=0,linterna=&quot;BDL 120 ocho coronas.&quot;,candelasCalc=0.00, candelasInst=0 whe'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-10 11:26:37',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=3, elevacion=5,alcanceNom=1.00,alcanceLum=0,linterna=&quot;BDL 120 ocho coronas.&quot;,candelasCalc=0.00, candelasInst=0 whe'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-13 09:41:43', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 09:42:55',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-10-27\',\'•\tDurante todo el mes de enero, se suceden averías por fallos de rotación en los dos motores, pid'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 09:44:32',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 09:55:32',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-13 09:56:30', 'pepe', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-13 09:56:37', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 09:58:28',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 10:01:18',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-13 10:31:33', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 10:31:56',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-01-27\',\'Durante todo el mes de enero, se suceden averías por fallos de rotación en los dos motores, pido '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 10:32:08',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 10:32:33',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-07-13\',\'prueba\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 10:32:50',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-07-13\' AND mantenimiento=\'prueba\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 10:42:07',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 10:42:15',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-01-27\' AND mantenimiento=\'Durante todo el mes de enero, se suceden averías por fallos de rot'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 11:02:54',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2020-07-06\',\'08:02\',\'13:02\',\'Desplazamiento Faro cullera\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 11:03:20',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2020-07-07\',\'08:03\',\'14:03\',\'Desplazamiento Faro cullera\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-13 13:55:22', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 13:55:29',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 13:56:14',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-01-27\',\'Durante todo el mes de enero, se suceden averías por fallos de rotación en los dos motores, pido '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 13:56:33',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-01-27\' AND mantenimiento=\'Durante todo el mes de enero, se suceden averías por fallos de rot'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 13:56:38',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 13:59:55',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-07-14\',\'3\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-13 14:00:02',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-07-14\' AND mantenimiento=\'3\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-13 16:19:23', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-14 13:29:32', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-14 13:30:09',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-07-13\',\'Nuñez acaba con los trabajos de pintura. Se impermeabilizan las dos terrazas y se pinta la fachad'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-14 13:30:46',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-07-14\',\'Se rearma el diferencial que protege la linea del repetidor de las señales maritimas de Gandia.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-14 16:12:42', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-14 16:13:16', 'pepe', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-14 16:13:24', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-14 16:14:46',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-07-14\',\'Se repinta todo el soporte.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-14 16:17:09',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-07-14\' AND mantenimiento=\'Se repinta todo el soporte.\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-14 16:17:27',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-15 10:41:14', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-15 10:47:32',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26048.2,\'2020-07-07\',\'Se saca a tierra por mantenimiento. Se sustituyen baterías, regulador, LDRs y se repinta añadie'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-15 10:48:30',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26048.2,\'2020-07-15\',\'Se fondea en su ubicación y se da de alta.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-15 14:18:14', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-15 14:26:29',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-21 12:51:16', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-21 13:01:18', 'Raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-21 13:54:35', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-21 13:54:42', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-23 10:15:40', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-23 10:18:12',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-23 15:46:02', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-23 15:46:19',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2020-07-23\',\'Se sustituye la lámpara 1 en la baliza principal.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-27 13:06:11', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-27 13:07:21',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26190,\'2020-06-12\',\'Tras mantenimiento, se fondea de nuevo en su ubicación.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-27 13:07:58',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25768,\'2020-07-23\',\'Se realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-27 13:08:16',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25820.1,\'2020-07-23\',\'Se realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-28 12:51:42', 'Raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-28 14:01:11', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-30 10:39:16', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-07-30 13:53:19', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-30 13:53:27',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25700 AND fecha=\'2020-10-27\' AND mantenimiento=\'•Durante todo el mes de enero, se suceden averías por fallos de ro'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-30 13:56:58',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;FCanet&quot;, tipo=&quot;Faro&quot;,apariencia=&quot;GpD(2)&quot;,periodo=10.00,caracteristica=&quot;L'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-30 13:57:11',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=10, elevacion=20,alcanceNom=20.00,alcanceLum=0,linterna=&quot;0&quot;,candelasCalc=0.00, candelasInst=0 where nif=26500'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-07-30 13:58:06',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=14, elevacion=28,alcanceNom=19.00,alcanceLum=0.00,linterna=&quot;Lampara 400w&quot;,candelasCalc=0.00, candelasInst=0.00 whe'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-08-11 13:45:31', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-11 13:46:18',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25776,\'2020-08-05\',\'Se cambiaron las dos LDR\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-11 13:47:05',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25920,\'2020-08-06\',\'Fallo rectificador. Se resetea y desaparece el aviso.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-11 13:48:08',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;E-0194&quot;, tipo=&quot;Baliza bocana Torre de hormigón verde&quot;,apariencia=&quot;DV  5s&quot;,per'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-11 13:48:26',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;E-0193&quot;, tipo=&quot;Baliza bocana Torre de hormigón&quot;,apariencia=&quot;DR 5s&quot;,periodo=5.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-11 13:48:55',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(25545,\'Medio Litepipe se queda encendido\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-08-14 10:27:36', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-14 10:28:03',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25940,\'2020-08-14\',\'Se sustituye la LDR 2 (derecha)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-14 10:31:31',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-08-11\',\'Se sustituyen las lamparas del alumbrado exterior.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-14 10:31:55',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-08-13\',\'Se revisa el SAI, que entra en by-pass interno.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-08-19 12:04:54', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-19 12:06:09',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=25650 AND observaciones=\'Escasa presion en la instalación de fontaneria.\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-08-20 13:15:34', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-08-26 10:02:42', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-26 10:03:07',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25920,\'2020-08-25\',\'Se sustituye la bateria por una nueva.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-08-26 16:43:29', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-08-26 16:44:34', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-26 16:44:55',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25920,\'2020-08-26\',\'Se sustituye el rectificador, pero sigue dando fallo rectificador.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-08-31 15:46:44', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-08-31 15:47:37',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25920,\'2020-08-31\',\'Tras tres intentos se coloca un rectificador diferente y parece que se resuelve la alarma del SCA'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-09-14 16:17:07', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-09-14 16:17:22',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;E-0201.5&quot;, tipo=&quot;Baliza TPS 4.8&quot;,apariencia=&quot;GpD(3)V&quot;,periodo=9.00,caracteris'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-09-17 16:03:53', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-09-21 10:23:42', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-09-21 10:24:57',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=6, elevacion=8,alcanceNom=1.00,alcanceLum=1,linterna=&quot;BDL 120 ocho coronas.&quot;,candelasCalc=0.00, candelasInst=137 w'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-09-21 10:25:58',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25830,\'2020-09-13\',\'Destruida por accidente de grúa (Se da de baja).\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-09-21 10:27:58',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=6, elevacion=8,alcanceNom=1.00,alcanceLum=1.00,linterna=&quot;BDL 120 ocho coronas.&quot;,candelasCalc=214, candelasInst=0 w'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-09-21 10:31:34',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=6, elevacion=8,alcanceNom=1.00,alcanceLum=1.00,linterna=&quot;BDL 120 ocho coronas.&quot;,candelasCalc=0, candelasInst=214 w'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-09-21 10:32:33',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=2, elevacion=5,alcanceNom=1.00,alcanceLum=1,linterna=&quot;BDL HI dos coronas.&quot;,candelasCalc=178, candelasInst=178 wher'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-09-25 12:59:06', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-09-25 13:00:06', 'pepe', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-09-25 13:01:48', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-09-25 13:03:18',
    'pepe',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;&quot;, tipo=&quot;Boya Castillete verde y marca de tope&quot;,apariencia=&quot;GpD (2)V&quot;,periodo'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-09-25 13:04:47',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25820.1,\'2020-09-25\',\'Detectado fallo en la cadena de la durmiente, pendiente de sustitución.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-09-25 15:51:21', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-09-25 15:51:41',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-09-22\',\'Visita Carlos Kgest para medicion ambiental.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-10-05 12:09:38', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-05 12:10:23',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26046,\'2020-10-02\',\'Se sustituye la fotocélula por avería.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-10-08 09:30:19', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-08 09:33:14',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25830,\'2020-10-07\',\'Instalamos un espeque provisional con baliza autónoma MCL140\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-10-13 10:24:08', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-13 10:24:40',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2020-10-08\',\'08:00\',\'15:00\',\'Puerto Gandia y  CN Oliva\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-13 10:25:05',
    'adrian',
    'Uso coche añadido',
    'insert into cochecito values(\'adrian\',\'2020-10-13\',\'08:30\',\'14:30\',\'Faro Cullera\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-10-22 16:24:46', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-22 16:26:01',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25554,\'2020-10-05\',\'Se montan nuevos ánodos de sacrificio\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-22 16:28:01',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25820.1,\'2020-10-22\',\'Se repone tramo de cadena desgastada.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-10-27 08:17:40', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-27 08:19:10',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25761,\'2020-10-23\',\'Reponemos ánodos de sacrificio por desgaste.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-27 08:19:53',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25841,\'2020-10-23\',\'Reponemos ánodos de sacrificio por desgaste.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-27 08:20:41',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25842.5,\'2020-10-22\',\'Reponemos ánodos de sacrificio por desgaste.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-10-27 08:21:22',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25843.8,\'2020-10-22\',\'Reponemos ánodos de sacrificio por desgaste.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-11-12 13:46:15', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 13:48:27',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-01-26\',\'Esteban Ruiz de Viñaspre deja oficialmente el faro por jubilación\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 13:49:55',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-01-29\',\'Revisión del grupo electrógeno por el taller de vehículos\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 13:51:39',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-02-07\',\'Estudio in situ, para instalar cámaras y alarmas de seguridad\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 13:53:07',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-02-09\',\'Visita de autoridades para estudiar la cesión al Ayuntamiento.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 13:55:15',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-02-12\',\'Plan de prevención y control de plagas (Labaqua)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 13:56:29',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-05-07\',\'Revisión de los extintores (Guipons)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 13:57:32',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-06-04\',\'Revisión y analisis de legionela.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 13:58:18',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-06-20\',\'Se sustituye lámpara uno.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 13:59:46',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-06-27\',\'Cambian el contador eléctrico (sigue a 230v.)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:00:51',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-07-12\',\'Se localiza y elimina un foco de mosquitos en el pozo ciego.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:02:16',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-07-19\',\'Después de una larga temporada sin aparecer, van los jardineros ha hacer mantenimiento.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:04:14',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-09-05\',\'tras varios cortes de red, localizamos la avería en el embornado del contador. Reparamos.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:05:24',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-09-14\',\'Revisión del pararrayos.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:06:07',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-10-19\',\'Revisión de los extintores (Guipons)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:07:33',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-11-13\',\'Fuga de agua en una cisterna de la vivienda que la inunda. Se repara.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:08:31',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2018-12-27\',\'Se instala una nueva central de intrusión por Santiago de AJP\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:13:04',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-01-30\',\'Durante todo el mes de enero, se suceden averías por fallos de rotación en los dos motores, pido '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:15:48',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-05-04\',\'Marc Martí y Oscar Aponte de la La empresa MESEMAR revisa la linterna y la programación del faro '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:16:49',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-05-22\',\'Los mismos técnicos de MESEMAR se personan en el faro para reparar los problemas detectados en la'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-12 14:17:49',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25700,\'2020-11-05\',\'Tras dos días de tormentas no hay más remedio que conectar el faro a la red 230v ca. La tensión d'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-11-18 08:56:39', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-18 08:58:52',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26392,\'2020-11-17\',\'Fallo en la acometida eléctrica. Se rearma el diferencial.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-11-26 12:31:59', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-26 12:33:13',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2020-11-24\',\'La empresa SICA regula el convertidor de las fotocélulas y propone su cambio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-11-30 08:54:50', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-11-30 08:57:18',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26048.1,\'2020-11-27\',\'Por fuerte tormenta se ve afectado todo el sistema de alimentación y se apaga (se da de baja).\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-12-09 12:56:03', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-09 12:59:17',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25830,\'2020-12-07\',\'Mesemar instala nueva torre y baliza MBL 160-2 sincronizada con la 25831.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-09 13:02:39',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=6, elevacion=8,alcanceNom=1.00,alcanceLum=1.00,linterna=&quot;MBL 160 - 2 niveles&quot;,candelasCalc=907, candelasInst=756 w'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-09 13:04:55',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25831,\'\',\'Mesemar instala nueva  baliza MCL 200 sincronizada con la 25830.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-09 13:06:03',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=2, elevacion=5,alcanceNom=1.00,alcanceLum=1.00,linterna=&quot;MCL200.&quot;,candelasCalc=360, candelasInst=300 where nif=258'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-09 13:07:36',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25831,\'2020-12-07\',\'Mesemar instala nueva  baliza MCL 200 sincronizada con la 25830.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-09 13:08:04',
    'pepe',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=25831 AND fecha=\'0000-00-00\' AND mantenimiento=\'Mesemar instala nueva  baliza MCL 200 sincronizada con la 25830.\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-09 13:12:50',
    'pepe',
    'Modificacion lampara',
    'UPDATE lampara set altura=3, elevacion=4,alcanceNom=1.00,alcanceLum=1.00,linterna=&quot;MCL 200&quot;,candelasCalc=283, candelasInst=236 where nif=263'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-12-10 12:37:49', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-12-10 12:44:12', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-12-10 12:46:41', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-12-14 14:27:25', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-14 14:28:34',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25840,\'2020-12-14\',\'Sustitución de las dos LDR por mal funcionamiento.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2020-12-28 12:10:12', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-28 12:11:40',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26047,\'2020-12-18\',\'Rotura de la linterna lineal y soporte de panel solar. Baterías para cambiar.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-28 12:17:53',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-12-15\',\'El grupo electrógeno  no arranca, posible fallo del cargador de batería.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2020-12-28 12:20:29',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-12-17\',\'Se instala de forma provisional un cargador externo y queda en funcionamiento. Aviso al T. Mecáni'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-01-05 08:54:57', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-05 08:58:11',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-12-31\',\'El faro está apagado por fallo de la LDR interna, la BAEM no funciona.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-05 08:59:55',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2020-12-31\',\'Tras la intervención del técnico de guardia se consigue activar de manera permanente la BAEM.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-05 09:02:28',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2021-01-04\',\'Adrián se persona en el faro para intentar dejar en funcionamiento en modo automático el mismo, n'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-05 09:04:51',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26360,\'2021-01-02\',\'Avisan de que la boya está apagada. Se da de baja a través de AtoN de PPEE.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-01-05 14:07:08', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-05 14:11:56',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26360,\'2021-01-05\',\'Reponemos baterías y se repasa instalación solar (cableado). Se da de alta.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-01-11 08:40:51', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-11 08:44:00',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2021-01-08\',\'Tras la intervención de SICA y con repuestos del antiguo faro de Valencia se consigue reparar la '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-01-11 08:50:17', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-01-11 12:53:01', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-11 12:54:36',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25820.1,\'2021-01-11\',\'Boya apagada. Se procede a su sustitución aunque no quedará sincronizada.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-11 12:56:24',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26390,\'2021-01-11\',\'La policia portuaria informa de que está apagada. Se procede a la sustitución de la batería.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-01-15 12:21:46', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-15 12:23:21',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25820.1,\'2021-01-15\',\'La boya se ha pintado y se le han sustituido las baterías y los ánodos de sacrificio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-01-31 10:20:05', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-31 10:21:24',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25820.1,\'2021-01-29\',\'Se fondea en su ubicación y se retira la sustituta.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-01-31 10:25:53',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2021-01-21\',\'SICA ING procede a la sustitución del convertidor de señal y ajusta la maniobra para poder conect'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-02-03 15:11:31', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-03 15:13:37',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2021-02-03\',\'Se sustituye la LDR a la BAEM. se contacta con Sica para rematar ajustes y sustituir sonda del de'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-02-12 14:10:41', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-12 14:11:46',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2021-02-12\',\'Sica reconfigura PLC para el correcto funcionamiento de la BAEM a traves de su propia LDR. Queda '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-02-19 14:43:35', 'pepe', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-19 14:46:36',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2021-02-19\',\'Se sustituye fuente de alimentación de la cámara de la linterna y vuelve a funcionar dicha cámara'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-19 14:48:43',
    'pepe',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(26500,\'2021-02-19\',\'Vareser repone vidrio facturado en la linterna, en el sector de oscuridad.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-02-23 09:22:23', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-23 09:22:41',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;&quot;, tipo=&quot;Boya De castillete amarilla y marca de tope X amarilla&quot;,apariencia=&quot;DA&qu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-23 09:22:49',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(26460,\'Sincronizada con el resto de boyas\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-23 09:23:18',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Costa Blanca&amp;quot;&quot;, num_local=1,localizacion=&quot;Boya SW&quot;,latitud=&qu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-23 09:23:37',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;46465&quot;, tipo=&quot;Boya De castillete amarilla y marca de tope X amarilla&quot;,apariencia=&quot;'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-23 09:23:57',
    'adrian',
    'Modificacion Caracte',
    'UPDATE balizamiento set num_internacional=&quot;&quot;, tipo=&quot;Boya De castillete amarilla y marca de tope X amarilla&quot;,apariencia=&quot;DA&qu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-23 09:27:18',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(26460,\'Nombre actual(2021): Bersolaz Spain - Sagunto\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-02-24 11:13:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-24 11:14:00',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=0, elevacion=0,alcanceNom=3.00,alcanceLum=0,linterna=&quot;Si&quot;,candelasCalc=0.00, candelasInst=0 where nif=26460'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-02-24 11:14:12',
    'adrian',
    'Modificacion lampara',
    'UPDATE lampara set altura=0, elevacion=0,alcanceNom=0,alcanceLum=0,linterna=&quot;0&quot;,candelasCalc=0, candelasInst=0 where nif=26460.1'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-03-04 14:46:48', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-03-04 14:47:29',
    'adrian',
    'Mantenimiendo añadid',
    'insert into mantenimiento values(25650,\'2021-03-02\',\'Se sustituyeron las pilas de la puerta de acceso. Pilas 3,6V del lado sensor barrera.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-04-16 16:17:45', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-04-16 16:19:21',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25530\',\'2021-04-14\',\'Se sustituye la batería por una de SONNENSCHEIN SB12 de100Ah.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-04-16 16:19:36',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-04-16 16:19:45',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25545\',\'2021-04-14\',\'Se sustituye la batería por una de SONNENSCHEIN SB12 de100Ah.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-04-16 16:20:28',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25545\',\'2021-03-26\',\'Se elimina cuadro en completo desuso.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-04-19 10:57:17', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-04-23 10:26:21', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-04-23 10:30:33',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25720\',\'Suministro desde el VCT42\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-04-23 10:30:52',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25721\',\'Suministro desde el VCT41\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-04-27 12:42:29', 'Raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-04-30 11:09:36', 'Raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-05-03 10:30:43', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-05-05 12:40:10', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-05-05 13:02:13', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-05 13:02:46',
    'raul',
    'Item añadido',
    'insert into inventario values(NULL,\'bn\',5,6,1,\'fghfh\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-05-11 14:33:15', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-11 14:36:07',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26320\',\'2021-04-27\',\'Se da de baja por apagados intermitentes. El 29 se le cambia LDR y anula el penúltimo panel por'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-05-12 13:46:12', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-05-20 09:57:43', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 09:57:54',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Port saplaya pontona&quot;, num_local=3,localizacion=&quot;Señaliza pontona hundida&quot;,latitud=&quot;39º 32.74'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:05:17',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:05:52',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25850\',\'2008-11-30\',\'Se instala la torre nueva mod TPS33\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:06:17',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25850\',\'2010-03-26\',\'Se instala el telecontrol\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:06:33',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25850\',\'2014-01-17\',\'Se repinta por DRAGADOS\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:06:55',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25850\',\'2017-03-08\',\'Pavasal cambia la acometida que pasa a tomar corriente del CT Nº1\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:07:10',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25850\',\'2017-08-13\',\'Se repinta toda la baliza\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:07:22',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25850\',\'2020-04-17\',\'Se repinta toda la torre\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:09:19',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Valencia.&quot;, num_local=6,localizacion=&quot;Canal, ángulo Norte del contradique.&quot;,latitud=&quo'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:11:11',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Valencia.&quot;, num_local=6,localizacion=&quot;Canal, ángulo Norte del contradique.&quot;,latitud=&quo'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:12:55',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Valencia&quot;, num_local=0,localizacion=&quot;0&quot;,latitud=&quot;0&quot;,longitud=&quot;00&quot; where nif=25'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:19:47',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;1&quot;, num_local=1,localizacion=&quot;RETIRADA&quot;,latitud=&quot;1&quot;,longitud=&quot;1&quot; where nif=258'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:26:49',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real JCI Valencia&quot;, num_local=0,localizacion=&quot;0&quot;,latitud=&quot;39º 27.677´N&quot;,longitud='
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:26:58',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real JCI Valencia&quot;, num_local=0,localizacion=&quot;Espigón - Extremo - Darsena Auxiliar&quot;,latitud'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:27:17',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:28:09',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real JCI Valencia&quot;, num_local=0,localizacion=&quot;Primera boya Marca Especial Dársena Exterior&quot;'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:28:24',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:30:11',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real Juan Carlos I Valencia&quot;, num_local=0,localizacion=&quot;0&quot;,latitud=&quot;0&quot;,longitud=&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:31:15',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real Juan Carlos I Valencia&quot;, num_local=43,localizacion=&quot;Dique - Extremo - Darsena Sur&quot;,lat'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-05-20 10:31:41',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real Juan Carlos I. Valencia.&quot;, num_local=44,localizacion=&quot;Espigón - Extremo - Darsena Auxiliar&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-06-07 09:43:19', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-06-07 10:02:51',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25650\',\'2021-06-03\',\'Se sustituye el SAI, a falta de configuración el proximo martes 8 de junio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-06-07 10:03:48',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25650\',\'2021-06-02\',\'Personal del taller de fluidos realizan trabajos en la acometida de agua, solventando un proble'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-06-07 13:38:51', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-06-07 13:39:44',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26500\',\'VISIBLE:336º-226º        OCULTACION:110º\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-06-07 13:43:06',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26500\',\'VISIBLE:336º-226º (250º)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-06-07 13:43:15',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=\'26500\' AND observaciones=\'VISIBLE:336º-226º        OCULTACION:110º\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-06-14 13:41:19', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-06-14 13:42:53',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25850\',\'2021-06-11\',\'Se sustituye el bloque de 8 discos LED y la óptica.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-06-22 11:20:19', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-06-28 15:31:17', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-06-29 11:40:40', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-06-29 11:42:35',
    'raul',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-06-29 11:44:07',
    'raul',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Faro de Canet&quot;, num_local=1,localizacion=&quot;Cabo Canet&quot;,latitud=&quot;39º 40,471´ N&quot;,longitud=&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-07 15:08:58', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-07 15:09:49',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25960\',\'2021-07-07\',\'Se sustituye la batería por una de SONNENSCHEIN SB12 de100Ah.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-07 15:11:17',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25960\',\'2014-03-07\',\'Se instala un panel solar por avería en la acometida eléctrica 230V\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-07 15:12:59',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25960\',\'2010-10-26\',\'Se repinta incluyendo una franja verde y convertirla en marca lateral de bifurcación.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-07 15:13:17',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25960\',\'2009-12-10\',\'Se instala el telecontrol\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-07 15:13:35',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25960\',\'2013-11-05\',\'se instala punto de luz\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-07 15:13:54',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25960\',\'2014-01-17\',\'Se repinta por DRAGADOS\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-07 15:14:22',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25960\',\'2017-01-14\',\'Se repinta la torre\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-19 10:33:57', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-19 10:37:01',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26392\',\'2021-07-14\',\'Sustitución de F.A. por avería en una de las salidas de C.C.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-19 10:46:30',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26312\',\'2021-07-13\',\'Sustitución LDR\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-19 10:51:19',
    'raul',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-19 10:54:02',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26500\',\'2021-06-30\',\'El SAI se encuentra en avería por las baterías\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-21 10:17:53', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-21 10:18:10',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Faro de Valencia&quot;, num_local=1,localizacion=&quot;Angulo del dique de la ampliacion norte&quot;,latitud=&quo'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-23 15:51:11', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:51:44',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Faro de Canet Sagunto&quot;, num_local=1,localizacion=&quot;Cabo Canet&quot;,latitud=&quot;39º 40,471´ N&quot;,lo'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:52:00',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:52:36',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26500\',\'2021-07-23\',\'Se realiza la revisión del pararrayos.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:52:50',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:52:57',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:53:09',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:53:20',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:53:33',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:53:42',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:53:56',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:54:07',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:54:17',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:54:42',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-23 15:54:53',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-26 14:15:08', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-26 14:15:15',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-26 14:16:14',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-26 14:16:27',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-26 14:16:45',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-26 14:16:51',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-28 10:05:02', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:06:57',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:36:36',
    'adrian',
    'Lampara borrada',
    'delete from lampara where nif=\'MENERA1\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:36:36',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=\'MENERA1\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:36:36',
    'adrian',
    'mantenimiento borrad',
    'delete from mantenimiento where nif=\'MENERA1\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:36:36',
    'adrian',
    'Localizacion borrada',
    'delete from localizacion where nif=\'MENERA1\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:36:36',
    'adrian',
    'Balizamiento borrado',
    'delete from balizamiento where nif=\'MENERA1\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:36:36',
    'adrian',
    'Balizamiento borrado',
    'Las cinco tablas borradas: lampara, observaciones,mantenimiento, localizacion y balizamiento'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:37:41',
    'adrian',
    'Lampara borrada',
    'delete from lampara where nif=\'MENERA2\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:37:41',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=\'MENERA2\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:37:41',
    'adrian',
    'mantenimiento borrad',
    'delete from mantenimiento where nif=\'MENERA2\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:37:41',
    'adrian',
    'Localizacion borrada',
    'delete from localizacion where nif=\'MENERA2\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:37:41',
    'adrian',
    'Balizamiento borrado',
    'delete from balizamiento where nif=\'MENERA2\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 10:37:41',
    'adrian',
    'Balizamiento borrado',
    'Las cinco tablas borradas: lampara, observaciones,mantenimiento, localizacion y balizamiento'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-28 12:34:44', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:36:38',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:36:53',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:55:43',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:55:56',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26460.1\',\'Sincronizada con el resto de BOYAS\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:57:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:57:53',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26470\',\'(Sincronizada con 26471, 26472 y 26473)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:58:08',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:58:16',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26471\',\'Sincronizada con 26470, 26472 y 26473\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:58:30',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:58:36',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26472\',\'Sincronizada con 26470, 26471 y 26473\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:58:48',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:58:52',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26473\',\'Sincronizada con 26470, 26471 y 26472\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:59:11',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 12:59:51',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:00:12',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:00:20',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26460.2\',\'Sincronizada con el resto de boyas\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:00:44',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:00:50',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26460.3\',\'Sincronizada con el resto de Boyas\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:01:03',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:01:23',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:01:33',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:01:46',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:01:59',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:02:11',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:02:30',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:02:45',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:03:59',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:04:01',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:04:20',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:04:36',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:04:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:04:59',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:15:24',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 13:15:50',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-28 14:41:01', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 14:46:23',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-28 16:07:41', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 16:20:50',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25700\',\'AIS sintetico\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-28 16:21:03',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25720\',\'AIS sintetico\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-29 10:35:57', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-07-30 12:39:15', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-07-30 12:39:26',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-02 13:33:10', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-02 13:33:20',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-02 13:33:24',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-04 15:51:21', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-04 15:51:37',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=\'25720\' AND observaciones=\'Suministro desde el VCT42\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-04 15:51:58',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25720\',\'Suministro desde el VCT42 pasando por la pecera SAI en la cueva de Batman.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-04 15:52:47',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25720\',\'2021-08-04\',\'Se retira cuadro de comunicaciones Red Industrial y estaciones meteorológicas.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-04 15:53:47',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25650\',\'2021-07-29\',\'Falla SAI\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-10 11:55:24', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-10 11:55:36',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26460\',\'2021-07-02\',\'DADA DE BAJA EN RESOLUCION DE BALIZAMIENTO Nº 2021170\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-10 11:55:50',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26460.1\',\'2021-07-02\',\'DADA DE BAJA EN RESOLUCION DE BALIZAMIENTO Nº 2021170\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-10 11:56:06',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26460.2\',\'2021-07-02\',\'DADA DE BAJA EN RESOLUCION DE BALIZAMIENTO Nº 2021170\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-10 11:56:25',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26460.3\',\'2021-07-02\',\'DADA DE BAJA EN RESOLUCION DE BALIZAMIENTO Nº 2021170\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-11 10:51:22', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-11 14:38:22', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-12 10:28:07', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-12 11:00:45',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25650\',\'Grupo electrógeno Caterpillar 13.5 KVA\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-12 11:00:55',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=\'25650\' AND observaciones=\'Grupo electrógeno aterpillar 13.5 KVA\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-13 12:43:25', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:13:19',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real Juan Carlos I Valencia&quot;, num_local=43,localizacion=&quot;Dique - Extremo - Darsena Sur&quot;,lat'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:14:08',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real JC I. Valencia&quot;, num_local=51,localizacion=&quot;Angulo oeste - Darsena auxiliar&quot;,latitud=&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:15:34',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Valencia.&quot;, num_local=34,localizacion=&quot;1ª Baliza de babor del nuevo contradique de la amp. N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:15:49',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Valencia.&quot;, num_local=34,localizacion=&quot;1ª Baliza de babor del nuevo contradique de la amp. N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:16:58',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:17:11',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:47:04',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:47:28',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:47:42',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:47:54',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:48:08',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:48:19',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:48:34',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:48:55',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:49:10',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:50:45',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 13:51:43',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-13 14:18:13',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26270\',\'No es de la APV. Solo se lleva a cabo su inspección (a terceros)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-23 12:25:49', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-24 10:49:17', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-24 10:49:54',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26325\',\'2021-08-24\',\'Se sustituyen las dos LDR\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-24 15:09:44', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-24 15:10:01',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25850\',\'2021-08-24\',\'\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-25 10:01:48', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-25 10:07:03',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26380\',\'2021-08-24\',\'Se sustituyen las dos LDRs\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-26 15:30:29', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-26 15:31:01',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-26 15:31:17',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-26 15:31:44',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-26 15:32:16',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-26 15:32:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-08-31 14:46:45', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-31 14:47:06',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25765\',\'2021-08-27\',\'Se da de baja por fallo.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-08-31 14:47:34',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25765\',\'2021-08-31\',\'Se sustituyen las baterias y el regulador. Se da de alta.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-08 11:07:13', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 11:08:14',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25800\',\'2020-04-21\',\'Se repinta la torre.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 11:13:02',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26190\',\'2020-05-18\',\'Se repinta la boya.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 11:14:05',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25730\',\'2020-02-10\',\'Se repinta la boya.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-08 15:18:13', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:18:41',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 38.8852\' N'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:19:21',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 38.8852\' N'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:20:27',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39º 38.885\' N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:20:59',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 38.838\' N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:21:40',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 38.940\' N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:21:58',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 38.894\' N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:22:47',
    'adrian',
    'Lampara borrada',
    'delete from lampara where nif=\'menera5\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:22:47',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=\'menera5\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:22:47',
    'adrian',
    'mantenimiento borrad',
    'delete from mantenimiento where nif=\'menera5\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:22:47',
    'adrian',
    'Localizacion borrada',
    'delete from localizacion where nif=\'menera5\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:22:47',
    'adrian',
    'Balizamiento borrado',
    'delete from balizamiento where nif=\'menera5\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:22:47',
    'adrian',
    'Balizamiento borrado',
    'Las cinco tablas borradas: lampara, observaciones,mantenimiento, localizacion y balizamiento'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:24:16',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=5,localizacion=&quot;Pantalan sierra menera sagunto&quot;,latitud=&quot;39° 38'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:24:41',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:25:42',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 38.9495\' N'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:26:03',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 39.051\' N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:26:26',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=6,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 38.9495\' N'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:26:41',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:26:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:27:21',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 39.005\' N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:27:39',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 39.106\' N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:28:01',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 39.0602\' N'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-08 15:28:09',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=0,localizacion=&quot;Pantalan Sierra Menera&quot;,latitud=&quot;39° 39.060\' N&'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-08 17:05:53', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-09 10:49:35', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-09 10:50:35',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-09 10:50:43',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-09 10:50:46',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-09 12:02:16', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-09 14:48:06', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-09 15:11:42',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-09 15:11:47',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-10 10:22:03', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-16 13:22:59', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-16 13:23:38',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26312\',\'2021-09-15\',\'Se sustituye el MOSCAD por fallo de comunicaciones\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-16 13:24:02',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26326\',\'2021-09-15\',\'Se sustituye el MOSCAD por fallo de comunicaciones. (ANFER)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-20 10:12:28', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-20 10:13:20',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25650\',\'2021-09-17\',\'Se sustituye por garantía el SAI por uno nuevo, quedando la instalación protegida.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-20 14:33:49', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-20 14:37:39',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26392\',\'2021-09-20\',\'Sustitución F.A. por avería\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-22 14:49:20', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-22 14:49:54',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26500\',\'2021-09-21\',\'Se sustituye la batería del grupo electrógeno.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-09-23 10:32:43', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-09-23 10:33:05',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26500\',\'2021-09-29\',\'Revisión de los AA.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-01 11:06:09', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-01 11:07:06',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26190\',\'2021-09-13\',\'Se realiza revisión anual con personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-01 11:07:30',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25554\',\'2021-09-29\',\'Se realiza revisión anual con personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-01 12:40:10', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-01 12:40:40',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-01 12:41:23',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-01 12:42:16',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-01 12:49:42',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-01 12:49:51',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-01 12:51:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-05 10:23:46', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:36:32',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:36:47',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:36:57',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:37:10',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:37:17',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:37:30',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:37:39',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:37:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:37:59',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:38:39',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:38:45',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:38:58',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:39:08',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:39:16',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:39:23',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:39:31',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-05 10:39:50',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-06 11:37:18', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:39:35',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:39:42',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:39:57',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:40:15',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:40:32',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:40:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:49:11',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26190\',\'2021-09-30\',\'Se sustituye un tramo de cadena.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:51:17',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25730\',\'Se recomienda soldar anodo nuevo\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:51:43',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25761\',\'Cadena al 35% desgaste\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-06 11:52:23',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25765\',\'Cadena durmiente presenta 25% desgaste\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-11 12:57:58', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-11 12:58:48',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25720\',\'2020-06-01\',\'Cambio de LDR por mal funcionamiento\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-11 12:59:38',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25721\',\'2020-05-29\',\'Cambio de los 8 niveles de leds y de la óptica.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-11 13:00:20',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26047.2\',\'2020-05-29\',\'Reparada mala conexión entre la placa solar y el regulador.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-15 10:49:51', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-15 10:50:26',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25776\',\'2021-10-14\',\'Se acude a las 22:00 por fallo. Se sustituye un fusible y queda funcionando.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-15 10:50:38',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-21 11:15:31', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:15:46',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA1\',\'2021-10-08\',\'Se repone la marca tope, perdida en un temporal y se asegura con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:16:08',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA10\',\'2021-10-08\',\'Se asegura la marca de tope con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:16:19',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA2\',\'2021-10-08\',\'Se asegura la marca de tope con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:16:30',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA3\',\'2021-10-08\',\'Se asegura la marca de tope con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:16:39',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA4\',\'2021-10-08\',\'Se asegura la marca de tope con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:16:48',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA5\',\'2021-10-08\',\'Se asegura la marca de tope con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:16:59',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA6\',\'2021-10-08\',\'Se asegura la marca de tope con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:17:07',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA7\',\'2021-10-08\',\'Se asegura la marca de tope con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:17:15',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA8\',\'2021-10-08\',\'Se asegura la marca de tope con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:17:23',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA9\',\'2021-10-08\',\'Se asegura la marca de tope con tuerca autoblocante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-21 11:18:26',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26285\',\'2021-10-20\',\'Los mecánicos llevan a cabo labores de mantenimiento en los cerramientos de la baliza.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-27 12:48:14', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-27 12:48:40',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26500\',\'2021-10-21\',\'Se sustituyen las baterias del SAI.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-28 15:18:07', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-10-28 15:18:44',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26047\',\'2021-10-28\',\'Se le sustituye el MOSCAD y la radio, que estaban averiadas. Vuelve a funcionar el telecontrol.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-10-29 11:49:39', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-12-15 12:06:00', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-15 12:06:49',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25761\',\'2021-11-11\',\'Se coloca tramo de cadena de 5m.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-15 12:07:11',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25765\',\'2021-11-11\',\'Se coloca tramo de cadena de 5m.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-15 12:07:39',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25765\',\'2021-11-11\',\'Se sustituyen los dos ánodos de sacrificio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-15 12:08:19',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25841\',\'2021-11-11\',\'Se sustituyen los dos ánodos de sacrificio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-15 12:08:47',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25842.5\',\'2021-11-11\',\'Se coloca un tramo de 2m de cadena.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-15 12:09:19',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25843\',\'2021-11-11\',\'Se acorta la cadena.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-15 12:10:23',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25554\',\'2021-11-11\',\'Se montan dos ánodos de sacrificio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-12-21 10:02:18', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-21 10:03:50',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25720\',\'2021-12-20\',\'Fuente alimentacion en averia. Se queda en funcionamiento con la segunda salida de la fuente de'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-21 10:07:23',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26047\',\'2021-12-21\',\'LitePipe1 está en fallo.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2021-12-22 13:19:24', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2021-12-22 13:19:43',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25842\',\'2021-12-22\',\'Falla la baliza autónoma y se sustituye por una de repuesto.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-01-03 12:56:51', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-03 12:57:13',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-03 12:57:26',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-01-12 10:52:28', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-01-12 14:57:41', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-01-17 10:48:31', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-01-20 13:35:54', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-20 13:41:28',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-20 13:42:10',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-20 13:43:21',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-01-21 11:36:58', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-01-21 13:23:27', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-21 13:24:35',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-21 13:24:41',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-01-27 14:57:30', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-01-31 12:32:52', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-31 12:35:09',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25761\',\'2022-01-28\',\'Se le sustituye la LDR izquierda\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-31 12:35:31',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25841\',\'Necesita repintado\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-31 12:35:44',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25841\',\'2022-01-28\',\'Se le sustituye la LDR izquierda\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-01-31 12:36:52',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25843\',\'2022-01-28\',\'Marca de tope perdida. Se prepara una encargándola al taller mecánico.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-02-02 12:05:59', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-02 12:06:59',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-02 12:07:15',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-02 12:33:29',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25768\',\'2022-02-02\',\'Se cambia la caracteristica de L0.5 oc1 L0.5 oc3 L0.5 oc9 a L0.6 oc0.6 L0.6 oc1.8 L0.6 oc5.4\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-02 12:49:11',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-02-04 14:47:11', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-04 14:47:40',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25920\',\'2022-02-04\',\'Se sustituyen los 8 discos LEDs y las LDR.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-04 14:49:13',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-02-16 09:09:50', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-16 09:12:06',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25820.1\',\'Fallo destellador según SCADA. Funciona sin sincronización con la 25820\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-02-17 12:56:40', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-17 12:57:36',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=\'25565\' AND fecha=\'2019-11-26\' AND mantenimiento LIKE \'%Se repinta toda la torre.%\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-02-22 08:42:41', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-22 08:42:49',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'prueba1\',\'L0.5 Oc0.7 L0.5 Oc2.1 L0.5 OC6.3\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-22 08:43:28',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-22 08:43:35',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-22 08:43:41',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-22 08:46:10',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-02-23 13:54:14', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-23 13:54:24',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-23 13:54:38',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-02-23 13:55:40',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real JCI Valencia&quot;, num_local=0,localizacion=&quot;Primera boya Marca Especial Dársena Exterior&quot;'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-03-01 09:21:37', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-01 09:21:46',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-01 09:21:54',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-01 09:25:19',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-03-08 09:45:16', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 09:45:45',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-03-08 13:02:35', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 13:02:52',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 13:10:39',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 13:11:38',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 13:13:54',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Valencia.&quot;, num_local=19,localizacion=&quot;3ª boya Br. Dársena de Servicios Náuticos&quot;,latitu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 13:14:16',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Valencia.&quot;, num_local=19,localizacion=&quot;3ª boya Br. Dársena de Servicios Náuticos&quot;,latitu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 13:14:50',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Valencia.&quot;, num_local=19,localizacion=&quot;3ª boya Br. Dársena de Servicios Náuticos&quot;,latitu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 13:15:09',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Valencia.&quot;, num_local=19,localizacion=&quot;3ª boya Br. Dársena de Servicios Náuticos&quot;,latitu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 13:15:17',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Valencia.&quot;, num_local=19,localizacion=&quot;3ª boya Br. Dársena de Servicios Náuticos&quot;,latitu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 13:34:34',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 14:14:22',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 14:15:14',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-08 14:29:32',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;PORT-SAPLAYA&quot;, num_local=1,localizacion=&quot;Extremo dique Sur&quot;,latitud=&quot;39º 30.614\' N&quot;,long'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-03-09 10:24:21', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-09 10:24:30',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real JCI Valencia&quot;, num_local=0,localizacion=&quot;Primera boya Marca Especial Dársena Exterior&quot;'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-09 10:30:55',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-09 10:31:38',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-09 10:32:05',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-09 10:32:38',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-09 10:34:17',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-09 10:34:26',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-09 10:34:33',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-03-10 08:53:56', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 08:54:05',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:09:34',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:09:38',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25700\',\'\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:09:45',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=\'25700\' AND observaciones=\'\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:10:54',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25700\',\'PANELES 95/12V --- BATERIAS:720Ah - 24v --- AEROGENERADOR: 150W/24V\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:20:46',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25700\',\'MBR600L 80w --- MBR300R 10w\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:21:19',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25700\',\'REFERENCIA CATASTRAL: 0304101YJ3700G0001PW\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:23:25',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:24:52',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:25:19',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26500\',\'REFERENCIA CATASTRA: 9555403YJ3986S0001XP\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:25:52',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26500\',\'AÑO CONSTRUCCION 1904\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:27:12',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:28:14',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25650\',\'REFERENCIA CATASTRAL: 0413301YJ4401S0001JK\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:31:00',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25650\',\'AIS SBS 002241047 / SINTETICO 992241055\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-10 09:31:39',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-03-10 12:49:24', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-03-16 09:27:15', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 09:28:26',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26190\',\'2022-03-10\',\'Varada en playa norte Port Saplaya debido a fuerte temporal Celia (Se da de baja)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 09:45:45',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25820.1\',\'Elastomero (Espuma polietileno cubierta de poliuretano)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 09:45:52',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25820.1\',\'2 X SB6V/ 200A .Regulador Morningstar/sunsaver\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 09:46:19',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25820.1\',\'Telecontrol RTU53 y reflector radar.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 09:47:45',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25841\',\'Elastomero (Espuma polietileno cubierta de poliuretano)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 09:48:16',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25841\',\'Telecontrol RTU 54 y reflector radar\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 09:48:31',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25841\',\'2 X SB6V/ 200A .Regulador Morningstar/sunsaver\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-03-16 12:50:00', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:50:30',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:51:43',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:52:04',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:52:21',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:52:37',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:52:55',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:53:12',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:53:27',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:53:44',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:53:56',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-16 12:54:12',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-03-31 15:13:49', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-31 15:15:29',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26083\',\'2022-03-29\',\'Traida por el POLLUX a puerto, se encontró a la deriva.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-31 15:15:57',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26083\',\'Marta de Alfonso PPEE telf 676209300\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-31 15:16:20',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26083\',\'Empresa que lleva mantenimiento FUGRO NORWAY AS.  Olga Fernandez y Carlos Oyonarte.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-31 15:17:06',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26083\',\'Carlos Oyonarte c.oyonarte@fugro.com 609688503\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-03-31 15:17:56',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26083\',\'Olga Fernandez  o.fernandez@fugro.com 609 233 630\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-04-27 11:40:31', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-04-27 11:41:10',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26190\',\'2022-04-26\',\'Se vuelve a fondear en su ubicación habitual.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-04-27 14:04:04', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-04-27 14:04:22',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Port saplaya pontona&quot;, num_local=3,localizacion=&quot;Señaliza pontona hundida&quot;,latitud=&quot;39º 32.76'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-04-27 14:04:34',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Port saplaya pontona&quot;, num_local=3,localizacion=&quot;Señaliza pontona hundida&quot;,latitud=&quot;39º 32.76'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-04-27 14:45:27', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-04-29 14:33:02', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-05-11 12:40:01', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-05-11 12:40:12',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26285\',\'MMSI: 992241052\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-05-11 12:40:28', 'adrian', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-05-11 12:40:57', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-05-13 11:34:45', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-06-03 13:10:01', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-06-03 13:10:50',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25552\',\'2022-06-02\',\'Se cambia batería y borneros + limpieza\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-06-16 15:01:50', 'Raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-06-16 15:09:10',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26500\',\'2022-06-15\',\'Se sustituye el SAI averiado\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-06-16 15:16:07',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26500\',\'2022-03-15\',\'Se cae parte de la valla perimetral que da a la avenida\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-06-16 15:23:49',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26500\',\'2020-02-13\',\'Se crea el sector de ocultación con vinilo\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-06-21 14:09:17', 'Raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-06-21 14:12:27',
    'raul',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26500\',\'2022-06-20\',\'Jose Luis de IRD deja operativa la cámara de entrada faro tras poner un UTP que faltaba del rad'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-06-22 15:32:45', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-06-22 15:33:49',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25740\',\'2022-06-21\',\'Se sustituye la boya completa por la nueva EBM-HV 30y linterna MCL360 XL\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-06-22 15:34:21',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25730\',\'\',\'Se sustituye la boya completa por la nueva EBM-HV23 y linterna MCL360 XL\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-06-22 15:35:16',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25776\',\'2022-06-21\',\'Se sustituyen las dos LDR\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-27 15:46:58', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-27 15:47:31',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25730\',\'2022-06-20\',\'Se sustituye la boya al reemplazarla por la nueva EBM22-HV\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-27 15:47:41',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25730\',\'PESO MUERTO: 4600 Kg\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-27 15:52:43',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-28 12:19:09', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-28 12:19:20',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Puerto de Sagunto&quot;, num_local=16,localizacion=&quot;Muelle de servicios, extremo&quot;,latitud=&quot;39º 38.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-28 14:11:53', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-29 13:19:08', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-29 13:20:13',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25730\',\'2022-07-29\',\'Se corrige la información del AIS. De ser aguas navegables se reconfigura a Cardinal Este\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-29 13:20:47',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25740\',\'2022-07-29\',\'Se reconfigura informacion AIS. De ser lateral de estribor, pasa a ser lateral de babor.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-29 13:24:24',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-07-29 13:24:37',
    'adrian',
    'Modificacion lampara',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-07-29 15:04:16', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-01 12:14:11', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-01 12:15:26',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25730\',\'2021-06-11\',\'Se suelda ánodo nuevo de sacrificio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-18 14:59:11', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 14:59:18',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25840\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 14:59:27',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25940\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 14:59:36',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25850\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 14:59:47',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26047.2\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 14:59:57',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26047\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 15:00:05',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25774\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 15:00:18',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26390\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 15:00:29',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26311\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 15:00:38',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26314\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 15:00:45',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26392\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 15:00:57',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25570\',\'SERA PINTADA EN 2022\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-18 15:01:45',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=\'25570\' AND observaciones=\'Necesita ser repitanda\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-19 15:19:11', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 15:19:42',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26360\',\'2022-08-18\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 15:20:48',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25843\',\'2022-08-12\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 15:21:06',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25843.5\',\'2022-08-12\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 15:21:23',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25843.8\',\'2022-08-12\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 15:21:38',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25842.5\',\'2022-08-12\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 15:22:27',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25761\',\'2022-08-02\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 15:24:06',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26313\',\'2022-08-19\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 15:24:27',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26320\',\'2022-08-19\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 16:09:21',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real Juan Carlos I. Valencia&quot;, num_local=51,localizacion=&quot;Angulo oeste - Darsena auxiliar&quot;,'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 16:10:17',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real Juan Carlos I. Valencia&quot;, num_local=102,localizacion=&quot;Semaforo a estribor - Puente móvil. V'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 16:10:35',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real Juan Carlos I. Valencia&quot;, num_local=103,localizacion=&quot;Semáforo a babor - Puente móvil. Vale'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-19 16:10:51',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real Juan Carlos I. Valencia&quot;, num_local=104,localizacion=&quot;Semáforo sobre tablero del puente móv'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-22 12:40:00', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-22 12:40:57',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Marina Real Juan Carlos I Valencia&quot;, num_local=0,localizacion=&quot;Primera boya Marca Especial Dársena Exte'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-23 15:54:53', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:55:23',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA1\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:55:33',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA2\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:55:43',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA3\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:55:52',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA4\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:56:03',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA5\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:56:17',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA6\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:56:25',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA7\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:56:34',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA8\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:56:44',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA9\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-23 15:56:52',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'MENERA10\',\'2022-08-23\',\'Se realiza la revisión anual por parte de personal de Wartsila.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-25 10:41:03', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-25 10:45:09',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26048.1\',\'2022-08-24\',\'Se da de baja por no dar servicio de ayuda luminosa.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-25 14:06:30', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-08-29 10:10:49', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-29 10:11:00',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25768\',\'2022-08-03\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-29 10:11:19',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25841\',\'2022-08-03\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-29 10:11:44',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26048.3\',\'2022-08-04\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-29 10:12:01',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26048.2\',\'2022-08-04\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-29 10:12:17',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25765\',\'2022-08-05\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-08-29 10:13:45',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26190\',\'2022-08-24\',\'Wartsila realiza revisión submarina.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-02 12:07:38', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-02 12:08:15',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25761\',\'2022-09-02\',\'Se sustituyen ánodos de sacrificio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-02 12:08:31',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25843.5\',\'2022-09-02\',\'Se sustituyen ánodos de sacrificio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-02 12:08:47',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25843.8\',\'2022-09-02\',\'Se sustituyen ánodos de sacrificio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-02 12:09:37',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25820.1\',\'2022-09-02\',\'Se sustituyen ánodos de sacrificio.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-09 10:36:40', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-09 10:37:15',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25650\',\'2022-09-08\',\'Se cambia la batería del grupo electrógeno. Se rellena liquido refrigerante.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-12 12:56:31', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-12 12:56:35', 'marcos', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-12 12:56:51', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-12 12:56:54', 'raul', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-12 12:57:32', 'guillermo', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-12 12:58:07', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-12 13:00:06',
    'marcos',
    'Observacion añadida',
    'insert into observaciones values(\'26048.1\',\'09/09/22 se cambia la LDR de la linterna .\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-12 13:00:43',
    'marcos',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26048.1\',\'2022-09-09\',\'Se cambia la LDR de la linterna.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-12 13:00:48',
    'marcos',
    'Observacion borrada',
    'delete from observaciones where nif=\'26048.1\' AND observaciones=\'09/09/22 se cambia la LDR de la linterna .\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-13 11:17:22', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-13 15:41:33', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-13 15:41:50',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25776\',\'2022-09-12\',\'Se sustituye la LDR superior.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-15 12:16:30', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-15 12:16:46',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-15 12:18:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-28 12:09:35', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-29 10:54:27', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-29 10:55:01',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25554\',\'2022-09-05\',\'Wartsila realiza la revisión anual de la boya.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-09-29 15:06:08', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-09-29 15:06:34',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25830\',\'Sincronizada con la 25831.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-10-06 11:44:52', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-10-06 13:56:46', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-10-06 15:37:15', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:37:33',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:37:51',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26465\',\'Responsable: Grupo culmarex\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:38:32',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26465\',\'2022-08-16\',\'Cambio su NIF, pasando a ser la 26465\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:40:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:41:09',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26465.1\',\'2022-08-16\',\'Cambio su NIF, pasando a ser la 26465.1\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:41:26',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Costa Blanca&amp;quot;&quot;, num_local=4,localizacion=&quot;Boya SE&quot;,latitud=&qu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:41:32',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26465.1\',\'Responsable: Grupo culmarex\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:41:52',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Culmarex&amp;quot;&quot;, num_local=4,localizacion=&quot;Boya SE&quot;,latitud=&quot;3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:42:30',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Culmarex&amp;quot;&quot;, num_local=1,localizacion=&quot;Boya SE&quot;,latitud=&quot;3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:42:53',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Culmarex&amp;quot;&quot;, num_local=4,localizacion=&quot;Boya NE&quot;,latitud=&quot;3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:43:50',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Costa Blanca&amp;quot;&quot;, num_local=4,localizacion=&quot;Boya NW&quot;,latitud=&qu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:45:15',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Costa Blanca&amp;quot;&quot;, num_local=4,localizacion=&quot;Boya NW&quot;,latitud=&qu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:45:47',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Costa Blanca&amp;quot;&quot;, num_local=3,localizacion=&quot;Boya NE&quot;,latitud=&qu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:46:34',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Costa Blanca&amp;quot;&quot;, num_local=2,localizacion=&quot;Boya NW&quot;,latitud=&qu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:46:47',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:46:58',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:47:20',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Culmarex&amp;quot;&quot;, num_local=4,localizacion=&quot;Boya NW&quot;,latitud=&quot;3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:47:25',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26465.4\',\'Responsable: Grupo culmarex\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:47:40',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26465.4\',\'2022-08-16\',\'Cambio su NIF, pasando a ser la 26465.4\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:48:03',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:48:30',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Costa Blanca&amp;quot;&quot;, num_local=3,localizacion=&quot;Boya SW&quot;,latitud=&qu'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:48:35',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'26465.3\',\'Responsable: Grupo culmarex\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:48:42',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26465.3\',\'\',\'Cambio su NIF, pasando a ser la 26465.3\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:49:22',
    'adrian',
    'Modificacion Localiz',
    'UPDATE localizacion set puerto=&quot;Cultivos marinos &amp;quot;Culmarex&amp;quot;&quot;, num_local=4,localizacion=&quot;Boya NE&quot;,latitud=&quot;3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:50:22',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:50:32',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:50:41',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-06 15:50:54',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-10-11 14:39:01', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-11 14:39:15',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25720\',\'2022-10-11\',\'\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-11 14:40:12',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25720\',\'2022-10-11\',\'Se sustituye la LDR frontal (Orientacion S)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-11 14:40:19',
    'adrian',
    'Mantenimiendo borrad',
    'delete from mantenimiento where nif=\'25720\' AND fecha=\'2022-10-11\' AND mantenimiento LIKE \'%%\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-10-11 14:41:55',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25720\',\'2022-10-11\',\'Se sustituye la LDR frontal (Orientacion S)\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-11-03 15:27:48', 'raul', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-12-16 09:28:35', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-12-16 09:36:49',
    'marcos',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25761\',\'2022-11-30\',\'Se cambia la LDR (derecha) de la linterna\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-12-16 09:39:54',
    'marcos',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26048.3\',\'2022-11-30\',\'Se cambia la LDR (izquierda) de la linterna\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-12-21 09:33:38', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-12-22 11:16:07', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-12-22 11:20:15',
    'marcos',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25721\',\'2022-12-21\',\'Se rearma diferencial del CT (en Grimaldi) y el propio de la baliza, tras aviso del CCE.\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-12-22 15:02:43', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-12-26 09:21:09', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-12-26 13:52:12', 'marcos', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2022-12-26 13:54:24',
    'marcos',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'25841\',\'2022-12-23\',\'Se revisa el RTU sin poder repararlo al ser competencia de Anfer\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2022-12-27 11:39:54', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2023-01-24 12:29:50', 'guillermo', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2023-01-24 13:46:10', 'guillermo', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2023-01-24 13:54:53', 'guillermo', 'logout', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2023-01-24 13:55:10', 'guillermo', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2023-01-25 09:18:51', 'guillermo', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2023-02-02 11:37:08', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-02 11:40:24',
    'adrian',
    'Observacion añadida',
    'insert into observaciones values(\'25563\',\'Necesita ser pintada\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-02 11:42:01',
    'adrian',
    'Observacion borrada',
    'delete from observaciones where nif=\'25565\' AND observaciones=\'SE REPINTARÁ EN 2019\''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  ('2023-02-07 09:40:34', 'adrian', 'login', '');
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:40:46',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:41:10',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:41:29',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:41:42',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:41:55',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:42:06',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:42:17',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:42:28',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:42:39',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:42:49',
    'adrian',
    'Modificacion Caracte',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-07 09:46:30',
    'adrian',
    'Mantenimiento añadid',
    'insert into mantenimiento values(\'26450\',\'2023-02-02\',\'Se fondea boya de sustitución con BDL120 y placas\')'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-08 15:45:37',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 09:24:05',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 09:24:23',
    'adrian',
    'UPDATE profile',
    'adrian actualizó su foto'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 09:26:42',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 11:03:32',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 11:03:42',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 11:05:00',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 11:13:17',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 11:14:13',
    'adrian',
    'DELETE observaciones',
    '25563'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 11:14:52',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 12:45:21',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 12:46:13',
    'guillermo',
    'LOGIN usuario',
    '2 guillermo gcasamayor@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 12:49:14',
    'guillermo',
    'INSERT foto',
    '25552'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 12:49:39',
    'guillermo',
    'LOGOUT usuario',
    '2 guillermo'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 12:49:56',
    'guillermo',
    'UPDATE usuarios',
    'Se le añade permisos de admin'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 12:50:10',
    'guillermo',
    'DELETE foto',
    '25552 IMG_0740.JPG'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 12:52:30',
    'guillermo',
    'LOGOUT usuario',
    '2 guillermo'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 13:17:48',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 13:18:02',
    'adrian',
    'INSERT mantenimiento',
    '25460 2023-02-09 prrueba'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 13:18:07',
    'adrian',
    'INSERT mantenimiento',
    '25460  prueba2'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 13:18:38',
    'adrian',
    'INSERT mantenimiento',
    '25470 2023-02-09 zxc'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 13:19:09',
    'adrian',
    'DELETE mantenimiento',
    '25730'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 13:19:56',
    'adrian',
    'DELETE mantenimiento',
    '25940'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 13:20:54',
    'adrian',
    'INSERT mantenimiento',
    '25940 2016-03-09 Se repinta la baliza y se deja el tercio inferior blanco'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-09 13:21:26',
    'adrian',
    'DELETE mantenimiento',
    '26465.3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-24 10:11:37',
    'guillermo',
    'LOGIN usuario',
    '2 guillermo gcasamayor@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-24 14:02:59',
    'guillermo',
    'LOGOUT usuario',
    '2 guillermo'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-28 13:52:33',
    'guillermo',
    'LOGIN usuario',
    '2 guillermo gcasamayor@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-02-28 13:54:33',
    'guillermo',
    'UPDATE localizacion',
    '25765 Puerto de Valencia. 6 Canal, ángulo Norte del contradique. 39º 26.150´N 00º 18.766´ W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-15 09:33:56',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:13:57',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:15:21',
    'adrian',
    'INSERT mantenimiento',
    '25700 2023-02-10 a de activación de la baliza de emergencia ante el paro en la rotación de la baliza principal. '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:16:15',
    'adrian',
    'INSERT mantenimiento',
    '25700 2023-02-16 Personal de MSM reprograma el PLC resolviendo el problema de activacion de baliza de emergencia'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:16:28',
    'adrian',
    'UPDATE mantenimiento',
    '25700 2023-02-10 Faltaa de activación de la baliza de emergencia ante el paro en la rotación de la baliza principal. '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:16:34',
    'adrian',
    'UPDATE mantenimiento',
    '25700 2023-02-10 Falta de activación de la baliza de emergencia ante el paro en la rotación de la baliza principal. '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:17:47',
    'adrian',
    'INSERT mantenimiento',
    '25563 2023-02-08 Se rehace el pantalan, reubicando la baliza sobre un poste lateral en el extremo del mismo. Falta pintar la marca diurna.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:18:12',
    'adrian',
    'UPDATE observaciones',
    '25563 su marca diurna necesita ser pintada por rehabilitación de pantalán.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:22:40',
    'adrian',
    'INSERT documento',
    'c6bbf18c-aaab-4b1e-b86c-5b9ea4228203.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:25:42',
    'adrian',
    'INSERT documento',
    '6bda280d-ad06-4602-8e56-1401a6ecd796.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:29:43',
    'adrian',
    'INSERT documento',
    '62335b2d-6015-430c-8449-379d3baa06b0.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:31:47',
    'adrian',
    'DELETE documento',
    '62335b2d-6015-430c-8449-379d3baa06b0.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:32:15',
    'adrian',
    'INSERT documento',
    '69c6c4ad-f37a-475c-a2a5-bac57990ece6.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:33:31',
    'adrian',
    'INSERT documento',
    '0ed8c7bb-e602-4ef6-8445-1783e2d7696b.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-16 12:43:26',
    'adrian',
    'INSERT documento',
    'a9888520-17b3-4011-8b4c-a44368b2f1e7.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 09:21:36',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 09:22:04',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 09:22:32',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 09:23:20',
    'adrian',
    'DELETE aton ',
    'Prueba'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 09:23:33',
    'adrian',
    'DELETE aton ',
    'prueba1'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 11:26:01',
    'guillermo',
    'LOGIN usuario',
    '2 guillermo gcasamayor@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 11:26:06',
    'guillermo',
    'LOGOUT usuario',
    '2 guillermo'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 11:26:24',
    'marcos',
    'LOGIN usuario',
    '3 marcos msaez@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 11:26:49',
    'raul',
    'LOGIN usuario',
    '4 raul rrubio@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 11:26:52',
    'raul',
    'LOGOUT usuario',
    '4 raul'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 11:27:47',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 11:28:31',
    'adrian',
    'INSERT documento',
    'bb6b64c4-049c-4804-be84-1818ddfa5b0e.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:05:38',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:05:50',
    'adrian',
    'UPDATE balizamiento',
    '25761  Boya Castillete amarilla y marca de tope RTU 04GpD(4)A 11 [(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:06:01',
    'adrian',
    'UPDATE balizamiento',
    '25765  Boya Castillete amarilla y marca de tope RTU 02GpD(4)A 11 [(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:06:17',
    'adrian',
    'UPDATE balizamiento',
    '26020 E-0206.7 Baliza SUR Tronco piramidal negro-amarillo con marca de tope. NoGpRp(6)B 10 [(L0.25 oc0.25)x6] L2 oc5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:06:30',
    'adrian',
    'UPDATE balizamiento',
    '25920 E-0204.2 Baliza TPS 3.3 RTU 13GpD(4)V 11 [(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:06:40',
    'adrian',
    'UPDATE balizamiento',
    '25840 E-0202 Baliza TPS 3.3 RTU 44GpD(4)R 11 [(0.5 oc 1.5)x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:06:48',
    'adrian',
    'UPDATE balizamiento',
    '25774 E-0201.11 Baliza Cilíndrica roja, base blanca RTU 10GpD(2)R 7 L0.5 oc 1.5 L0.5 oc 4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:06:57',
    'adrian',
    'UPDATE balizamiento',
    '25820.1  Boya Castillete verde y marca de tope SíGpD(2)V 7 L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:07:05',
    'adrian',
    'UPDATE balizamiento',
    '25831  Baliza Columna cilíndrica verde con la base blanca. GpD(3)V 9 [L0,5+oc 1,5]x2+L0,5+oc4,5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:07:13',
    'adrian',
    'UPDATE balizamiento',
    '25841  Boya Castillete rojo y marca de tope RTU 54GpD(4)R 11 [( L 0.5 oc 1.5)x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:07:21',
    'adrian',
    'UPDATE balizamiento',
    '25844  Boya oceanográfica Castillete amarilla y marca de tope RTU 37GpD(4)A 11 [(L 0.5 oc 1.5) x3] L 0.5 oc 4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 12:07:43',
    'adrian',
    'UPDATE balizamiento',
    '26375  Baliza B torre poligonal metálica NOGpD(4)R 11 [ ( L0,5 oc1,5 )x 3 ] L0,5 oc4,5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 13:17:42',
    'jose',
    'INSERT usuario',
    '5 jose Jose Martin Tur'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 13:18:17',
    'jose',
    'LOGOUT usuario',
    '5 jose'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 13:55:40',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 13:56:33',
    'adrian',
    'UPDATE lampara',
    '26465 0 0 3 Si 0 2 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-17 13:56:40',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-20 09:02:19',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-20 13:02:08',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-20 13:02:26',
    'adrian',
    'INSERT mantenimiento',
    '25564 2023-03-18 CCE avisa fallo de lampara'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-20 13:02:37',
    'adrian',
    'INSERT mantenimiento',
    '25564 2023-03-20 Se sustituye por MCL200Y ref:668.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-20 13:22:52',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-20 13:22:54',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-20 13:23:03',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-20 13:27:22',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-21 10:49:28',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-21 11:16:14',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-21 11:31:43',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-21 11:31:44',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-21 11:31:46',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-21 11:31:46',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-22 09:06:47',
    'adrian',
    'LOGOUT usuario',
    '1 adrian'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-22 09:06:51',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-22 09:07:42',
    'adrian',
    'INSERT mantenimiento',
    '25700 2023-03-22 se da de baja por fallo en rotación. Según NETCOM fallo fotocelula'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-22 09:20:16',
    'adrian',
    'UPDATE mantenimiento',
    '25564 2023-03-18 CCE avisa fallo de lampara. Se da de baja.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-22 09:20:24',
    'adrian',
    'UPDATE mantenimiento',
    '25564 2023-03-20 Se sustituye por MCL200Y ref:668. Se da de alta.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-23 10:39:20',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 09:52:54',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 09:54:09',
    'adrian',
    'INSERT mantenimiento',
    '25842 2010-12-03 Instalación y puesta en marcha. Total factura: 24973.52€'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 09:55:37',
    'adrian',
    'UPDATE mantenimiento',
    '25777 2010-01-20 Se instala la nueva torre TPS 3.3 (LMV). Total Factura: 28744.80€'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 09:57:04',
    'adrian',
    'UPDATE mantenimiento',
    '25840 2011-06-16 Se instala sincronismo con la boya 25840.1 (no está fondeada todavía). 3660€'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 09:58:30',
    'adrian',
    'UPDATE mantenimiento',
    '26021 2009-10-30 Se instala nueva torre TPS 3.3. 22199.10€'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 09:58:48',
    'adrian',
    'UPDATE mantenimiento',
    '26021 2011-10-06 Se instala nueva torre TPS 3.3. 22199.10€'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 10:49:25',
    'adrian',
    'INSERT mantenimiento',
    '25720 2010-03-09 Suministro de 2 balizas lineales (litepipe) por Mesemar. 10.880€'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 11:17:01',
    'adrian',
    'UPDATE lampara',
    '25740 6 6 5 MCL360 L 191.67 0 230'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 11:17:12',
    'adrian',
    'UPDATE lampara',
    '25730 3 3 3 MCL360 L 1000 3 100'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 11:57:28',
    'adrian',
    'INSERT mantenimiento',
    '26021 2009-12-02 Se instala baliza nueva.'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-24 12:01:15',
    'adrian',
    'UPDATE mantenimiento',
    '25850 2008-11-30 Se instala la torre nueva mod TPS33 con baliza LEds 300 de 50w. 19174.80€'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-27 12:48:08',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-27 12:49:26',
    'adrian',
    'UPDATE localizacion',
    '26510 Canet de Berenguer 3 Extremo Sur Contradique 39º 40.370\' N 00º 12.105\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-27 12:50:17',
    'adrian',
    'UPDATE localizacion',
    '25600 Desembocadura Júcar Cullera 2 Malecón Sur a 39 m del extremo 39º 09.034\' N 00º 14.164\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-28 15:35:08',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-28 15:35:15',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-28 19:19:31',
    'adrian',
    'LOGIN usuario',
    '1 adrian adeharo@puerto.com'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-03-28 19:19:41',
    'adrian',
    'DELETE foto',
    '25740 1674727402943.jpeg'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 01:47:09',
    'adrian',
    'UPDATE lampara',
    '25460 0 0 0 0 0 0 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 01:47:14',
    'adrian',
    'UPDATE lampara',
    '25460 00 0 0 0 0 0 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 01:47:21',
    'adrian',
    'UPDATE localizacion',
    '25460 C.N. Oliva 12 Extremo dique de abrigo 38 º59.004\' N 00º 05.490\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 01:50:03',
    'adrian',
    'UPDATE localizacion',
    '25460 C.N. Oliva 1 Extremo dique de abrigo 38 º59.004\' N 00º 05.490\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 01:50:13',
    'adrian',
    'UPDATE localizacion',
    '25530 Puerto de Gandía 12 Extremo dique norte 38º 59.712\' N 00º 8.666\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 01:55:12',
    'adrian',
    'UPDATE localizacion',
    '25530 Puerto de Gandía 122 Extremo dique norte 38º 59.712\' N 00º 8.666\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 01:57:36',
    'adrian',
    'UPDATE localizacion',
    '25530 Puerto de Gandía 1 Extremo dique norte 38º 59.712\' N 00º 8.666\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 02:00:35',
    'adrian',
    'UPDATE localizacion',
    '25530 Puerto de Gandía 1111 Extremo dique norte 38º 59.712\' N 00º 8.666\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 02:01:32',
    'adrian',
    'UPDATE localizacion',
    '25530 Puerto de Gandía 111 Extremo dique norte 38º 59.712\' N 00º 8.666\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 02:04:55',
    'adrian',
    'UPDATE localizacion',
    '25530 Puerto de Gandía 11 Extremo dique norte 38º 59.712\' N 00º 8.666\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 02:11:05',
    'adrian',
    'UPDATE localizacion',
    '25530 Puerto de Gandía 112 Extremo dique norte 38º 59.712\' N 00º 8.666\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 02:16:38',
    'adrian',
    'UPDATE localizacion',
    '25530 Puerto de Gandía 11 Extremo dique norte 38º 59.712\' N 00º 8.666\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 02:24:11',
    'adrian',
    'UPDATE lampara',
    '25530 7 15 7 DES 33 MaqVal. Bola leds 50 w Óptica300 mm 0 0 2'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-23 02:27:02',
    'adrian',
    'INSERT observaciones',
    '25530 rjkj'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-04-26 18:38:36',
    'adrian',
    'UPDATE lampara',
    '25470 0 0 0 0 0 0 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:15:35',
    'adrian',
    'UPDATE lampara',
    '25564 3 3 2.32 MBL 160 (MSM) 0.01 0.01 0.01'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:15:43',
    'adrian',
    'UPDATE lampara',
    '25564 3 3 2.32 MBL 160 (MSM) 0 0.01 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:30:52',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:31:20',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:31:47',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:32:05',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:32:19',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:32:50',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:34:15',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:35:17',
    'adrian',
    'DELETE backup',
    'dumpSAN1683653570200.sql'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:44:05',
    'adrian',
    'DELETE documento',
    '0ed8c7bb-e602-4ef6-8445-1783e2d7696b.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:44:10',
    'adrian',
    'DELETE documento',
    '0ed8c7bb-e602-4ef6-8445-1783e2d7696b.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:48:21',
    'adrian',
    'INSERT documento',
    '1e003a9e-b2fe-4e91-8f50-2c746b91f649.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:48:30',
    'adrian',
    'DELETE documento',
    '1e003a9e-b2fe-4e91-8f50-2c746b91f649.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:49:46',
    'adrian',
    'DELETE documento',
    '69c6c4ad-f37a-475c-a2a5-bac57990ece6.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:50:20',
    'adrian',
    'DELETE documento',
    '6bda280d-ad06-4602-8e56-1401a6ecd796.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:50:35',
    'adrian',
    'DELETE documento',
    '6bda280d-ad06-4602-8e56-1401a6ecd796.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:51:13',
    'adrian',
    'DELETE documento',
    'a9888520-17b3-4011-8b4c-a44368b2f1e7.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:51:39',
    'adrian',
    'DELETE documento',
    'a9888520-17b3-4011-8b4c-a44368b2f1e7.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:51:41',
    'adrian',
    'DELETE documento',
    'bb6b64c4-049c-4804-be84-1818ddfa5b0e.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:51:47',
    'adrian',
    'DELETE documento',
    'c6bbf18c-aaab-4b1e-b86c-5b9ea4228203.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:52:02',
    'adrian',
    'INSERT documento',
    'b4a4d2db-4919-406a-a150-5f2fc13aa2e8.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:52:15',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:59:01',
    'adrian',
    'INSERT documento',
    'd3202c00-23f1-4934-938d-938f1924d51e.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-09 21:59:03',
    'adrian',
    'DELETE documento',
    'd3202c00-23f1-4934-938d-938f1924d51e.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-13 17:19:53',
    'adrian',
    'UPDATE localizacion',
    '25460 C.N. Oliva 1 Extremo dique de abrigo 38º 59.004\' N 00º 05.490\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-13 18:16:40',
    'adrian',
    'UPDATE localizacion',
    '25470 C.N. Oliva 2 Extremo contradique 38º55.989\' N 00º 05.559\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-13 18:53:56',
    'adrian',
    'UPDATE localizacion',
    '26326 Puerto de Sagunto 15 Muelle Norte Dos 39º 38.562\' N 00º 12.805\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-13 18:55:43',
    'adrian',
    'UPDATE localizacion',
    '26326 Puerto de Sagunto 15 Muelle Norte Dos 39º 38.562\' N 00º 12.805\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-13 19:00:38',
    'adrian',
    'UPDATE localizacion',
    '25650 Gandia 0 Extremo del cabo de Cullera 39º 11.188\' N 00º 13.016\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-13 19:01:33',
    'adrian',
    'UPDATE localizacion',
    '25720 Puerto de Valencia. 1 Extremo dique del Este 39º 26.028´ N 000º 18.171´ W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-13 19:02:07',
    'adrian',
    'UPDATE localizacion',
    '25720 Puerto de Valencia. 1 Extremo dique del Este 39º 26.028\' N 000º 18.171\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-13 19:03:57',
    'adrian',
    'UPDATE localizacion',
    '25720 Puerto de Valencia. 1 Extremo dique del Este 39º 26.028\' N 000º 18.171\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 19:31:44',
    'adrian',
    'INSERT mantenimiento',
    '26450 2023-05-15 snn'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 19:36:37',
    'adrian',
    'UPDATE documento',
    'kkvdsbffndn descripcion prueba dni34636u'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 19:37:11',
    'adrian',
    'INSERT documento',
    '20573ea8-4d11-42ab-a635-d117b9e528d7.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 19:37:35',
    'adrian',
    'DELETE documento',
    '20573ea8-4d11-42ab-a635-d117b9e528d7.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 19:37:55',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 20:00:46',
    'adrian',
    'UPDATE balizamiento',
    '25554 36564 Boya de espeque roja/verde MSM NOGpD(2+1)V 14 L0,5 oc1 L0,5 oc3 L0,5 oc1'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 20:01:07',
    'adrian',
    'UPDATE balizamiento',
    '25554 36564 Boya de espeque roja/verde MSM NOGpD(2+1)V 14 L0,5 oc1 L5,5 oc3 L0,5 oc1'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 22:54:58',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 23:07:55',
    'adrian',
    'DELETE documento',
    'b4a4d2db-4919-406a-a150-5f2fc13aa2e8.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 23:08:30',
    'adrian',
    'INSERT documento',
    '500eebfb-4302-4fe7-8954-155883d44f51.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 23:08:57',
    'adrian',
    'UPDATE documento',
    'Resolucion Valencia Resolucion provisional emitida por PPEE  sobre una parte del balizamiento'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 23:09:24',
    'adrian',
    'INSERT documento',
    'e502a93b-9a59-4d67-9486-23cca55e3f82.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 23:09:53',
    'adrian',
    'INSERT documento',
    'fa5861e4-3dca-4319-ab1e-f9f079ca2840.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-16 23:10:12',
    'adrian',
    'INSERT documento',
    'de79b703-f67b-455b-9d8a-f8dacd6a3eed.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-17 00:36:45',
    'adrian',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:41:42',
    'admin',
    'UPDATE inventario',
    'Info actualizada Bateria SB6 6'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:41:46',
    'admin',
    'UPDATE inventario',
    'Info actualizada Bateria SB6 6'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:44:16',
    'admin',
    'INSERT inventario',
    'Item dgdgshsh añadido 1 cantidades'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:44:18',
    'admin',
    'INSERT inventario',
    'Item dgdgshsh añadido 1 cantidades'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:44:32',
    'admin',
    'INSERT inventario',
    'Item dgdgshsh añadido 1 cantidades'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:44:44',
    'admin',
    'INSERT inventario',
    'Item nuevo añadido 2 cantidades'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:57:56',
    'admin',
    'UPDATE fotografia perfil',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:58:04',
    'admin',
    'DELETE fotografia perfil',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:58:07',
    'admin',
    'UPDATE fotografia perfil',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:58:12',
    'admin',
    'DELETE fotografia perfil',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 13:59:41',
    'admin',
    'UPDATE fotografia perfil',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-18 14:00:27',
    'admin',
    'DELETE fotografia perfil',
    ''
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-19 18:44:00',
    'admin',
    'DELETE fotografia',
    '25700'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-19 20:36:04',
    'admin',
    'UPDATE balizamiento',
    '26190  Boya Peligro especial Espeque negra roja negra noGpD(2)B 5 L0,5 oc1 L0,5 oc3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-19 20:36:13',
    'admin',
    'UPDATE balizamiento',
    '26190  Boya Peligro aislado. Espeque negra roja negra noGpD(2)B 5 L0,5 oc1 L0,5 oc3'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-19 21:20:00',
    'admin',
    'UPDATE balizamiento',
    '25820 E-0201.4 Baliza TPS 3.3 GpD(2)V 7 L 0.5 oc 1.5 L 0.5 oc 4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-19 21:20:47',
    'admin',
    'UPDATE balizamiento',
    '25768  Boya Castillete verde-roja-verde y marca de tope NoGpD(2+1)V 9 L0.6 oc0.6 L0.6 oc1.8 L0.6 oc5.4'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-19 21:23:57',
    'admin',
    'UPDATE balizamiento',
    '26205 E-0210.74 Baliza CE Columna cilíndrica GpRp(3)B 5 [(L0,25 oc0,25)x2] L0,25 oc3,75'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-19 21:24:58',
    'admin',
    'UPDATE balizamiento',
    '25563 E-0196.32 Baliza Metal Estribor Linterna sobre pilote. NOGpD(4)V 11 (L0,5 oc1,5)x3 L0,5 oc4,5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-19 21:25:53',
    'admin',
    'UPDATE balizamiento',
    '25563 E-0196.32 Baliza Metal Estribor Linterna sobre pilote. NOGpD(4) V 11 (L0,5 oc1,5)x3 L0,5 oc4,5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-20 19:12:50',
    'admin',
    'UPDATE balizamiento',
    '25620 E-0197.5 Baliza semaforo Panel circular blanco, bandas rojas en el tablero del puente Iso B 2 L2 oc2'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-20 19:23:44',
    'admin',
    'UPDATE localizacion',
    '25650 Gandia 0 Extremo del cabo de Cullera 39º 11.188\' N 00º 10.016\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-20 19:24:03',
    'admin',
    'UPDATE localizacion',
    '25650 Gandia 0 Extremo del cabo de Cullera 39º 11.188\' N 00º 13.016\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-22 19:27:58',
    'admin',
    'UPDATE balizamiento',
    '25560 E-0196.25 Baliza Hormigon pequeña columna cuadrangular NOGpD(4)R 11 (L0,5 oc1,5)x3 L0,5 oc4,5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-22 19:29:17',
    'admin',
    'UPDATE balizamiento',
    '25560 E-0196.25 Baliza Hormigon pequeña columna cuadrangular NOoGpD(4)R 11 (L0,5 oc1,5)x3 L0,5 oc4,5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-23 07:47:32',
    'admin',
    'DO backup',
    'nuevo backup'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-23 11:38:39',
    'admin',
    'INSERT balizamiento',
    'batea1'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-23 12:09:59',
    'admin',
    'UPDATE localizacion',
    'batea1 Valencia 0 0 39º 27.150\' N 000º 17.292\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-23 12:10:12',
    'admin',
    'UPDATE balizamiento',
    'batea1 0 0 0GdD(4)A 11 (L0.5+oC0.5)X3+L0.5+Oc4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-23 12:10:47',
    'admin',
    'INSERT balizamiento',
    'batea2'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-23 12:11:16',
    'admin',
    'UPDATE balizamiento',
    'batea2   GdD(4)A 11 (L0.5+oC0.5)X3+L0.5+Oc4.5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-23 12:11:57',
    'admin',
    'UPDATE localizacion',
    'batea2 0 0 0 39º 26.724\' N 00º 17.526\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-23 12:20:25',
    'admin',
    'INSERT documento',
    'e4a920eb-f9d5-409d-9e46-cc1aae58b239.pdf'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-23 13:01:48',
    'admin',
    'UPDATE lampara',
    '25844 3 3 3 BDL 120 dos. coronas. 0 0 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:15:56',
    'tecnico',
    'INSERT observaciones',
    '25600 asd'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:18:07',
    'tecnico',
    'UPDATE usuarios',
    'Se le añade permisos de admin'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:18:18',
    'tecnico',
    'INSERT observaciones',
    '25470 dtfyflkl'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:19:56',
    'tecnico',
    'INSERT observaciones',
    '25470 '
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:21:14',
    'tecnico',
    'UPDATE observaciones',
    '25470 asdgsdhdfjkgflkfgyhñl2'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:21:23',
    'tecnico',
    'UPDATE balizamiento',
    '25470 E-0190.2 Baliza Torre troncopiramidal roja blanca teeeeGpD(2)R 7 L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:21:28',
    'tecnico',
    'UPDATE lampara',
    '25470 1 0 0 0 0 0 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:22:05',
    'admin',
    'DELETE observaciones del aton ',
    '25600'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:22:12',
    'admin',
    'INSERT mantenimiento',
    '25600 2023-05-12 dfghdh'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:22:14',
    'admin',
    'DELETE mantenimientos del aton',
    '25600'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:23:05',
    'admin',
    'UPDATE balizamiento',
    '25650 E-0198 semaforo Si SCADAGpD(3) 20 L0.255+Oc3.745+L0.255+Oc3.745+L0.255+Oc11.74'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:23:13',
    'admin',
    'UPDATE balizamiento',
    '25650 E-0198 faro Si SCADAGpD(3) 20 L0.255+Oc3.745+L0.255+Oc3.745+L0.255+Oc11.74'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:25:00',
    'admin',
    'INSERT balizamiento',
    'prueba'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:25:28',
    'admin',
    'UPDATE localizacion',
    'prueba 0 0 0 39º 25.500\' N 0º 12.567\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:25:48',
    'admin',
    'UPDATE balizamiento',
    'prueba 0 0 0GdD(4)R 44 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:46:10',
    'admin',
    'DELETE aton ',
    'prueba'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 19:46:25',
    'admin',
    'DELETE aton ',
    'batea2'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:06:43',
    'tecnico',
    'INSERT fotografia',
    '25545'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:09:47',
    'tecnico',
    'UPDATE usuarios',
    'Se le añade permisos de admin'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:10:04',
    'tecnico',
    'UPDATE balizamiento',
    '25460 E-0190 Baliza Torre troncopiramidal verde blanca telkGpD(2)V 7 L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:10:11',
    'tecnico',
    'UPDATE observaciones',
    '25460 Estructura de poliesterr'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:11:27',
    'tecnico',
    'UPDATE mantenimiento',
    '25460 2023-05-10 prueba2'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:11:36',
    'tecnico',
    'UPDATE mantenimiento',
    '25460 2023-05-10 prueba2222'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:11:49',
    'tecnico',
    'UPDATE lampara',
    '25460 1 0 0 0 0 0 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:12:01',
    'tecnico',
    'INSERT fotografia',
    '25460'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:12:22',
    'admin',
    'DELETE fotografia',
    '25460'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:12:33',
    'admin',
    'UPDATE balizamiento',
    '25460 E-0190 Baliza Torre troncopiramidal verde blanca telecontrol GpD(2)V 7 L0,5 oc1,5 L0,5 oc4,5'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:12:56',
    'admin',
    'INSERT balizamiento',
    'prueba'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:13:09',
    'admin',
    'UPDATE localizacion',
    'prueba 0 0 0 39º 26.724\' N 000º 17.292\' W'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:13:16',
    'admin',
    'UPDATE balizamiento',
    'prueba 0 0 0GdD(4)A 0 0'
  );
INSERT INTO
  `logs` (`fecha`, `usuario`, `accion`, `observacion`)
VALUES
  (
    '2023-05-24 20:18:27',
    'admin',
    'DO backup',
    'nuevo backup'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mantenimiento
# ------------------------------------------------------------

INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1,
    '25530',
    '2004-06-01',
    'Instalación linterna nueva, Batería antigua (08/03/1999)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    2,
    '25530',
    '2008-06-01',
    'Cambio de cargador rectificador (avería)   '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    3,
    '25530',
    '2010-09-25',
    'Instalación de Litepipes de leds '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    4,
    '25530',
    '2014-04-14',
    'Cambio de batería (Fullmen Gel 110 amp/h del año 2009)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (5, '25530', '2016-11-10', 'Cambio de LDR.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    6,
    '25530',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    7,
    '25530',
    '2017-07-10',
    'Se sustituyen las dos LDR y se sanea la instalación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    8,
    '25530',
    '2020-02-26',
    'Se reinicia MOSCAD reestableciendose comunicaciones con el SCADA.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    9,
    '25530',
    '2021-04-14',
    'Se sustituye la batería por una de SONNENSCHEIN SB12 de100Ah.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    10,
    '25545',
    '2004-06-02',
    'Instalación equipo nuevo Batería antigua (17/02/1999)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    11,
    '25545',
    '2009-04-02',
    'Instalación de Litepipes Cambio de baterías (Linterna y Litepipe)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    12,
    '25545',
    '2012-11-08',
    'Sustitución de una LDR, LDR averiada'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    13,
    '25545',
    '2016-08-05',
    'Linterna apagada. Se repara en el mismo día.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    14,
    '25545',
    '2016-09-12',
    'Se sustituye LDR y se modifica posición para evitar deslumbramientos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    15,
    '25545',
    '2016-11-15',
    ' Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    16,
    '25545',
    '2019-10-11',
    'Se tuvo que resetear MOSCAD ya que se quedó encendida permanentemente.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    17,
    '25545',
    '2019-11-27',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    18,
    '25545',
    '2020-04-03',
    'Se reinicia MOSCAD reestableciendose comunicaciones con el SCADA.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    19,
    '25545',
    '2021-03-26',
    'Se elimina cuadro en completo desuso.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    20,
    '25545',
    '2021-04-14',
    'Se sustituye la batería por una de SONNENSCHEIN SB12 de100Ah.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    21,
    '25552',
    '2005-11-21',
    'Instalación en edificio caseta de bombas'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    22,
    '25552',
    '2010-05-21',
    'Instalación boya proviSíonal por obras   Se anula la baliza'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    23,
    '25552',
    '2011-08-12',
    'Instalación torre TPS Maqu. Val. En ángulo nuevo muelle'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    24,
    '25552',
    '2014-10-13',
    'Reparación del transceptor de radio Motorola GP 340 (Anfer) '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    25,
    '25552',
    '2014-10-13',
    'Restauración del firmvare de la RTU Motorola MOSCAD (Anfer)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    26,
    '25552',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    27,
    '25552',
    '2019-11-26',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    28,
    '25552',
    '2022-06-02',
    'Se cambia batería y borneros + limpieza'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    29,
    '25554',
    '2003-12-04',
    'Instalación boya pequeña BKL 120 Marca la bifurcación del club náutico'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    30,
    '25554',
    '2004-03-04',
    'Reparación del anclaje. Boya a la deriva'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    31,
    '25554',
    '2009-04-17',
    'Instalación boya grande usada BDL120 Sustit. a la antigua y más pequeña'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    32,
    '25554',
    '2011-10-26',
    'ReviSíón general de la boya. Todo correcto'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    33,
    '25554',
    '2013-05-21',
    'Revisión general. Flotador oxidado y un panel roto'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    34,
    '25554',
    '2013-07-15',
    'Sustitución de la óptica por deterioro'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    35,
    '25554',
    '2013-07-15',
    'Sustitución del destellador y la LDR por avería '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    36,
    '25554',
    '2013-10-11',
    'Sustitución de la boya en servicio por otra nueva de MSM (mod. EBM 15) y linterna (mod. MCL 160) con batería de 6 volt. Y 12 amp/hora.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    37,
    '25554',
    '2014-08-21',
    'Revisión general y limpieza (todo bien).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    38,
    '25554',
    '2015-09-07',
    'Revisión general (todo bien).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    39,
    '25554',
    '2016-08-10',
    'Revisión general (buen estado).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    40,
    '25554',
    '2019-04-10',
    'Se sacó para revisión. En sustitución se coloca una provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    41,
    '25554',
    '2019-05-17',
    'Se recoloca la boya original en su sitio, repintada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    42,
    '25554',
    '2020-10-05',
    'Se montan nuevos ánodos de sacrificio'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    43,
    '25554',
    '2021-09-29',
    'Se realiza revisión anual con personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    44,
    '25554',
    '2021-11-11',
    'Se montan dos ánodos de sacrificio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    45,
    '25554',
    '2022-09-05',
    'Wartsila realiza la revisión anual de la boya.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    46,
    '25555',
    '2005-10-27',
    'Instalación BDL 120 LMV'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    47,
    '25555',
    '2007-08-14',
    'Cambio de óptica. Rajas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    48,
    '25555',
    '2011-02-25',
    'Cambio de óptica. Rajas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    49,
    '25555',
    '2012-12-05',
    'Cambio de batería. Se instala una batería de gel de 100 amp/h'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    50,
    '25555',
    '2016-02-22',
    'Sustitución de la fuente de alimentación por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    51,
    '25555',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    52,
    '25555',
    '2018-05-31',
    'Se retira la linterna para reformar la señal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    53,
    '25555',
    '2018-06-06',
    'Se termina la reforma y se vuelve a instalar la linterna en su sitio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    54,
    '25555',
    '2018-06-19',
    'Se apaga por la noche y se da de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    55,
    '25555',
    '2018-06-20',
    'Se sustituye el equipo luminoso por avería del termistor. Se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    56,
    '25555',
    '2019-06-25',
    'Se sustituye la batería por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    57,
    '25560',
    '2005-10-27',
    'Instalación BDL 120 LMV'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    58,
    '25560',
    '2007-08-11',
    'Cambio de óptica Grietas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    59,
    '25560',
    '2009-11-17',
    'Cambio de óptica Grietas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    60,
    '25560',
    '2012-03-01',
    'Cambio de óptica Grietas longitudinales en toda la superficie'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    61,
    '25560',
    '2013-01-18',
    'Cambio de batería (Gel 120 amp/h - año 2009)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    62,
    '25560',
    '2013-01-18',
    'Cambio de destellador DES 22 por fallo'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (63, '25560', '2013-01-18', 'Cambio de LDR');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    64,
    '25560',
    '2013-09-13',
    'Cambio de tarjeta reguladora TR 355 del cargador de baterías.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    65,
    '25560',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    66,
    '25560',
    '2018-05-31',
    'Se retira la linterna para reformar la señal'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    67,
    '25560',
    '2018-06-06',
    'Se termina la reforma y se vuelve a instalar la linterna en su sitio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    68,
    '25560',
    '2020-02-14',
    'Aparece con grafities, limpiando y parcheando a spray para obtener un color homogeneo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    69,
    '25563',
    '2015-08-05',
    'Se instala nueva baliza y se comunica a SASEMAR y PPEE'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    70,
    '25563',
    '2019-11-27',
    'Se repinta todo el soporte.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    71,
    '25563',
    '2020-06-04',
    'Pantalan acordonado por policia portuaria, y pivote de la baliza doblado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    72,
    '25564',
    '2015-08-05',
    'Se instala nueva baliza y se comunica a SASEMAR y PPEE'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    73,
    '25564',
    '2019-11-27',
    'Se repinta todo el soporte.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    74,
    '25565',
    '2005-03-30',
    'Instalación BKL 120 en poste verde'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    75,
    '25565',
    '2008-06-24',
    'Cambio de linterna por avería. Se repara la retirada'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    76,
    '25565',
    '2009-02-03',
    'Cambio de destellador  por avería'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    77,
    '25565',
    '2010-02-05',
    'Instalación BDL 120 en torre troncopiramidal'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (78, '25565', '2013-09-18', 'Cambio de LDR');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    79,
    '25565',
    '2015-08-05',
    'Cambio de característica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    80,
    '25565',
    '2016-09-10',
    'Se sustituye disco de leds en la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    81,
    '25565',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    82,
    '25565',
    '2016-12-30',
    'Se sustituye el regulador averiado y la batería descargada por otra usada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    83,
    '25565',
    '2019-01-31',
    'Cambio del regulador solar por avería'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    84,
    '25565',
    '2019-11-28',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    85,
    '25570',
    '2007-01-25',
    'Instalación BKL 120 en poste rojo'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    86,
    '25570',
    '2010-05-26',
    'Cambio de linterna completa'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    87,
    '25570',
    '2011-10-26',
    'Instalación BDL 120 en torre troncopiramidal nueva'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    88,
    '25570',
    '2016-11-15',
    'Se pinta la torre dejando el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (89, '25570', '2017-05-12', 'Se sustituye la LDR.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    90,
    '25570',
    '2017-05-12',
    'Se sustituye la torre entera por oxidación de la base.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    91,
    '25650',
    '2019-01-03',
    'Se reactiva la alarma de intrusión del faro'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    92,
    '25650',
    '2019-03-11',
    'Se procedio al cierre y bloqueo de puertas de acceso a almacenes en el faro. En breve se instalaran verjas en las ventanas'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    93,
    '25650',
    '2019-04-23',
    'Se ajusta la puerta de acceso al Faro'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    94,
    '25650',
    '2019-04-23',
    'SOLER realiza la revisión del sistema de detección de incendios.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (95, '25650', '2019-05-07', 'Visita de Kgest');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    96,
    '25650',
    '2019-05-14',
    'Se actualiza el sistema de alarmas y se integra con una aplicacion movil SPC connect'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    97,
    '25650',
    '2019-05-14',
    'Se sustituyen las pilas de la puerta de acceso al faro'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    98,
    '25650',
    '2019-05-21',
    'Personal de la clínica acuden junto con el técnico de sonido para la medición de ruidos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    99,
    '25650',
    '2019-05-21',
    'Se resuelve a traves del SAUSI avería en el ordenador de la oficina del faro. Se le sustituyó la RAM.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    100,
    '25650',
    '2019-06-04',
    'Puesta en marcha nueva Camara en la linterna del faro.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    101,
    '25650',
    '2019-06-12',
    'Se realiza supervision del sistema AIS bajo petición del CCI.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    102,
    '25650',
    '2019-06-20',
    'El sistema AIS tiene un fallo en el cable de alimentacion. Está desconectado. A la espera de recibir cable.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    103,
    '25650',
    '2019-07-09',
    'Se reactiva el funcionamiento tanto de la camara de la sala de máquinas como de la camara de la linterna, funcional a través del SCADA.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    104,
    '25650',
    '2019-07-17',
    'Guipons realiza la revisión de extintores.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    105,
    '25650',
    '2019-08-06',
    'Explota la batería del sistema de comunicaciones de las emisoras ubicada en la camara de servicio. Se retira.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    106,
    '25650',
    '2019-08-06',
    'La bateria del sistema de comunicacion de emisoras ha explotado. Se avisa a comunicaciones.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    107,
    '25650',
    '2019-08-15',
    'Se sustituye la fuente de alimentación del sistema de comunicación de las emisoras.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    108,
    '25650',
    '2019-08-20',
    'Se instala verja como refuerzo antivandalico en ventanas exteriores del lado mar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    109,
    '25650',
    '2019-08-27',
    'El grupo electrogeno no entra en funcionamiento. Se sospecha de la bateria, y se pone a cargar para ir descartando posibilidades.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    110,
    '25650',
    '2019-08-28',
    'Se sustituye la bateria del grupo electrógeno por una nueva. VARTA 720A 90Ah'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    111,
    '25650',
    '2019-09-12',
    'Se procede a la sustitución del cable de alimentación del ELMAN ABT 1103, pues el conector se encuentra averiado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    112,
    '25650',
    '2019-09-20',
    'KGEST realiza la toma de muestras de calidad del aire interior (CAI).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    113,
    '25650',
    '2019-09-30',
    'Visita del responsable de Gestión Documental. Se acuerda llevar los documentos historicos a la biblioteca de la APV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    114,
    '25650',
    '2019-10-08',
    'Visita Concejales del ayuntamiento de Cullera.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    115,
    '25650',
    '2019-10-23',
    'Guipons hace la revisión del material contra incendios.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    116,
    '25650',
    '2019-10-23',
    'Se instalan las nuevas puertas de Almacen y tercera vivienda, a cargo de la empresa Nuñez-Armando.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    117,
    '25650',
    '2019-11-12',
    'Se repara fallo de foto-célula interior (lámparas). Conector flojo, provocaba apagado del faro.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    118,
    '25650',
    '2020-01-30',
    'Guipons hace la revisión de extintores.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    119,
    '25650',
    '2020-02-05',
    'Se acude con personal de la clinica y subcontrata para toma de muestras de calidad.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    120,
    '25650',
    '2020-02-25',
    'Mecanicos instalan nueva pieza anti-retorno y reductor de caudal de agua.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    121,
    '25650',
    '2020-03-11',
    'Kgest toma muestras de calidad de ambiente interior de las instalaciones del faro.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    122,
    '25650',
    '2020-03-12',
    'Se inician las obras de conservacion y mantenimiento del faro.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    123,
    '25650',
    '2020-03-27',
    'Se tiende una nueva linea desde la camara de servicio del faro hasta el cuadro general de electricidad. Se separa en dos lineas &quot;repetidor de telecomunicaciones&quot; y &quot;Moscad balizamiento&quot;.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    124,
    '25650',
    '2020-04-16',
    'Se retoman las obras en el faro por parte de PAVASAL.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    125,
    '25650',
    '2020-04-21',
    'Se rearma el magnetotermico de la bomba del pozo, la hizo saltar los servicios conectados en el almacen para los albañiles.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    126,
    '25650',
    '2020-04-30',
    'Se reinicia el SAI del faro, reestableciendose las comunicaciones de dicho elemento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    127,
    '25650',
    '2020-05-07',
    'Mecanicos cambian las bisagras de la puerta de acceso peatonal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    128,
    '25650',
    '2020-06-03',
    'PAVASAL finaliza las obras de restauración en el faro.(Pozo incluido)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    129,
    '25650',
    '2020-06-03',
    'Soler realiza la revisión de los sistemas de detección de incendios.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    130,
    '25650',
    '2020-06-09',
    'No se puede acceder remotamente al PC del AIS. Se resetea y se reestablecen las comunicaciones.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    131,
    '25650',
    '2020-07-01',
    'Guipons hace la revisión de los extintores. Kgest hace la recogida de muestras en agua potable.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    132,
    '25650',
    '2020-07-06',
    'Pintores Nuñez inician trabajos de impermeabilizar terrazas y pintar fachada principal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    133,
    '25650',
    '2020-07-07',
    'Se retira un trozo de unos 3KG de la cornisa de la terraza superior del faro (linterna) por riesgo de desplome. En dicha operación se rompen varias tejas por el desplome de piezas menores.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    134,
    '25650',
    '2020-07-13',
    'Nuñez acaba con los trabajos de pintura. Se impermeabilizan las dos terrazas y se pinta la fachada principal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    135,
    '25650',
    '2020-07-14',
    'Se rearma el diferencial que protege la linea del repetidor de las señales maritimas de Gandia.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    136,
    '25650',
    '2020-08-11',
    'Se sustituyen las lamparas del alumbrado exterior.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    137,
    '25650',
    '2020-08-13',
    'Se revisa el SAI, que entra en by-pass interno.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    138,
    '25650',
    '2020-09-22',
    'Visita Carlos Kgest para medicion ambiental.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    139,
    '25650',
    '2020-12-15',
    'El grupo electrógeno  no arranca, posible fallo del cargador de batería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    140,
    '25650',
    '2020-12-17',
    'Se instala de forma provisional un cargador externo y queda en funcionamiento. Aviso al T. Mecánico.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    141,
    '25650',
    '2020-12-31',
    'El faro está apagado por fallo de la LDR interna, la BAEM no funciona.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    142,
    '25650',
    '2020-12-31',
    'Tras la intervención del técnico de guardia se consigue activar de manera permanente la BAEM.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    143,
    '25650',
    '2021-01-04',
    'Adrián se persona en el faro para intentar dejar en funcionamiento en modo automático el mismo, no lo consigue y se manda correo para solicitar la intervención de SICA.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    144,
    '25650',
    '2021-01-08',
    'Tras la intervención de SICA y con repuestos del antiguo faro de Valencia se consigue reparar la averia y el faro queda en funcionamiento. faltan solucionar algunos flecos como que la baliza auxiliar no funciona de forma automática (comprobar LDR).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    145,
    '25650',
    '2021-02-03',
    'Se sustituye la LDR a la BAEM. se contacta con Sica para rematar ajustes y sustituir sonda del deposito del grupo electrógeno.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    146,
    '25650',
    '2021-02-12',
    'Sica reconfigura PLC para el correcto funcionamiento de la BAEM a traves de su propia LDR. Queda en funcionamiento definitivo y correcto.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    147,
    '25650',
    '2021-03-02',
    'Se sustituyeron las pilas de la puerta de acceso. Pilas 3,6V del lado sensor barrera.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    148,
    '25650',
    '2021-06-02',
    'Personal del taller de fluidos realizan trabajos en la acometida de agua, solventando un problema de caudal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    149,
    '25650',
    '2021-06-03',
    'Se sustituye el SAI, a falta de configuración el proximo martes 8 de junio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (150, '25650', '2021-07-29', 'Falla SAI');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    151,
    '25650',
    '2021-09-17',
    'Se sustituye por garantía el SAI por uno nuevo, quedando la instalación protegida.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    152,
    '25650',
    '2022-09-08',
    'Se cambia la batería del grupo electrógeno. Se rellena liquido refrigerante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    153,
    '25660',
    '2020-04-22',
    '5 Se le pinta el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    154,
    '25665',
    '2020-01-30',
    '5 Un golpe de mar la derriva y queda fuera de servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    155,
    '25665',
    '2020-02-08',
    '6 Se retira y queda fuera de servicio por obras en el espigón.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    156,
    '25665',
    '2020-02-11',
    '6 Se restituye el sevicio aunque las obras no han finalizado. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    157,
    '25665',
    '2020-02-23',
    '5 Se instala un espeque provisional y se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    158,
    '25665',
    '2020-04-22',
    '5 Se monta el espeque rojo definitivo con el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    159,
    '25700',
    '2019-11-26',
    'Avería en la rotación.  Funciona con la B.E.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    160,
    '25700',
    '2019-11-27',
    'Se fuerza el encendido con motor dos y queda en funcionamiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    161,
    '25700',
    '2019-11-28',
    'VARESER comienza las obras para instalar agua potable en el faro.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    162,
    '25700',
    '2020-01-30',
    'Durante todo el mes de enero, se suceden averías por fallos de rotación en los dos motores, pido presupuesto para que la empresa instaladora revise la linterna principal (temporal gloria golpea con mucha fuerza). La baliza auxiliar cumple.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    163,
    '25700',
    '2020-05-04',
    'Marc Martí y Oscar Aponte de la La empresa MESEMAR revisa la linterna y la programación del faro (seguimos confinados por el COVID19).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    164,
    '25700',
    '2020-05-22',
    'Los mismos técnicos de MESEMAR se personan en el faro para reparar los problemas detectados en la revisión anterior. Los trabajos que realizan consisten en la sustitución del sensor de rotación averiado e instalación de uno nuevo, diametralmente opue'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    165,
    '25700',
    '2020-10-27',
    '•\tDurante todo el mes de enero, se suceden averías por fallos de rotación en los dos motores, pido presupuesto para que la empresa instaladora revise la linterna principal (temporal gloria golpea con mucha fuerza). La baliza auxiliar cumple.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    166,
    '25700',
    '2020-11-05',
    'Tras dos días de tormentas no hay más remedio que conectar el faro a la red 230v ca. La tensión de baterías cae por debajo de 23v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    167,
    '25720',
    '2004-09-16',
    'Se instala tele-control de la baliza y dos lite-pipe.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    168,
    '25720',
    '2007-01-29',
    'Avería de la fuente de alimentación montada por ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    169,
    '25720',
    '2007-12-04',
    'reparar avería en lite-pipe.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    170,
    '25720',
    '2008-01-15',
    'Sustituir y repara fuente de alimentación 220/12v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    171,
    '25720',
    '2008-04-14',
    'Se pinta baliza Verde-blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    172,
    '25720',
    '2010-03-24',
    'Se sincroniza con la verde del martillo 25.721'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    173,
    '25720',
    '2011-05-04',
    'Sustituir fuente de alimentación por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    174,
    '25720',
    '2012-01-17',
    'Fallo de la linterna por tormenta, cambio de fuente de alimentación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    175,
    '25720',
    '2013-11-08',
    'Instalación de dos puntos de luz.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    176,
    '25720',
    '2014-11-21',
    'Se sincronizan los lite-pipes con la linterna principal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (177, '25720', '2015-03-31', 'Se repinta la baliza.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    178,
    '25720',
    '2015-04-01',
    'Se repara la escotilla hidráulica de acceso a la cofa (taller mécanico).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (179, '25720', '2018-10-23', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    180,
    '25720',
    '2018-11-20',
    'Se sustituye la batería de la linterna principal por avería (cortocircuitada).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    181,
    '25720',
    '2020-06-01',
    'Cambio de LDR por mal funcionamiento'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    182,
    '25720',
    '2021-08-04',
    'Se retira cuadro de comunicaciones Red Industrial y estaciones meteorológicas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    183,
    '25720',
    '2021-12-20',
    'Fuente alimentacion en averia. Se queda en funcionamiento con la segunda salida de la fuente de alimentación principal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    184,
    '25720',
    '2022-10-11',
    'Se sustituye la LDR frontal (Orientacion S)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    185,
    '25721',
    '2007-09-27',
    'Se instala baliza con una linterna nuestra (APV) porque Enrique no tenía.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    186,
    '25721',
    '2008-04-04',
    'Se instala la nueva linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    187,
    '25721',
    '2010-03-24',
    'Se sincroniza con la 25.720'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    188,
    '25721',
    '2010-09-22',
    'Se descarga la batería por fallo de red 230v'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    189,
    '25721',
    '2013-11-08',
    'Sustitución del cuadro de acometida e instalación de punto de luz.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    190,
    '25721',
    '2015-04-01',
    ' Se repinta la torre de la baliza dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    191,
    '25721',
    '2016-09-27',
    ' Sustitución de la LDR nº 2 por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (192, '25721', '2018-10-16', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    193,
    '25721',
    '2020-05-29',
    'Cambio de los 8 niveles de leds y de la óptica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    194,
    '25721',
    '2022-12-21',
    'Se rearma diferencial del CT (en Grimaldi) y el propio de la baliza, tras aviso del CCE.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    196,
    '25730',
    '2004-04-16',
    'Se instala tele-control y sustituye la linterna de Balizamar por una BDL 120'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    197,
    '25730',
    '2006-12-12',
    'Se sustituye por reparación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    198,
    '25730',
    '2007-05-14',
    'Se fondea otra vez la boya original reparada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    199,
    '25730',
    '2008-01-04',
    'Sustituir linterna rota.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    200,
    '25730',
    '2008-05-15',
    'Reparar barandilla rota por siniestro.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    201,
    '25730',
    '2008-12-17',
    'Dos paneles rotos por temporal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    202,
    '25730',
    '2010-01-26',
    'Paneles rotos por temporal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    203,
    '25730',
    '2010-02-08',
    'Se cambia la característica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (204, '25730', '2010-10-28', 'Se sustituye la boya');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    205,
    '25730',
    '2010-11-22',
    'Alarma por fallo de comunicación del GPS (Se reinicializa). Fallos de comunicaciones por exceso de transmisiones. ANFER'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    206,
    '25730',
    '2011-01-03',
    'Se repara alarma de GPS (fallo de posicionamiento) ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    207,
    '25730',
    '2012-04-03',
    'Se sustituye para reparar paneles solares y mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    208,
    '25730',
    '2012-05-04',
    'Se sustituye un panel destruido por la tormenta del Viernes día 28/04/12.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    209,
    '25730',
    '2012-05-31',
    'Se fondea de nuevo pintada con paneles nuevos y tres baterías nuevas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    210,
    '25730',
    '2016-06-06',
    'Se sustituye la puerta del armario exterior y la fotocélula nº2.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    211,
    '25730',
    '2016-07-26',
    'Avería por batería baja. Se revisa la instalación y se deja operativa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    212,
    '25730',
    '2017-01-31',
    'Se saca a tierra por mantenimiento (eléctrico ,mecánico y pintura)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    213,
    '25730',
    '2017-07-05',
    'Una vez finalizado su mantenimiento se fondea de nuevo en su ubicación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    214,
    '25730',
    '2017-07-10',
    'Se suelta de su anclaje el PLC dando fallo, se sujeta con bridas. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    215,
    '25730',
    '2020-01-22',
    'Queda a la deriva y se localiza en la playa (Pinedo) sin paneles, ni linterna, ni baterías.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    216,
    '25730',
    '2020-01-24',
    'Se retira de la playa para su reparación y se deposita en la campa de la Dársena de Servicios.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (217, '25730', '2020-02-10', 'Se repinta la boya.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    218,
    '25730',
    '2020-02-17',
    'Se fondea la boya de sustitución sin tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    219,
    '25730',
    '2021-06-11',
    'Se suelda ánodo nuevo de sacrificio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    220,
    '25730',
    '2022-06-21',
    'Se sustituye la boya al reemplazarla por la nueva EBM22-HV'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    221,
    '25730',
    '2022-07-29',
    'Se corrige la información del AIS. De ser aguas navegables se reconfigura a Cardinal Este'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    222,
    '25740',
    '2004-04-16',
    'Se instala el tele-control y se sustituye la linterna de Balizamar por una BDL 120 de ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    223,
    '25740',
    '2006-05-12',
    'Siniestro de la boya por temporal se recupera en la playa de Pinedo y se fondea una sustituta con las mismas características en su lugar el día 21/06/06.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    224,
    '25740',
    '2007-06-12',
    'Se sustituye la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    225,
    '25740',
    '2008-09-23',
    'Sustituir tres baterías por avería, dañadas por temporal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    226,
    '25740',
    '2008-12-10',
    'Sustituir linterna por condensación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    227,
    '25740',
    '2009-10-05',
    'Sustituir PLC por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    228,
    '25740',
    '2009-12-14',
    'Sustituir boya por mantenimiento. Instalación del telecontrol en boya sustituta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    229,
    '25740',
    '2010-01-15',
    'Sustituir la marca de tope.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    230,
    '25740',
    '2010-01-28',
    'Emplazar Moscad, que se había soltado y daba fallos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    231,
    '25740',
    '2011-04-08',
    'Sustituir boya por mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    232,
    '25740',
    '2012-03-14',
    'Repara fallo periódico de comunicaciones con GPS. ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    233,
    '25740',
    '2013-07-08',
    'Sustituir baterías del año 2005.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    234,
    '25740',
    '2016-10-24',
    'Se saca a tierra por mantenimiento (batería baja)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    235,
    '25740',
    '2016-12-13',
    'Se fondea de nuevo la boya y se retira la provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    236,
    '25740',
    '2017-03-08',
    'Volvemos a sacar la boya para reparar los paneles solares (temporal)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    237,
    '25740',
    '2017-05-18',
    'Se fondea de nuevo una vez reparada y se retira la provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    238,
    '25740',
    '2019-04-22',
    'Varada en playa del Saler debido a fuerte temporal'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    239,
    '25740',
    '2019-04-30',
    'Se fondea la boya de sustitución (adjunta en fotos)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    240,
    '25740',
    '2019-06-05',
    'Se recupera la boya varada en la playa de pinedo'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    241,
    '25740',
    '2019-08-22',
    'Se sustituye la antigua linterna BDL120 por la nueva MCL330. Además se refuerza el fondeo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    242,
    '25740',
    '2019-08-22',
    'Tambien se le sustituye el flotador por uno de mayores dimensiones.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    243,
    '25740',
    '2022-06-21',
    'Se sustituye la boya completa por la nueva EBM-HV 30y linterna MCL360 XL'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    244,
    '25740',
    '2022-07-29',
    'Se reconfigura informacion AIS. De ser lateral de estribor, pasa a ser lateral de babor.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    245,
    '25761',
    '2004-04-16',
    'Se instala tele-control y se sustituye linterna de Balizamar  por BDL 120 de ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    246,
    '25761',
    '2008-11-21',
    'Se sustituye la boya por una provisional por labores de mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    247,
    '25761',
    '2012-10-05',
    'Se sustituye la boya por que se detecta en la revisión periódica que no tiene paneles solares, se da de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    248,
    '25761',
    '2013-02-15',
    'Una vez reparada se repone de nuevo y se retira la provisional (baterías nuevas y paneles nuevos)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    249,
    '25761',
    '2013-03-12',
    'Se sincroniza con la boya 25765. (ANFER)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    250,
    '25761',
    '2014-05-06',
    'Sustituida foto-célula por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    251,
    '25761',
    '2014-08-05',
    'Fallo de sincronia con la 25765. Se repara reseteando la RTU.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    252,
    '25761',
    '2014-09-07',
    'Falla una fotocélula dejando encendida la boya'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    253,
    '25761',
    '2014-09-08',
    'Se sutituye la fotocelula nº1 y se verifica funcionamiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    254,
    '25761',
    '2014-10-02',
    'Se sustituye el PLC (ANFER) por que los problemas de LDR persistian. OK'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    255,
    '25761',
    '2015-11-09',
    'Se sustituye la boya metálica por una EMB 2.2 reformada. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    256,
    '25761',
    '2018-01-30',
    'Se sustituye la foto-célula izquierda.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    257,
    '25761',
    '2020-10-23',
    'Reponemos ánodos de sacrificio por desgaste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    258,
    '25761',
    '2021-11-11',
    'Se coloca tramo de cadena de 5m.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    259,
    '25761',
    '2022-01-28',
    'Se le sustituye la LDR izquierda'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    260,
    '25761',
    '2022-08-02',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    261,
    '25761',
    '2022-09-02',
    'Se sustituyen ánodos de sacrificio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    262,
    '25761',
    '2022-11-30',
    'Se cambia la LDR (derecha) de la linterna'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    263,
    '25765',
    '2004-04-16',
    'Se instala tele-control y se sustituye linterna de Balizamar por BDL 120 de ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    264,
    '25765',
    '2008-06-09',
    'Se sustituye por una provisional por labores de mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    265,
    '25765',
    '2010-10-21',
    'Se instalan nuevas baterías por averia.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    266,
    '25765',
    '2012-02-27',
    'Fallos de comunicaciones por exceso de transmisiones. ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    267,
    '25765',
    '2012-09-14',
    'Se recorta el radio de borneo de la boya acortando la cadena 5m.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    268,
    '25765',
    '2013-03-12',
    'Se sincroniza con la boya 25761. (ANFER)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    269,
    '25765',
    '2014-09-03',
    'Se recupera la marca de tope del fondo marino, rota por la base y se instala de nuevo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    270,
    '25765',
    '2014-09-05',
    'Fallo de sincronia con la 25761. Se repara reseteando la RTU.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    271,
    '25765',
    '2015-10-08',
    'Se sustituye la boya metálica por una EMB 2.2 reformada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    272,
    '25765',
    '2019-08-14',
    'Se sustituye el flotador por degradación del original.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    273,
    '25765',
    '2021-08-27',
    'Se da de baja por fallo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    274,
    '25765',
    '2021-08-31',
    'Se sustituyen las baterias y el regulador. Se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    275,
    '25765',
    '2021-11-11',
    'Se coloca tramo de cadena de 5m.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    276,
    '25765',
    '2021-11-11',
    'Se sustituyen los dos ánodos de sacrificio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    277,
    '25765',
    '2022-08-05',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    278,
    '25768',
    '2009-11-20',
    'Se fondea nueva boya de bifurcación por disminución de calado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    279,
    '25768',
    '2010-04-26',
    'Se sustituye la boya (foto).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    280,
    '25768',
    '2015-10-30',
    'Se sustituye el tren de fondeo completo por desgaste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    281,
    '25768',
    '2018-02-06',
    'Se saca a tierra por mantenimiento. Se le cambia la batería a la baliza 6v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    282,
    '25768',
    '2018-02-27',
    'Se fondea de nuevo en su posición, limpia y pintada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    283,
    '25768',
    '2020-07-23',
    'Se realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    284,
    '25768',
    '2022-02-02',
    'Se cambia la caracteristica de L0.5 oc1 L0.5 oc3 L0.5 oc9 a L0.6 oc0.6 L0.6 oc1.8 L0.6 oc5.4'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    285,
    '25768',
    '2022-08-03',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    286,
    '25774',
    '2007-01-15',
    'El taller repara la puerta de acceso a la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    287,
    '25774',
    '2007-10-14',
    'Avería por fallo de red220v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    288,
    '25774',
    '2008-02-21',
    'Pintado de la torre Rojo-blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    289,
    '25774',
    '2009-02-15',
    'Instalación de una baliza lineal MLP 3000 (Mesemar).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    290,
    '25774',
    '2010-09-15',
    'Se incorpora al tele-control la baliza lineal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    291,
    '25774',
    '2012-11-22',
    'Se monta panel para crear un sector de oscuridad  270º  a  325º (55º)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    292,
    '25774',
    '2013-11-05',
    'Se reinstala el cuadro de acometida y se añade punto de luz'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    293,
    '25774',
    '2014-01-16',
    'Se repara linterna vertical (MSM) sustituye el destellador y lo saca fuera.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    294,
    '25774',
    '2014-01-17',
    'Se repara y se repinta la torre por Dragados'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    295,
    '25774',
    '2014-11-24',
    ' Se sincroniza el lite-pipe con la linterna principal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    296,
    '25774',
    '2015-09-23',
    'Se sustituyen ambas LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    297,
    '25774',
    '2017-12-13',
    'Repintado de la torre manteniendo la base blanca.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    298,
    '25776',
    '2020-08-05',
    'Se cambiaron las dos LDR'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    299,
    '25776',
    '2021-10-14',
    'Se acude a las 22:00 por fallo. Se sustituye un fusible y queda funcionando.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    300,
    '25776',
    '2022-06-21',
    'Se sustituyen las dos LDR'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    301,
    '25776',
    '2022-09-12',
    'Se sustituye la LDR superior.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    302,
    '25777',
    '2010-01-20',
    'Se instala la nueva torre TPS 3.3 (LMV). Total Factura: 28744.80€'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    303,
    '25777',
    '2011-03-09',
    'Se instala telecontrol y se sincroniza con 25776.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    304,
    '25777',
    '2011-05-31',
    'Avería en la fuente de alimentación ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    305,
    '25777',
    '2012-01-17',
    'Avería por tormenta de la fuente de alimentación ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    306,
    '25777',
    '2012-11-18',
    'Avería por tormenta de la fuente de alimentación ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    307,
    '25777',
    '2012-11-21',
    'ANFER sustituye la fuente y conecta la carga directamente a la batería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    308,
    '25777',
    '2013-05-14',
    'Avería en la fuente, se sustituye y se manda a reparar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    309,
    '25777',
    '2013-05-17',
    'Avería en la fuente, se retira se manda a repara y se instala un cargador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    310,
    '25777',
    '2013-11-20',
    'Se reinicia por fallo de comunicación y se restablece el servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    311,
    '25777',
    '2015-04-08',
    'Se repinta la torre de la baliza dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    312,
    '25777',
    '2015-09-24',
    'Se sustituyen ambas LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (313, '25777', '2017-12-12', 'Se repinta la torre');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    314,
    '25777',
    '2019-04-24',
    'Se sustituye la bateria y la fuente de alimentación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (315, '25800', '2004-11-04', 'Se pinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    316,
    '25800',
    '2007-10-22',
    'Se instala nueva torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    317,
    '25800',
    '2007-10-24',
    'Anfer instala el telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    318,
    '25800',
    '2007-12-13',
    'Avería por caída del magneto-térmico de acometida.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (319, '25800', '2009-02-27', 'Pintar torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    320,
    '25800',
    '2010-09-27',
    'Se pinta la torre. (El carbón de la zona obliga a una mayor atención)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    321,
    '25800',
    '2012-04-02',
    ' Se cambia la característ. pasa de CtR a DR. y se comunica oficialmente.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    322,
    '25800',
    '2012-04-02',
    'Se cambia la característica que pasa de Ct. a DV 3 segundos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    323,
    '25800',
    '2012-05-11',
    ' Magneto-térmico de acomet. averiado por filtración de agua, se sustituye.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    324,
    '25800',
    '2013-11-06',
    'Se sustituye cuadro de acometida y se instala pantalla de fluorescentes.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    325,
    '25800',
    '2015-05-07',
    'Se repinta toda la señal, dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    326,
    '25800',
    '2015-11-17',
    'Se sustituyen los cierres y el candado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    327,
    '25800',
    '2016-02-25',
    'Se sustituye la batería por una usada del 2011 (en buenas condiciones)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    328,
    '25800',
    '2016-04-05',
    'Se sustituyen ambas LDR por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    329,
    '25800',
    '2017-09-05',
    'Se pinta toda la señal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    330,
    '25800',
    '2017-10-31',
    'Se sustituye por rotura, la óptica de la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    331,
    '25800',
    '2018-01-11',
    'Se sustituye el Moscad para restablecer el Tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (332, '25800', '2020-04-21', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    333,
    '25820',
    '2004-06-25',
    'Se sustituye baliza modelo  Balizamar por BDL 120 ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (334, '25820', '2004-11-04', 'Se pinta la torre. ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    335,
    '25820',
    '2007-01-26',
    'Apagada y retirada por obras. Se fondea una boya en su lugar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    336,
    '25820',
    '2009-05-15',
    'Se instala nueva torre TPS 3.3 (LMV)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    337,
    '25820',
    '2009-09-09',
    'Se sincroniza con la boya 25820.1'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    338,
    '25820',
    '2011-03-31',
    'Avería, fallo de la linterna y del sincronismo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    339,
    '25820',
    '2011-05-16',
    'Se instala el Tele-control (ANFER).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    340,
    '25820',
    '2011-06-13',
    'Sincronizar a través del tele-control con la boya 25820.1'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    341,
    '25820',
    '2013-11-07',
    'Instalación de un punto de luz.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    342,
    '25820',
    '2017-09-05',
    'Se pinta toda la señal con el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    343,
    '25820',
    '2019-07-08',
    'Se sustituye la batería y se repone el fusible de 16A de salida de la fuente.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    344,
    '25820.1',
    '2007-01-26',
    'Se fondea de modo provisional por apagado y retirado de la baliza 25.820'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    345,
    '25820.1',
    '2007-03-15',
    'Se desplaza por dragado en la zona.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    346,
    '25820.1',
    '2009-09-09',
    'Se sincroniza con la 25820 LMV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    347,
    '25820.1',
    '2010-08-26',
    'Se sustituye la boya por una nueva tele-controlada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    348,
    '25820.1',
    '2011-06-13',
    'Se sincroniza con la baliza 25820 a través del tele- control, ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    349,
    '25820.1',
    '2011-07-25',
    'Repara fallo de comunicaciones.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    350,
    '25820.1',
    '2011-11-24',
    'Fallo en el destellador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    351,
    '25820.1',
    '2013-03-21',
    'Sustitución de una fotocélula.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    352,
    '25820.1',
    '2018-01-15',
    'Los topográfos toman nueva posición.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    353,
    '25820.1',
    '2020-07-23',
    'Se realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    354,
    '25820.1',
    '2020-09-25',
    'Detectado fallo en la cadena de la durmiente, pendiente de sustitución.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    355,
    '25820.1',
    '2020-10-22',
    'Se repone tramo de cadena desgastada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    356,
    '25820.1',
    '2021-01-11',
    'Boya apagada. Se procede a su sustitución aunque no quedará sincronizada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    357,
    '25820.1',
    '2021-01-15',
    'La boya se ha pintado y se le han sustituido las baterías y los ánodos de sacrificio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    358,
    '25820.1',
    '2021-01-29',
    'Se fondea en su ubicación y se retira la sustituta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    359,
    '25820.1',
    '2022-09-02',
    'Se sustituyen ánodos de sacrificio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (360, '25830', '2004-11-04', 'Se pinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    361,
    '25830',
    '2010-08-26',
    'Se retira la boya de obras 25830.1 fondeada durante la ejecución de las obras.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    362,
    '25830',
    '2010-10-01',
    'Se instala nueva torre TPS 4.3 y se monta el telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    363,
    '25830',
    '2011-08-25',
    'Se sustituyen las dos LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    364,
    '25830',
    '2013-11-22',
    'Anfer repara radio (Etapa de potencia averiada).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    365,
    '25830',
    '2015-04-01',
    'se sustituye la LDR nº 1'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    366,
    '25830',
    '2016-11-08',
    'Se pinta la torre verde con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    367,
    '25830',
    '2018-05-11',
    'Se sustituye una fotocélula por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    368,
    '25830',
    '2019-05-30',
    'Se sustituye fotocélula por avería'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    369,
    '25830',
    '2019-12-09',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    370,
    '25830',
    '2020-09-13',
    'Destruida por accidente de grúa (Se da de baja).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    371,
    '25830',
    '2020-10-07',
    'Instalamos un espeque provisional con baliza autónoma MCL140'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    372,
    '25830',
    '2020-12-07',
    'Mesemar instala nueva torre y baliza MBL 160-2 sincronizada con la 25831.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    373,
    '25831',
    '2019-01-18',
    'Se sustituye el poste acorde a normativa'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    374,
    '25831',
    '2019-12-09',
    'Se repinta todo el soporte.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    375,
    '25831',
    '2020-12-07',
    'Mesemar instala nueva  baliza MCL 200 sincronizada con la 25830.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    376,
    '25840',
    '2004-06-16',
    'Se sustituye linterna Balizamar por BDL 120 de ocho coronas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    377,
    '25840',
    '2007-01-31',
    'Se apaga y se retira por obras. Se fondea una boya en su lugar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    378,
    '25840',
    '2007-03-15',
    'Se desplaza la boya provisional por dragado'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    379,
    '25840',
    '2009-04-08',
    'Se instala nueva torre TPS 3.3 (LMV).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    380,
    '25840',
    '2009-10-27',
    'Se repinta para adecuarse a la nueva resolución, toda roja y se modifican los destellos a GpD (4) R.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    381,
    '25840',
    '2010-03-16',
    'Se instala el tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    382,
    '25840',
    '2011-06-16',
    'Se instala sincronismo con la boya 25840.1 (no está fondeada todavía). 3660€'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    383,
    '25840',
    '2012-06-08',
    'Se sustituyen las LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    384,
    '25840',
    '2012-12-04',
    'Se desmonta la linterna para reparar fallos en coronas de leds.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    385,
    '25840',
    '2013-11-04',
    'Se instala punto de luz.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    386,
    '25840',
    '2015-06-04',
    'Se repinta toda la señal, dejando el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    387,
    '25840',
    '2018-10-01',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    388,
    '25840',
    '2020-12-14',
    'Sustitución de las dos LDR por mal funcionamiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    389,
    '25841',
    '2013-02-19',
    'Se fondea y entra en servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    390,
    '25841',
    '2014-12-01',
    'Se monitoriza, se detectan errores y se informa de ellos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    391,
    '25841',
    '2014-12-16',
    'Finalizan trabajos de tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    392,
    '25841',
    '2015-01-05',
    'Se sustituyen las dos baterías.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    393,
    '25841',
    '2015-10-30',
    'Se reponen ánodos de sacrificio, por desgaste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    394,
    '25841',
    '2015-12-21',
    'Se sustituye la fotocélula nº2 y se secan humedades en la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    395,
    '25841',
    '2016-05-16',
    'Se vuelve a abrir para secar la humedad de la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    396,
    '25841',
    '2017-09-21',
    'Se desmonta la linterna para eliminar la humedad.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    397,
    '25841',
    '2018-01-16',
    'Se desplaza a nueva posición.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    398,
    '25841',
    '2018-03-21',
    'Se sustituye por una provisional por mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    399,
    '25841',
    '2018-04-04',
    'Se posiciona de nuevo en su ubicación, sustituida linterna (BDL 120).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    400,
    '25841',
    '2020-10-23',
    'Reponemos ánodos de sacrificio por desgaste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    401,
    '25841',
    '2021-11-11',
    'Se sustituyen los dos ánodos de sacrificio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    402,
    '25841',
    '2022-01-28',
    'Se le sustituye la LDR izquierda'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    403,
    '25841',
    '2022-08-03',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    404,
    '25841',
    '2022-12-23',
    'Se revisa el RTU sin poder repararlo al ser competencia de Anfer'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    405,
    '25842',
    '2021-12-22',
    'Falla la baliza autónoma y se sustituye por una de repuesto.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    406,
    '25842.5',
    '2016-04-08',
    'La boya se suelta de su fondeo habitual  y hay volver a fondearla.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    407,
    '25842.5',
    '2017-03-01',
    'Se fondea una nueva boya luminosa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (408, '25842.5', '2019-04-15', 'Cambio de linterna');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    409,
    '25842.5',
    '2019-04-15',
    'Se sustituye la linterna por una MCL 160 con 5% de divergencia'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    410,
    '25842.5',
    '2020-10-22',
    'Reponemos ánodos de sacrificio por desgaste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    411,
    '25842.5',
    '2021-11-11',
    'Se coloca un tramo de 2m de cadena.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    412,
    '25842.5',
    '2022-08-12',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    413,
    '25843',
    '2014-01-20',
    'Se repinta toda la torre de blanco y rojo.(DRAGADOS)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    414,
    '25843',
    '2017-03-01',
    'Se sustituye la baliza por una boya y se sincroniza con la 25842.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    415,
    '25843',
    '2017-10-11',
    'Se sustituye la boya por una nueva, modelo PBM 18'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (416, '25843', '2021-11-11', 'Se acorta la cadena.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    417,
    '25843',
    '2022-01-28',
    'Marca de tope perdida. Se prepara una encargándola al taller mecánico.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    418,
    '25843',
    '2022-08-12',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    419,
    '25843.5',
    '2017-03-01',
    'Se sustituye por una boya luminosa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    420,
    '25843.5',
    '2022-08-12',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    421,
    '25843.5',
    '2022-09-02',
    'Se sustituyen ánodos de sacrificio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    422,
    '25843.8',
    '2017-03-01',
    'Se fondea por primera vez.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    423,
    '25843.8',
    '2020-10-22',
    'Reponemos ánodos de sacrificio por desgaste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    424,
    '25843.8',
    '2022-08-12',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    425,
    '25843.8',
    '2022-09-02',
    'Se sustituyen ánodos de sacrificio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    426,
    '25844',
    '2009-06-05',
    'Se fondea boya oceanográfica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    427,
    '25844',
    '2009-06-10',
    'Se desplaza  para que no moleste a la navegación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    428,
    '25844',
    '2009-12-17',
    'Se procede a retirar la boya por labores de mantenimiento. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    429,
    '25844',
    '2010-11-26',
    'Se procede a retirar boya por mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    430,
    '25844',
    '2011-05-09',
    'Se sustituye boya por provisional por labores de mantenimiento (fallos en los sensores).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    431,
    '25844',
    '2011-11-04',
    'Baja de la marca por linterna apagada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    432,
    '25844',
    '2011-11-11',
    'Se sustituye la linterna por una auto-alimentada MCL140, por fallo baterías.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    433,
    '25844',
    '2013-01-28',
    'Sustitución de las dos baterías (Marca Ritar 250 Ah.)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    434,
    '25844',
    '2013-06-14',
    'Se saca del agua por decisión tecnica y se comunica su retirada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    435,
    '25844',
    '2013-10-30',
    'SUPRIMIDA DEFINITIVAMENTE'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    436,
    '25850',
    '2008-11-30',
    'Se instala la torre nueva mod TPS33 con baliza LEds 300 de 50w. 19174.80€'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    437,
    '25850',
    '2010-03-26',
    'Se instala el telecontrol'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    438,
    '25850',
    '2014-01-17',
    'Se repinta por DRAGADOS'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    439,
    '25850',
    '2017-03-08',
    'Pavasal cambia la acometida que pasa a tomar corriente del CT Nº1'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    440,
    '25850',
    '2017-08-13',
    'Se repinta toda la baliza'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    441,
    '25850',
    '2020-04-17',
    'Se repinta toda la torre'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    442,
    '25850',
    '2021-06-11',
    'Se sustituye el bloque de 8 discos LED y la óptica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    443,
    '25850',
    '2021-08-24',
    'Se sustituye la bateria por una Formula STar de 155Ah (c100)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    444,
    '25920',
    '2007-06-17',
    'Se instala nueva baliza.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    445,
    '25920',
    '2008-11-29',
    'Sustituyo la batería por una nueva de gel 100 A/h.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    446,
    '25920',
    '2008-12-03',
    'Reparar linterna, numerosos leds fundidos (dos coronas).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    447,
    '25920',
    '2010-06-24',
    'Se instala telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    448,
    '25920',
    '2010-06-30',
    'Se sustituyen las foto-células'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (449, '25920', '2011-12-29', 'Sustituir linterna .');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (450, '25920', '2012-07-12', 'Sustituir batería.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    451,
    '25920',
    '2013-11-04',
    'Se instala pantalla de fluorescentes.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    452,
    '25920',
    '2015-06-24',
    'Se repinta la baliza y se deja el tercio inferior blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (453, '25920', '2018-10-23', 'Se repinta la baliza.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    454,
    '25920',
    '2020-08-06',
    'Fallo rectificador. Se resetea y desaparece el aviso.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    455,
    '25920',
    '2020-08-25',
    'Se sustituye la bateria por una nueva.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    456,
    '25920',
    '2020-08-26',
    'Se sustituye el rectificador, pero sigue dando fallo rectificador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    457,
    '25920',
    '2020-08-31',
    'Tras tres intentos se coloca un rectificador diferente y parece que se resuelve la alarma del SCADA de &quot;Fallo rectificador&quot;.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    458,
    '25920',
    '2022-02-04',
    'Se sustituyen los 8 discos LEDs y las LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    460,
    '25940',
    '2007-10-17',
    'Se instala torre nueva.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    461,
    '25940',
    '2007-10-29',
    'Anfer instala telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    462,
    '25940',
    '2008-11-29',
    'Sustituyo la batería por una nueva de gel 100 A/h.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    463,
    '25940',
    '2010-03-01',
    'Se instala el tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (464, '25940', '2010-11-19', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    465,
    '25940',
    '2012-07-19',
    'Datos de la tensión de baterías erróneos. Anfer repara.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    466,
    '25940',
    '2013-11-04',
    'Se instala pantalla de fluorescentes.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    467,
    '25940',
    '2014-10-01',
    'Se sustituye la batería por una en buen estado (no nueva).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    468,
    '25940',
    '2016-05-16',
    'Una estacha revienta la torre de la baliza. Se encarga una defensa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    469,
    '25940',
    '2016-06-09',
    'El taller instala una defensa para evitar daños por las estachas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    470,
    '25940',
    '2016-09-27',
    'Sustitución de la LDR nº 2 por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    471,
    '25940',
    '2017-12-19',
    'Sustitución de las dos LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (472, '25940', '2018-10-23', 'Se repinta la baliza.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    473,
    '25940',
    '2020-08-14',
    'Se sustituye la LDR 2 (derecha)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    474,
    '25960',
    '2007-03-14',
    'Se instala un panel solar por avería en la acometida eléctrica 230V'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    475,
    '25960',
    '2009-12-10',
    'Se instala el telecontrol'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    476,
    '25960',
    '2010-10-26',
    'Se repinta incluyendo una franja verde y convertirla en marca lateral de bifurcación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    477,
    '25960',
    '2013-11-05',
    'se instala punto de luz'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    478,
    '25960',
    '2014-01-17',
    'Se repinta por DRAGADOS'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (479, '25960', '2017-01-14', 'Se repinta la torre');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    480,
    '25960',
    '2021-07-07',
    'Se sustituye la batería por una de SONNENSCHEIN SB12 de100Ah.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    481,
    '26020',
    '2009-10-19',
    'Se instala nueva baliza cardinal sur. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    482,
    '26020',
    '2010-11-12',
    'Se sustituyen los discos de leds averiados.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    483,
    '26020',
    '2010-12-17',
    'Se sustituye la linterna por una de bajo consumo (led de alta visibilidad)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    484,
    '26020',
    '2013-06-11',
    'Se modifica la marca de tope y se baja el panel solar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    485,
    '26020',
    '2015-06-11',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    486,
    '26020',
    '2018-02-12',
    'Se rompe el soporte de la marca de tope (aviso al taller mecánico).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    487,
    '26020',
    '2018-02-16',
    'Se instala de nuevo la marca de tope reparada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    488,
    '26020',
    '2018-08-29',
    'Se apaga la luz y se repara sustituyendo la batería y el regulador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (489, '26020', '2018-10-18', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    490,
    '26021',
    '2006-09-04',
    'Se retira la torre cuadrangular por obras de ampliación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    491,
    '26021',
    '2006-11-08',
    'Se instala baliza de manera provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (492, '26021', '2009-06-27', 'Se pinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    493,
    '26021',
    '2011-10-06',
    'Se instala nueva torre TPS 3.3. 22199.10€'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    494,
    '26021',
    '2015-06-11',
    'Se repinta la torre verde con la base blanca'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    495,
    '26025',
    '2009-01-09',
    'Se instala nueva torre TPS 3.3 y se retira la boya que se fondeó por obras.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    496,
    '26025',
    '2009-03-04',
    'Se instala escalera de acero inox. Para mejorar acceso.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    497,
    '26025',
    '2015-06-11',
    'Se repinta la torre roja con la base blanca'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (498, '26025', '2018-10-18', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    499,
    '26035',
    '2012-10-18',
    'Sustituir destellador y reprogramar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    500,
    '26035',
    '2016-04-13',
    'Se pinta manteniendo el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (501, '26035', '2018-10-18', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (502, '26041', '2009-06-27', 'Pintado de la torre');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    503,
    '26041',
    '2012-02-02',
    'Cambio de óptica por degradación. O.T. 55/242/2012'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    504,
    '26041',
    '2016-04-13',
    'Se pinta manteniendo el tercio inferior de blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (505, '26041', '2018-10-18', 'Se repinta la torre.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    506,
    '26045',
    '2008-06-25',
    'Sustitución de la batería de gel de 100 A/h.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    507,
    '26045',
    '2010-01-07',
    'Sustitución de la batería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    508,
    '26045',
    '2013-12-13',
    'Sustitución del panel solar por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    509,
    '26045',
    '2013-12-20',
    'Sustitución de las baterías (Usadas).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    510,
    '26045',
    '2014-01-07',
    'Se comienza su repintado y con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    511,
    '26045',
    '2014-05-21',
    'Se sustituye la bateria y se instala una RITAR 140 Ah'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    512,
    '26046',
    '2001-01-07',
    ' Se comienza su repintado con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    513,
    '26046',
    '2010-01-25',
    'Sustitución de la batería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    514,
    '26046',
    '2012-09-13',
    'Sustitución de la fotocélula por rotura.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    515,
    '26046',
    '2014-04-07',
    'Se sustituye el panel solar, la batería (RITAR 140 Ah) y el regulador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    516,
    '26046',
    '2018-11-28',
    'Se sustitulle la fotocélula por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    517,
    '26046',
    '2020-10-02',
    'Se sustituye la fotocélula por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    518,
    '26047',
    '2014-01-21',
    'Dragados repinta y dejan el tercio inferior de Blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    519,
    '26047',
    '2014-06-17',
    'El S. Electrico instala alumbrado interior a 12 v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    520,
    '26047',
    '2014-11-05',
    'Anfer comienza trabajos de instalación del tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    521,
    '26047',
    '2014-12-12',
    'Se ponen en paralelo  las dos baterias. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    522,
    '26047',
    '2014-12-15',
    'Se por finalizados los trabajos de telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    523,
    '26047',
    '2015-09-08',
    'Se sustituye la fotocélula nº 2'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    524,
    '26047',
    '2017-12-18',
    'Se pinta la torre manteniendo el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    525,
    '26047',
    '2020-12-18',
    'Rotura de la linterna lineal y soporte de panel solar. Baterías para cambiar.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    526,
    '26047',
    '2021-10-28',
    'Se le sustituye el MOSCAD y la radio, que estaban averiadas. Vuelve a funcionar el telecontrol. Se le sustituye la antena UHF.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    527,
    '26047',
    '2021-12-21',
    'LitePipe1 está en fallo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    528,
    '26047.1',
    '2014-06-18',
    'El S. Electrico instala alumbrado interior a 12 v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    529,
    '26047.1',
    '2015-06-24',
    'Se apaga definitivamente por la entrada en servicio del nuevo faro. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    530,
    '26047.2',
    '2013-09-01',
    'sustituimos la linterna BDL 120 por avería de multiples leds.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    531,
    '26047.2',
    '2014-06-19',
    'El S. Electrico instala alumbrado interior a 12 v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    532,
    '26047.2',
    '2014-11-04',
    'ANFER instala el tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    533,
    '26047.2',
    '2014-11-16',
    'Se dan por finalizados los trabajos del tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    534,
    '26047.2',
    '2014-11-18',
    'Comienza a trabajar con el telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    535,
    '26047.2',
    '2017-03-02',
    'Se sustituye una foto-célula por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    536,
    '26047.2',
    '2018-10-16',
    'Se limpia y se revisan trampas para roedores.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    537,
    '26047.2',
    '2018-11-06',
    'Se repinta toda la señal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    538,
    '26047.2',
    '2020-05-29',
    'Reparada mala conexión entre la placa solar y el regulador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    539,
    '26048',
    '2014-04-09',
    'Se repara la instalación electrica por fallos de conexión.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    540,
    '26048',
    '2014-06-23',
    'El S. Electrico instala alumbrado interior a 12 v.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    541,
    '26048',
    '2014-11-10',
    'Anfer comienza a instalar el telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    542,
    '26048',
    '2014-11-20',
    'Comienza atrabajar con el tele-control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    543,
    '26048',
    '2014-12-16',
    'Se dan por finalizados los trabajos de telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    544,
    '26048',
    '2016-10-27',
    'Se pinta con el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    545,
    '26048',
    '2019-10-25',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    546,
    '26048',
    '2020-01-10',
    'Se instala un panel solar por la perdida del anterior.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    547,
    '26048.1',
    '2013-09-18',
    'Se sustituye el Des-33 y la fotocélula por avería por tormenta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    548,
    '26048.1',
    '2013-11-12',
    'Se sustituye el Des-33 y se pone un Des-22 por tormenta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    549,
    '26048.1',
    '2014-06-25',
    'El S.E. Instala alumbrado interior a 12 V.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    550,
    '26048.1',
    '2014-11-11',
    'Anfer comienza la instalación del telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    551,
    '26048.1',
    '2014-11-18',
    'Comienza a trabajar con el tele control.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    552,
    '26048.1',
    '2014-12-16',
    'e dan por finalizados los trabajos del telecontrol.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    553,
    '26048.1',
    '2015-06-29',
    'La baliza no comunica, posible fallo de la radio, se avisa a Integración de sistemas para que avisen a ANFER.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    554,
    '26048.1',
    '2015-07-15',
    'Se repara la radio GP320 y queda operativa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    555,
    '26048.1',
    '2016-10-27',
    'Se pinta con el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    556,
    '26048.1',
    '2018-01-08',
    'Fallo de comunicaciones por tormenta. Se resetea PLC.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    557,
    '26048.1',
    '2019-09-16',
    'Se sustituye la batería y la óptica por degradación y filtraciones'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    558,
    '26048.1',
    '2019-10-25',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    559,
    '26048.1',
    '2020-11-27',
    'Por fuerte tormenta se ve afectado todo el sistema de alimentación y se apaga (se da de baja).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    560,
    '26048.1',
    '2022-08-24',
    'Se da de baja por no dar servicio de ayuda luminosa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    561,
    '26048.1',
    '2022-09-09',
    'Se cambia la LDR de la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    562,
    '26048.2',
    '2014-11-18',
    'Anfer sincroniza la boya con la 26048.3'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    563,
    '26048.2',
    '2016-03-31',
    'Se saca del agua para reparar la estructura y mantenimiento general.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    564,
    '26048.2',
    '2016-06-01',
    'Se vuelve a fondear en su ubicación, se le ha instalado un cable en la barandilla, para evitar que se posen pájaros.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    565,
    '26048.2',
    '2017-09-21',
    'Se sustituye una LDR por mal estado del encapsulado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    566,
    '26048.2',
    '2020-07-07',
    'Se saca a tierra por mantenimiento. Se sustituyen baterías, regulador, LDRs y se repinta añadiendo la pegatina de identificación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    567,
    '26048.2',
    '2020-07-15',
    'Se fondea en su ubicación y se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    568,
    '26048.2',
    '2022-08-04',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    569,
    '26048.3',
    '2014-11-18',
    'Anfer sincroniza la boya con la 26048,2'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    570,
    '26048.3',
    '2016-07-19',
    'Se saca la boya a tierra por mantenimiento general y pintura. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    571,
    '26048.3',
    '2016-10-11',
    'Anfer sustituye el transceptor y una LDR tras la revisión.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    572,
    '26048.3',
    '2016-10-19',
    'Se sustituyen las dos baterías por unas nuevas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    573,
    '26048.3',
    '2016-10-24',
    'Se fondea de nuevo en su posición.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    574,
    '26048.3',
    '2016-12-12',
    'Se sustituye una LDR.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    575,
    '26048.3',
    '2017-06-06',
    'La boya se ha apagado. Se repara el regulador y queda en servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    576,
    '26048.3',
    '2017-06-16',
    'Hemos tenido que sustituir el regulador por otro. No permitia la carga de la Bat.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    577,
    '26048.3',
    '2022-08-04',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    578,
    '26048.3',
    '2022-11-30',
    'Se cambia la LDR (izquierda) de la linterna'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    579,
    '26050',
    '2014-11-07',
    'Se da de baja por falo de suministro (Batería en mal estado).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (580, '26050', '2014-11-12', 'Se da de alta.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    581,
    '26060',
    '2017-09-21',
    'Se da de baja, fallo de la linterna, ritmo inadecuado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    582,
    '26083',
    '2022-03-29',
    'Traida por el POLLUX a puerto, se encontró a la deriva.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    583,
    '26190',
    '2013-01-09',
    ' Sustitución LDR en BDL'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    584,
    '26190',
    '2013-10-04',
    ' Se sustituye boya completa por mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    585,
    '26190',
    '2015-04-22',
    ' Averia por vandalismo, luz apagada. Instalación eléctrica arrancada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    586,
    '26190',
    '2015-05-08',
    'Se sustituye la boya por una nueva de espeque y antivandálica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    587,
    '26190',
    '2015-12-05',
    'Se sustituye el muerto y se traslada a una nueva posición.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    588,
    '26190',
    '2019-04-21',
    'Varada en playa norte Port Saplaya debido a fuerte temporal (Baja)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    589,
    '26190',
    '2019-05-06',
    'Se recupera y se traslada a la base para su reparación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    590,
    '26190',
    '2019-05-10',
    'Se fondea de nuevo en su ubicación (Alta).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (591, '26190', '2020-05-18', 'Se repinta la boya.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    592,
    '26190',
    '2020-06-12',
    'Tras mantenimiento, se fondea de nuevo en su ubicación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    593,
    '26190',
    '2021-09-13',
    'Se realiza revisión anual con personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    594,
    '26190',
    '2021-09-30',
    'Se sustituye un tramo de cadena. Se dobla el tramo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    595,
    '26190',
    '2022-03-09',
    'Varada en playa norte Port Saplaya debido a fuerte temporal Celia (Se da de baja). Rotura de cadena a unos 5m profundidad.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    596,
    '26190',
    '2022-04-26',
    'Se vuelve a fondear en ubicación próxima a la habitual. Coordenadas actualizadas a 39º 32.766 N 00º 16.887 W'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    597,
    '26190',
    '2022-08-24',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    598,
    '26270',
    '2010-02-11',
    'Sustitución de los 4 paneles, la LDR y el destellador.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    599,
    '26270',
    '2012-09-06',
    'Sustitución del grillete y poner varios discos en la cola'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    600,
    '26270',
    '2013-01-09',
    'Sustitución LDR en BDL'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    601,
    '26270',
    '2013-11-13',
    'Sustitución por Boyarín Provisional, con Linterna Autoalimentada'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    602,
    '26270',
    '2013-12-16',
    'Sustitución por Boya, con Linterna Autoalimentada'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    603,
    '26270',
    '2014-02-10',
    'Pasa a pertenecer al CCC de Gas Natural-Fenosa.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    604,
    '26285',
    '2011-10-21',
    'Sustitución de la fotocélula y la tarjeta destelladora del litepipe derecho.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    605,
    '26285',
    '2012-01-23',
    'Linterna Inferior, falla 1/4 Piña Leds, en alineación Dique.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    606,
    '26285',
    '2012-08-10',
    'Sustitución de la fotocélula y la tarjeta destelladora  del litepipe derecho.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    607,
    '26285',
    '2013-04-09',
    'Sustitución 2 LDRs, Telecontrol Linternas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    608,
    '26285',
    '2013-10-15',
    'Sustituir baterías de los litepipes, 180 Ah (2 de 12 V) por 200 Ah (6 V + 6V).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    609,
    '26285',
    '2014-03-06',
    'Dejar Fuera de Servicio, Linterna Inferior.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    610,
    '26285',
    '2014-03-21',
    'Retirar Linterna Inferior.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    611,
    '26285',
    '2014-10-15',
    'AIS, el identificador pasa a comenzar por 99, antes 00.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    612,
    '26285',
    '2014-11-25',
    'Lite-Pipes sincronizados con la Linterna. Toda la Baliza se alimenta con 330 Ah (6 V + 6 V).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (613, '26285', '2015-09-09', 'Cambiar LDR01.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    614,
    '26285',
    '2016-12-27',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    615,
    '26285',
    '2020-04-20',
    'Se repinta toda la torre.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    616,
    '26285',
    '2021-10-20',
    'Los mecánicos llevan a cabo labores de mantenimiento en los cerramientos de la baliza.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    617,
    '26290',
    '2005-04-12',
    'Sustitución destellador'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (618, '26290', '2005-11-03', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (619, '26290', '2007-08-30', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (620, '26290', '2009-11-27', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    621,
    '26290',
    '2011-10-21',
    'Sustitución fotocélula'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (622, '26290', '2012-08-08', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    623,
    '26290',
    '2013-04-10',
    'Mejora electrificación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (624, '26290', '2014-10-23', 'Sustitución de LDR 01');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    625,
    '26290',
    '2015-09-04',
    'Modificación según Resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (626, '26290', '2015-09-18', 'Pintada');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (627, '26290', '2016-04-26', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    628,
    '26290',
    '2020-04-20',
    'Se repinta la torre y vallado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (629, '26311', '2009-11-17', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (630, '26311', '2011-08-23', 'Sustitución cargador');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    631,
    '26311',
    '2013-04-11',
    'Mejora electrificación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    632,
    '26311',
    '2015-09-04',
    'Modificación según resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (633, '26311', '2015-09-14', 'Pintada');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (634, '26311', '2015-10-22', 'Sustituir LDR 01.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    635,
    '26311',
    '2016-05-04',
    'Sustituir batería, por otra usada, pero en mejor estado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    636,
    '26312',
    '2006-09-25',
    'Sustitución destellador'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (637, '26312', '2009-11-17', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (638, '26312', '2013-01-29', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    639,
    '26312',
    '2013-04-11',
    'Mejora electrificación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    640,
    '26312',
    '2014-01-28',
    'Pintura nueva, con franja inferior 1/3 Blanca.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    641,
    '26312',
    '2016-05-04',
    'Sustituir batería de 90 Ah, por otra usada, de 100 Ah. pero en mejor estado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    642,
    '26312',
    '2017-05-24',
    'Sustituir LDR nº1 averiada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (643, '26312', '2021-07-13', 'Sustitución LDR');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    644,
    '26312',
    '2021-09-15',
    'Se sustituye el MOSCAD por fallo de comunicaciones'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (645, '26313', '2010-01-11', 'Sustitución baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (646, '26313', '2010-11-03', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (647, '26313', '2012-12-11', 'Sustitución baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    648,
    '26313',
    '2012-12-17',
    'Sustitución LDR baliza BDL'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    649,
    '26313',
    '2013-01-09',
    'Sustitución LDR Telecontrol'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    650,
    '26313',
    '2014-01-30',
    'Cambio de Regulador de Carga, STECA SOLARIX PRS 2020.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    651,
    '26313',
    '2014-02-05',
    'Cambio de Linterna (BDL-120, al 25%, y DES-33)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    652,
    '26313',
    '2014-09-24',
    'Falla LDR 01, pendiente de sustitución (por malas condiciones).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (653, '26313', '2014-11-26', 'Sustituir LDR 01.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    654,
    '26313',
    '2015-06-18',
    'Sustituir Boya por Móbilis Amarilla.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    655,
    '26313',
    '2015-06-23',
    'Sustituir 8 PFV de 10 W, por 2 PFV de 95 W.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    656,
    '26313',
    '2015-08-06',
    'Sustituir Móbilis Amarilla por Boya.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    657,
    '26313',
    '2016-08-09',
    'Se sustituye el tren de fondeo, 28 m. cadena galvanizada de 30 mm.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    658,
    '26313',
    '2017-12-14',
    'Se observa que los paneles FV están muy sucios por gaviotas.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    659,
    '26313',
    '2018-03-08',
    'Se sustituye la boya  por Mobilis amarilla para mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    660,
    '26313',
    '2018-04-12',
    'Se repone: antena GPS, fotocélula y óptica. Se pinta y se fondea de nuevo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    661,
    '26313',
    '2018-10-04',
    'Se desconecta el tele-control para ahorar batería. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    662,
    '26313',
    '2022-08-19',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (663, '26314', '2006-02-07', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (664, '26314', '2009-11-17', ' Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    665,
    '26314',
    '2012-10-01',
    'Linterna provisional por caida de poste.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    666,
    '26314',
    '2012-12-00',
    'Sustitución de la Parte Superior de la Baliza, por caída poste (LMV) '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    667,
    '26314',
    '2013-01-11',
    'Mejora Electrificación, Acometida NO INDEPENDIENTE'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    668,
    '26314',
    '2013-05-09',
    'F.A. sin Control de Temperatura y un solo módulo (de 200 W)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (669, '26314', '2014-01-14', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    670,
    '26314',
    '2014-01-21',
    'Magneto 10 A saltado, anular ventilador F.A.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    671,
    '26314',
    '2014-01-31',
    'Reponer ventilador F.A.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    672,
    '26314',
    '2014-03-12',
    'Nivelar parte inferior Baliza.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (673, '26314', '2015-10-22', 'Sustituir LDR 01');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    674,
    '26314',
    '2016-12-27',
    'Se repinta la torre con el tercio inferior blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    675,
    '26314',
    '2018-08-03',
    'Se sustituye la LDR nº2 por deterioro de la misma.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    676,
    '26320',
    '2005-11-05',
    'Sustitución panel  roto'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    677,
    '26320',
    '2009-09-10',
    'Sustitución panel  roto'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (678, '26320', '2009-10-15', 'Sustucion baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    679,
    '26320',
    '2013-05-10',
    'Entrada de agua en la caja Himel exterior, detector de intrusión corroído y  tapa de baterias en mal estado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    680,
    '26320',
    '2013-12-16',
    'Resetear por fallo de GPS y anular detector de intrusión.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    681,
    '26320',
    '2014-01-30',
    'Se sustituye por la Móbilis. En la Revisión en tierra se sustituyen, BATs, óptica y Regulador FV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    682,
    '26320',
    '2014-03-13',
    'Vuelve otra vez, al agua.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    683,
    '26320',
    '2014-09-24',
    'Falla LDR 02, pendiente de sustitución (por malas condiciones).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (684, '26320', '2014-11-26', 'Sustituir LDR 02.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    685,
    '26320',
    '2015-09-04',
    'Modificación según Resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    686,
    '26320',
    '2017-09-14',
    'Óptica en mal estado pendiente de cambio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    687,
    '26320',
    '2019-02-12',
    'Se observa la marca de tope doblada y la barandilla con sintomas de haber recibido un impacto.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    688,
    '26320',
    '2020-02-27',
    'Se sustituye por la mobilis para su reparación y mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    689,
    '26320',
    '2021-04-27',
    'Se da de baja por apagados intermitentes. El 29 se le cambia LDR y anula el penúltimo panel por cortocircuito. El 30 se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    690,
    '26320',
    '2022-08-19',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (691, '26325', '2010-01-08', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (692, '26325', '2010-02-16', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    693,
    '26325',
    '2012-04-02',
    'Sustitución cierres Baliza'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (694, '26325', '2015-02-04', 'Sustitución LDR nº 2.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (695, '26325', '2015-09-16', 'Pintada');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    696,
    '26325',
    '2016-05-04',
    'Sustituir batería, por otra usada, pero en mejor estado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (697, '26325', '2017-04-11', 'Sustituir LDR nº 1.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    698,
    '26325',
    '2017-07-13',
    'Se  repara la acometida electrica por un fallo de conexión.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    699,
    '26325',
    '2018-12-07',
    'Se repinta la torre de la baliza.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    700,
    '26325',
    '2019-02-18',
    'Se sustituye LDR por avería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (701, '26325', '2021-08-25', '');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    702,
    '26326',
    '2014-02-14',
    'Se sustituye el poste, por la Baliza.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    703,
    '26326',
    '2014-12-16',
    'Se dan por finalizados los trabajos del tele-control. (ANFER)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    704,
    '26326',
    '2019-12-12',
    'Se repinta todo el soporte.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    705,
    '26326',
    '2021-09-15',
    'Se sustituye el MOSCAD por fallo de comunicaciones. (ANFER)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (706, '26360', '2012-04-17', 'Sustitución óptica ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (707, '26360', '2013-01-09', 'Sustitución  baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    708,
    '26360',
    '2013-02-05',
    'Anular Telecontrol, alimentación exterior linterna (Baja 04/02 y Alta 05/02)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    709,
    '26360',
    '2013-03-06',
    'Sustitución por la Móbilis, para su revisión en Tierra'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    710,
    '26360',
    '2013-03-21',
    'Sustitución regulador BP 20 Amp por STECA 20 Amp'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    711,
    '26360',
    '2013-03-22',
    'Según test solicitado, no funciona como autónoma'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    712,
    '26360',
    '2013-05-10',
    'Puesta, otra vez, en el agua'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    713,
    '26360',
    '2014-06-19',
    'Colisionada por un pesquero.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    714,
    '26360',
    '2014-06-20',
    'Sustituida por la Móbilis. Se repara estructuralmente, se pinta y se sustituye un PFV Atersa A-38 (38 W).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    715,
    '26360',
    '2014-07-15',
    'Vuelve otra vez, al agua.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    716,
    '26360',
    '2015-09-04',
    'Modificación según Resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    717,
    '26360',
    '2016-08-09',
    'Se sustituye el tren de fondeo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    718,
    '26360',
    '2016-12-01',
    'Por la noche ha permanecido apagada, se revisa y se deja en servicio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    719,
    '26360',
    '2016-12-05',
    'Se ha vuelto a apagar por batería baja, se da de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    720,
    '26360',
    '2016-12-07',
    'Se recupera la batería y se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    721,
    '26360',
    '2016-12-20',
    'Se apaga de madrugada y se recupera a las 18h. (baja y alta mismo día) '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    722,
    '26360',
    '2017-09-14',
    'Panel foto voltaico averiado pendiente de sustitución.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    723,
    '26360',
    '2018-08-18',
    'Se da de baja por que está apagada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    724,
    '26360',
    '2018-08-20',
    'Se sustituye el regulador y una batería. Se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    725,
    '26360',
    '2018-09-08',
    'Se da de baja porque se vuelve a apagar. Preparamos sustituta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    726,
    '26360',
    '2018-09-13',
    'Se sustituye la boya por la Mobilis para su reparación y revisión. Alta'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    727,
    '26360',
    '2019-02-12',
    'En el Martillo dique Levante. Burriel la pinta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    728,
    '26360',
    '2019-02-12',
    'Se conecta el telecontrol, bajo observación.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    729,
    '26360',
    '2019-02-27',
    'Se repone la boya en su posición con el telecontrol desconectado.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    730,
    '26360',
    '2019-12-23',
    'Se dió de baja por la noche.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    731,
    '26360',
    '2019-12-24',
    'CCE comunica que esta apagada. Se da de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    732,
    '26360',
    '2019-12-26',
    'Se sustituye una batería y se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    733,
    '26360',
    '2020-04-28',
    'Se le reduce el alcance a 1mn.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    734,
    '26360',
    '2021-01-02',
    'Avisan de que la boya está apagada. Se da de baja a través de AtoN de PPEE.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    735,
    '26360',
    '2021-01-05',
    'Reponemos baterías y se repasa instalación solar (cableado). Se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    736,
    '26360',
    '2022-08-18',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (737, '26375', '2020-04-28', 'Entra en servicio.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (738, '26380', '2006-02-14', 'Sustitución batería');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (739, '26380', '2008-01-11', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    740,
    '26380',
    '2008-11-20',
    'Sustitución LDR en BDL'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    741,
    '26380',
    '2012-04-02',
    'Sustitución cierres baliza'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    742,
    '26380',
    '2015-09-04',
    'Modificación según resolución.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (743, '26380', '2015-09-16', 'Pintada');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    744,
    '26380',
    '2020-04-28',
    'Se modifica pasando a ser una Marca lateral de bifurcación. Se repinta del color correspondiente y se le modifica la característica y periodo.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    745,
    '26380',
    '2021-08-24',
    'Se sustituyen las dos LDRs'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (746, '26390', '2007-08-30', 'Sustitución óptica');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    747,
    '26390',
    '2009-11-03',
    'Sustitución óptica y LDR'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    748,
    '26390',
    '2011-01-19',
    'Sustitución linterna (completa).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    749,
    '26390',
    '2015-09-04',
    'Modificación según Resolución'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    750,
    '26390',
    '2016-12-02',
    'Se pinta con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    751,
    '26390',
    '2020-04-27',
    'Se repinta la torre y el contorno blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    752,
    '26390',
    '2021-01-11',
    'La policia portuaria informa de que está apagada. Se procede a la sustitución de la batería.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    753,
    '26392',
    '2008-11-18',
    'Sustitución  LDR y óptica'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    754,
    '26392',
    '2011-11-23',
    'ustitución  LDR y óptica'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (755, '26392', '2012-04-06', 'Sustitución F.A.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (756, '26392', '2012-05-21', 'Sustitución F.A.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (757, '26392', '2013-02-01', 'Sustitución F.A.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    758,
    '26392',
    '2013-02-07',
    'Poner Trafo de Separación Galvánica, dentro caja Himel.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    759,
    '26392',
    '2013-03-27',
    'Sustitución F.A. y desconectar Tierra de la misma'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    760,
    '26392',
    '2014-09-30',
    'Fallos de Comunicación, durante varios días seguidos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    761,
    '26392',
    '2014-10-10',
    'Cambiar Motorola GP340.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    762,
    '26392',
    '2014-11-20',
    'Quitar F.A. averiada y poner Victron provisional.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    763,
    '26392',
    '2015-02-04',
    'Reponer F.A. reparada.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    764,
    '26392',
    '2015-09-04',
    'Modificación según Resolución.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    765,
    '26392',
    '2016-05-26',
    'Modificación de la acometida eléctrica.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    766,
    '26392',
    '2016-12-02',
    'Se pinta con el tercio inferior de blanco.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    767,
    '26392',
    '2019-02-18',
    'Se rearma diferencial de acometida.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    768,
    '26392',
    '2020-11-17',
    'Fallo en la acometida eléctrica. Se rearma el diferencial.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    769,
    '26392',
    '2021-07-14',
    'Sustitución de F.A. por avería en una de las salidas de C.C.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    770,
    '26392',
    '2021-09-20',
    'Sustitución F.A. por avería'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (771, '26450', '2009-02-17', 'Sustitución baterías');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (772, '26450', '2014-01-27', 'Pintura Nueva.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    773,
    '26450',
    '2015-09-16',
    'Puesto PFV Mesemar de 95 W.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (774, '26450', '2017-09-18', 'Sustituir LDR nº 1');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    775,
    '26450',
    '2020-01-21',
    'Se apaga por el fuerte temporal y se da de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    776,
    '26450',
    '2020-02-04',
    'Se instala baliza nueva MCL 200 y se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    777,
    '26450',
    '2023-02-02',
    'Se fondea boya de sustitución con BDL120 y placas'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    778,
    '26450-a',
    '2021-10-08',
    'Se repone la marca tope, perdida en un temporal y se asegura con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    779,
    '26450-a',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    780,
    '26450-b',
    '2021-10-08',
    'Se asegura la marca de tope con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    781,
    '26450-b',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    782,
    '26450-c',
    '2021-10-08',
    'Se asegura la marca de tope con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    783,
    '26450-c',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    784,
    '26450-d',
    '2021-10-08',
    'Se asegura la marca de tope con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    785,
    '26450-d',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    786,
    '26450-e',
    '2021-10-08',
    'Se asegura la marca de tope con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    787,
    '26450-e',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    788,
    '26450-f',
    '2021-10-08',
    'Se asegura la marca de tope con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    789,
    '26450-f',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    790,
    '26450-g',
    '2021-10-08',
    'Se asegura la marca de tope con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    791,
    '26450-g',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    792,
    '26450-h',
    '2021-10-08',
    'Se asegura la marca de tope con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    793,
    '26450-h',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    794,
    '26450-i',
    '2021-10-08',
    'Se asegura la marca de tope con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    795,
    '26450-i',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    796,
    '26450-j',
    '2021-10-08',
    'Se asegura la marca de tope con tuerca autoblocante.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    797,
    '26450-j',
    '2022-08-23',
    'Se realiza la revisión anual por parte de personal de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    798,
    '26465',
    '2021-07-02',
    'DADA DE BAJA EN RESOLUCION DE BALIZAMIENTO Nº 2021170'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    799,
    '26465',
    '2022-08-16',
    'Cambio su NIF, pasando a ser la 26465'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    800,
    '26465.1',
    '2021-07-02',
    'DADA DE BAJA EN RESOLUCION DE BALIZAMIENTO Nº 2021170'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    801,
    '26465.1',
    '2022-08-16',
    'Cambio su NIF, pasando a ser la 26465.1'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    803,
    '26465.3',
    '2021-07-02',
    'DADA DE BAJA EN RESOLUCION DE BALIZAMIENTO Nº 2021170'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    804,
    '26465.4',
    '2021-07-02',
    'DADA DE BAJA EN RESOLUCION DE BALIZAMIENTO Nº 2021170'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    805,
    '26465.4',
    '2022-08-16',
    'Cambio su NIF, pasando a ser la 26465.4'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    806,
    '26500',
    '2018-01-26',
    'Esteban Ruiz de Viñaspre deja oficialmente el faro por jubilación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    807,
    '26500',
    '2018-01-29',
    'Revisión del grupo electrógeno por el taller de vehículos'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    808,
    '26500',
    '2018-02-07',
    'Estudio in situ, para instalar cámaras y alarmas de seguridad'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    809,
    '26500',
    '2018-02-09',
    'Visita de autoridades para estudiar la cesión al Ayuntamiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    810,
    '26500',
    '2018-02-12',
    'Plan de prevención y control de plagas (Labaqua)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    811,
    '26500',
    '2018-05-07',
    'Revisión de los extintores (Guipons)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    812,
    '26500',
    '2018-06-04',
    'Revisión y analisis de legionela.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    813,
    '26500',
    '2018-06-20',
    'Se sustituye lámpara uno.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    814,
    '26500',
    '2018-06-27',
    'Cambian el contador eléctrico (sigue a 230v.)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    815,
    '26500',
    '2018-07-12',
    'Se localiza y elimina un foco de mosquitos en el pozo ciego.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    816,
    '26500',
    '2018-07-19',
    'Después de una larga temporada sin aparecer, van los jardineros ha hacer mantenimiento.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    817,
    '26500',
    '2018-09-05',
    'tras varios cortes de red, localizamos la avería en el embornado del contador. Reparamos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    818,
    '26500',
    '2018-09-14',
    'Revisión del pararrayos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    819,
    '26500',
    '2018-10-19',
    'Revisión de los extintores (Guipons)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    820,
    '26500',
    '2018-11-13',
    'Fuga de agua en una cisterna de la vivienda que la inunda. Se repara.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    821,
    '26500',
    '2018-12-27',
    'Se instala una nueva central de intrusión por Santiago de AJP'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    822,
    '26500',
    '2019-06-28',
    'Avería en la rotación. Se da de baja. Funciona con la B.E.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    823,
    '26500',
    '2019-07-03',
    'MSM sustituye y repara tarjetas SB03. Sigue de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    824,
    '26500',
    '2019-07-12',
    'MSM instala dos convertidores 12 - 24 V. Se comprueba su funcionamiento y se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    825,
    '26500',
    '2019-11-19',
    'Se ajusta a la baja la sensibilidad de la foto-célula de encendido (encendía y apagaba continuamente)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    826,
    '26500',
    '2019-11-19',
    'Se sustituye la LDR interna por una nueva.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    827,
    '26500',
    '2020-02-13',
    'Se crea el sector de ocultación con vinilo'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    828,
    '26500',
    '2020-07-23',
    'Se sustituye la lámpara 1 en la baliza principal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    829,
    '26500',
    '2020-11-24',
    'La empresa SICA regula el convertidor de las fotocélulas y propone su cambio.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    830,
    '26500',
    '2021-01-21',
    'SICA ING procede a la sustitución del convertidor de señal y ajusta la maniobra para poder conectar la BAEM directamente en caso de necesidad.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    831,
    '26500',
    '2021-02-19',
    'Se sustituye fuente de alimentación de la cámara de la linterna y vuelve a funcionar dicha cámara.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    832,
    '26500',
    '2021-02-19',
    'Vareser repone vidrio facturado en la linterna, en el sector de oscuridad.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    833,
    '26500',
    '2021-06-30',
    'El SAI se encuentra en avería por las baterías'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    834,
    '26500',
    '2021-07-23',
    'Se realiza la revisión del pararrayos.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    835,
    '26500',
    '2021-09-21',
    'Se sustituye la batería del grupo electrógeno.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (836, '26500', '2021-09-29', 'Revisión de los AA.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    837,
    '26500',
    '2021-10-21',
    'Se sustituyen las baterias del SAI.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    838,
    '26500',
    '2022-03-15',
    'Se cae parte de la valla perimetral que da a la avenida'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    839,
    '26500',
    '2022-06-15',
    'Se sustituye el SAI averiado'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    840,
    '26500',
    '2022-06-20',
    'Jose Luis de IRD deja operativa la cámara de entrada faro tras poner un UTP que faltaba del radioenlace'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (841, '26504', '2015-04-20', 'Reformada y pintada. ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    842,
    '26504',
    '2015-06-09',
    'Se ajusta el ritmo de destellos (estaba desconfigurado).'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (843, '26508', '2015-04-20', 'Reformada y pintada. ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (844, '26510', '2015-04-20', 'Reformada y pintada. ');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    845,
    '26512',
    '2020-04-20',
    '5 Reformada y pintada. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1024, '25460', '2023-02-09', 'prrueba');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1025, '25460', '2023-05-10', 'prueba2222');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1026, '25470', '2023-02-09', 'zxc');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1027,
    '25940',
    '2016-03-09',
    'Se repinta la baliza y se deja el tercio inferior blanco'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1028,
    '25700',
    '2023-02-10',
    'Falta de activación de la baliza de emergencia ante el paro en la rotación de la baliza principal. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1029,
    '25700',
    '2023-02-16',
    'Personal de MSM reprograma el PLC resolviendo el problema de activacion de baliza de emergencia'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1030,
    '25563',
    '2023-02-08',
    'Se rehace el pantalan, reubicando la baliza sobre un poste lateral en el extremo del mismo. Falta pintar la marca diurna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1031,
    '25564',
    '2023-03-18',
    'CCE avisa fallo de lampara. Se da de baja.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1032,
    '25564',
    '2023-03-20',
    'Se sustituye por MCL200Y ref:668. Se da de alta.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1033,
    '25700',
    '2023-03-22',
    'se da de baja por fallo en rotación. Según NETCOM fallo fotocelula'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1034,
    '25842',
    '2010-12-03',
    'Instalación y puesta en marcha. Total factura: 24973.52€'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1035,
    '25720',
    '2010-03-09',
    'Suministro de 2 balizas lineales (litepipe) por Mesemar. 10.880€'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1036,
    '26021',
    '2009-12-02',
    'Se instala baliza nueva.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1037, '26450', '2023-05-15', 'snn');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: observaciones
# ------------------------------------------------------------

INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (1, '25460', 'Estructura de poliesterr');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    2,
    '25470',
    'Corona formada a base de (led con optica)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    3,
    '25470',
    'Recomendable pintar se cara a la proxima inspeccion'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (4, '25545', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (5, '25545', 'Dos LDR para Baliza y para Litepipe');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (6, '25545', 'Medio Litepipe se queda encendido');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (7, '25545', 'Retirar cuadro de telefonica');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (8, '25552', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (9, '25552', 'Dos LDR');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (10, '25560', 'Tiene cuatro coronas');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    12,
    '25563',
    'su marca diurna necesita ser pintada por rehabilitación de pantalán.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (13, '25564', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (14, '25565', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    15,
    '25565',
    'El marco de la placa fotovoltaica mide 124x34 cm'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (16, '25565', 'Limar Marco');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    17,
    '25565',
    'Tiene 4 coronas LEDs. Añadir coronas.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    18,
    '25570',
    'Fijar STECA con tornilla rosca chapa'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    19,
    '25570',
    'Panel Fotovoltaico de 53x64cm (Agujeros a 48x30cm)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (20, '25570', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (21, '25570', 'Tiene 3 coronas + 1 sin óptica');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    22,
    '25590',
    'Necesita ser pintada, por presencia de grafitti que dificulta la identificación de la señal.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    23,
    '25640',
    'Dada de baja del sistema de balizamiento'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    24,
    '25650',
    'AIS SBS 002241047 / SINTETICO 992241055'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    25,
    '25650',
    'Alicatado del cuarto de baño de la oficina deteriorado. Han saltado cuatro azulejos.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    26,
    '25650',
    'El sistema de comunicacion radio de emisoras está funcionando sin bateria, pues ésta explotó.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    27,
    '25650',
    'Grupo electrógeno Caterpillar 13.5 KVA'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    28,
    '25650',
    'REFERENCIA CATASTRAL: 0413301YJ4401S0001JK'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (29, '25700', 'AIS sintetico');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (30, '25700', 'MBR600L 80w --- MBR300R 10w');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    31,
    '25700',
    'PANELES 95/12V --- BATERIAS:720Ah - 24v --- AEROGENERADOR: 150W/24V'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    32,
    '25700',
    'REFERENCIA CATASTRAL: 0304101YJ3700G0001PW'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (33, '25720', 'AIS sintetico');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (34, '25720', 'sincronizada con 25721');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    35,
    '25720',
    'Suministro desde el VCT42 pasando por la pecera SAI en la cueva de Batman.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (36, '25721', 'Sincronizada con 25720');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (37, '25721', 'Suministro desde el VCT41');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (38, '25730', 'PESO MUERTO: 4600 Kg');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (39, '25730', 'Se recomienda soldar anodo nuevo');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    40,
    '25740',
    'la boya sustituta de la roja de bocana 25740 ya está preparada con su fondeo nuevo + linterna MCL200 en campa Sur auxiliar.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (41, '25761', 'Cadena al 35% desgaste');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (42, '25761', 'Sincronizada con 25765');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    43,
    '25765',
    'Cadena durmiente presenta 25% desgaste'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (44, '25765', 'Sincronizada con 25761');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (45, '25774', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (46, '25776', 'Sincronizada con 25777');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (47, '25777', 'Sincronizada con 25776');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (48, '25820', 'sincronizada con 25820.1');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    49,
    '25820.1',
    '2 X SB6V/ 200A .Regulador Morningstar/sunsaver'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    50,
    '25820.1',
    'Elastomero (Espuma polietileno cubierta de poliuretano)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    51,
    '25820.1',
    'Fallo destellador según SCADA. Funciona sin sincronización con la 25820'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (52, '25820.1', 'sincronizada con la baliza 25820');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    53,
    '25820.1',
    'Telecontrol RTU53 y reflector radar.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (54, '25830', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (55, '25830', 'Sincronizada con la 25831.');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (56, '25831', '30/10/2014 Entra en servicio ');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    57,
    '25831',
    'Sincronizada con la nº 20 -  Nif 25830'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (58, '25840', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    59,
    '25841',
    '2 X SB6V/ 200A .Regulador Morningstar/sunsaver'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    60,
    '25841',
    'Elastomero (Espuma polietileno cubierta de poliuretano)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (61, '25841', 'Necesita repintado');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    62,
    '25841',
    'Telecontrol RTU 54 y reflector radar'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (63, '25850', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (64, '25940', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (65, '26045', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (66, '26046', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (67, '26047', 'Entra en servicio el 26/06/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (68, '26047', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (69, '26047.1', 'Apagada definitivamente');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    70,
    '26047.1',
    'Dispone de un sector de oscuridad 205º-295º (90º)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (71, '26047.1', 'Entra en servicio el 31/05/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    72,
    '26047.2',
    'Dispone de un sector de oscuridad de 115º - 295º (180º)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (73, '26047.2', 'Entra en servicio el 29/05/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (74, '26047.2', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (75, '26048', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (76, '26048', 'Entra en servicio el 26/06/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (77, '26048.1', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (78, '26048.1', 'Entra en servicio el 06/06/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    79,
    '26048.2',
    'Entra en servicio el jueves 30/05/2013'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (80, '26048.2', 'Sincronizada con 26048.3');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (81, '26048.3', 'Entra en sevicio el 31/05/2013');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (82, '26048.3', 'Sincronizada con  26048.2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (83, '26049', 'sincronizada con 26050');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (84, '26050', 'sincronizada con 26049');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (85, '26052.5', 'Baliza el limite del talud.');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (86, '26052.7', 'Baliza el limite del talud.');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    87,
    '26058.15',
    'El 102 Local hace referencia a 26058.15A y 26058.15B a Estribor entrando '
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    88,
    '26058.15',
    'Se da de alta la señal el 05/04/2016'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    89,
    '26058.15',
    'Todos los semáforos del puente están sincronizados.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    90,
    '26058.16',
    'El 103 Local hace referencia a 26058.16A y 26058.16B a Babor entrando '
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    91,
    '26058.16',
    'Se da de alta la señal el 19/04/2016'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    92,
    '26058.16',
    'Todos los semáforos del puente están sincronizados.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    93,
    '26058.17',
    'El 104 Local hace referencia a 26058.17A - 26058.17B - 26058.17C - 26058.17D'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    94,
    '26058.17',
    'Se da de alta la señal el 19/04/2016'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    95,
    '26058.17',
    'sobre el tablero en la parte central '
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    96,
    '26058.17',
    'Todos los semáforos del puente están sincronizados.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    97,
    '26083',
    'Carlos Oyonarte c.oyonarte@fugro.com 609688503'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    98,
    '26083',
    'Empresa que lleva mantenimiento FUGRO NORWAY AS.  Olga Fernandez y Carlos Oyonarte.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    99,
    '26083',
    'Marta de Alfonso PPEE telf 676209300'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    100,
    '26083',
    'Olga Fernandez  o.fernandez@fugro.com 609 233 630'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    101,
    '26190',
    'No tiene reflector de radar pasivo porque la estructura es métalica y 6,3 millas de distancia de reconocimiento en radar.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (102, '26202', 'Sector Obscuridad 30º-170º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (103, '26205', 'Sector Oscuridad 215º - 305º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    104,
    '26270',
    'No es de la APV. Solo se lleva a cabo su inspección (a terceros)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (105, '26285', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (106, '26285', 'MMSI: 992241052');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (107, '26290', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (108, '26311', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (109, '26311', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (110, '26311', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (111, '26312', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (112, '26313', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (113, '26314', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (114, '26314', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    115,
    '26320',
    'Habría que cambiar su denominación en el SCADA'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (116, '26320', 'LDRS a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    117,
    '26320',
    'Se ve con la camara &quot;Regasificadora 5&quot;'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (118, '26325', 'LDRs a 0º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (119, '26326', ' SE REPINTARÁ EN 2019');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (120, '26326', '26/07/13: Entra en servicio.');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (121, '26326', 'LDRs a 0º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (122, '26360', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    123,
    '26360',
    'Trabajando con el telecontrol desconectado, sin problemas.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (124, '26380', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (125, '26390', 'LDRs a 0º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (126, '26390', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (127, '26392', 'LDRs a 0º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (128, '26392', 'SERA PINTADA EN 2022');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (129, '26450', 'LDRs a 180º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    130,
    '26450',
    'Se modifica la característica a GpRp (3) 5s. Se comunica a PP EE y al Hidrográfico'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    131,
    '26465',
    'Nombre actual(2021): Bersolaz Spain - Sagunto'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (132, '26465', 'Responsable: Grupo culmarex');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (133, '26465', 'Sincronizada con el resto de boyas');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (134, '26465.1', 'Responsable: Grupo culmarex');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    135,
    '26465.1',
    'Sincronizada con el resto de Boyas'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (136, '26465.3', 'Responsable: Grupo culmarex');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    137,
    '26465.3',
    'Sincronizada con el resto de boyas'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (138, '26465.4', 'Responsable: Grupo culmarex');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    139,
    '26465.4',
    'Sincronizada con el resto de BOYAS'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    140,
    '26470',
    '(Sincronizada con 26471, 26472 y 26473)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    141,
    '26470',
    'Suprimida definitivamente. Septiembre 2019'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    142,
    '26470',
    'Suprimida temporalmente. Agosto 2018'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    143,
    '26471',
    'Sincronizada con 26470, 26472 y 26473'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    144,
    '26471',
    'Suprimida definitivamente. Septiembre 2019'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    145,
    '26471',
    'Suprimida temporalmente. Agosto 2018'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    146,
    '26472',
    'Sincronizada con 26470, 26471 y 26473'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    147,
    '26472',
    'Suprimida definitivamente. Septiembre 2019'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    148,
    '26472',
    'Suprimida temporalmente. Agosto 2018'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    149,
    '26473',
    'Sincronizada con 26470, 26471 y 26472'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    150,
    '26473',
    'Suprimida definitivamente. Septiembre 2019'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    151,
    '26473',
    'Suprimida temporalmente. Agosto 2018'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (152, '26500', 'AÑO CONSTRUCCION 1904');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    153,
    '26500',
    'REFERENCIA CATASTRAL: 9555403YJ3986S0001XP'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (154, '26500', 'VISIBLE:336º-226º (250º)');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (155, '26508', 'Sector Obscuridad 180º-360º');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (156, '25554', 'bgfgjfg345345');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (157, '26450-f', 'sfdhdhh');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (158, '26450-f', 'ñklj');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (159, '25530', 'rjkj');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (160, '25530', 'hhh');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (162, '25470', 'dtfyflkl');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (163, '25470', 'asdgsdhdfjkgflkfgyhñl2');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: sessions
# ------------------------------------------------------------

INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'CFj_DSJfV9LBu70YQvwOp2G4LiVxq8CR',
    1685037406,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'TbOzcKi_ESANyJlTCDXhlKPcW0uPRCEg',
    1685038582,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'
  );
INSERT INTO
  `sessions` (`session_id`, `expires`, `data`)
VALUES
  (
    'xTXV4-YTT8ae1urEwhjFq7XU4StFI7zC',
    1685038708,
    '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":1},\"flash\":{}}'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: usuarios
# ------------------------------------------------------------
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
    'adrian',
    '$2a$10$rTcE3JD7svuTpPT42FrNdOodYNqfk9H7qd8.Dj3.vZMfZC9/rs.wS',
    'adeharo@puerto.com',
    'Adrian de Haro',
    'admin',
    '1682779957154.bmp'
  );

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
    2,
    'guillermo',
    '$2a$10$awusc6lEIcgLG2xif39iNeogoxpHuRjSzPaD0lZcgUdTzUmPPkBX2',
    'gcasamayor@puerto.com',
    'Guillermo Casamayor',
    'admin',
    '1682779877537.bmp'
  );
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
    3,
    'marcos',
    '$2a$10$jBWhSIjUyrKpyrMuzs/l5e5YOxRiKVeZn9IAMTrWY1Seoq/OpfCae',
    'msaez@puerto.com',
    'Marco Antonio Saez',
    '',
    '1682779877535.bmp'
  );
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
    4,
    'raul',
    '$2a$10$enneFc/QxJXOxgkA1CTyNujO.52eJ54b.mTNCEQ4QudYwJgtvDN1C',
    'rrubio@puerto.com',
    'Raul Rubio',
    'san',
    '1682779877537.bmp'
  );
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
    5,
    'jose',
    '$2a$10$wXEcb4tjfa6StZt049DHAOb7MBc3vSKg/9KyKBFGRH19wBz6hF8Zq',
    'fcjmt@puerto.com',
    'Jose Martin Tur',
    'san',
    NULL
  );
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
    6,
    'newuser',
    '$2a$10$i6A0TY98LC9FnVuoquHSF./cIy7InN4Glsm8ymplg0DwU2I5Pb1ZO',
    'lokahahksf@lkasjf.es',
    'newuser',
    'san',
    '1682779877535.bmp'
  );


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


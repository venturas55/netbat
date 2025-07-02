/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: balizamiento
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `balizamiento` (
  `nif` varchar(8) NOT NULL,
  `num_internacional` varchar(12) DEFAULT NULL,
  `tipo` varchar(250) DEFAULT NULL,
  `telecontrol` varchar(200) DEFAULT NULL,
  `apariencia` varchar(50) DEFAULT NULL,
  `periodo` decimal(5, 2) DEFAULT NULL,
  `caracteristica` varchar(50) DEFAULT NULL,
  `necesita_pintado` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de balizas';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: localizacion
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `localizacion` (
  `nif` varchar(8) NOT NULL,
  `puerto` varchar(50) DEFAULT NULL,
  `num_local` decimal(5, 0) DEFAULT NULL,
  `localizacion` varchar(70) DEFAULT NULL,
  `latitud` varchar(15) DEFAULT NULL,
  `longitud` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`nif`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de localizacion del balizamiento';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lampara
# ------------------------------------------------------------

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

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: balizamiento
# ------------------------------------------------------------

INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25460',
    'E-0190',
    'Baliza Torre troncopiramidal verde blanca',
    'telecontrol ',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25470',
    'E-0190.2',
    'Baliza Torre troncopiramidal roja blanca',
    'teeee',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25530',
    'E-0194',
    'Baliza bocana Torre de hormigón verde',
    'Sí  RTU Nº 41',
    'DV',
    5.00,
    'L1 oc4',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25545',
    'E-0193',
    'Baliza bocana Torre de hormigón Roja',
    'RTU Nº 42',
    'DR',
    5.00,
    'L1 oc4',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25552',
    'E-0196',
    'Baliza Torre cilíndrica TPS',
    '',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25554',
    '36564',
    'Boya de espeque roja/verde MSM',
    'NO',
    'GpD(2+1)V',
    14.00,
    'L0,5 oc1 L5,5 oc3 L0,5 oc1',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25555',
    'E-0196.2',
    'Baliza Hormigon pequeña Columna cuadrangular verde',
    '',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25560',
    'E-0196.25',
    'Baliza Hormigon pequeña columna cuadrangular',
    'NOo',
    'GpD(4)R',
    11.00,
    '(L0,5 oc1,5)x3 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25563',
    'E-0196.32',
    'Baliza Metal Estribor Linterna sobre pilote.',
    'NO',
    'GpD(4) V',
    11.00,
    '(L0,5 oc1,5)x3 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25564',
    '',
    'Baliza Metal amarilla Linterna sobre pilote.',
    'SI',
    'DA',
    3.00,
    'L0,5 oc 2,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25565',
    'E-0196.3',
    'Baliza Metal Torre troncopiramidal verde',
    '',
    'DV',
    3.00,
    'L0,5 oc 2,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25570',
    'E-0196.35',
    'Baliza Metal Torre tronco piramidal roja',
    '',
    'GpD(3)R',
    9.00,
    '(L0,5 oc1,5)x2 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25590',
    'E-0197',
    'Baliza Torre cilíndrica verde sobre base verde',
    '',
    'GpD(4)V',
    11.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25600',
    'E-0197.2',
    'Baliza Torre cilíndrica roja sobre base roja',
    '',
    'GpD(4)R',
    11.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25620',
    'E-0197.5',
    'Baliza semaforo Panel circular blanco, bandas rojas en el tablero del puente',
    '',
    'Iso B',
    2.00,
    'L2 oc2',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25640',
    '',
    'Baliza Columna de hierro',
    '',
    'sin apariencia',
    0.00,
    'l10oc0',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25650',
    'E-0198',
    'faro',
    'Si SCADA',
    'GpD(3)',
    20.00,
    'L0.255+Oc3.745+L0.255+Oc3.745+L0.255+Oc11.74',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25660',
    'E-0199',
    'Baliza Torreta cuadrangular verde.',
    '',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25665',
    'E-0199.2',
    'Baliza Espeque rojo con la base blanca.',
    '',
    'GpD(3)R',
    11.00,
    '[(L0,5 oc1,5)x2] L0,5 oc6,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25667',
    'E-0199.6',
    'Baliza Poste cuadrangular rojo.',
    '',
    'GpD(4)R',
    11.00,
    '[(L0,5 oc1,5)x3] L0,5 oc5,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25700',
    'FValencia',
    'Faro',
    'Si SCADA',
    'D',
    10.00,
    'L 0,8 OC 9,2',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25720',
    'E-0200.4',
    'Baliza Cilíndrica verde base blanca',
    'RTU 06',
    'DV',
    5.00,
    'L1 oc4',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25721',
    'E-0200.5',
    'Baliza TPS 3.3',
    '',
    'DV',
    5.00,
    'L1 oc4',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25730',
    '',
    'Boya Castillete negra amarilla negra y marca de tope',
    'No lo necesita',
    'GRp(3)B',
    5.00,
    '[(L0.25 oc0.25)x2]   L0.25 oc3.75',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25740',
    '',
    'Boya Castillete roja y marca de tope',
    'No lo necesita',
    'D R',
    4.00,
    'L0.5 oc3.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25761',
    '',
    'Boya Castillete amarilla y marca de tope',
    'RTU 04',
    'GpD(4)A',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25765',
    '',
    'Boya Castillete amarilla y marca de tope',
    'RTU 02',
    'GpD(4)A',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25768',
    '',
    'Boya Castillete verde-roja-verde y marca de tope',
    'No',
    'GpD(2+1)V',
    9.00,
    'L0.6 oc0.6 L0.6 oc1.8 L0.6 oc5.4',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25774',
    'E-0201.11',
    'Baliza Cilíndrica roja, base blanca',
    'RTU 10',
    'GpD(2)R',
    7.00,
    'L0.5 oc 1.5 L0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25776',
    'E-0201.25',
    'Baliza TPS 3.3',
    '',
    'GpD(3)R',
    9.00,
    '[(L0.5 oc1.5)x2] L0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25777',
    'E-0201.16',
    'Baliza TPS 3.3',
    '',
    'GpD(3)R',
    9.00,
    '[(L 0.5 oc 1.5)x2] L0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25800',
    'E-0201.2',
    'Baliza TPS 3.3',
    '',
    'DR',
    3.00,
    'L 0.5 oc 2.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25805',
    '',
    'Boya marca especial BATEAS nº6',
    'No',
    'D/Fl A',
    5.00,
    'L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25806',
    '',
    'Boya marca especial BATEAS nº5',
    'no',
    'D/Fl A',
    5.00,
    'L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25820',
    'E-0201.4',
    'Baliza TPS 3.3',
    '',
    'GpD(2)V',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25820.1',
    '',
    'Boya Castillete verde y marca de tope',
    'Sí',
    'GpD(2)V',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25830',
    'E-0201.5',
    'Baliza TPS 4.8',
    '',
    'GpD(3)V',
    9.00,
    '[(L 0.5 oc 1.5)x2]  L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25831',
    '',
    'Baliza Columna cilíndrica verde con la base blanca.',
    '',
    'GpD(3)V',
    9.00,
    '[L0,5+oc 1,5]x2+L0,5+oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25840',
    'E-0202',
    'Baliza TPS 3.3',
    'RTU 44',
    'GpD(4)R',
    11.00,
    '[(0.5 oc 1.5)x3] L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25841',
    '',
    'Boya Castillete rojo y marca de tope',
    'RTU 54',
    'GpD(4)R',
    11.00,
    '[( L 0.5 oc 1.5)x3] L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25842',
    'E-0201.7',
    'Baliza TPS 3.3',
    '',
    'GpDV',
    3.00,
    'L 0.5 oc 2.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25842.5',
    '',
    'Boya Cilíndrica verde.',
    'Si.',
    'CtV',
    1.00,
    'L 0,5   oc 0,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25843',
    'E-0201.75',
    'Boya Castillete',
    'Si',
    'DR',
    3.00,
    'L 0.5 oc 2.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25843.5',
    '',
    'Boya Cilíndrica roja',
    'Si',
    'CtR',
    1.00,
    'L 0,5   oc 0,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25843.8',
    '',
    'Boya Cilíndrica roja',
    'Si',
    'CtR',
    1.00,
    'L 0,5   oc 0,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25844',
    '',
    'Boya oceanográfica Castillete amarilla y marca de tope',
    'RTU 37',
    'GpD(4)A',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25850',
    'E-0203.4',
    'Baliza Poliester reforzado con fibra de vidrio',
    'REU 54',
    'GpD(2 1)V',
    14.50,
    'L0.5 oc 1 L 0.5 oc 3 L 0.5 oc 9',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25920',
    'E-0204.2',
    'Baliza TPS 3.3',
    'RTU 13',
    'GpD(4)V',
    11.00,
    '[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25940',
    'E-0204',
    'Baliza TPS 3.3',
    '',
    'GpDR',
    3.00,
    'L 0.5 oc 2.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '25960',
    'E-0205',
    'Baliza Poliester reforzado con fibra de vidrio',
    'Sí RTU 43',
    'GpD(2+1)R',
    14.50,
    'L0.5 oc 1 L 0.5 oc 3 L 0.5 oc 9',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26020',
    'E-0206.7',
    'Baliza SUR Tronco piramidal negro-amarillo con marca de tope.',
    'No',
    'GpRp(6)B',
    10.00,
    '[(L0.25 oc0.25)x6] L2 oc5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26021',
    'E-0208.6',
    'Baliza TPS 3.3',
    '',
    'GpD(2)V',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26025',
    'E-0208.65',
    'Baliza TPS 3.3',
    '',
    'GpD(2)R',
    7.00,
    'L 0.5 oc 1.5 L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26035',
    'E-0208.75',
    'Baliza Tronco piramidal metálica',
    '',
    'GpD(3)V',
    9.00,
    '[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26041',
    'E-0208.8',
    'Baliza Tronco piramidal metálica',
    '',
    'GpD(3)R',
    9.00,
    '[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26045',
    'E-0208.84',
    'Baliza Estribor Tronco piramidal metálica',
    '',
    'CtV',
    1.00,
    'L0.3 oc0.7',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26046',
    'E-0208.86',
    'Baliza Babor Tronco piramidal metálica',
    '',
    'CtR',
    1.00,
    'L0.3 oc0.7',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26047',
    '',
    'Baliza Torre cilíndrica verde',
    'RTU 35',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26047.1',
    '',
    'Baliza Cilíndrica con base cónica, negra amarilla negra con marca tope',
    'Si.',
    'GpRp(3)B',
    5.00,
    '[(L0,25 oc0,25)x2]+L0,25 oc3,75',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26047.2',
    '',
    'Baliza Poliester reforzado con fibra de vidrio',
    'RTU 33',
    'RpB',
    0.50,
    'L 0,25 + oc 0,25',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26047.51',
    '',
    'Boya marca especial BATEAS nº3',
    'No',
    'D/Fl A',
    5.00,
    'L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26047.52',
    '',
    'Boya marca especial BATEAS nº2',
    'No',
    'D/Fl A',
    5.00,
    'L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26047.53',
    '',
    'Boya marca especial BATEAS nº1',
    'nO',
    'D/Fl A',
    5.00,
    'L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26048',
    '',
    'Baliza Torre cilíndrica con base cónica roja',
    '',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26048.07',
    '',
    'Boya marca especial BATEAS nº4',
    'nO',
    'D/Fl A',
    5.00,
    'L 0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26048.1',
    '',
    'Baliza Torre cilíndrica con base cónica roja',
    '',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26048.2',
    '',
    'Boya Elastomero (Espuma polietileno cubierta de poliuretano)',
    'RTU 31',
    'RpB',
    0.50,
    'L0.25+  oc 0.25',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26048.3',
    '',
    'Boya Elastomero (Espuma polietileno cubierta de poliuretano)',
    'RTU 32',
    'RpB',
    0.50,
    'L02.5 + oc 0.25',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26049',
    '',
    'Boya Fibra de vidrio',
    'No',
    'CtR',
    0.50,
    'L0,25 oc 0,25',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26050',
    'E-0199.9',
    'Baliza Acero',
    'No',
    'CtR',
    0.50,
    'L0,25 oc 0,25',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26052',
    'E-0199.91',
    'Baliza Poste Acero',
    'No',
    'CtV',
    0.50,
    'L0,25 oc 0,25',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26052.5',
    '',
    'Boya Cilíndrica',
    'Si',
    'D A',
    5.00,
    'Fija',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26052.7',
    '',
    'Boya Cilíndrica',
    'Si',
    'D A',
    5.00,
    'Fija',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26055',
    'E-0199.92',
    'Baliza Poste rojo con paneles cuadrangulares adosados',
    '',
    'DR',
    5.00,
    'L0.5 oc4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26055.5',
    'E-0199.925',
    'Baliza Poste rojo, verde, rojo con paneles triangulares adosados',
    'No',
    'GpD(2+1)R',
    14.50,
    'L0.5 oc1 L0.5 oc3 L0.5 oc9',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26055.6',
    'E-0199.926',
    'Baliza Poste cilindrico rojo con paneles cuadrangulares adosados.',
    '',
    'GpD(2)R',
    7.00,
    'L0.5 oc1.5 L0.5 o4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26056',
    'E-0199.93',
    'Baliza Poste verde con paneles triangulares adosados',
    '',
    'DV',
    5.00,
    'L0.5 oc4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26058',
    'E-0199.94',
    'Baliza Poste verde, rojo, verde con paneles triangulares adosados',
    'No',
    'GpD(2+1)V',
    14.50,
    'L0.5 oc1 L0.5 oc3 L0.5 oc9',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26058.1',
    'E-0199.945',
    'Baliza Poste cilindrico amarillo con paneles triangulares adosados',
    '',
    'DA',
    5.00,
    'L0.5 o4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26058.15',
    '',
    'BALIZA semaforo Panel metalico con el fondo negro.',
    '',
    'Luz fija (tres luces rojas superpuestas)',
    1.00,
    'Fija',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26058.16',
    '',
    'BALIZA semaforo Panel metalico con el fondo negro.',
    '',
    'Luz fija (tres luces rojas superpuestas)',
    1.00,
    'Fija',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26058.17',
    '',
    'BALIZA semaforo Panel metalico con el fondo negro.',
    '',
    'Luz fija (tres luces rojas superpuestas)',
    1.00,
    'Fija',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26058.2',
    'E-0199.96',
    'Baliza Poste cilindrico verde.',
    '',
    'GpD(2)V',
    7.00,
    'L0.5 oc1.5 L0.5 o4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26058.4',
    'E-0199.97',
    'Baliza Poste cilíndrico rojo.',
    '',
    'GpD(3)R',
    9.00,
    '[(L0.5 oc1.5)x2]+ L0.5 o4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26058.6',
    'E-0199.98',
    'Baliza Poste cilíndrico verde.',
    '',
    'GpD(3)V',
    9.00,
    '[(L0.5 oc1.5)x2]+ L0.5 o4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26058.8',
    'E-0199.99',
    'Baliza Poste cilíndrico rojo.',
    'No',
    'GpD(4)R',
    11.00,
    '[(L0.5 oc1.5)x3]+ L0.5 o4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26060',
    '',
    'Boya Castillete amarillo Marca de tope un aspa amarilla',
    'Sí',
    'GpD(4)A',
    1.00,
    'borrada por error',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26083',
    '0',
    'Boya ODAS SW 6020',
    '0',
    '0',
    0.00,
    '0',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26150',
    'E-0209.6',
    'Baliza Torrete cilíndrica roja blanca',
    'SPC88',
    'GpD(3)R',
    9.00,
    '[(L0,5+oc1,5)x2]+L0,5+oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26160',
    'E-0209.7',
    'Baliza Torrete cilíndrica verde blanca',
    'SPC88',
    'GpD(3)V',
    9.00,
    '[(L0,5+oc1,5)x2]+L0,5+oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26190',
    '',
    'Boya Peligro aislado. Espeque negra roja negra',
    'no',
    'GpD(2)B',
    5.00,
    'L0,5 oc1 L0,5 oc3',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26200',
    'E-0210',
    'Baliza E Torreta cilíndrica sobre caseta de hormigón',
    '',
    'GpD(2)V',
    5.00,
    'L0,5 oc0,7 L0,5 oc3',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26202',
    'E-0210.73',
    'Baliza E Torreta troncocónica',
    '',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2] L0,5 oc4',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26205',
    'E-0210.74',
    'Baliza CE Columna cilíndrica',
    '',
    'GpRp(3)B',
    5.00,
    '[(L0,25 oc0,25)x2] L0,25 oc3,75',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26220',
    'E-0210.5',
    'Baliza B Torreta cilíndrica sobre caseta de hormigón',
    '',
    'GpD(2)R',
    5.00,
    'L0,5 oc0,7 L0,5 oc3',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26230',
    'E-0210.7',
    'Baliza B Columna cuadrangular adosada a muro azul.',
    '',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26270',
    '',
    'Boya ME Castillete amarillo ( X )',
    'NO',
    'GpD(4)A',
    11.00,
    '[(L0,5+oc1,5)x3]+L0,5+oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26285',
    'E-0210.75',
    'Baliza BE Metalica Moncada',
    'RTU 38 (5 hilos)',
    'DV',
    5.00,
    'L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26290',
    'E-0210.9',
    'Baliza E TPS 3.3',
    '',
    'GpD(2)V',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26311',
    'E-0210.8',
    'Baliza CS TPS 3.3',
    'RTU 19 (5 hilos)',
    'GpRp(6) DLB',
    10.00,
    '[(L0,25 oc0,25)x 6] L2 oc5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26312',
    'E-0211',
    'Baliza B TPS 3.3',
    '',
    'DR',
    5.00,
    'L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26313',
    '',
    'Boya ME Castillete  amarillo ( X )',
    'RTU 28 (5 hilos)',
    'GpD(4)A',
    11.00,
    '[ ( L0,5 oc1,5 )x 3 ] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26314',
    'E-0212.1',
    'Baliza B TPS 3.3',
    '',
    'GpD(2)R',
    7.00,
    'L0,5 oc1,5 L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26320',
    '',
    'Boya E Castillete verde( ^ )',
    'No lo necesita',
    'GpD(3)V',
    9.00,
    '[ ( L0,5 oc1,5 ) x 2 ]  L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26325',
    'E-0212.2',
    'Baliza BB TPS 3.3',
    'RTU 11 (5 hilos)',
    'GpD(2+1)R',
    5.00,
    'L0,5 oc1 L0,5 oc3 L0,5 oc9',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26326',
    '',
    'Baliza E MTP-35',
    '',
    'Ct V',
    1.00,
    'L 0.5 oc 0.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26360',
    '',
    'Boya E Castillete verde(^ )',
    'RTU 08 (3 hilos)',
    'GpD(4)V',
    11.00,
    '[ ( L0,5 oc1,5 ) x 3 ] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26375',
    '',
    'Baliza B torre poligonal metálica',
    'NO',
    'GpD(4)R',
    11.00,
    '[ ( L0,5 oc1,5 )x 3 ] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26380',
    'E-0214',
    'Baliza B TPS 3.3',
    'RTU 40 (5 hilos)',
    'GpD(2+1)R',
    14.50,
    'L0,5 oc1 L0,5 oc3 L0,5 oc9',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26390',
    'E-0214.6',
    'Baliza E TPS 3.3',
    '',
    'DV',
    3.00,
    'L0,5 oc2,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26392',
    'E-0214.7',
    'Baliza B TPS 3.3',
    '',
    'DR',
    3.00,
    'L0,5 oc2,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450',
    'E-0212.6',
    'Baliza CE Metalica Torre cilíndrica',
    'RTU 39 (5 hilos)',
    'GpCt(3)B',
    5.00,
    '[(L0,3 oc0,8) x2 ] L0,3 oc2,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-a',
    '0',
    'Boya Marca especial',
    '0',
    'DA',
    5.00,
    'L0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-b',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-c',
    '0',
    'Boya Marca especial',
    '0',
    'DA',
    5.00,
    'l0.5  Oc4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-d',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-e',
    '0',
    'Boya Marca especial',
    '0',
    'DA',
    5.00,
    'L0,5 OC 4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-f',
    '0',
    'Boya Marca especialll',
    'No',
    'DA',
    1.00,
    'L0.5 oc 0.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-g',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-h',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-i',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 0.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26450-j',
    '0',
    'Boya Marca especial',
    'NO',
    'DA',
    1.00,
    'L0.5 oc 4.5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26465',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'DA',
    5.00,
    'L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26465.1',
    '',
    'Boya De castillete amarilla y marca de tope  X amarilla',
    '',
    'DA',
    6.00,
    'L0,7 oc1,8',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26465.3',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'DA',
    6.00,
    'L0,7 oc1,8',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26465.4',
    '',
    'Boya De castillete amarilla y marca de tope X amarilla',
    '',
    'DA',
    6.00,
    'L0,7 oc1,8',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26470',
    '',
    'Boya SUPRIMIDA De castillete amarilla y marca de tope X amarilla',
    '',
    'GpD(4)A',
    1.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26471',
    '',
    'Boya SUPRIMIDA De castillete amarilla marca de tope  X amarilla',
    '',
    'GpD(4)A',
    1.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26472',
    '',
    'Boya SUPRIMIDA De castillete amarilla y marca de tope X amarilla',
    '',
    'GpD(4)A',
    1.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26473',
    '',
    'Boya SUPRIMIDA De castillete amarilla y marca de tope X amarilla',
    '',
    'GpD(4)A',
    1.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26500',
    'FCanet',
    'Faro',
    'Si',
    'GpD(2)',
    10.00,
    'L0,5+oc2+L0,5+oc7',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26504',
    'E-0217',
    'Baliza Columna verde con la base blanca.',
    '',
    'GpD(3)V',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26508',
    'E-0217.2',
    'Baliza Columna verde con la base blanca.',
    '',
    'GpD(4)V',
    11.00,
    '[(L0,5 oc1,5)x3] L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26510',
    'E-0217.4',
    'Baliza Columna roja con la base blanca.',
    '',
    'GpD(3)R',
    9.00,
    '[(L0,5 oc1,5)x2]+L0,5 oc4,5',
    0
  );
INSERT INTO
  `balizamiento` (
    `nif`,
    `num_internacional`,
    `tipo`,
    `telecontrol`,
    `apariencia`,
    `periodo`,
    `caracteristica`,
    `necesita_pintado`
  )
VALUES
  (
    '26512',
    'E-0217.5',
    'Baliza Columna roja con la base blanca.',
    '',
    'GpD(4)R',
    1.00,
    '[(L0,5 oc1,5)x3]+L0,5 oc4,5',
    0
  );

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
    '25805',
    'Puerto de Valencia',
    0,
    '0',
    '39º 26.490\' N',
    '000º 18.600\' W'
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
    '25806',
    'Puerto de Valencia',
    0,
    '',
    '39º 26.628\' N',
    '00º 18.522\' W'
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
    '26047.51',
    'Puerto de Valencia',
    0,
    '0',
    '39º 26.724\' N',
    '000º 17.526\' W'
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
    '26047.52',
    'Puerto de Valencia',
    0,
    '0',
    '39º 26.952\' N',
    '000º 17.412\' W'
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
    '26047.53',
    'Puerto de Valencia',
    0,
    '',
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
    '26048.07',
    'Puerto de Valencia',
    0,
    '',
    '39º 27.001\' N',
    '000º 17.706\' W'
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
    '39º 39.768´N',
    '0º 11.824´W'
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
    '40º 26.688´N',
    '2º 6.563´E'
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
    '38º 57.438´N',
    '1º 34.922´E'
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
    '39º 30.115´N',
    '0º 5.273´E'
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
    '40º 50.694´N',
    '1º 24.375´E'
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
  ('25805', 2.00, 2.00, 0.00, 'MCL100', 0.00, 1.00, 0.00);
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
  ('25806', 2.00, 2.00, 0.00, 'MCL100', 0.00, 1.00, 0.00);
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
  (
    '26047.51',
    2.00,
    2.00,
    0.00,
    'MCL100',
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
    '26047.52',
    2.00,
    2.00,
    0.00,
    'MCL100',
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
    '26047.53',
    2.00,
    2.00,
    0.00,
    'MCL100',
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
    '26048.07',
    2.00,
    2.00,
    0.00,
    'MCL100',
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
  ('26504', 0.00, 0.00, 0.04, '00', 0.02, 0.02, 0.01);
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

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

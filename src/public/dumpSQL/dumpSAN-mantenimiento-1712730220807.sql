/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mantenimiento
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mantenimiento` (
  `id_mantenimiento` int(10) NOT NULL AUTO_INCREMENT,
  `nif` varchar(8) NOT NULL,
  `fecha` date NOT NULL,
  `mantenimiento` varchar(250) NOT NULL,
  PRIMARY KEY (`id_mantenimiento`),
  KEY `mantenimiento_FK` (`nif`)
) ENGINE = InnoDB AUTO_INCREMENT = 1189 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de mantenimiento del balizamiento';

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: observaciones
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `observaciones` (
  `id_observacion` int(10) NOT NULL AUTO_INCREMENT,
  `nif` varchar(8) NOT NULL,
  `observaciones` varchar(250) NOT NULL,
  PRIMARY KEY (`id_observacion`),
  KEY `observaciones_FK` (`nif`)
) ENGINE = InnoDB AUTO_INCREMENT = 188 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'tabla de observaciones del balizamiento';

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
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1038,
    '26314',
    '2023-05-09',
    'Se sustituye la linterna por una compacta, debido a problemas en el suministro electrico.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1039,
    '26312',
    '2023-05-09',
    'Se sustituye la linterna por una compacta, debido a problemas en el suministro electrico.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1040,
    '26048',
    '2023-04-26',
    'Fallo comunicación. Se soluciona incidencia por parte de ANFER cambiando la emisora que se tenía en STOCK.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1041,
    '25530',
    '2023-04-12',
    'Acceso a enjaulado mediante rotura de verja por acto bandálico. Se retira jaula por taller mecánico y se instala trapa con candado en escalera acceso linterna'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1042,
    '25545',
    '2022-07-15',
    'Se cambia batería (155Ah)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1043,
    '25565',
    '2022-09-19',
    'Se cambia batería (100Ah)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1044,
    '25560',
    '2022-10-05',
    'Se cambia batería (100Ah)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1045,
    '25555',
    '2022-06-08',
    'Se cambia batería (155Ah)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1046,
    '25530',
    '2022-09-29',
    'Se cambia batería (100Ah)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1047,
    '25530',
    '2023-04-15',
    'Acceso a enjaulado mediante rotura de verja por acto bandálico. Se retira jaula por taller mecánico y se instala trapa con candado en escalera acceso linterna'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1048,
    '25563',
    '2023-04-17',
    'Pintada a falta de añadir escalones'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1049,
    '26047.2',
    '2023-01-27',
    'Se repinta toda la señal'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1050,
    '26052',
    '2023-01-01',
    'Pasa a formar parte del balizamiento gestionado por la APV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1051,
    '26049',
    '2023-01-01',
    'Pasa a formar parte del balizamiento gestionado por la APV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1052,
    '26050',
    '2023-01-01',
    'Pasa a formar parte del balizamiento gestionado por la APV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1053,
    '26052.5',
    '2023-01-01',
    'Pasa a formar parte del balizamiento gestionado por la APV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1054,
    '26052.7',
    '2023-01-01',
    'Pasa a formar parte del balizamiento gestionado por la APV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1055,
    '26055',
    '2023-01-01',
    'Pasa a formar parte del balizamiento gestionado por la APV.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1057,
    '26360',
    '2023-05-17',
    'Cambio por boya EBM20-HV, linterna MCL360M GPS+UHF, cadena 40mm, 3 grilletes fijos 40mm, 1 grillete giratorio 40mm y peso muerto 1 TN.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1058,
    '26320',
    '2023-05-17',
    'Cambio por boya EBM20-HV, linterna MCL360M GPS+UHF, cadena 40mm, 3 grilletes fijos 40mm, 1 grillete giratorio 40mm y peso muerto 1 TN.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1059,
    '26313',
    '2023-05-25',
    'Presenta signos de oxidación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1060,
    '26450-e',
    '2023-05-25',
    'Pérdida de marca de tope'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1061, '26048.07', '2023-04-14', 'Boya fondeada.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1062, '26047.51', '2023-04-14', 'Boya fondeada.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1063, '26047.52', '2023-04-14', 'Boya fondeada.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1064, '26047.53', '2023-04-14', 'Boya fondeada.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1065, '25806', '2023-04-14', 'Boya fondeada.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1066, '25805', '2023-04-14', 'Boya fondeada.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1067,
    '25650',
    '2023-06-05',
    'Reparación averia fontaneria en vivienda auxiliar derecha, tuberias muy oxidadas'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1068,
    '26500',
    '2023-05-04',
    'Alarma pulsador taller'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1069,
    '26500',
    '2023-05-05',
    'Se cambia el cristal del pulsador por rotura pulsador'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1070,
    '26500',
    '2023-02-17',
    'Avería en cargador y baterías de la baliza de emergencia.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1071,
    '26500',
    '2023-06-21',
    'Se cambia el cargador y baterías de la baliza de emergencia.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1072,
    '26500',
    '2023-06-06',
    'Se pone línea de vida para trabajos en altura en el exterior de la linterna.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1073,
    '26500',
    '2023-02-24',
    'Se acaba la valla caída a falta de pintarla.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1074,
    '26450',
    '2023-06-28',
    'Tras las obras se desplaza la boya cerca del pantalán '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1075,
    '25570',
    '2023-03-15',
    'Se repinta toda la señal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1076,
    '25720',
    '2023-06-30',
    'SE REARMA EL DIFERENCIAL DE CABECERA '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1077,
    '25700',
    '2023-06-16',
    'Se da de baja por averia en la rotación. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1078,
    '25700',
    '2023-06-20',
    'Se da de alta. Esta funcionando aunque da un aviso de \"fallo en motor 2\", funciona correctamente.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1079, '25700', '2023-03-23', 'Se da de alta.');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1080,
    '25960',
    '2023-07-20',
    'Se cambia cargador C20 por avería'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1081,
    '25765',
    '2023-07-31',
    'Revisión anual a cargo de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1082,
    '25768',
    '2023-07-31',
    'Revisión anual a cargo de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1083,
    '25820.1',
    '2023-08-02',
    'Revisión anual a cargo de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1084,
    '25730',
    '2023-07-28',
    'Revisión anual a cargo de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1085,
    '25740',
    '2023-07-28',
    'Revisión anual a cargo de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1086,
    '25761',
    '2023-07-28',
    'Revisión anual a cargo de Wartsila.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1087,
    '26048.3',
    '2023-08-01',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1088,
    '25841',
    '2023-08-02',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1089,
    '25842.5',
    '2023-08-08',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1090,
    '25843',
    '2023-08-18',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1091,
    '25843.5',
    '2023-08-18',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1092,
    '25843.8',
    '2023-08-18',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1093,
    '25650',
    '2023-08-11',
    'Se rearma diferencial del telecontrol de Anfer.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1094,
    '26450-a',
    '2023-08-17',
    'Pérdida de la marca de tope'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1095,
    '26314',
    '2023-08-29',
    'Se repone la linterna original quedando en servicio'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1096,
    '26047.53',
    '2023-08-04',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1097,
    '26047.52',
    '2023-08-04',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1098,
    '26047.51',
    '2023-08-04',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1099,
    '26048.07',
    '2023-08-04',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1100,
    '26313',
    '2023-08-23',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1101,
    '26320',
    '2023-08-23',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1102,
    '26360',
    '2023-08-23',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1103,
    '26450',
    '2023-08-25',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1104,
    '26450-a',
    '2023-08-25',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1105,
    '26450-b',
    '2023-08-25',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1106,
    '26450-c',
    '2023-08-25',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1107,
    '26450-d',
    '2023-08-24',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1108,
    '26450-e',
    '2023-08-25',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1109,
    '26450-f',
    '2023-08-24',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1110,
    '26450-g',
    '2023-08-30',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1111,
    '26450-h',
    '2023-08-30',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1112,
    '26450-i',
    '2023-08-30',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1113,
    '26450-j',
    '2023-08-23',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1114,
    '26190',
    '2023-08-30',
    'Wartsila realiza revisión submarina.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (1115, '26313', '2023-09-12', '');
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1116,
    '26312',
    '2023-09-12',
    'Se repone su linterna original.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1117,
    '26450-a',
    '2023-10-17',
    'Se repone la marca de tope. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1118,
    '26450-e',
    '2023-10-17',
    'Se repone la marca de tope.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1119,
    '25563',
    '2023-12-19',
    'Mecanicos sueldan escalones (Falta un escalon)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1120,
    '25563',
    '2024-01-09',
    'Se da  de baja portal ATON fallo linterna'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1121,
    '25563',
    '2024-01-10',
    'Se cambia bateria y sanea cableado cerrando la incidencia portal ATON'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1122,
    '25650',
    '2023-11-13',
    'LA empresa SICE finaliza los trabajos de reparacion puerta corredera y reposicion bolardo entrada puerta principal'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1123,
    '25650',
    '2023-12-01',
    'Averia BAEM (Fallo rotación)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1124,
    '26290',
    '2024-02-02',
    'Se ha quitado la cámara de vigilancia y se sella la ventana de la caseta de almacenamiento. '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1125,
    '26285',
    '2024-01-31',
    'Entra humedad por la ventana.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1126,
    '26390',
    '2024-01-31',
    'se sustituye la batería por una de 180A'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1127,
    '26500',
    '2024-02-02',
    'Persiste la avería de la linterna de emergencias'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1128,
    '26500',
    '2024-02-08',
    'Se cambia la \"lámpara 1\" de la baliza principal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1129,
    '26058.6',
    '2024-02-27',
    'Se da de baja para su reparación'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1130,
    '26058.6',
    '2024-03-11',
    'Se sustituye linterna SP120 por una MCL 200 con num de serie 572-2016'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1131,
    '26058.4',
    '2024-02-27',
    'Se da de baja por averia.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1132,
    '26058.4',
    '2024-03-11',
    'Se da de alta al sustituir la Linterna destelladora autoalimentada por una MCL180'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1133,
    '26055',
    '2024-02-27',
    'Se da de baja por averia.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1134,
    '26058',
    '2024-02-27',
    'Se da de baja por averia.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1135,
    '26055',
    '2024-03-12',
    'Se da de alta al sustituir la linterna por una MCL330.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1136,
    '25650',
    '2024-03-12',
    'Se engrasa corona y mecanismos linterna principal'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1137,
    '26058',
    '2024-03-13',
    'Se resuelve los problemas en la linterna y se da de alta. Es recomendable sustituirla por una nueva.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1138,
    '25700',
    '2024-03-13',
    'Se recibió un aviso del CCE informando de que prácticos avisarón que no funcionaba. Pasó esa noche con la BAEM funcionando con alcance reducido. No se notificó en el portal AtoN.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1139,
    '25700',
    '2017-01-20',
    'Se taponan las entradas de canalziación externas que dispone el Faro que es por donde tienen la entrada. Se sanea cableado dañado y limpieza exhaustiva de los cuadros. Se empieza a colocar trampas roedores.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1140,
    '25700',
    '2015-08-05',
    'Averia baliza principal encendida no gira. Se solventa en la mañana siguiente por parte de MSM.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1141,
    '25700',
    '2015-08-07',
    'Averia baliza principal encendida no gira. Se deja en funcionamiento reducido con la BAEM.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1142,
    '25700',
    '2015-08-09',
    'MSM desmonta la baliza tratando de localizar la una avería mecánica y descubren que efectivamente el problema es mecánico y deciden estudiar una solución.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1143,
    '25700',
    '2015-08-11',
    'Se vuelve a desmontar la baliza para instalarle a modo de prueba un nuevo volante de inercia de unos 80 kg.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1144,
    '25700',
    '2015-08-15',
    'Se observan fallos de rotación de nuevo y se comentan a MSM.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1145,
    '25700',
    '2015-08-17',
    'Marcos acompaña a los técnicos de MSM para intentar ajustar las revoluciones de los motores. No lo consiguen. Deja en funcionamiento de nuevo la baliza de emergencias y la cardinal.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1146,
    '25700',
    '2015-08-25',
    'MSM desmonta toda la baliza principal y se la lleva a su taller para reparar y sustituir las piezas dañadas. Al parecer un cojinete esta defectuoso.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1147,
    '25700',
    '2015-11-01',
    'MSM instala de nuevo la baliza y hace pruebas de funcionamiento. Parece que todo va bien, pero por la noche se enciende la principal y la BAEM a la vez.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1148,
    '25700',
    '2015-11-02',
    'Se persona MSM para repasar la instalacion y se deja en correcto funcionamiento. Se establece un operativo de especial vigilancia por parte de MSM.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1149,
    '26450-g',
    '2024-03-21',
    'Se da de baja pues no se encuentra en su ubicación. Boya perdida.'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1150,
    '25740',
    '2024-01-24',
    'La baliza ha sido arrancada y solo está la base de la misma como se aprecia en la foto. Se sustituye por una con las mismas características y ritmo. Se da de alta en el portal-AtoN '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1151,
    '25841',
    '2024-02-01',
    'Funcionamiento anomalo de linterna (baja luminosidad). Se sustituye rele solido control de corriente lampara en cuandro telecontrol'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1152,
    '25730',
    '2024-02-21',
    'Cambio de optica MCL360 (defecto de fabrica)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1153,
    '26047.53',
    '2024-02-21',
    'Cambio de optica MCL360 (defecto de fabrica'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1154,
    '26047.52',
    '2024-02-21',
    'Cambio de optica MCL360 (defecto de fabrica'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1155,
    '26047.51',
    '2024-02-21',
    'Cambio de optica MCL360 (defecto de fabrica'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1156,
    '26048.07',
    '2024-02-21',
    'Cambio de optica MCL360 (defecto de fabrica'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1157,
    '25806',
    '2024-02-21',
    'Cambio de optica MCL360 (defecto de fabrica) y cambio de bateria (defecto de fabrica)'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1158,
    '25805',
    '2024-02-21',
    'Cambio de optica MCL360 (defecto de fabrica'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1159,
    '26058',
    '2024-02-27',
    'Se da  de baja portal ATON fallo linterna'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1160,
    '26058',
    '2024-03-13',
    'Se repara linterna y se da de alta en portal ATON'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1162,
    '26058.1',
    '2024-02-27',
    'Se da  de baja portal ATON fallo linterna'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1163,
    '26058.1',
    '2024-03-06',
    'Se repara linterna y se da de alta en portal ATON'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1164,
    '26390',
    '2024-03-28',
    'Se cambia la batería y se queda momentáneamente en modo autónomo sin telecontrol'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1165,
    '26048.2',
    '2024-04-02',
    'Se cambian las dos baterias (2017), por fallo de alimentación '
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1166,
    '25721',
    '2024-04-04',
    'Se rearma el IA del cuadro de BT del CT42 y se tapan los tubos de la acometida de BT a la baliza para reducir las humedades existentes en el interior de la misma'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1167,
    '25721',
    '2024-04-05',
    'Se sustituye el C20 debido al mal funcionamiento del mismo'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1169,
    '25840',
    '2022-11-09',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1170,
    '25940',
    '2022-07-21',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1171,
    '25850',
    '2022-06-23',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1172,
    '26047',
    '2023-01-04',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1173,
    '25774',
    '2022-01-13',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1174,
    '26390',
    '2022-01-04',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1175,
    '26311',
    '2023-01-10',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1176,
    '26314',
    '2023-01-09',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1177,
    '26392',
    '2023-01-09',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1178,
    '25570',
    '2023-01-09',
    'Se repintó en concepto de 2022 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1179,
    '25960',
    '2023-12-14',
    'Se repintó en concepto de 2023 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1180,
    '25820',
    '2023-12-09',
    'Se repintó en concepto de 2023 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1181,
    '25776',
    '2023-12-09',
    'Se repintó en concepto de 2023 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1182,
    '25777',
    '2023-12-09',
    'Se repintó en concepto de 2023 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1183,
    '25800',
    '2023-12-09',
    'Se repintó en concepto de 2023 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1184,
    '26285',
    '2023-12-09',
    'Se repintó en concepto de 2023 Nuñez dirá fecha... Pared incluida'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1185,
    '26290',
    '2023-12-09',
    'Se repintó en concepto de 2023 Nuñez dirá fecha... Pared y rejas incluidas'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1186,
    '26312',
    '2023-12-09',
    'Se repintó en concepto de 2023 Nuñez dirá fecha... Pared incluida'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1187,
    '25570',
    '2023-12-09',
    'Se repintó en concepto de 2023 Nuñez dirá fecha...'
  );
INSERT INTO
  `mantenimiento` (`id_mantenimiento`, `nif`, `fecha`, `mantenimiento`)
VALUES
  (
    1188,
    '25565',
    '2023-12-09',
    'Se repintó en concepto de 2023 Nuñez dirá fecha...'
  );

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
  (161, '26049', 'Superficie Visual 1.13041m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (162, '25470', 'dtfyflkl');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (163, '25470', 'asdgsdhdfjkgflkfgyhñl2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (164, '26055.5', 'Sup.Visual: 1.4m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (165, '26058', 'Sup.Visual: 1.15m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (166, '26055.6', 'Sup.Visual: 0.9m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (167, '26058.2', 'sup.visual: 0.87m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (168, '26058.4', 'Sup.Visual: 0.82m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (169, '26058.6', 'Sup.Visual: 0.60m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (170, '26058.8', 'Sup.Visual: 0.60m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (171, '26060', 'Sup.Visual: 1.43041m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (172, '26060', 'Diametro 1.2m');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (173, '26058.1', 'Sup.Visual: 1.04m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (174, '26050', 'Sup.Visual: 2.80m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (175, '26055', 'Sup.Visual: 0.93212736m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (176, '26056', 'Sup.Visual: 1.08440116m2');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    178,
    '25650',
    'Puerta corredera  y bolardo entrada averiada (No funciona correctamente la apertuar por mando) 2022'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    179,
    '25650',
    'Puerta corredera golpeada y sacada carril en 08/22 debido a bolardo entrada averiada ( Se avisa a Rafa Trilles para reparación)'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    180,
    '25650',
    'Se observan grietas en cúpula de cristal 01/2023 / Rotura parcial de uno de los cristales 12/3/2024'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    181,
    '25650',
    'Desprendimiento de cascotes en torre del faro 02/23'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (182, '25560', 'Se recomienda pintar 2023');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (183, '26285', 'AIS apagado');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    184,
    '26450',
    'Longitud de cadena 37m. Diametro 30mm.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (185, '25650', '');
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (
    186,
    '25650',
    'reparacion de la puerta de entrada por accidente de vehículo que saco la puerta de su carril,reparada por taller.'
  );
INSERT INTO
  `observaciones` (`id_observacion`, `nif`, `observaciones`)
VALUES
  (187, '26041', 'Cambiar Optica');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

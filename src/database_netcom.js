import mysql from 'mysql2';
import { promisify } from 'util';
import { stringify } from 'querystring';
import { config }  from './config.js'; //traigo el database desde el archivo
const pool_NETCOM = mysql.createPool(config.database_NETCOM);

pool_NETCOM.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('La conexion con la Database_NETCOM fue cerrada');
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('La Database_NETCOM tiene demasiadas conexiones');
        }
        if (err.code === 'ECONNREFUSED') {
            console.error('database_NETCOM conexion fue rechazada');
            return 'ECONNREFUSED';
        }
        if (err.code === 'ER_ACCESS_DENIED_ERROR') {
            console.error('ACCESO _NETCOM denegado\n'+ stringify( config.database_NETCOM));
        }
        if (err.code === 'ETIMEDOUT') {
            console.error('ACCESO _NETCOM denegado\n'+ stringify( config.database_NETCOM));
        }
    } else if (connection) {
        connection.release(); //con esto empieza la conexion
        console.log('DB_NETCOM is Connected');
    }
    return;
});

//promisify pool queries. Convierte codigo de callbacks a codigo de promesas
pool_NETCOM.query = promisify(pool_NETCOM.query); //cada vez que haga una consulta, se podrán usar promesas.

export default pool_NETCOM;


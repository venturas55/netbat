import mysql from 'mysql2';
import { promisify } from 'util';
import { stringify } from 'querystring';
import { config }  from './config.js'; //traigo el database desde el archivo
const pool_VPS = mysql.createPool(config.database_VPS);

pool_VPS.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('La conexion con la database_VPS fue cerrada');
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('La database_VPS tiene demasiadas conexiones');
        }
        if (err.code === 'ECONNREFUSED') {
            console.error('database_VPS conexion fue rechazada');
            return 'ECONNREFUSED';
        }
        if (err.code === 'ER_ACCESS_DENIED_ERROR') {
            console.error('ACCESO denegado\n'+ stringify( config.database_VPS));
        }
    } else if (connection) {
        connection.release(); //con esto empieza la conexion
        console.log('database_VPS is Connected');
    }
    return;
});

//promisify pool_VPS queries. Convierte codigo de callbacks a codigo de promesas
pool_VPS.query = promisify(pool_VPS.query); //cada vez que haga una consulta, se podrán usar promesas.

export default pool_VPS;


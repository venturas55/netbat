import { schedule } from 'node-cron';
import db from "../database_vps.js"; //db hace referencia a la BBDD
import { opcua } from "./opcua.js";


function generarDatos() {
    return {
        id_estacion: 1,
        velocidad_media_viento: (Math.random() * 40).toFixed(2),
        direccion_viento: Math.floor(Math.random() * 360),
        racha_viento: (Math.random() * 60).toFixed(2),
        temperatura: (Math.random() * 35).toFixed(2),
        presion: (1005 + Math.random() * 20).toFixed(2)
    };
}
function getDatos(estacion) {
    return await opcua(estacion.ip);
}

function insertarDatos(estacion, data) {
    await db.query(
        `INSERT INTO mediciones 
        (id_estacion, velocidad_media_viento, direccion_viento, racha_viento, temperatura, presion)
        VALUES (?, ?, ?, ?, ?, ?)`,
        [
            estacion.id_estacion,
            data.velocidad_media_viento,
            data.direccion_viento,
            data.racha_viento,
            data.temperatura,
            data.presion
        ]
    );

}



function iniciarCron() {
    schedule('*/5 * * * *', async () => {
        let conn;

        try {
            const data = generarDatos();

            var estaciones = await db.query('select * from estaciones');

            estaciones.forEach(estacion => {
                const valores = getDatos(estacion);
                insertarDatos(estacion, valores)

            });




            console.log('[CRON] Insert realizado');

        } catch (err) {
            console.error('[CRON] Error:', err);
        } finally {
            if (conn) conn.release();
        }
    });

    console.log('Cron iniciado');
}

export default iniciarCron;
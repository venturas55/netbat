import { schedule } from 'node-cron';
import db from "../database_vps.js";
import { opcua } from "./opcua.js";

// OPC UA
async function getDatos(estacion) {
    return await opcua(estacion);
}

// INSERT
async function insertarDatos(estacion, data) {
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
    schedule('*/10 * * * *', async () => {
        try {
            const estaciones = await db.query('SELECT * FROM estaciones');

            await Promise.all(
                estaciones.map(async (estacion) => {
                    console.log(estacion);
                    const valores = await opcua(estacion);
                    console.log(valores);
                    await insertarDatos(estacion, valores);
                })
            );

            console.log('[CRON] Inserciones completadas');

        } catch (err) {
            console.error('[CRON] Error:', err);
        }
    });

    console.log('Cron iniciado');
}

export default iniciarCron;
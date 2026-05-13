import { schedule } from 'node-cron';
import db from "../database_vps.js";
import { getOPCuaVariables } from "./opcua.js";

// INSERT
async function insertarDatos(estacion, data) {
    if(data.velocidad_viento>=0)
        await db.query(
            `INSERT INTO mediciones 
            (id_estacion, velocidad_media_viento, direccion_viento, racha_viento, temperatura, presion)
            VALUES (?, ?, ?, ?, ?, ?)`,
            [
                estacion.id_estacion,
                data.velocidad_viento,
                data.direccion_viento,
                data.racha,
                data.temperatura,
                data.presion
            ]
        );
}

function iniciarCron() {
    schedule('*/1 * * * *', async () => {
        try {
            const estaciones = await db.query('SELECT * FROM estaciones');
            await Promise.all(estaciones.map(async (estacion) => {
                try {
                    console.log(`Procesando ${estacion.codigo}`);
                    const valores = await getOPCuaVariables(estacion);
                    console.log(valores);
                    await insertarDatos(estacion, valores);
                    console.log(`${estacion.codigo} OK`);
                } catch (err) {
                    console.error(`Error en ${estacion.codigo}:`, err.message);
                }
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
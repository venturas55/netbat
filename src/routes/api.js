import express from 'express';
const router = express.Router();
import db from "../database.js";
import funciones from "../lib/funciones.js";
const queryBaliza = "SELECT b.nif,lo.puerto,lo.num_local,b.telecontrol,b.periodo,b.tipo,b.apariencia,b.caracteristica,b.necesita_pintado,b.apagada,b.esBoya,lo.localizacion,lo.latitud,lo.longitud,la.altura,la.elevacion,la.linterna,la.alcanceNom,la.alcanceLum,la.candelasCalc,la.candelasInst FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif where b.nif=?";
const queryListadoAton = "SELECT b.nif,b.num_internacional,b.tipo,b.apariencia,b.periodo,b.caracteristica,b.telecontrol,b.necesita_pintado,b.apagada,b.esBoya,lo.puerto,lo.num_local,lo.localizacion,lo.latitud,lo.longitud,la.altura,la.elevacion,la.alcanceNom,la.linterna,la.candelasCalc,la.alcanceLum,la.candelasInst FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif";

//Devuelve el listado de todas las balizas introducidas
router.get('/api/balizas', async (req, res) => {
    const balizas = await db.query(queryListadoAton);
    for (var i = 0; i < balizas.length; i++) {
        var archivos = await funciones.getFotosOrdenadas(balizas[i].nif);
        if (archivos)
            balizas[i].pictureUrl = archivos;
        else
            balizas[i].pictureUrl = ["N/A"];

        balizas[i].tickets = await db.query("select * from tickets where nif=? and solved_at IS NULL",balizas[i].nif);
    }
    res.send(balizas);
});
router.get('/api/aton/boyas', async (req, res) => {
    const balizas = await db.query(queryListadoAton + " where b.esBoya=1");
    for (var i = 0; i < balizas.length; i++) {
        var archivos = await funciones.getFotosOrdenadas(balizas[i].nif);
        var fondeo = await db.query("select * from fondeos where nif=?", balizas[i].nif)
        balizas[i].fondeo = fondeo;
        if (archivos)
            balizas[i].pictureUrl = archivos;
        else
            balizas[i].pictureUrl = ["N/A"];
    }
    res.send(balizas);
});
router.get('/api/aton/balizas', async (req, res) => {
    const balizas = await db.query(queryListadoAton + " where b.esBoya=0");
    for (var i = 0; i < balizas.length; i++) {
        var archivos = await funciones.getFotosOrdenadas(balizas[i].nif);
        if (archivos)
            balizas[i].pictureUrl = archivos;
        else
            balizas[i].pictureUrl = ["N/A"];
    }
    res.send(balizas);
});
//Devuelve las caracteristicas de la baliza introducida 
router.get('/api/baliza/:nif', async (req, res) => {
    const { nif } = req.params;
    const baliza = await db.query(queryBaliza, [nif]);
    res.send(baliza);
});
//Devuelve los mantenimientos de la baliza introducida 
router.get('/api/mantenimiento/:nif', async (req, res) => {
    const { nif } = req.params;
    //console.log(nif);
    const q = await db.query('SELECT * FROM mantenimiento where nif=? order by fecha DESC', [nif]);
    res.send(q);
});
//Devuelve las observaciones de la baliza introducida 
router.get('/api/observaciones/:nif', async (req, res) => {
    const { nif } = req.params;
    //console.log(nif);
    const q = await db.query('SELECT * FROM observaciones where nif=?', [nif]);
    res.send(q);
});
//Devuelve el listado de todos los usuarios
router.get('/api/usuarios', async (req, res) => {
    const balizas = await db.query('SELECT full_name,usuario,email, privilegio FROM usuarios');
    res.send(balizas);
});
router.get('/api/autocompletar-nif', async (req, res) => {
    const { termino } = req.query; // texto introducido por el usuario

    if (!termino) {
        return res.status(400).json({ error: 'Término de búsqueda vacío' });
    }

    try {
        const resultados = await db.query(
            'SELECT * FROM balizamiento WHERE nif LIKE ? LIMIT 10',
            [`${termino}%`]
        );

        res.json(resultados);
    } catch (error) {
        console.error('Error en autocompletado NIF:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});

export default router;
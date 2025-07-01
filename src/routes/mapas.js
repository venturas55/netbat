import express from 'express';
const router = express.Router();
import funciones from "../lib/funciones.js";
const queryListadoAton = "SELECT b.nif,b.num_internacional,b.tipo,b.apariencia,b.periodo,b.caracteristica,b.telecontrol,b.necesita_pintado,b.apagada,b.esBoya,lo.puerto,lo.num_local,lo.localizacion,lo.latitud,lo.longitud,la.altura,la.elevacion,la.alcanceNom,la.linterna,la.candelasCalc,la.alcanceLum,la.candelasInst FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif";
import db from "../database.js"; //db hace referencia a la BBDD
var tipoMapa="Leaflet";
//GESTION MAPAS
router.get("/mapa/:nif", async (req, res) => {
    const { nif } = req.params;
    (typeof req.user==="undefined") ? tipoMapa="Leaflet": tipoMapa=req.user.prefmap;
    const baliza = await db.query(queryListadoAton + ' where b.nif=?', [nif]);
    res.render("mapas/mapa"+tipoMapa, { layout: 'layoutMapa'+tipoMapa, baliza: baliza[0] });
});
//funcion get para mostrar los mapas dinamicos con la api de google maps
router.get("/mapaGeneral/:valor", (req, res) => {
    //const { valor } = req.params;
    (typeof req.user==="undefined") ? tipoMapa="Leaflet": tipoMapa=req.user.prefmap;
    res.render("mapas/mapa"+tipoMapa, { layout: 'layoutMapa'+tipoMapa });
});
//funcion get para mostrar los mapas estaticos
router.get("/mapaGeneral2/:valor", (req, res) => {
    const { valor } = req.params;
    //console.log("Mapa " + valor);
    switch (valor) {
        case "valencia":
            res.render("mapas/mapaValencia", { layout: 'layoutMapaEstatico' });
            break;
        case 'sagunto':
            res.render("mapas/mapaSagunto", { layout: 'layoutMapaEstatico' });
            break;
        case "gandia":
            res.render("mapas/mapaGandia", { layout: 'layoutMapaEstatico' });
            break;
    }
});
//funcion get para alternar entre los dos layouts google y leaflet
router.get('/changelayout', funciones.isAuthenticated, async (req, res) => {
  const [user] = await db.query("SELECT * FROM usuarios WHERE id= ?", [req.user.id]);
//console.log(user);
    if (user.prefmap == 'Leaflet') {
        user.prefmap = 'Google';
    } else {
        user.prefmap = 'Leaflet';
    }
    //console.log(user);
    const result = await db.query("UPDATE usuarios SET ? where id= ?", [user, req.user.id]);
    res.redirect("/mapaGeneral/valencia");
});

export default router;
import express from 'express';
const router = express.Router();
import { join } from 'path';
import db from "../database_netcom.js"; //db hace referencia a la BBDD
import funciones from "../lib/funciones.js";
import { promises as fs } from 'fs';
const queryListadoAton = "SELECT lo.coordenadas,b.nif,b.num_internacional,b.tipo,b.apariencia,b.periodo,b.caracteristica,b.telecontrol,b.necesita_pintado,b.apagada,b.esBoya,lo.puerto,lo.num_local,lo.localizacion,lo.latitud,lo.longitud,la.altura,la.elevacion,la.alcanceNom,la.linterna,la.candelasCalc,la.alcanceLum,la.candelasInst,f.calado,f.longitud_cadena,f.ubicacion,f.h_muerto,f.l_muerto,f.b_muerto,f.diametro_cadena,f.area_total_viva,f.Cw_aerodinamico,f.area_total_muerta,f.Cd_aerodinamico,f.observaciones,f.last_modified FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif LEFT JOIN fondeos f ON f.nif=b.nif";
const queryListadoTicketsUsers = "SELECT t.ticket_id,t.nif,t.created_by_id,t.assigned_to_id,t.resolved_by_id,t.titulo,t.descripcion,t.solved_at,t.created_at,u1.usuario as created_by,u2.usuario as assigned_to,u3.usuario as resolved_by FROM tickets t LEFT JOIN usuarios u1 ON t.created_by_id=u1.id  LEFT JOIN usuarios u2 ON t.assigned_to_id=u2.id LEFT JOIN usuarios u3 ON t.resolved_by_id=u3.id ";
const queryListadoPreventivosUsers = 'SELECT p.preventivo_id,p.nif,p.estructura_estado,p.estructura_marca_tope,p.estructura_engrase,p.estructura_golpes,p.estructura_limpieza_interior,p.estructura_limpieza_exterior,p.estructura_cuadro_interior,p.estructura_cuadro_exterior,p.estructura_observaciones,p.linterna_ldr1,p.linterna_ldr2,p.linterna_optica,p.linterna_estanqueidad_tornillos,p.linterna_estanqueidad_humedades,p.linterna_observaciones,p.telecontrol_monitoreo,p.telecontrol_gps,p.telecontrol_tipo,p.telecontrol_observaciones,p.alimentacion_panelFV,p.alimentacion_red,p.alimentacion_baterias,p.alimentacion_ah,p.alimentacion_vcc,p.alimentacion_grupo,p.alimentacion_cableado,p.alimentacion_observaciones,p.observaciones_generales,p.created_at,p.solved_at,p.created_by_id,u1.usuario as created_by FROM preventivos p LEFT JOIN usuarios u1 ON p.created_by_id=u1.id ';
import * as url from "url";
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));
import moment from 'moment'; // require
moment().format();


//CRUD  read
router.get("/", async (req, res) => {
    const mensajes = await db.query("select * from uhf36_messages");
    console.log(mensajes)
        res.render("netbat/list", {mensajes });

});


export default router;
import express from 'express';
const router = express.Router();
import db from "../database.js";
import funciones from "../lib/funciones.js";
const queryListadoPreventivosUsers = 'SELECT p.preventivo_id,p.fecha,p.nif,p.estructura_estado,p.estructura_marca_tope,p.estructura_engrase,p.estructura_golpes,p.estructura_limpieza_interior,p.estructura_limpieza_exterior,p.estructura_cuadro_interior,p.estructura_cuadro_exterior,p.estructura_observaciones,p.linterna_ldr1,p.linterna_ldr2,p.linterna_optica,p.linterna_estanqueidad_tornillos,p.linterna_estanqueidad_humedades,p.linterna_observaciones,p.telecontrol_monitoreo,p.telecontrol_gps,p.telecontrol_tipo,p.telecontrol_observaciones,p.alimentacion_panelFV,p.alimentacion_red,p.alimentacion_baterias,p.alimentacion_ah,p.alimentacion_vcc,p.alimentacion_grupo,p.alimentacion_cableado,p.alimentacion_observaciones,p.observaciones_generales,p.created_at,p.solved_at,p.created_by_id,p.solved_by_id,p.foto_estructura,p.foto_linterna, p.foto_monitoreo, p.foto_alimentacion, p.foto_general, u1.usuario as created_by,u2.usuario as solved_by FROM preventivos p LEFT JOIN usuarios u1 ON p.created_by_id=u1.id LEFT JOIN usuarios u2 ON p.solved_by_id=u2.id';
import moment from 'moment';
moment().format();
import * as url from "url";
import fs from 'fs';
import fse from 'fs-extra';
import { join, extname as _extname, resolve } from 'path';
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));
import multer, { diskStorage } from 'multer';
import { imageSizeLimitErrorHandler } from "../lib/validaciones.js";
/* const puppeteer = require('puppeteer');
async function generatePDFfromHTML(htmlContent, outputPath) {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.setContent(htmlContent);
  await page.pdf({ path: outputPath, format: 'A4' });
  await browser.close();
}
 */

const storage = diskStorage({
    destination: (req, file, cb) => {
        const nif = req.body.nif;
        const dir = join(__dirname, '../public/img/preventivos/', nif);
        try {
            // Crear la carpeta si no existe (de forma sincrónica y sin callback)
            if (!fs.existsSync(dir)) {
                fs.mkdirSync(dir, { recursive: true });
                console.log('📁 Carpeta creada:', dir);
            } else {
                console.log('📁 Carpeta ya existe:', dir);
            }

            cb(null, dir); // Devolver la ruta correctamente
        } catch (err) {
            console.error('❌ Error al crear carpeta:', err);
            cb(err);
        }
    },
    filename: (req, file, cb) => {
        const fecha = req.body.fecha.replace(/-/g, "");
        cb(null, fecha + "-" + file.fieldname + _extname(file.originalname).toLowerCase());
    }
});

const upload = multer({
    storage: storage,
    limits: { fileSize: 5000000, }, //5MB
    fileFilter: (req, file, cb) => {
        const filetypes = /jpeg|jpg|jfif|png|bmp|gif/;
        const mimetype = filetypes.test(file.mimetype);
        const extname = filetypes.test(_extname(file.originalname).toLowerCase());
        if (mimetype && extname) {
            return cb(null, true);
        }
        return cb(("Error: Archivo debe ser una extension válida"));
    }
});

//preventivo
// Ruta vista principal
router.get('/list', async (req, res) => {
    //const preventivos = await db.query("select * from preventivos order by created_at");
    try {
        const preventivos = await db.query(queryListadoPreventivosUsers + " order by p.created_at desc");
        const usuarios = await db.query("select * from usuarios");
        console.log(usuarios);
        res.render('preventivo/list', {
            preventivos,usuarios
        });
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al intentar mostrar los preventivos: " + error);
        res.redirect("/");
    }
});
// Ruta para crear un nuevo preventivo (formulario)
router.get('/add', funciones.isAuthenticated, async (req, res) => {
    try {
        //const usuarios = await db.query("select * from usuarios");
        res.render('preventivo/add');
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al intentar añadir el mantenimiento preventivo:" + error);
        res.redirect("/mantenimientopreventivo/list");
    }
});
// Ruta para crear un nuevo preventivo (formulario)
router.get('/add/:nif', funciones.isAuthenticated, async (req, res) => {
    const {
        nif
    } = req.params;

    console.log(nif);
    try {
        //Leer el ultimo preventivo asociado
        const [ultimoPreventivo] = await db.query("select * from preventivos where nif=? order by fecha desc ", nif);
        console.log(ultimoPreventivo)
        res.render('preventivo/add', { nif, ultimoPreventivo });
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al intentar añadir el mantenimiento preventivo:" + error);
        res.redirect("/mantenimientopreventivo/list");
    }
});

// Ruta para crear un nuevo preventivo (envío del formulario)
router.post('/add', funciones.isAuthenticated, upload.fields([
    { name: 'foto_estructura', maxCount: 1 },
    { name: 'foto_linterna', maxCount: 1 },
    { name: 'foto_monitoreo', maxCount: 1 },
    { name: 'foto_alimentacion', maxCount: 1 },
    { name: 'foto_general', maxCount: 1 }
]), imageSizeLimitErrorHandler, async (req, res) => {
    if (req.body.alimentacion_ah == "")
        req.body.alimentacion_ah = 0;
    if (req.body.alimentacion_vcc == "")
        req.body.alimentacion_vcc = 0;

    // Verificar si se subieron fotos y guardarlas en la base de datos
    const foto_estructura = req.files && req.files.foto_estructura ? req.files.foto_estructura[0].filename : null;
    const foto_linterna = req.files && req.files.foto_linterna ? req.files.foto_linterna[0].filename : null;
    const foto_monitoreo = req.files && req.files.foto_monitoreo ? req.files.foto_monitoreo[0].filename : null;
    const foto_alimentacion = req.files && req.files.foto_alimentacion ? req.files.foto_alimentacion[0].filename : null;
    const foto_general = req.files && req.files.foto_general ? req.files.foto_general[0].filename : null;

    if (foto_estructura) req.body.foto_estructura = foto_estructura;
    if (foto_linterna) req.body.foto_linterna = foto_linterna;
    if (foto_monitoreo) req.body.foto_monitoreo = foto_monitoreo;
    if (foto_alimentacion) req.body.foto_alimentacion = foto_alimentacion;
    if (foto_general) req.body.foto_general = foto_general;

    try {
        //TODO:    telecontrol_tipo
        const awns = await db.query("insert into preventivos set ? ", [req.body]);
        //console.log(awns);
        funciones.insertarLog(req.user.usuario, "INSERT preventivo by ", req.body.created_by);
        req.flash("success", "Preventivo añadido correctamente");
        res.redirect('/mantenimientopreventivo/list/');

    } catch (error) {
        //console.error(error);
        req.flash("error", "Hubo algun error al insertar el preventivo: \n" + error);
        res.redirect("/mantenimientopreventivo/list");
    }
});

// Ruta para editar un preventivo
router.get('/edit/:id', funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const {
        id
    } = req.params;
    //console.log(id);
    try {
        const preventivo = await db.query(queryListadoPreventivosUsers + " where preventivo_id=?", id);
        console.log(preventivo[0]);
        res.render('preventivo/edit', {
            preventivo: preventivo[0],
        });
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al intentar mostrar el preventivo" + error);
        res.redirect("/mantenimientopreventivo/list");
    }
});
// Ruta POST para EDITAR o CERRAR un preventivo
router.post('/edit/:id', funciones.isAuthenticated, funciones.hasSanPrivileges, upload.fields([
    { name: 'foto_estructura', maxCount: 1 },
    { name: 'foto_linterna', maxCount: 1 },
    { name: 'foto_monitoreo', maxCount: 1 },
    { name: 'foto_alimentacion', maxCount: 1 },
    { name: 'foto_general', maxCount: 1 }
]), imageSizeLimitErrorHandler, async (req, res) => {


    // Verificar si se subieron fotos y guardarlas en la base de datos
    const foto_estructura = req.files && req.files.foto_estructura ? req.files.foto_estructura[0].filename : null;
    const foto_linterna = req.files && req.files.foto_linterna ? req.files.foto_linterna[0].filename : null;
    const foto_monitoreo = req.files && req.files.foto_monitoreo ? req.files.foto_monitoreo[0].filename : null;
    const foto_alimentacion = req.files && req.files.foto_alimentacion ? req.files.foto_alimentacion[0].filename : null;
    const foto_general = req.files && req.files.foto_general ? req.files.foto_general[0].filename : null;

    if (foto_estructura) req.body.foto_estructura = foto_estructura;
    if (foto_linterna) req.body.foto_linterna = foto_linterna;
    if (foto_monitoreo) req.body.foto_monitoreo = foto_monitoreo;
    if (foto_alimentacion) req.body.foto_alimentacion = foto_alimentacion;
    if (foto_general) req.body.foto_general = foto_general;

    if (req.body.accion == "Guardar") {
        console.log("Guardando");
        try {
            delete req.body.accion;
            const item = await db.query("update preventivos set ? where preventivo_id=?", [req.body, req.body.preventivo_id]);
            //console.log(item);
            funciones.insertarLog(req.user.usuario, "UPDATE preventivo ", "Info actualizada " + item.preventivo_id);
            req.flash("success", "Preventivo actualizado correctamente");
            res.redirect("/mantenimientopreventivo/list/");

        } catch (error) {
            console.error(error);
            req.flash("error", "Hubo algun error al intentar modificar el preventivo" + error);
            res.redirect("/mantenimientopreventivo/list");
        }


    } else if (req.body.accion == "Cerrar") {
        let completado = true;
        //console.log("Cerrando");
        //console.log(item);

        Object.entries(req.body).forEach(([key, value]) => {
            //console.log(key + " = "+value);
            if (!value)
                completado = false;
        });
        //console.log(completado);
        if (completado) {
            delete req.body.accion;
            req.body.solved_at = moment(new Date()).format("YYYY-MM-DD HH:mm:ss");
            req.body.solved_by_id = req.user.id;
            req.body.completado = completado;
            //console.log("completado", req.body);
            const item = await db.query("update preventivos set ? where preventivo_id=?", [req.body, req.body.preventivo_id]);
            funciones.insertarLog(req.user.usuario, "UPDATED and CLOSED preventivo cerrado por ", req.body.solved_by);
            req.flash("success", "Preventivo cerrado correctamente");
            res.redirect("/mantenimientopreventivo/list");
        } else {
            req.flash("warning", "Tienes que completar todos los campos del preventivo");
            res.redirect("/mantenimientopreventivo/edit/" + req.body.preventivo_id);
        }
    }
});

// Ruta para mostrar un ticket cerrado
router.get('/cerrado/:id', funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const {
        id
    } = req.params;
    //console.log(id);
    try {
        const preventivos = await db.query(queryListadoPreventivosUsers + " where p.preventivo_id=?", id);
        res.render('preventivo/edit', {
            preventivo: preventivos[0],
        });

    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al intentar mostrar el preventivo" + error);
        res.redirect("/");
    }
});

//Ruta para borrar un preventivo.
router.get("/delete/:id", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    //console.log(req.params.idObs);
    const {
        id
    } = req.params;
    try {
        await db.query("delete from preventivos where preventivo_id=?", [id]);
        req.flash("success", "Preventivo eliminado correctamente.");
        res.redirect("/mantenimientopreventivo/list");
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al intentar borrar el preventivo" + error);
        res.redirect("/mantenimientopreventivo/list");
    }
});

router.post('/eliminar-foto', async (req, res) => {
    const { id, campo } = req.body; // ej: id del preventivo, campo: 'foto_general', ruta: '26046.7/foto.jpg'
    console.log("Voy");
    let columna = campo.split("-")[1].split(".")[0]
    console.log("id: ", id + " foto: ", columna)

    try {
        // Quitar ruta en la base de datos
        await db.query(`UPDATE preventivos SET ${columna} = NULL WHERE preventivo_id = ?`, [id]);
        const [row] = await db.query(`SELECT * FROM preventivos WHERE preventivo_id = ?`, [id]);
        console.log(row.nif)

        // Borrar imagen del disco
        const filePath = resolve('src/public/img/preventivos/' + row.nif + '/' + campo);
        fs.access(filePath, fs.constants.F_OK, async (err) => {
            if (err) {
                console.log("❌ No existe foto", err);
            } else {
                console.log('✅ File exists. Deleting now...');
                // No uses await aquí; esta función no es async
                fse.unlink(filePath)
                    .then(() => console.log("🗑 Archivo borrado correctamente"))
                    .catch((error) => console.error("❌ Error al borrar archivo:", error));
            }
        });



        res.json({ success: true });
    } catch (err) {
        console.error('❌ Error eliminando imagen:', err);
        res.status(500).send('Error al eliminar la imagen');
    }
});

export default router;
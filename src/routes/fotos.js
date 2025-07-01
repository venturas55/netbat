import express from 'express';
const router = express.Router();
import fse from 'fs-extra';
import fs from 'fs';
import { join, extname as _extname, resolve } from 'path';
import db from "../database.js"; //db hace referencia a la BBDD
import multer, { diskStorage } from 'multer';
import funciones from "../lib/funciones.js";
import { archiveFolder, extract } from "zip-lib";
import * as url from "url";
import { imageSizeLimitErrorHandler, zipSizeLimitErrorHandler } from "../lib/validaciones.js";
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));

const storage = diskStorage({
    destination: (req, file, cb) => {
        const { nif } = req.body;
        const { user } = req.body;
        //Si usuario es undefined es que se subió una baliza, y configuro el storage para balizas
        if (typeof user === 'undefined') {
            const dir = join(__dirname, '../public/img/imagenes/', nif);
            fs.access(dir, error => {
                if (error) {
                    console.log("Directory does not exist.")
                    fs.mkdirSync(dir, { recursive: true }, error => cb(error, dir));
                } else {
                    console.log("Directory exists.")
                }
                return cb(null, dir);
            });
        } else {//si no, entonces es una foto de perfil y va a otra carpeta
            const dir = join(__dirname, '../public/img/profiles/');
            //console.log("dir" + dir);
            return cb(null, dir);
        }

    },
    filename: (req, file, cb) => {
        cb(null, new Date().getTime() + _extname(file.originalname).toLowerCase());
    }
});

const storageZip = diskStorage({
    destination: (req, file, cb) => {
        const dir = join(__dirname, '../public/dumpFOTOS/');
        //console.log("dir " + dir);
        return cb(null, dir);
    },
    filename: (req, file, cb) => {
        cb(null, new Date().getTime() + _extname(file.originalname).toLowerCase());
    }
});

const uploadFoto = multer({
    storage,
    limits: { fileSize: 5000000, },
    fileFilter: (req, file, cb) => {
        const filetypes = /jpeg|jpg|jfif|png|bmp|gif/;
        const mimetype = filetypes.test(file.mimetype);
        //console.log(mimetype + "es el 1");
        const extname = filetypes.test(_extname(file.originalname).toLowerCase());
        if (mimetype && extname) {
            return cb(null, true);
        }
        return cb(("Error: Archivo debe ser una imagen valida jpeg,jpg,jfif,png,bmp o gif"));
    }
}).single('imagen');

const uploadFotosZip = multer({
    storage: storageZip,
    limits: { fileSize: 200000000, }, //200MB
    fileFilter: (req, file, cb) => {
        const filetypes = /zip/;
        const mimetype = filetypes.test(file.mimetype);
        //console.log(mimetype + " es el 2");
        const extname = filetypes.test(_extname(file.originalname).toLowerCase());
        if (mimetype && extname) {
            funciones.insertarLog(req.user.usuario, "INSERT zip backup fotos ", file.originalname.toLowerCase());
            return cb(null, true);
        }
        return cb(("Error: Archivo debe ser un *.zip"));
    }
}).single('backup');

//GESTION FOTOS DE BALIZAS
router.post("/aton/upload/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, uploadFoto, imageSizeLimitErrorHandler, async (req, res) => {
    const { nif } = req.params;
    const nombre = req.file.filename;
    const { descripcion } = req.body;
    const newPic = { nombre, descripcion, }
    await db.query("insert into fotos_balizamiento set ?", [newPic]);
    req.flash("success", "Nueva fotografia insertada correctamente");
    funciones.insertarLog(req.user.usuario, "INSERT fotografia", nif);
    res.redirect("/aton/fotos/" + nif);
});
//UPDATE
router.post('/aton/fotos/:nif/:nombre/update', async (req, res) => {
    const { nif, nombre } = req.params;
    const { descripcion } = req.body;

    try {
        // Insertar o actualizar la descripción en la tabla fotos_balizamiento
        await db.query(`
      INSERT INTO fotos_balizamiento (nombre, descripcion)
      VALUES (?, ?)
      ON DUPLICATE KEY UPDATE descripcion = VALUES(descripcion)
    `, [nombre, descripcion]);

        // Opcional: redirigir a una vista individual o listado
        res.redirect(`/aton/fotos/${nif}`);
    } catch (error) {
        console.error("Error actualizando descripción:", error);
        res.status(500).send("Error actualizando descripción");
    }
});

router.get("/aton/fotos/:nif", async (req, res) => {
    const nif = req.params.nif;
    var fotos = await funciones.getFotosOrdenadas(nif);
    // Recorrer todas las fotos y buscar su descripción si existe
    fotos = await Promise.all(fotos.map(async (nombreFoto) => {
        const rows = await db.query("SELECT descripcion FROM fotos_balizamiento WHERE nombre = ?", [nombreFoto]);
        return {
            nombre: nombreFoto,
            descripcion: rows.length ? rows[0].descripcion : ''
        };
    }));

    res.render("aton/fotos", { fotos, nif });
});
router.get("/aton/fotos/:nif/:nombre", async (req, res) => {
    const nif = req.params.nif;
    const nombre = req.params.nombre;
    const [foto] = await db.query("SELECT * FROM fotos_balizamiento WHERE nombre = ?", [nombre]);
    res.render("aton/foto", { foto, nif, nombre });
});
router.get("/aton/fotos/:nif/:nombre/delete", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    const nif = req.params.nif;
    const nombre = req.params.nombre;
    await fse.unlink(resolve('src/public/img/imagenes/' + nif + "/" + nombre));
    await db.query("delete from fotos_balizamiento where nombre = ?", [nombre]);
    req.flash("success", "Fotografia borrada correctamente");
    funciones.insertarLog(req.user.usuario, "DELETE fotografia "+nif, nombre);
    res.redirect("/aton/fotos/" + nif);
});

//BACKUPS DE FOTOS DE ATONS
router.get("/backupsfotos", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    var backups = funciones.listadoBackupsFotos();
    console.log("FOtos: ", backups);
    res.render("fotos/listadoBackupFotos", { backups });
});
router.get("/backupsfotos/del/:nombre", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    var { nombre } = req.params;
    var file = resolve('src/public/dumpFOTOS', nombre);
    //console.log(file);
    await fs.unlinkSync(file);
    funciones.insertarLog(req.user.usuario, "DELETE backup fotos", nombre);
    res.redirect('/backupsfotos');
});
router.get("/aton/fotos/backup/zip", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    const dir = join(__dirname, '../public/img/imagenes');
    const dirbackups = join(__dirname, '../public/dumpFOTOS/');
    archiveFolder(dir, dirbackups + new Date().getTime() + ".zip").then(function () {
        console.log("done");
        req.flash("success", "Fotos backup realizado correctamente");
        res.redirect('/backupsfotos');
    }, function (err) {
        console.log(err);
        req.flash("error", "Hubo algun error al realizar el backup de fotos");
        res.redirect('/backupsfotos');
    });
});
router.post("/aton/fotos/backup/upload", funciones.isAuthenticated, funciones.isAdmin, uploadFotosZip, async (req, res) => {
    console.log("Subiendo fotos en zip");
    req.flash("success", "backup fotos subido correctamente");
    res.redirect('/backupsfotos');
});
router.get("/aton/fotos/backup/unzip/:nombre", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    var { nombre } = req.params;
    const dir = join(__dirname, '../public/img/imagenes');
    const backupPath = join(__dirname, '../public/dumpFOTOS/');
    //TODO: COMPROBAR EL FORMATO DE DIRECTORIO DEL ZIP
    extract(backupPath + nombre, dir).then(function () {
        console.log("done");
        req.flash("success", "Pack de Fotos descomprimido correctamente");
        res.redirect('/backupsfotos');
    }, function (err) {
        console.log(err);
        req.flash("error", "Hubo algun error al descomprimir el backup de fotos");
        res.redirect('/backupsfotos');
    });
});
//Elimina todas las carpetas que tengan un nombre que no corresponda a ninguna baliza
router.get("/aton/fotos/clean/folders", funciones.isAdmin, async function (req, res) {
    let balizas = await db.query("select nif from balizamiento");
    balizas = balizas.map(function (item) { return item.nif });
    let source = join(__dirname, "../public/img/imagenes/");
    let carpetas = await funciones.listadoCarpetas();
    //console.log(carpetas);
    //console.log(balizas);
    carpetas.forEach(item => {
        if (!balizas.includes(item)) {
            //console.log("eliminar " + source + item);
            fs.rmSync(join(source, item), { recursive: true, force: true });
        }
    });
    funciones.insertarLog(req.user.usuario, "Limpieza carpeta fotos AtoNs ");
    req.flash("success", "Directorios de fotos limpiado correctamente");
    res.redirect('/backupsfotos');
});

//GESTION  foto perfil
router.post('/upload/:id', funciones.isAuthenticated, uploadFoto, zipSizeLimitErrorHandler, async (req, res) => {
    const { id } = req.params;
    //console.log(req.file);
    var usuario = await db.query("select * from usuarios where id = ?", id);
    usuario = usuario[0];

    //borramos la foto anterior del perfil
    if (usuario.pictureURL != "") {
        const filePath = resolve('src/public/img/profiles/' + usuario.pictureURL);
        fs.access(filePath, fs.constants.F_OK, async (err) => {
            if (err) {
                req.flash("warning", "No tiene foto de perfil!");
                console.log("No tiene foto de perfil");
            } else {
                console.log('File exists. Deleting now ...');
                await fse.unlink(filePath);
            }
        });
    }

    //Ponemos la nueva
    usuario.pictureURL = req.file.filename;
    await db.query("UPDATE usuarios set  ? WHERE id=?", [usuario, id]);
    funciones.insertarLog(req.user.usuario, "UPDATE fotografia perfil", "");
    req.flash("success", "Foto de perfil actualizada con exito");
    res.redirect("/profile");
});
router.get("/profile/borrarfoto/:id/:url", funciones.isAuthenticated, async (req, res) => {
    //console.log(req.params);
    const { url } = req.params;
    const { id } = req.params;
    await db.query("UPDATE usuarios set pictureURL = NULL WHERE id=?", [id]);
    const filePath = resolve('src/public/img/profiles/' + url);
    fs.access(filePath, fs.constants.F_OK, async (err) => {
        if (err) {
            console.log("No tiene foto de perfil");
        } else {
            console.log('File exists. Deleting now ...');
            await fse.unlink(filePath);
        }
    });
    funciones.insertarLog(req.user.usuario, "DELETE fotografia perfil", "");
    req.flash("success", "Imagen borrada correctamente");
    res.redirect('/profile');
});

export default router;
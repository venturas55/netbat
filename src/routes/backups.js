import express from 'express';
const router = express.Router();
import funciones from "../lib/funciones.js";
import fs from 'fs';
import multer, { diskStorage } from 'multer';
import * as path from "path";
import * as url from "url";
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));
import db from "../database.js"; //db hace referencia a la BBDD
import {imageSizeLimitErrorHandler,zipSizeLimitErrorHandler} from "../lib/validaciones.js";

const storageBBDD = diskStorage({
    destination: (req, file, cb) => {
        const dir = path.join(__dirname, '../public/dumpSQL/');
        console.log("dir " + dir);
        return cb(null, dir);
    },
    filename: (req, file, cb) => {
        // cb(null, new Date().getTime() + path.extname(file.originalname).toLowerCase());
        cb(null, file.originalname.toLowerCase());
    }
});

const uploadFotosBBDD = multer({
    storage: storageBBDD,
    limits: { fileSize: 20000000, }, //20MB
    fileFilter: (req, file, cb) => {
        const filetypes = /sql/;
        const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
        console.log(path.extname(file.originalname).toLowerCase() + " antes if" + extname);
        if (extname) {
            console.log("en if");
            //funciones.funciones.insertarLog(req.user.usuario, "INSERT sql backup  ", file.originalname.toLowerCase());
            return cb(null, true);
        }
        return cb(("Error: Archivo debe ser un *.sql"));
    }
}).single('backupsql');

//GESTION BACKUPS BBDD
router.get("/dbbackups/list", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    var backups = funciones.listadoBackups();
    res.render("backups/listadoBackups", { backups });
});
router.post("/dbbackups/create/:operacion", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    var { operacion } = req.params;
    funciones.dumpearSQL(operacion);
    req.flash("success", "Backup de la BBDD realizado correctamente");
    funciones.insertarLog(req.user.usuario, "DO backup", "nuevo backup " + operacion);
    res.redirect("/dbbackups/list");
});
router.get("/dbbackups/del/:nombre", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    var { nombre } = req.params;
    var file = path.resolve('src/public/dumpSQL', nombre);
    //console.log(file);
    await fs.unlinkSync(file);
    funciones.insertarLog(req.user.usuario, "DELETE backup", nombre);
    res.redirect('/dbbackups/list');
});
/* router.get("/dbbackups/deleteAbsoluto", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    console.log("Borrando BBDD ...");
    try {
        await db.query("DELETE FROM mantenimiento");
        await db.query("DELETE FROM observaciones");
        await db.query("DELETE FROM localizacion");
        await db.query("DELETE FROM lampara");
        await db.query("DELETE FROM balizamiento");
        funciones.insertarLog(req.user.usuario, "DELETE BBDD ENTERA ", "");
        req.flash("success", "BBDDS borrada correctamente");
        res.redirect('/dbbackups/list');
    } catch (error) {
        req.flash("error", "Hubo algun error al borrar la BBDD: ",error);
        res.redirect('/dbbackups/list');
    }
}); */
router.get("/dbbackups/runSQL/:file", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    var { file } = req.params;
    //SI EL BACKUP SQL TIENE EL COMETNARIO   ==>    /*!40101 SET NAMES utf8 */;  
    //ENTONCES PETA, DA ERROR

    /*  code: 'ER_WRONG_VALUE_FOR_VAR',
     errno: 1231,
     sqlState: '42000',
     sqlMessage: "Variable 'sql_mode' can't be set to the value of 'NULL'", */
    //   sql: '/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;'  


    funciones.runSQLrecovery(file);
    req.flash("success", "Informacion backup de la BBDD volcado correctamente");
    funciones.insertarLog(req.user.usuario, "RUN backup", "volcado de nueva info");
    res.redirect("/dbbackups/list");
});
router.post("/dbbackups/upload", funciones.isAuthenticated, funciones.isAdmin, uploadFotosBBDD, zipSizeLimitErrorHandler,async (req, res) => {
    console.log("Subiendo BACKUP sql");
    funciones.insertarLog(req.user.usuario, "Upload backup", "subido nuevo backup");
    req.flash("success", "backup sql subido correctamente");
    res.redirect('/dbbackups/list');
});

export default router;
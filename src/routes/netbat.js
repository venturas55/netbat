import express from 'express';
const router = express.Router();
import { join } from 'path';
import db from "../database_netcom.js"; //db hace referencia a la BBDD
import funciones from "../lib/funciones.js";
import { promises as fs } from 'fs';
import * as url from "url";
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));
import moment from 'moment'; // require
moment().format();


//CRUD  read
router.get("/", async (req, res) => {
    res.render("netbat/index", { layout: 'layoutnetbat' });

});

router.get("/listUHF", async (req, res) => {
    const mensajes = await db.query("select * from uhf36_messages order by date_time desc limit 500");
    console.log(mensajes)
    res.render("netbat/listUHF", { layout: 'layoutnetbat', mensajes });
});

router.get("/listAIS", async (req, res) => {
    const mensajes = await db.query("select * from ais216_messages order by date_time desc");
    console.log(mensajes)
    res.render("netbat/listAIS", { layout: 'layoutnetbat', mensajes });
});

router.get("/listSMS", async (req, res) => {
    const mensajes = await db.query("select * from sms36_messages order by date_time desc");
    console.log(mensajes)
    res.render("netbat/listSMS", { layout: 'layoutnetbat', mensajes });
});

router.get("/listMTU100", async (req, res) => {
    const mensajes = await db.query("select * from mtu100_messages order by date_time desc");
    console.log(mensajes)
    res.render("netbat/listMTU100", { layout: 'layoutnetbat', mensajes });
});

router.get("/listMTU300", async (req, res) => {
    const mensajes = await db.query("select * from mtu300_messages order by date_time desc");
    console.log(mensajes)
    res.render("netbat/listMTU300", { layout: 'layoutnetbat', mensajes });
});
export default router;
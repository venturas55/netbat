import express from 'express';
const router = express.Router();
import { join } from 'path';
import db from "../database.js"; //db hace referencia a la BBDD
import dbnetcom from "../database_netcom.js"; //db hace referencia a la BBDD
import funciones from "../lib/funciones.js";
import { promises as fs } from 'fs';
const queryListadoAton = "SELECT lo.coordenadas,b.nif,b.num_internacional,b.tipo,b.apariencia,b.periodo,b.caracteristica,b.telecontrol,b.necesita_pintado,b.apagada,b.esBoya,lo.puerto,lo.num_local,lo.localizacion,lo.latitud,lo.longitud,la.altura,la.elevacion,la.alcanceNom,la.linterna,la.candelasCalc,la.alcanceLum,la.candelasInst,f.calado,f.longitud_cadena,f.ubicacion,f.h_muerto,f.l_muerto,f.b_muerto,f.diametro_cadena,f.area_total_viva,f.Cw_aerodinamico,f.area_total_muerta,f.Cd_aerodinamico,f.observaciones,f.last_modified FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif LEFT JOIN fondeos f ON f.nif=b.nif";
const queryListadoTicketsUsers = "SELECT t.ticket_id,t.nif,t.created_by_id,t.assigned_to_id,t.resolved_by_id,t.titulo,t.descripcion,t.solved_at,t.created_at,u1.usuario as created_by,u2.usuario as assigned_to,u3.usuario as resolved_by FROM tickets t LEFT JOIN usuarios u1 ON t.created_by_id=u1.id  LEFT JOIN usuarios u2 ON t.assigned_to_id=u2.id LEFT JOIN usuarios u3 ON t.resolved_by_id=u3.id ";
const queryListadoPreventivosUsers = 'SELECT p.preventivo_id,p.nif,p.estructura_estado,p.estructura_marca_tope,p.estructura_engrase,p.estructura_golpes,p.estructura_limpieza_interior,p.estructura_limpieza_exterior,p.estructura_cuadro_interior,p.estructura_cuadro_exterior,p.estructura_observaciones,p.linterna_ldr1,p.linterna_ldr2,p.linterna_optica,p.linterna_estanqueidad_tornillos,p.linterna_estanqueidad_humedades,p.linterna_observaciones,p.telecontrol_monitoreo,p.telecontrol_gps,p.telecontrol_tipo,p.telecontrol_observaciones,p.alimentacion_panelFV,p.alimentacion_red,p.alimentacion_baterias,p.alimentacion_ah,p.alimentacion_vcc,p.alimentacion_grupo,p.alimentacion_cableado,p.alimentacion_observaciones,p.observaciones_generales,p.created_at,p.solved_at,p.created_by_id,u1.usuario as created_by FROM preventivos p LEFT JOIN usuarios u1 ON p.created_by_id=u1.id ';
import * as url from "url";
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));
import moment from 'moment'; // require
moment().format();

const getPointfromLatLng = (lat, lng) => {
    var lat2 = 0;
    var lng2 = 0;
    if (lat != null && lat.includes("º")) {
        lat = lat.replaceAll("'", "´"); // y reemplazo la coma ' por ´
        lat = lat.replaceAll("°", "º");

        var utmarraylat = lat.split("º"); //separo grados y minutos
        //console.log(utmarraylat[0] + " - " + utmarraylat[1]);
        //(utmarraylat[0] son grados y  utmarraylat[1] minutos
        utmarraylat[1] = utmarraylat[1].replace(",", "."); //DE LOS MINUTOS sustituyo comas por PUNTOS
        var minutoslatVector = utmarraylat[1].split("."); //de los minutos separo en las PUNTOS
        //console.log(minutoslatVector[0] + " - " + minutoslatVector[1]);

        if (minutoslatVector.length > 1) {
            var minutoslatEntero = parseFloat(minutoslatVector[0]); //convierto a decimal (la separacion ha de ser un PUNTO)

            if (minutoslatVector[1].includes("´")) {
                var minutoslat = minutoslatVector[1].split("´")
            } else {
                var minutoslat = minutoslatVector[1].split(" ")
            }
            //console.log(minutoslat[0] + " - " + minutoslat[1]);
            var minutoslatDecimal = parseFloat(minutoslat[0]);
            lat2 = parseFloat(utmarraylat[0]) + (minutoslatEntero + minutoslatDecimal / 1000) / 60;
        } else {
            var minutoslat = minutoslatVector[0].trim().split(" ");
            lat2 = parseFloat(utmarraylat[0]) + parseFloat(minutoslat[0]) / 60;
        }
        //console.log(minutoslatVector);
        if (minutoslat[1].trim() == 'N')
            lat2 = 1 * lat2.toFixed(6);
        else if (minutoslat[1].trim() == 'S')
            lat2 = -1 * lat2.toFixed(6);
        //console.log(lat2);
    }

    if (lng != null && lng.includes("º")) {
        lng = lng.replaceAll("'", "´");
        lng = lng.replaceAll("°", "º");
        var utmarraylng = lng.split("º"); //separo grados y minutos
        //console.log(utmarraylng[0] + " - " + utmarraylng[1]);
        //(utmarraylng[0] son grados y  utmarraylng[1] minutos
        utmarraylng[1] = utmarraylng[1].replace(",", "."); //DE LOS MINUTOS sustituyo comas por PUNTOS
        var minutoslngVector = utmarraylng[1].split("."); //de los minutos separo en las PUNTOS
        //console.log(minutoslngVector[0] + " - " + minutoslngVector[1]);

        if (minutoslngVector.length > 1) {

            var minutoslngEntero = parseFloat(minutoslngVector[0]); //convierto a decimal (la separacion ha de ser un PUNTO)

            if (minutoslngVector[1].includes("´")) {
                var minutoslng = minutoslngVector[1].split("´")
            } else {
                var minutoslng = minutoslngVector[1].split(" ")
            }
            //console.log(minutoslng[0] + " - " + minutoslng[1]);
            var minutoslngDecimal = parseFloat(minutoslng[0]);
            lng2 = parseFloat(utmarraylng[0]) + (minutoslngEntero + minutoslngDecimal / 1000) / 60;
        } else {
            var minutoslng = minutoslngVector[0].trim().split(" ");
            lng2 = parseFloat(utmarraylng[0]) + parseFloat(minutoslng[0]) / 60;
        }


        if (minutoslng[1].trim() == 'E')
            lng2 = 1 * lng2.toFixed(6);
        else if (minutoslng[1].trim() == 'W')
            lng2 = -1 * lng2.toFixed(6);
        //console.log(lng2);
    }
    return {
        'lat': lat2,
        'lng': lng2
    };
}

//console.log(db);
//CRUD ATON create
router.get("/add", funciones.isAuthenticated, funciones.hasSanPrivileges, (req, res) => {
    res.render("aton/add");
});
router.post("/add", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    console.log(req.body);
    const {
        nif,
        num_internacional,
        tipo,
        telecontrol,
        apariencia,
        periodo,
        caracteristica,
        puerto,
        num_local,
        localizacion,
        latitud,
        longitud,
        altura,
        elevacion,
        linterna,
        alcanceNom,
        alcanceLum,
        candelasCalc,
        candelasInst,
        esBoya
    } = req.body;
    const newBalizamiento = {
        nif,
        num_internacional,
        tipo,
        telecontrol,
        apariencia,
        periodo,
        caracteristica,
        esBoya,
    };
    const newBalizamientoLocalizacion = {
        nif,
        puerto,
        num_local,
        localizacion,
        latitud,
        longitud
    };
    const newBalizamientoLampara = {
        nif,
        altura,
        elevacion,
        linterna,
        alcanceNom,
        alcanceLum,
        candelasCalc,
        candelasInst
    };
    for (let clave in newBalizamiento) {
        if (!newBalizamiento[clave]) {
            newBalizamiento[clave] = null;
        }
    }
    for (let clave in newBalizamientoLocalizacion) {
        if (!newBalizamientoLocalizacion[clave]) {
            newBalizamientoLocalizacion[clave] = null;
        }
    }
    for (let clave in newBalizamientoLampara) {
        if (!newBalizamientoLampara[clave]) {
            newBalizamientoLampara[clave] = null;
        }
    }

    try {
        let existe = await db.query("SELECT * from balizamiento where nif= ?", [newBalizamiento.nif]);

        if (existe.length == 0) {
            await db.query("INSERT INTO balizamiento set ?", [newBalizamiento]);
            await db.query("INSERT INTO localizacion set ?", [newBalizamientoLocalizacion]);
            await db.query("INSERT INTO lampara set ?", [newBalizamientoLampara]);
            const msg = funciones.insertarLog(req.user.usuario, "INSERT balizamiento", newBalizamiento.nif);
            if (msg == 'error')
                throw (msg)
            req.flash("success", "AtoN insertado correctamente");
            res.redirect("/aton/list");
        } else {
            req.flash("error", "Ya existe un AtoN con el NIF " + newBalizamiento.nif);
            res.redirect("/aton/add");
        }
        //console.log(newBalizamiento);
    } catch (error) {
        console.error(error.code);
        switch (error.code) {
            case "ER_DATA_TOO_LONG":
                req.flash("error", "El NIF " + newBalizamiento.nif + " es demasiado largo.");
                break;
            case "ER_BAD_NULL_ERROR":
                req.flash("error", "El campo NIF es obligatorio");
                break;
            case "ER_TRUNCATED_WRONG_VALUE_FOR_FIELD":
                req.flash("error", "Hay un campo con valor incorrecto");
                break;

            default:
                req.flash("error", "Hubo algun error al intentar añadir el nuevo AtoN con NIF  " + newBalizamiento.nif);
        }
        res.redirect("/aton/add");
    }
});

//CRUD ATON read
router.get("/list", async (req, res) => {
    var numPintado = 0;
    const balizas = await db.query(queryListadoAton);
    const tickets = await db.query("select * from tickets where solved_at IS NULL");
    const preventivos = await db.query("select * from preventivos where solved_at IS NULL");
    balizas.forEach((element) => {
        const hasItem = tickets.some(obj => obj.nif === element.nif);
        const hasPreventivo = preventivos.some(obj => obj.nif === element.nif);
        if (hasItem)
            element.hasTicket = true;
        if (hasPreventivo)
            element.hasPreventivo = true;
        if (element.necesita_pintado)
            numPintado++;
    });
    const numTickets = tickets.length;
    const numPreventivos = preventivos.length;
    res.render("aton/list", { balizas, numTickets, numPintado, preventivos, numPreventivos });

});
router.get("/list/:busqueda", async (req, res) => {
    var { busqueda } = req.params;
    var balizas;
    if (busqueda === 'Ext') {
        balizas = await db.query(queryListadoAton + " where b.nif=lo.nif AND lo.puerto not like '%valencia%' and lo.puerto not like '%sagunto%' and lo.puerto not like '%gandia%' order by lo.nif");
    } else {
        busqueda = "%" + busqueda + "%";
        balizas = await db.query(queryListadoAton + " where b.nif=lo.nif AND lo.puerto like ? order by lo.nif", busqueda);
        //like is case insensitive por defecto. En caso de quererlo sensitivo hay que añadir solo "like binary"
    }

    //Añado la info de los tickets
    const tickets = await db.query("select * from tickets where solved_at IS NULL");
    balizas.forEach((element) => {
        const hasItem = tickets.some(obj => obj.nif === element.nif);
        if (hasItem)
            element.hasTicket = true;
    });

    res.render("aton/list", { balizas });
});
router.get("/plantilla/:nif", async (req, res) => {
    const { nif } = req.params;
    

    //const baliza = await db.db.query('SELECT * FROM balizamiento b  LEFT JOIN localizacion lo ON lo.nif=b.nif  LEFT JOIN lampara la ON la.nif=b.nif where b.nif=?', [nif]);  CON ESTA CONSULTA EL LEFT JOIN NO FUNCIONA BIEN PARA EL HIPOTETICO CASO EN EL QUE EXISTE UN ATON QUE NO ESTA EN ALGUNA DE LAS TRES TABLAS
    const baliza = await db.query(queryListadoAton + ' where b.nif=?', [nif]);
    if (baliza[0]) {
        const observaciones = await db.query('SELECT * FROM observaciones where nif=?', [nif]);
        const mantenimiento = await db.query('SELECT * FROM mantenimiento where nif=? order by fecha DESC', [nif]);
        const tickets = await db.query(queryListadoTicketsUsers + 'where t.nif=? and solved_at is null', [nif]);
        const preventivos = await db.query(queryListadoPreventivosUsers + 'where p.nif=? and solved_at is null', [nif]);
        var fotos = await funciones.getFotosOrdenadas(nif);
        if (baliza[0].esBoya)
            var [fondeo] = await db.query('select * from fondeos where nif=?', [nif]);
        const mensajes = await dbnetcom.query("select * from sms36_messages where remote_station=? order by date_time desc limit 100",baliza[0].remote_id);
        res.render("aton/plantilla", { layout: 'layoutPlantilla', baliza: baliza[0], obs: observaciones, mant: mantenimiento, fotos, tickets, preventivos, fondeo, mensajes });
    } else {
        req.flash("warning", "La señal indicada con nif " + nif + " no existe!!");
        res.redirect("/error");
    }
});
router.get("/listfondeos", async (req, res) => {
    var numPintado = 0;
    const balizas = await db.query(queryListadoAton + " where b.esBoya IS TRUE");
    const tickets = await db.query("SELECT t.* FROM tickets t LEFT JOIN balizamiento b ON t.nif = b.nif WHERE b.esBoya = TRUE;");
    const preventivos = await db.query("SELECT p.* from preventivos p LEFT JOIN balizamiento b ON b.nif=p.nif where b.esBoya = TRUE and p.solved_at IS NULL");
    balizas.forEach((element) => {
        const hasItem = tickets.some(obj => obj.nif === element.nif);
        const hasPreventivo = preventivos.some(obj => obj.nif === element.nif);
        if (hasItem)
            element.hasTicket = true;
        if (hasPreventivo)
            element.hasPreventivo = true;
        if (element.necesita_pintado)
            numPintado++;
    });
    const numTickets = tickets.length;
    const numPreventivos = preventivos.length;
    res.render("fondeos/list", { balizas, numTickets, numPintado, preventivos, numPreventivos });

});

//CRUD ATON update
router.get("/editCaracteristicas/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const { nif } = req.params;
    var baliza = await db.query("SELECT * FROM balizamiento WHERE nif=?", [nif]);

    if (baliza[0] == null || baliza[0] == undefined) {
        baliza = { nif };
    } else {
        baliza = baliza[0];
    }
    res.render("aton/editCaracteristicas", { baliza });
});
router.get("/editLocalizacion/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const { nif } = req.params;
    var baliza = await db.query("SELECT * FROM localizacion WHERE nif=?", [nif]);
    if (baliza[0] == null || baliza[0] == undefined) {
        baliza = { nif };
    } else {
        baliza = baliza[0];
    }
    res.render("aton/editLocalizacion", { baliza });
});
router.get("/editLampara/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const { nif } = req.params;
    var baliza = await db.query("SELECT * FROM lampara WHERE nif=?", [nif]);
    if (baliza[0] == null || baliza[0] == undefined) {
        baliza = { nif };
    } else {
        baliza = baliza[0];
    }
    res.render("aton/editLampara", { baliza });
});
router.get("/editFondeo/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const { nif } = req.params;
    var baliza = await db.query("SELECT * FROM fondeos WHERE nif=?", [nif]);
    if (baliza[0] == null || baliza[0] == undefined) {
        baliza = { nif };
    } else {
        baliza = baliza[0];
    }
    res.render("aton/editFondeo", { baliza });
});
router.post("/editCaracteristicas/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const nifviejo = req.params.nif;
    console.log("nif viejo: ", nifviejo)
    var {
        nif,
        num_internacional,
        tipo,
        telecontrol,
        apariencia,
        periodo,
        caracteristica,
        esBoya,
    } = req.body;
    periodo = parseInt(periodo);
    const newBaliza = {
        nif,
        num_internacional,
        tipo,
        telecontrol,
        apariencia,
        periodo,
        caracteristica,
        esBoya,
    };
    console.log(newBaliza);
    try {
        await db.query("UPDATE balizamiento set ? WHERE nif = ?", [
            newBaliza,
            nifviejo,
        ]);
        //En caso de que se modifique el nif
        if (nifviejo != newBaliza.nif) {
            await db.query("UPDATE localizacion set nif= ? WHERE nif = ?", [
                newBaliza.nif,
                nifviejo,
            ]);
            await db.query("UPDATE lampara set nif= ? WHERE nif = ?", [
                newBaliza.nif,
                nifviejo,
            ]);
            await db.query("UPDATE observaciones set nif= ? WHERE nif = ?", [
                newBaliza.nif,
                nifviejo,
            ]);
            await db.query("UPDATE mantenimiento set nif= ? WHERE nif = ?", [
                newBaliza.nif,
                nifviejo,
            ]);
            await db.query("UPDATE tickets set nif= ? WHERE nif = ?", [
                newBaliza.nif,
                nifviejo,
            ]);
            await db.query("UPDATE preventivos set nif= ? WHERE nif = ?", [
                newBaliza.nif,
                nifviejo,
            ]);

        }

        //cambiar de nombre la carpeta de fotos

        var oldName = join(__dirname, '../public/img/imagenes/', nifviejo);
        var newName = join(__dirname, '../public/img/imagenes/', nif);
        await fs.rename(oldName, newName);

        funciones.insertarLog(req.user.usuario, "UPDATE balizamiento", newBaliza.nif + " " + newBaliza.num_internacional + " " + newBaliza.tipo + " " + newBaliza.telecontrol + newBaliza.apariencia + " " + newBaliza.periodo + " " + newBaliza.caracteristica);
        req.flash("success", "Baliza modificada correctamente");
        res.redirect("/aton/plantilla/" + newBaliza.nif);

    } catch (error) {
        console.error(error);
        if (error.errno == -4058) {
            req.flash("error", "Carpeta de imagenes " + newBaliza.nif);
            console.log("ERROR:", error);
        }
        else
            req.flash("error", "Hubo algun error al modificar el aton " + newBaliza.nif + "\n" + error);
        res.redirect("/aton/plantilla/" + newBaliza.nif);
    }


});
router.post("/editLocalizacion/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const nifviejo = req.params.nif;
    var {
        puerto,
        num_local,
        localizacion,
        latitud,
        longitud,
    } = req.body;
    const newBaliza = {
        nif: nifviejo,
        puerto,
        num_local,
        localizacion,
        latitud,
        longitud,
    };
    try {

        var baliza = await db.query("SELECT * FROM localizacion WHERE nif=?", [nifviejo]);
        if (baliza[0] == null || baliza[0] == undefined) {
            await db.query("INSERT into localizacion set ? ", [newBaliza]);
        } else {
            await db.query("UPDATE localizacion set ? WHERE nif = ?", [newBaliza, nifviejo]);
            //await db.query("UPDATE localizacion set coordenadas= point(?,?) WHERE nif = ?", [latitud, longitud, nifviejo]);
        }
        funciones.insertarLog(req.user.usuario, "UPDATE localizacion", newBaliza.nif + " " + newBaliza.puerto + " " + newBaliza.num_local + " " + newBaliza.localizacion + " " + newBaliza.latitud + " " + newBaliza.longitud);
        req.flash("success", "Localizacion de baliza modificada correctamente");
        res.redirect("/aton/plantilla/" + nifviejo);

    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al modificar la localización del aton con NIF " + nifviejo, " \n", error);
        res.redirect("/aton/plantilla/" + nifviejo);
    }

});
router.post("/editLocalizacionFromMap/:nif", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    const nif = req.params.nif;
    var {
        latitud,
        longitud,
        lng, lat
    } = req.body;
    try {
        /*    var [baliza] = await db.db.query("SELECT * FROM localizacion WHERE nif=?", [nif]);
   
           //TODO: convert data to  39º 26.901´N format
   
           baliza.latitud = latitud;
           baliza.longitud = longitud; */

        await db.query("UPDATE localizacion set latitud = ?, longitud= ? WHERE nif = ?", [latitud, longitud, nif]);
        //        baliza.coordenadas= 'point('+lng+','+lat+')';
        await db.query("UPDATE localizacion set coordenadas=point(?,?)  WHERE nif = ?", [lat, lng, nif]);


        funciones.insertarLog(req.user.usuario, "UPDATE localizacion", nif + " " + latitud + " " + longitud);
        req.flash("success", "Localizacion de baliza modificada correctamente");
        res.redirect("/mapa/" + nif);

    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al modificar la localización del aton con NIF " + nif, " \n", error);
        res.redirect("/mapaGeneral/valencia");
    }

});
router.post("/editLampara/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const nifviejo = req.params.nif;
    var {
        altura,
        elevacion,
        alcanceNom,
        linterna,
        candelasCalc,
        alcanceLum,
        candelasInst,
    } = req.body;
    const newBaliza = {
        nif: nifviejo,
        altura,
        elevacion,
        alcanceNom,
        linterna,
        candelasCalc,
        alcanceLum,
        candelasInst,
    };
    try {
        var baliza = await db.query("SELECT * FROM lampara WHERE nif=?", [nifviejo]);
        if (baliza[0] == null || baliza[0] == undefined) {
            await db.query("INSERT into lampara set ? ", [newBaliza]);
        } else {
            await db.query("UPDATE lampara set ? WHERE nif = ?", [newBaliza, nifviejo]);
        }
        funciones.insertarLog(req.user.usuario, "UPDATE lampara", newBaliza.nif + " " + newBaliza.altura + " " + newBaliza.elevacion + " " + newBaliza.alcanceNom + " " + newBaliza.linterna + " " + newBaliza.candelasCalc + " " + newBaliza.alcanceLum + " " + newBaliza.candelasInst);
        req.flash("success", "Lampara del aton modificada correctamente");
        res.redirect("/aton/plantilla/" + nifviejo);

    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al modificar la lampara del aton con NIF: " + nifviejo, " \n", error);
        res.redirect("/aton/plantilla/" + nifviejo);
    }


});
router.post("/editFondeo/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const nifviejo = req.params.nif;
    var {
        calado,
        longitud_cadena,
        ubicacion,
        h_muerto, b_muerto, l_muerto,
        diametro_cadena,
        observaciones,
        area_total_viva,
        Cw_aerodinamico,
        area_total_muerta,
        Cd_aerodinamico,
    } = req.body;
    const newBaliza = {
        nif: nifviejo,
        calado,
        longitud_cadena,
        ubicacion,
        h_muerto, b_muerto, l_muerto,
        diametro_cadena,
        observaciones,
        area_total_viva,
        Cw_aerodinamico,
        area_total_muerta,
        Cd_aerodinamico,
    };
    console.log("params", newBaliza)
    try {

        var baliza = await db.query("SELECT * FROM fondeos WHERE nif=?", [nifviejo]);
        if (baliza[0] == null || baliza[0] == undefined) {
            await db.query("INSERT into fondeos set ? ", [newBaliza]);
        } else {
            await db.query("UPDATE fondeos set ? WHERE nif = ?", [newBaliza, nifviejo]);
        }
        funciones.insertarLog(req.user.usuario, "UPDATE fondeos", newBaliza.nif + " " + newBaliza.calado + " " + newBaliza.longitud_cadena + " " + newBaliza.diametro_cadena);
        req.flash("success", "Fondeo de la boya modificada correctamente");
        res.redirect("/aton/plantilla/" + nifviejo);

    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al modificar el fondeo del aton con NIF " + nifviejo, " \n", error);
        res.redirect("/aton/plantilla/" + nifviejo);
    }

});
router.get("/transform", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    try {
        var baliza = await db.query("SELECT * FROM localizacion");
        for (var i = 0; i < baliza.length; i++) {
            var punto = getPointfromLatLng(baliza[i].latitud, baliza[i].longitud);
            await db.query("UPDATE localizacion set coordenadas= point(?,?) WHERE nif = ?", [punto.lat, punto.lng, baliza[i].nif]);
        }
        req.flash("success", "Localizacion de balizas transformadas correctamente");
        res.redirect("/");
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al modificar la localización", " \n", error);
        res.redirect("/error");
    }
});

//CRUD ATON delete
router.get("/delete/:nif", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    console.log("Borrando aton " + req.params.nif + "...");
    const { nif } = req.params;
    try {
        await db.query("DELETE FROM mantenimiento WHERE nif=?", [nif]);
        await db.query("DELETE FROM observaciones WHERE nif=?", [nif]);
        await db.query("DELETE FROM localizacion WHERE nif=?", [nif]);
        await db.query("DELETE FROM lampara WHERE nif=?", [nif]);
        await db.query("DELETE FROM balizamiento WHERE nif=?", [nif]);
        await db.query("DELETE FROM fondeos WHERE nif=?", [nif]);
        funciones.insertarLog(req.user.usuario, "DELETE aton ", req.params.nif);
        req.flash("success", "Señal borrada correctamente");
        res.redirect("/aton/list");
    } catch (error) {
        req.flash("error", "Hubo algun error al borrar el AtoN con NIF: " + nif);
        res.redirect("/aton/plantilla/" + nif);
    }
});

//GESTION CRUD observaciones
router.post("/observaciones/add", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const {
        nif,
        observaciones,
    } = req.body;
    const observa = {
        nif,
        observaciones,
    };
    try {
        await db.query("INSERT INTO observaciones set ?", [observa]);
        req.flash("success", "Observacion insertada correctamente");
        funciones.insertarLog(req.user.usuario, "INSERT observaciones", observa.nif + " " + observa.observaciones);
        res.redirect("/aton/plantilla/" + nif);
    } catch (error) {
        req.flash("error", "Hubo algun error al añadir la observación", " \n", error);
        res.redirect("/aton/plantilla/" + nif);
    }

});
router.get("/observaciones/delete/:idObs", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    const { idObs } = req.params;
    try {
        const resp = await db.query("select nif from observaciones where id_observacion=?", [idObs]);
        const nif = resp[0].nif;
        await db.query("delete from observaciones where id_observacion=?", [idObs]);
        funciones.insertarLog(req.user.usuario, "DELETE observaciones del aton ", nif);

        req.flash("success", "Observacion de baliza " + nif + " borrada correctamente.");
        res.redirect("/aton/plantilla/" + nif);
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al borrar la observación");
        res.redirect("/aton/plantilla/" + nif);
    }
});
router.get("/observaciones/edit/:idObs", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const { idObs } = req.params;
    const observacion = await db.query("SELECT * FROM observaciones WHERE id_observacion=?", [idObs,]);
    res.render("aton/editObservaciones", { observacion: observacion[0] });
});
router.post("/observaciones/edit/:idObs", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {

    var {
        id_observacion,
        nif,
        observacionNueva,
    } = req.body;

    const newObservacion = {
        id_observacion,
        nif,
        observaciones: observacionNueva,
    };

    try {
        await db.query("UPDATE observaciones set ? WHERE id_observacion = ?", [
            newObservacion,
            id_observacion,
        ]);
        funciones.insertarLog(req.user.usuario, "UPDATE observaciones", newObservacion.nif + " " + newObservacion.observaciones);
        req.flash("success", "Observacion modificada correctamente en la baliza " + nif);
        res.redirect("/aton/plantilla/" + nif);

    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al editar la observación", " \n", error);
        res.redirect("/aton/plantilla/" + nif);
    }
});

//GESTION CRUD mantenimiento
router.post("/mantenimiento/add", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const {
        nif,
        fecha,
        mantenimiento,
    } = req.body;
    const mant = {
        nif,
        fecha,
        mantenimiento,
    };
    try {
        await db.query("INSERT INTO mantenimiento set ?", [mant]);
        funciones.insertarLog(req.user.usuario, "INSERT mantenimiento", mant.nif + " " + mant.fecha + " " + mant.mantenimiento);
        req.flash("success", "Mantenimiento en baliza insertado correctamente");
        res.redirect("/aton/plantilla/" + nif);

    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al añadir mantenimiento al NIF: " + nif, " \n", error);
        res.redirect("/aton/plantilla/" + nif);
    }
});
router.get("/mantenimiento/delete/:idMan", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    const { idMan } = req.params;
    try {
        const resp = await db.query("select nif from mantenimiento where id_mantenimiento=?", [idMan]);
        const nif = resp[0].nif;
        await db.query("delete from mantenimiento where id_mantenimiento=?", [idMan]);
        funciones.insertarLog(req.user.usuario, "DELETE mantenimientos del aton", nif);
        req.flash("success", "mantenimiento de baliza " + nif + " borrado correctamente ");
        res.redirect("/aton/plantilla/" + nif);
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al borrar el mantenimiento");
        res.redirect("/aton/plantilla/" + nif);
    }
});
router.get("/mantenimiento/edit/:idMan", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const { idMan } = req.params;
    const mantenimient = await db.query("SELECT * FROM mantenimiento WHERE id_mantenimiento=?", [idMan,]);
    res.render("aton/editMantenimiento", { mant: mantenimient[0] });

});
router.post("/mantenimiento/edit/:idMan", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    var {
        id_mantenimiento,
        nif,
        fechaNueva,
        mantenimientoNuevo
    } = req.body;
    const newObservacion = {
        id_mantenimiento,
        nif,
        fecha: fechaNueva,
        mantenimiento: mantenimientoNuevo,
    };
    try {
        await db.query("UPDATE mantenimiento set ? WHERE id_mantenimiento = ?", [newObservacion, id_mantenimiento]);
        funciones.insertarLog(req.user.usuario, "UPDATE mantenimiento", newObservacion.nif + " " + newObservacion.fecha + " " + newObservacion.mantenimiento);
        req.flash("success", "Mantenimiento modificado correctamente en la baliza " + nif);
        res.redirect("/aton/plantilla/" + nif);
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al modificar el mantenimiento al NIF: " + nif, " \n", error);
        res.redirect("/aton/plantilla/" + nif);
    }
});

// RUTAS PINTURA
//Marca una señal que necesita ser pintada (hace toogle cambiando el estado)
router.get("/pintura/:nif/:from", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    try {
        const { nif } = req.params;
        const { from } = req.params;
        console.log(nif);
        console.log(from);

        const baliza = (await db.query('Select * from balizamiento where nif=?', [nif]))[0];
        baliza.necesita_pintado = !baliza.necesita_pintado;
        await db.query("UPDATE balizamiento set ? WHERE nif = ?", [baliza, nif]);
        if (from == "map")
            res.redirect("/mapa/" + nif);
        else
            res.redirect("/aton/plantilla/" + nif);
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al anotar pintado");
        res.redirect("/aton/plantilla/" + nif);
    }
});
//Confirma que una señal se ha repintado.
router.get("/pintado/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    try {
        const { nif } = req.params;
        const baliza = (await db.query('Select * from balizamiento where nif=?', [nif]))[0];
        baliza.necesita_pintado = false;
        await db.query("UPDATE balizamiento set ? WHERE nif = ?", [baliza, nif]);
        const mant = {
            nif,
            'fecha': moment(new Date()).format("YYYY-MM-DD"),
            'mantenimiento': 'Se repita el aton',
        };
        await db.query("INSERT INTO mantenimiento set ?", [mant]);
        funciones.insertarLog(req.user.usuario, "INSERT mantenimiento", mant.nif + " " + mant.fecha + " " + mant.mantenimiento);
        req.flash("success", "Pintado en AtoN anotado correctamente");
        res.redirect("/aton/plantilla/" + nif);

    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al añadir mantenimiento al NIF: " + nif);
        res.redirect("/aton/plantilla/" + nif);
    }
});
//Mostrar listado de pintadas
router.get('/pintadas/list', funciones.isAuthenticated, async (req, res) => {
    try {
        const pintados = await db.query('select * from mantenimiento where mantenimiento like "%pinta%" order by fecha desc');
        res.render('aton/pintadoList', { item: pintados });
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al intentar mostrar los tickets: " + error);
        res.redirect("/");
    }
});

//RUTAS DE ACTIVADOS Y DESACTIVADOS
//Para cambiar estado de una señal desde el mapa, redirecciona a plantilla
router.get("/activado/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    try {
        const { nif } = req.params;
        const baliza = (await db.query('Select * from balizamiento where nif=?', [nif]))[0];
        baliza.apagada = !baliza.apagada;
        await db.query("UPDATE balizamiento set ? WHERE nif = ?", [baliza, nif]);
        req.flash("success", "AtoN " + nif + " activado correctamente");
        res.redirect("/aton/plantilla/" + nif);
    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al activar AtoN NIF: " + nif);
        res.redirect("/aton/plantilla/" + nif);
    }
});
//Para cambiar estado de una señal desde el mapa, redirecciona al mapa
router.get("/toggleapagado/:nif", funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    try {
        const { nif } = req.params;
        const baliza = (await db.query('Select * from balizamiento where nif=?', [nif]))[0];
        baliza.apagada = !baliza.apagada;
        await db.query("UPDATE balizamiento set ? WHERE nif = ?", [baliza, nif]);
        req.flash("success", "AtoN " + nif + " toggle activado correctamente");
        res.redirect("/mapa/" + nif);

    } catch (error) {
        console.error(error);
        req.flash("error", "Hubo algun error al toggle activar AtoN NIF: " + nif);
        res.redirect("/mapa/" + nif);
    }
});
export default router;
import express from 'express';
const router = express.Router();
import funciones from "../lib/funciones.js";
import db from "../database.js"; //db hace referencia a la BBDD

//GESTION INVENTARIO
router.get('/inventario', funciones.isAuthenticated, async (req, res) => {
    const inventario = await db.query("select * from inventario order by fila,columna");
    res.render('inventario/inventario', { inventario });
});
router.get('/inventario/add', funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    res.render('inventario/addItem');
});
router.post('/inventario/add', funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    var {
        tipo,
        item,
        descripcion,
        cantidad,
        fila,
        columna
    } = req.body;

    const nuevoItem = {
        tipo,
        item,
        descripcion,
        cantidad,
        fila,
        columna
    };

    console.log(nuevoItem);
    await db.query("insert into inventario set ? ", [nuevoItem]);
    funciones.insertarLog(req.user.usuario, "INSERT inventario", "Item " + nuevoItem.item + " añadido " + nuevoItem.cantidad + " cantidades");
    req.flash("success", "Item añadido al inventario correctamente");
    res.redirect("/inventario");
});
router.get('/inventario/edit/:id', funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    const { id } = req.params;
    //console.log(id);
    const item = await db.query("select * from inventario where id=?", id);
    //console.log(item[0]);
    res.render('inventario/edit', { item: item[0] });
});
router.post('/inventario/edit/:id', funciones.isAuthenticated, funciones.hasSanPrivileges, async (req, res) => {
    var {
        id,
        tipo,
        item,
        descripcion,
        cantidad,
        fila,
        columna
    } = req.body;

    const nuevoItem = {
        id,
        tipo,
        item,
        descripcion,
        cantidad,
        fila,
        columna
    };
    await db.query("update inventario set ? where id=?", [nuevoItem, id]);
    funciones.insertarLog(req.user.usuario, "UPDATE inventario", "Info actualizada " + nuevoItem.item + " " + nuevoItem.cantidad);
    req.flash("success", "Inventario actualizado correctamente");
    res.redirect("/inventario");
});
router.get("/inventario/delete/:id", funciones.isAuthenticated, funciones.isAdmin, async (req, res) => {
    //console.log(req.params.idObs);
    const { id } = req.params;
    await db.query("delete from inventario where id=?", [id]);
    req.flash("success", "Item eliminado correctamente.");
    res.redirect("/inventario");
});

export default router;
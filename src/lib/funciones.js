import bcryptjs from 'bcryptjs';
import { join } from 'path';
import fse from 'fs-extra';
import { promises as fs } from "fs";
import db from "../database.js";
import mysqldump from 'mysqldump';
import { stringify } from 'querystring';
import { createInterface } from 'readline';
import * as url from "url";
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));
const funciones = {};

funciones.getFotosOrdenadas = async (nif) => {
    const directorio = join(__dirname, "../public/img/imagenes", nif);

    try {
        // Verificamos si el directorio existe
        await fs.access(directorio);

        const files = await fs.readdir(directorio);

        if (!files.length) return [];

        const archivosConFechas = await Promise.all(
            files.map(async (file) => {
                const rutaCompleta = join(directorio, file);
                const stats = await fs.stat(rutaCompleta);

                return {
                    file,
                    time: stats.mtime,
                };
            })
        );

        archivosConFechas.sort((a, b) => b.time - a.time);

        return archivosConFechas.map(f => f.file);

    } catch (err) {

        // Si la carpeta no existe → no lo tratamos como error
        if (err.code === "ENOENT") {
            return [];
        }

        // Otros errores sí los mostramos
        console.error("Error real al leer imágenes:", err);
        return [];
    }
};


funciones.listadoCarpetas = async (req, res, next) => {
    var source = join(__dirname, "../public/img/imagenes/");
    let filesAndDirectories = await fse.readdir(source);
    //console.log(filesAndDirectories);
    let directories = [];
    filesAndDirectories.forEach(element => {
        directories.push(element);
    })
    return directories;

}

funciones.listadoBackups = (req, res, next) => {
    var documentos = [];
    var directorio = join(__dirname, "../public/dumpSQL");
    fse.readdir(directorio, (err, files) => {
        if (files) {
            files.forEach(file => {
                var item = {
                    'name': file,
                    'created_at': (fse.statSync(directorio + "/" + file)).birthtime
                }
                documentos.push(item);
            });
        } else {
            console.log("No hay files");
        }
    });
    return documentos;
}

funciones.listadoBackupsFotos = (req, res, next) => {
    var backups = [];
    var directorio = join(__dirname, "../public/dumpFOTOS/");
    fse.readdir(directorio, (err, files) => {
        if (files) {
            files.forEach(file => {
                var item = {
                    'name': file,
                    'size': (fse.statSync(join(directorio, file)).size / (1024 * 1024)).toFixed(2),
                    'created_at': fse.statSync(join(directorio, file)).birthtime,
                }
                backups.push(item);
            });
        } else {
            console.log("No hay files");
        }
    });
    backups.sort((a, b) => a.created_at - b.created_at);
    return backups;
}

funciones.encryptPass = async (password) => {
    const sal = await bcryptjs.genSalt(10);
    password = await bcryptjs.hash(password, sal);
    return password;
};

funciones.verifyPassword = async (password, hashedPassword) => {
    try {
        return await bcryptjs.compare(password, hashedPassword);
    } catch (e) {
        console.log(e);
    }
}

funciones.isAuthenticated = (req, res, next) => {
    if (req.isAuthenticated()) {
        return next();
    }
    return res.redirect('/signin');
}

funciones.isNotAuthenticated = (req, res, next) => {
    if (!req.isAuthenticated()) {
        return next();
    }
    return res.redirect('/profile');
}

funciones.hasSanPrivileges = (req, res, next) => {
    if (req.user.privilegio == "san" || req.user.privilegio == "admin") {
        return next();
    }
    return res.redirect('/noperm');
}

funciones.hasNotSanPrivileges = (req, res, next) => {
    if (req.user.privilegio != "san" && req.user.privilegio != "admin") {
        return next();
    }
    return res.redirect('/noperm');
}

funciones.isAdmin = (req, res, next) => {
    if (req.user.privilegio == "admin") {
        return next();
    }
    return res.redirect('/noperm');
}

funciones.isNotAdmin = (req, res, next) => {
    if (!req.user.privilegio == "admin") {
        return next();
    }
    return res.redirect('/noperm');
}

funciones.insertarLog = async (usuario, accion, observacion) => {
    const log = {
        usuario,
        accion,
        observacion
    }
    try {
        console.log("Insertando log: " + stringify(log));
        const a = await db.query("insert into logs SET ?", [log]);
        return a;
    } catch (err) {
        console.log(err);
        return "error";
    }

}

funciones.dumpearSQL = (operacion) => {
    // dump the result straight to a file
    console.log("===============================");
    console.log(db.config.connectionConfig);
    var tables = [];
    switch (operacion) {
        case 'balizamiento':
            tables.push("balizamiento", "localizacion", "lampara", "fondeos");
            break;
        case 'mantenimiento':
            tables.push("mantenimiento", "observaciones");
            break;
        case 'completo':
            tables.push("balizamiento", "localizacion", "lampara", "fondeos", "mantenimiento", "observaciones", "tickets", "inventario", "logs", "usuarios", "preventivos");
            break;
        default:
            break;
    }
    mysqldump({
        connection: {
            host: db.config.connectionConfig.host,
            user: db.config.connectionConfig.user,
            password: db.config.connectionConfig.password,
            database: db.config.connectionConfig.database,
        },
        dumpToFile: './src/public/dumpSQL/dumpSAN' + '-' + operacion + '-' + Date.now() + '.sql',
        dump: {
            tables,
        }
    });
}

funciones.runSQLrecovery = (file) => {
    let ruta = join(__dirname, '..', 'public', 'dumpSQL', file);

    var rl = createInterface({
        input: fse.createReadStream(ruta),
        terminal: false
    });
    let total = "";
    rl.on('line', function (chunk) {

        //Para evitar ejecucion de comentarios en la query
        if (chunk.toString('ascii').charAt(0) != '/')
            total += chunk.toString('ascii');


        if (chunk.toString('ascii').charAt(chunk.length - 1) == ';') {
            db.query(total, function (err, sets, fields) { if (err) console.log(err); });
            total = "";
        }
    });
    rl.on('close', function () {
        console.log("finished");
    });
}

funciones.getCode = () => {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; //abcdefghijklmnopqrstuvwxyz
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < 6) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
        counter += 1;
    }
    return result;
}

funciones.sendRecoveryMail = async (email, token) => (req, res) => {
}

funciones.consultaPrueba = async (filename) => {
    let ruta = join(__dirname, '..', '..', 'database', filename);

    var rl = createInterface({
        input: fse.createReadStream(ruta),
        terminal: false
    });
    rl.on('line', function (chunk) {
        db.query(chunk.toString('ascii'), function (err, sets, fields) {
            if (err) console.log(err);
        });
    });
    rl.on('close', function () {
        console.log("finished");
    });

}

export default funciones;
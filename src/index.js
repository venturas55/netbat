import express, { urlencoded, json } from "express";
import morgan from "morgan";
import { engine } from "express-handlebars"; //Para usar plantillas
import handlebars from "./lib/handlebars.js"; //Para usar funciones en las plantillas
import flash from "connect-flash"; //Para mostar mensajes
import session from "express-session"; //Lo necesita el flash tb
import MySQLstore from "express-mysql-session"; // para poder guardar la sesion en la sql
import { config } from "./config.js";
import passport from "passport";
import cors from "cors";
import "./lib/passport.js"; //para que se entere de la autentificacion que se ha creado
import * as path from "path";
import * as url from "url";
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));

//Inicializacion
const app = express();
app.set("trust proxy", true); 

//Configuracion
app.set("port", config.PORT);
app.set("views", path.join(__dirname, "views"));
app.engine(
  ".hbs",
  engine({
    //con esto se configura el app.engine
    defaultLayout: "main",
    layoutDir: path.join(app.get("views"), "layouts"),
    partialsDir: path.join(app.get("views"), "partials"),
    extname: ".hbs",
    helpers: handlebars, //no hay nada aun
  })
);
app.set("view engine", ".hbs"); //Para utilizar el app.engine
//Middleware
app.use(
  cors /* {
    origin: (origin, callback) => {
        const ACCEPTED_ORIGINS = [
            "http://localhost:" + app.get('port'),
            "http://san.adriandeharo.es:" + app.get('port'),
            "https://localhost:" + app.get('port'),
            "https://san.adriandeharo.es:" + app.get('port'),
        ]
        if (ACCEPTED_ORIGINS.includes(origin)) {
            return callback(null, true);
        }
        if (!origin) {
            return callback(null, true);
        }
        return callback(new Error("CORS no aceptado en la app"));
    }
} */()
);
app.use(
  session({
    secret: "mysesion",
    resave: false,
    saveUninitialized: false,
    store: new MySQLstore(config.database),
  })
);
app.use(flash()); // Para poder usar el middleware de enviar mensajes popups
app.use(morgan("dev")); //Para que muestre mensajes relacionados con el desarrollo por consola
app.use(urlencoded({ extended: false })); //aceptar los datos desde los formularios sin aceptar imagenes ni nada raro
app.use(json()); //Para enviar y recibir jsons.
app.use(passport.initialize()); //iniciar passport
app.use(passport.session()); //para que sepa donde guardar y como manejar los datos


//Variables globales (que podrán ser usadas en cualquier vista)
app.use((req, res, next) => {
  app.locals.signupMessage = req.flash("signupMessage");
  app.locals.success = req.flash("success");
  app.locals.warning = req.flash("warning");
  app.locals.error = req.flash("error");
  app.locals.message = req.flash("message");
  app.locals.user = req.user;
  //app.locals.direccion = req.headers.host;
  //req.secure?app.locals.cabecera="https://": app.locals.cabecera="http://";
  //app.locals.cabecera2 = req.protocol + "://";
  //app.locals.puerto = app.get("port");
  next();
});

//Rutas
import rutas from "./routes/index.js";
import authentication from "./routes/authentication.js";
import fotos from "./routes/fotos.js";
import aton from "./routes/aton.js";
import documentos from "./routes/documentos.js";
import api from "./routes/api.js";
import inventario from "./routes/inventario.js";
import backups from "./routes/backups.js";
import mapas from "./routes/mapas.js";
import profile from "./routes/profile.js";
import tickets from "./routes/tickets.js";
import preventivos from "./routes/preventivos.js";
import netbat from "./routes/netbat.js";
app.use(rutas); // Esta busca automáticamente index.js en la carpeta routes
app.use(authentication); // Si el archivo tiene exportación por defecto
app.use(fotos);
app.use("/aton", aton);
app.use(documentos);
app.use(api);
app.use(inventario);
app.use(backups);
app.use(mapas);
app.use(profile);
app.use("/netbat",netbat);
app.use("/tickets", tickets);
app.use("/mantenimientopreventivo", preventivos);

//Public
//Bootstrap
app.use((express.static(path.join(__dirname,"public"))));
app.use("/css", express.static(path.join(__dirname, "../node_modules/bootstrap/dist/css")));
app.use('/js', express.static(path.join(__dirname, '../node_modules/@popperjs/core/dist/umd')))
app.use('/js', express.static(path.join(__dirname, '../node_modules/jquery/dist')))
app.use("/js", express.static(path.join(__dirname, "../node_modules/bootstrap/dist/js")));
app.use("/fonts", express.static(path.join(__dirname, "../node_modules/font-awesome/fonts")));
app.use("/css", express.static(path.join(__dirname, "../node_modules/font-awesome/css")));

//Leaflet
app.use("/leaflet", express.static(path.join(__dirname, "../node_modules", "leaflet", "dist")));

//Arrancar servidor
app.listen(app.get("port"), () => {
  console.log("Running on http://localhost:" + app.get("port"));
});

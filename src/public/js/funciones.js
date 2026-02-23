// LE BE estribor LB babor BE
// CARDINAL CN CS CE CO
// ESPECIAL ME
// FARO FA

const protocolo = window.location.protocol;
const host = window.location.host;  
const myurl = `${protocolo}//${host}`;

//FUNCION PARA CERRAR MODALES
function cierraModal() {
    var el = document.getElementsByClassName("modal");
    for (var i = 0; i < el.length; i++) {
        el[i].style.display = "none";
    }
    passcheck = "";
}
function cambiarUsuario() {
    var passcheck = document.getElementById("contrasenaConfirmacion").value;
    //TODO: verificar el pass con la base de datos
}

function abreModalObs(id) {
    //console.log("observacion con id" + id);
    var item = document.getElementById("myModalBorradoObs");
    var ref = document.getElementById("refobsdel");
    ref.href += id;
    item.style.display = 'block';
}

function abreModalMant(id) {
    //console.log("Mantenimiento con id" + id);
    var item = document.getElementById("myModalBorradoMant");
    var ref = document.getElementById("refmantdel");
    ref.href += id;
    item.style.display = 'block';
}

function abreModalPrev(id,nif) {
    //console.log("Mantenimiento con id" + id);
    var item = document.getElementById("myModalBorradoPreventivo"); 
    var ref = document.getElementById("refprevdel");
    document.getElementById("preventivoidmodal").innerHTML=id;
    document.getElementById("preventivonifmodal").innerHTML=nif;
    ref.href += id;
    item.style.display = 'block';
}

function abreModalReabrirPrev(id,nif) {
    //console.log("Mantenimiento con id" + id);
    var item = document.getElementById("myModalReabrirPreventivo"); 
    var ref = document.getElementById("refprevreabrir");
    document.getElementById("reabrirpreventivoidmodal").innerHTML=id;
    document.getElementById("reabrirpreventivonifmodal").innerHTML=nif;
    console.log(item);
    item.style.display = 'block';
}
function abreModalFoto(nif,nombre) {
    //console.log("observacion con id" + id);
    var item = document.getElementById("myModalBorradoFoto");
    var ref = document.getElementById("reffotodel"); 
     document.getElementById("fotoidmodal").innerHTML=nombre;
    ref.href = `/aton/fotos/${nif}/${nombre}/delete`;
    item.style.display = 'block';
}

/////############
//FUNCIONES PARA EL MAPS DE GOOGLE
//FUNCION PARA CONFIGURAR LA VARIABLE CON LA QUE SE CENTRARÁ EL MAPA DE LA API DE GOOGLE, COGIENDO EL CENTRO DE LA PROPIA URL
//En el presente proyecto se denomina a:
//       coordendas WGS al formato por ejemplo 39º 52.417'N
//       coordendas UTM al formato por ejemplo 39º 52' 25" N
//       coordendas DECIMAL al formato por ejemplo 39.873617

function centrar() {
    let centerLatLng = {};
    const url = window.location.href.split('/');
    //console.log(url[url.length-1]);

    switch (url[url.length - 1]) {
        case 'valencia':
            centerLatLng = {
                lat: 39.438,
                lng: -0.3172
            };
            presetZoom = 14;
            break;
        case 'sagunto':
            centerLatLng = {
                lat: 39.642,
                lng: -0.2142
            };
            presetZoom = 14.4;
            break;
        case 'gandia':
            centerLatLng = {
                lat: 38.995,
                lng: -0.15202
            };
            presetZoom = 16.5;
            break;
        default:
            centerLatLng = setMarkerLatLng(lat.value, lng.value);
            presetZoom = 18;
    }


    // console.log(centerLatLng);
    return centerLatLng;
}
//UN FETCH que se guarda en la variable 'balizas'
async function fetchData() {
    try {
        var apiURL = myurl + "/api/balizas";
        console.log("fetch URL: ", apiURL);
        return await fetch(apiURL).then(res => res.json());
        /* .then(response => {
            var data = response;
            //balizasprueba = JSON.stringify(response);
            //console.log(balizasprueba);
            return data;
            //initMap(data);
        }); */
    } catch (err) {
        console.log(err);
    }


}
//FIN FETCH

//FUNCION PARA TRADUCIR COORDENADAS. DEVUELVE UN OBJETO GOOGLE FORMAT CON LAS COORDENADAS
function setMarkerLatLng(lat, lng) {
    function parseCoord(coord, positiveDir, negativeDir) {
        let result = 0;
        coord = coord.replaceAll("'", "´").replaceAll("°", "º");

        if (coord == null || !coord.includes("º")) return coord;

        let parts = coord.split("º");

        if (parts.length < 2) return result;

        let degrees = parseFloat(parts[0].trim());
        let minutesPart = parts[1].replace(",", ".").trim();

        let minutesVector = minutesPart.split(".");

        if (minutesVector.length > 1) {
            let minInt = parseFloat(minutesVector[0]);
            let remaining = minutesVector[1] || "";

            let direction = '';
            let minDecimal = 0;

            if (remaining.includes("´")) {
                [minDecimal, direction] = remaining.split("´");
            } else {
                [minDecimal, direction] = remaining.split(" ");
            }

            minDecimal = parseFloat(minDecimal || 0);
            direction = (direction || "").trim();

            result = degrees + (minInt + minDecimal / 1000) / 60;

            if (direction === negativeDir) result *= -1;
        } else {
            let [minOnly, direction] = minutesVector[0].trim().split(" ");
            let minutes = parseFloat(minOnly || 0);
            direction = (direction || "").trim();

            result = degrees + minutes / 60;

            if (direction === negativeDir) result *= -1;
        }

        return parseFloat(result.toFixed(6));
    }

    return {
        lat: parseCoord(lat, "N", "S"),
        lng: parseCoord(lng, "E", "W")
    };
}

//FUNCION PARA TRADUCIR COORDENADAS DE UN OBJETO GOOGLE FORMAT PASA A COORDENADAS WEB.
function getMarkerLatLng({ lat, lng }) {
    //console.log(lat + " " + lng)
    var lattext = "";
    var lngtext = "";
    var latabs = Math.abs(lat);
    var lngabs = Math.abs(lng);

    lattext = Math.trunc(latabs) + "º " + ((latabs - Math.trunc(latabs)) * 60).toFixed(3) + "´";
    lat > 0 ? lattext += "N" : lattext += "S";


    lngtext = Math.trunc(lngabs) + "º " + ((lngabs - Math.trunc(lngabs)) * 60).toFixed(3) + "´";
    lng > 0 ? lngtext += "E" : lngtext += "W";


    return {
        'lat': lattext,
        'lng': lngtext
    };
}

//FUNCION QUE LE PASA UN OBJETO BALIZA Y LE DEVUELVE UNA LETRA QUE REPRESENTA EL COLOR/TIPO
function getTipo(item) {
    const tipo = item.tipo.toLowerCase();
    const caracteristica = item.caracteristica.toLowerCase().replace(/[\s.,+]/g, "");
    let apariencia = item.apariencia.toUpperCase().replace(/\s/g, "");
    let color = apariencia.slice(-1); // Último carácter

    // Clasificación por tipo principal
    if (tipo.includes("faro")) {
        return "F";
    }
    if (tipo.includes("semaforo")) {
        return "S";
    }
    if (tipo.includes("peligro")) {
        return "PA";
    }
    if (tipo.includes("navegable") || tipo.includes("nuevo")) {
        return "AN";
    }
    if (tipo.includes(" odas ") || tipo.includes(" sado ")) {
        return "ODAS";
    }
    if (tipo.includes("telecontrol")) {
        return "TC";
    }

    // Clasificación por color y combinación
    const tieneCombinacion = /[234]\+1/.test(apariencia);

    switch (color) {
        case 'R':
            return tieneCombinacion ? "RB" : "R";
        case 'G':
        case 'V':
            return tieneCombinacion ? "VB" : "V";
        case 'B':
        case 'W':
            color = "B";
            break;
        case 'A':
        case 'Y':
            color = "A";
            break;
    }

    // Boyas cardinales blancas
    const cardinales = {
        "l025oc025": "CN",
        "[(l025oc025)x2]l025oc375": "CE",
        "[(l025oc025)x2]l025oc35": "CE",
        "[(l03oc08)x2]l03oc25": "CE",
        "[(l025oc025)x6]l2oc5": "CS",
        "[(l025oc025)x5]l025oc375": "CO"
    };

    if ((tipo.includes("cardinal") || color=="B") && cardinales[caracteristica]) {
        return cardinales[caracteristica];
    }

    return color;
}

function getFlash(item){
     let apariencia = item.apariencia.toLowerCase().replace(/[\s()]/g, "").replace(/rp/g, "d");
     return apariencia;
}

///////// #################################
//FUNCIONES PARA EL FILTRADO
//FUNCION para comprobar si algun objeto del DOM es null
function isNull(campo) {
    return !(typeof campo !== 'undefined' && campo !== null);
}
//FUNCION SOLO PARA CONTAR FILAS EN VISTA 'balizas/list.hbs'
async function contar() {
    //var numElem = document.getElementsByClassName("hidden").length;
    var numElem = document.querySelectorAll('[style="display: none;"]');
    //console.log(numElem);
    let suma = document.getElementById("suma");
    if (!isNull(suma)) {
        suma.innerHTML = inicial.length;
        document.getElementById("suma").innerHTML = (inicial.length - numElem.length);
    }
}

////##############
//FUNCIONES PARA EL PARPADEO
//Funcion que cambia la 'visibilidad' del elemento circular que simula la luz
function parpadeoToggle() {
    let x = document.getElementById("luz");
    if (x.style.display === "block") {
        x.style.display = "none";
    } else {
        x.style.display = "block";
    }
}
//Funcion que cambia el estado tras un retardo indicado 
function secuencia() {
    document.getElementById("luz").style.display = "block";
    for (let i = 0; i < destellosAcum.length - 1; i++) {
        setTimeout(parpadeoToggle, destellosAcum[i] * 1000);
    }
}
//Funcion para leer el color de la señal.
function defineColor() {
    let apariencia = document.getElementById("aparienciaID");
    let ap = apariencia.innerText.charAt(apariencia.innerText.length - 1).toUpperCase();
    //console.log(ap);
    switch (ap) {
        case 'R':
            document.getElementById("luz").style.backgroundColor = "red";
            break;
        case 'G':
        case 'V':
            document.getElementById("luz").style.backgroundColor = "green";
            break;
        case 'B':
        case 'W':
            document.getElementById("luz").style.backgroundColor = "rgb(240, 240, 240)";
            break;
        case 'A':
        case 'Y':
            document.getElementById("luz").style.backgroundColor = "yellow";
            break;
    }
}
//Funcion que cambia el estado tras un retardo indicado 
function defineCambiosEstado() {
    let destellos;
    let destellosAcum;
    let caracteristicaMod;
    let repeticiones;
    let caracteristica = document.getElementById("caracteristicaID").innerText;
    caracteristica = caracteristica.toLowerCase();
    caracteristica = caracteristica.replace(/\ |\(|\[|\[|\)|\]\+/g, '').replace(/,/g, '.').replace(/oc/g, "l").replace(/o/g, "l");
    //console.log(caracteristica);

    //Tratamos las posibles repeticiones
    //Si hay X
    if (caracteristica.search("x") != -1) {
        repeticiones = caracteristica.charAt(caracteristica.search("x") + 1); //el siguiente digito al simbolo multiplicacion 'x' es el numero de repeticiones
        let trimado = 'x' + repeticiones;
        caract = caracteristica.split(trimado);
        caract[0] = caract[0].repeat(repeticiones);
        caracteristicaMod = caract[0].concat(caract[1]);
    } else
        caracteristicaMod = caracteristica;
    //console.log(caracteristicaMod)


    //Doy por hecho que siempre se alternan L y O empezando por L
    caracteristicaMod = caracteristicaMod.replace('l', '');
    //quito la primera L por no generar un item de array al usar el split
    destellos = caracteristicaMod.split('l');
    destellosAcum = new Array(destellos.length);
    destellosAcum.fill(0, 0, destellos.length);

    //Lo parseo a float
    for (let i = 0; i < destellos.length; i++) {
        destellos[i] = parseFloat(destellos[i]);
    }
    //console.log(destellos);


    //Genero un array con los tiempos acumulados, desde 0 para poder aplicar los setInterval.
    for (let i = 0; i < destellosAcum.length; i++) {
        for (let j = 0; j <= i; j++) {
            destellosAcum[i] += parseFloat(destellos[j]);
        }
    }
    console.log(destellosAcum);
    return destellosAcum;
}

//PARA ELIMINAR FOTOS EN FORMULARIO DE PREVENTIVOS
function eliminarFoto(id, campo) {
    if (!confirm('¿Seguro que quieres eliminar esta imagen?')) return;

    fetch('/mantenimientopreventivo/eliminar-foto', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id, campo })
    })
    .then(res => {
        if (!res.ok) throw new Error('Error al eliminar');
        return res.json();
    })
    .then(data => {
        // Opcional: eliminar la imagen del DOM
        location.reload(); // o manipular el DOM para quitar la imagen
    })
    .catch(err => {
        console.error(err);
        alert('Error al eliminar imagen');
    });
}
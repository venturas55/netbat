// initialize Leaflet
let centerLatLng = centrar();
let posicionInicial = { lat: 1, lng: 1 };
let map;
let pinMarkers = [];
let secondClick = false, firstLatLng, secondLatLng;
var popup = L.popup();

fetchData()?.then((balizas) => {
  // === 1. INICIALIZACIÓN DEL MAPA ===
  const map = L.map('myMap').setView(centerLatLng, presetZoom);
  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', { maxZoom: 17 }).addTo(map);
  L.control.scale({ imperial: true, metric: true }).addTo(map);
  map.attributionControl.setPrefix('');
  map.on('click', onMapDistance);

  const markers = [];

  // === 2. FUNCIONES AUXILIARES ===

  function crearIcono(item) {
    const icono = getTipo(item);
    const iconConfig = {
      iconUrl: `${myurl}/img/icon/${icono}.png`,
      iconSize: [16, 30],
      iconAnchor: [8, 30],
      className: item.apagada ? 'AtoN desactivada' : 'AtoN activada',
    };


    if (icono === 'TC') {
      iconConfig.iconSize = [20, 20];
      iconConfig.iconAnchor = [10, 50];
    }
    return L.icon(iconConfig);
  }

  function crearTooltip(item, marker) {
    const ruta = item.pictureUrl.length > 0
      ? `/img/imagenes/${item.nif}/${item.pictureUrl[0]}`
      : "/img/icon/buoyIcon.jpg";

    return `
      <div class="bind-tooltip">
        <p><strong>NIF: ${item.nif}</strong></p>
        <p>Apariencia: ${item.apariencia}</p>
        <p class="text-center">${marker.getLatLng()}</p>
        <img class="avatar avatar-s" src="${ruta}" />
      </div>`;
  }

  function crearPopupHTML(item, position, textposition, posicionInicial) {
    return `
      <div class="card-body">
        <h4>¿Desplazar señal aquí?</h4>
        <form action="/aton/editLocalizacionFromMap/${item.nif}" method="POST">
          <input type="hidden" name="nif" value="${item.nif}" />
          <div class="form-group mb-2">
            <label for="latitud">LATITUD</label>
            <input type="text" name="latitud" value="${textposition.lat}" class="form-control" />
          </div>
          <div class="form-group mb-2">
            <label for="longitud">LONGITUD</label>
            <input type="text" name="longitud" value="${textposition.lng}" class="form-control" />
          </div>
          <input type="hidden" name="lat" value="${position.lat}" />
          <input type="hidden" name="lng" value="${position.lng}" />
          <div class="form-group mb-2 text-center">
            <button class="btn btn-success btn-block">SI</button>
          </div>
        </form>
        <div class="form-group mb-2 text-center">
          <button type="button" id="cancelarMovimiento" class="btn btn-danger btn-block">NO</button>

        </div>
      </div>`;
  }

  // === 3. DIBUJAR BALIZAS ===

  balizas.forEach(item => {
    const icono = crearIcono(item);
    const marker = new L.Marker(setMarkerLatLng(item.latitud, item.longitud), {
      icon: icono,
      title: item.tipo,
      draggable: true,
    });

    if (item.necesita_pintado) {
      const htmlIcon = L.divIcon({
        className: 'custom-div-icon',
        html: '<i class="fa fa-paint-brush me-1 text-danger infoAtoN info-activada"></i>',
        iconSize: [50, 50],
        iconAnchor: [-10, 35],
      });

      const submarker = L.marker(setMarkerLatLng(item.latitud, item.longitud), {
        icon: htmlIcon,
        interactive: false // si solo lo quieres como decorativo
      });
      submarker.addTo(map);

    }

    if (item.tickets.length > 0) {
      const htmlIcon = L.divIcon({
        className: 'custom-div-icon',
        html: '<i class="fa fa-exclamation-triangle me-1 blink_me text-danger infoAtoN info-activada"></i>',
        iconSize: [50, 50],
        iconAnchor: [20, 35],
      });

      const submarker = L.marker(setMarkerLatLng(item.latitud, item.longitud), {
        icon: htmlIcon,
        interactive: false // si solo lo quieres como decorativo
      });
      submarker.addTo(map);

    }
    let posicionInicial;
    marker.on('dragstart', e => posicionInicial = e.target.getLatLng());

    marker.on('dragend', e => {
      const thismarker = e.target;
      const newPosition = thismarker.getLatLng();
      const textPos = getMarkerLatLng(newPosition);
      thismarker.setLatLng(newPosition, { draggable: 'true' });
      map.panTo(newPosition);
      popup
        .setLatLng(newPosition)
        .setContent(crearPopupHTML(item, newPosition, textPos, posicionInicial))
        .openOn(map);
      markers.push(thismarker);

      // Vincular evento al botón "NO"
      setTimeout(() => {
        const botonCancelar = document.getElementById('cancelarMovimiento');
        if (botonCancelar) {
          botonCancelar.addEventListener('click', () => {
            thismarker.setLatLng(posicionInicial);
            map.setView(posicionInicial);
            map.closePopup();
          });
        }
      }, 0);
    });

    marker.on('click', () => {
      window.location.href = `/aton/plantilla/${item.nif}`;
    });

    marker.bindTooltip(crearTooltip(item, marker), {
      opacity: 0.7,
      direction: 'top',
      sticky: false,
      offset: [0, -10],
    });

    marker.on('contextmenu', e => {
      const ruta = item.pictureUrl.length > 0
        ? `/img/imagenes/${item.nif}/${item.pictureUrl[0]}`
        : "/img/icon/buoyIcon.jpg";

      const html = `
        <div class="bind-tooltip">
          <div class="d-flex flex-row gap-1">
            <p><strong>NIF: ${item.nif}</strong></p> 
            <img class="avatar avatar-s" src="${ruta}" />
          </div>  
          <div class="d-flex flex-column gap-2 mt-2">
            <button class="btn btn-primary btn-sm" onclick="window.location.href='/aton/plantilla/${item.nif}'">Ver</button>
            <button class="btn btn-success btn-sm" onclick="window.location.href='/aton/pintura/${item.nif}/map'">Necesita Pintado</button>
            <button class="btn btn-danger btn-sm" onclick="window.location.href='/aton/toggleapagado/${item.nif}'">Apagar/Activar</button>
            <button class="btn btn-warning btn-sm" onclick="window.location.href='/mantenimientopreventivo/add/${item.nif}'">Preventivo</button>
          </div>  
        </div>`;
      L.popup().setLatLng(e.latlng).setContent(html).openOn(map);
    });

    marker.addTo(map);
  });

  // === 4. CAPA DE ZONAS ===

  const zonas = [{
    type: "Feature",
    properties: { zone: "DPP" },
    geometry: {
      type: "Polygon",
      coordinates: [[
        [-0.2119, 39.4666],
        [-0.2119, 39.3827],
        [-0.32985, 39.422433],
        [-0.331933, 39.4255],
        [-0.334138, 39.4376],
        [-0.3265, 39.4476],
        [-0.332422, 39.4600577],
        [-0.32907, 39.462141],
        [-0.31735, 39.46297],
        [-0.3168, 39.4660],
        [-0.2119, 39.4666],
      ]]
    }
  }];

  const capaZonas = L.geoJSON(zonas, {
    style: feature => ({
      color: feature.properties.zone === 'DPP' ? '#9999ff' : '#ffbbbb'
    })
  });

  let zonasVisibles = false;

  // === 5. BOTONES DE TOGGLE ZONAS ===

  const crearBotonToggle = (position, id, texto, clase, callback) => {
    const control = L.control({ position });
    control.onAdd = function () {
      const div = L.DomUtil.create('div', 'leaflet-control-custom');
      div.innerHTML = `<button id="${id}" class="${clase}">${texto}</button>`;
      L.DomEvent.disableClickPropagation(div);
      return div;
    };
    control.addTo(map);
    return id;
  };

  crearBotonToggle('bottomright', 'toggleZonasBtn', 'Zona II', 'btn btn-primary btn-sm');
  document.getElementById('toggleZonasBtn').addEventListener('click', () => {
    if (zonasVisibles) {
      map.removeLayer(capaZonas);
    } else {
      map.addLayer(capaZonas);
    }
    zonasVisibles = !zonasVisibles;
  });

  crearBotonToggle('topright', 'btn-toogle-ver', 'Ver Desactivadas <i class="fa fa-eye" aria-hidden="true"></i>', 'btn btn-secondary btn-sm');
  document.getElementById('btn-toogle-ver').addEventListener('click', () => {
    toggleVisibilidad();
  });

  
  crearBotonToggle('topright', 'btn-toogle-ver-info', 'Ver info <i class="fa fa-eye" aria-hidden="true"></i>', 'btn btn-secondary btn-sm');
  document.getElementById('btn-toogle-ver-info').addEventListener('click', () => {
    toggleVisibilidadInfo();
  });

});

function drawPin(latlang, title) {
  let iconOptions = {
    title,
    draggable: true,
  }
  let marker = new L.Marker(latlang, iconOptions);

  marker.on('dragend', function (event) {
    thismarker = event.target;
    var position = thismarker.getLatLng();
    thismarker.setLatLng(position, { draggable: 'true' });
    map.panTo(position);
    document.getElementById("latmarker").value = position.lat;
    document.getElementById("lngmarker").value = position.lng;
    actualizarCoordenadaDEC2WGS();
  });
  pinMarkers.push(marker);
  var position = marker.getLatLng();
  map.panTo(position);
  marker.addTo(map);
}

function drawThisPin() {
  drawPin({ "lat": document.getElementById("latmarker").value, "lng": document.getElementById("lngmarker").value }, "Un Pin");
}

function clearAll() {
  for (let i = 0; i < pinMarkers.length; i++)
    map.removeLayer(pinMarkers[i]);
  pinMarkers = [];
}

function clearLast() {
  map.removeLayer(pinMarkers[pinMarkers.length - 1]);
  pinMarkers.pop();
}

function onMapClick(e) {
  var coordenadas = e.latlng.toString().split("(")[1];
  var latitud = coordenadas.split(",")[0];
  var longitud = coordenadas.split(",")[1].split(")")[0];
  popup
    .setLatLng(e.latlng)
    .setContent("Coordenadas " + latitud + "  " + longitud)
    .openOn(map);
}

function onMapDistance(e) {
  if (secondClick) {
    secondClick = false;
    secondLatLng = e.latlng;
    //L.marker(secondLatLng).addTo(map).bindPopup('Point B<br/>' + e.latlng).openPopup();
    drawPin(secondLatLng, "Punto B")
    // Dibujamos una línea entre los dos puntos
    let pl = L.polyline([firstLatLng, secondLatLng], {
      color: 'red'
    }).bindTooltip(map.distance(firstLatLng, secondLatLng).toFixed(2) + "m", {
      permanent: true,  // Hace que la etiqueta siempre sea visible
      direction: 'top', // La etiqueta se posicionará arriba de la polilínea
    });
    pl.addTo(map);
    pinMarkers.push(pl);
  } else {
    firstLatLng = e.latlng;
    //L.marker(firstLatLng).addTo(map).bindPopup('Point A<br/>' + e.latlng).openPopup();
    drawPin(firstLatLng, "Punto A");
    secondClick = true;
  }
}

function toggleVisibilidad() {
  var elementos = document.querySelectorAll(".AtoN");
  var btn = document.getElementById("btn-toogle-ver");
  var icono = btn.querySelector("i");
  // Alternar la visibilidad entre las clases activada y desactivada
  elementos.forEach(function (elemento) {
    if (elemento.classList.contains("activada")) {
      btn.innerHTML = "Ver desactivadas";
      elemento.classList.remove("activada");
      elemento.classList.add("desactivada");

    } else {
      btn.innerHTML = "Ver activadas";
      elemento.classList.remove("desactivada");
      elemento.classList.add("activada");
    }
  });
  // Cambiar el texto y el ícono del botón
  if (icono.classList.contains("fa-eye")) {
    icono.classList.remove("fa-eye");
    icono.classList.add("fa-eye-slash");
    btn.innerHTML = 'Ver Activadas <i class="fa fa-eye-slash" aria-hidden="true"></i>';
  } else {
    icono.classList.remove("fa-eye-slash");
    icono.classList.add("fa-eye");
    btn.innerHTML = 'Ver Desactivadas <i class="fa fa-eye" aria-hidden="true"></i>';
  }
}

function toggleVisibilidadInfo() {
  var elementos = document.querySelectorAll(".infoAtoN");
  var btn = document.getElementById("btn-toogle-ver-info");
  var icono = btn.querySelector("i");
  // Alternar la visibilidad entre las clases activada y desactivada
  elementos.forEach(function (elemento) {
    if (elemento.classList.contains("info-activada")) {
      btn.innerHTML = "Ocultar info";
      elemento.classList.remove("info-activada");
      elemento.classList.add("info-desactivada");

    } else {
      btn.innerHTML = "Ver info";
      elemento.classList.remove("info-desactivada");
      elemento.classList.add("info-activada");
    }
  });
  // Cambiar el texto y el ícono del botón
  if (icono.classList.contains("fa-eye")) {
    icono.classList.remove("fa-eye");
    icono.classList.add("fa-eye-slash");
    btn.innerHTML = 'Ocultar Info <i class="fa fa-eye-slash" aria-hidden="true"></i>';
  } else {
    icono.classList.remove("fa-eye-slash");
    icono.classList.add("fa-eye");
    btn.innerHTML = 'Ver Info <i class="fa fa-eye" aria-hidden="true"></i>';
  }
}

function actualizarCoordenadaWGS2DEC() {
  var latWGS = document.getElementById("latmarkerWGS").value;
  var lngWGS = document.getElementById("lngmarkerWGS").value;
  var lat = document.getElementById("latmarker");
  var lng = document.getElementById("lngmarker");
  var punto = setMarkerLatLng(latWGS, lngWGS);

  lat.value = punto.lat;
  lng.value = punto.lng;

}

function actualizarCoordenadaDEC2WGS() {
  var latWGS = document.getElementById("latmarkerWGS");
  var lngWGS = document.getElementById("lngmarkerWGS");
  var lat = document.getElementById("latmarker").value;
  var lng = document.getElementById("lngmarker").value;
  var punto = getMarkerLatLng({ lat, lng });

  latWGS.value = punto.lat;
  lngWGS.value = punto.lng;

}

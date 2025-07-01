// Inicialización de Leaflet
let posicionInicial = { lat: 1, lng: 1 };
let map;
let pinMarkers = [];
let markers = [];
const popup = L.popup();

const centerLatLng = centrar();

fetchData()?.then((balizas) => {
  inicializarMapa(centerLatLng);
  agregarBalizasAlMapa(balizas);
  map.on('click', onMapDistance);
}).catch((error) => {
  console.error("Error al obtener balizas:", error);
});

function inicializarMapa(coordenadas) {
  map = L.map('myMap').setView(coordenadas, presetZoom);
  L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 17,
  }).addTo(map);

  L.control.scale({ imperial: true, metric: true }).addTo(map);

  const marcadorDarsena = new L.marker([39.435, -0.29], { opacity: 0.01 });
  marcadorDarsena.bindTooltip("Dársena Norte", {
    permanent: true,
    className: "my-label",
    offset: [0, 0]
  });
  marcadorDarsena.addTo(map);
}

function agregarBalizasAlMapa(balizas) {
  balizas.forEach(item => {
    const customIcon = {
      iconUrl: `${myurl}/img/icon/${getTipo(item)}.png`,
      iconSize: [15, 30],
      ...(item.apagada && { className: "apagada" })
    };

    const marker = L.marker(setMarkerLatLng(item.latitud, item.longitud), {
      title: item.tipo,
      draggable: true,
      icon: L.icon(customIcon)
    });

    marker.on('dragstart', (event) => {
      posicionInicial = event.target.getLatLng();
    });

    marker.on('dragend', (event) => {
      const nuevoLugar = event.target.getLatLng();
      mostrarPopupConfirmacion(marker, item, nuevoLugar);
    });

    const ruta = item.pictureUrl.length > 0
      ? `/img/imagenes/${item.nif}/${item.pictureUrl[0]}`
      : "/img/icon/buoyIcon.jpg";

    marker.bindTooltip(
      `<div>
        <div>NIF: <p>${item.nif}</p> Apariencia: ${item.apariencia}</div>
        <img class="avatar avatar-s" src="${ruta}" />
      </div>`,
      { opacity: 0.7, direction: 'top' }
    );

    marker.bindPopup(
      `<div>
        <p>NIF: <a href="/aton/plantilla/${item.nif}">${item.nif}</a></p>
        <p>Apariencia: ${item.apariencia}</p>
        <img class="avatar avatar-s" src="${ruta}"/>
      </div>`
    );

    marker.addTo(map);
    markers.push(marker);
  });
}

function mostrarPopupConfirmacion(marker, item, position) {
  const textposition = getMarkerLatLng(position);

  const popupHtml = `
    <div class="card-body">
      <h4>¿Desplazar señal aquí?</h4>
      <form action="/aton/editLocalizacionFromMap/${item.nif}" method="POST">
        <input type="hidden" name="nif" value="${item.nif}" />
        <div class="form-group mb-2">
          <label for="latitud">LATITUD</label>
          <input type="text" class="form-control" name="latitud" value="${textposition.lat}" />
        </div>
        <div class="form-group mb-2">
          <label for="longitud">LONGITUD</label>
          <input type="text" class="form-control" name="longitud" value="${textposition.lng}" />
        </div>
        <input type="hidden" name="lat" value="${position.lat}" />
        <input type="hidden" name="lng" value="${position.lng}" />
        <div class="form-group mb-2 text-center">
          <button class="btn btn-success btn-block">SI</button>
        </div>
      </form>
      <div class="form-group mb-2 text-center">
        <button 
          onclick="moverMarcador(this, ${posicionInicial})" 
          class="btn btn-danger btn-block" 
          data-marker="${marker._leaflet_id}">
          NO
        </button>
      </div>
    </div>
  `;

  popup.setLatLng(position).setContent(popupHtml).openOn(map);
}
// Función para mover el marcador y la vista al hacer clic en "NO"
function moverMarcador(button, posicionInicial) {
  const markerId = button.getAttribute('data-marker');  // Obtener el id del marcador
  const marker = map._layers[markerId];  // Recuperar el marcador por su id
  
  if (marker) {
    marker.setLatLng(posicionInicial);  // Mover el marcador a la posición inicial
    map.setView(posicionInicial);  // Centrar el mapa en la posición inicial
  }

  // Cerrar el popup
  document.getElementsByClassName('leaflet-popup-close-button')[0].click();
}

// Funciones auxiliares para pins

function drawPin(latlng, title) {
  const marker = new L.Marker(latlng, {
    title,
    draggable: true
  });

  marker.on('dragend', function (event) {
    const pos = event.target.getLatLng();
    document.getElementById("latmarker").value = pos.lat;
    document.getElementById("lngmarker").value = pos.lng;
    map.panTo(pos);
  });

  marker.addTo(map);
  pinMarkers.push(marker);
  map.panTo(latlng);
}

function drawThisPin() {
  const lat = parseFloat(document.getElementById("latmarker").value);
  const lng = parseFloat(document.getElementById("lngmarker").value);
  drawPin({ lat, lng }, "Un Pin");
}

function clearAll() {
  pinMarkers.forEach(m => map.removeLayer(m));
  pinMarkers = [];
}

function clearLast() {
  const last = pinMarkers.pop();
  if (last) map.removeLayer(last);
}

// Distancia

let firstLatLng, secondLatLng, secondClick = false;

function onMapDistance(e) {
  if (secondClick) {
    secondLatLng = e.latlng;
    drawPin(secondLatLng, "Punto B");
    const linea = L.polyline([firstLatLng, secondLatLng], { color: 'red' }).addTo(map);
    pinMarkers.push(linea);
    medirDistancia();
    secondClick = false;
  } else {
    firstLatLng = e.latlng;
    drawPin(firstLatLng, "Punto A");
    secondClick = true;
  }
}

function medirDistancia() {
  const distance = map.distance(firstLatLng, secondLatLng);
  document.getElementById('distance').innerText = distance.toFixed(2);
}

// Conversión de coordenadas

function actualizarCoordenadaWGS2DEC() {
  const punto = setMarkerLatLng(
    document.getElementById("latmarkerWGS").value,
    document.getElementById("lngmarkerWGS").value
  );
  document.getElementById("latmarker").value = punto.lat;
  document.getElementById("lngmarker").value = punto.lng;
}

function actualizarCoordenadaDEC2WGS() {
  const punto = getMarkerLatLng({
    lat: document.getElementById("latmarker").value,
    lng: document.getElementById("lngmarker").value
  });
  document.getElementById("latmarkerWGS").value = punto.lat;
  document.getElementById("lngmarkerWGS").value = punto.lng;
}

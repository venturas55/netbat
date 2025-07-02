let centerLatLng = centrar();
//console.log(centerLatLng);


//FUNCION PARA INICIAR EL MAPA DE GOOGLE
function initMapa(balizas) {
    //console.log(balizas);
    map = new google.maps.Map(document.getElementById("myMap"), {
        zoom: presetZoom,
        center: centerLatLng,
        mapId: "MAP_GOOGLE"
    });
    const markers = Promise.all(balizas.map(async item => {
        const marker = new google.maps.Marker({
            map: map,
            position: setMarkerLatLng(item.latitud, item.longitud),
            draggable: true,
            label: {
                text: item.nif.toString(),
                className: 'etiquetaGoogle'
            },
            title: item.tipo,
            icon: {
                url: myurl + '/img/icon/' + getTipo(item) + '.png',
                scaledSize: new google.maps.Size(item.tipo === 'TC' ? 20 : 16, item.tipo === 'TC' ? 20 : 30),
                anchor: new google.maps.Point(item.tipo === 'TC' ? 10 : 8, item.tipo === 'TC' ? 50 : 30),
                className: item.apagada ? 'AtoN desactivada' : 'AtoN activada'
            },

        });

        const tooltip = new google.maps.InfoWindow({
            content: `
          <div class="bind-tooltip">
            <p><strong>NIF: ${item.nif}</strong></p>
            <p>Apariencia: ${item.apariencia}</p>
            <p>${item.latitud}, ${item.longitud}</p>
            <img class="avatar avatar-s" src="${item.pictureUrl.length > 0
                    ? `/img/imagenes/${item.nif}/${item.pictureUrl[0]}`
                    : "/img/icon/buoyIcon.jpg"
                }"/>
          </div>`
        });

        marker.addListener('mouseover', () => tooltip.open(map, marker));
        marker.addListener('mouseout', () => tooltip.close());

        let startPos;
        marker.addListener('dragstart', () => startPos = marker.getPosition());

        marker.addListener('dragend', e => {
            const newPos = marker.getPosition();
            map.panTo(newPos);
            const textPos = getMarkerLatLng({"lat":newPos.lat(), "lng":newPos.lng()});
            const textPosString = textPos.toString();

            const infoWindow = new google.maps.InfoWindow({
                content: `
          <div class="card-body">
            <h4>¿Desplazar señal aquí?</h4>
            <form action="/aton/editLocalizacionFromMap/${item.nif}" method="POST">
              <input type="hidden" name="nif" value="${item.nif}">
              <div class="form-group mb-2"><label>LATITUD<input class="form-control" name="latitud" value="${textPos.lat}"></label></div>
              <div class="form-group mb-2"><label>LONGITUD<input class="form-control" name="longitud" value="${textPos.lng}"></label></div>
              <input type="hidden" name="lat" value="${textPos.lat}">
              <input type="hidden" name="lng" value="${textPos.lng}">
              <div class="text-center">
                <button class="btn btn-success btn-sm">SI</button>
                <button type="button" id="cancelarMovimiento" class="btn btn-danger btn-sm">NO</button>
              </div>
            </form>
          </div>`
            });
            infoWindow.open(map, marker);

            google.maps.event.addListenerOnce(infoWindow, 'domready', () => {
                document.getElementById('cancelarMovimiento').onclick = () => {
                    marker.setPosition(startPos);
                    map.panTo(startPos);
                    infoWindow.close();
                };
            });
        });

        marker.addListener('click', () => {
            window.location.href = `/aton/plantilla/${item.nif}`;
        });

        marker.addListener('rightclick', e => {
            const content = `
          <div class="bind-tooltip">
            <div class="d-flex align-items-center gap-2">
              <strong>NIF: ${item.nif}</strong>
              <img class="avatar avatar-s" src="${item.pictureUrl.length > 0
                    ? `/img/imagenes/${item.nif}/${item.pictureUrl[0]}`
                    : "/img/icon/buoyIcon.jpg"
                }"/>
            </div>
            <div class="mt-2 d-grid gap-2">
              <button class="btn btn-primary btn-sm" onclick="window.location.href='/aton/plantilla/${item.nif}'">Ver</button>
              <button class="btn btn-success btn-sm" onclick="window.location.href='/aton/pintura/${item.nif}/map'">Necesita Pintado</button>
              <button class="btn btn-danger btn-sm" onclick="window.location.href='/aton/toggleapagado/${item.nif}'">Apagar/Activar</button>
              <button class="btn btn-warning btn-sm" onclick="window.location.href='/mantenimientopreventivo/add/${item.nif}'">Preventivo</button>
            </div>
          </div>`;
            const ctxInfo = new google.maps.InfoWindow({ content });
            ctxInfo.setPosition(e.latLng);
            ctxInfo.open(map);
        });
        return await marker;
    }));
}




fetchData().then((res) => { initMapa(res) });

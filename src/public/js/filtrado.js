
  document.addEventListener('DOMContentLoaded', function () {
    const inputBusqueda = document.getElementById("myInput");
    const suma = document.getElementById("suma");

    // Función para filtrar y contar filas
    function filtrarYContar() {
      const value = inputBusqueda.value.toLowerCase();
      const filas = document.querySelectorAll(".listado .fila");
      let visibleCount = 0;

      filas.forEach(fila => {
        // Verificamos si la fila contiene el texto buscado
        const coincide = fila.textContent.toLowerCase().includes(value);
        
        // Mostrar/ocultar según el texto y si está apagada
        fila.style.display = coincide ? "" : "none";

        // Contamos las filas visibles
        if (fila.style.display !== "none") {
          visibleCount++;
        }
      });

      // Actualizamos el contador
      if (suma) {
        suma.textContent = visibleCount;
      }
    }

    // Asociar la función al evento 'keyup' del input
    if (inputBusqueda) {
      inputBusqueda.addEventListener("keyup", filtrarYContar);
    }

    // Ejecutamos la función de filtrado y conteo cuando la página cargue
    filtrarYContar();
  });
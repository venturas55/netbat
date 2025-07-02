//Este documento en js realiza la simulación de la luz, leyendo la caracteristica de la base de datos.
//====================================================================================================//




//EJECUCIÓN DEL CODIGO
//defino color
defineColor();
//defino cambios de estado en el tiempo
let destellosAcum = defineCambiosEstado();
//ejecuto la primera vez para mostrar la simulacion de la luz porque inicialmente se encuentra oculto.
secuencia();

//Y ejecuto los siguientes cambios de estado.
setInterval(() => {
    secuencia()
}, destellosAcum[destellosAcum.length - 1] * 1150)

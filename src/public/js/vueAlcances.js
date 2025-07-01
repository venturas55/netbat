var app = new Vue({
    el: "#alcances",
    data: {
      alcance: 2.3,
      visibilidad: 8.172,
      tipo: "Nocturna",
      fondo: "Poca",
      umbral1: null,
      destello: "0.5",
      coef1: "0.7",
      coef2: "1",
      coef3: "1",
      azul: "no",
    },
    mounted: function () {
      this.calcularAlcance();
    },
    filters: {
      redondeo2: function (value) {
        if (value != null) return value.toFixed(2);
      },
      redondeo6: function (value) {
        if (value != null) return value.toFixed(6);
      },
    },
    methods: {
      calcularAlcance: function () {
        this.coef1 = parseFloat(this.coef1);
        this.coef2 = parseFloat(this.coef2);
        this.coef3 = parseFloat(this.coef3);
        this.visibilidad = parseFloat(this.visibilidad);
        if (this.tipo == 3) a = 0.2;
        else a = 0.1;

        if (isNaN(this.alcance)) alert("calcularAlcance no es un numero");
        else this.alcance = parseFloat(this.alcance);

        if (isNaN(this.destello)) alert("introduzca como destello un numero");
        else this.destello = parseFloat(this.destello);

        switch (this.tipo) {
          case "Nocturna":
            switch (this.fondo) {
              case "Ninguna":
                this.umbral1 = 0.0000002;
                break;
              case "Poca":
                this.umbral1 = 0.000002;
                break;
              case "Considerable":
                this.umbral1 = 0.00002;
                break;
            }
            break;

          case "Diurna":
            this.umbral1 = 0.001;
            break;

          case "Enfilacion":
            switch (this.visibilidad) {
              case 6.246:
                this.visibilidad = 3.888;
                break;
              case 7.469:
                this.visibilidad = 5.22;
                break;
              case 6.839:
                this.visibilidad = 4.68;
                break;
              case 5.76:
                this.visibilidad = 3.78;
                break;
              case 8.172:
                this.visibilidad = 5.775;
                break;
              case 11.699:
                this.visibilidad = 8.549;
              case 10:
                this.visibilidad = 7.4; //TODO:
                break;

            }

            switch (this.fondo) {
              case "Ninguna":
                this.umbral1 = 0.000001;

                break;
              case "Poca":
                this.umbral1 = 0.00001;
                break;
              case "Considerable":
                this.umbral1 = 0.0001;
                break;
            }
            break;
        }
      },
    },
    computed: {
      transmisividad:function (){
        let valor=Math.pow(0.05,(1/this.visibilidad));
        console.log(valor);
        return  valor;
      },
      umbral: function () {
        switch (this.tipo) {
          case "Nocturna":
            switch (this.fondo) {
              case "Ninguna":
                return 0.0000002;
                break;
              case "Poca":
                return 0.000002;
                break;
              case "Considerable":
                return 0.00002;
                break;
            }
            break;

          case "Diurna":
            return 0.001;
            break;

          case "Enfilacion":
            switch (this.fondo) {
              case "Ninguna":
                return 0.000001;

                break;
              case "Poca":
                return 0.00001;
                break;
              case "Considerable":
                return 0.0001;
                break;
            }
            break;
        }
      },
      a: function () {
        if (this.azul == "si" && this.tipo == "Enfilacion") return 0.2;
        else return 0.1;
      },
      Icalculo: function () {
        return (
          3430000 *
          this.alcance *
          this.alcance *
          this.umbral *
          Math.pow(0.05, (-1 * this.alcance) / this.visibilidad)
        ).toFixed(1);
      },
      Ieficaz: function () {
        return (this.Icalculo / this.coef1 / this.coef2 / this.coef3).toFixed(1);
      },
      Iestacionaria: function () {
        return (
          (this.Ieficaz * (parseFloat(this.destello) + this.a)) /
          this.destello
        ).toFixed(1);
      },
    },
  });

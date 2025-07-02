  var app2 = new Vue({
    el: "#coordenadas",
    data: {
      decimal1: "39.65525",
      wgs2: "39º 55.345", //GGº MM.mmm'
      wgs3: "39º 52' 25\" N", //GG° MM' SS.sss&quot; N"
      decimal11: null,
      error1: "no error",
      error2: null,
      error3: null,
      bul: false,
      caracteristica: "",
      destellos: "",
      destellosAcum: "",
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
      dormir: function (milliseconds) {
        var start = new Date().getTime();
        for (var i = 0; i < 1e7; i++) {
          if (new Date().getTime() - start > milliseconds) {
            break;
          }
        }
      },
    },
    computed: {
      resultado1: function () {
        this.bul = "false";
        this.error1 = "";
        this.decimal11 = parseFloat(this.decimal1);
        if (isNaN(this.decimal1)) {
          this.error1 = "Introduzca grados en formato decimal GG.gggg";
          this.bul = "true";
        } else {
          var decarray = this.decimal1.split(".");
          if (decarray.length == 2)
            var decimales = parseFloat("0." + decarray[1]) * 60;
          else this.error1 = "Introduzca gradosen formato decimal GG.gggg";
        }
        return decarray[0] + "º " + decimales.toFixed(3) + "'";
      },
      resultado2: function () {
        this.error2 = "";
        var utmarray = this.wgs2.split(" ");

        var gradosar = utmarray[0].split("º");
        var minsar = utmarray[1].split(".");
        var milar = minsar[1].split("'");
        if (isNaN(gradosar[0]) || isNaN(minsar[0]) || isNaN(milar[0]))
          this.error2 = "Introduzca grados y minutos GGº MM.mmm";
        else {
          var grad = parseFloat(gradosar[0]);
          var min = parseFloat(minsar[0]);
          var mil = parseFloat(milar[0]);
        }

        var decimal = grad + (min + mil / 1000) / 60;

        return decimal.toFixed(6);
      },
      resultado3: function () {
        this.error3 = "";
        var utm = this.wgs3;
        var utmarray = utm.split(/\º|\'|\"|\°/g);

        if (isNaN(utmarray[0]) || isNaN(utmarray[1]) || isNaN(utmarray[2]))
          this.error3 = "Introduzca grados minutos y segundos GGº MM' ss\"";
        else {
          var grados = parseFloat(utmarray[0]);
          var min = parseFloat(utmarray[1]);
          var seg = parseFloat(utmarray[2]);
        }
        var minf = min + seg / 60;
        minf = minf.toFixed(3);
        var decimal = grados + "º " + minf + "'";

        return decimal;
      },
    },
    mounted: function () { },
  });

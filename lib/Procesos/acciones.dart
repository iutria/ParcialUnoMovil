import 'package:flutter/material.dart';

getFecha(DateTime fecha) {
  return (fecha.year.toString() +
      "-" +
      fecha.month.toString() +
      "-" +
      fecha.day.toString());
}

getColorPrimario() {
  // Color colorPrimario = Color(0xFF025955);
  Color colorPrimario = Color(0xFF151F21);
  return colorPrimario;
}

getPrimeraMayuscula(var texto) {
  var primera = texto.toString().substring(0, 1).toUpperCase();
  var posteriores =
      texto.toString().substring(1, texto.toString().length).toLowerCase();
  return primera + posteriores;
}

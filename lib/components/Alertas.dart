import 'package:flutter/material.dart';

Future<dynamic> Alertas(BuildContext context, String mensaje) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Alerta'),
            content: Text('$mensaje'),
          ));
}

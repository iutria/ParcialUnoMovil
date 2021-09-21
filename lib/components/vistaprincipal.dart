import 'package:apk_parcial/components/login.dart';
import 'package:apk_parcial/components/rutas.dart';
import 'package:flutter/material.dart';

class vistaprincipal extends StatefulWidget {
  static String id = "login";
  @override
  _vistaprincipalState createState() => _vistaprincipalState();
}

class _vistaprincipalState extends State<vistaprincipal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logomastexto.png",
              height: 200.0,
            ),
            SizedBox(height: 80),
            Rutas(texto: 'Iniciar', ruta: (context) => login()),
          ],
        ),
      ),
    ));
  }
}

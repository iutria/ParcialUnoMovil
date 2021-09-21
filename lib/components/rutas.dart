import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rutas extends StatelessWidget {
  final texto;
  final ruta;

  Rutas({this.texto, this.ruta});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: ruta,
            ));
      },
      child: Text(
        this.texto,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 90.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0xFF151F21),
          elevation: 10.0),
    );
  }
}

import 'package:flutter/material.dart';

class Entradas extends StatelessWidget {
  TextEditingController controler;
  var texto;
  Entradas({required this.controler, this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35.0),
      child: TextField(
        controller: controler,
        decoration: InputDecoration(
            fillColor: Colors.transparent,
            labelText: texto,
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                controler.clear();
              },
            )),
      ),
    );
  }
}

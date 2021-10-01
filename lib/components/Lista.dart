import 'package:apk_parcial/Procesos/acciones.dart';
import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  var id;
  var foto;
  var nombre;
  var apellido;
  var profesion;
  var fechaNacimiento;
  var edad;

  Lista(
      {this.id,
      this.foto,
      this.nombre,
      this.apellido,
      this.profesion,
      this.fechaNacimiento,
      this.edad});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: <Widget>[
              Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFE6E6E6)),
              ),
              Positioned.fill(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(this.foto.toString()),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            this.nombre + " " + this.apellido,
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF151F21),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(this.profesion)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(getFecha(this.fechaNacimiento)),
                          Text(this.edad)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]))
      ],
    );
  }
}

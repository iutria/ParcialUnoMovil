import 'package:apk_parcial/Procesos/personas.dart';
import 'package:apk_parcial/components/Agregar_Editar.dart';
import 'package:flutter/material.dart';

class Visualizar extends StatefulWidget {
  var accion;
  var persona;
  Visualizar(this.persona);
  //Visualizar({this.titulo, this.num});

  @override
  _VisualizarState createState() => _VisualizarState();
}

class _VisualizarState extends State<Visualizar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  "assets/logoblanco.png",
                  height: 15.0,
                ),
              ),
              Text(
                " " + widget.persona.nombre + " " + widget.persona.apellido,
              )
            ],
          ),
          backgroundColor: Color(0xFF151F21),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              imagen(),
              SizedBox(height: 10),
              Propiedades(widget.persona.nombre + " " + widget.persona.apellido,
                  "Nombre"),
              Propiedades(widget.persona.profesion, "Profesion"),
              Propiedades(
                  widget.persona.fechaNacimiento, "Fecha de nacimiento"),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Agregar_Editar(2, widget.persona,
                          0), //Llamar la Vista TextoEjercicio
                    ),
                  ).then((resultado) //Espera por un Resultado
                      {
                    _retornar(1, resultado);
                  });
                },
                child: Text(
                  "Editar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 90.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0xFF151F21),
                    elevation: 10.0),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  _retornar(2, widget.persona);
                },
                child: Text(
                  "Eliminar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0xFFC0392B),
                    elevation: 10.0),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  _retornar(3, widget.persona);
                },
                child: Text(
                  "Cancelar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0xFF7F8C8D),
                    elevation: 10.0),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Column Propiedades(String titulo, String subtitulo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(subtitulo),
      ],
    );
  }

  Flexible imagen() {
    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(75),
        child: Image.network(
          widget.persona.foto,
          fit: BoxFit.cover,
          height: 150,
          width: 150,
        ),
      ),
    );
  }

  void _retornar(int accion, Persona persona) {
    var respuesta = {'accion': accion, 'persona': persona};
    Navigator.pop(context, respuesta);
  }
}

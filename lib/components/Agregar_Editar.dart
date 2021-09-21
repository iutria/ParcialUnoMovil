//Crud usando Clases, navegacion, Parametros entre ventanas

import 'package:apk_parcial/Procesos/personas.dart';
import 'package:apk_parcial/components/Alertas.dart';
import 'package:flutter/material.dart';

class Agregar_Editar extends StatefulWidget {
  // final titulo;
  // final num;
  var accion;
  var persona;
  var id;
  Agregar_Editar(this.accion, this.persona, this.id);
  //Agregar_Editar({this.titulo, this.num});

  @override
  _Agregar_EditarState createState() => _Agregar_EditarState();
}

class _Agregar_EditarState extends State<Agregar_Editar> {
  late TextEditingController _nombre;
  late TextEditingController _apellido;
  late TextEditingController _profesion;
  late TextEditingController _foto;
  late TextEditingController _fechaNacimiento;
  var titulo;

  @override
  void initState() {
    _nombre = TextEditingController();
    _apellido = TextEditingController();
    _profesion = TextEditingController();
    _foto = TextEditingController();
    _fechaNacimiento = TextEditingController();

    titulo = widget.accion == 1 ? "Agregar" : "Editar";

    if (widget.accion == 2) {
      _nombre.text = widget.persona.nombre;
      _apellido.text = widget.persona.apellido;
      _profesion.text = widget.persona.profesion;
      _foto.text = widget.persona.foto;
      _fechaNacimiento.text = widget.persona.fechaNacimiento;
    }

    super.initState();
  }

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
                "  " + (titulo),
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35.0),
                child: TextField(
                  controller: _foto,
                  decoration: InputDecoration(
                      //filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Foto',
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          _foto.clear();
                        },
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35.0),
                child: TextField(
                  controller: _nombre,
                  decoration: InputDecoration(
                      //filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Nombre',
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          _nombre.clear();
                        },
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35.0),
                child: TextField(
                  controller: _apellido,
                  decoration: InputDecoration(
                      //filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Apellido',
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          _apellido.clear();
                        },
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35.0),
                child: TextField(
                  controller: _profesion,
                  decoration: InputDecoration(
                      //filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Profesion',
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          _nombre.clear();
                        },
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35.0),
                child: TextField(
                  controller: _fechaNacimiento,
                  decoration: InputDecoration(
                      //filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Fecha de Nacimiento',
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          _fechaNacimiento.clear();
                        },
                      )),
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  _retornar();
                },
                child: Text(
                  titulo,
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
            ],
          ),
        ),
      ),
    );
  }

  Flexible imagen() {
    if (widget.accion == 1) {
      return Flexible(
        child: Image.asset(
          "assets/perfil.png",
          height: 150.0,
        ),
      );
    } else {
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
  }

  void _retornar() {
    if (_nombre.text.isNotEmpty &&
        _apellido.text.isNotEmpty &&
        _foto.text.isNotEmpty &&
        _fechaNacimiento.text.isNotEmpty &&
        _profesion.text.isNotEmpty) {
      var id;
      id = widget.accion == 1 ? widget.id : widget.persona.id;
      Persona persona = Persona(
          id: id,
          nombre: _nombre.text,
          apellido: _apellido.text,
          foto: _foto.text,
          profesion: _profesion.text,
          fechaNacimiento: _fechaNacimiento.text);
      // Devuelvo los datos de la lista _clientesadd

      Navigator.pop(context, persona);
    } else {
      Alertas(context, "Debe completar todos los campos!");
    }
  }
}

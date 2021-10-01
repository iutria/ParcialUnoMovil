//Crud usando Clases, navegacion, Parametros entre ventanas

import 'package:apk_parcial/Procesos/acciones.dart';
import 'package:apk_parcial/Procesos/personas.dart';
import 'package:apk_parcial/components/Alertas.dart';
import 'package:apk_parcial/components/Entradas.dart';
import 'package:flutter/material.dart';

class Agregar_Editar extends StatefulWidget {
  var accion;
  var persona;
  var id;
  Agregar_Editar(this.accion, this.persona, this.id);

  @override
  _Agregar_EditarState createState() => _Agregar_EditarState();
}

class _Agregar_EditarState extends State<Agregar_Editar> {
  late TextEditingController _nombre;
  late TextEditingController _ciudad;
  late TextEditingController _apellido;
  late TextEditingController _profesion;
  late TextEditingController _foto;
  late TextEditingController _fechaNacimiento;
  var _dato = DateTime.now();
  var titulo;
  late DateTime _fecha;

  @override
  void initState() {
    _nombre = TextEditingController();
    _apellido = TextEditingController();
    _profesion = TextEditingController();
    _foto = TextEditingController();
    _fechaNacimiento = TextEditingController();
    _ciudad = TextEditingController();

    titulo = widget.accion == 1 ? "Agregar" : "Editar";

    if (widget.accion == 2) {
      _nombre.text = widget.persona.nombre;
      _apellido.text = widget.persona.apellido;
      _profesion.text = widget.persona.profesion;
      _foto.text = widget.persona.foto;
      _fechaNacimiento.text =
          getFecha(widget.persona.fechaNacimiento).toString();
      _fecha = widget.persona.fechaNacimiento;
      _dato = widget.persona.fechaNacimiento;
    }

    // _fechaNacimiento.dispose();

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
              Entradas(controler: _foto, texto: "Foto"),
              Entradas(controler: _ciudad, texto: "ciudad"),
              Entradas(controler: _nombre, texto: "Nombre"),
              Entradas(controler: _apellido, texto: "Apellido"),
              Entradas(controler: _profesion, texto: "Profesion"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35.0),
                child: TextField(
                  controller: _fechaNacimiento,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      labelText: 'Fecha de Nacimiento',
                      suffix: GestureDetector(
                        child: Icon(Icons.calendar_today),
                        onTap: () {
                          //_fechaNacimiento.clear();
                          showDatePicker(
                                  context: context,
                                  initialDate: _dato,
                                  firstDate: DateTime(1980),
                                  lastDate: DateTime.now())
                              .then((date) {
                            if (date != null) {
                              _fecha = date;
                              _fechaNacimiento.text = getFecha(_fecha);
                            }
                          });
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
                    padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: widget.accion == 2 ? 105.0 : 95.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: getColorPrimario(),
                    elevation: 10.0),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, null);
                },
                child: Text(
                  "Cancelar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 90.0),
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
        _profesion.text.isNotEmpty &&
        _fecha != null) {
      var id;
      id = widget.accion == 1 ? widget.id : widget.persona.id;
      Persona persona = Persona(
          id: id,
          nombre: getPrimeraMayuscula(_nombre.text),
          apellido: getPrimeraMayuscula(_apellido.text),
          foto: _foto.text,
          profesion: getPrimeraMayuscula(_profesion.text),
          fechaNacimiento: _fecha);

      Navigator.pop(context, persona);
    } else {
      Alertas(context, "Debe completar todos los campos!");
    }
  }
}

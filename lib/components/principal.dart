import 'package:apk_parcial/components/Agregar_Editar.dart';
import 'package:apk_parcial/components/Alertas.dart';
import 'package:apk_parcial/Procesos/personas.dart';
import 'package:apk_parcial/Procesos/validarUsuario.dart';
import 'package:apk_parcial/components/Visualizar.dart';
import 'package:flutter/material.dart';

import 'Lista.dart';

class principal extends StatefulWidget {
  principal({Key? key}) : super(key: key);
  static String id = "principal";
  @override
  _principalState createState() => _principalState();
}

class _principalState extends State<principal> {
  List _personas = Personas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "  LORO",
            )
          ],
        ),
        backgroundColor: Color(0xFF151F21),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Text(
              getUsuario(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {
                setState(() {
                  _opciones(context, _personas[index]);
                });
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Visualizar(
                        _personas[index]), //Llamar la Vista TextoEjercicio
                  ),
                ).then((resultado) //Espera por un Resultado
                    {
                  if (resultado['accion'] == 1) {
                    _editar(resultado["persona"]);
                  } else if (resultado['accion'] == 2) {
                    _personas.remove(resultado["persona"]);
                  }
                  //Adiciona a la lista lo que recupera de la vista TextoEjercicio
                  setState(() {});
                });
              },
              title: Lista(
                  id: _personas[index].id,
                  foto: _personas[index].foto,
                  nombre: _personas[index].nombre,
                  apellido: _personas[index].apellido,
                  profesion: _personas[index].profesion,
                  fechaNacimiento: _personas[index].fechaNacimiento,
                  edad: _personas[index].getEdad()),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Agregar_Editar(
                  1, null, _personas.length), //Llamar la Vista TextoEjercicio
            ),
          ).then((resultado) //Espera por un Resultado
              {
            _agregar(
                resultado); //Adiciona a la lista lo que recupera de la vista TextoEjercicio
            setState(() {});
          });
        },
        tooltip: 'Agregar',
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF151F21),
      ),
    );
  }

  _agregar(Persona index) {
    _personas.add(index);
  }

  _editar(Persona index) {
    for (var item in _personas) {
      if (item.id == index.id) {
        item.nombre = index.nombre;
        item.apellido = index.apellido;
        item.foto = index.foto;
        item.fechaNacimiento = index.fechaNacimiento;
        item.profesion = index.profesion;
      }
    }
  }

  _opciones(context, Persona index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Opciones'),
        content: Text('Elija una opcion'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                this._personas.remove(index);
              });
              Navigator.pop(context);
            },
            child: Text(
              'Eliminar',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Agregar_Editar(
                      2, index, 0), //Llamar la Vista TextoEjercicio
                ),
              ).then((resultado) //Espera por un Resultado
                  {
                _editar(resultado);
                setState(() {});
                Navigator.pop(context);
              });
            },
            child: Text(
              'Editar',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:apk_parcial/Procesos/acciones.dart';
import 'package:apk_parcial/components/Agregar_Editar.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          // backgroundColor: Color(0xFF151F21),
          backgroundColor: getColorPrimario(),
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
                hoverColor: Colors.transparent,
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
                    if (resultado != null) {
                      if (resultado['accion'] == 1) {
                        _editar(resultado["persona"]);
                      } else if (resultado['accion'] == 2) {
                        _eliminar(resultado["persona"]);
                      }
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
                    edad: _personas[index].getEdad().toString()),
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
              if (resultado == null) {
              } else {
                _agregar(resultado);
              }
              //Adiciona a la lista lo que recupera de la vista TextoEjercicio
              setState(() {});
            });
          },
          tooltip: 'Agregar',
          child: Icon(Icons.add),
          backgroundColor: getColorPrimario(),
        ),
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

  _eliminar(Persona index) {
    _confirmacionEliminar(context, index);
  }

  _opciones(context, Persona climsg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Opciones'),
        content: Text('Elija una opcion'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _eliminar(climsg);
            },
            child: Text(
              'Eliminar',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Agregar_Editar(2, climsg,
                      _personas.length), //Llamar la Vista TextoEjercicio
                ),
              ).then((resultado) //Espera por un Resultado
                  {
                if (resultado == null) {
                } else {
                  _editar(resultado);
                }
                //Adiciona a la lista lo que recupera de la vista TextoEjercicio
                setState(() {});
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

  _confirmacionEliminar(context, Persona index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Opciones'),
        content: Text('¿Seguro que desea eliminar?'),
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

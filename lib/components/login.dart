import 'package:apk_parcial/Procesos/acciones.dart';
import 'package:apk_parcial/components/Alertas.dart';
import 'package:apk_parcial/components/principal.dart';
import 'package:apk_parcial/Procesos/validarUsuario.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  late TextEditingController usuario;
  late TextEditingController clave;
  @override
  void initState() {
    usuario = TextEditingController();
    clave = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(hintColor: Color(0xFF121E23)),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  "assets/logo.png",
                  height: 150.0,
                ),
              ),
              SizedBox(height: 50),
              //usuario
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35.0),
                child: TextField(
                  controller: usuario,
                  decoration: InputDecoration(
                      hoverColor: Colors.transparent,
                      icon: Icon(Icons.person_sharp),
                      //filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Usuario',
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          usuario.clear();
                        },
                      )),
                ),
              ),
              //contraseña
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 35.0),
                child: TextField(
                  controller: clave,
                  obscureText: true,
                  decoration: InputDecoration(
                      hoverColor: Colors.transparent,
                      icon: Icon(Icons.lock),
                      // filled: true,
                      fillColor: Colors.transparent,
                      labelText: 'Contraseña',
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          clave.clear();
                        },
                      )),
                  onSubmitted: (String usu) {
                    _iniciar();
                  },
                ),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  _iniciar();
                },
                child: Text(
                  "Iniciar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 90.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: getColorPrimario(),
                    elevation: 10.0),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _iniciar() {
    if (usuario.text.isNotEmpty && clave.text.isNotEmpty) {
      if (!validarUsuario(usuario.text, clave.text))
        Alertas(context, "Usuario y/o contraseña invalidos");
      else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => principal(),
            ));
      }
    } else {
      Alertas(context, "Debe ingresar un usuario y una contraseña");
    }
  }
}

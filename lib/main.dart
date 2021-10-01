import 'package:apk_parcial/components/principal.dart';
import 'package:flutter/material.dart';

import 'components/vistaprincipal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LORO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(0xFF121E23),
      ),
      initialRoute: vistaprincipal.id,
      routes: {vistaprincipal.id: (context) => vistaprincipal()},
      // initialRoute: principal.id,
      // routes: {principal.id: (context) => principal()},
    );
  }
}

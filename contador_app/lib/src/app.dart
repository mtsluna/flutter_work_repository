import 'package:flutter/material.dart';
import 'package:prueba3/src/pages/contador_page.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    //Retorna los elementos graficos
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Center(
        child: new ContadorPage(),
      )
    );
  }

}
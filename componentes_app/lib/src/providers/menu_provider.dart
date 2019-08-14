import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

final menuProvider = new _MenuProvider();

class _MenuProvider{

  List<dynamic> opciones = [];

  _MenuProvider(){
    
  }

  Future<List<dynamic>> cargarData() async {

    final respuesta = await rootBundle.loadString("data/menu_opts.json");

    Map dataMap = json.decode(respuesta);
    opciones = dataMap["rutas"];

    return opciones;

  }

}
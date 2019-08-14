import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ["Matías Luna", "Franco Veloci", "Luciano Malagoli", "Adriel Bustos", "Santiago Reitano"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Componentes Temp"),        
      ),
      body: ListView(
        children: _listaCorta()
      ),
    );
  }

  List<Widget> _lista(){

    List<Widget> lista = new List<Widget>();

    for (var opcion in opciones) {
      
      lista.add(new ListTile(
        title: Text(opcion),
      ));
      lista.add(new Divider());

    }

    return lista;

  }

  List<Widget> _listaCorta(){

    return opciones.map((opcion){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opcion),
            subtitle: Text("Tecnico Universitario en Programación"),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.send),
            onTap: (){

              

            },
          ),
          Divider()
        ],
      );
    }).toList();

  }

}
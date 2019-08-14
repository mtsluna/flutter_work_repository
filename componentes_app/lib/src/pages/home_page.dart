import 'package:componentes_app/src/pages/alert_page.dart';
import 'package:componentes_app/src/providers/menu_provider.dart';
import 'package:componentes_app/src/utils/icono_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Componentes"),
        ),
        body: _lista(),
      ),
    );
  }

  Widget _lista() {

    //menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext con, AsyncSnapshot<List<dynamic>> snap){
        
        print( snap.data );

        return ListView(
          children: _crearLista(snap.data, con),
        );

      },
    );

  }

  List<Widget> _crearLista(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((item){
      
      final widgetTemp = ListTile(
        title: Text(item['texto']),
        leading: getIcon(item['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue
        ),
        onTap: (){
          
          Navigator.pushNamed(context, item['ruta']);

        },
      );

      opciones.add(widgetTemp); 

    });

    return opciones;

  }

}
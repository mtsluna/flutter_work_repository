import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget{

  @override
  createState() => _ContadorPageState();

}

class _ContadorPageState extends State<ContadorPage>{

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          "Contador"
        ),
      ),      
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Se pulso el botón:",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            new Text(
              "$contador",
              style: TextStyle(
                fontSize: 35
              ),
            )
          ],
        )
      ),
      floatingActionButton: _multiplesBotones()      
    );
  }

  Widget _multiplesBotones(){

    return new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new FloatingActionButton(
          onPressed: (){
            restar();
          },
          child: new Icon(
            Icons.remove
          ),
        ),
        new SizedBox(
          width: 5.0,
        ),
        new FloatingActionButton(
          onPressed: (){
            restaurar();
          },
          child: Icon(
            Icons.exposure_zero
          ),
        ),
        new SizedBox(
          width: 5.0,
        ),
        new FloatingActionButton(
          onPressed: (){
            sumar();
          },
          child: new Icon(
            Icons.add
          ),
        )
      ],
    );

  }

  sumar(){
    setState(() => contador++);
  }

  restar(){
    setState(() => contador--);
  }

  restaurar(){
    setState(() => contador = 0);
  }



}
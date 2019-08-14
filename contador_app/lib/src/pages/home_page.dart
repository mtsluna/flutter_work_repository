import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  final conteo = 10;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Contador"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
                "Número de clicks:",
                style: TextStyle(
                    fontSize: 20
                )
            ),
            new Text(
                "$conteo",
                style: TextStyle(
                  fontSize: 35
                )
            )
          ],
        )
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){



        },
        child: new Icon(Icons.add),

      ),
    );
  }

}
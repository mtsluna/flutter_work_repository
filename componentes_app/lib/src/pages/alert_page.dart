import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          title: Text("Soy una alerta"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("En verdad no soy una alerta sino que soy aquello que te da miedo al debugear"),
              Divider(),
              FlutterLogo(
                size: 100.0,
              )              
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: (){},
            ),
          ],
        );
      }
    );

  }

}
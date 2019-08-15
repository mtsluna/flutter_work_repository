import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButtonPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(context),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _title(),
                _createMenu()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context)
    );
  }

  Widget _title() {
    return SafeArea(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Mendoza Gobierno',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Gestión ciudadana',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              )
            )
              
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context){
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(
            color: Color.fromRGBO(116, 117, 152, 1.0)
          )
        )
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _createItem(Icons.calendar_today),
          _createItem(Icons.bubble_chart),
          _createItem(Icons.supervised_user_circle),
        ],
      ),
    );
  }  

  BottomNavigationBarItem _createItem(IconData icon){
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Container()
    );
  }

  Widget _fondoApp(BuildContext context) {

    final media = MediaQuery.of(context).size;

    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ],
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0)
        )
      ),
    );

    final pinkBox = Transform.rotate(
      angle: - pi / 5.0,
      child: Container(
        height: media.height * 0.4,
        width: media.width * 0.8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ],
            begin: FractionalOffset(0.0, 0.4),
          ),
          borderRadius: BorderRadius.circular(80.0)
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          child: pinkBox,
          top: -80.0,
        )
      ],
    );

  }
 
  Widget _createMenu() {
    return Table(
      children: [
        TableRow(
          children: <Widget>[
            _createButton(Icons.call, "Numeros útiles", Colors.red),
            _createButton(Icons.location_on, "Delegaciones", Colors.blue),            
          ]
        ),
        TableRow(
          children: <Widget>[
            _createButton(Icons.airplanemode_active, "Aeropuertos", Colors.green),
            _createButton(Icons.local_hospital, "Salud", Colors.pinkAccent),
          ]
        ),
        TableRow(
          children: <Widget>[
            _createButton(Icons.local_parking, "Estacionamientos", Colors.orange),
            _createButton(Icons.directions_transit, "Transporte publico", Colors.purple),
          ]
        ),
        TableRow(
          children: <Widget>[
            _createButton(Icons.help, "Ayuda al usuario", Colors.teal),
            _createButton(Icons.report, "Informar problemas", Colors.lime),
          ]
        )
      ],
    );
  }  

  Widget _createButton(IconData icon, String text, Color color) {
    return Container(
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 1.0,),
          CircleAvatar(
            backgroundColor: color,
            radius: 35.0,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: color
            ),
          ),
          SizedBox(height: 1.0,),
        ],
      ),
    );
  }

}
import 'dart:math';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  static final routeName = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createLogin(context)
    );
  }

  Stack _createLogin(BuildContext context){

    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        _createBackgroundGradient(context, size),        
        _createBackgroundDecoration(context, size),
        _createFormCard(size),
      ],
    );
  }

  Widget _createBackgroundGradient(BuildContext context, Size size){

    Orientation device = MediaQuery.of(context).orientation;
    double height = size.height * 0.40; 

    if(device.toString() == "Orientation.landscape"){
      height = size.height * 0.85;
    }

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0)
          ]
        )
      ),
    );
  }

  Widget _createBackgroundDecoration(BuildContext context, Size size){
    
    List<Widget> generateCircles(int cantidad){

      Random random = new Random();
      List<Widget> circles = [];

      for(int i = 0; i < cantidad; i++){
        
        final top = random.nextInt((size.height * 0.40).toInt()).toDouble();
        final left = random.nextInt(size.width.toInt()).toDouble();
        final circleDiameter = (random.nextInt(25).toDouble())/100;

        circles.add(
          Positioned(
            top: top,
            left: left,
            child: Container(
              width: size.width * circleDiameter,
              height: size.width * circleDiameter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: Color.fromRGBO(255, 255, 255, 0.05)
              ),
            ),
          )
        );
      }
      return circles;
    }

    return Stack(
      children: generateCircles(10)
    );

  }

  Widget _createFormCard(Size size){

    return Container(
      padding: EdgeInsets.only(top: 60.0),
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.person_pin_circle,
                color:Colors.white,
                size: size.width * 0.25,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              _createCard(size)
            ],
          ),
        ],
      )      
    );

  }

  Widget _createCard(Size size) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 10.0
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 1.0
                )
              ]
            ),
            child: Column(
              children: _inputFields()
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Olvido la contraseña?',
            style: TextStyle(
              color: Colors.deepPurple
            ),
          ),
          SizedBox(height: 40.0)
        ],
      ),
    );
  }

  List<Widget> _inputFields(){
    return <Widget>[
      Text(
        "Ingreso",
        style: TextStyle(
          fontSize: 20.0
        ),
      ),
      SizedBox(height: 40.0,),
      _createEmail(),
      SizedBox(height: 20.0,),
      _createPassword(),
      SizedBox(height: 20.0,),
      _createButton(),
      SizedBox(height: 20.0,),
    ];
  }

  Widget _createEmail(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.alternate_email,
            color: Colors.deepPurple,
          ),
          hintText: 'ejemplo@correo.com',
          labelText: 'E-Mail Address'
        ),
      ),
    );
  }

  Widget _createPassword(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock_outline,
            color: Colors.deepPurple,
          ),
          labelText: 'Password'
        ),
      ),
    );
  }

  Widget _createButton(){
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: (){

      },
    );
  }

}
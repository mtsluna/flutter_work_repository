import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_app/src/blocs/login_bloc.dart';
import 'package:login_app/src/blocs/provider.dart';
import 'package:login_app/src/pages/home_page.dart';
import 'package:login_app/src/pages/login_page.dart';
import 'package:login_app/src/providers/user_provider.dart';
import 'package:login_app/src/utils/utils.dart' as utils;

class RegisterPage extends StatelessWidget {

  static final routeName = "register";
  final userProvider = new UserProvider();

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
        _createFormCard(context, size),
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

  Widget _createFormCard(BuildContext context, Size size){

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
              _createCard(context, size)
            ],
          ),
        ],
      )      
    );

  }

  Widget _createCard(BuildContext context, Size size) {

    final bloc = Provider.of(context);

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
              children: _inputFields(bloc)
            ),
          ),
          SizedBox(height: 20.0),
          FlatButton(
            child: Text('You already have an account? Login'),
            onPressed: () => Navigator.pushReplacementNamed(context, LoginPage.routeName)
          ),
          SizedBox(height: 40.0)
        ],
      ),
    );
  }

  List<Widget> _inputFields(LoginBloc bloc){
    return <Widget>[
      Text(
        "Register",
        style: TextStyle(
          fontSize: 20.0
        ),
      ),
      SizedBox(height: 40.0,),
      _createEmail(bloc),
      SizedBox(height: 20.0,),
      _createPassword(bloc),
      SizedBox(height: 20.0,),
      _createButton(bloc),
      SizedBox(height: 20.0,),
    ];
  }

  Widget _createEmail(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.deepPurple,
              ),
              hintText: 'example@email.com',
              labelText: 'E-Mail Address',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _createPassword(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: Colors.deepPurple,
              ),
              labelText: 'Password',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _createButton(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Create new account'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _login(context, bloc) : null,
        );
      },
    );    
  }

  _login(BuildContext context, LoginBloc bloc) async {

    Map info = await userProvider.newUser(bloc.email, bloc.passw);
    String message = " ";

    if(info['ok']){
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
    else{

      if(info['message'] == 'EMAIL_EXISTS') { message = 'This mail already exists in the database of users'; }
      else { message = info['message']; }

      utils.mostrarAlerta(context, message);
      
    }
    //Navigator.pushReplacementNamed(context, HomePage.routeName);

  }

}
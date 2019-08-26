import 'package:flutter/material.dart';
import 'package:login_app/src/blocs/provider.dart';

class HomePage extends StatelessWidget {

  static final routeName = "home";  

  @override
  Widget build(BuildContext context) {

  final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home page')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Email: ${bloc.email}'),
          Divider(),
          Text('Passw: ${bloc.passw}')
        ],
      ),
    );
  }
}
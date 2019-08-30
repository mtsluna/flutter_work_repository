import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static final routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return createScaffold();
  }

  Scaffold createScaffold(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello world'),
        ),
      ),
    );
  }

}
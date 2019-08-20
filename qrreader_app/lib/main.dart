import 'package:flutter/material.dart';
import 'package:qrreader_app/src/pages/directions_page.dart';
import 'package:qrreader_app/src/pages/home_page.dart';
import 'package:qrreader_app/src/pages/map_launch.dart';
import 'package:qrreader_app/src/pages/map_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Reader',
      debugShowCheckedModeBanner: false,
      home: Container(),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mapLaunch': (BuildContext context)=> MapLaunch(),
        'direction': (BuildContext context) => DirectionsPage()
      },
      theme: ThemeData(
        primaryColor:  Colors.deepPurple
      ),
    );
  }
}
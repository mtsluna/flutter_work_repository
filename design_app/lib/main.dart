import 'package:design_app/pages/basic_page.dart';
import 'package:design_app/pages/button_page.dart';
import 'package:design_app/pages/scroll_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design',
      debugShowCheckedModeBanner: false,
      initialRoute: 'button',
      routes: {
        'basic': (BuildContext context) => BasicPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'button': (BuildContext context) => ButtonPage()
      },
    );
  }
}
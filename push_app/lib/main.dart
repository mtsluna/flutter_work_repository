import 'package:flutter/material.dart';
import 'package:push_app/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,      
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage()
      },
    );
  }
}
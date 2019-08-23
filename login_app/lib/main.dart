import 'package:flutter/material.dart';
import 'package:login_app/src/pages/home_page.dart';
import 'package:login_app/src/pages/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: {
        HomePage.routeName  : (BuildContext context) => HomePage(),
        LoginPage.routeName : (BuildContext context) => LoginPage()
      },
    );
  }
}
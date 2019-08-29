import 'package:flutter/material.dart';
import 'package:login_app/src/blocs/provider.dart';
import 'package:login_app/src/pages/home_page.dart';
import 'package:login_app/src/pages/login_page.dart';
import 'package:login_app/src/pages/product_page.dart';
import 'package:login_app/src/pages/register_page.dart';
import 'package:login_app/src/preferences/user_preferences.dart';



void main() async { 

  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());

}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    final pref = new UserPreferences();
    print(pref.token);

    return Provider(
      child: MaterialApp(
        title: 'Login App',
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.routeName,
        routes: {
          HomePage.routeName  : (BuildContext context) => HomePage(),
          LoginPage.routeName : (BuildContext context) => LoginPage(),
          ProductPage.routeName : (BuildContext context) => ProductPage(),
          RegisterPage.routeName : (BuildContext context) => RegisterPage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:preference_app/src/pages/home_page.dart';
import 'package:preference_app/src/pages/settings_page.dart';
import 'package:preference_app/src/share_prefs/user_preference.dart';
 
void main() async{ 

  final prefs = new UserPreference();
  await prefs.initPrefs();

  runApp(MyApp());

}
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final prefs = new UserPreference();

    return MaterialApp(
      title: 'Preferences',
      initialRoute: prefs.page,
      routes: {
        HomePage.routeName     : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
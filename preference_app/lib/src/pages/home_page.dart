import 'package:flutter/material.dart';
import 'package:preference_app/src/share_prefs/user_preference.dart';
import 'package:preference_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';
  final prefs = UserPreference();

  @override
  Widget build(BuildContext context) {

    prefs.page = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('User preferences'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary color: ${prefs.secondaryColor}'),
          Divider(),
          Text('Gender: ${prefs.gender}'),
          Divider(),
          Text('User name: ${prefs.name}'),
          Divider(),
        ],
      ),
    );
  }
  
}
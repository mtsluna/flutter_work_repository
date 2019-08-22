import 'package:flutter/material.dart';
import 'package:preference_app/src/pages/settings_page.dart';
import 'package:preference_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User preferences')
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary color:'),
          Divider(),
          Text('Gender:'),
          Divider(),
          Text('User name:'),
          Divider(),
        ],
      ),
    );
  }
  
}
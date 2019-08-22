import 'package:flutter/material.dart';
import 'package:preference_app/src/pages/home_page.dart';
import 'package:preference_app/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blueAccent,),
            title: Text("Home"),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blueAccent,),
            title: Text("People"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.camera, color: Colors.blueAccent,),
            title: Text("Camera"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blueAccent,),
            title: Text("Settings"),
            onTap: () {
              //Navigator.pushNamed(context, SettingsPage.routeName);
              //Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            }
          ),
        ],
      ),
    );
  }
}
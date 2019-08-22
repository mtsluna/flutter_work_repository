import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preference_app/src/share_prefs/user_preference.dart';
import 'package:preference_app/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor;
  int _gender;
  String _name;
  TextEditingController _textController;
  UserPreference _preference = new UserPreference();

  @override
  void initState() {
    super.initState();  

    _preference.page = SettingsPage.routeName;
    _gender = _preference.gender;
    _secondaryColor = _preference.secondaryColor;
    _name = _preference.name;

    _textController = new TextEditingController(
      text: _name
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (_preference.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Settings",
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text("SecondaryColor"),
            onChanged: (value){              
              setState(() {
                _secondaryColor = value;
                _preference.secondaryColor = value;
              });
            },
          ),
          Divider(),
          RadioListTile(
            value: 1,
            title: Text("Maculino"),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _gender,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Name",
                helperText: "Name of the owner of the phone"
              ),
              onChanged: (value){
                _name = value;
                _preference.name = value;
              },
            ),
          )
        ],
      )
    );
  }

  void _setSelectedRadio(int value) {
    
    _preference.gender = value;
    _gender = value;

    setState(() {
      
    });

  }
}
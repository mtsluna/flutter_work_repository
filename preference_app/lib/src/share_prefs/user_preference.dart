import 'package:preference_app/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{

  static final UserPreference userPreferences = UserPreference._internal(); 

  factory UserPreference(){
    return userPreferences;
  }

  UserPreference._internal();

  SharedPreferences _preferences;

  initPrefs() async {
    this._preferences = await SharedPreferences.getInstance();
  }

  //bool    _secondaryColor;
  //int     _gender;
  //String  _name;

  get gender {
    return _preferences.getInt('gender') ?? 1;
  }

  set gender(int value) {
    _preferences.setInt('gender', value);
  }

  get secondaryColor {
    return _preferences.getBool('color') ?? false;
  }

  set secondaryColor(bool value) {
    _preferences.setBool('color', value);
  }

  get name {
    return _preferences.getString('name') ?? "No definido";
  }

  set name(String value) {
    _preferences.setString('name', value);
  }

  get page {
    return _preferences.getString('page') ?? HomePage.routeName;
  }

  set page(String value) {
    _preferences.setString('page', value);
  }

}
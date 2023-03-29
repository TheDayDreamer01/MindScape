import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";


class SettingsProvider with ChangeNotifier {

  SharedPreferences ? _prefs;

  SettingsProvider(){
    _initPreference();
  }

  Future<void> _initPreference() async {
    _prefs = await SharedPreferences.getInstance();
    return;
  }

  bool getBoolPreference(String preference){
    return _prefs?.getBool(preference) ?? true;
  }
  int getIntPreference(String preference){
    return _prefs?.getInt(preference) ?? 0;
  }
  String getStringPreference(String preference){
    return _prefs?.getString(preference) ?? "";
  }

  void setBoolPreference(String preference, bool value){  
    _prefs?.setBool(preference, value);
    notifyListeners();
    return;
  }
  void setIntPreference(String preference, int value){  
    _prefs?.setInt(preference, value);
    notifyListeners();
    return;
  }
  void setStringPreference(String preference, String value){  
    _prefs?.setString(preference, value);
    notifyListeners();
    return;
  }
}
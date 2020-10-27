import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _logged = false;

  AuthProvider() {
    _readSharedPreferences();
  }

  get getLogged => _logged;

  void setLogged() {
    _logged = _logged == false ? true : false;
    _saveSharedPreferences();
    notifyListeners();
  }

  _readSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final sharedLogged = prefs.getBool('_logged') ?? false;
    if (sharedLogged != null) {
      _logged = sharedLogged;
      notifyListeners();
    }
  }

  _saveSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('_logged', _logged);
  }
}

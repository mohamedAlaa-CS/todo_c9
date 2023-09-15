import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool user = false;

  changeMode(ThemeMode theme) {
    saveTheme(theme == ThemeMode.dark ? true : false);
    themeMode = theme;
    notifyListeners();
  }

  saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', isDark);
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool theme = prefs.getBool('theme') ?? false;
    themeMode = theme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  saveUser() async {
    FirebaseAuth.instance.currentUser == null ? user = false : user = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('user', user);
    notifyListeners();
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getBool('user') ?? false;
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  
  ThemeMode themeMode = ThemeMode.light;
  String language = "en";
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

  changeLanguage(String lang) {
    saveLanguage(lang);
    language = lang;
    notifyListeners();
  }

  saveLanguage(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', value);
    notifyListeners();
  }

  getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString('language') ?? 'en';
  }

  saveUser(bool value) async {
    user = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('user', user);
    notifyListeners();
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getBool('user') ?? false;
  }
}

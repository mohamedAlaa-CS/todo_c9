import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier
{
  ThemeMode themeMode =ThemeMode.light;

  changeMode(ThemeMode theme){
    themeMode = theme;
    notifyListeners();
  }
}
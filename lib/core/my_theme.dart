import 'package:flutter/material.dart';

class Apptheme
{
  static const Color primaryColor = Color(0xff5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor:primaryColor,
    scaffoldBackgroundColor:const Color(0xFFDFECDB),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: primaryColor,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
        size: 30
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
        size: 30,
      ),

    )
  );
}
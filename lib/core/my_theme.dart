import 'package:flutter/material.dart';

class Apptheme
{
  static const Color primaryColor = Color(0xff5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor:primaryColor,
    scaffoldBackgroundColor:const Color(0xFFDFECDB),
    appBarTheme:const AppBarTheme(
      elevation: 0,
      color: primaryColor,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
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
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor:const  Color(0xff060E1E),
    bottomAppBarTheme:const BottomAppBarTheme(color: Color(0xff141922)),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
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
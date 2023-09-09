import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Apptheme {
  static const Color primaryColor = Color(0xff5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    canvasColor: const Color(0xffFFFFFF),
    scaffoldBackgroundColor: const Color(0xFFDFECDB),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: primaryColor,
      centerTitle: false,
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(color: primaryColor, size: 30),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
        size: 30,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(fontSize: 17, color: Colors.black),
      bodyMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
          bodySmall: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      canvasColor: const Color(0xff141922),
      scaffoldBackgroundColor: const Color(0xff060E1E),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: primaryColor,
        centerTitle: false,
        titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff141922)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 30),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
          size: 30,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(fontSize: 17, color: Colors.white),
         bodyMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white),
                    bodySmall: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),

      ),
      );
}

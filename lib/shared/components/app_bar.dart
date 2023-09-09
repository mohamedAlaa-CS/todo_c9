import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/my_theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 40, left: 20),
      width: mediaQuery.width,
      height: mediaQuery.height * 0.19,
      color: Apptheme.primaryColor,
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 22, fontWeight: FontWeight.bold, color:theme.canvasColor ),
      ),
    );
  }
}

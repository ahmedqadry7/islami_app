import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFFB7935F);
  static Color blackColor = Colors.black;
  static ThemeData lightTheme = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      brightness: Brightness.light,
      textTheme: TextTheme( 
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w500
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.w300
        )
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(size: 30, color: blackColor),
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.elMessiri(
              fontSize: 30,
              color: blackColor,
              fontWeight: FontWeight.bold)));
  static ThemeData darkTheme = ThemeData();

}

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Color(0xff0E3A99);
  static const Color darkLight = Color(0xff457AED);
  static const Color backgroundLight = Color(0xffF4F7FF);
  static const Color backgroundDark = Color(0xff000F30);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff1C1C1C);
  static const Color grey = Color(0xff686868);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: white,
      selectedItemColor: primaryLight,
      unselectedItemColor: grey
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLight,
      foregroundColor: white,
      shape: CircleBorder()
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: .w500,
        color: black
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: .w500,
        color: black
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: .w400,
        color: grey
      )
    )
  );
  static ThemeData darkTheme = ThemeData();
}
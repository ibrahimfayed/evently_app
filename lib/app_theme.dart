import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Color(0xff0E3A99);
  static const Color primaryDark = Color(0xff457AED);
  static const Color backgroundLight = Color(0xffF4F7FF);
  static const Color backgroundDark = Color(0xff000F30);
  static const Color white = Color(0xffffffff);
  static const Color offWhite = Color(0xffF0F0F0);
  static const Color black = Color(0xff1C1C1C);
  static const Color darkGrey = Color(0xff686868);
  static const Color grey = Color(0xffB9B9B9);
  static const Color lightGrey = Color(0xffE9EAEB);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: backgroundLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: white,
      selectedItemColor: primaryLight,
      unselectedItemColor: darkGrey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLight,
      foregroundColor: white,
      shape: CircleBorder(),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: white,
      hintStyle: TextStyle(fontSize: 14, fontWeight: .w400, color: darkGrey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: offWhite),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: offWhite),
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: white,
      minTileHeight: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      titleTextStyle: TextStyle(fontSize: 16, fontWeight: .w500, color: black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        foregroundColor: white,
        textStyle: TextStyle(fontSize: 20, fontWeight: .w500),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryLight,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: .w400,
          decoration: .underline, 
          ),
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: .w600,
        color: primaryLight,
      ),
      titleLarge: TextStyle(fontSize: 20, fontWeight: .w500, color: black),
      titleMedium: TextStyle(fontSize: 16, fontWeight: .w500, color: black),
      titleSmall: TextStyle(fontSize: 14, fontWeight: .w400, color: darkGrey),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}

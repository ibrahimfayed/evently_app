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
  static const Color red = Color(0xffFF3232);
  static const Color gereen = Colors.green;
  static const Color navy = Color(0xff001440);
  static const Color borderDark = Color(0xff002D8F);

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
        borderSide: BorderSide(color: borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: borderDark),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: red),
      ),
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: backgroundLight,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18, fontWeight: .w500, color: black),
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
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: backgroundDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundDark,
      selectedItemColor: primaryDark,
      unselectedItemColor: darkGrey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryDark,
      foregroundColor: white,
      shape: CircleBorder(),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: navy,
      hintStyle: TextStyle(fontSize: 14,
      fontWeight: .w400, color: darkGrey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: offWhite),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: offWhite),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: red),
      ),
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: backgroundDark,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: .w500, color: white),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: navy,
      minTileHeight: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      titleTextStyle: TextStyle(
        fontSize: 16, fontWeight: .w500, color: white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(color: borderDark),
        ),
        foregroundColor: white,
        textStyle: TextStyle(fontSize: 20, fontWeight: .w500),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryDark,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: .w400,
          decoration: .underline,
        ),
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(fontSize: 24, fontWeight: .w600, color: white),
      titleLarge: TextStyle(fontSize: 20, fontWeight: .w500, color: white),
      titleMedium: TextStyle(fontSize: 16, fontWeight: .w500, color: white),
      titleSmall: TextStyle(fontSize: 14, fontWeight: .w400, color: white),
    ),
  );
}

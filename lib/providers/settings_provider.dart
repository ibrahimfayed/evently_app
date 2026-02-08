import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = .dark;//here is the defult
  bool get isDark => themeMode == .dark;

  void changeTheme(ThemeMode theme){
    themeMode = theme;
    notifyListeners();
  }

  
}
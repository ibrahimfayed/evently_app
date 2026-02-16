import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode =
      .system; //here is the defult(.dark,.light,.system(according to device system))  ممكن أخليها أي حاجة عادي
  bool get isDark => themeMode == .dark;
  String languageCode = 'en';

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString('language') ?? 'en';
    notifyListeners();
  }

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  Future<void> changeLanguage(String language) async {
    if (languageCode == language) return;
    languageCode = language;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    notifyListeners();
  }
}

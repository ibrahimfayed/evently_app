import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = .system;//here is the defult(.dark,.light,.system(according to device system))  ممكن أخليها أي حاجة عادي
  bool get isDark => themeMode == .dark;
  String languageCode = 'ar';

  void changeTheme(ThemeMode theme){
    themeMode = theme;
    notifyListeners();
  }
void changeLanguage(String language){
  if(languageCode==language)return;
  languageCode = language;
  notifyListeners();
}
  
}
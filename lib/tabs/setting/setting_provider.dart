import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String LanguageCode = 'en';
  bool get isDark => themeMode == ThemeMode.dark;

  void changeTheme(ThemeMode selctedTheme) {
    themeMode = selctedTheme;
    notifyListeners();
  }

  void changeLanguag(String selctedLanguag) {
    LanguageCode = selctedLanguag;
    notifyListeners();
  }
}

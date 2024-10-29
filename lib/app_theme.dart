import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF5D9CEC);
  static const Color backgraundLight = Color(0xFFDFECDB);
  static const Color backgraundDark = Color(0xFF1E1E1E);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF141922);
  static const Color green = Color(0xFF61E757);
  static const Color gray = Color(0xFFC8C9CB);
  static const Color rad = Color(0xFFEC4B4B);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: backgraundLight,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: white,
        selectedItemColor: primary,
        unselectedItemColor: gray,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: white,
          shape: CircleBorder(side: BorderSide(width: 4, color: white))));
  static ThemeData darkTheme = ThemeData();
}

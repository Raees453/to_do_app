import 'package:flutter/material.dart';

getDarkTheme() {
  return ThemeData(
    backgroundColor: const Color.fromRGBO(28, 27, 32, 1),
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromRGBO(70, 98, 154, 1),
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      background: Color.fromRGBO(28, 27, 32, 1),
      primary: Color.fromRGBO(35, 40, 53, 1),
      onPrimary: Colors.white,
      secondary: Color.fromRGBO(70, 98, 154, 1),
      onSecondary: Colors.white,
      tertiary: Color.fromRGBO(39, 37, 42, 1),
      error: Color.fromRGBO(251, 45, 33, 1.0),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(39, 47, 43, 1),
      selectedItemColor: Color.fromRGBO(70, 98, 154, 1),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}

getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromRGBO(70, 98, 154, 1),
    primaryColorLight: const Color.fromRGBO(70, 98, 154, 1),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromRGBO(70, 98, 154, 1),
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: Colors.white,
      primary: Colors.grey,
      onPrimary: Colors.black87,
      secondary: Color.fromRGBO(70, 98, 154, 1),
      onSecondary: Colors.white,
      tertiary: Colors.grey,
      error: Color.fromRGBO(251, 45, 33, 1.0),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(39, 47, 43, 1),
      selectedItemColor: Color.fromRGBO(70, 98, 154, 1),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}

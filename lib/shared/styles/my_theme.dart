import 'package:flutter/material.dart';
import 'colors.dart';

class MyThemeData {
  static ThemeData ligthTheme = ThemeData(
      primaryColorLight: pramiryColor,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: pramiryColor,
          onPrimary: Colors.white,
          secondary: greenBackground,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: greenBackground,
          onBackground: colorBlack,
          surface: Colors.grey,
          onSurface: Colors.black),
      primaryColor: pramiryColor,
      scaffoldBackgroundColor: greenBackground,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: pramiryColor,
      ),
      textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: pramiryColor,
          ),
          subtitle2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colorGreen,
          ),
          headline2:
              TextStyle(backgroundColor: Color.fromRGBO(122, 92, 58, 1.0))),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: pramiryColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: pramiryColor),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          elevation: 3,
          selectedItemColor: Colors.black));

  static ThemeData darkTheme = ThemeData(
      primaryColorLight: pramiryColor,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: pramiryColor,
          onPrimary: Colors.white,
          secondary: greenBackground,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: greenBackground,
          onBackground: colorBlack,
          surface: Colors.grey,
          onSurface: Colors.white),
      primaryColor: pramiryColor,
      scaffoldBackgroundColor: greenBackground,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: pramiryColor,
      ),
      textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: pramiryColor,
          ),
          subtitle2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colorGreen,
          ),
          headline2:
              TextStyle(backgroundColor: Color.fromRGBO(122, 92, 58, 1.0))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: pramiryColor),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          elevation: 3,
          selectedItemColor: Colors.black));
}

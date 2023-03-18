import 'package:flutter/material.dart';

class CustomThemeData {
  static const Color primaryPurple = Color(0xFF6C63FF);
  static const Color primaryRed = Color(0xFFFF7F7E);
  static const Color primaryGreen = Color(0xFF6FB98F);

  static ThemeData light = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'JosefinSans',
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'JosefinSans',
        ),
    primaryColor: primaryPurple,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontFamily: 'JosefinSans',
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        size: 30,
        color: primaryPurple,
      ),
      unselectedIconTheme: IconThemeData(
        size: 30,
        color: Colors.grey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryPurple,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(48),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.fromHeight(50),
        foregroundColor: Colors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
    ),
    indicatorColor: primaryPurple,
  );
}

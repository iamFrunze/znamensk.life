import 'package:flutter/material.dart';

class CustomTheme {
  static final shared = CustomTheme();

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 10,
      selectedIconTheme: IconThemeData(color: Colors.blue),
      unselectedIconTheme: IconThemeData(color: Colors.grey),
    ),
    bottomAppBarColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
    colorScheme: const ColorScheme.dark(),
  );
}

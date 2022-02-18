import 'package:flutter/material.dart';

class CustomTheme {
  static final shared = CustomTheme();

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
    ),
  );

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarTheme(
      data: ,
    ),
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
  );
}

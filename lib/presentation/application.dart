// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:znamensk/presentation/home/home_screen.dart';
import 'package:znamensk/presentation/splash/splash_screen.dart';
import 'package:znamensk/resources/custom_theme.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.shared.lightTheme,
      darkTheme: CustomTheme.shared.darkTheme,
      home: const HomeScreen(),
    );
  }
}

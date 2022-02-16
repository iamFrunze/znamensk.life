import 'package:flutter/material.dart';
import 'package:znamensk/presentation/splash/splash_screen.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

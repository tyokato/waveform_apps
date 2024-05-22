import 'package:flutter/material.dart';
import 'package:waveform_apps/layouts/landing_page.dart';
import 'package:waveform_apps/layouts/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/home': (context) => LandingPage()
      },
    );
  }
}

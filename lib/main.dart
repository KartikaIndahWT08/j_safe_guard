import 'package:flutter/material.dart';
import 'package:tes_j_safe_guard/screen/splash/screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Jember - Safe Guard',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

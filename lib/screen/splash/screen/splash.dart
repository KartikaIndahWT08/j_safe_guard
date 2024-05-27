// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../splash1/screen/splash1.dart'; // Sesuaikan dengan nama file dan lokasi file yang benar

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      // Delayed navigation after 5 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const Splash1()), // Ganti dengan nama halaman yang sesuai
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/image/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(width: 0), // memberikan jarak antara logo dan teks
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jember - ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  'Safe Guard',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF004AAD),
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

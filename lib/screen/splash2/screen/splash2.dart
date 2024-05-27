// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tes_j_safe_guard/screen/signup/screen/signup.dart';
import '../../splash3/screen/splash3.dart';

class Splash2 extends StatelessWidget {
  const Splash2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('2/3', style: TextStyle(fontSize: 25)),
                  TextButton(
                    onPressed: () {
                      // Navigate to HomePage when "Skip" is pressed
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                    child: const Text('Skip', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: Image.asset('lib/image/splash2.png'),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Berhati-Hati di Zona Rawan Bahaya',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Dapatkan informasi daerah-daerah di Jember dengan tingkat kriminalitasnya dan berhati-hatilah pada zona bahaya !',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to Splash1 when "Prev" is pressed
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Colors.grey, // Mengatur warna teks menjadi abu-abu
                    ),
                    child: const Text('Prev', style: TextStyle(fontSize: 20)),
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.grey),
                      SizedBox(width: 5),
                      Icon(Icons.circle, size: 10, color: Colors.blue),
                      SizedBox(width: 5),
                      Icon(Icons.circle, size: 10, color: Colors.grey),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // Navigate to Splash3 when "Next" is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Splash3()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Colors.blue, // Mengatur warna teks menjadi biru
                    ),
                    child: const Text('Next', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

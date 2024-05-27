// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tes_j_safe_guard/screen/signup/screen/signup.dart';
import '../../splash2/screen/splash2.dart';

class Splash1 extends StatelessWidget {
  const Splash1({Key? key});

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
                  const Text('1/3', style: TextStyle(fontSize: 25)),
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
                  child: Image.asset('lib/image/splash1.png'),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Temukan Nomor Darurat Untuk Keadaan Darurat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Temukan semua nomor-nomor penting untuk keadaan darurat di daerahmu, '
                'seperti nomor telepon kantor polisi, nomor telepon ambulan dan juga nomor telepon pemadam kebakaran',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align to the end
                children: [
                  const SizedBox(
                      width: 16), // Add some space for better alignment
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.blue),
                      SizedBox(width: 5),
                      Icon(Icons.circle, size: 10, color: Colors.grey),
                      SizedBox(width: 5),
                      Icon(Icons.circle, size: 10, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(
                      width: 16), // Add some space for better alignment
                  TextButton(
                    onPressed: () {
                      // Navigate to Splash2 when "Next" is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Splash2()),
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

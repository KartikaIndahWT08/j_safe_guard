import 'package:flutter/material.dart';
import 'package:tes_j_safe_guard/screen/login/screen/loginpage.dart';
import '../../homepage/screen/homepage.dart';
import '../../splash2/screen/splash2.dart';

class Splash3 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Splash3({Key? key});

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
                  const Text('3/3', style: TextStyle(fontSize: 25)),
                  TextButton(
                    onPressed: () {
                      // Navigate to HomePage when "Skip" is pressed
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text('Skip', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: Image.asset('lib/image/splash3.png'),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Dapatkan Edukasi Situasi Darurat dan Berita Terbaru',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Dapatkan banyak informasi edukasi mengenai keadaan darurat baik keadaan kriminalitas maupun bencana alam dan kecelakaan. Dapatkan pula berita-berita terbaru seputar keamanan sekitar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to Splash2 when "Prev" is pressed
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Splash2()),
                      );
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
                      Icon(Icons.circle, size: 10, color: Colors.grey),
                      SizedBox(width: 5),
                      Icon(Icons.circle, size: 10, color: Colors.blue),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // Navigate to Signup when "Get Started" is pressed
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Colors.blue, // Mengatur warna teks menjadi biru
                    ),
                    child: const Text('Get Started',
                        style: TextStyle(fontSize: 20)),
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

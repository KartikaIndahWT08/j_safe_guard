import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tes_j_safe_guard/screen/education/widget/berita.dart';
import 'package:tes_j_safe_guard/screen/detailEducation/screen/detailEdu.dart';

import '../../../navbar.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromRGBO(153, 153, 153, 1), Colors.white])),
          ),
          leading: Image.asset(
            'lib/image/logo.png',
            height: 60,
          ),
          title: RichText(
            text: TextSpan(
                text: "Jember-",
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                children: [
                  TextSpan(
                    text: "Safe Guard",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(0, 74, 173, 1)),
                  )
                ]),
          ),
        ),
        body: ListView(children: [
          Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              Container(
                height: 60,
                width: 343,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromRGBO(0, 74, 173, 1),
                ),
                child: ListTile(
                  title: Text(
                    "Emergency Education",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Detail();
                    },
                  ));
                },
                child: berita(
                  gambar: "lib/image/edu1.png",
                  title:
                      "Hal-hal yang harus kamu lakukan apabila terdapat seseorang yang kejang !",
                  nama: "Matt Villano",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Detail();
                    },
                  ));
                },
                child: berita(
                  gambar: "lib/image/edu1.png",
                  title:
                      "Hal-hal yang harus kamu lakukan apabila terdapat seseorang yang kejang !",
                  nama: "Matt Villano",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Detail();
                    },
                  ));
                },
                child: berita(
                  gambar: "lib/image/edu1.png",
                  title:
                      "Hal-hal yang harus kamu lakukan apabila terdapat seseorang yang kejang !",
                  nama: "Matt Villano",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Detail();
                    },
                  ));
                },
                child: berita(
                  gambar: "lib/image/edu1.png",
                  title:
                      "Hal-hal yang harus kamu lakukan apabila terdapat seseorang yang kejang !",
                  nama: "Matt Villano",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Detail();
                    },
                  ));
                },
                child: berita(
                  gambar: "lib/image/edu1.png",
                  title:
                      "Hal-hal yang harus kamu lakukan apabila terdapat seseorang yang kejang !",
                  nama: "Matt Villano",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Detail();
                    },
                  ));
                },
                child: berita(
                  gambar: "lib/image/edu1.png",
                  title:
                      "Hal-hal yang harus kamu lakukan apabila terdapat seseorang yang kejang !",
                  nama: "Matt Villano",
                ),
              ),
            ],
          ),
        ]),
        bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
      ),
    );
  }
}

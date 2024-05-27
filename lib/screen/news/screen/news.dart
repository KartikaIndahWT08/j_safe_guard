import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tes_j_safe_guard/screen/detailNews/screen/detailNews.dart';
import 'package:tes_j_safe_guard/screen/news/widget/news.dart';

import '../../../navbar.dart';

class News extends StatelessWidget {
  const News({super.key});

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
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(153, 153, 153, 1),
                Colors.white
              ])),
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
                      "News",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    trailing: const Icon(
                      Icons.newspaper_outlined,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const detailNews();
                      },
                    ));
                  },
                  child: news(
                      gambar: "lib/image/news1.png",
                      title:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !",
                      nama: "by Ryan Browne - Sabtu, 27 April 2024",
                      deskripsi:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !"),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const detailNews();
                      },
                    ));
                  },
                  child: news(
                      gambar: "lib/image/news1.png",
                      title:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !",
                      nama: "by Ryan Browne - Sabtu, 27 April 2024",
                      deskripsi:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !"),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const detailNews();
                      },
                    ));
                  },
                  child: news(
                      gambar: "lib/image/news1.png",
                      title:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !",
                      nama: "by Ryan Browne - Sabtu, 27 April 2024",
                      deskripsi:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !"),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const detailNews();
                      },
                    ));
                  },
                  child: news(
                      gambar: "lib/image/news1.png",
                      title:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !",
                      nama: "by Ryan Browne - Sabtu, 27 April 2024",
                      deskripsi:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !"),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const detailNews();
                      },
                    ));
                  },
                  child: news(
                      gambar: "lib/image/news1.png",
                      title:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !",
                      nama: "by Ryan Browne - Sabtu, 27 April 2024",
                      deskripsi:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !"),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const detailNews();
                      },
                    ));
                  },
                  child: news(
                      gambar: "lib/image/news1.png",
                      title:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !",
                      nama: "by Ryan Browne - Sabtu, 27 April 2024",
                      deskripsi:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !"),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const detailNews();
                      },
                    ));
                  },
                  child: news(
                      gambar: "lib/image/news1.png",
                      title:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !",
                      nama: "by Ryan Browne - Sabtu, 27 April 2024",
                      deskripsi:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !"),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const detailNews();
                      },
                    ));
                  },
                  child: news(
                      gambar: "lib/image/news1.png",
                      title:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !",
                      nama: "by Ryan Browne - Sabtu, 27 April 2024",
                      deskripsi:
                          "Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !"),
                ),
              ],
            ),
          ]),
          bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
        ));
  }
}

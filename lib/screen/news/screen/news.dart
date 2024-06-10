import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tes_j_safe_guard/provider/news_provider.dart'; // Assuming you have a NewsProvider
import 'package:tes_j_safe_guard/screen/detailNews/screen/detailNews.dart';
import 'package:tes_j_safe_guard/screen/news/widget/news.dart';
import '../../../navbar.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider()..fetchNews(),
      child: MaterialApp(
        theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showUnselectedLabels: true,
            showSelectedLabels: true,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150.0),
            child: AppBar(
              backgroundColor: Colors.grey[200],
              elevation: 1.0,
              flexibleSpace: Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/image/logo.png',
                          height: 60,
                        ),
                        const SizedBox(width: 16),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Jember-',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: 'Safe Guard',
                                style: TextStyle(
                                  color: Color(0xFF004AAD),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              automaticallyImplyLeading:
                  false, // Remove back arrow if necessary
            ),
          ),
          body: Consumer<NewsProvider>(
            builder: (context, newsProvider, child) {
              return ListView(
                children: [
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
                              color: Colors.white,
                            ),
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
                      ...List.generate(newsProvider.news.length, (index) {
                        final newsItem = newsProvider.news[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return detailNews(news: newsItem);
                              },
                            ));
                          },
                          child: news(
                            gambar: "lib/image/news1.png",
                            title: newsItem['title'] ?? 'No Title',
                            nama: newsItem['author'] ?? 'No Author',
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              );
            },
          ),
          bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
        ),
      ),
    );
  }
}

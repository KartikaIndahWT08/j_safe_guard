import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tes_j_safe_guard/loading_widget.dart';
import 'package:tes_j_safe_guard/provider/education_provider.dart';
import 'package:tes_j_safe_guard/screen/education/widget/berita.dart';
import 'package:tes_j_safe_guard/screen/detailEducation/screen/detailEdu.dart';

import '../../../navbar.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EducationProvider()..fetchArticles(),
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
          body: Consumer<EducationProvider>(
            builder: (context, educationProvider, child) {
              return FutureBuilder<void>(
                future: educationProvider.fetchArticles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingWidget(); // Show loading animation while fetching data
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return ListView(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 6),
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
                            const SizedBox(height: 16),
                            ...List.generate(educationProvider.articles.length,
                                (index) {
                              final article = educationProvider.articles[index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Detail(index: index);
                                        },
                                      ));
                                    },
                                    child: berita(
                                      gambar: "lib/image/edu1.png",
                                      title: article['title'] ?? 'No Title',
                                      nama: article['author'] ?? 'No Author',
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              );
                            }),
                          ],
                        ),
                      ],
                    );
                  }
                },
              );
            },
          ),
          bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tes_j_safe_guard/provider/education_provider.dart';

class Detail extends StatelessWidget {
  final int index;

  const Detail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EducationProvider()..fetchDetail(index),
      child: Consumer<EducationProvider>(
        builder: (context, educationProvider, child) {
          final articleDetail = educationProvider.articleDetail;
          final String title = articleDetail['title'] ?? 'No Title';
          final String author = articleDetail['author'] ?? 'No Author';
          final String content = articleDetail['isi'] ?? 'No Content';

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(150.0),
                child: AppBar(
                  backgroundColor: Colors.grey[200],
                  elevation: 1.0,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 16.0, right: 16.0),
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
              body: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 800,
                        height: 300,
                        child: Image.asset(
                          'lib/image/edu1.png',
                          width: 900,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 245, 245, 2),
                            ),
                            child: const Icon(Icons.arrow_back_ios_new_sharp),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 219,
                        child: Container(
                          height: 90,
                          width: 400,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 32, right: 34, top: 14),
                            child: Text(
                              title,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          height: 54,
                          width: 315,
                          margin: const EdgeInsets.only(left: 30, right: 30),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://picsum.photos/id/237/200/300",
                                ),
                                radius: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(author),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 12),
                          child: Text(content),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

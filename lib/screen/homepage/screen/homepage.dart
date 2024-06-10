// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_j_safe_guard/navbar.dart';
import 'package:tes_j_safe_guard/provider/education_provider.dart';
import 'package:tes_j_safe_guard/provider/home_provider.dart';
import 'package:tes_j_safe_guard/provider/user_provider.dart';
import 'package:tes_j_safe_guard/screen/news/screen/news.dart';
import '../../education/screen/education.dart';
import '../../hotline/screen/HotlineCall.dart';
import '../../zoneC/screen/ZoneCondition.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 200.0,
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Image(
                    image: AssetImage('lib/image/logo.png'),
                    height: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jember - ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'Safe Guard',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF004AAD),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: const LinearGradient(
                colors: [Color(0xFFB3E5FC), Color(0xFF004AAD)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Good Afternoon,',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          '${userProvider.name}!',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                AssetImage('lib/image/profile.jpg'),
                          ),
                          SizedBox(width: 16.0),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white),
                    const SizedBox(width: 8.0),
                    DropdownButton<String>(
                      value: homeProvider.selectedSubDistrict,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          homeProvider.setSelectedSubDistrict(newValue);
                        }
                      },
                      items: homeProvider.subDistricts
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFF004AAD),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hotline',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF004AAD),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Color(0xFF004AAD)),
                    ),
                  ),
                  onPressed: () {
                    // Tambahkan navigasi ke MainPage di sini
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HotlinePage()),
                    );
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Color(0xFF004AAD),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tambahan Container untuk ikon dari gambar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset('lib/image/police.png', width: 50, height: 50),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Police',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('lib/image/ambulan.png', width: 50, height: 50),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Ambulance',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('lib/image/fire.png', width: 50, height: 50),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Fire Fighter',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFF004AAD),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Zone Condition',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF004AAD),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Color(0xFF004AAD)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ZonePage()),
                    );
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Color(0xFF004AAD),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              'lib/image/splash2.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFF004AAD),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Emergency Education',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF004AAD),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Color(0xFF004AAD)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Education()),
                    );
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Color(0xFF004AAD),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: Consumer<EducationProvider>(
              builder: (context, educationProvider, _) {
                // Find the article with the specific title and author
                final article = educationProvider.articles.firstWhere(
                  (article) =>
                      article['title'] ==
                          "Langkah-Langkah Darurat Saat Kebakaran di Rumah" &&
                      article['author'] == "Rahma Wati",
                  orElse: () => {},
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        article.isNotEmpty
                            ? article['title']!
                            : 'Title Not Found',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Text(
                        article.isNotEmpty
                            ? article['author']!
                            : 'Author Not Found',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          Container(
            margin: const EdgeInsets.all(16.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFF004AAD),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'News',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF004AAD),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Color(0xFF004AAD)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const News()),
                    );
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Color(0xFF004AAD),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const detailNews()),
          //     );
          //   },
          //   child: Stack(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //         child: ClipRRect(
          //           borderRadius: const BorderRadius.vertical(
          //             top: Radius.circular(16),
          //             bottom: Radius.circular(16),
          //           ),
          //           child: Image.asset(
          //             'lib/image/news1.png',
          //             width: double.infinity,
          //             height: 300,
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //       const Positioned(
          //         left: 16,
          //         right: 16,
          //         bottom: 0,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Padding(
          //               padding:
          //                   EdgeInsets.only(left: 16, right: 16, bottom: 16),
          //               child: Text(
          //                 'by Ryan Brownie',
          //                 style: TextStyle(
          //                   fontSize: 18,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: EdgeInsets.all(16.0),
          //               child: Text(
          //                 'Mafia begal Ditangkap pagi ini pada pukul 09.00 , Kapolsek Jember siapkan pernyataan untuk pers !',
          //                 style: TextStyle(
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.bold,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding:
          //                   EdgeInsets.only(left: 16, right: 16, bottom: 16),
          //               child: Text(
          //                 'Mafia begal ditangkap pada pukul 09.00 pagi ini di Jember. Kapolsek Jember telah menyiapkan pernyataan untuk pers.',
          //                 style: TextStyle(
          //                   fontSize: 18,
          //                   color: Colors.white70,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ]),
      ),
      bottomNavigationBar: const BottomNavBar(
          selectedIndex: 3), // Setting the Home tab as active
    );
// Tambahkan baris ini
  }
}

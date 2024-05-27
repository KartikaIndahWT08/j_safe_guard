// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../navbar.dart';

class HotlinePage extends StatefulWidget {
  const HotlinePage({super.key});

  @override
  _HotlinePageState createState() => _HotlinePageState();
}

class _HotlinePageState extends State<HotlinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 1.0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
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
                const SizedBox(height: 20.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.location_on, color: Colors.black),
                    SizedBox(width: 8.0),
                    Text(
                      'Tanggul, Jember',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            buildCard('Police', 'lib/image/police.png', [
              buildContactItem(
                  'Tanggul Police Sector, Tanggul Wetan', '(0336) 441110'),
              buildContactItem(
                  'Tanggul Police Sector, Tanggul Wetan', '(0336) 441110'),
              buildContactItem(
                  'Tanggul Police Sector, Tanggul Wetan', '(0336) 441110'),
              buildContactItem(
                  'Tanggul Police Sector, Tanggul Wetan', '(0336) 441110'),
            ]),
            buildCard('Ambulance', 'lib/image/ambulan.png', [
              buildContactItem(
                  'Ambulance RS Bina Sehat Tanggul', '(0331) 422701'),
              buildContactItem(
                  'Ambulance RS Bina Sehat Tanggul', '(0331) 422701'),
              buildContactItem(
                  'Ambulance RS Bina Sehat Tanggul', '(0331) 422701'),
              buildContactItem(
                  'Ambulance RS Bina Sehat Tanggul', '(0331) 422701'),
            ]),
            buildCard('Firefighter', 'lib/image/fire.png', [
              buildContactItem('Damkar Jember', '0331 321 213'),
              buildContactItem('Damkar Jember', '0331 321 213'),
              buildContactItem('Damkar Jember', '0331 321 213'),
              buildContactItem('Damkar Jember', '0331 321 213'),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
    );
  }

  Widget buildCard(String title, String imagePath, List<Widget> contacts) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF004AAD),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  imagePath,
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
          Column(
            children: contacts,
          ),
        ],
      ),
    );
  }

  Widget buildContactItem(String title, String trailing) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF004AAD)),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  trailing,
                  style:
                      const TextStyle(color: Color(0xFF004AAD), fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 1, color: Color(0xFF004AAD)),
      ],
    );
  }
}

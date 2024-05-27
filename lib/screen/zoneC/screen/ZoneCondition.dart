// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../navbar.dart';

class ZonePage extends StatefulWidget {
  const ZonePage({super.key});

  @override
  _ZonePageState createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {
  bool isInformationButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: height * 0.3, // 30% of the screen height
                color: Colors.grey[300],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: const Color(0xFF004AAD),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Zone Condition',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              'lib/image/iconmap.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'lib/image/map.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isInformationButtonPressed = !isInformationButtonPressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: isInformationButtonPressed
                      ? const Color(0xFF004AAD)
                      : Colors.grey,
                ),
                child: const Text('Information'),
              ),
              const SizedBox(height: 20),
              if (isInformationButtonPressed)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey[200],
                      child: const Column(
                        children: [
                          InformationRow(
                            leftText: 'Desa Klatakan, Tanggul Jember',
                            rightText: 'Rawan Begal',
                          ),
                          SizedBox(height: 10),
                          InformationRow(
                            leftText: 'Jalan Raya Pondok Dalem, Tanggul',
                            rightText: 'Rawan Kecelakaan',
                          ),
                          SizedBox(height: 10),
                          InformationRow(
                            leftText: 'Desa Patemon',
                            rightText: 'Rawan Pencurian',
                          ),
                          SizedBox(height: 10),
                          InformationRow(
                            leftText: 'Desa Patemon',
                            rightText: 'Rawan Pencurian',
                          ),
                          SizedBox(height: 10),
                          InformationRow(
                            leftText: 'Desa Patemon',
                            rightText: 'Rawan Pencurian',
                          ),
                          SizedBox(height: 10),
                          InformationRow(
                            leftText: 'Desa Patemon',
                            rightText: 'Rawan Pencurian',
                          ),
                          SizedBox(height: 10),
                          InformationRow(
                            leftText: 'Desa Patemon',
                            rightText: 'Rawan Pencurian',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}

class InformationRow extends StatelessWidget {
  final String leftText;
  final String rightText;

  const InformationRow(
      {super.key, required this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            rightText,
            style: const TextStyle(fontSize: 14, color: Colors.red),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_j_safe_guard/provider/home_provider.dart';
import 'package:tes_j_safe_guard/provider/hotline_provider.dart';

import '../../../navbar.dart';

class HotlinePage extends StatefulWidget {
  const HotlinePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HotlinePageState createState() => _HotlinePageState();
}

class _HotlinePageState extends State<HotlinePage> {
  @override
  void initState() {
    super.initState();
    // Fetch the initial data when the widget is created
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final hotlineProvider =
        Provider.of<HotlineProvider>(context, listen: false);
    hotlineProvider.fetchHotlineData(homeProvider.selectedSubDistrict);
  }

  @override
  Widget build(BuildContext context) {
    final hotlineProvider = Provider.of<HotlineProvider>(context);

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
                // const SizedBox(height: 20.0),
                Consumer<HomeProvider>(
                  builder: (context, homeProvider, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.location_on, color: Colors.black),
                        const SizedBox(width: 8.0),
                        DropdownButton<String>(
                          value: homeProvider.selectedSubDistrict,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                          ),
                          onChanged: (String? newValue) {
                            homeProvider.setSelectedSubDistrict(newValue!);
                            hotlineProvider.fetchHotlineData(newValue);
                          },
                          items: homeProvider.subDistricts
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildCard(
                'Police',
                'lib/image/police.png',
                hotlineProvider.hotlineData
                    .where((data) => data['title'] == 'Polisi')
                    .toList()),
            buildCard(
                'Ambulance',
                'lib/image/ambulan.png',
                hotlineProvider.hotlineData
                    .where((data) => data['title'] == 'Ambulan')
                    .toList()),
            buildCard(
                'Firefighter',
                'lib/image/fire.png',
                hotlineProvider.hotlineData
                    .where((data) => data['title'] == 'Pemadam Kebakaran')
                    .toList()),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
    );
  }

  Widget buildCard(
      String title, String imagePath, List<Map<String, dynamic>> contacts) {
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
            children: contacts.map((contact) {
              return buildContactItem(contact['title'], contact['contact']);
            }).toList(),
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

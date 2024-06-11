import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../navbar.dart';
import 'package:tes_j_safe_guard/provider/zone_provider.dart';

class ZonePage extends StatefulWidget {
  const ZonePage({Key? key}) : super(key: key);

  @override
  _ZonePageState createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {
  bool isInformationButtonPressed = false;

  @override
  void initState() {
    super.initState();
    // Ambil instance dari ZoneProvider
    final zoneProvider = Provider.of<ZoneProvider>(context, listen: false);
    // Panggil metode untuk mengambil data kecamatan
    zoneProvider.fetchSubDistricts();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // Ambil instance dari ZoneProvider
    final zoneProvider = Provider.of<ZoneProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 1.0,
          automaticallyImplyLeading: false,
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
                // Dropdown untuk memilih Kecamatan
                DropdownButton<String>(
                  value: zoneProvider.selectedSubDistrict,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                  onChanged: (String? newValue) {
                    zoneProvider.setSelectedSubDistrict(newValue!);
                  },
                  items: zoneProvider.subDistricts
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: height - kToolbarHeight - kBottomNavigationBarHeight,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: height * 0.3, // 30% dari tinggi layar
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
                    children: zoneProvider.villages.map((village) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          InformationRow(
                            leftText: village,
                            rightText: 'Rawan Begal',
                          ),
                        ],
                      );
                    }).toList(),
                  ),
              ],
            ),
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
  const InformationRow({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tes_j_safe_guard/provider/zone_provider.dart';
import 'package:tes_j_safe_guard/provider/home_provider.dart';
import '../../../navbar.dart';

class ZonePage extends StatefulWidget {
  const ZonePage({super.key});

  @override
  _ZonePageState createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {
  bool isInformationButtonPressed = false;

  @override
  void initState() {
    super.initState();
    final zoneProvider = Provider.of<ZoneProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    zoneProvider.fetchZoneData(homeProvider.selectedSubDistrict);
  }

  void _onSubDistrictChanged(String? newValue) {
    if (newValue == null) return;
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final zoneProvider = Provider.of<ZoneProvider>(context, listen: false);
    homeProvider.setSelectedSubDistrict(newValue);
    zoneProvider.fetchZoneData(newValue);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final zoneProvider = Provider.of<ZoneProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
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
                          onChanged: _onSubDistrictChanged,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: height * 0.3,
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
                      child: Column(
                        children: zoneProvider.zoneData.map((zone) {
                          return InformationRow(
                            leftText: zone['name']!,
                            rightText: zone['condition']!,
                          );
                        }).toList(),
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

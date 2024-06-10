// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ZoneProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, String>> _zoneData = [];

  List<Map<String, String>> get zoneData => _zoneData;

  Future<void> fetchZoneData(String selectedSubDistrict) async {
    try {
      _zoneData.clear();

      // Get the single document ID within the 'kecamatan' collection
      QuerySnapshot kecamatanSnapshot =
          await _firestore.collection('kecamatan').get();
      if (kecamatanSnapshot.docs.isNotEmpty) {
        String kecamatanDocId = kecamatanSnapshot.docs.first.id;

        // Fetch data from 'ZoneCondition' collection
        QuerySnapshot zoneSnapshot = await _firestore
            .collection('kecamatan')
            .doc(kecamatanDocId)
            .collection(selectedSubDistrict)
            .doc(
                'ZoneCondition') // Assuming a single document for zone conditions
            .collection('Zones') // Assuming sub-collection for multiple zones
            .get();

        for (var doc in zoneSnapshot.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          _zoneData.add({
            'name': data['name'] ?? '',
            'condition': data['condition'] ?? '',
          });
        }
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}

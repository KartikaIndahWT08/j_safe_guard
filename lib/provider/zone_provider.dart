// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ZoneProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, String>> _zoneData = [];

  List<Map<String, String>> get zoneData => _zoneData;

  Future<void> fetchZoneData(String selectedKecamatan) async {
    try {
      _zoneData.clear();

      // Get the document ID within the 'kecamatan' collection based on the selectedKecamatan
      QuerySnapshot kecamatanSnapshot = await _firestore
          .collection('kecamatan')
          .where('name', isEqualTo: selectedKecamatan)
          .get();

      if (kecamatanSnapshot.docs.isNotEmpty) {
        String kecamatanDocId = kecamatanSnapshot.docs.first.id;

        // Fetch data from 'ZoneCondition' collection
        DocumentSnapshot zoneDoc = await _firestore
            .collection('kecamatan')
            .doc(kecamatanDocId)
            .collection(
                'ZoneCondition') // Assuming a single document for zone conditions
            .doc('condition') // Assuming the document ID is 'condition'
            .get();

        if (zoneDoc.exists) {
          Map<String, dynamic> data = zoneDoc.data() as Map<String, dynamic>;
          _zoneData.add({
            'area': data['area'] ?? '',
            'condition': data['kondisi'] ?? '',
          });
        }

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}

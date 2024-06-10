// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HotlineProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, String>> _hotlineData = [];

  List<Map<String, String>> get hotlineData => _hotlineData;

  Future<void> fetchHotlineData(String selectedSubDistrict) async {
    try {
      _hotlineData.clear();

      // Get the single document ID within the 'kecamatan' collection
      QuerySnapshot kecamatanSnapshot =
          await _firestore.collection('kecamatan').get();
      if (kecamatanSnapshot.docs.isNotEmpty) {
        String kecamatanDocId = kecamatanSnapshot.docs.first.id;

        // Fetch data from 'Polisi' collection
        QuerySnapshot polisiSnapshot = await _firestore
            .collection('kecamatan')
            .doc(kecamatanDocId)
            .collection(selectedSubDistrict)
            .get();
        if (polisiSnapshot.docs.isNotEmpty) {
          String subDocId = polisiSnapshot.docs.first.id;
          QuerySnapshot polisiContactsSnapshot = await _firestore
              .collection('kecamatan')
              .doc(kecamatanDocId)
              .collection(selectedSubDistrict)
              .doc(subDocId)
              .collection('Polisi')
              .get();
          for (var doc in polisiContactsSnapshot.docs) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            data.forEach((key, value) {
              _hotlineData.add({
                'title': 'Polisi',
                'contact': value.toString(),
              });
            });
          }
        }
        QuerySnapshot ambulanSnapshot = await _firestore
            .collection('kecamatan')
            .doc(kecamatanDocId)
            .collection(selectedSubDistrict)
            .get();
        if (ambulanSnapshot.docs.isNotEmpty) {
          String subDocId = ambulanSnapshot.docs.first.id;
          QuerySnapshot ambulanContactsSnapshot = await _firestore
              .collection('kecamatan')
              .doc(kecamatanDocId)
              .collection(selectedSubDistrict)
              .doc(subDocId)
              .collection('Ambulan')
              .get();
          for (var doc in ambulanContactsSnapshot.docs) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            data.forEach((key, value) {
              _hotlineData.add({
                'title': 'Ambulan',
                'contact': value.toString(),
              });
            });
          }
        }
        QuerySnapshot pemadamSnapshot = await _firestore
            .collection('kecamatan')
            .doc(kecamatanDocId)
            .collection(selectedSubDistrict)
            .get();
        if (pemadamSnapshot.docs.isNotEmpty) {
          String subDocId = pemadamSnapshot.docs.first.id;
          QuerySnapshot pemadamContactsSnapshot = await _firestore
              .collection('kecamatan')
              .doc(kecamatanDocId)
              .collection(selectedSubDistrict)
              .doc(subDocId)
              .collection('Pemadam Kebakaran')
              .get();
          for (var doc in pemadamContactsSnapshot.docs) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            data.forEach((key, value) {
              _hotlineData.add({
                'title': 'Pemadam Kebakaran',
                'contact': value.toString(),
              });
            });
          }
        }
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}

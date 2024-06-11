// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ZoneProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> _subDistricts = [];
  String _selectedSubDistrict = '';
  List<String> _villages = [];
  String _selectedVillage = '';
  List<String> _kondisi = [];
  String _selectedKondisi = '';

  List<String> get subDistricts => _subDistricts;
  String get selectedSubDistrict => _selectedSubDistrict;
  List<String> get villages => _villages;
  String get setSelectedVillages => _selectedVillage;
  List<String> get kondisi => _kondisi;
  String get setSelectedKondisi => _selectedKondisi;

  ZoneProvider() {
    fetchSubDistricts();
    fetchSubZone();
  }

  Future<void> fetchSubDistricts() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('kecamatan').get();

      _subDistricts.clear();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        data.keys.forEach((key) {
          dynamic value = data[key];
          if (value != null && !_subDistricts.contains(value.toString())) {
            _subDistricts.add(value.toString());
          }
        });
      });

      if (_subDistricts.isNotEmpty) {
        _selectedSubDistrict = _subDistricts[0];
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchSubZone() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('zone').get();

      _villages.clear();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        data.keys.forEach((key) {
          dynamic value = data[key];
          if (value != null && !villages.contains(value.toString())) {
            _villages.add(value.toString());
          }
        });
      });

      if (_villages.isNotEmpty) {
        _selectedVillage = _villages[0];
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchKondisi() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('kondisi').get();

      _kondisi.clear();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        data.keys.forEach((key) {
          dynamic value = data[key];
          if (value != null && !kondisi.contains(value.toString())) {
            _kondisi.add(value.toString());
          }
        });
      });

      if (_kondisi.isNotEmpty) {
        _selectedKondisi = _kondisi[0];
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void setSelectedSubDistrict(String subDistrict) {
    _selectedSubDistrict = subDistrict;
    notifyListeners(); //
  }

  void setSelectedVillage(String Village) {
    _selectedVillage = Village;
    notifyListeners();
  }

  void setSelectedKondisii(String kondisi) {
    _selectedVillage = kondisi;
    notifyListeners();
  }
}

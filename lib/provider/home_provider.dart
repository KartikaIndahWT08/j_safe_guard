import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> _subDistricts = [];
  String _selectedSubDistrict = '';

  List<String> get subDistricts => _subDistricts;
  String get selectedSubDistrict => _selectedSubDistrict;

  HomeProvider() {
    fetchSubDistricts();
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

      // Jika ada nilai yang ditambahkan, atur nilai pertama sebagai selectedSubDistrict
      if (_subDistricts.isNotEmpty) {
        _selectedSubDistrict = _subDistricts[0];
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void setSelectedSubDistrict(String subDistrict) {
    _selectedSubDistrict = subDistrict;
    notifyListeners();
  }
}

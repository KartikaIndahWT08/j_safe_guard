import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EducationProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, String>> _articles = [];

  List<Map<String, String>> get articles => _articles;

  Future<void> fetchArticles() async {
    try {
      _articles.clear();
      QuerySnapshot educationSnapshot =
          await _firestore.collection('education').get();
      if (educationSnapshot.docs.isNotEmpty) {
        String educationDocId = educationSnapshot.docs.first.id;
        for (int i = 1; i <= 20; i++) {
          QuerySnapshot articleSnapshot = await _firestore
              .collection('education')
              .doc(educationDocId)
              .collection('article$i')
              .get();

          for (var doc in articleSnapshot.docs) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            _articles.add({
              'title': data['Judul'] ?? '',
              'author': data['Penulis'] ?? '',
              'isi': data['Isi'] ?? '',
            });
          }
        }
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
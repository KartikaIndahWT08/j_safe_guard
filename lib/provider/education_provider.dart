// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EducationProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, String>> _articles = [];
  Map<String, String> _articleDetail = {};
  bool _isLoading = false;

  List<Map<String, String>> get articles => _articles;
  Map<String, String> get articleDetail => _articleDetail;
  bool get isLoading => _isLoading;

  Future<void> fetchArticles() async {
    try {
      _isLoading = true;
      notifyListeners();

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

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDetail(int index) async {
    try {
      _isLoading = true;
      notifyListeners();

      QuerySnapshot educationSnapshot =
          await _firestore.collection('education').get();
      if (educationSnapshot.docs.isNotEmpty) {
        String educationDocId = educationSnapshot.docs.first.id;
        String articleCollection = 'article${index + 1}';

        QuerySnapshot articleSnapshot = await _firestore
            .collection('education')
            .doc(educationDocId)
            .collection(articleCollection)
            .get();

        if (articleSnapshot.docs.isNotEmpty) {
          Map<String, dynamic> data =
              articleSnapshot.docs.first.data() as Map<String, dynamic>;
          _articleDetail = {
            'title': data['Judul'] ?? '',
            'author': data['Penulis'] ?? '',
            'isi': data['Isi'] ?? '',
          };
        }
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
      _isLoading = false;
      notifyListeners();
    }
  }
}

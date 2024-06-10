// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, String>> _news = [];
  Map<String, String> _newsDetail = {};

  List<Map<String, String>> get news => _news;
  Map<String, String> get newsDetail => _newsDetail;

  Future<void> fetchNews() async {
    try {
      _news.clear();
      QuerySnapshot newsSnapshot = await _firestore.collection('news').get();
      if (newsSnapshot.docs.isNotEmpty) {
        String newsDocId = newsSnapshot.docs.first.id;
        for (int i = 1; i <= 20; i++) {
          QuerySnapshot beritaSnapshot = await _firestore
              .collection('news')
              .doc(newsDocId)
              .collection('news$i')
              .get();

          for (var doc in beritaSnapshot.docs) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            _news.add({
              'title': data['Judul'] ?? '',
              'date': data['Tanggal'] ?? '',
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

  Future<void> fetchDetail(int index) async {
    try {
      QuerySnapshot newsSnapshotCollection =
          await _firestore.collection('news').get();
      if (newsSnapshotCollection.docs.isNotEmpty) {
        String newsDocId = newsSnapshotCollection.docs.first.id;
        String newsCollection = 'news${index + 1}';

        QuerySnapshot newsSnapshotDetail = await _firestore
            .collection('news')
            .doc(newsDocId)
            .collection(newsCollection)
            .get();

        if (newsSnapshotDetail.docs.isNotEmpty) {
          Map<String, dynamic> data =
              newsSnapshotDetail.docs.first.data() as Map<String, dynamic>;
          _newsDetail = {
            'title': data['Judul'] ?? '',
            'date': data['Tanggal'] ?? '',
            'author': data['Penulis'] ?? '',
            'isi': data['Isi'] ?? '',
          };
          notifyListeners();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}

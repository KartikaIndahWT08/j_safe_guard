// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider with ChangeNotifier {
  String _userId = ''; // Tambahkan properti userId
  String _name = 'guest';
  String _email = 'guest';
  String _location = 'guest';
  String get name => _name;
  String get email => _email;
  String get location => _location;

  // Tambahkan method untuk mengambil userId
  String get userId => _userId;

  Future<void> fetchUser(String userId) async {
    try {
      _userId = userId; // Simpan userId
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        _name = userDoc['name'];
        _email = userDoc['email'];
        _location = userDoc['location'];
        notifyListeners();
      }
    } catch (e) {
      print('Failed to fetch user: $e');
    }
  }

  Future<void> updateUser(String name, String email) async {
    try {
      // Update data user di Firebase Firestore
      await FirebaseFirestore.instance.collection('users').doc(_userId).update({
        'name': name,
        'email': email,
      });

      // Update data di dalam provider
      _name = name;
      _email = email;
      notifyListeners();
    } catch (e) {
      print('Failed to update user: $e');
    }
  }

  Future<void> updatePassword(String newPassword) async {
    try {
      // Menggunakan FirebaseAuth untuk mengupdate password jika currentUser tidak null
      FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
    } catch (e) {
      print('Failed to update password: $e');
      // Tangani pengecualian di sini sesuai kebutuhan Anda
    }
  }
}

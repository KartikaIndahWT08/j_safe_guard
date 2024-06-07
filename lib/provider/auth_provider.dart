import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tes_j_safe_guard/screen/repos/auth_repo/auth_repo.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo _authRepo = AuthRepo();
  User? _user;

  User? get user => _user;

  Future<void> signUp(
      String email, String password, String name, String phoneNumber) async {
    _user = await _authRepo.createUserWithUsernamePassword(
        email, password, name, phoneNumber);
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    _user = await _authRepo.signInWithUsernamePassword(email, password);
    notifyListeners();
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    _user = null;
    notifyListeners();
  }
}

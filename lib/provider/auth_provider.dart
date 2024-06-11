// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:tes_j_safe_guard/screen/repos/auth_repo/auth_repo.dart';
import 'package:tes_j_safe_guard/provider/user_provider.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo _authRepo = AuthRepo();
  User? _user;

  User? get user => _user;

  Future<void> signUp(
      BuildContext context, String email, String password, String name) async {
    _user =
        await _authRepo.createUserWithUsernamePassword(email, password, name);
    await _fetchUserData(context);
    notifyListeners();
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    _user = await _authRepo.signInWithUsernamePassword(email, password);
    await _fetchUserData(context);
    notifyListeners();
  }

  Future<void> _fetchUserData(BuildContext context) async {
    if (_user != null) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.fetchUser(_user!.uid);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    _user = null;
    notifyListeners();
  }
}

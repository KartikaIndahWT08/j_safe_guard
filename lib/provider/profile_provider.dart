import 'package:flutter/material.dart';

// Model untuk profil
class Profile {
  final String id;
  final String username;
  final String email;
  final String password;

  Profile({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });
}

class ProfileProvider extends ChangeNotifier {
  List<Profile> _profiles = [];

  void addProfile(Profile profile) {
    _profiles.add(profile);
    notifyListeners();
  }

  List<Profile> getProfiles() {
    return _profiles;
  }

  void updateProfile(Profile newProfile) {
    final index =
        _profiles.indexWhere((profile) => profile.id == newProfile.id);
    if (index != -1) {
      _profiles[index] = newProfile;
      notifyListeners();
    }
  }

  void deleteProfile(String id) {
    _profiles.removeWhere((profile) => profile.id == id);
    notifyListeners();
  }
}

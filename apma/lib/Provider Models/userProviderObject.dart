import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModel extends ChangeNotifier {
  String email = '';
  // String name = '';
  // String userId = '';


  void updateUser(String email) {
    this.email = email;
    // this.name = name;
    // this.userId = userId;
    notifyListeners();
  }

  void logout() {
    email = '';
    // name = '';
    // userId = '';
    notifyListeners();
  }

  bool isLoggedIn() {
    return email.isNotEmpty;
  }

  String get getEmail => email; 

  // String get getName => name;

}
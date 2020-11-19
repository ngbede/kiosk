// this file handles the onboarding i.e login and signup process
import 'package:flutter/foundation.dart';
import 'package:kiosk/models/account/user.dart';

class Account with ChangeNotifier {
  User _user = User();

  // void register(String name, String email, String surName, String contact,
  //     String password, String confirmPassword) {
  //   user.name = name;
  //   user.email = email;
  //   user.phoneNumber = contact;
  //   user.surName = surName;
  //   if (password == confirmPassword) {
  //     user.password = password;
  //   }
  // }
  void setName(String name) {
    _user.name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _user.email = email;
    notifyListeners();
  }

  void setPassword(String password, String confirmPword) {
    _user.password = password == confirmPword ? password : null;
    notifyListeners();
  }

  void setContact(String phoneNumber) {
    _user.phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setSurname(String surName) {
    _user.surName = surName;
    notifyListeners();
  }

  User getUser() => _user;
}

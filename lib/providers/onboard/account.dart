// this file handles the onboarding i.e login and signup process
import 'package:flutter/foundation.dart';
import 'package:kiosk/models/account/user.dart';

class Account with ChangeNotifier {
  User _user = User();

  void setName(String name) {
    _user.name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _user.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _user.password = password; // == confirmPword ? password : null;
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

  bool fieldsNotNull() {
    bool notNull = false;
    if (_user.email != null &&
        _user.name != null &&
        _user.surName != null &&
        _user.password != null &&
        _user.phoneNumber != null) {
      notNull = true;
    }
    return notNull;
  }

  User getUser() => _user;
}

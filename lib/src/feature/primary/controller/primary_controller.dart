import 'package:flutter/cupertino.dart';

class PrimaryController with ChangeNotifier {
  static final PrimaryController _singleton = PrimaryController._internal();
  factory PrimaryController() => _singleton;
  PrimaryController._internal();

  bool isActiveAccount = true;

  void changeIsActiveAccount(bool value) {
    isActiveAccount = value;
    notifyListeners();
  }
}
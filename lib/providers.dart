import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Providers with ChangeNotifier {
  static late SharedPreferences prefs;
  bool isInit = false;

  Future<void> init() async {
    if (isInit == false) {
      prefs = await SharedPreferences.getInstance();
      notifyListeners();
      isInit = true;
    }
  }
}

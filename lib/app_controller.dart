import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDarkTheme = false;
  double value = 0;

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  void onCounter() {
    value++;
    notifyListeners();
  }
}

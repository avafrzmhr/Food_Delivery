import 'package:flutter/material.dart';

class BottomNavigationProvider with ChangeNotifier {
  int _selectedIndex = 2; // Initial selected index

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // Notify listeners of the change
  }
}

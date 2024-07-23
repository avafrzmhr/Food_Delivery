import 'package:flutter/material.dart';

class LocationProvider with ChangeNotifier {
  double? _lat;
  double? _long;
  bool _isLocationChanged = false;

  double? get lat => _lat;
  double? get long => _long;
  bool get isLocationChanged => _isLocationChanged;

  void updateLocation(double lat, double long) {
    _lat = lat;
    _long = long;
    _isLocationChanged = true;
    notifyListeners();
  }

  void resetLocation() {
    _isLocationChanged = false;
    notifyListeners();
  }
}

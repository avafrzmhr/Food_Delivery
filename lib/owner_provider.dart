import 'package:flutter/foundation.dart';

class OwnerProvider with ChangeNotifier {
  bool _isOwner = true;

  bool get isOwner => _isOwner;

  void setOwner(bool value) {
    _isOwner = value;
    notifyListeners();
  }
}

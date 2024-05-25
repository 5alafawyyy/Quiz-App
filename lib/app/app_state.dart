import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _useMaterial3 = false;

  bool get useMaterial3 => _useMaterial3;

  set useMaterial3(bool value) {
    _useMaterial3 = value;
    debugPrint('Use Material3: $value');
    notifyListeners();
  }
}

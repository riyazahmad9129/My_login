import 'dart:io';

import 'package:flutter/material.dart';

class CheckBoxProvider with ChangeNotifier {
  bool _isChecked = false;

  bool get checked => _isChecked;

  void checkedBox() {
    _isChecked = !_isChecked;
    notifyListeners();
  }
}

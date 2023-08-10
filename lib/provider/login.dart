import 'package:flutter/material.dart';

class PasswordProvider with ChangeNotifier {
  bool _PasswordHidden = true;

  bool get PasswordHidden => _PasswordHidden;

  void passwordHidden() {
    _PasswordHidden = !_PasswordHidden;
    notifyListeners();
  }
}

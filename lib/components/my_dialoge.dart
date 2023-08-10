import 'package:flutter/material.dart';

class DialogClass {
  static showMyDialog(BuildContext context, Widget child) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: child,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_login/my_theme/theme.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;

  final keyboardType;
  final textInputAction;
  final BorderRadius? borderRadius;
  final enabledBorder;
  final Color? fillColor;
  final bool obscureText;
  final textInputType;
  final suffixIcon;

  final String? Function(String?)? validator;

  const MyTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.borderRadius,
    this.enabledBorder,
    this.fillColor,
    this.textInputType,
    this.validator,
    this.hintText,
    this.suffixIcon,
    required this.obscureText,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.2),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.primary, width: 1),
          ),
          focusColor: Colors.blue,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.primary, width: 1),
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.only(left: 15, top: 15),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black45),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.only(left: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white, width: 0.1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white, width: 0.1),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final keyboardType;
  final BorderRadius? borderRadius;
  final enabledBorder;
  final Color? fillColor;
  final textInputType;
  final suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const MyCard(
      {super.key,
      this.controller,
      this.keyboardType,
      this.borderRadius,
      this.enabledBorder,
      this.fillColor,
      this.textInputType,
      this.validator,
      this.hintText,
      this.suffixIcon,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      color: Colors.white,
      elevation: 5,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
            hintText: hintText,
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
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}

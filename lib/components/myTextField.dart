// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.helperText,
      required this.isObscure,
      required this.inputType,
      required this.validator});

  final TextEditingController controller;
  final String label;
  final String hintText;
  final String helperText;
  final bool isObscure;
  final TextInputType inputType;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      obscureText: isObscure,
      decoration: InputDecoration(
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: const OutlineInputBorder(),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade400),
        floatingLabelStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
        helperText: helperText,
        helperStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}

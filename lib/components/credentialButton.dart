// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CredButton extends StatelessWidget {
  const CredButton({super.key, required this.onTap, required this.imageAsset});
  final Function()? onTap;
  final String imageAsset;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Image.asset(
            "assets/img/$imageAsset",
            width: 50,
          ),
        ),
      ),
    );
  }
}

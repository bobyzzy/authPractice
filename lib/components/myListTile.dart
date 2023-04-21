import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  MyListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.ontap,
  });
  final IconData icon;
  final String title;
  Function()? ontap;
  @override
  Widget build(BuildContext context) {
    var listTileStyle = const TextStyle(color: Colors.black, fontSize: 14);
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: listTileStyle,
      ),
      onTap: ontap,
    );
  }
}

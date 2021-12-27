import 'package:flutter/material.dart';

class RegularGroupName extends StatelessWidget {
  final String text;
  final Color color;

  const RegularGroupName(this.text, {this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: color,
      ),
    );
  }
}

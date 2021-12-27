import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegularListTitle extends StatelessWidget {
  final String text;
  final Color color;

  const RegularListTitle(this.text, {this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: color,
      ),
    );
  }
}

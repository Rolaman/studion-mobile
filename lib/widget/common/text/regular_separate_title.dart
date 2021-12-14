import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegularSeparateTitle extends StatelessWidget {
  final String text;
  final Color color;

  const RegularSeparateTitle(this.text, {this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: color,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SmallSeparateTitle extends StatelessWidget {
  final String text;
  final Color color;

  SmallSeparateTitle(this.text, {this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: color,
      ),
    );
  }
}

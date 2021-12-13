import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LargeActionTitle extends StatelessWidget {
  final String text;
  final Color color;

  LargeActionTitle(this.text, {this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: color,
      ),
    );
  }
}

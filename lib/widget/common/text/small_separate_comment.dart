import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studion_mobile/util/theme.dart';

class SmallSeparateComment extends StatelessWidget {
  final String text;
  final Color color;

  const SmallSeparateComment(this.text, {this.color = commonGrey});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: color,
      ),
    );
  }
}

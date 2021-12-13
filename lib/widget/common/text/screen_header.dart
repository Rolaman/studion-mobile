import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenHeader extends StatelessWidget {

  final String name;
  final double leftMargin;

  const ScreenHeader(this.name, {this.leftMargin = 31});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      margin: EdgeInsets.only(
        left: leftMargin,
        top: 10,
        bottom: 20,
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

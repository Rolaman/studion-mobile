import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';

class BackButton extends StatelessWidget {
  final double size;

  const BackButton({this.size = 25});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        LineIcons.angleLeft,
        color: Colors.black,
        size: size,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';

class CloseButton extends StatelessWidget {
  final void Function() action;
  final double size;

  const CloseButton(this.action, {this.size = 25});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        LineIcons.times,
        color: Colors.black,
        size: size,
      ),
      onTap: action,
    );
  }
}

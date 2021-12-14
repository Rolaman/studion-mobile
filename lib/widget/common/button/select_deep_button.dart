import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:studion_mobile/util/theme.dart';

class SelectDeepButton extends StatelessWidget {
  final double size;

  const SelectDeepButton({this.size = 25});

  @override
  Widget build(BuildContext context) {
    return Icon(
      LineIcons.angleRight,
      color: mainColor,
      size: size,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SideMarginDecorator extends StatelessWidget {
  final Widget child;
  final double margin;

  const SideMarginDecorator(this.child, {this.margin = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: child,
    );
  }
}

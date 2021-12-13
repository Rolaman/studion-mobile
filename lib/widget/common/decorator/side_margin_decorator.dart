import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SideMarginDecorator extends StatelessWidget {
  final Widget child;

  const SideMarginDecorator(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: child,
    );
  }
}

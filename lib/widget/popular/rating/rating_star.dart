import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RatingStar extends StatelessWidget {
  final double fulfil;

  RatingStar(this.fulfil);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (rect) {
          return LinearGradient(
            stops: [0, fulfil, fulfil],
            colors: [color, color, color.withOpacity(0)],
          ).createShader(rect);
        },
        child: const Icon(
          Icons.star,
          size: 13,
          color: Colors.white,
        ),
      ),
    );
  }
}

const color = Color(0xFFFFDF6D);
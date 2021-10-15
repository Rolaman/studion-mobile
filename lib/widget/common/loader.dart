import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: LoadingIndicator(
          indicatorType: Indicator.ballClipRotate,
        ),
        width: 50,
      ),
    );
  }
}

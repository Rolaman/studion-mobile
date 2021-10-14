
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoaderScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          child: LoadingIndicator(
            indicatorType: Indicator.ballClipRotate,
          ),
          width: 50,
        ),
      ),
    );
  }

}
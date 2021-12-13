import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RatingNumber extends StatelessWidget {
  final double rating;

  const RatingNumber(this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      child: Text(
        rating.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

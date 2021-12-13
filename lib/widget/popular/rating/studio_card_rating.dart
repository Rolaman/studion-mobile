import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:studion_mobile/widget/popular/rating/rating_number.dart';
import 'package:studion_mobile/widget/popular/rating/rating_star.dart';

class StudioCardRating extends StatelessWidget {
  final double rating;

  const StudioCardRating(this.rating);

  @override
  Widget build(BuildContext context) {
    final starIndices = Iterable.generate(5, (index) => index + 1);
    final stars = starIndices
        .map((index) => RatingStar(min(rating - index + 1, 1)))
        .toList();
    return Container(
      child: Row(
        children: [
          ...stars,
          RatingNumber(rating),
        ],
      ),
    );
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CarouselWithPoints extends StatelessWidget {

  final List<Widget> widgets;

  const CarouselWithPoints(this.widgets);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemCount: widgets.length,
        itemBuilder: (ctx, index) {
          return widgets[index];
        },
        pagination: const SwiperPagination(),
        viewportFraction: 0.85,
      ),
    );
  }
}

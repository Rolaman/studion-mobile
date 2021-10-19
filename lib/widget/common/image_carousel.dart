import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget imageCarousel(List<String> imageUrls) {
  if (imageUrls.isEmpty) {
    return Container(
      child: const Center(
        child: Text(
          'Фото отсутствует',
        ),
      ),
      height: 200,
      color: Colors.black12,
    );
  }
  return CarouselSlider.builder(
    itemCount: imageUrls.length,
    itemBuilder: (ctx, item, page) {
      return SizedBox(
        height: 200,
        width: double.infinity,
        child: Image.network(
          imageUrls[item],
          fit: BoxFit.fill,
        ),
      );
    },
    options: CarouselOptions(),
  );
}

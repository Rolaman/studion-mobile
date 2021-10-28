import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget imageCarousel(List<String> imageUrls) {
  if (imageUrls.isEmpty) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: const Center(
        child: Text(
          'Фото отсутствует',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      height: 200,
      color: Colors.black12,
    );
  }
  return CarouselSlider.builder(
    itemCount: imageUrls.length,
    itemBuilder: (ctx, item, page) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 10,
        ),
        height: 200,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imageUrls[item],
            fit: BoxFit.fill,
          ),
        ),
      );
    },
    options: CarouselOptions(),
  );
}

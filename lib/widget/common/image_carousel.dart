import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

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
            errorBuilder: (ctx, exception, _) {
              return Container(
                color: Colors.black12,
                alignment: AlignmentDirectional.center,
                child: const Text(
                    'Не удалось загрузить изображение'
                ),
              );
            },
            loadingBuilder: (ctx, ch, loadingProgress) {
              if (loadingProgress == null) {
                return ch;
              }
              return SkeletonAnimation(
                shimmerColor: Colors.white54,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300]),
                ),
              );
            },
          ),
        ),
      );
    },
    options: CarouselOptions(),
  );
}

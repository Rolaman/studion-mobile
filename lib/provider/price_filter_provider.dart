import 'package:flutter/material.dart';

class PriceFilterProvider extends ChangeNotifier {
  final priceFromController = TextEditingController();
  final priceToController = TextEditingController();
  int minPrice = 0;
  int maxPrice = 10000;

  void discard() {
    priceToController.clear();
    priceFromController.clear();
    minPrice = 0;
    maxPrice = 10000;
  }

  void change(double min, double max) {
    minPrice = min.toInt();
    maxPrice = max.toInt();
    notifyListeners();
  }

  bool hasActiveFilters() {
    return priceFromController.value.text.isNotEmpty ||
        priceToController.value.text.isNotEmpty;
  }
}

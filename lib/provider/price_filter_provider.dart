import 'package:flutter/material.dart';

class PriceFilterProvider extends ChangeNotifier {
  final priceFromController = TextEditingController();
  final priceToController = TextEditingController();

  void discard() {
    priceToController.clear();
    priceFromController.clear();
  }

  bool hasActiveFilters() {
    return priceFromController.value.text.isNotEmpty ||
        priceToController.value.text.isNotEmpty;
  }
}

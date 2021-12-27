import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceFilterProvider extends ChangeNotifier {
  final priceFromController = TextEditingController();
  final priceToController = TextEditingController();
  SfRangeValues values = const SfRangeValues(100.0, 10000.0);

  void discard() {
    values = const SfRangeValues(100.0, 10000.0);
  }

  void change(SfRangeValues value) {
    values = value;
    notifyListeners();
  }

  bool hasActiveFilters() {
    return priceFromController.value.text.isNotEmpty ||
        priceToController.value.text.isNotEmpty;
  }
}

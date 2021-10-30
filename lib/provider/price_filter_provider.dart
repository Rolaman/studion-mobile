import 'package:flutter/material.dart';

class PriceFilterProvider extends ChangeNotifier {

  final priceFromController = TextEditingController();
  final priceToController = TextEditingController();

  void discard() {
    priceToController.clear();
    priceFromController.clear();
  }

}
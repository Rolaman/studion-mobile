import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';

class SearchTypeProvider extends ChangeNotifier {
  FilterType _state = FilterType.room;

  FilterType getCurrent() {
    return _state;
  }

  void change(FilterType state) {
    _state = state;
    notifyListeners();
  }

}

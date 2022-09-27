import 'package:flutter/material.dart';
import 'package:studion_mobile/model/city_dto.dart';

class CurrentCityProvider extends ChangeNotifier {
  late CityItem currentCity;

  Future<void> change(CityItem city) async {
    currentCity = city;
  }
}

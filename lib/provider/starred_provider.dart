import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StarredProvider extends ChangeNotifier {

  Future<List<String>> getStarredStudios() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('starredStudios') ?? List.empty();
  }

  Future<List<String>> getStarredRooms() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('starredRooms') ?? List.empty();
  }

  Future<void> addStarredStudio(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldStudios = prefs.getStringList('starredStudios') ?? List.empty(growable: true);
    final newStudios = oldStudios.toSet();
    newStudios.add(id);
    prefs.setStringList('starredStudios', newStudios.toList());
    notifyListeners();
  }

  Future<void> addStarredRoom(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldRooms = prefs.getStringList('starredRooms') ?? List.empty(growable: true);
    final newRooms = oldRooms.toSet();
    newRooms.add(id);
    prefs.setStringList('starredRooms', newRooms.toList());
    notifyListeners();
  }

  Future<void> removeStarredStudio(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldStudios = prefs.getStringList('starredStudios') ?? List.empty(growable: true);
    final newStudios = oldStudios.toSet();
    newStudios.remove(id);
    prefs.setStringList('starredStudios', newStudios.toList());
    notifyListeners();
  }

  Future<void> removeStarredRoom(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldRooms = prefs.getStringList('starredRooms') ?? List.empty(growable: true);
    final newRooms = oldRooms.toSet();
    newRooms.remove(id);
    prefs.setStringList('starredRooms', newRooms.toList());
    notifyListeners();
  }

}
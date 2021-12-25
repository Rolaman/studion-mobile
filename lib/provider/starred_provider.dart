import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StarredProvider extends ChangeNotifier {
  List<String> studioIds = [];
  List<String> roomIds = [];

  Future<void> fetch() async {
    final prefs = await SharedPreferences.getInstance();
    final studios = prefs.getStringList('starredStudios') ?? List.empty();
    final rooms = prefs.getStringList('starredRooms') ?? List.empty();
    studioIds = studios;
    roomIds = rooms;
  }

  Future<void> addStarredStudio(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldStudios =
        prefs.getStringList('starredStudios') ?? List.empty(growable: true);
    final newStudios = oldStudios.toSet().toList();
    newStudios.add(id);
    await prefs.setStringList('starredStudios', newStudios);
    studioIds = newStudios;
    notifyListeners();
  }

  Future<void> addStarredRoom(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldRooms =
        prefs.getStringList('starredRooms') ?? List.empty(growable: true);
    final newRooms = oldRooms.toSet().toList();
    newRooms.add(id);
    await prefs.setStringList('starredRooms', newRooms);
    roomIds = newRooms;
    notifyListeners();
  }

  Future<void> removeStarredStudio(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldStudios =
        prefs.getStringList('starredStudios') ?? List.empty(growable: true);
    final newStudios = oldStudios.toSet().toList();
    newStudios.remove(id);
    await prefs.setStringList('starredStudios', newStudios);
    studioIds = newStudios;
    notifyListeners();
  }

  Future<void> removeStarredRoom(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldRooms =
        prefs.getStringList('starredRooms') ?? List.empty(growable: true);
    final newRooms = oldRooms.toSet().toList();
    newRooms.remove(id);
    await prefs.setStringList('starredRooms', newRooms);
    roomIds = newRooms;
    notifyListeners();
  }

  Future<void> changeStarredStudio(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldStudios =
        prefs.getStringList('starredStudios') ?? List.empty(growable: true);
    final newStudios = oldStudios;
    if (newStudios.contains(id)) {
      newStudios.remove(id);
    } else {
      newStudios.add(id);
    }
    await prefs.setStringList('starredStudios', newStudios);
    studioIds = newStudios;
    notifyListeners();
  }

  Future<void> changeStarredRoom(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final oldRooms =
        prefs.getStringList('starredRooms') ?? List.empty(growable: true);
    final newRooms = oldRooms;
    if (newRooms.contains(id)) {
      newRooms.remove(id);
    } else {
      newRooms.add(id);
    }
    await prefs.setStringList('starredRooms', newRooms);
    roomIds = newRooms;
    notifyListeners();
  }
}

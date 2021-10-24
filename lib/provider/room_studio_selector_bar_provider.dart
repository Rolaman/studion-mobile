import 'package:flutter/material.dart';

class RoomStudioSelectorBarProvider extends ChangeNotifier {
  RoomStudioSelectorState _state = RoomStudioSelectorState.room;

  RoomStudioSelectorState getCurrent() {
    return _state;
  }

  void change(RoomStudioSelectorState state) {
    _state = state;
    notifyListeners();
  }

}

enum RoomStudioSelectorState {
  room,
  studio,
}
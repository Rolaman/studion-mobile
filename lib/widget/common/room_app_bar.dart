import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/room_dto.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';

AppBar roomAppBar() {
  return AppBar(
    title: Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: RoomSearchField(),
      ),
    ),
  );
}

class RoomSearchField extends StatefulWidget {

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<RoomSearchField> {

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (text) {
        Provider.of<RoomListProvider>(context, listen: false).get(RoomListRequest(
          text: text,
        ));
      },
      textInputAction: TextInputAction.search,
      controller: textController,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Provider.of<RoomListProvider>(context, listen: false).get(RoomListRequest());
              textController.clear();
            },
          ),
          hintText: 'Поиск'
      ),
    );
  }
}

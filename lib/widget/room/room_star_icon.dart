import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';

class RoomStarIcon extends StatelessWidget {
  final String roomId;

  const RoomStarIcon(this.roomId);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StarredProvider>(context, listen: false);

    if (provider.roomIds.contains(roomId)) {
      return IconButton(
        onPressed: () {
          provider.addStarredRoom(roomId);
        },
        icon: const Icon(
          CupertinoIcons.star,
        ),
      );
    }
    return IconButton(
      onPressed: () {
        provider.removeStarredRoom(roomId);
      },
      icon: const Icon(
        CupertinoIcons.star_fill,
      ),
    );
  }
}

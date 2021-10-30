import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';

class RoomStarIcon extends StatelessWidget {
  final String roomId;

  const RoomStarIcon(this.roomId);

  @override
  Widget build(BuildContext context) {
    return Consumer<StarredProvider>(builder: (ctx, provider, _) {
      return FutureBuilder(
          future: provider.getStarredRooms(),
          builder: (ctx, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done ||
                (snapshot.hasData && !snapshot.data!.contains(roomId))) {
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
          });
    });
  }
}

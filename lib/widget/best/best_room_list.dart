import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';
import 'package:studion_mobile/widget/room/room_list_card.dart';

class BestRoomList extends StatelessWidget {
  const BestRoomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StarredProvider>(context, listen: false);
    final starredRooms = provider.roomIds;

    return Consumer<RoomListProvider>(
      builder: (_, provider, ch) {
        final rooms = provider.best;
        return Container(
          margin: const EdgeInsets.only(
            left: 30,
            top: 23,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                child: const RegularSeparateTitle('Лучшие предложения'),
              ),
              const SizedBox(height: 24),
              ...rooms.map((e) => RoomListCard(
                    e,
                    starredRooms.contains(e.id),
                    Key(e.id),
                  ))
            ],
          ),
        );
      },
    );
  }
}

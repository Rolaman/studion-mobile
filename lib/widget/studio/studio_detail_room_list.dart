import 'package:flutter/material.dart';
import 'package:studion_mobile/model/room_dto.dart';
import 'package:studion_mobile/screen/room_detail_screen.dart';
import 'package:studion_mobile/widget/common/carousel_with_points.dart';
import 'package:studion_mobile/widget/common/loader.dart';

class StudioDetailRoomList extends StatelessWidget {
  final List<RoomItem>? rooms;

  const StudioDetailRoomList(this.rooms);

  @override
  Widget build(BuildContext context) {
    if (rooms == null) {
      return Loader();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 15,
              right: 15,
            ),
            child: const Text(
              'Залы',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          CarouselWithPoints(
              rooms!.map((e) => StudioDetailRoomItem(e, Key(e.name))).toList()),
        ],
      ),
    );
  }
}

class StudioDetailRoomItem extends StatelessWidget {
  final RoomItem room;

  const StudioDetailRoomItem(this.room, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RoomDetailScreen.routeName,
          arguments: room.id,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        alignment: AlignmentDirectional.topStart,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  room.imageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    room.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

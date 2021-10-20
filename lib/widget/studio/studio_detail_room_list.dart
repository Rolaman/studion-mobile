import 'package:flutter/material.dart';
import 'package:studion_mobile/model/room_dto.dart';
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
        horizontal: 5,
        vertical: 10,
      ),
      child: Column(

        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              'Залы',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
    return Container(
      // width: double.infinity,
      alignment: AlignmentDirectional.topStart,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              room.imageUrl!,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

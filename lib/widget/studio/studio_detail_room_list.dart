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
        vertical: 10,
      ),
      child: Column(

        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.only(
              bottom: 5,
              left: 5,
              right: 5,
            ),
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
                color: Colors.black87,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(room.name,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:studion_mobile/model/room_dto.dart';
import 'package:studion_mobile/screen/room_detail_screen.dart';

class RoomCard extends StatelessWidget {
  final RoomItem room;

  const RoomCard(this.room, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toDetailPage(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: SizedBox(
          height: 200,
          child: Stack(
            children: [
              room.imageUrl != null
                  ? SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        room.imageUrl!,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Container(
                      height: 200,
                      color: Colors.black12,
                      child: const Center(
                        child: Text(
                          'Фото отсутствует',
                        ),
                      ),
                    ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  height: 40,
                  color: Colors.grey.withOpacity(0.5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text(
                              room.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            margin: const EdgeInsets.only(
                              left: 15,
                              top: 10,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              right: 15,
                              top: 5,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void toDetailPage(BuildContext context) {
    Navigator.of(context)
        .pushNamed(RoomDetailScreen.routeName, arguments: room.id);
  }
}

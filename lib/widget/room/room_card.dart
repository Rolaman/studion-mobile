import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/room_dto.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/provider/metro_provider.dart';
import 'package:studion_mobile/screen/room_detail_screen.dart';
import 'package:studion_mobile/widget/common/current_metros_bar.dart';

class RoomCard extends StatelessWidget {
  final RoomItem room;

  const RoomCard(this.room, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final city =
        Provider.of<CityProvider>(context, listen: false).getCurrentSync();
    final metros = Provider.of<MetroProvider>(context, listen: false)
        .getByIds(city.id, room.metros);
    return InkWell(
      onTap: () => toDetailPage(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  room.imageUrl != null
                      ? SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              room.imageUrl!,
                              fit: BoxFit.fill,
                            ),
                          ))
                      : Container(
                          height: 200,
                          color: Colors.black12,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Text(
                              'Фото отсутствует',
                            ),
                          ),
                        ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
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
            Container(
              margin: const EdgeInsets.only(
                top: 8,
              ),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                room.address,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: LineIcon.thLarge(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 5,
                          right: 10,
                        ),
                        child: Text(
                          room.area.toString() + " м\u00B2",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 1.2,
                        child: LineIcon.arrowUp(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 5,
                          right: 30,
                        ),
                        child: Text(
                          (room.height / 10).toString() + " м",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(150, 30)),
                    ),
                    onPressed: () => toDetailPage(context),
                    child: Text(
                      'От ${room.price} руб.',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CurrentMetrosBar(metros),
          ],
        ),
      ),
    );
  }

  void toDetailPage(BuildContext context) {
    Navigator.of(context)
        .pushNamed(RoomDetailScreen.routeName, arguments: room.id);
  }
}

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/widget/common/address_info.dart';
import 'package:studion_mobile/widget/common/calendar_button.dart';
import 'package:studion_mobile/widget/common/helper.dart';
import 'package:studion_mobile/widget/common/image_carousel.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/common/working_hour_info.dart';
import 'package:studion_mobile/widget/room/room_characteristics.dart';
import 'package:studion_mobile/widget/room/room_star_icon.dart';
import 'package:studion_mobile/widget/room/room_to_studio_field.dart';

class RoomDetailScreen extends StatelessWidget {
  static const routeName = '/room';

  @override
  Widget build(BuildContext context) {
    final roomId = ModalRoute.of(context)!.settings.arguments as String;
    final room = Provider.of<RoomListProvider>(context).byId(roomId);

    return Scaffold(
      body: ListView(
        children: [
          imageCarousel(room.images),
          AddressInfo(room.address),
          WorkingHourInfo(room.startHour, room.endHour),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 30,
                    left: 15,
                  ),
                  child: Text(
                    'от ${room.price} руб./ч',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              room.calendar != null
                  ? Expanded(child: CalendarButton(room.calendar!))
                  : const SizedBox(),
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          room.description != null
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                  ),
                  child: ExpandableText(
                    formatText(room.description!),
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                    expandText: 'Подробнее',
                    collapseText: 'Свернуть',
                    maxLines: 5,
                  ),
                )
              : const SizedBox(
                  height: 0,
                ),
          ToStudioField(room.studioId),
          const Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
          ),
          RoomCharacteristics(room),
        ],
      ),
      bottomNavigationBar: CommonNavigationBar(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          room.name,
        ),
        actions: [
          RoomStarIcon(roomId),
        ],
      ),
    );
  }
}

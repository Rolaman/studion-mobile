import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/widget/common/helper.dart';
import 'package:studion_mobile/widget/common/image_carousel.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/room/room_characteristics.dart';

class RoomDetailScreen extends StatelessWidget {
  static const routeName = '/room';

  @override
  Widget build(BuildContext context) {
    final roomId = ModalRoute.of(context)!.settings.arguments as String;
    final room = Provider.of<RoomListProvider>(context).getOne(roomId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageCarousel(room.imageUrls),
            room.description != null
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 5,
                    ),
                    child: ExpandableText(
                      formatText(room.description!),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      expandText: 'Подробнее',
                      collapseText: 'Свернуть',
                      maxLines: 5,
                    ),
                  )
                : const SizedBox(
                    height: 0,
                  ),
            RoomCharacteristics(room),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
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
      ),
    );
  }
}

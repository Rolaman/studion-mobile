import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/helper.dart';
import 'package:studion_mobile/widget/common/image_carousel.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/studio/studio_detail_room_list.dart';
import 'package:studion_mobile/widget/studio/address_block.dart';
import 'package:studion_mobile/widget/studio/equipments_block.dart';

class StudioDetailScreen extends StatelessWidget {
  static const routeName = '/studio';

  @override
  Widget build(BuildContext context) {
    final studioId = ModalRoute.of(context)!.settings.arguments as String;
    final studio = Provider.of<StudioListProvider>(context).getOne(studioId);
    final roomProvider = Provider.of<RoomListProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageCarousel(studio.imageUrls),
            AddressBlock(studio.address),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            studio.description != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ExpandableText(
                      formatText(studio.description!),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      expandText: 'Подробнее',
                      collapseText: 'Свернуть',
                      maxLines: 5,
                    ),
                  )
                : const SizedBox(
                    height: 1,
                  ),
            EquipmentList(studio.equipments),
            StudioDetailRoomList(roomProvider.getByStudioId(studioId)),
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
          studio.name,
        ),
      ),
    );
  }
}

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/address_info.dart';
import 'package:studion_mobile/widget/common/calendar_button.dart';
import 'package:studion_mobile/widget/common/helper.dart';
import 'package:studion_mobile/widget/common/image_carousel.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/common/working_hour_info.dart';
import 'package:studion_mobile/widget/room/room_characteristics.dart';
import 'package:studion_mobile/widget/studio/facilities_info.dart';
import 'package:studion_mobile/widget/studio/contact_info.dart';
import 'package:studion_mobile/widget/studio/studio_detail_room_list.dart';
import 'package:studion_mobile/widget/studio/studio_path_instruction.dart';
import 'package:studion_mobile/widget/studio/studio_star_icon.dart';

class StudioDetailScreen extends StatelessWidget {
  static const routeName = '/studio';

  @override
  Widget build(BuildContext context) {
    final studioId = ModalRoute.of(context)!.settings.arguments as String;
    final studio = Provider.of<StudioListProvider>(context).getOne(studioId);
    final roomProvider = Provider.of<RoomListProvider>(context, listen: false);
    final rooms = roomProvider.getByStudioId(studioId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageCarousel(studio.imageUrls),
            studio.address != null
                ? AddressInfo(studio.address!)
                : const SizedBox(
                    height: 5,
                  ),
            WorkingHourInfo(studio.startHour, studio.endHour),
            studio.mobile != null
                ? ContactInfo(
                    studio.mobile!,
                    siteUrl: studio.siteUrl,
                    vkUrl: studio.vkUrl,
                    instagramUrl: studio.instagramUrl,
                  )
                : const SizedBox(),
            studio.calendarUrl != null
                ? SizedBox(
                    width: double.infinity,
                    child: StudioCalendarButton(studio.calendarUrl!))
                : const SizedBox(),
            const Divider(
              thickness: 2,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            studio.description != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ExpandableText(
                      formatText(studio.description!),
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      expandText: '??????????????????',
                      collapseText: '????????????????',
                      maxLines: 5,
                    ),
                  )
                : const SizedBox(
                    height: 1,
                  ),
            studio.equipments.isNotEmpty
                ? EquipmentInfo(studio.equipments)
                : const SizedBox(),
            rooms.isNotEmpty ? StudioDetailRoomList(rooms) : const SizedBox(),
            studio.characteristics.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: CharacteristicsInfo(studio.characteristics),
                  )
                : const SizedBox(),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: FacilitiesInfo(studio.facilities),
            ),
            studio.pathInstruction != null
                ? Container(
                    margin: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 20,
                    ),
                    child: StudioPathInstruction(studio.pathInstruction!),
                  )
                : const SizedBox(),
          ],
        ),
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
          studio.name,
        ),
        actions: [
          StudioStarIcon(studioId),
        ],
      ),
    );
  }
}

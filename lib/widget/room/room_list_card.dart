import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/room_dto.dart';
import 'package:studion_mobile/provider/starred_provider.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/button/favourite_button.dart';
import 'package:studion_mobile/widget/common/card/medium_item_image_card.dart';
import 'package:studion_mobile/widget/common/info/area_info.dart';
import 'package:studion_mobile/widget/common/info/height_info.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';

class RoomListCard extends StatelessWidget {
  final RoomItem item;
  final bool starred;

  const RoomListCard(this.item, this.starred, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StarredProvider>(context, listen: false);
    return Container(
      width: 330,
      height: 110,
      margin: const EdgeInsets.only(
        bottom: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MediumItemImageCard(
            image: Image.network(
              item.imageUrl!,
              fit: BoxFit.cover,
            ),
            action: FavouriteButton(
              starred,
              () => provider.changeStarredRoom(item.id),
              size: 23,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularSeparateTitle(item.name),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Row(
                    children: [
                      SmallSeparateTitle(
                        item.price.toString(),
                        color: mainColor,
                      ),
                      const SmallSeparateTitle(
                        ' / час',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      AreaInfo(item.area),
                      const SizedBox(
                        width: 10,
                      ),
                      HeightInfo(item.height),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/provider/starred_provider.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/button/favourite_button.dart';
import 'package:studion_mobile/widget/common/card/full_width_item_image_card.dart';
import 'package:studion_mobile/widget/common/info/area_info.dart';
import 'package:studion_mobile/widget/common/info/height_info.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';

class StudioStarredListCard extends StatelessWidget {
  final StudioItem item;
  final bool starred;

  const StudioStarredListCard(this.item, this.starred, Key key)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StarredProvider>(context, listen: false);
    return Container(
      height: 254,
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: cleanWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          FullWidthItemImageCard(
            image: Image.network(
              item.image!,
              fit: BoxFit.cover,
            ),
            action: FavouriteButton(
              starred,
              () => provider.changeStarredStudio(item.id),
              size: 40,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              top: 12,
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
                        item.price.toString() + '₽',
                        color: mainColor,
                      ),
                      const SmallSeparateTitle(
                        ' / час',
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      AreaInfo(item.area),
                      const SizedBox(
                        width: 10,
                      ),
                      HeightInfo(item.height),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

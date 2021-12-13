import 'package:flutter/widgets.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/button/favourite_button.dart';
import 'package:studion_mobile/widget/common/card/medium_item_image_card.dart';
import 'package:studion_mobile/widget/common/info/area_info.dart';
import 'package:studion_mobile/widget/common/info/height_info.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';

class StudioListCard extends StatelessWidget {
  final StudioItem item;

  const StudioListCard(this.item, key) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              item.popular,
              () {
                // TODO
              },
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
                      SmallSeparateTitle(
                        ' / час',
                        color: commonGrey,
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

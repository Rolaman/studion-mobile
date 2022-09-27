import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/provider/starred_provider.dart';
import 'package:studion_mobile/widget/common/button/favourite_button.dart';
import 'package:studion_mobile/widget/popular/rating/studio_card_rating.dart';

class LargeStudioCard extends StatelessWidget {
  final StudioItem studio;
  final bool starred;

  const LargeStudioCard(this.studio, this.starred, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StarredProvider>(context, listen: false);
    return SizedBox(
      width: 270,
      height: 300,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          SizedBox(
            width: 270,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                studio.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 27,
              left: 30,
              right: 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StudioCardRating(studio.rating),
                const SizedBox(height: 7),
                Text(
                  studio.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topEnd,
            margin: const EdgeInsets.only(
              right: 15,
              top: 15,
            ),
            child: FavouriteButton(starred, () {
              provider.changeStarredStudio(studio.id);
            }),
          )
        ],
      ),
    );
  }
}

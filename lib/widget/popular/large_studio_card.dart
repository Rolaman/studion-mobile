import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/widget/common/button/favourite_button.dart';
import 'package:studion_mobile/widget/popular/rating/studio_card_rating.dart';

class LargeStudioCard extends StatelessWidget {
  final StudioItem studio;

  const LargeStudioCard(this.studio, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 300,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            width: 270,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                studio.imageUrl!,
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
            child: FavouriteButton(studio.popular, () {
              // TODO: call to firebase
            }),
          )
        ],
      ),
    );
  }
}

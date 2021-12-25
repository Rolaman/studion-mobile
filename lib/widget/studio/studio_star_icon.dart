import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';

class StudioStarIcon extends StatelessWidget {
  final String studioId;

  const StudioStarIcon(this.studioId);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StarredProvider>(context, listen: false);

    if (provider.studioIds.contains(studioId)) {
      return IconButton(
        onPressed: () {
          provider.addStarredStudio(studioId);
        },
        icon: const Icon(
          CupertinoIcons.star,
        ),
      );
    }
    return IconButton(
      onPressed: () {
        provider.removeStarredStudio(studioId);
      },
      icon: const Icon(
        CupertinoIcons.star_fill,
      ),
    );
  }
}

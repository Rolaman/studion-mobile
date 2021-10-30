import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';

class StudioStarIcon extends StatelessWidget {
  final String studioId;

  const StudioStarIcon(this.studioId);

  @override
  Widget build(BuildContext context) {
    return Consumer<StarredProvider>(builder: (ctx, provider, _) {
      return FutureBuilder(
          future: provider.getStarredStudios(),
          builder: (ctx, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done ||
                (snapshot.hasData && !snapshot.data!.contains(studioId))) {
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
          });
    });
  }
}

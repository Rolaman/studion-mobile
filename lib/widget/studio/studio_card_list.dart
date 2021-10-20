import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/loader.dart';
import 'package:studion_mobile/widget/studio/studio_card.dart';

class StudioCardList extends StatefulWidget {
  @override
  _StudioCardListState createState() => _StudioCardListState();
}

class _StudioCardListState extends State<StudioCardList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StudioListProvider>(
      builder: (_, provider, ch) {
        return FutureBuilder(
            future: provider.get(StudioListRequest()),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Loader(),
                );
              }
              return SizedBox.expand(
                child: ListView.builder(
                  padding: const EdgeInsets.all(3),
                  itemCount: provider.items.length,
                  itemBuilder: (ctx, i) => StudioCard(
                      provider.items[i], Key(provider.items[i].name)),
                ),
              );
            });
      },
    );
  }
}

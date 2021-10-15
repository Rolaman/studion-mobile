import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/studio/studio_dto.dart';
import 'package:studion_mobile/provider/appdata_provider.dart';
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
    return FutureBuilder(
      future: Provider.of<StudioListProvider>(context, listen: false)
          .get(StudioListRequest()),
      builder: (ctx, AsyncSnapshot<StudioListResponse> dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return Loader();
        }
        if (dataSnapshot.error != null) {
          return Center(
            child: Text('Произошла ошибка: ${dataSnapshot.error}'),
          );
        }
        return Container(
          padding: const EdgeInsets.only(top: 25),
          child: SizedBox.expand(
            child: ListView.builder(
              padding: const EdgeInsets.all(3),
              itemCount: dataSnapshot.data!.studios.length,
              itemBuilder: (ctx, i) => StudioCard(dataSnapshot.data!.studios[i],
                  Key(dataSnapshot.data!.studios[i].name)),
            ),
          ),
        );
      },
    );
  }
}

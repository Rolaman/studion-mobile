import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/screen/studio_detail_screen.dart';

class ToStudioField extends StatelessWidget {
  final String studioId;

  const ToStudioField(this.studioId) : super(key: const Key('toStudioField'));

  @override
  Widget build(BuildContext context) {
    final studioFuture = Provider.of<StudioListProvider>(context, listen: false)
        .getOneAsync(studioId);

    return FutureBuilder(
      future: studioFuture,
      builder: (ctx, AsyncSnapshot<StudioItem> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            child: const CircularProgressIndicator(),
          );
        }
        return Container(
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 15,
                    ),
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        snapshot.data!.imageUrl!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      snapshot.data!.name,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    StudioDetailScreen.routeName,
                    arguments: studioId,
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        );
      },
    );
  }
}

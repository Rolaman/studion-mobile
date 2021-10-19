import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/image_carousel.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';

class StudioDetailScreen extends StatelessWidget {
  static const routeName = '/studio';

  @override
  Widget build(BuildContext context) {
    final studioId = ModalRoute.of(context)!.settings.arguments as String;
    final studio = Provider.of<StudioListProvider>(context).getOne(studioId);

    return Scaffold(
      body: Column(
        children: [
          imageCarousel(studio.imageUrls),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          studio.description != null
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ExpandableText(
                    studio.description!,
                    expandText: 'Подробнее',
                    collapseText: 'Свернуть',
                    maxLines: 5,
                  ),
              )
              : const SizedBox(
                  height: 1,
                )
        ],
      ),
      bottomNavigationBar: NavigationBar(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          studio.name,
        ),
      ),
    );
  }
}

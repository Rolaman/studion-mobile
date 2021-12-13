import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/text/large_action_title.dart';
import 'package:studion_mobile/widget/popular/large_action_card.dart';
import 'package:studion_mobile/widget/popular/large_studio_card.dart';
import 'package:studion_mobile/widget/popular/popular_studio_list_header.dart';

class PopularStudioList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<StudioListProvider>(
      builder: (_, provider, ch) {
        final studios = provider.popular;
        return Column(
          children: [
            PopularStudioListHeader(studios.length),
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: studios.length + 3,
                itemBuilder: (ctx, i) {
                  if (i == 0 || i == studios.length + 2) {
                    return const SizedBox(
                      width: 20,
                    );
                  }
                  if (i == studios.length + 1) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: LargeActionCard(
                        child: LargeActionTitle(
                          'Больше',
                          color: Colors.white,
                        ),
                        action: () {},
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: LargeStudioCard(studios[i - 1], Key(studios[i - 1].id)),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

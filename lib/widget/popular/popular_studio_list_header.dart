import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';

class PopularStudioListHeader extends StatelessWidget {
  final int count;

  const PopularStudioListHeader(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        bottom: 16,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallSeparateTitle('$count студий'),
          SmallSeparateTitle(
            'Cмотреть все',
            color: mainColor,
          ),
        ],
      ),
    );
  }
}

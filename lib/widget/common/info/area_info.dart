import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';

class AreaInfo extends StatelessWidget {
  final int area;

  const AreaInfo(this.area);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LineIcon.thLarge(
          color: Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 2,),
        SmallSeparateTitle(
          area.toString() + " м\u00B2",
          color: Colors.grey,
        ),
      ],
    );
  }
}

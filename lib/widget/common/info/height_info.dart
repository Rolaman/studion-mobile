import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';

class HeightInfo extends StatelessWidget {
  final int height;

  const HeightInfo(this.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LineIcon.arrowUp(
          color: Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 2,),
        SmallSeparateTitle(
          height.toString() + " м",
          color: Colors.grey,
        ),
      ],
    );
  }
}

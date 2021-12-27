import 'package:flutter/material.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/button/back_button.dart';
import 'package:studion_mobile/widget/common/decorator/side_margin_decorator.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';

class FilterTypeHeader extends StatelessWidget {
  final String name;
  final Function() resetAction;

  const FilterTypeHeader(this.name, this.resetAction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 25,
      ),
      child: SideMarginDecorator(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 45,
              ),
              child: const ScreenBackButton(),
            ),
            RegularSeparateTitle(name),
            GestureDetector(
              child: const RegularSeparateTitle(
                'Сбросить',
                color: mainColor,
              ),
              onTap: () {
                resetAction();
              },
            ),
          ],
        ),
        margin: 20,
      ),
    );
  }
}

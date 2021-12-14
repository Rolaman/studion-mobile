import 'package:flutter/widgets.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/button/close_button.dart';
import 'package:studion_mobile/widget/common/decorator/side_margin_decorator.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';

class FiltersHeader extends StatelessWidget {
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
                right: 32,
              ),
              child: CloseButton(() {}),
              // TODO: the same logic as Готово button, should I remove it
            ),
            const RegularSeparateTitle(
              'Фильтры',
            ),
            GestureDetector(
              child: const RegularSeparateTitle(
                'Готово',
                color: mainColor,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        margin: 20,
      ),
    );
  }
}

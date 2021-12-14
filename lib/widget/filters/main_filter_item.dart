import 'package:flutter/widgets.dart';
import 'package:studion_mobile/widget/common/button/select_deep_button.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';

class MainFilterItem extends StatelessWidget {
  final String title;
  final Function(BuildContext context) action;

  const MainFilterItem(this.title, this.action);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        action(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RegularSeparateTitle(title),
          const SelectDeepButton(),
        ],
      ),
    );
  }
}

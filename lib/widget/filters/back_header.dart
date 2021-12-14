import 'package:flutter/widgets.dart';
import 'package:studion_mobile/widget/common/button/back_button.dart';
import 'package:studion_mobile/widget/common/decorator/side_margin_decorator.dart';

class BackHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 25,
      ),
      child: SideMarginDecorator(
        Container(
          margin: const EdgeInsets.only(
            right: 32,
          ),
          child: const BackButton(),
        ),
        margin: 20,
      ),
    );
  }
}

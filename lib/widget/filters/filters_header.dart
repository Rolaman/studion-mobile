import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/button/close_button.dart';
import 'package:studion_mobile/widget/common/decorator/side_margin_decorator.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';

class FiltersHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FiltersProvider>(context, listen: false);
    final filterPriceProvider =
        Provider.of<PriceFilterProvider>(context, listen: false);
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
              child: CloseButton(() {
                filterProvider.discard();
                filterPriceProvider.discard();
                Navigator.of(context).pop();
              }),
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

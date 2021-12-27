import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';

class PriceFilterCurrent extends StatefulWidget {

  @override
  _PriceFilterCurrentState createState() => _PriceFilterCurrentState();
}

class _PriceFilterCurrentState extends State<PriceFilterCurrent> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PriceFilterProvider>(context);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RegularSeparateTitle('${provider.values.start.toInt()}₽'),
          RegularSeparateTitle('${provider.values.end.toInt()}₽'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/loader.dart';
import 'package:studion_mobile/widget/studio/studio_card.dart';

class StudioCardList extends StatefulWidget {
  @override
  _StudioCardListState createState() => _StudioCardListState();
}

class _StudioCardListState extends State<StudioCardList> {

  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<StudioListProvider>(context).get(StudioListRequest()).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StudioListProvider>(
      builder: (_, provider, ch) {
        return _isLoading ? Center(
          child: Loader(),
        ) :SizedBox.expand(
                child: ListView.builder(
                  padding: const EdgeInsets.all(3),
                  itemCount: provider.items.length,
                  itemBuilder: (ctx, i) => StudioCard(provider.items[i],
                      Key(provider.items[i].name)),
                ),
              );
      },

    );
  }
}

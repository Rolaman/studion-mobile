import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/room_dto.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/widget/common/loader.dart';
import 'package:studion_mobile/widget/room/room_card.dart';

class RoomCardList extends StatefulWidget {
  @override
  _RoomCardListState createState() => _RoomCardListState();
}

class _RoomCardListState extends State<RoomCardList> {
  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<RoomListProvider>(context).get(RoomListRequest()).then((_) {
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
    return Consumer<RoomListProvider>(
      builder: (_, provider, ch) {
        return _isLoading
            ? Center(
                child: Loader(),
              )
            : SizedBox.expand(
                child: ListView.builder(
                  padding: const EdgeInsets.all(3),
                  itemCount: provider.items.length,
                  itemBuilder: (ctx, i) =>
                      RoomCard(provider.items[i], Key(provider.items[i].name)),
                ),
              );
      },
    );
  }
}

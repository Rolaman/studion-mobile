import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';

AppBar studioAppBar() {
  return AppBar(
    title: Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: StudioSearchField(),
      ),
    ),
  );
}

class StudioSearchField extends StatefulWidget {

  @override
  _StudioSearchFieldState createState() => _StudioSearchFieldState();
}

class _StudioSearchFieldState extends State<StudioSearchField> {

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (text) {
        Provider.of<StudioListProvider>(context, listen: false).get(StudioListRequest(
          text: text,
        ));
      },
      textInputAction: TextInputAction.search,
      controller: textController,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Provider.of<StudioListProvider>(context, listen: false).get(StudioListRequest());
              textController.clear();
            },
          ),
          hintText: 'Поиск'
      ),
    );
  }
}

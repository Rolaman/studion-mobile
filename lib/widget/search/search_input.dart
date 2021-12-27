import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/search_text_type_provider.dart';
import 'package:studion_mobile/util/theme.dart';

class SearchInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final searchTextTypeProvider = Provider.of<SearchTextTypeProvider>(context, listen: false);

    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
      ),
      alignment: AlignmentDirectional.topStart,
      margin: const EdgeInsets.only(
        left: 25,
        right: 5,
      ),
      height: 54,
      width: MediaQuery.of(context).size.width - 120,
      child: TextField(
        style: const TextStyle(
          fontSize: 17,
        ),
        textAlignVertical: TextAlignVertical.center,
        autocorrect: false,
        enableSuggestions: false,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.search,
        controller: searchTextTypeProvider.textController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
          ),
          fillColor: cleanWhite,
          filled: true,
          hintText: 'Что вы хотите найти?',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Icon(
              LineIcons.search,
              color: commonGrey,
            ),
          ),
        ),
      ),
    );
  }
}

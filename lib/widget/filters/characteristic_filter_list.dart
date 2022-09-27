import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/app_config_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/widget/common/button/filter_checkbox.dart';
import 'package:studion_mobile/widget/common/text/regular_list_title.dart';

class CharacteristicFilterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AppConfigProvider>(context, listen: false);
    Provider.of<FiltersProvider>(context);
    final items = provider.config.characteristics;

    return Container(
      alignment: AlignmentDirectional.topCenter,
      height: MediaQuery.of(context).size.height - 131,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          final item = items[i];
          return Column(
            children: [
              CharacteristicItemPicker(
                  item, Key("picker_characteristic${item.id}")),
              i != items.length - 1
                  ? const Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

class CharacteristicItemPicker extends StatelessWidget {
  final CharacteristicItem item;

  const CharacteristicItemPicker(this.item, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FiltersProvider>(context);

    return Container(
      margin: const EdgeInsets.only(
        top: 7,
        bottom: 7,
      ),
      child: Row(
        children: [
          CustomCheckbox(
            isChecked: provider.getCharacteristicFilterIds().contains(item.id),
            onChange: () {
              provider.changeCharacteristic(item);
            },
          ),
          const SizedBox(width: 15),
          RegularListTitle(
            item.name,
          )
        ],
      ),
    );
  }
}

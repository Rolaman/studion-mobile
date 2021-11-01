import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/characteristics_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';

class CharacteristicsFiltersModal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: FutureBuilder(
        future: Provider.of<CharacteristicProvider>(context).get(),
        builder: (ctx, AsyncSnapshot<List<CharacteristicItem>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            alignment: AlignmentDirectional.topCenter,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListView(
              children: snapshot.data!.map((e) {
                return Column(
                  children: [
                    CharacteristicItemPicker(e, Key('picker-charac' + e.id)),
                    const Divider(
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                );
              }).toList(),
            ),
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
    return Consumer<FiltersProvider>(
      builder: (ctx, provider, _) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            provider.changeCharacteristic(item);
          },
          child: Container(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value:
                        provider.getCharacteristicFilterIds().contains(item.id),
                    onChanged: (_) {
                      provider.changeCharacteristic(item);
                    },
                  ),
                ),
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

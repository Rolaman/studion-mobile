import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/equipment_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';

class EquipmentFiltersModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: FutureBuilder(
        future: Provider.of<EquipmentProvider>(context).get(),
        builder: (ctx, AsyncSnapshot<List<EquipmentItem>> snapshot) {
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
            child: GroupedListView<EquipmentItem, String>(
              elements: snapshot.data!,
              groupBy: (e) => e.type,
              sort: false,
              groupSeparatorBuilder: (String groupByValue) => Column(
                children: [
                  Text(
                    equipmentGroups[groupByValue]!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Divider(),
                ],
              ),
              itemBuilder: (context, EquipmentItem e) => Column(
                children: [
                  EquipmentItemPicker(e, Key("picker_equipment" + e.id)),
                  const Divider(
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EquipmentItemPicker extends StatelessWidget {
  final EquipmentItem item;

  const EquipmentItemPicker(this.item, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersProvider>(
      builder: (ctx, provider, _) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            provider.changeEquipment(item);
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
                    value: provider.getEquipmentFilterIds().contains(item.id),
                    onChanged: (_) {
                      provider.changeEquipment(item);
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

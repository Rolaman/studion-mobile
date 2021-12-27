import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/equipment_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/button/filter_checkbox.dart';
import 'package:studion_mobile/widget/common/text/regular_group_name.dart';
import 'package:studion_mobile/widget/common/text/regular_list_title.dart';

class EquipmentFilterList extends StatefulWidget {
  @override
  State<EquipmentFilterList> createState() => _EquipmentFilterListState();
}

class _EquipmentFilterListState extends State<EquipmentFilterList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EquipmentProvider>(context, listen: false);
    Provider.of<FiltersProvider>(context);

    final items = provider.get();

    return Container(
      alignment: AlignmentDirectional.topCenter,
      height: MediaQuery.of(context).size.height - 131,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: GroupedListView<EquipmentItem, String>(
        elements: items,
        groupBy: (e) => e.type,
        sort: false,
        groupSeparatorBuilder: (String groupByValue) => Container(
          alignment: AlignmentDirectional.topCenter,
          margin: const EdgeInsets.only(
            bottom: 10,
            top: 15,
          ),
          child: RegularGroupName(
            equipmentGroups[groupByValue]!,
            color: commonGrey,
          ),
        ),
        separator: const Divider(
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
        itemBuilder: (context, EquipmentItem e) => Column(
          children: [
            EquipmentItemPicker(e, Key("picker_equipment" + e.id)),
          ],
        ),
      ),
    );
  }
}

class EquipmentItemPicker extends StatelessWidget {
  final EquipmentItem item;

  const EquipmentItemPicker(this.item, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FiltersProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(
        top: 7,
        bottom: 7,
      ),
      child: Row(
        children: [
          CustomCheckbox(
            isChecked: provider.getEquipmentFilterIds().contains(item.id),
            onChange: () {
              provider.changeEquipment(item);
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

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/equipment_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';

class EquipmentFiltersModal extends StatefulWidget {
  @override
  _EquipmentFiltersModalState createState() => _EquipmentFiltersModalState();
}

class _EquipmentFiltersModalState extends State<EquipmentFiltersModal> {
  Set<String> _checked = {};
  bool _inited = false;

  @override
  void didChangeDependencies() {
    if (!_inited) {
      setState(() {
        _checked =
            Provider.of<FiltersProvider>(context).getEquipmentFilters().toSet();
        _inited = true;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
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
              horizontal: 15,
            ),
            child: GroupedListView<EquipmentItem, String>(
              elements: snapshot.data!,
              groupBy: (e) => e.type,
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
              itemBuilder: (context, EquipmentItem e) => Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                  top: 5,
                ),
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: _checked.contains(e.id),
                          onChanged: (state) {
                            if (state!) {
                              _checked.add(e.id);
                            } else {
                              _checked.remove(e.id);
                            }
                            Provider.of<FiltersProvider>(context, listen: false)
                                .changeEquipment(e, state);
                          },
                        ))
                  ],
                ),
              ),
              order: GroupedListOrder.ASC,
            ),
          );
        },
      ),
    );
  }
}
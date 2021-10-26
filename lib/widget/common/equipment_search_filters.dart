import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/equipment_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';

class EquipmentFilter extends StatefulWidget {
  EquipmentFilter() : super(key: const Key('equipment'));

  @override
  State<EquipmentFilter> createState() => _EquipmentFilterState();
}

class _EquipmentFilterState extends State<EquipmentFilter> {
  bool equipmentFull = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<EquipmentProvider>(context, listen: false).get(),
      builder: (ctx, AsyncSnapshot<List<EquipmentGroup>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: const Text(
                    'Оборудование',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  child: const CircularProgressIndicator(),
                )
              ],
            ),
          );
        }
        return Consumer<FiltersProvider>(
          builder: (ctx2, FiltersProvider provider, child) {
            List<Widget> items = equipmentFull
                ? snapshot.data!.map((e) {
                    return SizedBox(
                      key: Key(e.id),
                      height: 50,
                      child: Row(
                        children: [
                          Text(e.name),
                          Checkbox(
                            value: provider.getState(e.id),
                            onChanged: (state) {
                              provider.changeEquipment(e.id, state!);
                            },
                          )
                        ],
                      ),
                    );
                  }).toList()
                : [];
            return Container(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Text(
                        'Оборудование',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(Icons.arrow_drop_down_circle_outlined),
                      onTap: () {
                        setState(() {
                          equipmentFull = !equipmentFull;
                        });
                      },
                    ),
                  ],
                ),
                ...items,
              ],
            ));
          },
        );
      },
    );
  }
}

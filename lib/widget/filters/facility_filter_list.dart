import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/facilities_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/widget/common/button/filter_checkbox.dart';
import 'package:studion_mobile/widget/common/text/regular_list_title.dart';

class FacilityFilterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<FacilitiesProvider>(context, listen: false);
    Provider.of<FiltersProvider>(context);
    final items = provider.get();

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
              FacilityItemPicker(
                  item, Key("picker_facility" + item.id)),
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

class FacilityItemPicker extends StatelessWidget {
  final FacilityItem item;

  const FacilityItemPicker(this.item, Key key) : super(key: key);

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
            isChecked: provider.getFacilitiesFilterIds().contains(item.id),
            onChange: () {
              provider.changeFacilities(item);
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

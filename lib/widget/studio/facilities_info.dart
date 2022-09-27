import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/app_config_provider.dart';

class FacilitiesInfo extends StatelessWidget {
  final List<String> facilityIds;

  const FacilitiesInfo(this.facilityIds)
      : super(key: const Key('facilitiesInfo'));

  @override
  Widget build(BuildContext context) {
    final facilities = Provider.of<AppConfigProvider>(context, listen: false)
        .facilitiesByIds(facilityIds);
    if (facilities.isEmpty) {
      return const SizedBox();
    }
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 5,
            ),
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              'Удобства',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: facilities.map((e) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 3,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    e.name,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:studion_mobile/provider/characteristics_provider.dart';

class FacilitiesInfo extends StatelessWidget {
  final List<String> facilityIds;

  const FacilitiesInfo(this.facilityIds)
      : super(key: const Key('facilitiesInfo'));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CharacteristicProvider>(context, listen: false)
          .getByIdsAsync(facilityIds),
      builder: (ctx, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: const EdgeInsets.only(
              top: 5,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 2,
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
                  child: SkeletonAnimation(
                    shimmerColor: Colors.white54,
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (snapshot.data!.isEmpty) {
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
                  bottom: 2,
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
                  children: snapshot.data!.map((e) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 1,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 3,
                      ),
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

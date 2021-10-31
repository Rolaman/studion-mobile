import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/model/room_dto.dart';
import 'package:studion_mobile/provider/characteristics_provider.dart';
import 'package:studion_mobile/provider/equipment_provider.dart';
import 'package:studion_mobile/provider/interior_provider.dart';

class RoomCharacteristics extends StatelessWidget {
  final RoomItem item;

  const RoomCharacteristics(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              "Характеристики",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 5,
              bottom: 10,
            ),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              direction: Axis.horizontal,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: Text(
                          item.area.toString() + " м\u00B2",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: const Text(
                          'Площадь зала',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: Text(
                          '${item.height / 10} м',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: const Text(
                          'Высота потолков',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          InteriorInfo(item.interiors),
          CharacteristicsInfo(item.characteristics),
          EquipmentInfo(item.equipments),
        ],
      ),
    );
  }
}

class InteriorInfo extends StatelessWidget {
  final List<String> interiors;

  const InteriorInfo(this.interiors) : super(key: const Key('interiors'));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<InteriorProvider>(context, listen: false)
          .getByIdsAsync(interiors),
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
                    'Интерьеры',
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
            top: 7,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                alignment: AlignmentDirectional.topStart,
                child: const Text(
                  'Интерьеры',
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
                        horizontal: 5,
                        vertical: 3,
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

class CharacteristicsInfo extends StatelessWidget {
  final List<String> characteristics;

  const CharacteristicsInfo(this.characteristics)
      : super(key: const Key('characteristics'));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CharacteristicProvider>(context, listen: false)
          .getByIdsAsync(characteristics),
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
                    bottom: 5,
                  ),
                  alignment: AlignmentDirectional.topStart,
                  child: const Text(
                    'Возможности',
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
                  bottom: 5,
                ),
                alignment: AlignmentDirectional.topStart,
                child: const Text(
                  'Возможности',
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
                        horizontal: 5,
                        vertical: 3,
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

class EquipmentInfo extends StatelessWidget {
  final List<String> equipments;

  const EquipmentInfo(this.equipments) : super(key: const Key('equipments'));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<EquipmentProvider>(context, listen: false)
          .getByIdsAsync(equipments),
      builder: (ctx, AsyncSnapshot<List<EquipmentItem>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
                    'Оборудование',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SkeletonAnimation(
                  shimmerColor: Colors.white54,
                  child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300]),
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
            top: 7,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                alignment: AlignmentDirectional.topStart,
                child: const Text(
                  'Оборудование',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                child: SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data!.map((e) {
                      return SizedBox(
                        height: 180,
                        width: 150,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 3,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 3,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              e.imageUrl != null
                                  ? Container(
                                      width: 100,
                                      height: 100,
                                      margin: const EdgeInsets.only(
                                        top: 3,
                                        bottom: 3,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          e.imageUrl!,
                                          fit: BoxFit.cover,
                                          errorBuilder: (ctx, exception, _) {
                                            return Container(
                                              color: Colors.black12,
                                              alignment:
                                                  AlignmentDirectional.center,
                                              child: const Text(
                                                  'Не удалось загрузить изображение'),
                                            );
                                          },
                                          loadingBuilder:
                                              (ctx, ch, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return ch;
                                            }
                                            return SkeletonAnimation(
                                              shimmerColor: Colors.white54,
                                              child: Container(
                                                width: double.infinity,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey[300]),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              Text(
                                equipmentGroups[e.type]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                e.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

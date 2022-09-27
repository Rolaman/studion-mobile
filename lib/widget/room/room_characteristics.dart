import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/model/room_dto.dart';
import 'package:studion_mobile/provider/app_config_provider.dart';

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
                Column(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.topCenter,
                      child: Text(
                        "${item.area} м\u00B2",
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
                Column(
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
  final List<String> interiorIds;

  const InteriorInfo(this.interiorIds) : super(key: const Key('interiors'));

  @override
  Widget build(BuildContext context) {
    final interiors = Provider.of<AppConfigProvider>(context, listen: false)
        .iteriorsByIds(interiorIds);
    if (interiors.isEmpty) {
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
              children: interiors.map((e) {
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

class CharacteristicsInfo extends StatelessWidget {
  final List<String> characteristicIds;

  const CharacteristicsInfo(this.characteristicIds)
      : super(key: const Key('characteristics'));

  @override
  Widget build(BuildContext context) {
    final characteristics =
        Provider.of<AppConfigProvider>(context, listen: false)
            .iteriorsByIds(characteristicIds);
    if (characteristics.isEmpty) {
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
              children: characteristics.map((e) {
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

class EquipmentInfo extends StatelessWidget {
  final List<String> equipmentIds;

  const EquipmentInfo(this.equipmentIds) : super(key: const Key('equipments'));

  @override
  Widget build(BuildContext context) {
    final equipments = Provider.of<AppConfigProvider>(context, listen: false)
        .equipmentsByIds(equipmentIds);

    if (equipments.isEmpty) {
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
              left: 15,
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
                children: equipments.map((e) {
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
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          e.image != null
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
                                      e.image!,
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
                                                    BorderRadius.circular(20),
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
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

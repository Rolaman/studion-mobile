import 'package:flutter/material.dart';

class EquipmentList extends StatelessWidget {
  final List<String> equipments;

  const EquipmentList(this.equipments);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 10,
      ),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              'Оборудование',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                ...equipments.map((e) => EquipmentItem(e, Key(e))).toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EquipmentItem extends StatelessWidget {
  final String name;

  const EquipmentItem(this.name, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.only(
        top: 2,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

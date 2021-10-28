import 'package:flutter/material.dart';

class WorkingHourInfo extends StatelessWidget {
  final int startHour;
  final int endHour;

  const WorkingHourInfo(this.startHour, this.endHour)
      : super(key: const Key('workingHour'));

  @override
  Widget build(BuildContext context) {
    if (startHour == 0 && endHour == 24) {
      return Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 5,
        ),
        alignment: AlignmentDirectional.topStart,
        child: const Text(
          'Работает круглосуточно',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 5,
      ),
      alignment: AlignmentDirectional.topStart,
      child: Text(
        'Работает c $startHour:00 до $endHour:00',
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black54,
        ),
      ),
    );
  }
}

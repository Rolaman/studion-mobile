import 'package:flutter/material.dart';
import 'package:studion_mobile/model/metro_dto.dart';

class CurrentMetrosBar extends StatelessWidget {
  final List<MetroStationItem> metros;

  const CurrentMetrosBar(this.metros);

  @override
  Widget build(BuildContext context) {
    if (metros.isEmpty) {
      return Container();
    }
    List<Widget> colorCircles = [];
    for (var i = 0; i < metros.length; i++) {
      colorCircles.add(Container(
        width: 12,
        height: 12,
        margin: EdgeInsets.only(
          left: i * 5,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: metros[i].color,
        ),
      ));
    }
    final namesText = metros.map((e) => e.name).join(', ');
    return Container(
      margin: const EdgeInsets.only(left: 2),
      child: Row(
        children: [
          Stack(
            children: colorCircles,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: Text(namesText),
          ),
        ],
      ),
    );
  }
}

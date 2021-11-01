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
    String namesText = metros.map((e) => e.name).toSet().join(', ');
    if (namesText.endsWith(",")) {
      namesText = namesText.substring(0, namesText.length - 1);
    }
    return Container(
      margin: const EdgeInsets.only(left: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: colorCircles,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 52,
                child: Text(
                  namesText,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:studion_mobile/screen/new_filters_screen.dart';

class FiltersButton extends StatelessWidget {
  final double size;

  const FiltersButton(this.size);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Container(
          width: size,
          height: size,
          color: Colors.white,
          child: Icon(
            LineIcons.horizontalSliders,
            color: Colors.black,
            size: size / 2,
          ),
        ),
      ),
      onTap: () {
        showFiltersScreen(context);
      },
    );
  }
}

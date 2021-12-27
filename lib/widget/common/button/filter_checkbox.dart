import 'package:flutter/material.dart';
import 'package:studion_mobile/util/theme.dart';

class CustomCheckbox extends StatelessWidget {
  final Function onChange;
  final bool isChecked;
  final double size;
  final double iconSize;
  final Color selectedColor;

  const CustomCheckbox({
    required this.isChecked,
    required this.onChange,
    this.size = 25,
    this.iconSize = 20,
    this.selectedColor = mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange();
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.all(4),
        duration: const Duration(milliseconds: 100),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: isChecked ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          border: isChecked
              ? null
              : Border.all(
                  color: commonGrey,
                  width: 0.5,
                ),
        ),
        width: size,
        height: size,
        child: isChecked
            ? Icon(
                Icons.check,
                size: iconSize,
                color: cleanWhite,
              )
            : null,
      ),
    );
  }
}

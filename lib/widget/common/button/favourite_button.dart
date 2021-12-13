import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studion_mobile/util/theme.dart';

class FavouriteButton extends StatefulWidget {
  final void Function() action;
  final bool active;
  final double size;

  const FavouriteButton(this.active, this.action, {this.size = 50});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool active = false;

  @override
  void initState() {
    setState(() {
      active = widget.active;
    });
    super.initState();
  }

  void change() {
    setState(() {
      active = !active;
    });
    try {
      widget.action();
    } catch (e) {
      setState(() {
        active = !active;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size / 2),
        child: Container(
          width: widget.size,
          height: widget.size,
          color: Colors.white,
          child: Icon(
            active ? Icons.bookmark : Icons.bookmark_border,
            color: mainColor,
            size: widget.size / 2,
          ),
        ),
      ),
      onTap: change,
    );
  }
}

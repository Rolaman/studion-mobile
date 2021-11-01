import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class StudioPathInstruction extends StatelessWidget {
  final String text;

  const StudioPathInstruction(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ExpandableNotifier(
        child: ScrollOnExpand(
          child: ExpandablePanel(
            header: const Text(
              'Как пройти',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            collapsed: Text(
              text,
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            expanded: Text(
              text,
              softWrap: true,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

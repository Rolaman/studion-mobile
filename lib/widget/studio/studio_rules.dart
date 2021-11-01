import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class StudioRules extends StatelessWidget {

  final String text;

  const StudioRules(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpandablePanel(
        header: Text('Как пройти'),
        collapsed: Text(
          text,
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        expanded: Text(
          text,
          softWrap: true,
        ),
      ),
    );
  }
}

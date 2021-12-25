import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/widget/popular/rating/studio_card_rating.dart';

class LargeActionCard extends StatelessWidget {
  final Widget child;
  final void Function() action;

  LargeActionCard({
    required this.child,
    required this.action,
  }) : super(key: const Key('largeActionCard'));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: 270,
        height: 300,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: 270,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
            child,
          ],
        ),
      ),
      onTap: action,
    );
  }
}

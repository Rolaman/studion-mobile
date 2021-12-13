import 'package:flutter/widgets.dart';

class MediumItemImageCard extends StatelessWidget {
  final Image image;
  final Widget action;

  const MediumItemImageCard({
    required this.image,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 110,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: 130,
              height: 110,
              child: image,
            ),
            Container(
              alignment: AlignmentDirectional.topEnd,
              margin: const EdgeInsets.only(
                top: 7,
                right: 7,
              ),
              child: action,
            ),
          ],
        ),
      ),
    );
  }
}

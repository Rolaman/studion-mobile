import 'package:flutter/widgets.dart';

class FullWidthItemImageCard extends StatelessWidget {
  final Image image;
  final Widget action;

  const FullWidthItemImageCard({
    required this.image,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
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

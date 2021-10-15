import 'package:flutter/material.dart';
import 'package:studion_mobile/model/studio/studio_dto.dart';

class StudioCard extends StatelessWidget {
  final StudioItem studio;

  const StudioCard(this.studio, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: SizedBox(
        height: 220,
        child: Column(
          children: [
            Container(
              height: 160,
              color: Colors.black12,
            ),
            Container(
              height: 60,
              color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          studio.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          left: 15,
                          top: 5,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 15,
                          top: 5,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:studion_mobile/model/studio_dto.dart';

class StudioCard extends StatelessWidget {
  final StudioItem studio;

  const StudioCard(this.studio, Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            studio.imageUrl != null
                ? SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      studio.imageUrl!,
                      fit: BoxFit.fill,
                    ),
                  )
                : Container(
                    height: 200,
                    color: Colors.black12,
                  ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 40,
                color: Colors.grey.withOpacity(0.5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(
                            studio.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          margin: const EdgeInsets.only(
                            left: 15,
                            top: 10,
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
            ),
          ],
        ),
      ),
    );
  }
}

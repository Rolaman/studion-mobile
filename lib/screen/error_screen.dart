import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:studion_mobile/main.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform.scale(
                scale: 2,
                child: const Icon(LineIcons.frowningFace),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Не удалось загрузить данные',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                color: Colors.indigo,
                child: const Text('Повторить'),
                onPressed: () {
                  retriableHomeScreen(context, providerLoading);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

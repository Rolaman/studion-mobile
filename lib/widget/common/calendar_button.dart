import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarButton extends StatelessWidget {
  final String url;

  const CalendarButton(this.url) : super(key: const Key('calendarUrl'));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 25,
        right: 15,
        bottom: 5,
        top: 5,
      ),
      height: 50,
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        color: Colors.indigo,
        child: const Text('Забронировать'),
        onPressed: () {
          launch(url);
        },
      ),
    );
  }
}

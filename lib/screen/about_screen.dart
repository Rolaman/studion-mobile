import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonNavigationBar(),
      body: SafeArea(
        child: Container(
          alignment: AlignmentDirectional.topCenter,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.asset('assets/app_icon.png'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text('StudiON',
                style: TextStyle(
                  fontSize: 30,
                ),),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: AlignmentDirectional.topStart,
                child: const Text(
                  'Контакты',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: AlignmentDirectional.topStart,
                child: Row(
                  children: const [
                    Icon(LineIcons.mailBulk),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'studion.app@gmail.com',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: AlignmentDirectional.topStart,
                child: Row(
                  children: const [
                    Icon(LineIcons.telegram),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '@rolaman',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

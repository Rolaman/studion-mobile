import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ContactInfo extends StatelessWidget {
  final String mobile;
  final String? vkUrl;
  final String? instagramUrl;
  final String? siteUrl;

  const ContactInfo(
    this.mobile, {
    this.instagramUrl,
    this.siteUrl,
    this.vkUrl,
  }) : super(key: const Key('mobileInfo'));

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              final cleanMobile = formatMobile(mobile);
              await FlutterPhoneDirectCaller.callNumber(cleanMobile);
            },
            child: Text(
              mobile,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            children: [
              vkUrl != null
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        await canLaunch(vkUrl!)
                            ? await launch(vkUrl!)
                            : _showUrlError(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12,
                        ),
                        child: const Icon(LineIcons.vk),
                      ),
                    )
                  : const SizedBox(),
              instagramUrl != null
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        await canLaunch(instagramUrl!)
                            ? await launch(instagramUrl!)
                            : _showUrlError(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12,
                        ),
                        child: const Icon(LineIcons.instagram),
                      ),
                    )
                  : const SizedBox(),
              siteUrl != null
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        await canLaunch(siteUrl!)
                            ? await launch(siteUrl!)
                            : _showUrlError(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12,
                        ),
                        child: const Icon(LineIcons.edgeBrowser),
                      ),
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}

String formatMobile(String mobile) {
  return 'tel://' +
      mobile
          .replaceAll('(', ' ')
          .replaceAll(')', ' ')
          .replaceAll('-', ' ');
}

Future<void> _showCallError(BuildContext context) async {
  if (Platform.isIOS) {
    return showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: const Text(
            'Требуется разрешить телефонные вызовы в настройках',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ok',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text(
          'Требуется разрешить телефонные вызовы в настройках',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Ok',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _showUrlError(BuildContext context) async {
  if (Platform.isIOS) {
    return showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: const Text(
            'Требуется разрешить доступ к браузеру в настройках',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Ok',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text(
          'Требуется разрешить доступ к браузеру в настройках',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Ok',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

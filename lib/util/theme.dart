import 'package:flutter/material.dart';

const MaterialColor mainColors = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

const int _bluePrimaryValue = 0xFF2196F3;

const Color mainColor = Color(0xFF316BFF);

const Color backgroundColor =  Color(0xFFFCFCFC);

const Color commonGrey = Color(0xFF9E9E9E);

final ThemeData themeData = ThemeData(
  fontFamily: 'Mulish',
  primarySwatch: mainColors,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
);

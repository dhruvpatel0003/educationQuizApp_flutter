import 'dart:ui';

import 'package:education_app/config/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

const Color primarydarkColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData{
  ThemeData buildDarkTheme(){
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorDark,
        displayColor:mainTextColorDark ,
      )
    );
  }
}
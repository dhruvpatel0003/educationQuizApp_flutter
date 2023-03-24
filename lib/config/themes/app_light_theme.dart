import 'dart:ui';

import 'package:education_app/config/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);
const Color cardCorlor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubThemeData{//inherite the properties

    buildLightTheme(){//return overall theme / all the step up
      final ThemeData systemLightTheme = ThemeData.light();//return the object
      return systemLightTheme.copyWith(
        primaryColor: primaryColorLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        cardColor: cardCorlor,
        textTheme: getTextThemes().apply(
          bodyColor: mainTextColorLight,
          displayColor:mainTextColorLight
        )
      );
    }

}
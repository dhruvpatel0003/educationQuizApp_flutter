import 'package:flutter/cupertino.dart';

class AppIcons{//singleton class
  //contructor is private
  AppIcons._();//single tone only have a one instance throughout the app
  static const fontFam = "AppIcons";
  static const IconData trophyOutLine = IconData(0xe808,fontFamily: fontFam);
  static const IconData menuLeft = IconData(0xe805,fontFamily: fontFam);
  static const IconData  peace= IconData(0xe806,fontFamily: fontFam);
  static const IconData menu = IconData(0xe804, fontFamily: fontFam);

}
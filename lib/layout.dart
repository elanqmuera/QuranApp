import 'package:flutter/widgets.dart';
 
class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenHeight;
  static double? screenWidth;
  static double? blockHorizontal;
  static double? blockVertical;

  void init (BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData?.size.height;
    screenWidth = _mediaQueryData?.size.width;
    blockHorizontal = screenWidth! / 100;
    blockVertical = screenHeight! / 100;
    

  }
}
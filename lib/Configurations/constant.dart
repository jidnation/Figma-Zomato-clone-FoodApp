import 'package:flutter/material.dart';

///Colors to use
const Color kPrimaryColor = Color(0xffCB202D);
const Color kSecondaryColor = Color(0xff2D2D2D);
const Color whiteColor = Color(0xfff4f4f2);
const LinearGradient lGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xffEC0C92),
      Color(0xFFDD4A93),
      Color(0xFFEB5965),
    ]);

///sizes

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late Orientation orientation;
  static late double defaultSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}

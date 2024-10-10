import 'package:flutter/widgets.dart';

class AppSizes {
  static late MediaQueryData mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;

   void initSizes(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
  }


  
}

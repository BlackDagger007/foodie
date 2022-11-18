import 'package:get/get.dart';

class Constants {
  //PageView
  static double pageViewHeight = 280;
  static double pageViewMainHeight = 210;

  static double pageViewSubHeight = 95;
  static double pageViewSubWidth = 220;

  //IconSize
  static double iconSizeLarge = 24;
  static double iconSizeMedium = 20;
  static double iconSizeSmall = 8;
}

double screenHeight = Get.context!.height;
double screenWidth = Get.context!.width;

// sH and sW methods converts pixHeight to Dynamic equivalent
double sH(double pixelHeight) {
  return screenHeight / (screenHeight / pixelHeight);
}

double sW(double pixelWidth) {
  return screenWidth / (screenWidth / pixelWidth);
}

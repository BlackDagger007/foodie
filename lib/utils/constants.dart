import 'package:get/get.dart';

class Constants {
  //PageView
  static double pageViewHeight = 290;
  static double pageViewMainHeight = 220;

  static double pageViewSubHeight = 105;
  static double pageViewSubWidth = 220;

  //IconSize
  static double iconSizeLarge = 24;
  static double iconSizeMedium = 20;
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

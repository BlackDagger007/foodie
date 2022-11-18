import 'package:flutter/material.dart';
import 'package:foodie/home/main_food_page.dart';
import 'package:foodie/utils/colors.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColor.mainColor,
      ),
      home: const MainFoodPage(),
    );
  }
}

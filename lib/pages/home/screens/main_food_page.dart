import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/small_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../widgets/appbar.dart';
import '../widgets/food_slider.dart';
import '../widgets/food_tile.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  final pageController = PageController(viewportFraction: 0.8);
  double _currentPageValue = 0.0;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> foodList = [
      {'image': 'assets/images/food_1.png', 'foodName': 'Garnished Salad Mix'},
      {'image': 'assets/images/food_2.jpg', 'foodName': 'Garnished Salad Mix'},
      {'image': 'assets/images/food_3.png', 'foodName': 'Garnished Salad Mix'},
      {'image': 'assets/images/food_4.png', 'foodName': 'Garnished Salad Mix'},
      {'image': 'assets/images/food_5.png', 'foodName': 'Garnished Salad Mix'},
    ];

    return Scaffold(
      backgroundColor: AppColor.signColor,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PageView Slider
            FoodSlider(
                pageController: pageController,
                foodList: foodList,
                currentPageValue: _currentPageValue),
            // Dots Indicator
            Center(
              child: DotsIndicator(
                dotsCount: foodList.length,
                position: _currentPageValue,
                decorator: DotsDecorator(
                    size: Size.square(sH(8)),
                    activeSize: Size(sH(16.0), sH(8.0)),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(sH(5)))),
              ),
            ),
            SizedBox(height: sH(20)),
            // Featured List
            Container(
              width: sW(160),
              margin: EdgeInsets.symmetric(horizontal: sW(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const BigText('Popular'),
                  Container(
                    margin: EdgeInsets.only(bottom: sH(5)),
                    child: Icon(
                      Icons.circle,
                      color: Colors.grey,
                      size: sH(Constants.iconSizeSmall),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: sH(2)),
                      child: const SmallText('Food pairing'))
                ],
              ),
            ),
            // ListView
            Container(
              margin: EdgeInsets.only(
                top: sH(20),
                left: sW(30),
                right: sW(30),
              ),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: foodList.length,
                  itemBuilder: (_, index) => FoodTile(
                        title: foodList[index]['foodName'],
                        image: foodList[index]['image'],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

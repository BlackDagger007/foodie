import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodie/widgets/small_text.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/big_text.dart';
import '../widgets/large_food_item.dart';

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
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const BigText(
                    text: 'Ghana',
                    color: AppColor.mainColor,
                  ),
                  Row(
                    children: [
                      const SmallText(
                        text: 'Accra',
                        color: Colors.black54,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.black,
                        ),
                      )
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: sH(45),
                  width: sW(45),
                  decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(sH(15))),
                  child: Icon(
                    Icons.search,
                    size: sH(Constants.iconSizeLarge),
                  ),
                ),
              )
            ],
          )),
      body: Column(
        children: [
          Container(
            height: sH(Constants.kPageViewHeight),
            margin: EdgeInsets.symmetric(vertical: sH(10)),
            child: PageView.builder(
              controller: pageController,
              itemCount: foodList.length,
              itemBuilder: (context, index) => buildLargeFoodItem(
                foodList,
                index,
                _currentPageValue,
              ),
            ),
          ),
          DotsIndicator(
            dotsCount: foodList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
                size: Size.square(sH(9)),
                activeSize: Size(sH(18.0), sH(9.0)),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sH(5)))),
          )
        ],
      ),
    );
  }
}

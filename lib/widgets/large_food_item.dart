import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'big_text.dart';
import 'small_text.dart';

Widget buildLargeFoodItem(List list, int index, double currentPageValue) {
  Matrix4 matrix;
  double currentScale;
  double currentTransformation;
  double scaleFactor = 0.8;
  double height = 220;

  if (index <= currentPageValue.floor()) {
    currentScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
    currentTransformation = height * (1 - currentScale) / 2;

    matrix = Matrix4.diagonal3Values(1, currentScale, 1)
      ..setTranslationRaw(0, currentTransformation, 0);
  } else {
    currentScale = 1 - (index - currentPageValue) * (1 - scaleFactor);
    currentTransformation = height * (1 - currentScale) / 2;

    matrix = Matrix4.diagonal3Values(1, currentScale, 1)
      ..setTranslationRaw(0, currentTransformation, 0);
  }

  return Transform(
    transform: matrix,
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              //TODO: Resolve image container bg color
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage('${list[index]['image']}'),
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          bottom: 5,
          child: Container(
            height: 110,
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-3, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(3, 0),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: '${list[index]['foodName']}'),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    RatingsWidget(),
                    SizedBox(width: 10),
                    SmallText(text: '4.5'),
                    SizedBox(width: 10),
                    SmallText(text: '1231 comments')
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconTile(
                      text: 'Normal',
                      icon: Icons.circle,
                      color: AppColor.iconColor1,
                    ),
                    IconTile(
                      text: '1.5km',
                      icon: Icons.location_on,
                      color: AppColor.mainColor,
                    ),
                    IconTile(
                      text: '22mins',
                      icon: Icons.access_time_rounded,
                      color: AppColor.iconColor2,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

class RatingsWidget extends StatelessWidget {
  const RatingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
          5,
          (index) =>
              const Icon(Icons.star, size: 15, color: AppColor.mainColor)),
    );
  }
}

class IconTile extends StatelessWidget {
  const IconTile({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 2),
        SmallText(text: text),
      ],
    );
  }
}

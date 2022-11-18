import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';
import 'food_slider.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.title,
    required this.image,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: sH(5)),
          height: sH(115),
          width: sW(120),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(sH(20)),
              color: Colors.deepOrange,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              )),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(sH(10)),
            height: sH(88),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(sH(10)),
                  bottomRight: Radius.circular(sH(10)),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(title),
                const SmallText('With chinese characteristics'),
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
        ),
      ],
    );
  }
}

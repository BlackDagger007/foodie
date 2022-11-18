import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/small_text.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Padding(
      padding: EdgeInsets.only(left: sW(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const BigText(
                'Ghana',
                color: AppColor.mainColor,
              ),
              Row(
                children: [
                  const SmallText(
                    'Accra',
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
      ),
    ),
  );
}

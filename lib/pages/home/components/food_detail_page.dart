import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                child: Container(
              height: sH(50),
              width: sW(50),
              color: Colors.red,
            )),
            Positioned(
                child: Container(
              height: sH(50),
              width: sW(50),
              color: Colors.blue,
            )),
          ],
        ),
      ),
    );
  }
}

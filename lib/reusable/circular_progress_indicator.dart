import 'package:flutter/material.dart';
import 'package:hariom/utils/app_color.dart';

class MyAppCircularProgressIndicator extends StatelessWidget {
  const MyAppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: MyAppColors.instance().black,
    );
  }
}

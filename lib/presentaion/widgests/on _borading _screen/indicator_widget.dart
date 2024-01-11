import 'package:flutter/cupertino.dart';
import 'package:shop_app/shared/colors.dart';
import 'package:shop_app/shared/themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget boardingIdndicatorWidget(
    {required PageController controller, required int count}) {
  return SmoothPageIndicator(
    controller: controller,
    count: count,
    effect: ExpandingDotsEffect(
      activeDotColor: lightTheme.focusColor,
      dotColor: MyColors.grey,
      dotHeight:10,
      expansionFactor: 4,
      dotWidth: 10,
      spacing: 5,

  )
  );
}

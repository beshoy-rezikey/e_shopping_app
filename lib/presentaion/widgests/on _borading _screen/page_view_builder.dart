import 'package:flutter/material.dart';

Widget boardingPageViewBuilder(
    { required void Function(int)?onPageChanged,
required PageController controller,
required Widget Function(BuildContext, int) itemBuilder,
      int? itemCount})
{
  return PageView.builder(
      onPageChanged: onPageChanged,
      controller: controller,
      physics: BouncingScrollPhysics(),
      itemBuilder: itemBuilder,
      itemCount: itemCount);
}
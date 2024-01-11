import 'package:flutter/material.dart';

import '../../../shared/themes.dart';

  Widget boardingFloatingActionButton ({required void Function()? onPressed}){
  return  FloatingActionButton(onPressed: onPressed,child: Icon(Icons.keyboard_arrow_right_outlined,
      color: lightTheme.scaffoldBackgroundColor),);
}
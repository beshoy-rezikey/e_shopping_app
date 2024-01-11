import 'package:flutter/material.dart';
import 'package:shop_app/shared/themes.dart';

Widget shopSkipButton({required void Function()? onPressed , required String text}){
  return TextButton(onPressed:onPressed , child: Text('$text',style: TextStyle(
    color: lightTheme.scaffoldBackgroundColor
  ),));
}
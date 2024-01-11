import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shop_app/shared/themes.dart';

Widget loginButton(

    {required String text,
      double width = double.infinity,
      bool isUppercase = true,
    required dynamic Function() onPressed,
    required BuildContext context}) {
  return MaterialButton(
    onPressed: onPressed,
    child: Container(
        alignment: Alignment.center,
        width:width ,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).focusColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          isUppercase ? text.toUpperCase():text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: lightTheme.scaffoldBackgroundColor,
            fontSize: lightTheme.textTheme.bodyText1!.fontSize,
          ),
        )),
  );
}

import 'package:flutter/material.dart';

import '../../../shared/themes.dart';

Widget registerButton ({required String text,
  double width = double.infinity,
  bool isUppercase = true,
  required void Function() onPressed,
  }){
  return TextButton(
    onPressed: onPressed,
    child: Container(
        alignment: Alignment.center,

        child: Text(
          isUppercase ? text.toUpperCase() : text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: lightTheme.focusColor,
            fontSize: lightTheme.textTheme.bodyText1!.fontSize,
          ),
        )),
  );}

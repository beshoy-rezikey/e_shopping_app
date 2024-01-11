import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/colors.dart';

ThemeData  lightTheme =ThemeData(
  primaryColorLight: MyColors.orange,
  focusColor: MyColors.orange,
  //text
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: MyColors.black,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      color: MyColors.black,
      fontSize: 18,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.orangeAccent,
      fontSize: 28,
    ),
  ),
  //Scaffold
  scaffoldBackgroundColor: Colors.white,
  //bottom nav  bar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: MyColors.black,
      backgroundColor: MyColors.orange,
      unselectedItemColor: MyColors.white),
  //app bar
  appBarTheme: const AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyColors.orange,
      ),
      backgroundColor: MyColors.orange,
      titleTextStyle: TextStyle(
          color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 20)),
  floatingActionButtonTheme: FloatingActionButtonThemeData(

    backgroundColor: MyColors.orange,),
);
ThemeData  darkTheme =ThemeData(
  primaryColorDark: MyColors.white,
  focusColor: MyColors.white,
  //text
  textTheme: TextTheme(
    bodyText2: TextStyle(
      color: MyColors.white,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w600,
      color: MyColors.white,
      fontSize: 18,
    ),
  ),
  //scaffold
  scaffoldBackgroundColor: MyColors.black,
  //bottom
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: MyColors.orange,
    unselectedItemColor: MyColors.white,
    type: BottomNavigationBarType.fixed,
    backgroundColor: MyColors.grey,
  ),
  //bar
  appBarTheme: const AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyColors.black,
      ),
      backgroundColor: MyColors.black,
      titleTextStyle: TextStyle(
          color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 20)),
);



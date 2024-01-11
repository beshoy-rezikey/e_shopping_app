import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/dataSource/remoteData/dio_helper.dart';
import 'package:shop_app/dataSource/repo/repo.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';
import 'package:shop_app/presentaion/screens/home_screen.dart';
import 'package:shop_app/presentaion/screens/login_screen.dart';
import 'package:shop_app/presentaion/screens/on_boarding_screen.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shared/themes.dart';

import 'shared/cash_helper.dart';
import 'logic/cubit/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
 await DioHelper.init();
  await CashHelper.init();
  HttpOverrides.global = MyHttpOverrides();
  token = CashHelper.getData(key: 'token');
  bool? onboarding = CashHelper.getData(key: 'onBoarding');
  bool? isDark = CashHelper.getData(key: 'isDark');

  Widget widget;

  if (onboarding!=null)
    {
      if(token != null) {
        widget = const HomeScreen();
      } else {
        widget = LoginScreen();
      }

      }else {
    widget =OnBoardingScreen();
  }


    if (isDark == null) {
      isDark = false;
    } else {
      isDark = isDark;
      print('=============main is dark : $isDark===============');
    }

  runApp(MyApp(isDark: isDark,startWidget: widget,));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({ this.isDark,  this.startWidget});
  bool? isDark = false;
   Widget? startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(ShopRepo(DioHelper()))..getHomeData()..getCategories()..getFavorites()..getUserData(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(

            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            home: startWidget,
          );
        },
      ),
    );
  }
}

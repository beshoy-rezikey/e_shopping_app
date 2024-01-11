import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';
import 'package:shop_app/presentaion/screens/cart_screen.dart';
import 'package:shop_app/presentaion/screens/login_screen.dart';
import 'package:shop_app/presentaion/screens/search_screen.dart';
import 'package:shop_app/shared/cash_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [
              IconButton(onPressed: () {
              cubit.navigateto(context: context, widget: SearchScreen());
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: () {
                cubit.navigateto(context: context, widget: CartScreen());
              }, icon: Icon(Icons.shopping_cart)),
            ],
          ),
          body: cubit.bottomScreen[cubit.navIndicator],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.navIndicator,
            onTap: (value) {
              cubit.changeNavbar(value);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.category_rounded),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded),label: 'Favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.settings_applications_outlined),label: 'Settings'),

            ],
          ),
        );
      },
    );
  }
}

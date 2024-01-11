import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/presentaion/widgests/fav_screen/fav_widget.dart';

import '../../logic/cubit/shop_cubit.dart';
import '../../shared/colors.dart';

class FavouirtesScreen extends StatelessWidget {
  const FavouirtesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return ConditionalBuilder(
            condition: state is! ShopLoadingGetFavState,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) =>
                    favBuildWidegt(cubit.favoritesModel!.data!.data![index].product!,),
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey, height: 1),
                itemCount: cubit.favoritesModel!.data!.data!.length),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }
}

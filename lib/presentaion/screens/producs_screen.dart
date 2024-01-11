import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';
import 'package:shop_app/presentaion/widgests/shared_widgets/toats_message.dart';

import '../widgests/product_screen/product_builder_widget.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ShopNotAuthorizedFavouritesState){
          failToast(Message: state.changeFavModel.message );
        }
      },
      builder: (context, state) {
     ShopCubit cubit=  ShopCubit.get(context);
        return ConditionalBuilder(
          condition:cubit.homeModel!=null && cubit.categoriesModel!=null,
          builder: (context) => productWidget(cubit.homeModel,cubit.categoriesModel),
          fallback:(context) => Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }
}

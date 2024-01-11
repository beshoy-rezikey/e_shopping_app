import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';

import '../widgests/categories_screen/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) =>CategoryScreenItem(cubit.categoriesModel!.data!.data[index])  ,
            separatorBuilder: (context, index) =>Divider(color: Colors.grey,height: 1) ,
            itemCount: cubit.categoriesModel!.data!.data.length);
      },
    );
  }
}

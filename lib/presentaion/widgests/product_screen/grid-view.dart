import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/dataSource/models/home_model.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';
import 'package:shop_app/shared/colors.dart';

Widget gridViewWidget(HomeModel model) {
  return Container(
    color: MyColors.orange,
    child: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      childAspectRatio: 1 / 1.22,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(model.data.products.length,
          (index) => gridItem(model.data.products[index])),
    ),
  );
}

Widget gridItem(ProductsModel model) {
  return BlocConsumer<ShopCubit, ShopState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      ShopCubit cubit = ShopCubit.get(context);
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                      width: double.infinity,
                      height: 150,
                      image: NetworkImage(
                        model.image,
                      )),
                  if (model.discount != 0)
                    Text(
                      'Discount',
                      style: TextStyle(
                          backgroundColor: Colors.red,
                          fontSize: 10,
                          color: MyColors.white),
                    )
                ],
              ),
              Text(
                model.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  height: 1.3,
                  fontSize: 12,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  ' ${NumberFormat.decimalPattern().format(model.price.round())}Egp',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                if (model.discount != 0)
                  Text(
                    '${NumberFormat.decimalPattern().format(model.oldPrice.round())}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough),
                  ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      cubit.changeFavorites(model.id);
                      print(model.id);
                    },
                    icon: CircleAvatar(
                        backgroundColor: cubit.favourites![model.id]!
                            ? Colors.red
                            : Colors.black,
                        radius: 15,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )))
              ]),
            ],
          ),
        ),
      );
    },
  );
}

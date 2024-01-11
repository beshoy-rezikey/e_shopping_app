import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';

import '../../../shared/colors.dart';

Widget favBuildWidegt( dynamic ? model, {bool isSearch = true}) {
  return BlocConsumer<ShopCubit, ShopState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      ShopCubit cubit = ShopCubit.get(context);
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120,
          width: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      model!.image!,
                    ),
                  ),
                  if (model.discount != 0 && isSearch)
                    Text(
                      'Discount',
                      style: TextStyle(
                          backgroundColor: Colors.red,
                          fontSize: 10,
                          color: MyColors.white),
                    )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        model.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          height: 1.3,
                          fontSize: 12,
                        ),
                      ),
                      Spacer(),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ' ${NumberFormat.decimalPattern().format(
                                  model.price.round())}Egp',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            if (model.discount != 0 && isSearch)

                              Text(
                                '${NumberFormat.decimalPattern().format(
                                    model.oldPrice.round())}',
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
                                  cubit.changeFavorites(model?.id);
                                },
                                icon: CircleAvatar(
                                    backgroundColor: cubit.favourites[model.id]! ? Colors.red : Colors
                                        .black,
                                    radius: 15,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    )))
                          ]),
                    ]),
              ),
            ],
          ),
        ),
      );
    },
  );
}
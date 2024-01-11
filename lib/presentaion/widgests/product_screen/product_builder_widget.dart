import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/dataSource/models/categoreis_model.dart';
import 'package:shop_app/dataSource/models/home_model.dart';
import 'package:shop_app/presentaion/widgests/categories_screen/categories%20_widget.dart';
import 'package:shop_app/presentaion/widgests/product_screen/grid-view.dart';

import 'carsoul_slider.dart';

Widget productWidget(HomeModel? homeModel, CategoriesModel? categoriesModel) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        carsoulSliderWidget(homeModel),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              CategoriesListView(categoriesModel),
              SizedBox(height: 20),
              Text('New Products ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        SizedBox(height: 10),
        gridViewWidget(homeModel!),
      ],
    ),
  );
}

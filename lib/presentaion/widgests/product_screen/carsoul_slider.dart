import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../dataSource/models/home_model.dart';

Widget carsoulSliderWidget(HomeModel? model){
  return    CarouselSlider(
      items: model?.data.banners
          .map((e) => Image(
        image: NetworkImage(e.image),
        width: double.infinity,
        fit: BoxFit.cover,
      ))
          .toList(),
      options: CarouselOptions(
        height: 150,
        initialPage: 0,
        enableInfiniteScroll: true,
        viewportFraction: 1,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,

      ));
}
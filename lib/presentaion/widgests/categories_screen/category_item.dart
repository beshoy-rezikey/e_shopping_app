import 'package:flutter/material.dart';
import 'package:shop_app/dataSource/models/categoreis_model.dart';

Widget CategoryScreenItem(DataOfCategoriesDataModel dataOfCategoriesDataModel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
            fit: BoxFit.cover,
            width: 100,
            height: 100,
            image: NetworkImage(
                dataOfCategoriesDataModel.image)),
        SizedBox(
          width: 20,
        ),
        Text(
          dataOfCategoriesDataModel.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios_outlined)
      ],
    ),
  );
}

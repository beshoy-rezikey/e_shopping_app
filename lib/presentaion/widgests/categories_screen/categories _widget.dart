import 'package:flutter/material.dart';
import 'package:shop_app/dataSource/models/categoreis_model.dart';

Widget CategoriesListView(CategoriesModel ? categoriesModel) {
  return Container(height: 100,

    child: ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) =>categoriesItemBuilder(categoriesModel.data!.data[index]) ,
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: categoriesModel!.data!.data.length),
  );
}

Widget categoriesItemBuilder(DataOfCategoriesDataModel dataOfCategoriesDataModel ) {
  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      Image(
          fit: BoxFit.cover,
          width: 100,
          height: 100,
          image: NetworkImage(
            dataOfCategoriesDataModel.image
          )),
      Container(
          height: 20,
          width: 100,
          alignment: AlignmentDirectional.center,
          color: Colors.black.withOpacity(.6),
          child: Text(
            dataOfCategoriesDataModel.name,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ))
    ],
  );
}

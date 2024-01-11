import 'package:flutter/material.dart';

import '../../../dataSource/models/Boarding_model.dart';


 Widget boardingItemWidget ({ required BoardingModel boardingModel}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image.asset(boardingModel.image,),),
      const SizedBox(
        height: 15,
      ),
      Text(
        boardingModel.title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        boardingModel.body,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      SizedBox(
        height: 15,
      ),




    ],
  );
}
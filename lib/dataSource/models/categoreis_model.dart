import 'package:flutter/material.dart';

class CategoriesModel {
  bool? status;
  CategoriesDataModel? data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);
  }
}

class CategoriesDataModel {
  int? currentPage;
  List<DataOfCategoriesDataModel> data = [];

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    //  json['data'].forEach((element) {
    //    data.add(DataOfCategoriesDataModel.fromJson(element));
    //  });
    data = (json['data'] as List)
        .map((e) => DataOfCategoriesDataModel.fromJson(e))
        .toList();
  }
}

class DataOfCategoriesDataModel {
  int id;
  String name;
  String image;

  DataOfCategoriesDataModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory DataOfCategoriesDataModel.fromJson(Map<String, dynamic> json) {
    return DataOfCategoriesDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

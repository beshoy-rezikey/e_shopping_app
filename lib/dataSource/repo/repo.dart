import 'package:dio/dio.dart';
import 'package:shop_app/dataSource/models/search_model.dart';
import 'package:shop_app/dataSource/remoteData/dio_helper.dart';
import 'package:shop_app/dataSource/models/home_model.dart';
import 'package:shop_app/dataSource/models/login_model.dart';

import '../../shared/constants.dart';

class ShopRepo {
  final DioHelper dioHelper;

  ShopRepo(this.dioHelper);
///============================1- login register logout ====================================
  Future<Response?> loginUser(
      {required String email, required String password}) async {
    return await dioHelper.postData(
        url: login,
        data: {
          "email": email,
          "password": password,
        },
        token: token);

  }
  Future<Response?> register(
      {required String email, required String password,required String name,required String phone}) async {
    return await dioHelper.postData(
        url: REGSITER,
        data: {
          "email": email,
          "password": password,
          'name' :name,
          'phone':phone,
        },
        );

  }
  Future<Response?> getUserData() async {
    return await dioHelper.getData(
      url: profile,
      token: token,

    );
  }


  Future <Response?> update(
      {required String email,
        required String name,
        required String phone}) async {
    await dioHelper.putData(
        url: updateProfile,
        data: {
          "email": email,
          'name': name,
          'phone': phone,
        },
        token: token);



  }

  ///===================  2- home  =============================///
  Future<Response?> getHomeData() async {
    return await dioHelper.getData(url: home, token: token);
  }

  Future<Response?> getCategories() async {
    return await dioHelper.getData(
      url: get_categories,
    );
  }

  Future<Response?> changeFavorites({required int productId}) async {
    return await dioHelper.postData(
        url: favorites, data: {'product_id': productId}, token: token);
  }

  Future<Response?> getFavorites() async {
    return await dioHelper.getData(url: favorites, token: token);
  }



  Future<Response?> searchData({ required String text}) async {
    return await dioHelper.postData(
        url: search, data: {'text': text}, token: token);
  }
}

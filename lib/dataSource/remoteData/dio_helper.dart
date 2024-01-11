import 'package:dio/dio.dart';

import '../../shared/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 10000,
        receiveTimeout: 20 * 10000,
      ),
    );
    return dio;
  }

  Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio?.get(url, queryParameters: query);
  }

  Future<Response?> postData({
    required String url,
    Map<String , dynamic > ? query,
    required Map<dynamic ?, dynamic? > ?data,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio?.post(url, data: data, queryParameters: query);
  }

  Future<Response?> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<dynamic, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio?.put(url, data: data, queryParameters: query);
  }
}

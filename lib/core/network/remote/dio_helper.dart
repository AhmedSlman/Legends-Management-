import 'package:dio/dio.dart';

import 'api_constant.dart';
import 'dio_interceptor.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(
      MyDioInterceptor(),
    );
  }

  static Future<Response> postData(
      {required String endPoint,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token}) async {
    dio.options.headers = {
      'Accept': 'application/vnd.api+json',
      'Content-Type': 'application/json'
    };
    Response response = await dio.post(endPoint, data: data);
    return response;
  }

  static Future<Response> getData(
      {required String endPoint, String lang = 'en', String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    Response response = await dio.get(endPoint);
    return response;
  }

  static Future<Response> puttData(
      {required String endPoint,
      required Map<String, dynamic> data,
      String lang = 'en',
      String? token}) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    Response response = await dio.put(endPoint, data: data);
    return response;
  }
}

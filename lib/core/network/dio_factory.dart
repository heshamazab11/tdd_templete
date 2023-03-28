import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tdd_templete/core/constant.dart';
import 'package:tdd_templete/core/helper/cache_helper.dart';

const String applicationJson = "application/json";
const String contentType = "Content-Type";
const String accept = "Accept";
const String defaultLanguage = "Accept-Language";
const String authorization = "Authorization";
const String language = "Accept-Language";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeout = 60 * 1000;
    Map<String, String> headers = {
      contentType: applicationJson,
      authorization: "Bearer ${CacheHelper.getData(key: Constant.token)}"
      // ACCEPT:APPLICATION_JSON,
      // LANGUAGE:language
    };
    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: Duration(seconds: timeout),
      receiveTimeout: Duration(seconds: timeout),
      headers: headers,
    );

    if (kDebugMode) {
      print("release mode");
    } else {
      dio.interceptors.add((PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      )));
    }
    return dio;
  }
}

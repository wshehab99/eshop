import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../config/api.dart';
import '../../../../config/app.dart';

//make the dio object based on options for all the app
class DioFactory {
  DioFactory();

  //dio getter
  Dio get getDio {
    Dio dio = Dio();
    Map<String, String> headers = {
      //accept:application/json
      AppConfig.accept: AppConfig.applicationJson,
      //connection:keep-alive
      AppConfig.connection: AppConfig.keepAlive,
      //Content-Type:application/json
      AppConfig.contentType: AppConfig.applicationJson,
    };
    dio.options = BaseOptions(
      //api base url
      baseUrl: ApiConfig.baseURL,
      headers: headers,
      sendTimeout: AppConfig.timeout,
      connectTimeout: AppConfig.timeout,
      receiveTimeout: AppConfig.timeout,
      followRedirects: false,
    );
    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}

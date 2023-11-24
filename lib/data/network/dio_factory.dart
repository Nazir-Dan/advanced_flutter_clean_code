import 'package:advanced_flutter_tut/app/app_prefrences.dart';
import 'package:advanced_flutter_tut/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = 'application/json';
const String CONTENT_TYPE = 'content-type';
const String ACCEPT = 'accept';
const String AUTHURIZATION = 'autorization';
const String DEFAULT_LANGUAGE = 'language';

class DioFactory {
  final AppPrefrences _appPrefrences;
  DioFactory(this._appPrefrences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await _appPrefrences.getAppLanguage();
    const Duration _timeout =
        Duration(seconds: Constants.API_TIME_OUT); // 20 seconds timeout

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHURIZATION: Constants.token,
      DEFAULT_LANGUAGE: language,
    };

    dio.options = BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: _timeout,
        sendTimeout: _timeout);
    if (!kReleaseMode) {
      //print app logs in debug mode
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}

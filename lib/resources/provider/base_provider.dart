import 'package:dio/dio.dart';

import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:test_berita/utils/helpers/dio_logging_interceptors.dart';
import 'package:test_berita/utils/values/endpoints.dart';

class BaseProvider {
  final Dio dio = Dio();
  final String baseUrl = EndPoints.BASE_URL;

  Dio initDio() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(DioLoggingInterceptors());

    // Handle Bad Certificate
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }

  Future getHeaders(bool isRequireToken) async {
    Map<String, dynamic> header = {};
    header.clear();
    if (isRequireToken) {
      return header = {
        'requirestoken': true,
        'Accept': 'application/json',
      };
    } else {
      return header = {
        'Accept': 'application/json',
      };
    }
  }
}

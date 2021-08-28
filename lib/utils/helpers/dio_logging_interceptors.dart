import 'package:dio/dio.dart';
import 'package:test_berita/utils/helpers/device_info.dart';
import 'package:test_berita/utils/values/my_values.dart';

class DioLoggingInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options, handler) async {
    print(
        "--> ${options.method.toUpperCase()}  ${options.baseUrl} ${options.path}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));

    print("queryParameters:");
    options.queryParameters.forEach((k, v) => print('$k: $v'));

    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print("--> END ${options.method.toUpperCase()}");

    if (options.headers.containsKey('requirestoken')) {
      options.headers.remove('requirestoken');
      // token hardcode karena constansts. Tapi bisa pake session juga.
      print('accessToken: ${MyValues.token}');
      options.headers.addAll(
        {'Authorization': 'X-Api-Key ${MyValues.token}'},
      );
      String osInfo = await DeviceInfoHelper.getOsAndVersion();
      print('os-info: $osInfo');

      options.headers.addAll({'user-os': osInfo});
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, handler) async {
    print(
      "<-- ${response.statusCode} ${response.requestOptions.baseUrl} ${response.requestOptions.path}",
    );
    print("Headers:");
    response.headers.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError dioError, handler) async {
    print(
        "<-- ${dioError.message} ${dioError.response?.requestOptions.baseUrl} ${dioError.response?.requestOptions.path}");
    print(dioError.response?.data);
    print("<-- End error");
    return super.onError(dioError, handler);
  }
}

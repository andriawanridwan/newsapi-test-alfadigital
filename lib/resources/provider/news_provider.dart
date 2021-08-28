import 'package:dio/dio.dart';
import 'package:test_berita/model/news_model.dart';
import 'package:test_berita/model/sources_model.dart';
import 'package:test_berita/resources/provider/base_provider.dart';
import 'package:test_berita/utils/values/endpoints.dart';
import 'package:test_berita/utils/values/my_values.dart';

class NewsProvider extends BaseProvider {
  late Dio _dio;
  NewsProvider() {
    _dio = initDio();
  }

  Future<ListSourcesModel> getListSource({
    required String category,
  }) async {
    try {
      // untuk search dan pagination dihandle secara lokal karena di API ini tidak tersedia.
      _dio.options.headers = await getHeaders(true);
      final response = await _dio.get(
        EndPoints.SOURCE_NEWS,
        queryParameters: {
          'category': category,
        },
      );
      return ListSourcesModel.fromJson(response.data);
    } catch (e, stacktrace) {
      print('Error: $e stacktrace: $stacktrace');
      return ListSourcesModel.withError(MyValues.error_connection);
    }
  }

  Future<ListNewsModel> getListNews({
    required String sources,
    String? keyword,
    int page = 1,
  }) async {
    try {
      _dio.options.headers = await getHeaders(true);
      final response = await _dio.get(
        EndPoints.NEWS,
        queryParameters: {
          'sources': sources,
          'q': keyword,
          'pageSize': MyValues.limit,
          'page': page,
        },
      );
      return ListNewsModel.fromJson(response.data);
    } catch (e, stacktrace) {
      print('Error: $e stacktrace: $stacktrace');
      return ListNewsModel.withError(MyValues.error_connection);
    }
  }
}

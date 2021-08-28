import 'package:test_berita/model/news_model.dart';
import 'package:test_berita/model/sources_model.dart';
import 'package:test_berita/resources/provider/news_provider.dart';

class NewsRepository {
  final _provider = NewsProvider();

  Future<ListSourcesModel> getListSources({
    required String category,
  }) =>
      _provider.getListSource(category: category);

  Future<ListNewsModel> getListNews({
    required String sources,
    String? keyword,
    int page = 1,
  }) =>
      _provider.getListNews(sources: sources, keyword: keyword, page: page);
}

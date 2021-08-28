import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_berita/model/news_model.dart';
import 'package:test_berita/resources/repository/news_repository.dart';
import 'package:test_berita/utils/values/my_values.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial());
  int _page = 1;
  final _repository = NewsRepository();
  int _limit = MyValues.limit;
  bool _isLoadMore = false;
  List<NewsModel> _listData = [];
  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is NewsStarted) {
      yield* mapStartedToState(event);
    } else if (event is NewsLoadMore) {
      yield* mapLoadMoreToState(event);
    }
  }

  Stream<NewsState> mapStartedToState(
    NewsStarted event,
  ) async* {
    try {
      yield NewsInProgress();
      _page = 1;
      _listData = [];
      _limit = MyValues.limit;
      final response = await _repository.getListNews(
        sources: event.sources,
        keyword: event.keyword,
      );
      if (response.error == null && response.status == 'ok') {
        _listData.addAll(response.articles ?? []);
        if (response.totalResults! > _limit) {
          _isLoadMore = true;
        } else {
          _isLoadMore = false;
        }
        yield NewsSuccess(response, _isLoadMore);
      } else {
        yield NewsFailure();
      }
    } on Error {
      yield NewsFailure();
    }
  }

  Stream<NewsState> mapLoadMoreToState(
    NewsLoadMore event,
  ) async* {
    try {
      _page++;
      _limit += MyValues.limit;
      final response = await _repository.getListNews(
        sources: event.sources,
        keyword: event.keyword,
        page: _page,
      );
      if (response.error == null && response.status == 'ok') {
        _listData.addAll(response.articles ?? []);
        response.articles = _listData;
        if (_listData.length > _limit) {
          _isLoadMore = true;
        } else {
          _isLoadMore = false;
        }
        yield NewsSuccess(response, _isLoadMore);
      } else {
        yield NewsFailure();
      }
    } on Error {
      yield NewsFailure();
    }
  }
}

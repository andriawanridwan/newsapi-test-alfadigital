part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class NewsStarted extends NewsEvent {
  final String sources;
  final String? keyword;

  NewsStarted({
    required this.sources,
    this.keyword,
  });
}

class NewsLoadMore extends NewsEvent {
  final String sources;
  final String? keyword;

  NewsLoadMore({
    required this.sources,
    this.keyword,
  });
}

part of 'sources_bloc.dart';

@immutable
abstract class SourcesEvent {}

class SourcesStarted extends SourcesEvent {
  final String category;
  final String? keyword;

  SourcesStarted({
    required this.category,
    this.keyword,
  });
}

class SourcesFilter extends SourcesEvent {
  final String keyword;

  SourcesFilter(this.keyword);
}

class SourcesLoadMore extends SourcesEvent {}

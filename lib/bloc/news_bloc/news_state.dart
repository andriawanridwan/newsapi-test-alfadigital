part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsInProgress extends NewsState {}

class NewsSuccess extends NewsState {
  final ListNewsModel response;
  final bool isLoadMore;
  NewsSuccess(this.response, this.isLoadMore);
}

class NewsFailure extends NewsState {}

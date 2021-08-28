part of 'sources_bloc.dart';

@immutable
abstract class SourcesState {}

class SourcesInitial extends SourcesState {}

class SourcesInProgress extends SourcesState {}

class SourcesSuccess extends SourcesState {
  final ListSourcesModel response;
  final bool isLoadMore;
  SourcesSuccess(this.response, this.isLoadMore);
}

class SourcesFailure extends SourcesState {}

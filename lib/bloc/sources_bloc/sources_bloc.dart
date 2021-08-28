import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_berita/model/sources_model.dart';
import 'package:test_berita/resources/repository/news_repository.dart';
import 'package:test_berita/utils/values/my_values.dart';

part 'sources_event.dart';
part 'sources_state.dart';

class SourcesBloc extends Bloc<SourcesEvent, SourcesState> {
  SourcesBloc() : super(SourcesInitial());
  List<SourceModel> _listAllData = [];
  bool _isLoadMore = false;
  int _offset = 0;
  int _limit = MyValues.limit;
  List<SourceModel> _listData = [];
  late ListSourcesModel _listSources;
  final _repository = NewsRepository();
  @override
  void onTransition(Transition<SourcesEvent, SourcesState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<SourcesState> mapEventToState(
    SourcesEvent event,
  ) async* {
    if (event is SourcesStarted) {
      yield* mapStartedToState(event);
    } else if (event is SourcesLoadMore) {
      yield* mapLoadMoreToState(event);
    } else if (event is SourcesFilter) {
      yield* mapFilterToState(event);
    }
  }

  Stream<SourcesState> mapStartedToState(
    SourcesStarted event,
  ) async* {
    try {
      yield SourcesInProgress();
      _listAllData.clear();
      _listData.clear();
      _offset = 0;
      _limit = MyValues.limit;
      final response = await _repository.getListSources(
        category: event.category,
      );
      if (response.error == null && response.status == 'ok') {
        _listSources = response;
        _listAllData.addAll(response.sources ?? []);
        _listData.addAll(response.sources?.take(MyValues.limit) ?? []);
        _listSources.sources = _listData;
        if (_listAllData.length > _limit) {
          _isLoadMore = true;
        } else {
          _isLoadMore = false;
        }
        yield SourcesSuccess(_listSources, _isLoadMore);
      } else {
        yield SourcesFailure();
      }
    } on Error {
      yield SourcesFailure();
    }
  }

  Stream<SourcesState> mapFilterToState(
    SourcesFilter event,
  ) async* {
    try {
      yield SourcesInProgress();
      _listData.clear();
      _offset = 0;
      _limit = MyValues.limit;
      List<SourceModel> filterData = _listAllData
          .where(
            (item) =>
                item.name.toLowerCase().contains(event.keyword.toLowerCase()),
          )
          .toList();
      _listSources.sources = filterData;
      if (filterData.length > _limit) {
        _isLoadMore = true;
      } else {
        _isLoadMore = false;
      }
      // biart terlihat loading indicator saja jadi diberi delay;
      await Future.delayed(Duration(seconds: 1));
      yield SourcesSuccess(_listSources, _isLoadMore);
    } on Error {
      yield SourcesFailure();
    }
  }

  Stream<SourcesState> mapLoadMoreToState(
    SourcesLoadMore event,
  ) async* {
    try {
      _offset += MyValues.limit;
      _limit += MyValues.limit;
      print('list all Data: ${_listAllData.length} ===============');
      print('limit: $_limit ==============================');

      if (_listAllData.length <= _limit) {
        print('Masuk kurang dari limit');
        _listData.addAll(_listAllData.getRange(_offset, _listAllData.length));
      } else {
        print('Masuk lebih dari limit');
        _listData.addAll(_listAllData.getRange(_offset, _limit));
      }
      _listSources.sources = _listData;

      if (_listAllData.length > _limit) {
        _isLoadMore = true;
      } else {
        _isLoadMore = false;
      }
      // biart terlihat loading indicator saja jadi diberi delay;
      await Future.delayed(Duration(seconds: 1));
      yield SourcesSuccess(_listSources, _isLoadMore);
    } on Error {
      yield SourcesFailure();
    }
  }
}

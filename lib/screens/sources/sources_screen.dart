import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_berita/bloc/sources_bloc/sources_bloc.dart';
import 'package:test_berita/model/category_model.dart';
import 'package:test_berita/screens/sources/widgets/list_sources.dart';

import 'package:test_berita/utils/widgets/custom_appbar.dart';
import 'package:test_berita/utils/widgets/custom_error.dart';
import 'package:test_berita/utils/widgets/custom_shimmer.dart';
import 'package:test_berita/utils/widgets/custom_textfield_search.dart';

class SourcesScreen extends StatefulWidget {
  final CategoryModel model;
  const SourcesScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _SourcesScreenState createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
  final _sourcesBloc = SourcesBloc();
  final _searchController = TextEditingController();
  @override
  void initState() {
    _sourcesBloc.add(SourcesStarted(category: widget.model.id));
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _sourcesBloc,
      child: Scaffold(
        appBar: CustomAppBar.general(
          context: context,
          title: widget.model.name,
        ),
        body: Column(
          children: [
            CustomTextfieldSearch(
              controller: _searchController,
              onSubmit: () {
                _sourcesBloc.add(
                  SourcesFilter(_searchController.text),
                );
              },
            ),
            Expanded(
              child: BlocBuilder<SourcesBloc, SourcesState>(
                builder: (context, state) {
                  if (state is SourcesInProgress) {
                    return CustomShimmer.loadingList();
                  } else if (state is SourcesSuccess) {
                    return ListSources(
                      pressRefresh: () async {
                        _sourcesBloc
                            .add(SourcesStarted(category: widget.model.id));
                      },
                      pressLoadMore: () {
                        _sourcesBloc.add(SourcesLoadMore());
                      },
                      model: state.response,
                      isLoadMore: state.isLoadMore,
                    );
                  } else if (state is SourcesFailure) {
                    return CustomError.tryAgain(
                      context,
                      () {
                        _sourcesBloc
                            .add(SourcesStarted(category: widget.model.id));
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

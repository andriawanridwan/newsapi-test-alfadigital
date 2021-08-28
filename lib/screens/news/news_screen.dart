import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_berita/bloc/news_bloc/news_bloc.dart';
import 'package:test_berita/model/sources_model.dart';
import 'package:test_berita/screens/news/widgets/list_news.dart';
import 'package:test_berita/utils/widgets/custom_appbar.dart';
import 'package:test_berita/utils/widgets/custom_shimmer.dart';
import 'package:test_berita/utils/widgets/custom_textfield_search.dart';

class NewsScreen extends StatefulWidget {
  final SourceModel model;
  const NewsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _searchController = TextEditingController();
  final _newsBloc = NewsBloc();
  @override
  void initState() {
    _newsBloc.add(NewsStarted(sources: widget.model.id));
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
      value: _newsBloc,
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
                _newsBloc.add(NewsStarted(
                  sources: widget.model.id,
                  keyword: _searchController.text,
                ));
              },
            ),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsInProgress) {
                    return CustomShimmer.loadingList();
                  } else if (state is NewsSuccess) {
                    return ListNews(
                      isLoadMore: state.isLoadMore,
                      model: state.response,
                      pressRefresh: () async {
                        _newsBloc.add(NewsStarted(sources: widget.model.id));
                      },
                      pressLoadMore: () {
                        _newsBloc.add(NewsLoadMore(
                          sources: widget.model.id,
                          keyword: _searchController.text,
                        ));
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

import 'package:flutter/material.dart';
import 'package:test_berita/model/news_model.dart';
import 'package:test_berita/screens/news/widgets/item_news.dart';
import 'package:test_berita/utils/widgets/custom_error.dart';
import 'package:test_berita/utils/widgets/custom_shimmer.dart';

class ListNews extends StatefulWidget {
  final ListNewsModel model;
  final Future<void> Function() pressRefresh;
  final Function() pressLoadMore;
  final bool isLoadMore;
  const ListNews({
    Key? key,
    required this.model,
    required this.pressRefresh,
    required this.pressLoadMore,
    required this.isLoadMore,
  }) : super(key: key);

  @override
  _ListNewsState createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          widget.isLoadMore) {
        widget.pressLoadMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Total Results ${widget.model.totalResults} ==================');
    return (widget.model.articles == null || widget.model.articles!.isEmpty)
        ? CustomError.empty(context)
        : RefreshIndicator(
            onRefresh: widget.pressRefresh,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.isLoadMore
                  ? widget.model.articles!.length + 1
                  : widget.model.articles!.length,
              itemBuilder: (_, index) {
                if (index == widget.model.articles!.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: CustomShimmer.card(),
                  );
                } else {
                  return ItemNews(
                    model: widget.model.articles![index],
                  );
                }
              },
            ),
          );
  }
}

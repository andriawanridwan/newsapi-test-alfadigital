import 'package:flutter/material.dart';
import 'package:test_berita/model/sources_model.dart';
import 'package:test_berita/screens/sources/widgets/item_sources.dart';
import 'package:test_berita/utils/widgets/custom_error.dart';
import 'package:test_berita/utils/widgets/custom_shimmer.dart';

class ListSources extends StatefulWidget {
  final ListSourcesModel model;
  final bool isLoadMore;
  final Future<void> Function() pressRefresh;
  final Function() pressLoadMore;
  const ListSources({
    Key? key,
    required this.pressRefresh,
    required this.pressLoadMore,
    required this.model,
    required this.isLoadMore,
  }) : super(key: key);

  @override
  _ListSourcesState createState() => _ListSourcesState();
}

class _ListSourcesState extends State<ListSources> {
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
    return (widget.model.sources == null || widget.model.sources!.isEmpty)
        ? CustomError.empty(context)
        : RefreshIndicator(
            onRefresh: widget.pressRefresh,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.isLoadMore
                  ? widget.model.sources!.length + 1
                  : widget.model.sources!.length,
              itemBuilder: (_, index) {
                if (index == widget.model.sources!.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: CustomShimmer.card(),
                  );
                } else {
                  return ItemSources(
                    model: widget.model.sources![index],
                  );
                }
              },
            ),
          );
  }
}

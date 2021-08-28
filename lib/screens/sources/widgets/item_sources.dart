import 'package:flutter/material.dart';
import 'package:test_berita/model/sources_model.dart';
import 'package:test_berita/screens/news/news_screen.dart';
import 'package:test_berita/utils/widgets/custom_card.dart';

class ItemSources extends StatelessWidget {
  final SourceModel model;
  const ItemSources({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => NewsScreen(model: model),
          ),
        );
      },
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            style: Theme.of(context).textTheme.headline6,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5),
          Text(
            model.description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
